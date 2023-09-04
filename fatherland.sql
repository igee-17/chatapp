-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2023 at 01:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fatherland_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`) VALUES
(1, 'Super Admin', 'superadmin@example.com', NULL, '$2y$10$VM9sDpFspR/ONSH/iPY.vuymDhNETa1otaKu7x5oaT1SoljfeKKUi', NULL, '2023-08-18 06:59:26', '2023-08-18 06:59:26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blocked_users`
--

CREATE TABLE `blocked_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `blocked_user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `reciever_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chat_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `reciever_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment_likes`
--

CREATE TABLE `comment_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dynasties`
--

CREATE TABLE `dynasties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) NOT NULL,
  `notable_individual` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `cover_picture` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `reference_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dynasties`
--

INSERT INTO `dynasties` (`id`, `link`, `name`, `created_by`, `location`, `notable_individual`, `about`, `profile_picture`, `cover_picture`, `status`, `reference`, `reference_link`, `created_at`, `updated_at`) VALUES
(1, 'c09b4c37-3f67-4b55-85db-6abbc4b63a73', 'Ijebu-Ode Dynasty', 1, 'Ijebu', 'Femi Otedola', 'We are the ijebu-ode dynasty', '/images/1701005273_1692354315_jpeg', '/images/204117859_1692354315_jpeg', 'pending', '[\"\\/images\\/1278401231_1692354315_pdf\",\"\\/images\\/295144123_1692354315_jpg\"]', 'https://www.bing.com/search?q=how%20to%20add%20multiple%20monitors%20to%20your%20windows%2011%20pc%20site:microsoft.com&form=B00032&ocid=SettingsHAQ-BingIA&mkt=en-US', '2023-08-18 09:25:15', '2023-08-18 09:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `dynasty_records`
--

CREATE TABLE `dynasty_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lineage` text NOT NULL,
  `location` varchar(255) NOT NULL,
  `notable_individual` text NOT NULL,
  `about` text NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `cover_picture` varchar(255) DEFAULT NULL,
  `reference_link` text DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dynasty_user`
--

CREATE TABLE `dynasty_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dynasty_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dynasty_user`
--

INSERT INTO `dynasty_user` (`id`, `user_id`, `dynasty_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-08-18 09:25:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `privacy` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `families`
--

CREATE TABLE `families` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) NOT NULL,
  `current_location` varchar(255) NOT NULL,
  `notable_individual` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `cover_picture` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `reference_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invite_token` varchar(255) NOT NULL,
  `account_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `families`
--

INSERT INTO `families` (`id`, `link`, `name`, `created_by`, `location`, `current_location`, `notable_individual`, `about`, `profile_picture`, `cover_picture`, `status`, `reference`, `reference_link`, `created_at`, `updated_at`, `invite_token`, `account_type`) VALUES
(1, '449f10bf-8572-4876-a6bc-fbb62fd15998', 'Adeyemi\'s family', 1, 'ibadan,Oyo State', 'Lagos, Nigeria', 'Chief Olusegun Mimiko', 'We are one body everywhere and at everyone', '/images/1757368267_1692348186_png', '/images/754008027_1692352915_png', 'pending', NULL, 'https://youtu.be/DaF0EESznyI', '2023-08-18 07:17:18', '2023-08-18 09:01:55', '9c3858db-bb4d-47a7-86af-c045c42b7af4', 'public');

-- --------------------------------------------------------

--
-- Table structure for table `family_members`
--

CREATE TABLE `family_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `family_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `family_members`
--

INSERT INTO `family_members` (`id`, `family_id`, `member_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-08-18 07:17:18', '2023-08-18 07:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `forgot_passwords`
--

