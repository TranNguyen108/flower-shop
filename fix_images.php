<?php
require_once 'config.php';

echo "<h3>Fixing Product Images</h3>";

// Find products
$result = $conn->query("SELECT id, name, image FROM products");
echo "<h4>All Products:</h4>";
while($row = $result->fetch_assoc()) {
    echo $row['id'] . " | " . $row['name'] . " | " . $row['image'] . "<br>";
}

// Fix "Hoa lan hồ điệp" - should use orchid.jpg
$sql1 = "UPDATE products SET image = 'orchid.jpg' WHERE name LIKE '%lan hồ điệp%'";
if($conn->query($sql1)) {
    echo "<p style='color:green'>✓ Fixed 'Hoa lan hồ điệp' -> orchid.jpg</p>";
} else {
    echo "<p style='color:red'>Error: " . $conn->error . "</p>";
}

// Check if "Bó hoa cúc họa mi" needs fixing - daisy.jpg should be correct
$sql2 = "UPDATE products SET image = 'daisy.jpg' WHERE name LIKE '%cúc họa mi%'";
if($conn->query($sql2)) {
    echo "<p style='color:green'>✓ Fixed 'Bó hoa cúc họa mi' -> daisy.jpg</p>";
} else {
    echo "<p style='color:red'>Error: " . $conn->error . "</p>";
}

echo "<h4>After Fix:</h4>";
$result2 = $conn->query("SELECT id, name, image FROM products WHERE name LIKE '%lan%' OR name LIKE '%cúc%'");
while($row = $result2->fetch_assoc()) {
    echo $row['id'] . " | " . $row['name'] . " | " . $row['image'] . "<br>";
}

echo "<p><a href='pages/shop.php'>Go to Shop</a></p>";
?>
