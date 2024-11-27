-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 27, 2024 lúc 10:27 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `new-nodejs`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `groupTitle` varchar(255) DEFAULT NULL,
  `members` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`members`)),
  `lastMessage` text DEFAULT NULL,
  `lastMessageId` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `conversations`
--

INSERT INTO `conversations` (`id`, `groupTitle`, `members`, `lastMessage`, `lastMessageId`, `created_at`, `updated_at`) VALUES
(1, 'groupTitle', '[1,2]', 'groupTitle 2', '3', '2024-11-27 06:03:10', '2024-11-27 06:03:10'),
(2, 'groupTitle 2', '[2,3]', NULL, NULL, '2024-11-27 06:11:00', '2024-11-27 06:11:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupoun_codes`
--

CREATE TABLE `coupoun_codes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `minAmount` decimal(10,2) DEFAULT NULL,
  `maxAmount` decimal(10,2) DEFAULT NULL,
  `shopId` varchar(255) NOT NULL,
  `selectedProducts` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `coupoun_codes`
--

INSERT INTO `coupoun_codes` (`id`, `name`, `value`, `minAmount`, `maxAmount`, `shopId`, `selectedProducts`, `created_at`) VALUES
(1, 'dưqdw', 12.00, 32.00, 3123.00, '1', 'null', '2024-11-27 09:10:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `start_Date` date NOT NULL,
  `Finish_Date` date NOT NULL,
  `status` varchar(255) DEFAULT 'Running',
  `tags` varchar(255) DEFAULT NULL,
  `originalPrice` decimal(10,2) DEFAULT NULL,
  `discountPrice` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `shopId` varchar(255) NOT NULL,
  `shop` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`shop`)),
  `sold_out` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `events`
--

INSERT INTO `events` (`id`, `name`, `description`, `category`, `start_Date`, `Finish_Date`, `status`, `tags`, `originalPrice`, `discountPrice`, `stock`, `images`, `shopId`, `shop`, `sold_out`, `created_at`) VALUES
(1, '2312323', '3123213', 'Laptops & Computers', '2024-11-27', '2024-11-30', 'Running', '312312', 2132.00, 311.00, 312, '[\"Screenshot 2023-09-26 090112-1732697745295-471143593.png\"]', '1', '{\"id\":1,\"name\":\"thanhdo shop\",\"email\":\"thanhdo9xi@gmail.com\",\"password\":\"$2a$10$9XySHxiD5.EwxkdQy0RsX.kyfy8DqK2bLM8doeXyL2evuyHjPxrOS\",\"description\":null,\"address\":\"ha noi\",\"phoneNumber\":0,\"role\":\"Seller\",\"avatar\":\"Screenshot 2023-10-11 101649-1732689998766-901387813.png\",\"zipCode\":null,\"withdrawMethod\":null,\"availableBalance\":\"0.00\",\"created_at\":\"2024-11-27T06:46:49.000Z\",\"reset_password_token\":null,\"reset_password_time\":null}', 0, '2024-11-27 08:55:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `text` text DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `conversationId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `text`, `sender`, `images`, `created_at`, `updated_at`, `conversationId`) VALUES
(1, 'abcxyz', '1', 'Screenshot 2023-09-26 090112-1732689484213-384292949.png', '2024-11-27 06:38:04', '2024-11-27 06:38:04', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `cart` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`cart`)),
  `shipping_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`shipping_address`)),
  `user` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`user`)),
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(255) DEFAULT 'Processing',
  `payment_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_info`)),
  `paymentInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`paymentInfo`)),
  `paid_at` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `shippingAddress` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`shippingAddress`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `cart`, `shipping_address`, `user`, `total_price`, `status`, `payment_info`, `paymentInfo`, `paid_at`, `delivered_at`, `created_at`, `shippingAddress`) VALUES