CREATE TABLE `forgot_passwords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expiry_date` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `friend_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `family_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dynasty_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `image`, `user_id`, `created_at`, `updated_at`, `family_id`, `dynasty_id`) VALUES
(1, '/images/1153817799_1692346638_jpg', NULL, '2023-08-18 07:17:18', '2023-08-18 07:17:18', 1, NULL),
(2, '/images/477533805_1692346638_png', NULL, '2023-08-18 07:17:18', '2023-08-18 07:17:18', 1, NULL),
(3, '/images/812682810_1692347062_png', NULL, '2023-08-18 07:24:22', '2023-08-18 07:24:22', 1, NULL),
(4, '/images/1127165223_1692347993_png', NULL, '2023-08-18 07:39:53', '2023-08-18 07:39:53', 1, NULL),
(5, '/images/1701005273_1692354315_jpeg', NULL, '2023-08-18 09:25:15', '2023-08-18 09:25:15', NULL, 1),
(6, '/images/204117859_1692354315_jpeg', NULL, '2023-08-18 09:25:15', '2023-08-18 09:25:15', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2023_05_18_131218_create_verify_users_table', 1),
(11, '2023_05_18_173327_create_forgot_passwords_table', 1),
(12, '2023_05_19_160818_create_friends_table', 1),
(13, '2023_05_19_175124_add_column_status_to_friends_table', 1),
(14, '2023_05_26_083641_create_posts_table', 1),
(15, '2023_06_03_052533_add_column_to_table', 1),
(16, '2023_06_03_053108_create_images_table', 1),
(17, '2023_06_03_053139_create_videos_table', 1),
(18, '2023_06_03_084354_add_column_to_posts_table', 1),
(19, '2023_06_05_131128_add_column_to_users_table', 1),
(20, '2023_06_05_140617_drop_column_from_table_users', 1),
(21, '2023_06_05_152551_add_new_column_to_table', 1),
(22, '2023_06_05_154530_create_galleries_table', 1),
(23, '2023_06_14_190650_create_likes_table', 1),
(24, '2023_06_16_180223_create_comments_table', 1),
(25, '2023_06_19_113248_create_comment_likes_table', 1),
(26, '2023_06_20_112640_create_chats_table', 1),
(27, '2023_06_20_113353_create_chat_messages_table', 1),
(28, '2023_07_03_140548_create_families_table', 1),
(29, '2023_07_03_145339_create_family_members_table', 1),
(30, '2023_07_04_153233_add_new_column_to_gallery_table', 1),
(31, '2023_07_05_113341_add_new_column_to_posts', 1),
(32, '2023_07_05_132820_create_user_families_table', 1),
(33, '2023_07_09_123235_create_dynasties_table', 1),
(34, '2023_07_09_123518_create_dynasty_user_table', 1),
(35, '2023_07_09_143501_add_new_column_dynasty_id_to_gallery_table', 1),
(36, '2023_07_18_131234_add_column_account_type_to_users_table', 1),
(37, '2023_07_19_121823_create_paystack_payments_table', 1),
(38, '2023_07_19_121843_create_subscriptions_table', 1),
(39, '2023_07_25_143308_add_email_column_to_table', 1),
(40, '2023_07_26_143409_add_slug_to_posts_table', 1),
(41, '2023_07_28_112939_create_dynasty_records_table', 1),
(42, '2023_07_30_092029_add_column_invite_links_to_table_family', 1),
(43, '2023_08_01_075009_create_report_posts_table', 1),
(44, '2023_08_01_135524_create_blocked_users_table', 1),
(45, '2023_08_03_072556_create_media_table', 1),
(46, '2023_08_04_084025_create_reposts_table', 1),
(47, '2023_08_04_125158_add_repost_id_to_posts_table', 1),
(48, '2023_08_10_111544_create_admins_table', 1),
(49, '2023_08_10_111559_create_roles_table', 1),
(50, '2023_08_10_111610_create_permissions_table', 1),
(51, '2023_08_10_112141_create_role_permission_table', 1),
(52, '2023_08_10_112718_add_column_to_admins_table', 1),
(53, '2023_08_14_080001_add_column_phone_number_to_table', 1),
(54, '2023_08_15_090750_add_column_status_to_user_families_table', 1),
(55, '2023_08_15_160134_add_column_account_type_to_families_table', 1),
(56, '2023_08_17_075946_create_events_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('526781f83f4ed979a8efbc7dd83b6ee5c2b2b72b5f3faad86e030b47bbc8ef7204433def5de776a9', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-08-18 07:16:45', '2023-08-18 07:16:45', '2024-08-18 08:16:45'),
('5f5457798764308085b87dab43a3d1d2edaefe270a37671621fc58b9a7bbcb21320a1905e0c6ca47', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-08-18 07:16:09', '2023-08-18 07:16:09', '2024-08-18 08:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Fameet Personal Access Client', 'GAlsgI9vHvOSHkh7uE7JRTDT0Nol75nzQ2S1Ra6f', NULL, 'http://localhost', 1, 0, 0, '2023-08-18 07:00:00', '2023-08-18 07:00:00'),
(2, NULL, 'Fameet Password Grant Client', '7Rd4AXZSmejbcOFEN88IQirUe2tRyfEsIpXe2HY3', 'users', 'http://localhost', 0, 1, 0, '2023-08-18 07:00:00', '2023-08-18 07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-08-18 07:00:00', '2023-08-18 07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
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
-- Table structure for table `paystack_payments`
--

CREATE TABLE `paystack_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` varchar(255) NOT NULL,
  `fatherland_reference` varchar(255) NOT NULL,
  `paystack_reference` varchar(255) NOT NULL,
  `paystack_response` varchar(255) NOT NULL,
  `verified_status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `images` text DEFAULT NULL,
  `videos` text DEFAULT NULL,
  `family_id` bigint(20) UNSIGNED DEFAULT NULL,
  `repost_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_posts`
--

CREATE TABLE `report_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reposts`
--

CREATE TABLE `reposts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '2023-08-18 06:59:25', '2023-08-18 06:59:25');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `permission` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` varchar(255) NOT NULL,
  `subscription_start_date` varchar(255) NOT NULL,
  `subscription_end_date` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  `professionLocation` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `cover_picture` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `plan_type` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `profession`, `education`, `location`, `about`, `university`, `professionLocation`, `profile_picture`, `cover_picture`, `account_type`, `plan_type`, `phone_number`, `date_of_birth`) VALUES
(1, 'Gani Adams', 'adams@gmail.com', '2023-08-18 07:16:45', '$2y$10$88ctnOpW5z3sdO2H8JiHLeW8BY2s/JI88AFx9lzy6A03sxr2Xwwvm', NULL, '2023-08-18 07:16:09', '2023-08-18 07:16:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'public', 'basic', '08080005600', '1989-10-23');

-- --------------------------------------------------------

--
-- Table structure for table `user_families`
--

CREATE TABLE `user_families` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `family_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_families`
--

INSERT INTO `user_families` (`id`, `user_id`, `family_id`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 1, '2023-08-18 07:17:18', NULL, 'accepted');

-- --------------------------------------------------------

--
-- Table structure for table `verify_users`
--

CREATE TABLE `verify_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `expiry_date` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `video` varchar(255) DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `admins_role_id_foreign` (`role_id`);

--
-- Indexes for table `blocked_users`
--
ALTER TABLE `blocked_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blocked_users_user_id_foreign` (`user_id`),
  ADD KEY `blocked_users_blocked_user_id_foreign` (`blocked_user_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chats_sender_id_foreign` (`sender_id`),
  ADD KEY `chats_reciever_id_foreign` (`reciever_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_messages_chat_id_foreign` (`chat_id`),
  ADD KEY `chat_messages_sender_id_foreign` (`sender_id`),
  ADD KEY `chat_messages_reciever_id_foreign` (`reciever_id`),
  ADD KEY `chat_messages_created_by_foreign` (`created_by`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_likes_user_id_foreign` (`user_id`),
  ADD KEY `comment_likes_comment_id_foreign` (`comment_id`);

--
-- Indexes for table `dynasties`
--
ALTER TABLE `dynasties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dynasties_link_unique` (`link`),
  ADD UNIQUE KEY `dynasties_name_unique` (`name`),
  ADD KEY `dynasties_created_by_foreign` (`created_by`);

--
-- Indexes for table `dynasty_records`
--
ALTER TABLE `dynasty_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dynasty_user`
--
ALTER TABLE `dynasty_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dynasty_user_user_id_foreign` (`user_id`),
  ADD KEY `dynasty_user_dynasty_id_foreign` (`dynasty_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_created_by_foreign` (`created_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `families`
--
ALTER TABLE `families`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `families_link_unique` (`link`),
  ADD KEY `families_created_by_foreign` (`created_by`);

--
-- Indexes for table `family_members`
--
ALTER TABLE `family_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `family_members_family_id_foreign` (`family_id`),
  ADD KEY `family_members_member_id_foreign` (`member_id`);

--
-- Indexes for table `forgot_passwords`
--
ALTER TABLE `forgot_passwords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friends_user_id_foreign` (`user_id`),
  ADD KEY `friends_friend_id_foreign` (`friend_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_user_id_foreign` (`user_id`),
  ADD KEY `galleries_family_id_foreign` (`family_id`),
  ADD KEY `galleries_dynasty_id_foreign` (`dynasty_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_post_id_foreign` (`post_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_user_id_foreign` (`user_id`),
  ADD KEY `likes_post_id_foreign` (`post_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `paystack_payments`
--
ALTER TABLE `paystack_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paystack_payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_family_id_foreign` (`family_id`),
  ADD KEY `posts_repost_id_foreign` (`repost_id`);

--
-- Indexes for table `report_posts`
--
ALTER TABLE `report_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_posts_user_id_foreign` (`user_id`),
  ADD KEY `report_posts_post_id_foreign` (`post_id`);

--
-- Indexes for table `reposts`
--
ALTER TABLE `reposts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reposts_user_id_foreign` (`user_id`),
  ADD KEY `reposts_post_id_foreign` (`post_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permission_role_id_foreign` (`role_id`),
  ADD KEY `role_permission_permission_foreign` (`permission`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_families`
--
ALTER TABLE `user_families`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_families_user_id_foreign` (`user_id`),
  ADD KEY `user_families_family_id_foreign` (`family_id`);

--
-- Indexes for table `verify_users`
--
ALTER TABLE `verify_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_post_id_foreign` (`post_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blocked_users`
--
ALTER TABLE `blocked_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment_likes`
--
ALTER TABLE `comment_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dynasties`
--
ALTER TABLE `dynasties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dynasty_records`
--
ALTER TABLE `dynasty_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dynasty_user`
--
ALTER TABLE `dynasty_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `families`
--
ALTER TABLE `families`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `family_members`
--
ALTER TABLE `family_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `forgot_passwords`
--
ALTER TABLE `forgot_passwords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paystack_payments`
--
ALTER TABLE `paystack_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_posts`
--
ALTER TABLE `report_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reposts`
--
ALTER TABLE `reposts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_families`
--
ALTER TABLE `user_families`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `verify_users`
--
ALTER TABLE `verify_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blocked_users`
--
ALTER TABLE `blocked_users`
  ADD CONSTRAINT `blocked_users_blocked_user_id_foreign` FOREIGN KEY (`blocked_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blocked_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_reciever_id_foreign` FOREIGN KEY (`reciever_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`),
  ADD CONSTRAINT `chat_messages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chat_messages_reciever_id_foreign` FOREIGN KEY (`reciever_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chat_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD CONSTRAINT `comment_likes_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `comment_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `dynasties`
--
ALTER TABLE `dynasties`
  ADD CONSTRAINT `dynasties_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `dynasty_user`
--
ALTER TABLE `dynasty_user`
  ADD CONSTRAINT `dynasty_user_dynasty_id_foreign` FOREIGN KEY (`dynasty_id`) REFERENCES `dynasties` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dynasty_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `families`
--
ALTER TABLE `families`
  ADD CONSTRAINT `families_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `family_members`
--
ALTER TABLE `family_members`
  ADD CONSTRAINT `family_members_family_id_foreign` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `family_members_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_friend_id_foreign` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friends_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_dynasty_id_foreign` FOREIGN KEY (`dynasty_id`) REFERENCES `dynasties` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `galleries_family_id_foreign` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `galleries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `paystack_payments`
--
ALTER TABLE `paystack_payments`
  ADD CONSTRAINT `paystack_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_family_id_foreign` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_repost_id_foreign` FOREIGN KEY (`repost_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `report_posts`
--
ALTER TABLE `report_posts`
  ADD CONSTRAINT `report_posts_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `report_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reposts`
--
ALTER TABLE `reposts`
  ADD CONSTRAINT `reposts_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reposts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_permission_foreign` FOREIGN KEY (`permission`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_families`
--
ALTER TABLE `user_families`
  ADD CONSTRAINT `user_families_family_id_foreign` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_families_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
