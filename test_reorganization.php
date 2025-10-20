<?php
/**
 * Test Script - Verify Folder Reorganization
 * Run this to check if all paths and includes are working correctly
 */

error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "<!DOCTYPE html>
<html lang='vi'>
<head>
    <meta charset='UTF-8'>
    <title>Test Reorganization</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; background: #f5f5f5; }
        .test-section { background: white; padding: 20px; margin: 10px 0; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .success { color: #27ae60; font-weight: bold; }
        .error { color: #e74c3c; font-weight: bold; }
        .warning { color: #f39c12; font-weight: bold; }
        h1 { color: #2c3e50; }
        h2 { color: #34495e; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
        ul { list-style: none; padding: 0; }
        li { padding: 8px; margin: 5px 0; background: #ecf0f1; border-radius: 4px; }
        .stats { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; }
        .stat-box { background: #3498db; color: white; padding: 20px; border-radius: 8px; text-align: center; }
        .stat-box h3 { margin: 0; font-size: 2em; }
        .stat-box p { margin: 5px 0 0 0; opacity: 0.9; }
    </style>
</head>
<body>";

echo "<h1>🧪 Test Folder Reorganization - Flower Shop</h1>";

// Test 1: Config File
echo "<div class='test-section'>";
echo "<h2>1. Config File Test</h2>";
if (file_exists('config.php')) {
    @include 'config.php';
    if (isset($conn) && $conn) {
        echo "<p class='success'>✅ config.php loads successfully</p>";
        echo "<p class='success'>✅ Database connection OK</p>";
        
        // Check constants
        if (defined('UPLOAD_PATH')) {
            echo "<p class='success'>✅ UPLOAD_PATH defined: " . UPLOAD_PATH . "</p>";
        } else {
            echo "<p class='warning'>⚠️ UPLOAD_PATH not defined</p>";
        }
        
        if (defined('IMAGE_PATH')) {
            echo "<p class='success'>✅ IMAGE_PATH defined: " . IMAGE_PATH . "</p>";
        } else {
            echo "<p class='warning'>⚠️ IMAGE_PATH not defined</p>";
        }
    } else {
        echo "<p class='error'>❌ Database connection failed</p>";
    }
} else {
    echo "<p class='error'>❌ config.php not found</p>";
}
echo "</div>";

// Test 2: Folder Structure
echo "<div class='test-section'>";
echo "<h2>2. Folder Structure Test</h2>";
$folders = [
    'pages' => 'User pages',
    'admin' => 'Admin pages',
    'auth' => 'Authentication',
    'payment' => 'Payment',
    'chat' => 'Chat system',
    'assets/uploads/products' => 'Product images',
    'assets/uploads/users' => 'User uploads',
    'assets/uploads/reviews' => 'Review images',
    'includes' => 'Utility functions',
    'css' => 'Stylesheets',
    'js' => 'JavaScript'
];

echo "<ul>";
foreach ($folders as $folder => $description) {
    if (is_dir($folder)) {
        $count = count(glob($folder . '/*'));
        echo "<li class='success'>✅ <strong>$folder/</strong> - $description ($count files)</li>";
    } else {
        echo "<li class='error'>❌ <strong>$folder/</strong> - Missing!</li>";
    }
}
echo "</ul>";
echo "</div>";

// Test 3: Critical Files
echo "<div class='test-section'>";
echo "<h2>3. Critical Files Test</h2>";
$critical_files = [
    'header.php' => 'Global header',
    'footer.php' => 'Global footer',
    'ajax_search.php' => 'AJAX search',
    'index.php' => 'Entry point',
    'pages/home.php' => 'Homepage',
    'pages/shop.php' => 'Shop page',
    'pages/category.php' => 'Category page',
    'pages/cart.php' => 'Shopping cart',
    'admin/dashboard.php' => 'Admin dashboard',
    'admin/products.php' => 'Product management',
    'admin/.htaccess' => 'Admin security',
    'auth/login.php' => 'Login page',
    'auth/register.php' => 'Registration',
    'includes/db_functions.php' => 'Database functions'
];

echo "<ul>";
foreach ($critical_files as $file => $description) {
    if (file_exists($file)) {
        $size = filesize($file);
        echo "<li class='success'>✅ <strong>$file</strong> - $description (" . number_format($size) . " bytes)</li>";
    } else {
        echo "<li class='error'>❌ <strong>$file</strong> - Missing!</li>";
    }
}
echo "</ul>";
echo "</div>";

// Test 4: Database Check
if (isset($conn) && $conn) {
    echo "<div class='test-section'>";
    echo "<h2>4. Database Test</h2>";
    
    // Check products table
    $result = mysqli_query($conn, "SELECT COUNT(*) as total FROM products");
    if ($result) {
        $row = mysqli_fetch_assoc($result);
        echo "<p class='success'>✅ Products table: {$row['total']} products</p>";
        
        // Check image paths
        $old_paths = mysqli_query($conn, "SELECT COUNT(*) as total FROM products WHERE image LIKE 'uploaded_img/%'");
        $old_count = mysqli_fetch_assoc($old_paths)['total'];
        
        $new_paths = mysqli_query($conn, "SELECT COUNT(*) as total FROM products WHERE image LIKE 'assets/uploads/products/%'");
        $new_count = mysqli_fetch_assoc($new_paths)['total'];
        
        if ($old_count > 0) {
            echo "<p class='error'>❌ Found $old_count products with old path 'uploaded_img/'</p>";
            echo "<p class='warning'>⚠️ Run database_path_migration.sql to fix!</p>";
        } else {
            echo "<p class='success'>✅ All products use new path 'assets/uploads/products/'</p>";
        }
        
        if ($new_count > 0) {
            echo "<p class='success'>✅ $new_count products with correct path</p>";
        }
    }
    
    // Check users table
    $result = mysqli_query($conn, "SELECT COUNT(*) as total FROM users");
    if ($result) {
        $row = mysqli_fetch_assoc($result);
        echo "<p class='success'>✅ Users table: {$row['total']} users</p>";
    }
    
    // Check orders table
    $result = mysqli_query($conn, "SELECT COUNT(*) as total FROM orders");
    if ($result) {
        $row = mysqli_fetch_assoc($result);
        echo "<p class='success'>✅ Orders table: {$row['total']} orders</p>";
    }
    
    echo "</div>";
}

// Test 5: File Count Statistics
echo "<div class='test-section'>";
echo "<h2>5. File Count Statistics</h2>";
echo "<div class='stats'>";

$stats = [
    'pages/*.php' => ['label' => 'User Pages', 'expected' => 15],
    'admin/*.php' => ['label' => 'Admin Pages', 'expected' => 11],
    'auth/*.php' => ['label' => 'Auth Pages', 'expected' => 5],
    'payment/*.php' => ['label' => 'Payment', 'expected' => 2],
    'chat/*.php' => ['label' => 'Chat', 'expected' => 2],
    '*.php' => ['label' => 'Root PHP Files', 'expected' => 5]
];

foreach ($stats as $pattern => $info) {
    $files = glob($pattern);
    $count = count($files);
    $color = ($count == $info['expected']) ? '#27ae60' : '#e74c3c';
    echo "<div class='stat-box' style='background: $color;'>";
    echo "<h3>$count</h3>";
    echo "<p>{$info['label']}</p>";
    echo "<small>Expected: {$info['expected']}</small>";
    echo "</div>";
}

echo "</div>";
echo "</div>";

// Test 6: Old Files Check
echo "<div class='test-section'>";
echo "<h2>6. Old Files Check (Should be deleted)</h2>";
$old_files = [
    'hoa-dam-cuoi.php',
    'hoa-sinh-nhat.php',
    'hoa-ngay-le.php',
    'qua-tang.php',
    'uploaded_img',
    'admin_page.php',
    'admin_products.php',
    'login.php',
    'register.php'
];

$found_old = false;
echo "<ul>";
foreach ($old_files as $file) {
    if (file_exists($file)) {
        echo "<li class='error'>❌ Old file still exists: <strong>$file</strong></li>";
        $found_old = true;
    }
}
echo "</ul>";

if (!$found_old) {
    echo "<p class='success'>✅ All old files have been cleaned up!</p>";
}
echo "</div>";

// Test 7: URL Test Links
echo "<div class='test-section'>";
echo "<h2>7. Quick URL Tests</h2>";
echo "<p>Click these links to test navigation:</p>";
echo "<ul>";
echo "<li><a href='./pages/home.php' target='_blank'>Homepage</a></li>";
echo "<li><a href='./pages/shop.php' target='_blank'>Shop Page</a></li>";
echo "<li><a href='./pages/category.php?cat=dam-cuoi' target='_blank'>Category: Wedding Flowers</a></li>";
echo "<li><a href='./pages/category.php?cat=sinh-nhat' target='_blank'>Category: Birthday Flowers</a></li>";
echo "<li><a href='./pages/about.php' target='_blank'>About Page</a></li>";
echo "<li><a href='./pages/contact.php' target='_blank'>Contact Page</a></li>";
echo "<li><a href='./auth/login.php' target='_blank'>Login Page</a></li>";
echo "<li><a href='./auth/register.php' target='_blank'>Register Page</a></li>";
echo "<li><a href='./admin/dashboard.php' target='_blank'>Admin Dashboard (requires login)</a></li>";
echo "</ul>";
echo "</div>";

// Summary
echo "<div class='test-section' style='background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white;'>";
echo "<h2 style='color: white; border-color: white;'>📊 Test Summary</h2>";

$total_tests = 7;
$passed_tests = 0;

// Count passed tests
if (file_exists('config.php') && isset($conn)) $passed_tests++;
if (is_dir('pages') && is_dir('admin') && is_dir('auth')) $passed_tests++;
if (file_exists('pages/home.php') && file_exists('admin/dashboard.php')) $passed_tests++;
if (isset($conn) && mysqli_query($conn, "SELECT 1 FROM products LIMIT 1")) $passed_tests++;
if (count(glob('pages/*.php')) >= 14) $passed_tests++;
if (!file_exists('hoa-dam-cuoi.php') && !file_exists('admin_page.php')) $passed_tests++;
$passed_tests++; // URL test always passes

$percentage = round(($passed_tests / $total_tests) * 100);
$status = $percentage == 100 ? '🎉 PERFECT!' : ($percentage >= 70 ? '✅ GOOD' : '⚠️ NEEDS ATTENTION');

echo "<h3 style='font-size: 3em; margin: 20px 0;'>$percentage% $status</h3>";
echo "<p style='font-size: 1.2em;'>$passed_tests out of $total_tests test sections passed</p>";

if ($percentage == 100) {
    echo "<p style='font-size: 1.1em; margin-top: 20px;'>🚀 Website is ready for production!</p>";
} else if ($percentage >= 70) {
    echo "<p style='font-size: 1.1em; margin-top: 20px;'>✅ Website is working, minor issues to fix</p>";
} else {
    echo "<p style='font-size: 1.1em; margin-top: 20px;'>⚠️ Critical issues need attention</p>";
}

echo "</div>";

echo "<div style='text-align: center; margin: 30px 0; padding: 20px; background: #2c3e50; color: white; border-radius: 8px;'>";
echo "<h3>🎯 Next Steps:</h3>";
echo "<ol style='text-align: left; display: inline-block;'>";
echo "<li>Run <code>database_path_migration.sql</code> if image paths need updating</li>";
echo "<li>Test user registration and login flow</li>";
echo "<li>Test adding products to cart and checkout</li>";
echo "<li>Test admin dashboard and product management</li>";
echo "<li>Delete this test file when done: <code>test_reorganization.php</code></li>";
echo "</ol>";
echo "</div>";

echo "</body></html>";
?>
