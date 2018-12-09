-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 08, 2018 lúc 01:28 PM
-- Phiên bản máy phục vụ: 10.1.29-MariaDB
-- Phiên bản PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlquanao`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `status`, `created_at`, `updated_at`) VALUES
(34, 41, '2018-12-05', 300000, 'COD', NULL, 1, '2018-12-08 09:13:45', '2018-12-08 09:13:45'),
(35, 42, '2018-12-05', 300000, 'COD', NULL, 1, '2018-12-08 09:14:10', '2018-12-08 09:14:10'),
(36, 43, '2018-12-05', 750000, 'ATM', NULL, 0, '2018-12-05 07:04:37', '2018-12-05 07:04:37'),
(37, 44, '2018-12-05', 500000, 'COD', NULL, 1, '2018-12-08 09:16:33', '2018-12-08 09:16:33'),
(33, 40, '2018-12-05', 500000, 'COD', NULL, 1, '2018-12-08 09:12:58', '2018-12-08 09:12:58'),
(38, 45, '2018-12-05', 1700000, 'ATM', NULL, 0, '2018-12-05 07:34:11', '2018-12-05 07:34:11'),
(39, 46, '2018-12-05', 700000, 'COD', NULL, 0, '2018-12-05 07:38:07', '2018-12-05 07:38:07'),
(40, 47, '2018-12-05', 300000, 'COD', 'mai giao hàng ngay nhé', 1, '2018-12-08 09:14:49', '2018-12-08 09:14:49'),
(41, 48, '2018-12-05', 900000, 'COD', NULL, 0, '2018-12-05 13:09:34', '2018-12-05 13:09:34'),
(42, 49, '2018-12-08', 800000, 'COD', NULL, 0, '2018-12-08 08:53:51', '2018-12-08 08:53:51'),
(43, 50, '2018-12-08', 2000000, 'COD', NULL, 0, '2018-12-08 09:02:30', '2018-12-08 09:02:30'),
(44, 51, '2018-12-08', 950000, 'ATM', 'đặt hàng hộ', 0, '2018-12-08 09:03:52', '2018-12-08 09:03:52'),
(45, 52, '2018-12-08', 800000, 'ATM', 'giao trong ngày nhé', 0, '2018-12-08 09:18:53', '2018-12-08 09:18:53'),
(46, 53, '2018-12-08', 4850000, 'ATM', NULL, 0, '2018-12-08 09:35:53', '2018-12-08 09:35:53'),
(47, 54, '2018-12-08', 550000, 'COD', NULL, 0, '2018-12-08 11:54:29', '2018-12-08 11:54:29'),
(48, 55, '2018-12-08', 500000, 'COD', NULL, 0, '2018-12-08 11:55:12', '2018-12-08 11:55:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(52, 33, 35, 1, 500000, '2018-12-05 07:31:44', '2018-12-05 07:31:44'),
(60, 38, 38, 1, 800000, '2018-12-05 07:33:42', '2018-12-05 07:33:42'),
(53, 34, 34, 1, 300000, '2018-12-05 07:24:39', '2018-12-05 07:24:39'),
(55, 35, 34, 1, 300000, '2018-12-05 06:47:36', '2018-12-05 06:47:36'),
(56, 36, 36, 1, 450000, '2018-12-05 07:04:37', '2018-12-05 07:04:37'),
(59, 38, 36, 2, 450000, '2018-12-05 07:34:11', '2018-12-05 07:34:11'),
(57, 36, 34, 1, 300000, '2018-12-05 07:04:37', '2018-12-05 07:04:37'),
(58, 37, 35, 1, 500000, '2018-12-05 07:07:18', '2018-12-05 07:07:18'),
(61, 39, 36, 1, 450000, '2018-12-05 07:38:07', '2018-12-05 07:38:07'),
(62, 39, 33, 1, 250000, '2018-12-05 07:38:07', '2018-12-05 07:38:07'),
(63, 40, 34, 1, 300000, '2018-12-05 12:39:02', '2018-12-05 12:39:02'),
(64, 41, 36, 2, 450000, '2018-12-05 13:09:34', '2018-12-05 13:09:34'),
(65, 42, 34, 1, 300000, '2018-12-08 08:53:51', '2018-12-08 08:53:51'),
(66, 42, 35, 1, 500000, '2018-12-08 08:53:52', '2018-12-08 08:53:52'),
(67, 43, 35, 1, 500000, '2018-12-08 09:02:30', '2018-12-08 09:02:30'),
(68, 43, 39, 1, 1500000, '2018-12-08 09:02:30', '2018-12-08 09:02:30'),
(69, 44, 35, 1, 500000, '2018-12-08 09:03:52', '2018-12-08 09:03:52'),
(70, 44, 36, 1, 450000, '2018-12-08 09:03:52', '2018-12-08 09:03:52'),
(71, 45, 38, 1, 800000, '2018-12-08 09:18:53', '2018-12-08 09:18:53'),
(72, 46, 34, 1, 300000, '2018-12-08 09:35:53', '2018-12-08 09:35:53'),
(73, 46, 35, 2, 500000, '2018-12-08 09:35:53', '2018-12-08 09:35:53'),
(74, 46, 36, 2, 450000, '2018-12-08 09:35:53', '2018-12-08 09:35:53'),
(75, 46, 33, 1, 250000, '2018-12-08 09:35:53', '2018-12-08 09:35:53'),
(76, 46, 37, 1, 100000, '2018-12-08 09:35:53', '2018-12-08 09:35:53'),
(77, 46, 38, 1, 800000, '2018-12-08 09:35:53', '2018-12-08 09:35:53'),
(78, 46, 39, 1, 1500000, '2018-12-08 09:35:53', '2018-12-08 09:35:53'),
(79, 47, 33, 1, 250000, '2018-12-08 11:54:29', '2018-12-08 11:54:29'),
(80, 47, 34, 1, 300000, '2018-12-08 11:54:29', '2018-12-08 11:54:29'),
(81, 48, 35, 1, 500000, '2018-12-08 11:55:12', '2018-12-08 11:55:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(41, 'Nguyễn Xuân Thiện', 'nam', 'abc@gmail.com', '?????', '1234567890', '', '2018-12-05 06:33:35', '2018-12-05 06:33:35'),
(42, 'Nguyễn Xuân Thiện', 'nam', 'abc@gmail.com', 'hà nội', '1234567890', '', '2018-12-05 06:47:36', '2018-12-05 06:47:36'),
(40, 'Vũ Tuấn Anh', 'nam', 'tuananh77717@gmail.com', 'số 2 - ngách 20 - ngõ Trại Cá - Trương Định - Hai Bà Trưng', '0961582848', '', '2018-12-05 06:31:17', '2018-12-05 06:31:17'),
(39, 'Vũ Tuấn Anh', 'nam', 'tuananh77717@gmail.com', 'số 2 - ngách 20 - ngõ Trại Cá - Trương Định - Hai Bà Trưng', '0961582848', '', '2018-12-05 06:30:46', '2018-12-05 06:30:46'),
(43, 'Nguyễn Xuân Thiện', 'nam', 'abc@gmail.com', 'hà nội', '1234567890', '', '2018-12-05 07:04:37', '2018-12-05 07:04:37'),
(44, 'no name', 'nam', '123@gmail.com', 'không biết', '1203094855', '', '2018-12-05 07:07:18', '2018-12-05 07:07:18'),
(45, 'Vũ Tuấn Anh', 'nam', 'tuananh77717@gmail.com', 'số 2 - ngách 20 - ngõ Trại Cá - Trương Định - Hai Bà Trưng', '0961582848', '', '2018-12-05 07:33:42', '2018-12-05 07:33:42'),
(46, 'Vũ Tuấn Anh', 'nam', 'vutuananhsama@gmail.com', 'số 2 - ngách 20 - ngõ Trại Cá - Trương Định - Hai Bà Trưng', '0961582848', '', '2018-12-05 07:38:07', '2018-12-05 07:38:07'),
(47, 'Vũ Tuấn Anh', 'nam', 'tuananh77717@gmail.com', 'số 2 - ngách 20 - ngõ Trại Cá - Trương Định - Hai Bà Trưng', '0961582848', 'mai giao hàng ngay nhé', '2018-12-05 12:39:02', '2018-12-05 12:39:02'),
(48, 'Vũ Tuấn Anh', 'nam', 'tuananh77717@gmail.com', 'số 2 - ngách 20 - ngõ Trại Cá - Trương Định - Hai Bà Trưng', '0961582848', '', '2018-12-05 13:09:34', '2018-12-05 13:09:34'),
(49, 'Phạm Đình Tuấn Anh', 'nam', '123@gmail.com', 'abc - xyz - hanoi', '1234567890', '', '2018-12-08 08:53:51', '2018-12-08 08:53:51'),
(50, 'Vũ Tuấn Anh', 'nam', 'tuananh77717@gmail.com', 'số 2 - ngách 20 - ngõ Trại Cá - Trương Định - Hai Bà Trưng', '0961582848', '', '2018-12-08 09:02:30', '2018-12-08 09:02:30'),
(51, 'Phạm Đình Tuấn Anh', 'nam', 'abc@gmail.com', 'hà nội', '1234567890', 'đặt hàng hộ', '2018-12-08 09:03:52', '2018-12-08 09:03:52'),
(52, 'Vũ Tuấn Anh', 'nam', 'tuananh77717@gmail.com', 'số 2 - ngách 20 - ngõ Trại Cá - Trương Định - Hai Bà Trưng', '0961582848', 'giao trong ngày nhé', '2018-12-08 09:18:53', '2018-12-08 09:18:53'),
(53, 'Vũ Tuấn Anh', 'nam', 'tuananh77717@gmail.com', 'số 2 - ngách 20 - ngõ Trại Cá - Trương Định - Hai Bà Trưng', '0961582848', '', '2018-12-08 09:35:53', '2018-12-08 09:35:53'),
(54, 'Vũ Tuấn Anh', 'nam', 'anh.vt150207@gmail.com', 'số 2 - ngách 20 - ngõ Trại Cá - Trương Định - Hai Bà Trưng', '0961582848', '', '2018-12-08 11:54:29', '2018-12-08 11:54:29'),
(55, 'Vũ Tuấn Anh', 'nam', 'tuananh77717@gmail.com', 'số 2 - ngách 20 - ngõ Trại Cá - Trương Định - Hai Bà Trưng', '0961582848', '', '2018-12-08 11:55:12', '2018-12-08 11:55:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `maker` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `maker`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`, `quantity`) VALUES
(33, 'CHÂN VÁY XÒE CÁCH ĐIỆU - NÂU TÂY', 17, 'abc', NULL, 300000, 250000, 'tkZc_41548bc71940c55477cfb9099aeea058.png', NULL, 1, '2018-11-07 13:50:42', '2018-11-07 13:50:42', 100),
(34, 'Váy đầm thời trang công sở', 17, 'abc', '<p>abc</p>', 300000, NULL, 'GGQC_vay-dam-maxxshop-1.png', NULL, 1, '2018-11-07 13:53:35', '2018-11-07 13:53:35', 10),
(35, 'Áo kiểu Loza tay loe đính nút thời trang', 18, 'def', NULL, 500000, NULL, 'C7je_ao-kieu-Loza-tay-loe-dinh-nut-2.jpg', NULL, 1, '2018-11-07 13:55:28', '2018-11-07 13:55:28', 95),
(36, 'Áo Kiểu Thời Trang Cindy', 18, 'def', '<p>abcdef</p>', 600000, 450000, 'R8eT_341873-ao-kieu-thoi-trang-cindy.jpg', NULL, 0, '2018-11-07 13:57:13', '2018-11-07 13:57:13', 100),
(37, 'Quần nữ ống rộng', 19, 'abc', NULL, 100000, NULL, 'gwGJ_c0a31ca0b304b4f79a47868ddab20034.jpg_670x670q75.jpg', NULL, 0, '2018-11-07 13:59:09', '2018-11-07 13:59:09', 45),
(38, 'Set Áo Dài Cách Tân Hoa 3D', 20, 'abc123', NULL, 1000000, 800000, 'hMBq_344067-_344057-vn-2-3-4.jpg', NULL, 1, '2018-11-07 14:00:48', '2018-11-07 14:00:48', 45),
(39, 'Áo khoác nữ kaki phối nón màu rêu', 21, 'def', NULL, 2000000, 1500000, 'V3W6_127_Ao_khoac_nu_kaki_phoi_non_mau_reu_b0157.jpg', NULL, 1, '2018-11-07 14:02:12', '2018-11-07 14:02:12', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '1.jpg', 'e1Oi_1.jpg'),
(2, '2.jpg', '13Kl_2.jpg'),
(3, '3.jpg', 'Mcbd_3.jpg'),
(5, '4.jpg', 'dl21_4.jpg'),
(6, '5.jpg', 'cEGa_5.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(17, 'Váy đầm', '<p>váy</p>', '9ycg_62-bai-viet-ban-hang-vay-dam.jpg', '2018-11-07 13:43:57', '2018-11-07 13:54:04'),
(18, 'Áo thời trang', '<p>áo</p>', 'iwpx_341866-ao-kieu-sellyna-thoi-trang.jpg', '2018-11-07 13:44:55', '2018-11-07 13:44:55'),
(19, 'Quần thời trang', '<p>quần</p>', 'c8tF_quan-nu-skinny-quan-jeans-nu-lung-cao-dang-om-glq054-1m4G3-J0h8ml_simg_ab1f47_350x350_maxb.jpg', '2018-11-07 13:46:07', '2018-11-07 13:46:07'),
(20, 'Áo dài', '<p>ao dài</p>', 'C6OF_Vải-áo-dài-hoa-cúc-AD-HG-HT1718-2.jpg', '2018-11-07 13:47:43', '2018-11-07 13:47:43'),
(21, 'Áo khoác', '<p>áo khoác</p>', 'mZYV_tải xuống.jpg', '2018-11-07 13:48:56', '2018-11-07 13:48:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quyen` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`, `quyen`) VALUES
(1, 'Vũ Tuấn Anh', 'tuananh77717@gmail.com', '$2y$10$Lf2cmk8/WOSO10e1Pwab2.E2zhBSVF2djNAxK04lMz4BPHulLZMzq', '0961582848', 'số 2 - ngách 20 - ngõ Trại Cá - Trương Định - Hai Bà Trưng', 'CWJnF9gzGh9JlkZfYMcr0d3HFdika2tdxrW4UEG5NMvJvEm2v2dtcWV7ffYA', '2018-11-18 07:26:52', '2018-12-05 05:58:24', 1),
(2, 'Phạm Đình Tuấn Anh', '123@gmail.com', '$2y$10$IQ8GFlam73LopakTxPm2lODpptOmCPwsc/EPELuuQK3nM7VklIBjG', '1234567890', NULL, 'D9l6YGrDDTPLGk6KlDgdSENJ5HCrot5LZKoBsoD20uyYjEkQPkIrRbl42kAU', '2018-11-18 07:27:34', '2018-12-08 08:52:43', 1),
(3, 'Nguyễn Xuân Thiện', 'abc@gmail.com', '$2y$10$4aJvDVgaX7gncbrTB1QmRucGwMootoXS4GJYHGwCrRu1yZUdwp/.W', '1234567890', 'hà nội', 'wsxt0AC0BVI5mA9uZtBMmL6pEbOADpT1b8p9CFGJxGSO2lONGDgebEv3bhdG', '2018-11-18 07:29:33', '2018-12-08 11:30:46', 1),
(4, 'Nguyễn Văn Đoàn', 'xyz@gmail.com', '$2y$10$zfH7SVsHxheLVNWPdAxOqOiDYB4zckTwqV90b6lcEMrC/A34.epNS', NULL, NULL, 'NWq3i2WnzoEhJJu6Ztnm1HiToFLycQN3SK0CMChgm4uqxsmXpaxNSV8qlycw', '2018-11-18 07:30:19', '2018-11-18 07:30:19', 1),
(6, 'Vũ Tuấn Anh', 'vutuananhsama@gmail.com', '$2y$10$RO1C1kE27exdDEp3aiHmCewuQoOQwr0VsP/7BKIOhP0bPzPD9Mzq2', NULL, 'số 2 - ngách 20 - ngõ Trại Cá - Trương Định - Hai Bà Trưng', NULL, '2018-11-18 08:22:56', '2018-11-18 08:22:56', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
