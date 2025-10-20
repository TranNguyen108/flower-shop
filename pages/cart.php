<?php
/**
 * Shopping Cart - Enhanced Security
 * CSRF Protection, Prepared Statements
 */

@include '../config.php';

$user_id = $_SESSION['user_id'] ?? null;

if(!isset($user_id)){
   header('location:../auth/login.php');
   exit;
}

$message = [];

// Xóa một item
if(isset($_GET['delete'])){
    $delete_id = (int)$_GET['delete'];
    // Kiểm tra item thuộc về user hiện tại
    $check = db_fetch_one($conn, "SELECT id FROM cart WHERE id = ? AND user_id = ?", "ii", [$delete_id, $user_id]);
    if ($check) {
        db_delete($conn, "DELETE FROM cart WHERE id = ? AND user_id = ?", "ii", [$delete_id, $user_id]);
        $message[] = 'Đã xóa sản phẩm khỏi giỏ hàng!';
    }
    header('location:cart.php');
    exit;
}

// Xóa tất cả
if(isset($_GET['delete_all'])){
    db_delete($conn, "DELETE FROM cart WHERE user_id = ?", "i", [$user_id]);
    $message[] = 'Đã xóa tất cả sản phẩm!';
    header('location:cart.php');
    exit;
}

// Cập nhật số lượng
if(isset($_POST['update_quantity'])){
    if (!verify_csrf_token($_POST['csrf_token'] ?? '')) {
        $message[] = 'Lỗi bảo mật!';
    } else {
        $cart_id = (int)$_POST['cart_id'];
        $cart_quantity = max(1, (int)$_POST['cart_quantity']); // Tối thiểu 1
        
        // Kiểm tra cart item thuộc user
        $check = db_fetch_one($conn, "SELECT id FROM cart WHERE id = ? AND user_id = ?", "ii", [$cart_id, $user_id]);
        if ($check) {
            db_update($conn, "UPDATE cart SET quantity = ? WHERE id = ? AND user_id = ?", "iii", [$cart_quantity, $cart_id, $user_id]);
            $message[] = 'Cập nhật số lượng sản phẩm thành công!';
        }
    }
}

