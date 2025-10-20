<?php

if(isset($message)){
   foreach($message as $message){
      echo '
      <div class="message">
         <span>'.$message.'</span>
         <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
      ';
   }
}
?>

<header class="header">

    <div class="flex">

        <a href="../pages/home.php" class="logo">flowers.</a>

        <nav class="navbar">
    <ul>
        
        <li><a href="../pages/about.php">giới thiệu</a></li>
        <li><a href="../pages/home.php">trang chủ</a></li>
        <li class="dropdown">
  <a href="#">Sản phẩm +</a>
  <ul class="dropdown-menu">
    <li><a href="../pages/category.php?cat=dam-cuoi">Hoa đám cưới</a></li>
    <li><a href="../pages/category.php?cat=sinh-nhat">Hoa sinh nhật</a></li>
    <li><a href="../pages/category.php?cat=ngay-le">Hoa ngày lễ</a></li>
    <li><a href="../pages/category.php?cat=qua-tang">Quà tặng</a></li>
  </ul>
</li>

<li><a href="../pages/hotnhat.php">Hot nhất</a></li>
        
    <li><a href="../pages/orders.php">đơn hàng</a></li>
     <li><a href="../pages/contact.php">liên hệ</a></li>
        
    </ul>
</nav>

        <div class="icons">
    <div id="menu-btn" class="fas fa-bars"></div>
    
    <!-- Advanced Search Box -->
    <div class="search-container" style="position: relative; margin: 0 1rem;">
        <input type="text" 
               id="live-search" 
               placeholder="Tìm kiếm sản phẩm..." 
               autocomplete="off"
               style="padding: 0.8rem 3rem 0.8rem 1rem; border: 2px solid #ddd; border-radius: 25px; width: 300px; font-size: 1rem;">
        <i class="fas fa-search" style="position: absolute; right: 15px; top: 50%; transform: translateY(-50%); color: #666; pointer-events: none;"></i>
        
        <!-- Search Results Dropdown -->
        <div id="search-results" style="display: none; position: absolute; top: 100%; left: 0; width: 100%; background: white; border-radius: 10px; box-shadow: 0 5px 20px rgba(0,0,0,0.2); max-height: 400px; overflow-y: auto; z-index: 1000; margin-top: 5px;">
            <!-- Results populated by JavaScript -->
        </div>
    </div>

    <?php
        $select_wishlist_count = mysqli_query($conn, "SELECT * FROM `wishlist` WHERE user_id = '$user_id'") or die('query failed');
        $wishlist_num_rows = mysqli_num_rows($select_wishlist_count);
    ?>
    <a href="../pages/wishlist.php">
        <i class="fas fa-heart"></i>
        <?php if($wishlist_num_rows > 0): ?>
            <span>(<?php echo $wishlist_num_rows; ?>)</span>
        <?php endif; ?>
    </a>

    <?php
        $select_cart_count = mysqli_query($conn, "SELECT * FROM `cart` WHERE user_id = '$user_id'") or die('query failed');
        $cart_num_rows = mysqli_num_rows($select_cart_count);
    ?>
    <a href="../pages/cart.php">
        <i class="fas fa-shopping-cart"></i>
        <?php if($cart_num_rows > 0): ?>
            <span>(<?php echo $cart_num_rows; ?>)</span>
        <?php endif; ?>
    </a>

    <!-- Di chuyển hình người xuống đây -->
    <div id="user-btn" class="fas fa-user"></div>
</div>


        <div class="account-box">
            <p>tên người dùng: <span><?php echo $_SESSION['user_name']; ?></span></p>
            <p>email: <span><?php echo $_SESSION['user_email']; ?></span></p>
            <a href="../auth/logout.php" class="delete-btn">đăng xuất</a>
        </div>

    </div>

</header>

