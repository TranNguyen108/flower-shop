<?php
header('Content-Type: text/html; charset=utf-8');
$conn = mysqli_connect('localhost', 'root', '', 'shop_db');
mysqli_set_charset($conn, 'utf8mb4');

if(!$conn) {
    die('Connection failed');
}

// Correct names for all products
$products = [
    1 => ['name' => 'Hoa Sen', 'details' => 'Hoa sen – biểu tượng của sự thuần khiết, thanh tao'],
    2 => ['name' => 'Mộng Mơ', 'details' => 'Giỏ hoa pastel nhẹ nhàng với hoa cát tường, hoa hồng'],
    3 => ['name' => 'Nến thơm lavender', 'details' => 'Nến thơm hương lavender giúp thư giãn'],
    4 => ['name' => 'Hoa Hồng', 'details' => 'Hoa hồng đỏ – biểu tượng của tình yêu nồng nàn'],
    5 => ['name' => 'Sen hồng', 'details' => 'Biểu tượng của sự thanh cao, rực rỡ'],
    6 => ['name' => 'Hoa tulip Vàng', 'details' => 'Biểu tượng của niềm vui và lời chúc khởi đầu hạnh phúc']
];

echo "<!DOCTYPE html><html><head><meta charset='utf-8'><title>Fix Encoding</title></head><body>";
echo "<h2>Đang cập nhật tên sản phẩm...</h2>";

foreach($products as $id => $data) {
    $stmt = mysqli_prepare($conn, "UPDATE products SET name = ?, details = ? WHERE id = ?");
    mysqli_stmt_bind_param($stmt, "ssi", $data['name'], $data['details'], $id);
    
    if(mysqli_stmt_execute($stmt)) {
        echo "<p>✅ ID $id: <strong>{$data['name']}</strong></p>";
    } else {
        echo "<p>❌ ID $id: Lỗi - " . mysqli_error($conn) . "</p>";
    }
    mysqli_stmt_close($stmt);
}

echo "<br><h3 style='color:green'>✅ Hoàn tất! <a href='pages/shop.php'>Quay lại Shop</a></h3>";
echo "</body></html>";

mysqli_close($conn);
?>