?>
<!DOCTYPE html>
<html lang="vi">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Giỏ hàng</title>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
   <link rel="stylesheet" href="../css/style.css">
   <link rel="stylesheet" href="../css/style-enhanced.css">

   <style>
      .cart-page {
         padding: 30px 5%;
         max-width: 1400px;
         margin: 0 auto;
         background: #f8f9fa;
      }

      .cart-header {
         background: white;
         padding: 30px;
         border-radius: 15px;
         margin-bottom: 30px;
         box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      }

      .cart-header h1 {
         font-size: 2rem;
         color: #2c3e50;
         margin: 0 0 10px 0;
         display: flex;
         align-items: center;
         gap: 12px;
      }

      .cart-header h1 i {
         color: #667eea;
      }

      .cart-header p {
         margin: 0;
         color: #6c757d;
      }

      .cart-items {
         display: grid;
         gap: 20px;
         margin-bottom: 30px;
      }

      .cart-item {
         background: white;
         border-radius: 15px;
         padding: 25px;
         box-shadow: 0 2px 10px rgba(0,0,0,0.05);
         display: grid;
         grid-template-columns: 120px 1fr auto;
         gap: 25px;
         align-items: center;
         transition: all 0.3s;
         position: relative;
      }

      .cart-item:hover {
         box-shadow: 0 5px 20px rgba(0,0,0,0.1);
         transform: translateY(-2px);
      }

      .item-image {
         position: relative;
      }

      .item-image img {
         width: 120px;
         height: 120px;
         object-fit: cover;
         border-radius: 12px;
         border: 3px solid #f0f0f0;
      }

      .item-details {
         display: flex;
         flex-direction: column;
         gap: 12px;
      }

      .item-name {
         font-size: 1.3rem;
         font-weight: 700;
         color: #2c3e50;
         margin: 0;
      }

      .item-price {
         font-size: 1.4rem;
         color: #667eea;
         font-weight: 700;
      }

      .item-actions {
         display: flex;
         flex-direction: column;
         gap: 15px;
         align-items: flex-end;
         min-width: 250px;
      }

      .quantity-control {
         display: flex;
         align-items: center;
         gap: 12px;
         background: #f8f9fa;
         padding: 8px 15px;
         border-radius: 10px;
      }

      .quantity-control label {
         font-weight: 600;
         color: #2c3e50;
         font-size: 0.9rem;
      }

      .quantity-control input[type="number"] {
         width: 70px;
         padding: 8px 12px;
         border: 2px solid #e9ecef;
         border-radius: 8px;
         text-align: center;
         font-size: 1.1rem;
         font-weight: 600;
      }

      .quantity-control input[type="number"]:focus {
         outline: none;
         border-color: #667eea;
      }

      .update-btn {
         padding: 8px 20px;
         background: #667eea;
         color: white;
         border: none;
         border-radius: 8px;
         font-weight: 600;
         cursor: pointer;
         transition: all 0.3s;
         font-size: 0.9rem;
      }

      .update-btn:hover {
         background: #5568d3;
         transform: translateY(-2px);
      }

      .item-subtotal {
         font-size: 1.5rem;
         font-weight: 700;
         color: #2c3e50;
         padding: 12px 20px;
         background: #f8f9fa;
         border-radius: 10px;
      }

      .item-subtotal span {
         color: #667eea;
      }

      .item-remove {
         position: absolute;
         top: 15px;
         right: 15px;
         width: 35px;
         height: 35px;
         background: #fee;
         color: #dc3545;
         border-radius: 50%;
         display: flex;
         align-items: center;
         justify-content: center;
         font-size: 1.1rem;
         transition: all 0.3s;
         text-decoration: none;
      }

      .item-remove:hover {
         background: #dc3545;
         color: white;
         transform: rotate(90deg);
      }

      .item-view {
         position: absolute;
         top: 60px;
         right: 15px;
         width: 35px;
         height: 35px;
         background: #e3f2fd;
         color: #1976d2;
         border-radius: 50%;
         display: flex;
         align-items: center;
         justify-content: center;
         font-size: 1rem;
         transition: all 0.3s;
         text-decoration: none;
      }

      .item-view:hover {
         background: #1976d2;
         color: white;
      }

      .cart-summary {
         background: white;
         border-radius: 15px;
         padding: 30px;
         box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      }

      .summary-header {
         font-size: 1.5rem;
         font-weight: 700;
         color: #2c3e50;
         margin: 0 0 20px 0;
         padding-bottom: 15px;
         border-bottom: 2px solid #f0f0f0;
      }

      .summary-total {
         display: flex;
         justify-content: space-between;
         align-items: center;
         padding: 20px;
         background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
         border-radius: 12px;
         margin-bottom: 25px;
      }

      .summary-total-label {
         font-size: 1.3rem;
         font-weight: 600;
         color: white;
      }

      .summary-total-amount {
         font-size: 2rem;
         font-weight: 700;
         color: white;
      }

      .summary-actions {
         display: grid;
         grid-template-columns: 1fr 1fr;
         gap: 15px;
      }

      .cart-btn {
         padding: 15px 25px;
         border-radius: 10px;
         font-weight: 600;
         font-size: 1rem;
         text-decoration: none;
         text-align: center;
         transition: all 0.3s;
         border: none;
         cursor: pointer;
         display: flex;
         align-items: center;
         justify-content: center;
         gap: 8px;
      }

      .continue-shopping {
         background: #f8f9fa;
         color: #2c3e50;
         border: 2px solid #e9ecef;
      }

      .continue-shopping:hover {
         background: #e9ecef;
         transform: translateY(-2px);
      }

      .checkout-btn {
         background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
         color: white;
         grid-column: span 2;
      }

      .checkout-btn:hover {
         transform: translateY(-3px);
         box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
      }

      .checkout-btn.disabled {
         background: #e9ecef;
         color: #adb5bd;
         cursor: not-allowed;
         pointer-events: none;
      }

      .clear-cart-btn {
         background: #fff;
         color: #dc3545;
         border: 2px solid #dc3545;
         grid-column: span 2;
         margin-top: 10px;
      }

      .clear-cart-btn:hover {
         background: #dc3545;
         color: white;
      }

      .clear-cart-btn.disabled {
         border-color: #e9ecef;
         color: #adb5bd;
         cursor: not-allowed;
         pointer-events: none;
      }

      .empty-cart {
         background: white;
         padding: 80px 40px;
         border-radius: 15px;
         text-align: center;
         box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      }

      .empty-cart i {
         font-size: 5rem;
         color: #e9ecef;
         margin-bottom: 20px;
      }

      .empty-cart h3 {
         font-size: 1.8rem;
         color: #6c757d;
         margin: 0 0 15px 0;
      }

      .empty-cart p {
         color: #adb5bd;
         margin: 0 0 30px 0;
      }

      .empty-cart a {
         padding: 15px 40px;
         background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
         color: white;
         border-radius: 10px;
         text-decoration: none;
         font-weight: 600;
         display: inline-flex;
         align-items: center;
         gap: 10px;
         transition: all 0.3s;
      }

      .empty-cart a:hover {
         transform: translateY(-3px);
         box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
      }

      @media (max-width: 768px) {
         .cart-item {
            grid-template-columns: 1fr;
            text-align: center;
         }

         .item-image img {
            margin: 0 auto;
         }

         .item-actions {
            align-items: center;
            width: 100%;
         }

         .item-remove,
         .item-view {
            position: static;
            margin: 10px 5px;
            display: inline-flex;
         }

         .summary-actions {
            grid-template-columns: 1fr;
         }

         .checkout-btn,
         .clear-cart-btn {
            grid-column: span 1;
         }
      }
   </style>

