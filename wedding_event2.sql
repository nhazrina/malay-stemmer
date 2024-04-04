-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 03, 2023 at 07:30 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wedding_event2`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_option_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `house_number` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `booked_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `booked_at` date DEFAULT NULL,
  `price` decimal(8,2) UNSIGNED DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `venue_id` bigint(20) UNSIGNED NOT NULL,
  `booked_date_until` date NOT NULL,
  `booked_date_from` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `booking_option_id`, `first_name`, `last_name`, `email`, `phone`, `street`, `house_number`, `postal_code`, `city`, `country`, `booked_by_user_id`, `booked_at`, `price`, `paid_at`, `comment`, `created_at`, `updated_at`, `venue_id`, `booked_date_until`, `booked_date_from`) VALUES
(34, 8, 'Muhammad', 'Shafiq', 'shafiq@gmail.com', '011199239239', NULL, NULL, NULL, NULL, NULL, 20, '2023-05-14', '9.00', '2023-06-04 00:33:00', 'Fake receipt!', '2023-05-14', '2023-06-03 16:33:16', 35, '2023-05-16', '2023-05-14'),
(35, 8, 'Muhammad Shafiq', 'Ahmad Razman', 'muhammadshafiq457@gmail.com', '01119950594', NULL, NULL, NULL, NULL, NULL, 20, '2023-05-18', '6.00', NULL, NULL, '2023-05-18', '2023-05-18 14:26:47', 35, '2023-05-20', '2023-05-19'),
(36, 10, 'qqq', 'qqq', 'shafiq@gmail.com', '3455', 'Jalan beranang', '11', '34666', 'Johor Bharu', NULL, 20, '2023-06-04', '300.00', NULL, NULL, '2023-06-04', '2023-06-03 17:02:51', 39, '2023-06-15', '2023-06-13');

-- --------------------------------------------------------

--
-- Table structure for table `booking_options`
--

CREATE TABLE `booking_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `maximum_bookings` int(10) UNSIGNED DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_until` datetime DEFAULT NULL,
  `price` decimal(8,2) UNSIGNED DEFAULT NULL,
  `price_conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`price_conditions`)),
  `restrictions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`restrictions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `form_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_options`
--

INSERT INTO `booking_options` (`id`, `event_id`, `name`, `slug`, `description`, `maximum_bookings`, `available_from`, `available_until`, `price`, `price_conditions`, `restrictions`, `created_at`, `updated_at`, `form_id`) VALUES
(8, 35, '3', '3', '3', 20000, '2023-04-17 17:23:00', '2023-11-25 17:23:00', '3.00', NULL, '[]', '2023-04-17 00:41:34', '2023-05-09 00:26:06', NULL),
(9, 35, '2', '2', '2', 2, '2023-04-17 17:24:00', '2023-04-18 17:24:00', '2.00', NULL, '[]', '2023-04-17 00:58:44', '2023-04-17 09:24:08', NULL),
(10, 39, 'Package Basic', 'package-basic', 'nnnnnnnnnnnnnnnnn', 12, '2023-06-01 00:38:00', '2023-06-30 00:38:00', '100.00', NULL, '[]', '2023-06-03 16:38:20', '2023-06-03 16:38:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `chat_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `landscaper_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`chat_id`, `message`, `updated_at`, `created_at`, `user_id`, `landscaper_id`) VALUES
(37, 'test', '2023-04-15 08:29:34', '2023-04-15 08:29:34', 20, 21),
(38, 'halo', '2023-04-15 08:51:47', '2023-04-15 08:51:47', 20, 21);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_fields`
--

CREATE TABLE `form_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_field_group_id` bigint(20) UNSIGNED NOT NULL,
  `sort` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hint` text DEFAULT NULL,
  `container_class` varchar(255) DEFAULT NULL,
  `column` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `validation_rules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation_rules`)),
  `allowed_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`allowed_values`)),
  `editable_after_submission` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_field_groups`
--

CREATE TABLE `form_field_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` bigint(20) UNSIGNED NOT NULL,
  `sort` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `show_name` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_field_values`
--