(1, '[{\"id\":1,\"name\":\"san pham A\",\"description\":\"cc\",\"category\":\"Laptops & Computers\",\"tags\":\"ccdscs\",\"originalPrice\":null,\"discount_price\":\"0.00\",\"stock\":31231232,\"images\":[\"Screenshot 2023-10-11 101649-1732690651840-519589703.png\"],\"reviews\":\"[]\",\"ratings\":null,\"shopId\":\"\",\"shop\":{\"id\":1,\"name\":\"thanhdo shop\",\"email\":\"thanhdo9xi@gmail.com\",\"password\":\"$2a$10$9XySHxiD5.EwxkdQy0RsX.kyfy8DqK2bLM8doeXyL2evuyHjPxrOS\",\"description\":null,\"address\":\"ha noi\",\"phoneNumber\":0,\"role\":\"Seller\",\"avatar\":\"Screenshot 2023-10-11 101649-1732689998766-901387813.png\",\"zipCode\":null,\"withdrawMethod\":null,\"availableBalance\":\"0.00\",\"created_at\":\"2024-11-27T06:46:49.000Z\",\"reset_password_token\":null,\"reset_password_time\":null},\"sold_out\":0,\"created_at\":\"2024-11-27T06:57:31.000Z\",\"qty\":1}]', '{\"address1\":\"4234234\",\"country\":\"VN\",\"city\":\"44\"}', '{\"id\":1,\"name\":\"thanhdo\",\"email\":\"thanhdo9xi@gmail.com\",\"password\":\"$2a$10$K0o.gmVakCSj5Nw0IiP1i.cjqj/.Cj95DInin16yt5WL7rIQ8zP7O\",\"phoneNumber\":null,\"addresses\":null,\"role\":\"admin\",\"avatar\":\"ds-1732689755297-74052202.png\",\"created_at\":\"2024-11-27T06:43:02.000Z\",\"reset_password_token\":null,\"reset_password_time\":null}', 0.00, 'Processing', NULL, '{\"type\":\"Cash On Delivery\"}', NULL, NULL, '2024-11-27 07:47:51', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `discount_price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `reviews` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`reviews`)),
  `ratings` decimal(3,2) DEFAULT NULL,
  `shop` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`shop`)),
  `sold_out` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `originalPrice` decimal(10,2) DEFAULT NULL,
  `shopId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `category`, `tags`, `discount_price`, `stock`, `images`, `reviews`, `ratings`, `shop`, `sold_out`, `created_at`, `originalPrice`, `shopId`) VALUES