</head>
<body>
   
<?php @include '../header.php'; ?>

<?php
if(!empty($message)){
   foreach($message as $msg){
      echo '<div class="message"><span>'.e($msg).'</span> <i class="fas fa-times" onclick="this.parentElement.remove();"></i></div>';
   }
}
?>

<section class="heading">
    <h3>Giỏ hàng của bạn</h3>
    <p> <a href="./home.php">Trang chủ</a> / Giỏ hàng </p>
</section>

<div class="cart-page">

    <div class="cart-header">
        <h1><i class="fas fa-shopping-cart"></i> Giỏ hàng của bạn</h1>
        <p>Xem lại và cập nhật sản phẩm trước khi thanh toán</p>
    </div>

    <?php
        $grand_total = 0;
        $select_cart = db_select($conn, "SELECT * FROM cart WHERE user_id = ?", "i", [$user_id]);
        if(mysqli_num_rows($select_cart) > 0){
    ?>

    <div class="cart-items">
        <?php
            while($fetch_cart = mysqli_fetch_assoc($select_cart)){
                $sub_total = $fetch_cart['price'] * $fetch_cart['quantity'];
                $grand_total += $sub_total;
        ?>
        <div class="cart-item">
            <a href="./cart.php?delete=<?php echo $fetch_cart['id']; ?>" class="item-remove" onclick="return confirm('Xóa sản phẩm này khỏi giỏ hàng?');" title="Xóa">
                <i class="fas fa-times"></i>
            </a>
            <a href="./view_page.php?pid=<?php echo $fetch_cart['pid']; ?>" class="item-view" title="Xem chi tiết">
                <i class="fas fa-eye"></i>
            </a>

            <div class="item-image">
                <img src="../assets/uploads/products/<?php echo e($fetch_cart['image']); ?>" alt="<?php echo e($fetch_cart['name']); ?>">
            </div>

            <div class="item-details">
                <h3 class="item-name"><?php echo e($fetch_cart['name']); ?></h3>
                <div class="item-price"><?php echo number_format($fetch_cart['price'], 0, ',', '.'); ?>₫</div>
            </div>

            <div class="item-actions">
                <form action="" method="post" style="width: 100%;">
                    <?php echo csrf_field(); ?>
                    <input type="hidden" value="<?php echo $fetch_cart['id']; ?>" name="cart_id">
                    <div class="quantity-control">
                        <label>Số lượng:</label>
                        <input type="number" min="1" max="99" value="<?php echo $fetch_cart['quantity']; ?>" name="cart_quantity">
                        <button type="submit" name="update_quantity" class="update-btn">
                            <i class="fas fa-sync-alt"></i> Cập nhật
                        </button>
                    </div>
                </form>

                <div class="item-subtotal">
                    Thành tiền: <span><?php echo number_format($sub_total, 0, ',', '.'); ?>₫</span>
                </div>
            </div>
        </div>
        <?php
            }
        ?>
    </div>

    <div class="cart-summary">
        <h2 class="summary-header">Tổng giỏ hàng</h2>
        
        <div class="summary-total">
            <span class="summary-total-label">Tổng cộng:</span>
            <span class="summary-total-amount"><?php echo number_format($grand_total, 0, ',', '.'); ?>₫</span>
        </div>

        <div class="summary-actions">
            <a href="./shop.php" class="cart-btn continue-shopping">
                <i class="fas fa-arrow-left"></i> Tiếp tục mua
            </a>
            <a href="./checkout.php" class="cart-btn checkout-btn <?php echo ($grand_total > 0)?'':'disabled' ?>">
                <i class="fas fa-credit-card"></i> Thanh toán ngay
            </a>
            <a href="./cart.php?delete_all" class="cart-btn clear-cart-btn <?php echo ($grand_total > 0)?'':'disabled' ?>" onclick="return confirm('Xóa toàn bộ sản phẩm khỏi giỏ hàng?');">
                <i class="fas fa-trash-alt"></i> Xóa tất cả
            </a>
        </div>
    </div>

    <?php
        } else {
    ?>
    <div class="empty-cart">
        <i class="fas fa-shopping-cart"></i>
        <h3>Giỏ hàng của bạn đang trống!</h3>
        <p>Hãy khám phá và thêm sản phẩm yêu thích vào giỏ hàng</p>
        <a href="./shop.php">
            <i class="fas fa-shopping-bag"></i> Mua sắm ngay
        </a>
    </div>
    <?php
        }
    ?>

</div>

<?php @include '../footer.php'; ?>

<script src="../js/script.js"></script>

</body>
</html>