CREATE TABLE `form_field_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `form_field_id` bigint(20) UNSIGNED NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `venue_id` bigint(11) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `venue_id`, `path`, `created_at`, `updated_at`) VALUES
(2, 38, 'images/website.jpg', '2023-05-18 06:17:54', '2023-05-18 06:17:54'),
(3, 39, 'images/Harry___Ling_572.jpg', '2023-06-03 16:37:11', '2023-06-03 16:37:11');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `house_number` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `street`, `house_number`, `postal_code`, `city`, `state`, `website_url`, `created_at`, `updated_at`, `user_id`) VALUES
(7, 'Johor', '2', '2', '22', 'Terengganu', '2', '2', '2023-04-14 20:26:12', '2023-04-14 20:26:12', 22),
(9, 'New Location', 'Johor', 'Johor', '43900', 'Johor', 'Perak', 'Johor', '2023-05-21 14:33:44', '2023-05-21 14:33:44', 21),
(10, 'My Lcoation 1', '2234', 'wer', '43900', 'Sepang', 'asfdafda', 'adfadf', '2023-06-03 11:58:32', '2023-06-03 12:09:23', 21),
(11, 'safdasf', 'asdf', 'asdfasf', 'asfda', 'asdfasf', 'Perak', NULL, '2023-06-03 12:09:56', '2023-06-03 12:12:59', 21);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `register_entry` varchar(255) DEFAULT NULL,
  `representatives` varchar(255) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `parent_organization_id` bigint(20) UNSIGNED DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organization_venue`
--

CREATE TABLE `organization_venue` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `venue_id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) NOT NULL,
  `amount` double NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `receipt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `booking_id`, `amount`, `payment_method`, `updated_at`, `created_at`, `receipt`) VALUES
(12, 35, 6, 'Credit Card', '2023-06-03 16:31:30', '2023-06-03 16:31:30', 'receipts/ojcpD2veSSi3lvYfrxqnfhWVE3QM8fCv42Dkn2L6.png');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `booking_id`, `user_id`, `rating`, `comment`, `created_at`, `updated_at`, `service_id`, `image_path`) VALUES
(11, 34, 20, 5, 'This venue is so gooood', '2023-05-18 14:28:00', '2023-05-18 14:28:00', 35, 'public/reviews/1684420080_website.jpg'),
(12, 34, 20, 5, 'This venue is so gooood', '2023-05-18 14:28:00', '2023-05-18 14:28:00', 35, 'public/reviews/1684420080_website.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `service_series`
--

CREATE TABLE `service_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `visibility` varchar(255) NOT NULL,
  `parent_event_series_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `house_number` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `street`, `house_number`, `postal_code`, `city`, `country`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `status`, `last_login_at`, `created_at`, `updated_at`) VALUES