(2, 'san pham A', '3123213', 'Laptops & Computers', '312321', 0.00, 312, '[\"Screenshot 2023-09-25 092531-1732697653458-189512547.png\"]', NULL, NULL, '{\"id\":1,\"name\":\"thanhdo shop\",\"email\":\"thanhdo9xi@gmail.com\",\"password\":\"$2a$10$9XySHxiD5.EwxkdQy0RsX.kyfy8DqK2bLM8doeXyL2evuyHjPxrOS\",\"description\":null,\"address\":\"ha noi\",\"phoneNumber\":0,\"role\":\"Seller\",\"avatar\":\"Screenshot 2023-10-11 101649-1732689998766-901387813.png\",\"zipCode\":null,\"withdrawMethod\":null,\"availableBalance\":\"0.00\",\"created_at\":\"2024-11-27T06:46:49.000Z\",\"reset_password_token\":null,\"reset_password_time\":null}', 0, '2024-11-27 08:54:13', 3213.00, '1'),
(3, 'dqweq2we', '123213', 'Cameras & Videos', '312321', 0.00, 312321, '[\"Screenshot 2023-10-09 124744-1732697685014-630221828.png\"]', NULL, NULL, '{\"id\":1,\"name\":\"thanhdo shop\",\"email\":\"thanhdo9xi@gmail.com\",\"password\":\"$2a$10$9XySHxiD5.EwxkdQy0RsX.kyfy8DqK2bLM8doeXyL2evuyHjPxrOS\",\"description\":null,\"address\":\"ha noi\",\"phoneNumber\":0,\"role\":\"Seller\",\"avatar\":\"Screenshot 2023-10-11 101649-1732689998766-901387813.png\",\"zipCode\":null,\"withdrawMethod\":null,\"availableBalance\":\"0.00\",\"created_at\":\"2024-11-27T06:46:49.000Z\",\"reset_password_token\":null,\"reset_password_time\":null}', 0, '2024-11-27 08:54:45', 31232.00, '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT 'Seller',
  `avatar` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_time` datetime DEFAULT NULL,
  `availableBalance` decimal(10,2) DEFAULT 0.00,
  `phoneNumber` bigint(20) NOT NULL,
  `zipCode` int(11) DEFAULT NULL,
  `withdrawMethod` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`withdrawMethod`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shops`
--

INSERT INTO `shops` (`id`, `name`, `email`, `password`, `description`, `address`, `role`, `avatar`, `created_at`, `reset_password_token`, `reset_password_time`, `availableBalance`, `phoneNumber`, `zipCode`, `withdrawMethod`) VALUES
(1, 'thanhdo shop', 'thanhdo9xi@gmail.com', '$2a$10$9XySHxiD5.EwxkdQy0RsX.kyfy8DqK2bLM8doeXyL2evuyHjPxrOS', NULL, 'ha noi', 'Seller', 'Screenshot 2023-10-11 101649-1732689998766-901387813.png', '2024-11-27 06:46:49', NULL, NULL, 0.00, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `addresses` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`addresses`)),
  `role` varchar(255) DEFAULT 'user',
  `avatar` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_time` datetime DEFAULT NULL,
  `phoneNumber` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `addresses`, `role`, `avatar`, `created_at`, `reset_password_token`, `reset_password_time`, `phoneNumber`) VALUES
(1, 'thanhdo', 'thanhdo9xi@gmail.com', '$2a$10$K0o.gmVakCSj5Nw0IiP1i.cjqj/.Cj95DInin16yt5WL7rIQ8zP7O', '[{\"country\":\"TT\",\"city\":\"DMN\",\"address1\":\"1232132\",\"addressType\":\"Home, Permanent Address\"}]', 'Admin', 'ds-1732689755297-74052202.png', '2024-11-27 06:43:02', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(11) NOT NULL,
  `seller` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`seller`)),
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(50) DEFAULT 'Processing',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupoun_codes`
--
ALTER TABLE `coupoun_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `name_3` (`name`),
  ADD UNIQUE KEY `name_4` (`name`),
  ADD UNIQUE KEY `name_5` (`name`),
  ADD UNIQUE KEY `name_6` (`name`),
  ADD UNIQUE KEY `name_7` (`name`),
  ADD UNIQUE KEY `name_8` (`name`),
  ADD UNIQUE KEY `name_9` (`name`),
  ADD UNIQUE KEY `name_10` (`name`);

--
-- Chỉ mục cho bảng `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `email_3` (`email`),
  ADD UNIQUE KEY `email_4` (`email`),
  ADD UNIQUE KEY `email_5` (`email`),
  ADD UNIQUE KEY `email_6` (`email`),
  ADD UNIQUE KEY `email_7` (`email`),
  ADD UNIQUE KEY `email_8` (`email`),
  ADD UNIQUE KEY `email_9` (`email`),
  ADD UNIQUE KEY `email_10` (`email`),
  ADD UNIQUE KEY `email_11` (`email`),
  ADD UNIQUE KEY `email_12` (`email`),
  ADD UNIQUE KEY `email_13` (`email`),
  ADD UNIQUE KEY `email_14` (`email`),
  ADD UNIQUE KEY `email_15` (`email`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `email_3` (`email`),
  ADD UNIQUE KEY `email_4` (`email`),
  ADD UNIQUE KEY `email_5` (`email`),
  ADD UNIQUE KEY `email_6` (`email`),
  ADD UNIQUE KEY `email_7` (`email`),
  ADD UNIQUE KEY `email_8` (`email`),
  ADD UNIQUE KEY `email_9` (`email`),
  ADD UNIQUE KEY `email_10` (`email`),
  ADD UNIQUE KEY `email_11` (`email`),
  ADD UNIQUE KEY `email_12` (`email`),
  ADD UNIQUE KEY `email_13` (`email`),
  ADD UNIQUE KEY `email_14` (`email`),
  ADD UNIQUE KEY `email_15` (`email`);

--
-- Chỉ mục cho bảng `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `coupoun_codes`
--
ALTER TABLE `coupoun_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
