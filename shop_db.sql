-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 14, 2025 lúc 12:05 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chat_conversations`
--

CREATE TABLE `chat_conversations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `status` enum('open','closed') DEFAULT 'open',
  `last_message_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chat_conversations`
--

INSERT INTO `chat_conversations` (`id`, `user_id`, `user_name`, `status`, `last_message_at`, `created_at`) VALUES
(1, 3, 'Ngoc Sinh', 'open', '2025-12-14 06:32:18', '2025-12-14 04:28:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `sender_type` enum('user','admin') NOT NULL,
  `sender_id` int(11) NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `conversation_id`, `sender_type`, `sender_id`, `sender_name`, `message`, `is_read`, `created_at`) VALUES
(1, 1, 'user', 3, 'Ngoc Sinh', 'chào shoptooi muốn mua hoa tặng bạn gái', 1, '2025-12-14 04:28:00'),
(2, 1, 'user', 3, 'Ngoc Sinh', 'chào bạn tôi muốn mua hoa', 1, '2025-12-14 04:35:19'),
(3, 1, 'user', 3, 'Ngoc Sinh', 'ggffc', 1, '2025-12-14 05:25:49'),
(4, 1, 'user', 3, 'Ngoc Sinh', 'vjkjb', 1, '2025-12-14 05:35:59'),
(5, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:46:07'),
(6, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:46:18'),
(7, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:46:29'),
(8, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:46:40'),
(9, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:46:50'),
(10, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:47:01'),
(11, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:47:12'),
(12, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:47:22'),
(13, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:47:32'),
(14, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:47:42'),
(15, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:47:52'),
(16, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:48:04'),
(17, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:48:15'),
(18, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:48:25'),
(19, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:48:36'),
(20, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:48:47'),
(21, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:48:59'),
(22, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:49:09'),
(23, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:49:20'),
(24, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:49:32'),
(25, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:49:42'),
(26, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:49:54'),
(27, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:50:04'),
(28, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:50:15'),
(29, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:50:26'),
(30, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:50:37'),
(31, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:50:49'),
(32, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:50:59'),
(33, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:51:10'),
(34, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:51:22'),
(35, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:51:33'),
(36, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:51:44'),
(37, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:51:54'),
(38, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:52:05'),
(39, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:52:16'),
(40, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:52:28'),
(41, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:52:39'),
(42, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:52:50'),
(43, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:53:01'),
(44, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:53:11'),
(45, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:53:23'),
(46, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:53:33'),
(47, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:53:44'),
(48, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:53:55'),
(49, 1, 'admin', 1, 'Admin', 'chào bạn', 1, '2025-12-14 05:54:06'),
(50, 1, 'user', 3, 'Ngoc Sinh', 'hiii', 1, '2025-12-14 06:31:50'),
(51, 1, 'admin', 1, 'Admin', 'hi lại', 1, '2025-12-14 06:32:05'),
(52, 1, 'user', 3, 'Ngoc Sinh', 'oke bạn', 1, '2025-12-14 06:32:13'),
(53, 1, 'admin', 1, 'Admin', 'ok bạn', 1, '2025-12-14 06:32:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL DEFAULT 'percentage',
  `discount_value` decimal(10,2) NOT NULL,
  `min_order` decimal(10,2) DEFAULT 0.00,
  `max_discount` decimal(10,2) DEFAULT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `used_count` int(11) DEFAULT 0,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount_type`, `discount_value`, `min_order`, `max_discount`, `usage_limit`, `used_count`, `start_date`, `end_date`, `is_active`, `created_at`) VALUES
(1, 'WELCOME10', 'percentage', 10.00, 100000.00, 50000.00, 100, 0, '2025-12-14 00:37:06', '2026-01-13 00:37:06', 1, '2025-12-13 17:37:06'),
(2, 'SUMMER50K', 'fixed', 50000.00, 200000.00, NULL, 50, 0, '2025-12-14 00:37:06', '2026-02-12 00:37:06', 1, '2025-12-13 17:37:06'),
(3, 'FLASH20', 'percentage', 20.00, 300000.00, 100000.00, 30, 0, '2025-12-14 00:37:06', '2025-12-21 00:37:06', 1, '2025-12-13 17:37:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupon_usage`
--

CREATE TABLE `coupon_usage` (
  `id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `used_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_logs`
--

CREATE TABLE `email_logs` (
  `id` int(11) NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `status` enum('sent','failed') DEFAULT 'sent',
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventory_history`
--

CREATE TABLE `inventory_history` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `change_type` enum('restock','sale','adjustment','return') NOT NULL,
  `quantity_change` int(11) NOT NULL,
  `quantity_before` int(11) NOT NULL,
  `quantity_after` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `inventory_history`
--

INSERT INTO `inventory_history` (`id`, `product_id`, `change_type`, `quantity_change`, `quantity_before`, `quantity_after`, `order_id`, `admin_id`, `notes`, `created_at`) VALUES
(1, 5, 'sale', -4, 25, 21, 1, NULL, 'Stock reduced due to order #1', '2025-12-14 08:37:59'),
(2, 5, 'sale', -3, 21, 18, 2, NULL, 'Stock reduced due to order #2', '2025-12-14 08:45:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL,
  `admin_reply` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `payment_method` varchar(50) DEFAULT 'cod',
  `payment_transaction_id` varchar(255) DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(11) NOT NULL,
  `coupon_code` varchar(50) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT 0.00,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending',
  `delivery_status` varchar(50) NOT NULL DEFAULT 'Đang xử lý',
  `delivery_lat` float DEFAULT NULL,
  `delivery_lng` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `payment_method`, `payment_transaction_id`, `address`, `total_products`, `total_price`, `coupon_code`, `discount_amount`, `placed_on`, `payment_status`, `delivery_status`, `delivery_lat`, `delivery_lng`) VALUES
(1, 3, 'Nguyễn Ngọc Sinh', '0355610260', 'ngocsinh6905@gmail.com', 'momo', 'momo', NULL, 'Số nhà 12321, fdfsfsd, sdfsdf, fsfdsfds - 3123213', 'Sen hồng (4) ', 1520000, NULL, 0.00, '14-12-2025', 'pending', 'Đang xử lý', NULL, NULL),
(2, 3, 'Nguyễn Ngọc Sinh', '0355610260', 'ngocsinh6905@gmail.com', 'momo', 'momo', NULL, 'Số nhà qqqq, 2132, qqq, qqq - 12323', 'Sen hồng (3) ', 1140000, NULL, 0.00, '14-12-2025', 'pending', 'Đang xử lý', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 5, 4, 380000),
(2, 2, 5, 3, 380000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_transactions`
--

CREATE TABLE `payment_transactions` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `gateway` varchar(50) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','failed','refunded') DEFAULT 'pending',
  `request_data` text DEFAULT NULL,
  `response_data` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `payment_transactions`
--

INSERT INTO `payment_transactions` (`id`, `order_id`, `gateway`, `transaction_id`, `amount`, `status`, `request_data`, `response_data`, `created_at`, `updated_at`) VALUES
(1, 1, 'momo', 'ORD1_1765701479', 1520000.00, 'pending', '{\"partnerCode\":\"MOMOBKUN20180529\",\"partnerName\":\"Flower Store\",\"storeId\":\"FlowerStore\",\"requestId\":\"1765701479\",\"amount\":\"1520000\",\"orderId\":\"ORD1_1765701479\",\"orderInfo\":\"Thanh to\\u00e1n \\u0111\\u01a1n h\\u00e0ng #1 - Sen h\\u1ed3ng (4) \",\"redirectUrl\":\"http:\\/\\/localhost\\/flower-shop\\/payment_return.php?gateway=momo\",\"ipnUrl\":\"http:\\/\\/localhost\\/flower-shop\\/payment_ipn.php?gateway=momo\",\"lang\":\"vi\",\"extraData\":\"\",\"requestType\":\"payWithATM\",\"signature\":\"9b63d72df0487dedea37924f2d2e190141fba4351dbd7264baac1eb2f37132b7\"}', NULL, '2025-12-14 08:37:59', NULL),
(2, 2, 'momo', 'ORD2_1765701954', 1140000.00, 'pending', '{\"partnerCode\":\"MOMOBKUN20180529\",\"partnerName\":\"Flower Store\",\"storeId\":\"FlowerStore\",\"requestId\":\"1765701954\",\"amount\":\"1140000\",\"orderId\":\"ORD2_1765701954\",\"orderInfo\":\"Thanh to\\u00e1n \\u0111\\u01a1n h\\u00e0ng #2 - Sen h\\u1ed3ng (3) \",\"redirectUrl\":\"http:\\/\\/localhost\\/flower-shop\\/payment_return.php?gateway=momo\",\"ipnUrl\":\"http:\\/\\/localhost\\/flower-shop\\/payment_ipn.php?gateway=momo\",\"lang\":\"vi\",\"extraData\":\"\",\"requestType\":\"payWithATM\",\"signature\":\"908b5735aa5e29eb1ea343d5858e763f255b778a83597e6582a9daf4dd4cf344\"}', NULL, '2025-12-14 08:45:54', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `popular_searches`
-- (See below for the actual view)
--
CREATE TABLE `popular_searches` (
`search_query` varchar(255)
,`search_count` bigint(21)
,`last_searched` timestamp
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(11) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `low_stock_threshold` int(11) NOT NULL DEFAULT 10,
  `stock_status` enum('in_stock','low_stock','out_of_stock') DEFAULT 'in_stock',
  `is_available` tinyint(1) DEFAULT 1,
  `last_stock_update` timestamp NULL DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `stock_quantity`, `low_stock_threshold`, `stock_status`, `is_available`, `last_stock_update`, `image`, `category`) VALUES
(1, 'Hoa Sen', 'Hoa sen – biểu tượng của sự thuần khiết, thanh tao', 300000, 50, 10, 'in_stock', 1, NULL, 'hoasen.png', 'ngay-le'),
(2, 'Mộng Mơ', 'Giỏ hoa pastel nhẹ nhàng với hoa cát tường, hoa hồng', 350000, 30, 10, 'in_stock', 1, NULL, 'mongmo.png', 'sinh-nhat'),
(3, 'Nến thơm lavender', 'Nến thơm hương lavender giúp thư giãn', 250000, 100, 20, 'in_stock', 1, NULL, 'nenlavender.jpg', 'qua-tang'),
(4, 'Hoa Hồng', 'Hoa hồng đỏ – biểu tượng của tình yêu nồng nàn', 500000, 40, 10, 'in_stock', 1, NULL, 'ngayle1.png', 'ngay-le'),
(5, 'Sen hồng', 'Biểu tượng của sự thanh cao, rực rỡ', 380000, 18, 10, 'in_stock', 1, '2025-12-14 08:45:54', 'sen.jpg', 'sinh-nhat'),
(6, 'Hoa tulip Vàng', 'Biểu tượng của niềm vui và lời chúc khởi đầu hạnh phúc', 450000, 20, 5, 'in_stock', 1, NULL, 'yellow_tulipa.jpg', 'dam-cuoi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_compare`
--

CREATE TABLE `product_compare` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `is_primary` tinyint(1) DEFAULT 0,
  `display_order` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_views`
--

CREATE TABLE `product_views` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin_reply` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `search_history`
--

CREATE TABLE `search_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `search_query` varchar(255) NOT NULL,
  `results_count` int(11) DEFAULT 0,
  `clicked_product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stock_alerts`
--

CREATE TABLE `stock_alerts` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `alert_type` enum('low_stock','out_of_stock') NOT NULL,
  `current_quantity` int(11) NOT NULL,
  `threshold` int(11) NOT NULL,
  `is_resolved` tinyint(1) DEFAULT 0,
  `resolved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$joE.clQu0sXFgBFVqqp0reGq5cTNtzYoch7WeZF1AakJ5pDwlTJ56', 'admin'),
(2, 'Khách Hàng Test', 'user01@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user'),
(3, 'Ngoc Sinh', 'ngocsinh@gmail.com', '$2y$10$mV56ev9d/qUwulUD.iQdrekgyq2EgDVV2G/uCVlZp0T1W3xyE320S', 'user');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `popular_searches`
--
DROP TABLE IF EXISTS `popular_searches`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `popular_searches`  AS SELECT `search_history`.`search_query` AS `search_query`, count(0) AS `search_count`, max(`search_history`.`created_at`) AS `last_searched` FROM `search_history` WHERE `search_history`.`created_at` >= current_timestamp() - interval 30 day GROUP BY `search_history`.`search_query` ORDER BY count(0) DESC LIMIT 0, 10 ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `chat_conversations`
--
ALTER TABLE `chat_conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_status` (`status`);

--
-- Chỉ mục cho bảng `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_conversation_id` (`conversation_id`),
  ADD KEY `idx_sender_type` (`sender_type`),
  ADD KEY `idx_is_read` (`is_read`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Chỉ mục cho bảng `coupon_usage`
--
ALTER TABLE `coupon_usage`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `email_logs`
--
ALTER TABLE `email_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_recipient` (`recipient`),
  ADD KEY `idx_sent_at` (`sent_at`);

--
-- Chỉ mục cho bảng `inventory_history`
--
ALTER TABLE `inventory_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_change_type` (`change_type`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_payment_status` (`payment_status`),
  ADD KEY `idx_payment_method` (`payment_method`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `payment_transactions`
--
ALTER TABLE `payment_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_transaction_id` (`transaction_id`),
  ADD KEY `idx_status` (`status`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_stock_status` (`stock_status`),
  ADD KEY `idx_is_available` (`is_available`);
ALTER TABLE `products` ADD FULLTEXT KEY `search_index` (`name`,`details`);

--
-- Chỉ mục cho bảng `product_compare`
--
ALTER TABLE `product_compare`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product_views`
--
ALTER TABLE `product_views`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `search_history`
--
ALTER TABLE `search_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_search_query` (`search_query`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `stock_alerts`
--
ALTER TABLE `stock_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_is_resolved` (`is_resolved`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_user_type` (`user_type`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `chat_conversations`
--
ALTER TABLE `chat_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `coupon_usage`
--
ALTER TABLE `coupon_usage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `email_logs`
--
ALTER TABLE `email_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `inventory_history`
--
ALTER TABLE `inventory_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `payment_transactions`
--
ALTER TABLE `payment_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `product_compare`
--
ALTER TABLE `product_compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_views`
--
ALTER TABLE `product_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `search_history`
--
ALTER TABLE `search_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `stock_alerts`
--
ALTER TABLE `stock_alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `chat_conversations` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `inventory_history`
--
ALTER TABLE `inventory_history`
  ADD CONSTRAINT `inventory_history_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventory_history_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `payment_transactions`
--
ALTER TABLE `payment_transactions`
  ADD CONSTRAINT `payment_transactions_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `stock_alerts`
--
ALTER TABLE `stock_alerts`
  ADD CONSTRAINT `stock_alerts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