(20, 'shafiq', 'razman', NULL, NULL, NULL, NULL, NULL, NULL, 'shafiq@gmail.com', '2023-04-15 08:28:50', '$2y$10$j8aTi2Ygu4Wk20WJxcmE7.uqz1NLbkcOXJ9e/FAt.0OTloNFvueme', NULL, 1, '2023-06-03 16:53:04', '2023-04-14 19:40:48', '2023-04-15 08:28:50'),
(21, 'vendor', 'vendor', NULL, NULL, NULL, NULL, NULL, NULL, 'vendor@gmail.com', NULL, '$2y$10$h0gO35e5u/MLZfxGdo1gcOptB/LDqtvFIwUJfr1tSKgH71PPxjQvi', 'Ynb4LVTFgCQb6EqIP7abUt7tVJmbarQNjhL98VH8tiMcPUTzVspTGvPLDnaE', 1, '2023-06-03 16:50:51', '2023-04-14 19:45:58', '2023-04-14 19:45:58'),
(22, 'vendor2', 'vendor2', NULL, NULL, NULL, NULL, NULL, NULL, 'vendor2@gmail.com', '2023-04-15 08:32:55', '$2y$10$1IpEOLMVSVOwSUGDxHWfz.V3FwMhX8vcmXR6DiG32EWvJhufkZm42', NULL, 1, '2023-05-21 14:36:18', '2023-04-15 08:31:38', '2023-04-15 08:32:55'),
(23, 'admin', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, 'admin@gmail.com', NULL, '$2y$10$U5JDeOyaVR9Bghrv9jX0YuNoBIO7MBNGu6Rhe6gEYRO/m2V6HtXeK', NULL, 1, '2023-06-03 17:20:59', '2023-05-21 14:05:16', '2023-05-21 14:05:16'),
(24, 'AINA', 'NATASHA', NULL, NULL, NULL, NULL, NULL, NULL, 'aina@gmail.com', NULL, '$2y$10$8etaACf.bv.5wituYUL2veqeWATra8pQZLQgelznPQSMwjIiPHFvW', NULL, 1, NULL, '2023-06-03 17:18:29', '2023-06-03 17:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `abilities` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`, `abilities`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '[\"users.view\",\"users.create\",\"users.edit\",\"user_roles.view\",\"user_roles.create\",\"user_roles.edit\", \"users.edit_account\"]', '2023-03-05 19:11:45', '2023-03-05 19:11:45'),
(2, 'User', '[\"users.edit_account\"]', '2023-03-05 19:11:45', '2023-03-05 19:11:45'),
(3, 'Vendor', '[\"locations.view\",\"users.edit_account\",\"personal_access_tokens.manage_own\",\"events.view\",\"events.view_private\",\"events.create\",\"events.edit\",\"events.manage_booking_options\",\"events.view_bookings\",\"events.export_bookings\",\"events.edit_bookings\",\"events.edit_booking_comment\",\"events.view_payment_status\",\"events.edit_payment_status\",\"event_series.view\",\"event_series.view_private\",\"event_series.create\",\"event_series.edit\",\"forms.view\",\"forms.create\",\"forms.edit\",\"locations.create\",\"locations.edit\",\"organizations.view\",\"organizations.create\",\"organizations.edit\"]', '2023-04-03 17:07:39', '2023-04-03 17:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_user_role`
--

CREATE TABLE `user_user_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_user_role`
--

INSERT INTO `user_user_role` (`id`, `user_id`, `user_role_id`, `created_at`, `updated_at`) VALUES
(21, 21, 3, '2023-04-14 19:45:58', '2023-04-14 19:45:58'),
(22, 20, 2, NULL, NULL),
(23, 22, 2, '2023-04-15 08:31:38', '2023-04-15 08:31:38'),
(24, 23, 1, '2023-05-21 14:05:16', '2023-05-21 14:05:16'),
(25, 24, 2, '2023-06-03 17:18:29', '2023-06-03 17:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `visibility` varchar(255) NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `parent_event_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event_series_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `venues`
--

INSERT INTO `venues` (`id`, `name`, `slug`, `description`, `visibility`, `started_at`, `finished_at`, `website_url`, `location_id`, `parent_event_id`, `event_series_id`, `created_at`, `updated_at`, `image`, `user_id`) VALUES
(35, '3', '3', '3', 'public', '2023-04-17 16:57:00', '2023-04-18 16:57:00', '3', 9, NULL, NULL, '2023-04-16 23:54:40', '2023-04-17 00:58:07', NULL, 21),
(38, 'r', 'r', 'r', 'public', NULL, NULL, 'r', 9, NULL, NULL, '2023-05-18 06:17:54', '2023-05-18 06:17:54', NULL, 21),
(39, 'Bizmillah Wedding Center', 'bizmillah-wedding-center', 'aaaaaaaaaaaaaaaaaaa', 'public', NULL, NULL, 'bizmilillah.com', 9, NULL, NULL, '2023-06-03 16:37:11', '2023-06-03 16:52:23', NULL, 21);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_venues`
--

CREATE TABLE `wishlist_venues` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist_venues`
--

INSERT INTO `wishlist_venues` (`id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES
(15, 20, 35, '2023-06-03 16:21:11', '2023-06-03 16:21:11'),
(16, 20, 38, '2023-06-03 16:21:16', '2023-06-03 16:21:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_booking_key` (`booked_at`,`booked_by_user_id`,`venue_id`),
  ADD KEY `bookings_booking_option_id_foreign` (`booking_option_id`),
  ADD KEY `bookings_booked_by_user_id_foreign` (`booked_by_user_id`);

--
-- Indexes for table `booking_options`
--
ALTER TABLE `booking_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `booking_options_event_id_slug_unique` (`event_id`,`slug`),
  ADD KEY `booking_options_form_id_foreign` (`form_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`chat_id`),
  ADD KEY `user_id_fk` (`user_id`),
  ADD KEY `landscaper_id` (`landscaper_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_fields`
--
ALTER TABLE `form_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_fields_form_field_group_id_foreign` (`form_field_group_id`);

--
-- Indexes for table `form_field_groups`
--
ALTER TABLE `form_field_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_field_groups_form_id_foreign` (`form_id`);

--
-- Indexes for table `form_field_values`
--
ALTER TABLE `form_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_field_values_booking_id_foreign` (`booking_id`),
  ADD KEY `form_field_values_form_field_id_foreign` (`form_field_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venue_id` (`venue_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_location` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organizations_parent_organization_id_foreign` (`parent_organization_id`),
  ADD KEY `organizations_location_id_foreign` (`location_id`),
  ADD KEY `organizations_status_index` (`status`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `organization_venue`
--
ALTER TABLE `organization_venue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_organization_event_id_foreign` (`venue_id`),
  ADD KEY `event_organization_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `booking_id` (`booking_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `service_id_FK` (`service_id`);

--
-- Indexes for table `service_series`
--
ALTER TABLE `service_series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_series_parent_event_series_id_foreign` (`parent_event_series_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_status_index` (`status`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_roles_name_unique` (`name`);

--
-- Indexes for table `user_user_role`
--
ALTER TABLE `user_user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_user_role_user_id_foreign` (`user_id`),
  ADD KEY `user_user_role_user_role_id_foreign` (`user_role_id`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `events_slug_unique` (`slug`),
  ADD KEY `events_event_series_id_foreign` (`event_series_id`),
  ADD KEY `events_location_id_foreign` (`location_id`),
  ADD KEY `events_parent_event_id_foreign` (`parent_event_id`);

--
-- Indexes for table `wishlist_venues`
--
ALTER TABLE `wishlist_venues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_Id_wishlist` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `booking_options`
--
ALTER TABLE `booking_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `form_fields`
--
ALTER TABLE `form_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_field_groups`
--
ALTER TABLE `form_field_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_field_values`
--
ALTER TABLE `form_field_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `organization_venue`
--
ALTER TABLE `organization_venue`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `service_series`
--
ALTER TABLE `service_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_user_role`
--
ALTER TABLE `user_user_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `wishlist_venues`
--
ALTER TABLE `wishlist_venues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_booked_by_user_id_foreign` FOREIGN KEY (`booked_by_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_booking_option_id_foreign` FOREIGN KEY (`booking_option_id`) REFERENCES `booking_options` (`id`);

--
-- Constraints for table `booking_options`
--
ALTER TABLE `booking_options`
  ADD CONSTRAINT `booking_options_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `venues` (`id`),
  ADD CONSTRAINT `booking_options_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`);

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `landscaper_id` FOREIGN KEY (`landscaper_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `form_fields`
--
ALTER TABLE `form_fields`
  ADD CONSTRAINT `form_fields_form_field_group_id_foreign` FOREIGN KEY (`form_field_group_id`) REFERENCES `form_field_groups` (`id`);

--
-- Constraints for table `form_field_groups`
--
ALTER TABLE `form_field_groups`
  ADD CONSTRAINT `form_field_groups_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`);

--
-- Constraints for table `form_field_values`
--
ALTER TABLE `form_field_values`
  ADD CONSTRAINT `form_field_values_form_field_id_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `venue_id` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `user_id_location` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `organizations`
--
ALTER TABLE `organizations`
  ADD CONSTRAINT `organizations_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `organizations_parent_organization_id_foreign` FOREIGN KEY (`parent_organization_id`) REFERENCES `organizations` (`id`),
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `organization_venue`
--
ALTER TABLE `organization_venue`
  ADD CONSTRAINT `event_organization_event_id_foreign` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`),
  ADD CONSTRAINT `event_organization_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `service_id_FK` FOREIGN KEY (`service_id`) REFERENCES `venues` (`id`);

--
-- Constraints for table `service_series`
--
ALTER TABLE `service_series`
  ADD CONSTRAINT `event_series_parent_event_series_id_foreign` FOREIGN KEY (`parent_event_series_id`) REFERENCES `service_series` (`id`);

--
-- Constraints for table `user_user_role`
--
ALTER TABLE `user_user_role`
  ADD CONSTRAINT `user_user_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_user_role_user_role_id_foreign` FOREIGN KEY (`user_role_id`) REFERENCES `user_roles` (`id`);

--
-- Constraints for table `venues`
--
ALTER TABLE `venues`
  ADD CONSTRAINT `events_event_series_id_foreign` FOREIGN KEY (`event_series_id`) REFERENCES `service_series` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_parent_event_id_foreign` FOREIGN KEY (`parent_event_id`) REFERENCES `venues` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist_venues`
--
ALTER TABLE `wishlist_venues`
  ADD CONSTRAINT `user_Id_wishlist` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
