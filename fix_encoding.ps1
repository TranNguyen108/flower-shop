# PowerShell script to fix Vietnamese encoding in admin files
# This script converts corrupted Vietnamese characters to proper UTF-8

$encodingFixes = @{
    # Common corrupted characters
    '�' = 'Đ'
    '�on' = 'Đơn'
    '�ang' = 'Đang'
    '�� ' = 'Đã '
    '�?a' = 'Địa'
    '�i?u' = 'Điều'
    '�?' = 'Đặ'
    '�on' = 'Đơn'
    'B?ng' = 'Bảng'
    'd�' = 'đã'
    'd?t' = 'đặt'
    'di?n' = 'điện'
    'kh�ng' = 'không'
    'kh�ch' = 'khách'
    'ngu?i' = 'người'
    'ng�' = 'ngà'
    'c?a' = 'của'
    'c�' = 'cổ'
    'c?p' = 'cập'
    'c�ng' = 'công'
    's?n' = 'sản'
    's?' = 'số'
    's�ch' = 'sách'
    't�n' = 'tên'
    't?i' = 'tài'
    't?ng' = 'tổng'
    't?t' = 'tất'
    'thu?ng' = 'thường'
    'th�nh' = 'thành'
    'th�ng' = 'tháng'
    'th?' = 'thể'
    'th?t' = 'thất'
    'tr?ng' = 'trạng'
    'tr?' = 'trả'
    'truy v?n' = 'truy vấn'
    'v�' = 'và'
    'v?i' = 'với'
    'vi�n' = 'viên'
    'x�a' = 'xóa'
    'x? l�' = 'xử lý'
    'y�u' = 'yêu'
    'Qu?n' = 'Quản'
    'L�' = 'Lý'
    'H�ng' = 'Hàng'
    'Ch?n' = 'Chọn'
    'Chua' = 'Chưa'
    'Th�m' = 'Thêm'
    'M?i' = 'Mới'
    'Ng�y' = 'Ngày'
    'Tu?n' = 'Tuần'
    'Th?i' = 'Thời'
    'T�m' = 'Tìm'
    'ki?m' = 'kiếm'
    'Ngu?i' = 'Người'
    'd�ng' = 'dùng'
    'T?n' = 'Tên'
    'l?i' = 'lỗi'
    'l?c' = 'lọc'
    'l?' = 'lễ'
    'd?'  = 'dữ'
    'li?u' = 'liệu'
    'h?p' = 'hợp'
    'h?y' = 'hủy'
    'h�ng' = 'hàng'
    'h?' = 'hệ'
    'giao' = 'giao'
    'b?i' = 'bại'
    'Nh?p' = 'Nhập'
    'm�' = 'mô'
    't?' = 'tả'
    'ph?m' = 'phẩm'
    'lo?i' = 'loại'
    'cu?i' = 'cưới'
    'nh?t' = 'nhật'
    'd�m' = 'đám'
    'K�ch' = 'Kích'
    'thu?c' = 'thước'
    'qu�' = 'quá'
    '?nh' = 'ảnh'
    'H�m' = 'Hôm'
    'ch?' = 'chờ'
    '�?' = 'Đặ'
    'thanh to�n' = 'thanh toán'
    '?' = 'đ'  # Currency symbol
}

# Function to fix encoding in a file
function Fix-FileEncoding {
    param(
        [string]$filePath
    )
    
    Write-Host "Processing: $filePath" -ForegroundColor Cyan
    
    try {
        # Read file with UTF-8 encoding
        $content = Get-Content -Path $filePath -Raw -Encoding UTF8
        
        $originalContent = $content
        
        # Apply all replacements
        foreach ($pair in $encodingFixes.GetEnumerator()) {
            $content = $content.Replace($pair.Key, $pair.Value)
        }
        
        # Only write if content changed
        if ($content -ne $originalContent) {
            # Save with UTF-8 BOM
            [System.IO.File]::WriteAllText($filePath, $content, [System.Text.UTF8Encoding]::new($true))
            Write-Host "  Fixed encoding in $filePath" -ForegroundColor Green
            return $true
        } else {
            Write-Host "  No changes needed in $filePath" -ForegroundColor Yellow
            return $false
        }
    }
    catch {
        Write-Host "  Error processing $filePath : $_" -ForegroundColor Red
        return $false
    }
}

# Get all PHP files in admin folder
$adminFiles = Get-ChildItem -Path "c:\xampp\htdocs\flower-shop\admin\*.php" -File

Write-Host "`nFixing encoding in admin PHP files..." -ForegroundColor Green
Write-Host "=========================================`n" -ForegroundColor Green

$fixedCount = 0
foreach ($file in $adminFiles) {
    if (Fix-FileEncoding -filePath $file.FullName) {
        $fixedCount++
    }
}

Write-Host "`n=========================================" -ForegroundColor Green
Write-Host "Encoding fix complete!" -ForegroundColor Green
Write-Host "Fixed $fixedCount out of $($adminFiles.Count) files" -ForegroundColor Green
Write-Host "=========================================`n" -ForegroundColor Green
