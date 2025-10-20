<?php
header('Content-Type: text/html; charset=utf-8');
$conn = mysqli_connect('localhost', 'root', '', 'shop_db');
mysqli_set_charset($conn, 'utf8mb4');

echo "<h2>Sửa hình Hoa Valentine...</h2>";

// Đổi Hoa Valentine sang hình hoa hồng đỏ
$stmt = mysqli_prepare($conn, "UPDATE products SET image = ? WHERE name = ?");
$image = 'red_tulipa.jpg';  // Dùng hình hoa tulip đỏ đẹp
$name = 'Hoa Valentine';
mysqli_stmt_bind_param($stmt, "ss", $image, $name);

if(mysqli_stmt_execute($stmt)) {
    echo "✅ Hoa Valentine → red_tulipa.jpg<br>";
}
mysqli_stmt_close($stmt);

echo "<br><h3 style='color:green'>✅ Hoàn tất!</h3>";
echo "<a href='pages/shop.php' style='font-size:18px'>👉 Quay lại Shop</a>";

mysqli_close($conn);
?>
