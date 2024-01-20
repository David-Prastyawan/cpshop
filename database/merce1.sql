-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 12, 2024 at 04:13 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `merce1`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Selamat Datang', 'selamat-datang', '/storage/photos/1/Banner/banner-wow.png', NULL, 'active', '2023-08-14 01:47:38', '2024-01-12 09:11:38');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(11, 'Cap panah merah', 'cap-panah-merah', 'active', '2024-01-11 08:32:36', '2024-01-11 08:32:36'),
(12, 'Cap kapal terbang', 'cap-kapal-terbang', 'active', '2024-01-11 08:34:46', '2024-01-11 08:34:46'),
(13, 'Bintang asia', 'bintang-asia', 'active', '2024-01-11 08:35:03', '2024-01-11 08:35:03'),
(14, 'Bunga matahari seed', 'bunga-matahari-seed', 'active', '2024-01-11 08:38:53', '2024-01-11 08:38:53');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(22, 1, 19, 2, 25000.00, 'new', 1, 25000.00, '2024-01-11 12:38:07', '2024-01-11 12:38:51'),
(23, 37, 20, 35, 15000.00, 'new', 1, 15000.00, '2024-01-12 00:10:15', '2024-01-12 00:12:39'),
(24, 1, 20, 35, 25000.00, 'new', 1, 25000.00, '2024-01-12 00:10:28', '2024-01-12 00:12:39');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(17, 'Bibit', 'bibit', '<p>Bibit tanaman buah dan sayur</p>', NULL, 1, NULL, NULL, 'active', '2024-01-11 08:26:36', '2024-01-11 08:26:36'),
(18, 'Sayur', 'sayur', '<p>Sayuran</p>', NULL, 1, NULL, NULL, 'active', '2024-01-11 08:26:57', '2024-01-11 08:26:57'),
(19, 'Buah', 'buah', '<p>Buah-buahan</p>', NULL, 1, NULL, NULL, 'active', '2024-01-11 08:27:12', '2024-01-11 08:27:12');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', '300.00', 'active', NULL, NULL),
(2, '111111', 'percent', '10.00', 'active', NULL, NULL),
(5, 'abcd', 'fixed', '250.00', 'active', '2020-08-17 20:54:58', '2020-08-17 20:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1),
(21, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(22, '2023_06_21_164432_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('6f07ee07-ffd4-4861-a264-a2f611e47b47', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/20\",\"fas\":\"fa-file-alt\"}', '2024-01-12 07:51:21', '2024-01-12 00:12:38', '2024-01-12 07:51:21'),
('c5e28c21-e80a-4938-9f8d-d86989537dc9', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/19\",\"fas\":\"fa-file-alt\"}', '2024-01-12 07:49:27', '2024-01-11 12:38:51', '2024-01-12 07:49:27');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `payment_method` enum('cod','paypal') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(19, 'ORD-KQJZUYWOPB', 2, 25000.00, 5, NULL, 30000.00, 1, 'cod', 'unpaid', 'delivered', 'user', 'bjir', 'user@gmail.com', '08121212121', 'Indonesia', '6587', 'kasihan, bantul DIY', NULL, '2024-01-11 12:38:50', '2024-01-12 00:03:19'),
(20, 'ORD-4KNH8SVMVY', 35, 40000.00, 6, NULL, 47000.00, 2, 'paypal', 'paid', 'delivered', 'joko', 'anwar', 'jokan@gmail.com', '085469651234', 'Indonesia', '6582', 'Muntilan, Kabupaten Magelang', NULL, '2024-01-12 00:12:37', '2024-01-12 07:48:31');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(10, 'Mengurangi Dampak Negatif Limbah Plastik Polybag terhadap Lingkungan', 'mengurangi-dampak-negatif-limbah-plastik-polybag-terhadap-lingkungan', '<p>Dampak negatif dari limbah plastik merugikan&nbsp; ekosistem<br></p>', '<p style=\"text-align: justify; \">Limbah plastik, terutama yang berasal dari penggunaan polybag, telah menjadi perhatian serius dalam konteks lingkungan global. Dampak negatif dari limbah plastik tidak hanya merugikan kehidupan laut dan ekosistem, tetapi juga memberikan kontribusi terhadap masalah perubahan iklim dan kerusakan lingkungan secara keseluruhan. Inilah mengapa penting untuk memahami dampak negatif limbah plastik polybag dan mencari solusi untuk menguranginya.</p><p style=\"text-align: justify;\">Polybag yang dibuang begitu saja dan tidak terkelola dengan baik dapat mencemari lingkungan, terutama di area perkotaan. Mereka bisa terbawa oleh angin dan air hujan, menciptakan pemandangan yang tidak indah dan merusak ekosistem sekitar. Satwa liar seperti burung, mamalia kecil, dan ikan sering kali terperangkap dalam atau memakan potongan-potongan polybag. Hal ini dapat menyebabkan cedera, kehilangan habitat, dan dalam kasus yang lebih serius, kematian.</p><p style=\"text-align: justify;\">Polybag yang mencemari perairan mengakibatkan kerusakan ekosistem laut. Mereka dapat merusak terumbu karang, mengganggu pergerakan ikan, dan menciptakan zona mati di perairan tertentu. Produksi dan pembuangan polybag berkontribusi terhadap emisi gas rumah kaca. Proses produksi plastik menggunakan bahan bakar fosil, sedangkan pembuangan yang tidak terkendali menyebabkan dekomposisi yang menghasilkan gas beracun.&nbsp;</p><p style=\"text-align: justify;\">Polybag sulit didaur ulang, dan sebagian besar akhirnya berakhir di tempat pembuangan sampah. Daur ulang yang tidak memadai menyebabkan penumpukan limbah plastik yang terus bertambah. Seiring waktu, polybag dapat melepaskan zat kimia berbahaya yang dapat merusak kesehatan manusia. Kehadiran mikroplastik dalam lingkungan juga dapat mencemari sumber air dan makanan.</p><p style=\"text-align: justify;\"><b>Solusi dan Tindakan:</b></p><p style=\"text-align: justify;\">Untuk mengatasi dampak negatif limbah plastik polybag, langkah-langkah perlu diambil. Inisiatif untuk mengurangi penggunaan polybag, menggantinya dengan bahan yang dapat terurai dengan mudah, dan meningkatkan kesadaran masyarakat tentang pentingnya daur ulang dapat menjadi langkah awal yang signifikan.</p><p style=\"text-align: justify;\">Sebagai penutup, pengurangan limbah plastik polybag memerlukan komitmen bersama dari pemerintah, industri, dan masyarakat. Melalui upaya kolektif, kita dapat melindungi lingkungan, mendukung keberlanjutan, dan mewariskan planet ini dengan lebih baik kepada generasi mendatang. Hanya dengan langkah-langkah konkret dan kesadaran yang tinggi, kita dapat menciptakan perubahan positif dalam pengelolaan limbah plastik dan melindungi kehidupan di Bumi.</p>', '<p>Kurangi limbah plastikmu, mari go green bersamaku</p>', '/storage/photos/1/Artikel/rubish.jpg', 'Edukasi,Limbah', 1, NULL, 1, 'active', '2024-01-11 12:31:03', '2024-01-12 06:41:44');
INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(12, 'Cara Membuat Pupuk Organik Cair', 'cara-membuat-pupuk-organik-cair', '<p><span style=\"color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Terdapat dua macam tipe pupuk organik cair yang dibuat melalui proses pengomposan.</span><br></p>', '<p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Terdapat dua macam tipe pupuk organik cair yang dibuat melalui proses pengomposan. Pertama adalah pupuk organik cair yang dibuat dengan cara melarutkan pupuk organik yang telah jadi atau setengah jadi ke dalam air. Jenis pupuk yang dilarutkan bisa berupa pupuk hijau, pupuk kandang, pupuk kompos atau campuran semuanya. Pupuk organik cair semacam ini karakteristiknya tidak jauh beda dengan pupuk organik padat, hanya saja wujudnya berupa cairan. Dalam bahasa lebih mudah, kira-kira seperti teh yang dicelupkan ke dalam air lalu airnya dijadikan pupuk.</p><p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Pupuk cair tipe ini suspensi larutannya kurang stabil dan mudah mengendap. Kita tidak bisa menyimpan pupuk tipe ini dalam jangka waktu lama. Setelah jadi biasanya harus langsung digunakan. Pengaplikasiannya dilakukan dengan cara menyiramkan pupuk pada permukaan tanah disekitar tanaman, tidak disemprotkan ke daun.</p><p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Kedua adalah pupuk organik cair yang dibuat dari bahan-bahan organik yang difermentasikan dalam kondisi anaerob dengan bantuan organisme hidup. Bahan bakunya dari material organik yang belum terkomposkan. Unsur hara yang terkandung dalam larutan pupuk cair tipe ini benar-benar berbentuk cair. Jadi larutannya lebih stabil. Bila dibiarkan tidak mengendap. Oleh karena itu, sifat dan karakteristiknya pun berbeda dengan pupuk cair yang dibuat dari pupuk padat yang dilarutkan ke dalam air. Tulisan ini bermaksud untuk membahas pupuk organik cair tipe yang kedua.</p><h2 style=\"text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; line-height: 42px; color: rgb(29, 33, 39); margin-right: 0px; margin-bottom: 5px; margin-left: 0px; font-size: 2.2em; letter-spacing: -1px;\">Sifat dan karakteristik pupuk organik cair</h2><p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Pupuk organik cair tidak bisa dijadikan pupuk utama dalam bercocok tanam. Sebaiknya gunakan pupuk organik padat sebagai pupuk utama/dasar. Pupuk organik padat akan tersimpan lebih lama dalam media tanam dan bisa menyediakan hara untuk jangka yang panjang. Sedangkan, nutrisi yang ada pada pupuk cair lebih rentan terbawa erosi. Namun di sisi lain, lebih mudah dicerna oleh tanaman.</p><p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Jenis pupuk cair lebih efektif dan efesien jika diaplikasikan pada daun, bunga dan batang dibanding pada media tanam (kecuali pada metode hidroponik). Pupuk organik cair bisa berfungsi sebagai perangsang tumbuh. Terutama saat tanaman mulai bertunas atau saat perubahan dari fase vegetatif ke generatif untuk merangsang pertumbuhan buah dan biji. Daun dan batang bisa menyerap secara langsung pupuk yang diberikan melalui stomata atau pori-pori yang ada pada permukaannya.</p><p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Pemberian pupuk organik cair lewat daun harus hati-hati. Jaga jangan sampai overdosis, karena bisa mematikan tanaman. Pemberian pupuk daun yang berlebih juga akan mengundang hama dan penyakit pada tanaman. Jadi, ketepatan takaran harus benar-benar diperhatikan untuk mendapatkan hasil maksimal.</p><p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Setiap tanaman mempunyai kapasitas dalam menyerap nutrisi sebagai makanannya. Secara teoritik, tanaman hanya sanggup menyerap unsur hara yang tersedia dalam tanah tidak lebih dari 2% per hari. Pada daun, meskipun kami belum menemukan angka persisnya, bisa diperkirakan jumlahnya tidak lebih dari 2%. Oleh karena itu pemberian pupuk organik cair pada daun harus diencerkan terlebih dahulu.</p><p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Karena sifatnya sebagai pupuk tambahan, pupuk organik cair sebaiknya kaya akan unsur hara mikro. Sementara unsur hara makro dipenuhi oleh pupuk utama lewat tanah, pupuk organik cair harus memberikan unsur hara mikro yang lebih. Untuk mendapatkan kandungan hara mikro, bisa dipilah dari bahan baku pupuk.</p><h2 style=\"text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; line-height: 42px; color: rgb(29, 33, 39); margin-right: 0px; margin-bottom: 5px; margin-left: 0px; font-size: 2.2em; letter-spacing: -1px;\">Cara membuat pupuk organik cair</h2><ol style=\"margin-bottom: 10px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"text-align: justify; line-height: 24px;\">Siapkan bahan-bahan berikut: 1 karung kotoran ayam, setengah karung dedak, 30 kg hijauan (jerami, gedebong pisang, daun leguminosa), 100 gram gula merah, 50 ml bioaktivator (EM4), air bersih secukupnya.</li><li style=\"text-align: justify; line-height: 24px;\">Siapkan tong plastik kedap udara ukuran 100 liter sebagai media pembuatan pupuk, satu meter selang aerotor transparan (diameter kira-kira 0,5 cm), botol plastik bekas akua ukuran 1 liter. Lubangi tutup tong seukuran selang aerotor.</li><li style=\"text-align: justify; line-height: 24px;\">Potong atau rajang bahan-bahan organik yang akan dijadikan bahan baku. Masukkan kedalam tong dan tambahkan air, komposisinya: 2 bagian bahan organik, 1 bagian air. Kemudian aduk-aduk hingga merata.</li><li style=\"text-align: justify; line-height: 24px;\">Larutkan bioaktivator seperti EM4 dan gula merah 5 liter air aduk hingga merata. Kemudian tambahkan larutan tersebut ke dalam tong yang berisi bahan baku pupuk.</li><li style=\"text-align: justify; line-height: 24px;\">Tutup tong dengan rapat, lalu masukan selang lewat tutup tong yang telah diberi lubang. Rekatkan tempat selang masuk sehingga tidak ada celah udara. Biarkan ujung selang yang lain masuk kedalam botol yang telah diberi air.</li><li style=\"text-align: justify; line-height: 24px;\">Pastikan benar-benar rapat, karena reaksinya akan berlangsung secara anaerob. Fungsi selang adalah untuk menyetabilkan suhu adonan dengan membuang gas yang dihasilkan tanpa harus ada udara dari luar masuk ke dalam tong.</li><li style=\"text-align: justify; line-height: 24px;\">Tunggu hingga 7-10 hari. Untuk mengecek tingkat kematangan, buka penutup tong cium bau adonan. Apabila wanginya seperti wangi tape, adonan sudah matang.</li><li style=\"text-align: justify; line-height: 24px;\">Pisahkan antara cairan dengan ampasnya dengan cara menyaringnya. Gunakan saringan kain. Ampas adonan bisa digunakan sebagai pupuk organik padat.</li><li style=\"text-align: justify; line-height: 24px;\">Masukkan cairan yang telah melewati penyaringan pada botol plastik atau kaca, tutup rapat. Pupuk organik cair telah jadi dan siap digunakan. Apabila dikemas baik, pupuk bisa digunakan sampai 6 bulan.</li></ol><p style=\"text-align: justify; line-height: 24px;\"><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA1kAAAJMCAYAAAAIbWyvAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAFiUAABYlAUlSJPAAAM3ESURBVHhe7N0HgBzlYTbgd3u/vd571Z167wgQvRgwxj0kzp/YjmM71TGxncS/sRP/cdyJKx1EMSCBEOq911M76XrvbXdve9//m72VkYSMDryy9k7vA6O7m5mdujsz737ffCOLCCAiIiIiIqK4kMd+EhERERERURwwZBEREREREcURQxYREREREVEcMWQRERERERHFEUMWERERERFRHDFkERERERERxRFDFhERERERURwxZBEREREREcURQxYREREREVEcMWQRERERERHFEUMWERERERFRHDFkERERERERxRFDFhERERERURwxZBEREREREcURQxYREREREVEcMWQRERERERHFEUMWERERERFRHDFkERERERERxRFDFhERERERURwxZBEREREREcWRLCLEficiIpqipFNdELaORgy0tKLFakTatFKUzChBmgxQjY9EREQUFwxZRESUYKTTUhh+jxselxMulwe+QAghmRIKfTKSjHqY9Gqo5DLIRECamLDovGjd/hqOrt+ADa35qPnYPbjr0dtQLaajn/B0iIiIro7VBYmIKMGIQBRxY6C1FgfWPY1ffvcxfOufv4q/f+zf8O1nduDtE70YcIYRCH/w7wjtI71ob6jFidNtaB+wwy36SfGLiIgonhiyiIgogQQQ8Iyg/9xOHN62He9sOo2TIzL4UtKQnWeEqqsBg21NaBwZhTsY+gABSQpkIfG/ByG/E06XFx5/MPp6VucgIqJ4Y8giIqLEEfbCZ+9B2/HNOLD7IHaftsOTOx/TV9+N++9ZicXJQST5LRh12eEPh6IBKRIKwm8fgaW/C52tzWhpbkZzcxvaO/ox4vbBE4qMB6lICAp5BGoF3lvNMOiGzzmIzo42NLe0oLW1Vby+A70jNlh8YrCYQDjkhd9jhaVvAMMjVozY7bD0tKC3rREtYvwu0X/U6YJXTG48vIUQEqHOMzaA/p42NDY1oVmM19rWhrb2DrR09qF3eAx2TxChD1EqR0REiYv3ZBERUcKIeEQw6jiGLc//GL876McZ72w88qU/x91LijA7PQK7CCdBrRGqjGxkpKZAq1IiJALWwNG3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ohvE1UqylixdittvvwPz5s6B0WiM9aVEIFUtkxokOX3mNHbv3o2dO3bCarXGho5LS0vDvffdjyWLF6OiojzWlxLVhX169MhhbN26FYePHIXdbo8NHceSrGuPJVlEdK0wZBHdIK4WsgqLilFeUYHcnGxoxMUfJQ6p5UC9Xoee3l40NjWhtbkFHo8nNnScXm/AtOoaFBTkIz0tNdaXEtWFfdolLuzr6+uv2JgJQ9a1x5BFRNcKQxbRDeJqIUv6Vl2j1UKtUkW/ZafEIl2USy0Ger3eaDPu4XA4NmScNFyr1Yn9qIJSqYz1pUQm7TOpRUGv13PFZvkZsq49hiwiulYYsohuEFcLWUSUWBiyrj2GLCK6VtjwBRERERERURwxZBEREREREcURQxYREREREVEc8Z4sohvE1e7J0ul0MBgM0Z9Swxc8NCQWqZEEn9cLl8sFt9uDUDgUGzJOoVDAaJT2nz7aiAn3X+KT9qnUSqTT6Yo2fnF5Yya8J+va4z1ZRHStMGQR3SCuFrKmT5+OxYsXY/bs2VCpVNEW7CgxSBfjer0ejQ2NOHb0KGpP1sLhdMaGjjObk7B06VLMmjUbRUVF0ZYIeXhPXBf26ZkzZ3Hg4CE01J8X4dkVGzqOIevaY8giomuFIYvoBnG1kHXzzTfjoYcexMqVN0UfRixdpFNikC7IpdIpKWBJ+/Ad0Y2OjsaGjsvMzMQjjzyCW2+9FTNmzEAoFGLISmAX9umu3bvx5ptvYt/efRgbs8WGjmPIuvYYsojoWmHIIrpBXC1kSRcR0sWEdFEhXVxQ4tm/fz/Wrn0DL730MgYHB2N9x+Xm5uLzn/887rvvPsyfPz/WlxLdpk2bxP58KfrZlD6jF2PIuvYYsojoWmHDF0RERERERHHEkEVERERERBRHDFlERERERERxxJBFREREREQURwxZREREREREccSQRUREREREFEcMWURERERERHHEkEVERERERBRHDFlERERERERxxJBFREREREQURwxZREREREREccSQRUREREREFEcMWURERERERHHEkEVERERERBRHDFlERERERERxxJBFREREREQURwxZREREREREccSQRUREREREFEcMWURERERERHHEkEVERERERBRHDFlERERERERxxJBFREREREQURwxZREREREREccSQRUREREREFEcMWURERERERHHEkEVERERERBRHDFlERERERERxxJBFREREREQURwxZREREREREccSQRUREREREFEcMWURERERERHHEkEVERERERBRHDFlERERERERxxJBFREREREQURwxZREREREREccSQRUREREREFEcMWURERERERHHEkEVERERERBRHDFlERERERERxxJBFREREREQURwxZREREREREccSQRUREREREFEcMWURERERERHHEkEVERERERBRHDFlERERERERxxJBFREREREQURwxZREREREREccSQRUREREREFEcMWURERERERHHEkEVERERERBRHDFlERERERERxxJBFREREREQURwxZREREREREccSQRUREREREFEcMWURERERERHHEkEVERERERBRHDFlERERERERxxJBFREREREQURwxZREREREREccSQRUREREREFEcMWURERERERHEkiwix34loCrNYLNi4cSPWrFmDzZs3x/q+a3pNDRbMn4fS0lJotdpYX0ok7e0dOFt3FqfPnIXT6Yz1HWdOSsLSpUswraoKOTk5sb6U6BoaG3Hy5Ck0NTXB7fHE+o4rLCzEY489htWrV6OysjLWl+Kpvb0du3btwuOPP46Ojo5Y33EpKSnRbf/oo4/i/vvvj/UlIpoYhiyiG8TVQpY5ORkpaelQ6wyQyWWiT3h8AF13MvGfXKGAc8yOMcsonA47QqFQbOg4lVqF9IxM6E1JUGm0iESk/cfDe6K6sE8dY2Owjo7C43S8Z58yZF17DFlEdK0wZBHdIK4WssrnLcT0lbehaNYSqLVqRELe2BC63hRKBfRJZnSfrsW53dtw9sgBuOxjsaHjjCmpmHPrHSidvxJZJVUIB10iYzEoJ6oL+7Sl9hhO79gifh6BR4TnizFkXXsMWUR0rTBkEd0grhayZty0Govu/xhqbroTGp0WQb87NoSuN4VSOX5Bfng/jr29Fse2rIfdMhobOs6ckYllH/0UZq2+F4Uz5iHocyIcCsaGUqJRKFUwJptxZtd2HHjjJZzftwuuMWts6DiGrGuPIYuIrhWGLKIbxNVC1qxb7sTyhz+F2bffA7VWh4D30vtD6PqRqpVpDEY0Ht6HI+tfx9H1b8A+OhwbOi45MxsrP/Eo5t/9AErnLoDPJYWsS6ufUeIYD84m1G7diD0vP8eQ9Ufy+Xzo6+uF3+cXVzZSdeeJ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VvqkYCiFwenTp+POO+7Avffdj+kzpkOjUUfv3yKiqYkhi4iIiCad5ORkPPjgg/jc5z4X/Sn9nYgMBgOWLFmChz76UXz04YeRm5vNhi6IbgBs+ILoBsGGL4gSBxu++ON5PB40NzdHfw4PD2PdunXRn4lEau1TKsVatWoVFi1ahOrq6mhDF6wmSDT1MWQR3SAYsogSB0NWfNntdhw+fDj6M5FILR/qdDrMmzcPGRkZ0Gq1sSFENNUxZBHdIBiyiBIHQ1Z8SQ8ddrlc1+Xhw+9HusSSSq30en30njGWYBHdOPhpJyIiokntQuMSUsuDidSlpqZG7xVjFUGiGw8/8URERERERHHEkEVERERERBRHDFlERERERERxxJBFREREREQURwxZREREREREccSQRUREREREFEcMWURERERERHHEkEVERERERBRHDFlERERERERxxJBFREREREQURwxZREREREREccSQRUREREREFEcMWURERERERHHEkEVERERERBRHDFlERERERERxxJBFREREREQURwxZREREREREccSQRUREREREFEcMWURERERERHHEkEVERERERBRHDFlERERERERxxJBFREREREQURwxZREREREREccSQRUREREREFEcMWfSHRcIIh0MIhUQXjiASifUnIiIiIqI/iCGLrkwErEjQC5/HBYfTBY8/hIAIWkRERERE9P4YsugKAgh6h2Ft3o2tb6zBj37+Al7a1YDzvY7Y8PgJBfzwukWQczjh8vjgD0klZiHR3/f7/h6fHyLyif9CCPrE3w4rHC4vPIGQ6C/y4Pik/rCIeG1IzMfjhl1Mz+32wh8ITuy1REREREQfEEPWjUAqlQoFEfD74feJICN+BgIiSIXCEJnmvUEjLIY7+zF0dhM2v/EynnhyHd4+3om2EY/IKxGEg2K4X0xHmpbUicASFBOSCro+aGhxWwYw0HgKp2tPo769HwNOMe2wE/ahDnScPoWTJxrQ1jcKh1R1ES5Y+9vQXHscJ091oH3AIfqLxY1N68rEuod9CHiG0d/ZjLraszjX2It+iwt+MfSDLi8RERER0dUwZE1xUvlPOOiF323D0OAA+vr70d8/gOERCyxOD5yB8XB0sXDAC59NhJLG87A7A9DlVGLanApk56UgHPLDMzYE63BfdFpSNzxig02EI79031ZsGhMhjd17/B1s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Zj08vgB5wQA+t8Msz2bCLMXI6DQTI3EyUQ9lReXUlIQota4phtMEqllwxhROdAhndAJ3IoPdcXU+ry/LH/Bn183adtaFhN/YDibyvGabec06Z99nlR2JuTlNkM5sz4DbRKu5z1rzH5j+ujGHzJit76nXBHJ2nc328frNel63LiIiIiLy46fIutFlw8e8ADcRZO2Nsv721G7tWbG+zt7MC3TzWvyNl+PmCyuirj1+dZpsWM3cslObF/s2+9X5WPdZgfX6863lZZ9nTT8z76t7wd4836tfX71lA82ahzWd9djM49nnXp2x+dN69XlOx9VQunr/27kaUNcvK/s8a3lvep71hbVOM9OYmVpDsFsXGK5dTtOSFaycV0ziwqts+9bf8qe//yW+9KVH+faOEVq9a1l1333cdksTc4pMFFl7mF6fz8ztjfUz831jO5j7Xl+37HXFrg4kO47Xt2d2u1l3Ze9+m+mvG7NzZt7Zqc192e9zdh5X10VEREREfvwUWSJv4fAEyG9Yw/I7NnDvPcspT7Rz+dArPP/M87zw/EFO9oVwND3Mgx95hHtuW8TsYiuyVDQiIiIicpUiS+QHmP8tbH7KF9/BXf/5C/zBV/+JR7/7BE88cfX23a98kb//nQf4yC2lNBS95aLIIiIiInLTU2SJ/ABrr5QDd6CAgqpZzG6az/yFC1i4cOHVW9NsGmcVU5rnxqs9WCIiIiLyFoosERERERGRHFJkiYiIiIiI5JAiS0REREREJIcUWSIiIiIiIjmkyBIREREREckhRZaIiIiIiEgOKbJERERERERySJElIiIiIiKSQ4osERERERGRHFJkiYiIiIiI5JAiS0REREREJIcUWSIiIiIiIjmkyBIREREREckhRZaIiIiIiEgOKbJERERERERySJElIiIiIiKSQ4osERERERGRHFJkiYiIiIiI5JAiS0REREREJIcUWSIiIiIiIjmkyBIREREREckhRZaIiIiIiEgOKbJERERERERySJElIiIiIiKSQ4osERERERGRHFJkiYiIiIiI5JAiS0REREREJIcUWSIiIiIiIjmkyBIREREREckhRZaIiIiIiEgOKbJERERERERySJElIiIiIiKSQ4osERERERGRHFJkiYiIiIiI5JAiS0REREREJIcUWSIiIiIiIjmkyBIREREREckhRZaIiIiIiEgOKbJERERERERySJElIiIiIiKSQ4osERERERGRHFJkiYiIiIiI5JAiS0REREREJIcUWSIiIiIiIjmkyBIREREREckhRZaIiIiIiEgOKbJERERERERySJElIiIiIiKSQ4osERERERGRHFJkiYiIiIiI5JAiS0TexG6343DYceqmm24/wpsNpxMc9szM/3kiInIjsWWMmc9F5AY2MjLCxo0befzxx9m8efPMvdcsnVXG+qZaVjSU43M5SaTTM4+ISK457DYCXhuHWvvYdqqT051DTMcSM49eVVdXxxe+8AU2bNhAY2PjzL0iIvJuoMgSuUn8c5EV8LjJ93vwu53YbLaZe0XkR8Vuh6lonLHpGJF4kvRbfh0rskRE3r0UWSI3iX8usqywUlqJ/HhZv4Df6dewIktE5N1L78kSkSzrhZ71N+m66abbj++mv+cUEbkxKbJERERERERySJElIiIiIiKSQ3pPlshNwnpPlvVerG9961vZj9ap2nWCC5GfTOl0mpqaGn77t387+56sefPmzTwiIiLvBooskZvE6Ogor7zyCt/4xjfYtGkTwWAQh8Mx86iI/CSJRCKUlZXxu7/7u9x99900NDTMPCIiIu8GiiyRm0Q0GuXSpUucOHGClpYWvF6v9mSJ/IRKJBL4/X7uvPNO6uvrKSwsnHlERETeDRRZIiIiIiIiOaQTX4iIiIiIiOSQIktERERERCSHFFkiIiIiIiI5pMgSERERERHJIUWWiIiIiIhIDimyREREREREckiRJSIiIiIikkOKLBERERERkRxSZImIiIiIiOSQIktERERERCSHFFkiIiIiIiI5pMgSERERERHJIUWWiIiIiIhIDimyREREREREckiRJSIiIiIikkOKLBERERERkRxSZImIiIiIiOSQIktERERERCSHFFkiIiIiIiI5ZMsYM5+LiMgNJD7WxcRgDx2DTpzF5RRVlVHic+J22LDbZib6kciQTsVJTQ/Q325u/RHiJfVUVRVRlW8jMnqFzr5JBqfslFVVUVFSQFHIP/NcERGRdz9Flojc8NKpFPHINOFwmEgsRtruwmG3m5spDfMjMJ1Ok0qbH4VpJy6/H1/Ah8/jwGke/5G2yI/Y2IUdtB3dxZYTboILV7PgjjUsK/OSn123mYn+PTIp0skE0fA08ZTdbFcPwTwvTod5KD5BuPcoB7Yc4eChQaaa72H9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VVI0dYVL51o51z5JtPZWFs4uZ0nV1VPVi4iIyDWKLBG54YXDYS6eO8+ly5fpHxwwjeTG5/fh97gImIiajKYYjSaJxWI0z5/PkiWLKSgsxOnUpXVFRETkX0+RJSI3vJGREV5+eTM7duzk9JkzJrK8OBwO7NZp2K0TOZgfg/FEkumpCT74yPv5qU/+FNW1tXi81qV8RURERP51FFkicsOz9mSdP3+etrY2env7sJvAuv7iupZ0Jk08FmPxokWsXLGC/MIC7ckSERGRfxNFloiIiIiISA7pFO4iIiIiIiI5pMgSERERERHJIUWWiIiIiIhIDimyREREREREckiRJSIiIiIikkOKLBERERERkRxSZImIiIiIiOSQIktERERERCSHFFkiIiIiIiI5pMgSERERERHJIUWWiIiIiIhIDimyREREREREckiRJSIiIiIikkOKLBERERERkRxSZImIiIiIiOSQIktERERERCSHFFkiIiIiIiI5pMgSERERERHJIUWWiIiIiIhIDimyREREREREckiRJSIiIiIikkOKLBERERERkRxSZImIiIiIiOSQIktERERERCSHFFkiIiIiIiI5pMgSERERERHJIUWWiIiIiIhIDimyREREREREckiRJSIiIiIikkOKLBERERERkRxSZImIiIiIiOSQIktERERERCSHFFkiIiIiIiI5pMgSERERERHJIUWWiIiIiIhIDimyREREREREckiRJSIiIiIikjPw/wM6W7j6mtGzNgAAAABJRU5ErkJggg==\" data-filename=\"pembuatan pupuk cair.png\" style=\"width: 857px;\"></p><p style=\"text-align: justify; line-height: 24px;\"><span style=\"color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Secara sederhana bisa dikatakan, untuk membuat pupuk perangsang daun gunakan sumber bahan organik dari jenis daun-daunan. Sedangkan untuk membuat pupuk perangsang buah gunakan bahan organik dari sisa limbah buah seperti sekam padi atau kulit buah-buahan.</span><br></p>', '<p><span style=\"color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Pupuk organik cair semacam ini karakteristiknya tidak jauh beda dengan pupuk organik padat, hanya saja wujudnya berupa cairan. Dalam bahasa lebih mudah, kira-kira seperti teh yang dicelupkan ke dalam air lalu airnya dijadikan pupuk.</span><br></p>', '/storage/photos/1/Artikel/pupuk cair.jpg', 'Edukasi,Pertanian', 10, NULL, 1, 'active', '2024-01-12 06:35:24', '2024-01-12 06:42:08');
INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(15, 'Pemanfaatan Limbah Kotoran Ternak Sapi Sebagai Sumber Pupuk Organik Ramah Lingkungan', 'pemanfaatan-limbah-kotoran-ternak-sapi-sebagai-sumber-pupuk-organik-ramah-lingkungan', '<p><span style=\"color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Penggunaan pupuk kompos/organik pada lahan pertanian mampu menjaga kesuburan tanah</span><br></p>', '<p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Teknologi Pertanian ramah lingkungan adalah teknologi yang tidak merusak lingkungan dan tetap menghasilkan produktivitas tinggi yang mengedepankan keamanan pangan bagi masyarakat. Emisi Gas Rumah Kaca yang menyebabkan terjadinya pemanasaan global dan berdampak langsung dan &nbsp;tidak langsung terhadap sytem pertanian. Pemanasan global akan menyebabkan perubahan iklim, perubahan pola curah hujan, banjir dan kekeringan bergeser polanya yang pada gilirannya merugikan usahatani.</p><p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Secara tioritis pemanasan global terjadi akibat terakumulasinya emisi Gas Rumah Kaca (GRK) seperti karbondioksida (CO2) dan metana (NH4) di langit yang dihasilkan oleh&nbsp; berbgai aktiviats manusia&nbsp; termasuk aktivitas pertanian sehinga Gas Rumah Kaca (GRK) yang naik ke langit terhalang dan terpantul kembali ke bumi menyebabkan panas yang dirasakan seluruh mahluk dipermukaan bumi semakin tinggi</p><p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Untuk menghindari tersebut maka teknologi yang mengurangi produksi CO2 dan NH4 harus terus dikembangkan oleh seleruh petani. Beberapa teknologi yang sudah terbukti mengurangi emisi Gas Rumah Kaca(GRK) &nbsp;adalah dengan pemnfaatan limbah kotoran ternak sapi menjadi pupuk organik.&nbsp; Penggunaan pupuk kompos/organik pada lahan pertanian mampu menjaga kesuburan tanah dan bermanfaat bagi peningkatan produksi pertanian baik kualitas maupun kuantitas, mengurangi pencemaran lingkungan, dan meningkatkan kualitas lahan secara berkelanjutan.</p><p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><span style=\"font-weight: 700;\">K</span><span style=\"font-weight: 700;\">eunggulan</span><span style=\"font-weight: 700;\">&nbsp;Pemanfaatan Limbah&nbsp;</span><span style=\"font-weight: 700;\">&nbsp;kompos</span><span style=\"font-weight: 700;\">/organik</span></p><ul style=\"margin-bottom: 10px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"text-align: justify; line-height: 24px;\">Hasil panen lebih tahan disimpan, lebih berat, lebih segar, dan lebih enak.</li><li style=\"text-align: justify; line-height: 24px;\">Mengandung hormon dan vitamin bagi tanaman</li><li style=\"text-align: justify; line-height: 24px;\">Menghemat biaya kelola limbah,</li><li style=\"text-align: justify; line-height: 24px;\">Mengurangi volume/ukuran limbah,</li><li style=\"text-align: justify; line-height: 24px;\">Memiliki nilai jual yang lebih tinggi dari pada bahan asalnya&nbsp;</li><li style=\"text-align: justify; line-height: 24px;\">Mengurangi polusi udara</li></ul><p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><span style=\"font-weight: 700;\">Tahapan&nbsp;</span><span style=\"font-weight: 700;\">&nbsp;dalam Pembuatan&nbsp;</span><span style=\"font-weight: 700;\">Limbah Kotoran Ternak Sapi Menjadi&nbsp;</span><span style=\"font-weight: 700;\">Pupuk Kompos</span><span style=\"font-weight: 700;\">/Organik</span></p><p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><span style=\"font-weight: 700;\">Bahan</span></p><ul style=\"margin-bottom: 10px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"text-align: justify; line-height: 24px;\">Kotoran ternak sapi 80 – 83 %</li><li style=\"text-align: justify; line-height: 24px;\">Serbuk gergaji(sekam, jerami padi dll) 5%</li><li style=\"text-align: justify; line-height: 24px;\">Stardec 0,25%</li><li style=\"text-align: justify; line-height: 24px;\">Abu sekam 10 %</li><li style=\"text-align: justify; line-height: 24px;\">Kapur 2 %</li></ul><p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;</p><ol style=\"margin-bottom: 10px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"text-align: justify; line-height: 24px;\">Kotoran sapi (feses dan urin) dikumpulkan dan ditiriskan selama satu minggu untuk mengurangi kadar airnya (± 60%).</li><li style=\"text-align: justify; line-height: 24px;\">Kotoran sapi yang sudah ditiriskan tersebut kemudian dipindahkan ke petak pertama. Di tempat tersebut dilakukan &nbsp; &nbsp; &nbsp; &nbsp;</li><li style=\"text-align: justify; line-height: 24px;\">pencampuran bahan-bahan organik seperti ampas gergaji, abu sekam, kapur dan dekomposer .</li><li style=\"text-align: justify; line-height: 24px;\">Sebelum bahan-bahan organik dan dekomposer dicampurkan pada kotoran sapi, sebaiknya keempat bahan organik tersebut (ampas gergaji, abu sekam, kapur dan stardec) dicampur terlebih dahulu, agar merata, dan dicampur merata pada kotoran sapi yang telah disiapkan pada tempat pertama.</li><li style=\"text-align: justify; line-height: 24px;\">Untuk setiap 1 ton (1000 kg) kotoran ternak bahan organik yang dicampurkan adalah 50 kg serbuk gergaji, 100 kg abu sekam, 20 kg kapur dan 2,5 kg stardec.</li><li style=\"text-align: justify; line-height: 24px;\">Setelah seminggu dilakukan pembalikan dan dipindahkan ke lokasi kedua, dibiarkan selama seminggu. Setelah seminggu dipindahkan ke lokasi ke 3 dan seterusnya sampai berada dipetak keempat dan diperam selama satu minggu.</li><li style=\"text-align: justify; line-height: 24px;\">Pada minggu keempat kompos sudah jadi dan untuk mendapatkan bentuk yang seragam dilakukan penyaringan atau diayak untuk memisahkannya dari kerikil atau potongan kayu dan lainnya. Selanjutnya kompos siap untuk diaplikasikan pada lahan atau tanaman</li></ol><p style=\"text-align: justify; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(119, 119, 119); line-height: 24px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><span style=\"font-weight: 700;\">Ciri Kompos Matang</span></p><ul style=\"margin-bottom: 10px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"text-align: justify; line-height: 24px;\">Berwana coklat kehitam-hitaman<span style=\"font-weight: 700;\">.</span></li><li style=\"text-align: justify; line-height: 24px;\">Tidak berbau busuk.</li><li style=\"text-align: justify; line-height: 24px;\">Tekstur kompos, sedikit berserat halus<span style=\"font-weight: 700;\">.</span></li><li style=\"text-align: justify; line-height: 24px;\">Kandungan air apabila dikepal kuat tidak menjadi bergumpal keras ketika kepalannya dibuka juga tidak terurai terlepas seperti pasir kering.</li><li style=\"text-align: justify; line-height: 24px;\">Mengandung hara yang tersedia bagi tanaman;</li><li style=\"text-align: justify; line-height: 24px;\">Kemampuan mengikat air tinggi.</li></ul>', '<p><span style=\"color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Secara tioritis pemanasan global terjadi akibat terakumulasinya emisi Gas Rumah Kaca (GRK) seperti karbondioksida (CO2) dan metana (NH4) di langit yang dihasilkan oleh&nbsp; berbgai aktiviats manusia&nbsp; termasuk aktivitas pertanian sehinga Gas Rumah Kaca (GRK) yang naik ke langit terhalang dan terpantul kembali ke bumi menyebabkan panas yang dirasakan seluruh mahluk dipermukaan bumi semakin tinggi</span><br></p>', '/storage/photos/1/Artikel/pupuk-limbah.jpg', 'Edukasi,Pertanian,Limbah', 10, NULL, 1, 'active', '2024-01-12 07:38:48', '2024-01-12 07:40:05');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pemanfaatan limbah pertanian', 'pemanfaatan-limbah-pertanian', 'active', '2024-01-11 12:07:25', '2024-01-11 12:07:25'),
(7, 'Pengelolaan hama dan penyakit', 'pengelolaan-hama-dan-penyakit', 'active', '2024-01-11 12:08:35', '2024-01-11 12:08:35'),
(9, 'Teknologi pertanian', 'teknologi-pertanian', 'active', '2024-01-11 12:09:34', '2024-01-11 12:09:34'),
(10, 'Edukasi pertanian', 'edukasi-pertanian', 'active', '2024-01-11 12:10:05', '2024-01-11 12:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Edukasi', 'edukasi', 'active', '2024-01-11 12:11:18', '2024-01-11 12:11:18'),
(6, 'Pertanian', 'pertanian', 'active', '2024-01-11 12:11:31', '2024-01-11 12:11:31'),
(7, 'Hama', 'hama', 'active', '2024-01-11 12:11:51', '2024-01-11 12:11:51'),
(8, 'Tanah', 'tanah', 'active', '2024-01-11 12:11:58', '2024-01-11 12:11:58'),
(9, 'Limbah', 'limbah', 'active', '2024-01-11 12:12:06', '2024-01-11 12:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int NOT NULL DEFAULT '1',
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot','laris') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint UNSIGNED DEFAULT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Buah Melon', 'buah-melon', '<p>Temukan kelezatan melon manis segar yang ditanam dengan penuh perhatian langsung dari kebun kami.<br></p>', '<p><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 15px;\">Buah melon mengandung berbagai nutrisi yang dibutuhkan oleh tubuh, misalnya kalori, karbohidrat, serat, protein, magnesium, dan potassium. Melon juga kaya akan vitamin C, vitamin B6, vitamin K, folat, dan yang tak kalah penting ialah melon tidak mengandung lemak sama sekali.</span><br></p>', '/storage/photos/1/Produk/melon.jpg', 38, '', 'default', 'active', 25000.00, NULL, 0, 19, NULL, 11, '2024-01-11 11:47:00', '2024-01-12 07:48:31'),
(37, 'Buah Pisang', 'buah-pisang', '<p>pisang</p>', '<p>pisang</p>', '/storage/photos/1/Produk/pisang.jpg', 40, '', 'default', 'active', 15000.00, NULL, 0, 19, NULL, 11, '2024-01-11 12:36:52', '2024-01-12 07:48:31'),
(41, 'Sayur Brokoli', 'sayur-brokoli', '<p>Brokoli</p>', '<p>Brokoli<br></p>', '/storage/photos/1/Produk/sayur brokoli.jpg', 25, '', 'default', 'active', 13500.00, NULL, 0, 18, NULL, 12, '2024-01-12 00:47:56', '2024-01-12 00:47:56'),
(42, 'Sayur Kangkung', 'sayur-kangkung', '<p>Sayur kangkung</p>', '<p>Sayur kangkung</p>', '/storage/photos/1/Produk/sayur kangkung.jpg', 26, '', 'default', 'active', 4000.00, NULL, 0, 18, NULL, 11, '2024-01-12 01:15:58', '2024-01-12 01:15:58'),
(43, 'Sayur Kacang Panjang', 'sayur-kacang-panjang', '<blockquote>Sayur Kacang Panjang</blockquote>', '<p>Sayur Kacang Panjang<br></p>', '/storage/photos/1/Produk/kacang panjang.jpg', 28, '', 'default', 'active', 4500.00, NULL, 0, 18, NULL, 13, '2024-01-12 01:18:30', '2024-01-12 01:18:30'),
(44, 'Sayur Sawi', 'sayur-sawi', '<p>Sayur Sawi<br></p>', '<p>Sayur Sawi<br></p>', '/storage/photos/1/Produk/sayur sawi.jpg', 14, '', 'default', 'active', 6000.00, NULL, 0, 18, NULL, 11, '2024-01-12 06:23:01', '2024-01-12 06:23:01'),
(45, 'Bibit Tanaman Durian', 'bibit-tanaman-durian', '<p>Bibit Tanaman Durian<br></p>', '<p>Bibit Tanaman Durian<br></p>', '/storage/photos/1/Produk/bibit pohon durian.png', 10, '', 'default', 'active', 75000.00, NULL, 0, 17, NULL, 13, '2024-01-12 06:45:53', '2024-01-12 06:45:53'),
(46, 'Bibit Tanaman Mangga', 'bibit-tanaman-mangga', '<p>Bibit Tanaman Mangga</p>', '<p>Bibit Tanaman Mangga<br></p>', '/storage/photos/1/Produk/bibit mangga.jpg', 15, '', 'default', 'active', 47500.00, NULL, 0, 17, NULL, 14, '2024-01-12 06:47:38', '2024-01-12 06:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `rate` tinyint NOT NULL DEFAULT '0',
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 5, 'nice product', 'active', '2020-08-15 07:44:05', '2020-08-15 07:44:05'),
(2, 2, NULL, 5, 'nice', 'active', '2020-08-17 21:08:14', '2020-08-17 21:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Cpshop atau capstone project shop adalah online marketplace yang menjual hasil pertanian dari desa kateki kebonrejo, magelang. Cpshop menjual beberapa hasil pertanian seperti bibit tanaman, buah dan sayur yang di tanam sendiri oleh para petani dari desa kateki dengan bibit tanaman berkualitas dan hasil panen yang unggul.', 'Cpshop berlokasi dan beroperasi langsung dari tempat pengelolaan hasil pertanian yang akan di distribusikan oleh kelompok tani desa Kateki, Kebonrejo, Kab. Magelang', '/storage/photos/1/logo-CP (Custom).png', '/storage/photos/1/Banner/logo-CP1.png', 'Ds. Kateki, Kebonrejo - Kab. Magelang', '+62-821-582-222', 'cpshop@gmail.com', NULL, '2024-01-12 08:42:42');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Magelang Kota', '10000.00', 'active', '2020-08-14 04:22:17', '2024-01-11 07:06:36'),
(2, 'Bandongan', '7000.00', 'active', '2020-08-14 04:22:41', '2024-01-11 07:34:51'),
(3, 'Candimulyo', '8500.00', 'active', '2020-08-15 06:54:04', '2024-01-11 07:35:16'),
(4, 'Grabag', '5000.00', 'active', '2020-08-17 20:50:48', '2024-01-11 07:37:06'),
(5, 'Kaliangkrik', '5000.00', 'active', '2024-01-11 07:37:31', '2024-01-11 07:37:31'),
(6, 'Muntilan', '7000.00', 'active', '2024-01-11 07:37:58', '2024-01-11 08:39:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', '/storage/photos/1/user/tom-c.png', 'admin', NULL, NULL, 'active', 'aUbjAJBb7rZXNn6LYE5HYKE2PEuyVddyeBLLlq8NKDo5kM9fWsTTMrlOQyvu', NULL, '2024-01-11 07:26:01'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', NULL, 'user', NULL, NULL, 'active', NULL, NULL, '2024-01-09 08:28:16'),
(35, 'joko anwar', 'jokan@gmail.com', NULL, '$2y$10$qH/kv9jaz.T8g3.15KX9n.rqhE8GImj.uPiC4IYQEd7Q9ObTcmx72', NULL, 'user', NULL, NULL, 'active', NULL, '2024-01-12 00:07:54', '2024-01-12 00:07:54');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
