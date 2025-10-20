-- Database Migration: Update Image Paths
-- Migrate from uploaded_img/ to assets/uploads/products/
-- Run this after folder reorganization is complete

-- Backup products table (optional but recommended)
-- CREATE TABLE products_backup AS SELECT * FROM products;

-- Update all image paths in products table
UPDATE products 
SET image = REPLACE(image, 'uploaded_img/', 'assets/uploads/products/')
WHERE image LIKE 'uploaded_img/%';

-- Verify the update (check sample records)
-- SELECT id, name, image FROM products LIMIT 10;

-- Check if any old paths remain
-- SELECT COUNT(*) as old_paths_remaining FROM products WHERE image LIKE 'uploaded_img/%';
