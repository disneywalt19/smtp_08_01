-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Sty 2020, 14:14
-- Wersja serwera: 10.4.6-MariaDB
-- Wersja PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `phpshoppingcart_db`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_admins`
--

CREATE TABLE `sc_admins` (
  `adminID` bigint(20) NOT NULL,
  `adminEmail` varchar(255) NOT NULL,
  `adminUsername` varchar(30) NOT NULL,
  `adminPassword` varchar(32) NOT NULL,
  `adminPasswordRecovery` varchar(32) DEFAULT NULL,
  `adminSecurityCode` varchar(6) DEFAULT NULL,
  `adminSecurityEnabled` enum('0','1') NOT NULL DEFAULT '0',
  `adminLanguage` varchar(5) NOT NULL DEFAULT 'en_US',
  `adminPower` enum('admin','moderator','editor','visitor') NOT NULL DEFAULT 'admin',
  `adminStatus` enum('0','1') NOT NULL DEFAULT '1',
  `adminPrimary` enum('0','1') NOT NULL DEFAULT '0',
  `adminLoginIP` varchar(255) DEFAULT NULL,
  `adminLoginDate` datetime DEFAULT NULL,
  `adminAdded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `sc_admins`
--

INSERT INTO `sc_admins` (`adminID`, `adminEmail`, `adminUsername`, `adminPassword`, `adminPasswordRecovery`, `adminSecurityCode`, `adminSecurityEnabled`, `adminLanguage`, `adminPower`, `adminStatus`, `adminPrimary`, `adminLoginIP`, `adminLoginDate`, `adminAdded`) VALUES
(1, 'my.web.carrer@gmail.com', 'Admin', 'a3626926ec37c18d442b9773fba640bf', NULL, '576781', '1', 'en_US', 'admin', '1', '1', 'adminIP', '2019-12-21 13:41:37', '2019-11-18 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_coupons`
--

CREATE TABLE `sc_coupons` (
  `couponID` bigint(20) NOT NULL,
  `couponCode` varchar(50) NOT NULL,
  `couponType` enum('amount','percentage') NOT NULL,
  `couponDiscount` varchar(16) NOT NULL,
  `couponTime` bigint(20) DEFAULT NULL,
  `couponUsed` bigint(20) NOT NULL DEFAULT 0,
  `couponStatus` enum('0','1') NOT NULL DEFAULT '1',
  `couponExpire` date DEFAULT NULL,
  `couponUpdate` datetime DEFAULT NULL,
  `couponDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_media`
--

CREATE TABLE `sc_media` (
  `mediaID` bigint(20) NOT NULL,
  `mediaTitle` varchar(100) DEFAULT NULL,
  `mediaName` varchar(535) NOT NULL,
  `mediaType` varchar(30) NOT NULL,
  `mediaSize` bigint(20) NOT NULL,
  `mediaPath` varchar(500) NOT NULL,
  `mediaUploaded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_members`
--

CREATE TABLE `sc_members` (
  `memberID` bigint(20) NOT NULL,
  `memberFirstName` varchar(50) DEFAULT NULL,
  `memberLastName` varchar(50) DEFAULT NULL,
  `memberEmail` varchar(255) NOT NULL,
  `memberPassword` varchar(32) NOT NULL,
  `memberPasswordRecovery` varchar(32) DEFAULT NULL,
  `memberPhone` varchar(30) DEFAULT NULL,
  `memberCountry` varchar(50) DEFAULT NULL,
  `memberState` varchar(50) DEFAULT NULL,
  `memberCity` varchar(50) DEFAULT NULL,
  `memberAddress` varchar(100) DEFAULT NULL,
  `memberZIP` varchar(30) NOT NULL,
  `memberWishList` text DEFAULT NULL,
  `memberStatus` enum('good','trash','banned','frozen') NOT NULL DEFAULT 'good',
  `memberActivated` enum('0','1') NOT NULL DEFAULT '0',
  `memberUpdated` datetime DEFAULT NULL,
  `memberLoginIP` varchar(255) DEFAULT NULL,
  `memberLoginDate` datetime DEFAULT NULL,
  `memberSignUpIP` varchar(255) DEFAULT NULL,
  `memberSignUpDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_menus`
--

CREATE TABLE `sc_menus` (
  `menuID` bigint(20) NOT NULL,
  `menuName` varchar(50) NOT NULL,
  `menuStatus` enum('available','draft','trash') NOT NULL DEFAULT 'available',
  `menuUpdate` datetime DEFAULT NULL,
  `menuDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_menus_links`
--

CREATE TABLE `sc_menus_links` (
  `linkID` bigint(20) NOT NULL,
  `menuID` bigint(20) NOT NULL,
  `linkParrentID` bigint(20) DEFAULT NULL,
  `linkOrder` int(2) DEFAULT NULL,
  `linkIcon` varchar(100) DEFAULT NULL,
  `linkTitle` varchar(100) DEFAULT NULL,
  `linkText` varchar(100) NOT NULL,
  `linkURL` varchar(500) NOT NULL,
  `linkUpdate` datetime DEFAULT NULL,
  `l;inkAdded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_options`
--

CREATE TABLE `sc_options` (
  `optionID` bigint(20) NOT NULL,
  `optionName` varchar(255) NOT NULL,
  `optionValue` text NOT NULL,
  `optionLoad` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `sc_options`
--

INSERT INTO `sc_options` (`optionID`, `optionName`, `optionValue`, `optionLoad`) VALUES
(1, 'SITE_NAME', 'PHP Shopping Cart', '1'),
(2, 'SITE_NAME_SHOW', '1', '1'),
(3, 'SITE_LANG', 'en_US', '1'),
(4, 'SITE_THEME', 'Default', '1'),
(5, 'SITE_META_TAGS', 'HP Shopping Cart, learn code, php, mysqli, html, css, more', '1'),
(6, 'SITE_META_DESC', 'Learn how to create an amazing PHP Shoppping Cart', '1'),
(7, 'SITE_META_CHARSET', 'UTF-8', '1'),
(8, 'SITE_COPY', '&copy; 2019 Lukasz Rutkowsky', '1'),
(9, 'SITE_DEV_MODE', '1', '1'),
(12, 'SITE_PAGE_HOME', '1', '1'),
(13, 'SITE_UPDATE', '29-09-2019', '1'),
(14, 'SHOP_STATUS', '1', '1'),
(15, 'SHOP_CURRENCY', 'USD', '1'),
(16, 'SHOP_CURRENCY_ICON', 'fa fa-usd', '1'),
(17, 'SHOP_CURRENCY_TS', 'a', '1'),
(18, 'SHOP_CURRENCY_DS', 'd', '1'),
(19, 'SHOP_CURRENCY_ND', '2', '1'),
(20, 'SHOP_ORDER_MIN', '10.00', '1'),
(21, 'SHOP_ORDER_MAX', '100,000.00', '1'),
(22, 'SHOP_ORDER_MEMBERS', '0', '1'),
(23, 'SHOP_ORDER_SHIPPING', '0', '1'),
(24, 'SHOP_ORDER_TAXES', '1', '1'),
(25, 'SHOP_ORDER_COUPONS', '1', '1'),
(26, 'SHOP_UNIT_WEIGHT', 'kg', '1'),
(27, 'SHOP_UNIT_DIM', 'cm', '1'),
(28, 'SHOP_COST_WEIGHT', '1.00', '1'),
(29, 'SHOP_COST_DIM', '1.50', '1'),
(30, 'SHOP_REVIEWS_AUTO', '1', '1'),
(31, 'LAYOUT_MENU_TOP', '1', '1'),
(32, 'LAYOUT_MENU_MAIN', '1', '1'),
(33, 'LAYOUT_MENU_BOTTOM', '1', '1'),
(34, 'LAYOUT_SIDEBAR', '1', '1'),
(35, 'LAYOUT_SIDEBAR_POSITION', 'right', '1'),
(36, 'SITE_TIME_ZONE', 'Europe/Warsaw', '1'),
(37, 'SITE_DATE_FORMAT', 'd m, Y', '1'),
(38, 'SITE_TIME_FORMAT', 'g:i a', '1'),
(39, 'SITE_DATE_TIME_FORMAT', 'j F, Y g:i a', '1'),
(40, 'SITE_LANG_SHORT', 'en', '1'),
(41, 'SITE_THEME_PATH', 'default', '1'),
(42, 'SITE_PAGE_PRODUCTS', '2', '1'),
(43, 'SITE_PAGE_CART', '3', '1'),
(44, 'SITE_PAGE_PAYMENT', '4', '1'),
(45, 'SITE_PAGE_LOGIN', '5', '1'),
(46, 'SITE_PAGE_SIGNUP', '6', '1'),
(47, 'SITE_PAGE_LOST_PASS', '7', '1'),
(48, 'SITE_PAGE_AREA', '8', '1'),
(49, 'SITE_PAGE_SETTINGS', '9', '1'),
(50, 'SITE_PAGE_CHANGE_PASS', '10', '1'),
(51, 'SITE_PAGE_LOGOUT', '11', '1'),
(52, 'SITE_PAGE_WISH_LIST', '12', '1'),
(53, 'SITE_PAGE_INVOICE', '13', '1'),
(54, 'ADMIN_THEME', 'Default', '1'),
(55, 'ADMIN_THEME_PATH', 'default', '1'),
(56, 'SERVER_EMAIL_ADDRESS', 'my.web.carrer@gmail.com', '1'),
(57, 'SERVER_MAIL_PORT', '465', '1'),
(58, 'SERVER_MAIL_USER', 'my.web.carrer@gmail.com', '1'),
(59, 'SERVER_MAIL_PASS', 'biala135', '1'),
(60, 'SERVER_MAIL_ENCRYPTION', 'ssl', '1'),
(61, 'SERVER_MAIL_NAME', 'smtp.gmail.com', '1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_orders`
--

CREATE TABLE `sc_orders` (
  `orderID` bigint(20) NOT NULL,
  `memberID` bigint(20) DEFAULT NULL,
  `orderEmail` varchar(255) NOT NULL,
  `orderPhone` varchar(30) NOT NULL,
  `orderFirstName` varchar(50) NOT NULL,
  `orderLastName` varchar(50) NOT NULL,
  `orderCompanyName` varchar(100) NOT NULL,
  `orderTotal` varchar(16) NOT NULL,
  `orderDiscount` varchar(16) DEFAULT NULL,
  `orderTaxes` varchar(16) DEFAULT NULL,
  `orderShipping` varchar(16) DEFAULT NULL,
  `orderStatus` enum('approved','pending','rejected') NOT NULL DEFAULT 'pending',
  `orderSandbox` enum('0','1') NOT NULL DEFAULT '0',
  `orderUpdate` datetime DEFAULT NULL,
  `orderDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_orders_items`
--

CREATE TABLE `sc_orders_items` (
  `itemID` bigint(20) NOT NULL,
  `orderID` bigint(20) NOT NULL,
  `productID` bigint(20) NOT NULL,
  `itemQuantity` int(10) NOT NULL,
  `itemFeatures` text DEFAULT NULL,
  `itemPrice` varchar(16) NOT NULL,
  `itemTotal` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_orders_payments`
--

CREATE TABLE `sc_orders_payments` (
  `paymentID` bigint(20) NOT NULL,
  `orderID` bigint(20) NOT NULL,
  `paymentAmount` varchar(16) NOT NULL,
  `paymentFee` varchar(16) DEFAULT NULL,
  `paymentCurrency` varchar(3) NOT NULL DEFAULT 'USD',
  `paymentMethod` varchar(30) NOT NULL,
  `paymentTransactionID` varchar(255) DEFAULT NULL,
  `paymentTransactionNumber` varchar(255) DEFAULT NULL,
  `paymentTransactionType` varchar(30) NOT NULL,
  `paymentReceiverID` varchar(255) DEFAULT NULL,
  `paymentReceiverEmail` varchar(255) DEFAULT NULL,
  `paymentReceiverCurrency` varchar(3) DEFAULT 'USD',
  `paymentReceiverFee` varchar(16) NOT NULL,
  `paymentPayerID` varchar(255) DEFAULT NULL,
  `paymentPayerStatus` varchar(255) DEFAULT NULL,
  `paymentNotifyVersion` varchar(255) DEFAULT NULL,
  `paymentVerifySIgn` varchar(255) NOT NULL,
  `paymentType` varchar(30) NOT NULL,
  `paymentStatus` varchar(30) NOT NULL,
  `paymentUpdate` datetime DEFAULT NULL,
  `paymentDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_orders_shippings`
--

CREATE TABLE `sc_orders_shippings` (
  `shippingID` bigint(20) NOT NULL,
  `orderID` bigint(20) NOT NULL,
  `shippingCountry` varchar(50) NOT NULL,
  `shippingState` varchar(50) DEFAULT NULL,
  `shippingCity` varchar(50) NOT NULL,
  `shippingAddress` varchar(100) NOT NULL,
  `shippingZIP` varchar(30) DEFAULT NULL,
  `shippingStatus` enum('delivered','pending','inDelivery') NOT NULL DEFAULT 'pending',
  `shippingMethod` varchar(50) DEFAULT NULL,
  `shippingDeliveredDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_pages`
--

CREATE TABLE `sc_pages` (
  `pageID` bigint(20) NOT NULL,
  `pageTitle` varchar(100) NOT NULL,
  `pageURL` varchar(500) NOT NULL,
  `pageKeywords` varchar(255) DEFAULT NULL,
  `pageAboutShort` varchar(100) DEFAULT NULL,
  `pageAboutLong` longtext DEFAULT NULL,
  `pageScriptTop` text DEFAULT NULL,
  `pageScriptBottom` text DEFAULT NULL,
  `pageCSS` text DEFAULT NULL,
  `pageSidebarID` bigint(20) DEFAULT NULL,
  `pageSidebarPosition` enum('none','left','right') NOT NULL DEFAULT 'right',
  `pageViews` bigint(20) NOT NULL DEFAULT 0,
  `pageStatus` enum('public','draft','trash') NOT NULL DEFAULT 'public',
  `pageUpdate` datetime DEFAULT NULL,
  `pageAdded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `sc_pages`
--

INSERT INTO `sc_pages` (`pageID`, `pageTitle`, `pageURL`, `pageKeywords`, `pageAboutShort`, `pageAboutLong`, `pageScriptTop`, `pageScriptBottom`, `pageCSS`, `pageSidebarID`, `pageSidebarPosition`, `pageViews`, `pageStatus`, `pageUpdate`, `pageAdded`) VALUES
(1, 'PHP Shopping Cart', 'php-shopping-cart', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'right', 69, 'public', NULL, '2019-11-06 00:00:00'),
(2, 'Products', 'products', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'right', 0, 'public', NULL, '2019-11-07 00:00:00'),
(3, 'Cart', 'cart', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'right', 0, 'public', NULL, '2019-11-07 00:00:00'),
(4, 'Payment', 'payment', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'right', 0, 'public', NULL, '2019-11-07 00:00:00'),
(5, 'Log in', 'login', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'right', 0, 'public', NULL, '2019-11-07 00:00:00'),
(6, 'Sign up', 'signup', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'right', 0, 'public', NULL, '2019-11-09 00:00:00'),
(7, 'Forgot password', 'forgot-password', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'right', 0, 'public', NULL, '2019-11-09 00:00:00'),
(8, 'Member area', 'member-area', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'right', 0, 'public', NULL, '2019-11-09 00:00:00'),
(9, 'Settings', 'settings', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'right', 0, 'public', NULL, '2019-11-09 00:00:00'),
(10, 'Change password', 'change-password', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'right', 0, 'public', NULL, '2019-11-09 00:00:00'),
(11, 'Log out', 'log-out', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'right', 0, 'public', NULL, '2019-11-09 00:00:00'),
(12, 'Wish list', 'wish-list', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'right', 0, 'public', NULL, '2019-11-09 00:00:00'),
(13, 'Invoice', 'invoice', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'right', 0, 'public', NULL, '2019-11-09 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_products`
--

CREATE TABLE `sc_products` (
  `productID` bigint(20) NOT NULL,
  `productSKU` varchar(255) DEFAULT NULL,
  `productName` varchar(100) NOT NULL,
  `productThumbnail` varchar(500) DEFAULT NULL,
  `productURL` varchar(500) NOT NULL,
  `productStock` int(10) DEFAULT NULL,
  `productPrice` varchar(16) NOT NULL,
  `productPriceSale` varchar(16) NOT NULL,
  `productAboutShort` varchar(100) NOT NULL,
  `productAboutLong` longtext NOT NULL,
  `productKeywords` varchar(255) NOT NULL,
  `brandID` bigint(20) DEFAULT NULL,
  `categoryID` text DEFAULT NULL,
  `productWeight` varchar(16) DEFAULT NULL,
  `productDimensionLenght` varchar(16) DEFAULT NULL,
  `productDimensionWidth` varchar(16) DEFAULT NULL,
  `productDimensionHeight` varchar(16) DEFAULT NULL,
  `productSuggetions` text DEFAULT NULL,
  `productComments` enum('0','1') NOT NULL DEFAULT '1',
  `productSidebarID` bigint(20) DEFAULT NULL,
  `productSidebarPosision` enum('none','left','right') NOT NULL DEFAULT 'right',
  `productViews` bigint(20) NOT NULL DEFAULT 0,
  `productSold` bigint(20) NOT NULL DEFAULT 0,
  `productCSS` text DEFAULT NULL,
  `productStatus` enum('available','hidden','draft','trash') NOT NULL DEFAULT 'available',
  `productUpdate` datetime DEFAULT NULL,
  `productAdded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_products_brands`
--

CREATE TABLE `sc_products_brands` (
  `brandID` bigint(20) NOT NULL,
  `brandName` varchar(100) NOT NULL,
  `brandURL` varchar(500) NOT NULL,
  `brandThumbnail` varchar(500) DEFAULT 'NULL',
  `brandAboutLong` longtext DEFAULT NULL,
  `brandSidebarID` bigint(20) NOT NULL,
  `brandSidebarPosition` enum('none','left','right') NOT NULL DEFAULT 'right',
  `brandStatus` enum('available','draft','hidden','trash') NOT NULL DEFAULT 'available',
  `brandDate` datetime DEFAULT NULL,
  `brandAdded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_products_categories`
--

CREATE TABLE `sc_products_categories` (
  `categoryID` bigint(20) NOT NULL,
  `categoryName` varchar(100) NOT NULL,
  `categoryURL` varchar(500) NOT NULL,
  `categoryThumbnail` varchar(500) DEFAULT NULL,
  `categoryAboutLong` longtext DEFAULT NULL,
  `categorySidebarID` bigint(20) DEFAULT NULL,
  `categorySidebarPosition` enum('none','left','right') NOT NULL DEFAULT 'right',
  `categoryStatus` enum('available','draft','hidden','trash') NOT NULL DEFAULT 'available',
  `categoryDate` datetime DEFAULT NULL,
  `categoryAdded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_products_reviews`
--

CREATE TABLE `sc_products_reviews` (
  `reviewID` bigint(20) NOT NULL,
  `productID` bigint(20) NOT NULL,
  `memberID` bigint(20) NOT NULL,
  `reviewText` text NOT NULL,
  `reviewRating` enum('1','2','3','4','5') DEFAULT NULL,
  `reviewStatus` enum('approved','pending','spam','trash') NOT NULL DEFAULT 'pending',
  `reviewIP` varchar(255) NOT NULL,
  `reviewUpdate` datetime DEFAULT NULL,
  `reviewAdded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_sidebars`
--

CREATE TABLE `sc_sidebars` (
  `sidebarID` bigint(20) NOT NULL,
  `sidebarName` varchar(50) NOT NULL,
  `widgetsID` text DEFAULT NULL,
  `sidebarStatus` enum('available','trash') NOT NULL DEFAULT 'available',
  `sidebarUpdate` datetime DEFAULT NULL,
  `sidebarAdded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `sc_sidebars`
--

INSERT INTO `sc_sidebars` (`sidebarID`, `sidebarName`, `widgetsID`, `sidebarStatus`, `sidebarUpdate`, `sidebarAdded`) VALUES
(1, 'Default', NULL, 'available', NULL, '2019-11-09 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_sidebar_widgets`
--

CREATE TABLE `sc_sidebar_widgets` (
  `widgetID` bigint(20) NOT NULL,
  `widgetTitle` varchar(50) NOT NULL,
  `widgetTitleHide` enum('0','1') NOT NULL DEFAULT '1',
  `widgetType` varchar(20) NOT NULL,
  `widgetOption1` varchar(500) DEFAULT NULL,
  `widgetOption2` varchar(500) DEFAULT NULL,
  `widgetOption3` varchar(500) DEFAULT NULL,
  `widgetText` text NOT NULL,
  `widgetStatus` enum('available','graft','trash') NOT NULL DEFAULT 'available',
  `widgetUpdate` datetime DEFAULT NULL,
  `widgetDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_themes`
--

CREATE TABLE `sc_themes` (
  `themeID` bigint(20) NOT NULL,
  `themeName` varchar(50) NOT NULL,
  `themePath` varchar(500) NOT NULL,
  `themeAuthor` varchar(100) NOT NULL,
  `themeAbout` varchar(500) NOT NULL,
  `themeCSS` longtext DEFAULT 'NULL',
  `themeStatus` enum('available','draft','trash') NOT NULL DEFAULT 'available',
  `themeCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sc_traffic`
--

CREATE TABLE `sc_traffic` (
  `trafficID` bigint(20) NOT NULL,
  `trafficIP` varchar(255) NOT NULL,
  `trafficCountryName` varchar(50) NOT NULL,
  `trafficCountryCode` varchar(3) NOT NULL,
  `trafficState` varchar(50) DEFAULT NULL,
  `trafficCity` varchar(50) NOT NULL,
  `trafficAddressURL` text NOT NULL,
  `trafficAddressFrom` text DEFAULT NULL,
  `trafficBrowser` varchar(50) NOT NULL,
  `trafficOS` varchar(50) NOT NULL,
  `trafficDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `sc_traffic`
--

INSERT INTO `sc_traffic` (`trafficID`, `trafficIP`, `trafficCountryName`, `trafficCountryCode`, `trafficState`, `trafficCity`, `trafficAddressURL`, `trafficAddressFrom`, `trafficBrowser`, `trafficOS`, `trafficDate`) VALUES
(204, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-04 07:07:58'),
(205, '::1', 'Netherlands', '', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-04 17:27:41'),
(206, '::1', 'Netherlands', '', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-04 17:35:23'),
(207, '::1', 'Netherlands', '', 'North Brabant', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-04 17:51:54'),
(208, '::1', 'Unknown countryyyy', 'NL', '', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-04 17:58:54'),
(209, '::1', 'Netherlands', 'NL', '', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-04 18:07:08'),
(210, '::1', 'Netherlands', 'NL', '', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-05 06:40:19'),
(211, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-05 06:40:24'),
(212, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-05 17:25:06'),
(213, '::1', 'Netherlands', '', '', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-05 17:27:28'),
(214, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-05 17:27:35'),
(215, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-05 17:29:34'),
(216, '::1', 'Unknown countryyyy', '', '', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-05 18:20:05'),
(217, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 07:34:29'),
(218, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 07:43:56'),
(219, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 07:44:12'),
(220, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 14:21:05'),
(221, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/product.php', '', 'Google Chrome', 'Windows 7', '2019-11-06 14:28:38'),
(222, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 14:32:10'),
(223, '::1', 'Netherlands', 'NL', 'North Brabant', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 14:33:29'),
(224, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 16:33:18'),
(225, '::1', 'Netherlands', '', '', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 16:43:08'),
(226, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 16:43:18'),
(227, '::1', 'Unknown countryyyy', 'NL', '', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 16:48:58'),
(228, '::1', 'Netherlands', 'NL', '', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 16:49:00'),
(229, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 16:49:09'),
(230, '::1', 'Netherlands', '', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 16:51:10'),
(231, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 17:01:53'),
(232, '::1', 'Netherlands', '', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 17:02:00'),
(233, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 17:09:58'),
(234, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 17:24:17'),
(235, '::1', 'Netherlands', '', '', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 17:27:53'),
(236, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 17:30:06'),
(237, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-06 17:30:08'),
(238, '::1', 'Netherlands', '', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-06 17:30:12'),
(239, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-06 17:30:17'),
(240, '::1', 'Netherlands', 'NL', '', 'Tilburg', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-06 17:30:58'),
(241, '::1', 'Netherlands', '', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-07 06:56:34'),
(242, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-07 06:59:10'),
(243, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-07 07:00:29'),
(244, '::1', 'Netherlands', '', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-07 07:00:58'),
(245, '::1', 'Netherlands', 'NL', 'North Brabant', 'Tilburg', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-07 07:03:56'),
(246, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-07 07:10:49'),
(247, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-09 20:34:17'),
(248, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-09 20:34:22'),
(249, '::1', 'Netherlands', '', 'North Brabant', 'Tilburg', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-09 20:34:58'),
(250, '::1', 'Netherlands', '', 'North Brabant', 'Tilburg', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-10 15:15:02'),
(251, '::1', 'Unknown countryyyy', '', '', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-10 15:58:12'),
(252, '::1', 'Netherlands', '', 'North Brabant', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-10 16:01:25'),
(253, '::1', 'Netherlands', 'NL', 'North Brabant', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-10 16:01:58'),
(254, '::1', 'Unknown countryyyy', '', '', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-10 16:02:00'),
(255, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-10 16:04:15'),
(256, '::1', 'Netherlands', '', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-10 16:05:14'),
(257, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-10 16:14:16'),
(258, '::1', 'Unknown countryyyy', '', '', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-10 16:14:25'),
(259, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-10 16:32:50'),
(260, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-10 16:34:02'),
(261, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-10 16:42:51'),
(262, '::1', 'Unknown countryyyy', 'NL', '', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-10 16:43:12'),
(263, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-10 16:43:14'),
(264, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-10 19:53:03'),
(265, '::1', 'Netherlands', '', 'North Brabant', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-11 10:26:11'),
(266, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-11 10:26:54'),
(267, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-11 10:27:04'),
(268, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-11 10:37:06'),
(269, '::1', 'Netherlands', 'NL', 'North Brabant', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-11 11:09:17'),
(270, '::1', 'Unknown countryyyy', '', '', 'Tilburg', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-11 11:09:26'),
(271, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Tilburg', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-13 23:24:40'),
(272, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-13 23:24:45'),
(273, '::1', 'Unknown countryyyy', '', '', 'Tilburg', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-13 23:28:21'),
(274, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-13 23:30:35'),
(275, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-13 23:32:34'),
(276, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Tilburg', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-13 23:32:37'),
(277, '::1', 'Unknown countryyyy', 'NL', '', 'Tilburg', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-13 23:34:57'),
(278, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-13 23:35:32'),
(279, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-13 23:36:34'),
(280, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-13 23:37:08'),
(281, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-13 23:37:24'),
(282, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-14 00:04:39'),
(283, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-14 00:05:16'),
(284, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-14 00:08:02'),
(285, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-14 00:09:53'),
(286, '::1', 'Netherlands', '', 'North Brabant', 'Tilburg', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-14 00:10:15'),
(287, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-14 12:13:44'),
(288, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Tilburg', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-14 12:15:02'),
(289, '::1', 'Netherlands', 'NL', '', 'Tilburg', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-14 22:46:48'),
(290, '::1', 'Netherlands', '', 'North Brabant', 'Tilburg', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-14 23:10:41'),
(291, '::1', 'Unknown countryyyy', 'NL', '', 'Tilburg', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-14 23:12:21'),
(292, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-14 23:12:34'),
(293, '::1', 'Netherlands', 'NL', '', 'Tilburg', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-14 23:14:31'),
(294, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-15 10:54:19'),
(295, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-15 11:17:28'),
(296, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-15 12:29:46'),
(297, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-15 12:29:56'),
(298, '::1', 'Netherlands', '', '', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-15 12:30:01'),
(299, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-15 12:32:10'),
(300, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-15 12:32:29'),
(301, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 12:33:10'),
(302, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 12:33:54'),
(303, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 12:33:56'),
(304, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 12:33:59'),
(305, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 12:34:06'),
(306, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 12:34:17'),
(307, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 20:36:56'),
(308, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 20:36:57'),
(309, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 20:39:29'),
(310, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 20:39:32'),
(311, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/', 'http://localhost/PHP_CART/', 'Google Chrome', 'Windows 7', '2019-11-15 20:48:08'),
(312, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 20:48:11'),
(313, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 20:50:53'),
(314, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 20:52:41'),
(315, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 20:56:32'),
(316, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 20:58:28'),
(317, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 20:58:48'),
(318, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 20:58:51'),
(319, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 21:03:17'),
(320, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/', '', 'Google Chrome', 'Windows 7', '2019-11-15 21:03:32'),
(321, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 21:04:06'),
(322, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 21:11:51'),
(323, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 21:12:07'),
(324, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 21:14:09'),
(325, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 21:14:27'),
(326, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 21:19:41'),
(327, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 21:59:20'),
(328, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 22:00:11'),
(329, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 22:00:52'),
(330, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 22:01:38'),
(331, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 22:05:19'),
(332, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 22:08:29'),
(333, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 22:55:18'),
(334, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 23:02:19'),
(335, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 23:02:39'),
(336, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 23:04:46'),
(337, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 23:04:52'),
(338, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-15 23:04:54'),
(339, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 02:27:46'),
(340, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 06:37:04'),
(341, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 06:37:25'),
(342, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 06:37:41'),
(343, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 06:39:20'),
(344, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 06:44:37'),
(345, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 06:47:21'),
(346, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 06:51:38'),
(347, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 06:52:30'),
(348, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 06:55:25'),
(349, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 06:55:36'),
(350, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 06:56:51'),
(351, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 06:59:50'),
(352, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 07:00:36'),
(353, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 07:06:11'),
(354, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 07:36:18'),
(355, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 22:07:57'),
(356, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 22:15:48'),
(357, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 22:16:55'),
(358, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 22:17:12'),
(359, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 22:17:39'),
(360, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 22:25:23'),
(361, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 22:25:42'),
(362, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-16 22:34:37'),
(363, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 14:33:37'),
(364, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 14:34:47'),
(365, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 14:43:33'),
(366, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 14:45:49'),
(367, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 14:46:15'),
(368, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 14:46:39'),
(369, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 14:54:17'),
(370, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:05:34'),
(371, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:06:23'),
(372, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:22:12'),
(373, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:25:52'),
(374, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:31:01'),
(375, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:37:48'),
(376, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:38:26'),
(377, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:40:11'),
(378, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:40:27'),
(379, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:40:30'),
(380, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:53:22'),
(381, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:53:37'),
(382, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:56:14'),
(383, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:58:00'),
(384, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:58:22'),
(385, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 15:58:56'),
(386, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:00:54'),
(387, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:01:33'),
(388, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:01:51'),
(389, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:03:00'),
(390, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:03:26'),
(391, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:03:40'),
(392, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:04:33'),
(393, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:04:57'),
(394, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:05:17'),
(395, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:19:58'),
(396, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:22:32'),
(397, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:27:13'),
(398, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:32:47'),
(399, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:33:34'),
(400, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:39:24'),
(401, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:40:27'),
(402, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:40:33'),
(403, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:43:19'),
(404, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:43:22'),
(405, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:43:34'),
(406, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:44:16'),
(407, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:47:44'),
(408, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:47:50'),
(409, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:48:06'),
(410, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:48:24'),
(411, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:49:25'),
(412, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:50:04'),
(413, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:50:30'),
(414, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:51:01'),
(415, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:51:03'),
(416, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:51:05'),
(417, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:51:34'),
(418, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:51:46'),
(419, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:52:18'),
(420, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:53:33'),
(421, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:53:36'),
(422, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:54:11'),
(423, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:56:23'),
(424, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:56:48'),
(425, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:56:56'),
(426, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:57:11'),
(427, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 16:57:14'),
(428, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 17:04:20'),
(429, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 17:05:02'),
(430, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 17:08:11'),
(431, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 17:08:42'),
(432, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 17:09:03'),
(433, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 17:09:47'),
(434, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 17:10:20'),
(435, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 17:13:31'),
(436, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 17:13:51'),
(437, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-17 18:39:12'),
(438, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 16:36:22'),
(439, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 16:38:45'),
(440, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 16:38:56'),
(441, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 16:46:16'),
(442, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 16:46:34'),
(443, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 16:47:17'),
(444, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 16:48:05'),
(445, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 16:51:33'),
(446, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 16:54:22'),
(447, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 16:56:26'),
(448, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 16:56:34'),
(449, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 17:01:11'),
(450, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 17:02:30'),
(451, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 17:02:39'),
(452, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 17:02:53'),
(453, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 17:06:47'),
(454, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 18:07:46'),
(455, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 18:07:56'),
(456, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 18:11:09'),
(457, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 18:11:35'),
(458, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 18:11:55'),
(459, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 18:12:41'),
(460, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 18:12:47'),
(461, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 18:13:57'),
(462, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 18:14:00'),
(463, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 18:14:03'),
(464, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 18:16:00'),
(465, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 18:16:04'),
(466, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 18:22:06'),
(467, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 18:22:09'),
(468, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 18:22:11'),
(469, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 18:22:17'),
(470, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-18 18:25:39'),
(471, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 18:25:42'),
(472, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 19:33:53'),
(473, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 19:34:32'),
(474, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-18 19:34:35'),
(475, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 17:13:58'),
(476, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 17:14:01'),
(477, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 17:29:01'),
(478, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 17:29:04'),
(479, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 17:29:11'),
(480, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 17:29:34'),
(481, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 17:29:52'),
(482, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:08:53'),
(483, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:08:55'),
(484, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:09:02'),
(485, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 18:11:28'),
(486, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:11:30'),
(487, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:11:34'),
(488, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 18:13:39'),
(489, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:13:41'),
(490, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:13:44'),
(491, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 18:14:57'),
(492, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:15:01'),
(493, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:15:33'),
(494, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 18:18:28'),
(495, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:18:31'),
(496, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 18:25:40'),
(497, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:25:42'),
(498, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:25:46'),
(499, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 18:37:32'),
(500, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:37:34'),
(501, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:37:47'),
(502, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 18:37:59'),
(503, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 18:38:12'),
(504, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 18:38:17'),
(505, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 18:38:24'),
(506, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:38:30'),
(507, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:42:02'),
(508, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:43:31'),
(509, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 18:44:56'),
(510, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:45:02'),
(511, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:45:14'),
(512, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 18:47:05'),
(513, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 18:47:33'),
(514, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 18:47:37'),
(515, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 19:54:31'),
(516, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 19:54:35'),
(517, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-19 19:55:02'),
(518, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/index.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 19:58:00'),
(519, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/index.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 19:59:08'),
(520, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/index.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 20:00:41'),
(521, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/index.php', '', 'Google Chrome', 'Windows 7', '2019-11-19 20:00:46'),
(522, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:00:53'),
(523, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:01:13'),
(524, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:01:46'),
(525, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:01:49'),
(526, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:01:59'),
(527, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:02:00'),
(528, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:02:14'),
(529, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:02:15'),
(530, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:02:31'),
(531, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:04:23');
INSERT INTO `sc_traffic` (`trafficID`, `trafficIP`, `trafficCountryName`, `trafficCountryCode`, `trafficState`, `trafficCity`, `trafficAddressURL`, `trafficAddressFrom`, `trafficBrowser`, `trafficOS`, `trafficDate`) VALUES
(532, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:04:25'),
(533, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:04:42'),
(534, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:06:42'),
(535, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:08:22'),
(536, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:08:37'),
(537, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/index.php', 'http://localhost/PHP_CART/index.php', 'Google Chrome', 'Windows 7', '2019-11-19 20:08:48'),
(538, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/index.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 14:36:51'),
(539, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 14:37:37'),
(540, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 14:37:40'),
(541, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 14:37:43'),
(542, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 18:42:29'),
(543, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 18:42:31'),
(544, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:03:15'),
(545, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:03:17'),
(546, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:03:21'),
(547, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:03:34'),
(548, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:03:36'),
(549, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:03:40'),
(550, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:03:41'),
(551, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:04:06'),
(552, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:04:09'),
(553, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:04:11'),
(554, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:04:35'),
(555, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:04:39'),
(556, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:04:41'),
(557, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:05:24'),
(558, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:05:26'),
(559, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:10:44'),
(560, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:10:46'),
(561, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/index.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:10:52'),
(562, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:10:58'),
(563, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:23:59'),
(564, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:24:02'),
(565, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:24:06'),
(566, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:29:42'),
(567, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:29:45'),
(568, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:35:43'),
(569, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:35:48'),
(570, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:37:00'),
(571, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:37:03'),
(572, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:37:07'),
(573, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:37:15'),
(574, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:37:36'),
(575, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:37:38'),
(576, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:38:58'),
(577, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:39:00'),
(578, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:39:04'),
(579, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:40:35'),
(580, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:40:39'),
(581, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:40:42'),
(582, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:40:48'),
(583, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:52:10'),
(584, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:52:12'),
(585, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:52:17'),
(586, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 19:53:12'),
(587, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 19:53:14'),
(588, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 20:08:37'),
(589, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-20 20:13:25'),
(590, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 20:13:27'),
(591, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 20:13:30'),
(592, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-20 20:14:12'),
(593, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-23 10:22:34'),
(594, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 10:22:40'),
(595, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 10:46:50'),
(596, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 10:46:55'),
(597, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 10:47:22'),
(598, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 10:48:04'),
(599, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 10:48:38'),
(600, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 10:48:41'),
(601, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 10:50:33'),
(602, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 10:50:36'),
(603, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-23 10:51:35'),
(604, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 10:51:39'),
(605, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 10:52:11'),
(606, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 10:56:53'),
(607, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 10:57:04'),
(608, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 11:00:21'),
(609, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 11:00:26'),
(610, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 11:04:08'),
(611, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 11:04:17'),
(612, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 11:04:59'),
(613, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 11:12:47'),
(614, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 11:12:50'),
(615, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 11:12:56'),
(616, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 11:14:18'),
(617, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-23 11:14:21'),
(618, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:04:54'),
(619, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:04:59'),
(620, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:05:00'),
(621, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:05:03'),
(622, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-24 23:05:08'),
(623, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:13:40'),
(624, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-24 23:14:39'),
(625, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:15:03'),
(626, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:15:03'),
(627, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:15:05'),
(628, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:20:57'),
(629, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:20:58'),
(630, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:21:04'),
(631, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:21:04'),
(632, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:21:04'),
(633, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:21:06'),
(634, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:22:37'),
(635, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-24 23:22:56'),
(636, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-24 23:24:05'),
(637, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:25:01'),
(638, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-24 23:25:04'),
(639, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-24 23:25:12'),
(640, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-24 23:25:21'),
(641, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-24 23:31:23'),
(642, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-24 23:31:30'),
(643, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-25 10:41:08'),
(644, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-25 10:41:21'),
(645, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-25 10:41:24'),
(646, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-25 11:04:39'),
(647, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-25 11:05:01'),
(648, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-25 11:05:14'),
(649, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-25 12:05:13'),
(650, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-25 12:05:26'),
(651, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-25 12:11:25'),
(652, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-25 12:11:33'),
(653, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-25 12:13:18'),
(654, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-25 12:13:23'),
(655, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-25 12:13:40'),
(656, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-25 12:13:43'),
(657, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-26 17:49:00'),
(658, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-26 17:49:32'),
(659, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-26 17:49:45'),
(660, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-27 12:53:48'),
(661, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-27 12:54:34'),
(662, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-27 13:19:58'),
(663, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-27 13:20:42'),
(664, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-27 13:20:46'),
(665, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-27 13:28:53'),
(666, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-27 13:29:11'),
(667, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-27 14:04:26'),
(668, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-27 14:04:57'),
(669, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-27 14:05:26'),
(670, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-27 14:24:44'),
(671, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-27 14:27:08'),
(672, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-27 14:27:19'),
(673, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-27 14:52:58'),
(674, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-27 14:53:05'),
(675, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-27 17:44:42'),
(676, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-27 17:44:49'),
(677, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-27 19:47:41'),
(678, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-27 19:47:43'),
(679, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-28 13:16:24'),
(680, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-28 13:16:52'),
(681, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-28 13:42:52'),
(682, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-28 13:42:55'),
(683, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-28 20:59:25'),
(684, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-28 20:59:27'),
(685, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-28 21:10:12'),
(686, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-28 21:10:14'),
(687, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-28 21:10:16'),
(688, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-28 21:10:25'),
(689, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-28 21:11:08'),
(690, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-28 21:11:19'),
(691, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-28 21:11:48'),
(692, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-28 21:11:50'),
(693, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-28 21:12:04'),
(694, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-28 21:14:16'),
(695, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-28 21:14:33'),
(696, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-29 06:33:43'),
(697, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 06:33:47'),
(698, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 06:35:56'),
(699, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 06:36:58'),
(700, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-29 06:43:36'),
(701, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 06:43:38'),
(702, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-29 06:44:35'),
(703, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 06:47:37'),
(704, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 06:47:44'),
(705, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 06:49:34'),
(706, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 06:52:20'),
(707, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-29 06:57:23'),
(708, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-29 06:59:26'),
(709, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 06:59:28'),
(710, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-29 06:59:59'),
(711, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 07:00:01'),
(712, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-29 07:01:13'),
(713, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 07:01:14'),
(714, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-29 19:42:52'),
(715, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 19:42:56'),
(716, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 19:43:16'),
(717, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 19:43:34'),
(718, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-29 23:02:03'),
(719, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 23:03:12'),
(720, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 23:03:30'),
(721, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-29 23:05:40'),
(722, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-30 15:29:03'),
(723, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-30 15:29:05'),
(724, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-30 15:32:29'),
(725, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-30 15:32:30'),
(726, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-30 15:32:49'),
(727, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-30 15:36:19'),
(728, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-30 15:36:28'),
(729, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-30 15:49:33'),
(730, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-30 15:50:13'),
(731, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-11-30 15:53:03'),
(732, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-30 15:53:20'),
(733, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-30 15:53:29'),
(734, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-30 15:53:43'),
(735, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-11-30 15:55:59'),
(736, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-01 21:10:40'),
(737, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-01 21:13:06'),
(738, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-01 21:16:07'),
(739, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-01 21:16:10'),
(740, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-01 21:16:16'),
(741, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-01 21:16:51'),
(742, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-01 21:18:10'),
(743, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:38:23'),
(744, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Firefox', 'Linux', '2019-12-05 16:38:33'),
(745, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Firefox', 'Linux', '2019-12-05 16:38:40'),
(746, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Firefox', 'Linux', '2019-12-05 16:38:50'),
(747, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/index.php', '', 'Firefox', 'Linux', '2019-12-05 16:39:25'),
(748, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:43:15'),
(749, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Firefox', 'Linux', '2019-12-05 16:43:27'),
(750, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:32'),
(751, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:33'),
(752, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:34'),
(753, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:34'),
(754, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:35'),
(755, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:35'),
(756, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:36'),
(757, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:36'),
(758, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:37'),
(759, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:37'),
(760, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:38'),
(761, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:38'),
(762, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:39'),
(763, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:39'),
(764, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:40'),
(765, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:40'),
(766, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:41'),
(767, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 16:47:41'),
(768, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/index.php', '', 'Firefox', 'Linux', '2019-12-05 17:28:59'),
(769, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:23'),
(770, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:23'),
(771, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:24'),
(772, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:24'),
(773, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:25'),
(774, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:25'),
(775, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:26'),
(776, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:26'),
(777, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:27'),
(778, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:27'),
(779, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:28'),
(780, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:28'),
(781, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:29'),
(782, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:29'),
(783, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:30'),
(784, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:30'),
(785, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:31'),
(786, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:31'),
(787, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:31'),
(788, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:32'),
(789, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:29:33'),
(790, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:20'),
(791, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:21'),
(792, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:21'),
(793, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:22'),
(794, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:22'),
(795, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:23'),
(796, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:23'),
(797, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:24'),
(798, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:24'),
(799, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:25'),
(800, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:25'),
(801, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:26'),
(802, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:26'),
(803, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:27'),
(804, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:27'),
(805, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:28'),
(806, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:28'),
(807, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:29'),
(808, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:29'),
(809, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:30'),
(810, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:30'),
(811, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:56'),
(812, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:56'),
(813, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:57'),
(814, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:57'),
(815, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:58'),
(816, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:58'),
(817, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:59'),
(818, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:32:59'),
(819, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:33:00'),
(820, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:33:00'),
(821, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:33:01'),
(822, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:33:01'),
(823, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:33:02'),
(824, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:33:02'),
(825, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:33:03'),
(826, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:33:03'),
(827, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:33:04'),
(828, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:33:04'),
(829, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:33:05'),
(830, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:33:05'),
(831, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:33:06'),
(832, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:35'),
(833, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:36'),
(834, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:36'),
(835, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:36');
INSERT INTO `sc_traffic` (`trafficID`, `trafficIP`, `trafficCountryName`, `trafficCountryCode`, `trafficState`, `trafficCity`, `trafficAddressURL`, `trafficAddressFrom`, `trafficBrowser`, `trafficOS`, `trafficDate`) VALUES
(836, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:37'),
(837, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:37'),
(838, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:38'),
(839, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:38'),
(840, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:39'),
(841, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:39'),
(842, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:40'),
(843, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:40'),
(844, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:41'),
(845, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:41'),
(846, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:42'),
(847, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:42'),
(848, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:43'),
(849, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:43'),
(850, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:44'),
(851, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:44'),
(852, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:44'),
(853, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 17:34:51'),
(854, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:42'),
(855, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:42'),
(856, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:43'),
(857, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:43'),
(858, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:44'),
(859, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:44'),
(860, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:45'),
(861, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:45'),
(862, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:46'),
(863, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:46'),
(864, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:46'),
(865, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:47'),
(866, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:47'),
(867, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:48'),
(868, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:48'),
(869, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:49'),
(870, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:49'),
(871, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:50'),
(872, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:50'),
(873, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:51'),
(874, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 18:22:51'),
(875, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:14'),
(876, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:15'),
(877, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:15'),
(878, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:16'),
(879, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:16'),
(880, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:17'),
(881, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:17'),
(882, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:18'),
(883, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:18'),
(884, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:19'),
(885, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:19'),
(886, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:20'),
(887, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:20'),
(888, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:21'),
(889, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:21'),
(890, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:22'),
(891, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:22'),
(892, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:23'),
(893, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:24'),
(894, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:24'),
(895, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:15:25'),
(896, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 20:44:20'),
(897, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:00'),
(898, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:00'),
(899, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:01'),
(900, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:01'),
(901, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:02'),
(902, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:02'),
(903, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:03'),
(904, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:03'),
(905, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:04'),
(906, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:04'),
(907, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:05'),
(908, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:05'),
(909, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:06'),
(910, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:06'),
(911, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:07'),
(912, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:07'),
(913, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:08'),
(914, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:08'),
(915, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:09'),
(916, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:09'),
(917, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 21:11:10'),
(918, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/index.php', '', 'Firefox', 'Linux', '2019-12-05 22:08:25'),
(919, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/index.php', '', 'Firefox', 'Linux', '2019-12-05 22:08:46'),
(920, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:03'),
(921, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:04'),
(922, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:05'),
(923, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:05'),
(924, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:06'),
(925, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:06'),
(926, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:07'),
(927, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:07'),
(928, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:08'),
(929, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:08'),
(930, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:09'),
(931, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:10'),
(932, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:10'),
(933, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:11'),
(934, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:11'),
(935, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:12'),
(936, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:12'),
(937, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:13'),
(938, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:13'),
(939, '127.0.0.1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:14'),
(940, '127.0.0.1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:09:15'),
(941, '127.0.0.1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-05 22:12:06'),
(942, '::1', 'Poland', 'PL', '', 'Sulejowek', '/PHP_CART/control_panel/login', '', 'Google Chrome', 'Linux', '2019-12-07 10:51:17'),
(943, '::1', 'Poland', 'PL', 'Mazovia', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login', 'Google Chrome', 'Linux', '2019-12-07 10:51:36'),
(944, '::1', 'Poland', '', 'Mazovia', 'Sulejowek', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 10:53:02'),
(945, '::1', 'Poland', 'PL', 'Mazovia', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 10:53:20'),
(946, '::1', 'Poland', '', '', '', '/PHP_CART/control_panel/logout', '', 'Google Chrome', 'Linux', '2019-12-07 10:54:47'),
(947, '::1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/logout', '', 'Google Chrome', 'Linux', '2019-12-07 10:55:54'),
(948, '::1', 'Unknown countryyyy', '', 'Mazovia', 'Sulejowek', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 10:55:54'),
(949, '::1', 'Unknown countryyyy', '', '', 'Sulejowek', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 10:56:11'),
(950, '::1', 'Poland', '', '', 'Sulejowek', '/PHP_CART/control_panel/logout', '', 'Google Chrome', 'Linux', '2019-12-07 10:56:32'),
(951, '::1', 'Poland', 'PL', '', 'Sulejowek', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 10:56:32'),
(952, '::1', 'Poland', '', 'Mazovia', 'Sulejowek', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 10:56:37'),
(953, '::1', 'Poland', 'PL', 'Mazovia', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 10:56:46'),
(954, '::1', 'Poland', 'PL', 'Mazovia', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 10:57:28'),
(955, '::1', 'Unknown countryyyy', '', 'Mazovia', '', '/PHP_CART/control_panel/logout', '', 'Google Chrome', 'Linux', '2019-12-07 10:57:39'),
(956, '::1', 'Poland', 'PL', '', 'Sulejowek', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 10:57:40'),
(957, '::1', 'Unknown countryyyy', '', 'Mazovia', 'Sulejowek', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 11:01:20'),
(958, '::1', 'Poland', 'PL', '', 'Sulejowek', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 11:01:54'),
(959, '::1', 'Poland', 'PL', '', 'Sulejowek', '/PHP_CART/control_panel/logout', '', 'Google Chrome', 'Linux', '2019-12-07 11:03:28'),
(960, '::1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 11:03:28'),
(961, '::1', 'Unknown countryyyy', '', 'Mazovia', 'Sulejowek', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 11:03:41'),
(962, '::1', 'Poland', '', 'Mazovia', 'Sulejowek', '/PHP_CART/control_panel/logout', '', 'Google Chrome', 'Linux', '2019-12-07 11:09:35'),
(963, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 11:09:35'),
(964, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 11:09:49'),
(965, '::1', 'Unknown countryyyy', '', 'Mazovia', '', '/PHP_CART/control_panel/logout', '', 'Google Chrome', 'Linux', '2019-12-07 11:14:48'),
(966, '::1', 'Unknown countryyyy', 'PL', '', 'Sulejowek', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 11:14:49'),
(967, '::1', 'Unknown countryyyy', '', '', 'Sulejowek', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 11:19:33'),
(968, '::1', 'Poland', '', 'Mazovia', 'Sulejowek', '/PHP_CART/index.php', '', 'Google Chrome', 'Linux', '2019-12-07 11:19:46'),
(969, '::1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login', '', 'Google Chrome', 'Linux', '2019-12-07 11:20:06'),
(970, '::1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login', 'Google Chrome', 'Linux', '2019-12-07 11:20:19'),
(971, '::1', 'Poland', '', 'Mazovia', 'Sulejowek', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 11:20:40'),
(972, '::1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/logout', '', 'Google Chrome', 'Linux', '2019-12-07 11:37:57'),
(973, '::1', 'Unknown countryyyy', '', 'Mazovia', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 11:37:57'),
(974, '::1', 'Unknown countryyyy', '', 'Mazovia', 'Sulejowek', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 11:38:09'),
(975, '::1', 'Unknown countryyyy', '', 'Mazovia', 'Sulejowek', '/PHP_CART/index.php', '', 'Google Chrome', 'Linux', '2019-12-07 11:38:28'),
(976, '::1', 'Poland', '', 'Mazovia', 'Sulejowek', '/PHP_CART/control_panel/logout', '', 'Google Chrome', 'Linux', '2019-12-07 11:41:36'),
(977, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 11:41:36'),
(978, '::1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/logout', '', 'Google Chrome', 'Linux', '2019-12-07 12:18:49'),
(979, '::1', 'Poland', 'PL', 'Mazovia', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 12:19:57'),
(980, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 12:20:11'),
(981, '::1', 'Poland', '', 'Mazovia', '', '/PHP_CART/control_panel/logout', '', 'Google Chrome', 'Linux', '2019-12-07 12:20:22'),
(982, '::1', 'Poland', 'PL', 'Mazovia', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 12:20:22'),
(983, '::1', 'Unknown countryyyy', '', 'Mazovia', '', '/PHP_CART/index.php', '', 'Google Chrome', 'Linux', '2019-12-07 12:20:38'),
(984, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login', '', 'Google Chrome', 'Linux', '2019-12-07 13:26:25'),
(985, '::1', 'Unknown countryyyy', '', 'Mazovia', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 13:28:37'),
(986, '::1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 13:28:47'),
(987, '::1', 'Unknown countryyyy', '', 'Mazovia', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 13:31:08'),
(988, '::1', 'Unknown countryyyy', 'PL', 'Mazovia', '', '/PHP_CART/index.php', '', 'Google Chrome', 'Linux', '2019-12-07 13:31:51'),
(989, '::1', 'Poland', 'PL', 'Mazovia', '', '/PHP_CART/control_panel/logout', '', 'Google Chrome', 'Linux', '2019-12-07 13:32:08'),
(990, '::1', 'Poland', '', 'Mazovia', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 13:32:08'),
(991, '::1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 13:32:17'),
(992, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 13:32:21'),
(993, '::1', 'Poland', '', 'Mazovia', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 13:38:02'),
(994, '::1', 'Unknown countryyyy', '', 'Mazovia', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 13:38:12'),
(995, '::1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/securityCode.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 19:08:27'),
(996, '::1', 'Poland', '', '', '', '/PHP_CART/control_panel/login', '', 'Google Chrome', 'Linux', '2019-12-07 19:11:45'),
(997, '::1', 'Unknown countryyyy', 'PL', 'Mazovia', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login', 'Google Chrome', 'Linux', '2019-12-07 19:12:01'),
(998, '::1', 'Unknown countryyyy', 'PL', 'Mazovia', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 19:12:23'),
(999, '::1', 'Unknown countryyyy', '', 'Mazovia', '', '/PHP_CART/control_panel/securityCode.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 19:12:24'),
(1000, '::1', 'Unknown countryyyy', '', 'Mazovia', '', '/PHP_CART/control_panel/login', '', 'Google Chrome', 'Linux', '2019-12-07 19:30:41'),
(1001, '::1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login', 'Google Chrome', 'Linux', '2019-12-07 19:30:55'),
(1002, '::1', 'Unknown countryyyy', '', 'Mazovia', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 19:31:06'),
(1003, '::1', 'Poland', 'PL', 'Mazovia', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 19:32:25'),
(1004, '::1', 'Poland', '', 'Mazovia', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 19:32:47'),
(1005, '::1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 19:33:49'),
(1006, '::1', 'Unknown countryyyy', 'PL', 'Mazovia', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 19:33:53'),
(1007, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 19:40:33'),
(1008, '::1', 'Poland', '', '', '', '/PHP_CART/control_panel/login', '', 'Google Chrome', 'Linux', '2019-12-07 19:40:53'),
(1009, '::1', 'Poland', '', 'Mazovia', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login', 'Google Chrome', 'Linux', '2019-12-07 19:41:04'),
(1010, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 19:41:18'),
(1011, '::1', 'Poland', '', 'Mazovia', '', '/PHP_CART/control_panel/securityCode.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 19:41:18'),
(1012, '::1', 'Unknown countryyyy', '', 'Mazovia', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 19:43:08'),
(1013, '::1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 19:44:30'),
(1014, '::1', 'Poland', '', '', '', '/PHP_CART/control_panel/securityCode.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 19:44:31'),
(1015, '::1', 'Unknown countryyyy', 'PL', 'Mazovia', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-07 19:44:50'),
(1016, '::1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-07 19:49:32'),
(1017, '::1', 'Poland', 'PL', 'Mazovia', '', '/PHP_CART/control_panel/login', '', 'Google Chrome', 'Linux', '2019-12-07 19:54:51'),
(1018, '::1', 'Poland', '', '', '', '/PHP_CART/control_panel/securityCode.php', '', 'Google Chrome', 'Linux', '2019-12-07 19:55:48'),
(1019, '::1', 'Unknown countryyyy', '', 'Mazovia', '', '/PHP_CART/control_panel/login', '', 'Google Chrome', 'Linux', '2019-12-07 19:56:00'),
(1020, '::1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login', '', 'Google Chrome', 'Linux', '2019-12-07 19:56:08'),
(1021, '::1', 'Poland', '', '', '', '/PHP_CART/control_panel/login', '', 'Google Chrome', 'Linux', '2019-12-07 19:56:37'),
(1022, '::1', 'Poland', '', 'Mazovia', '', '/PHP_CART/control_panel/login', '', 'Google Chrome', 'Linux', '2019-12-07 20:03:52'),
(1023, '::1', 'Poland', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-08 22:56:31'),
(1024, '::1', 'Unknown countryyyy', '', 'Mazovia', '', '/PHP_CART/control_panel/securityCode.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Linux', '2019-12-08 23:16:16'),
(1025, '::1', 'Unknown countryyyy', 'PL', 'Mazovia', '', '/PHP_CART/control_panel/logout', '', 'Google Chrome', 'Linux', '2019-12-08 23:16:59'),
(1026, '::1', 'Poland', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-08 23:16:59'),
(1027, '::1', 'Unknown countryyyy', '', 'Mazovia', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Linux', '2019-12-08 23:17:23'),
(1028, '::1', 'Unknown countryyyy', 'PL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-08 23:17:23'),
(1029, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Linux', '2019-12-08 23:18:58'),
(1030, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-10 02:47:25'),
(1031, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/logout', '', 'Firefox', 'Linux', '2019-12-10 02:48:20'),
(1032, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-10 02:48:45'),
(1033, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/logout.php', '', 'Firefox', 'Linux', '2019-12-10 02:48:48'),
(1034, '127.0.0.1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Firefox', 'Linux', '2019-12-10 02:48:48'),
(1035, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 18:44:50'),
(1036, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 18:45:35'),
(1037, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:00:13'),
(1038, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:00:53'),
(1039, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:01:14'),
(1040, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:01:14'),
(1041, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:01:15'),
(1042, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:01:15'),
(1043, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/securityCode.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-12 19:01:36'),
(1044, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-12 19:01:36'),
(1045, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:01:43'),
(1046, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:02:37'),
(1047, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:02:48'),
(1048, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:02:49'),
(1049, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:03:07'),
(1050, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:03:18'),
(1051, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/securitycode.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:06:12'),
(1052, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:06:12'),
(1053, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:08:26'),
(1054, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/securityCode.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-12 19:08:57'),
(1055, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-12 19:08:57'),
(1056, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:09:04'),
(1057, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:09:04'),
(1058, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:27:22'),
(1059, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/index.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:28:26'),
(1060, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:28:38'),
(1061, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 19:32:15'),
(1062, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 21:52:47'),
(1063, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-12 22:09:54'),
(1064, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-14 13:31:03'),
(1065, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-14 13:59:26'),
(1066, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-14 13:59:30'),
(1067, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-14 13:59:31'),
(1068, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/index.php', '', 'Google Chrome', 'Windows 7', '2019-12-14 13:59:39'),
(1069, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-14 13:59:45'),
(1070, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-14 14:11:52'),
(1071, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-14 14:11:56'),
(1072, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 17:53:39'),
(1073, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 17:55:01'),
(1074, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 17:55:01'),
(1075, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 17:55:09'),
(1076, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 17:55:38'),
(1077, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 17:56:27'),
(1078, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/index.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 17:56:38'),
(1079, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 17:56:49'),
(1080, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 17:57:20'),
(1081, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 17:57:22'),
(1082, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 17:59:05'),
(1083, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 17:59:05'),
(1084, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 17:59:11'),
(1085, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:00:18'),
(1086, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:00:19'),
(1087, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:00:39'),
(1088, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:01:08'),
(1089, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:01:10'),
(1090, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:01:24'),
(1091, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/securityCode.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-18 18:02:50'),
(1092, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-18 18:02:50'),
(1093, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-18 18:04:22'),
(1094, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-18 18:04:23'),
(1095, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-18 18:11:03'),
(1096, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:11:19'),
(1097, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:11:45'),
(1098, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:11:49'),
(1099, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:11:57'),
(1100, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:11:57'),
(1101, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:12:00'),
(1102, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:12:01'),
(1103, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:15:55'),
(1104, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/securityCode.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-18 18:16:02'),
(1105, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-18 18:16:03'),
(1106, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:16:36'),
(1107, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:19:25'),
(1108, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:20:27'),
(1109, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:20:28'),
(1110, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:21:03'),
(1111, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:21:21'),
(1112, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:21:38'),
(1113, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 18:22:07'),
(1114, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 19:35:08'),
(1115, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 20:25:43'),
(1116, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 20:34:31'),
(1117, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 20:34:32'),
(1118, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 20:35:09'),
(1119, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-18 20:40:48'),
(1120, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 16:14:16'),
(1121, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 16:15:48'),
(1122, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 16:15:49'),
(1123, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 16:17:25'),
(1124, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 16:19:21'),
(1125, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 16:41:12'),
(1126, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 16:41:22'),
(1127, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 16:41:22'),
(1128, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 16:43:24'),
(1129, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 17:26:39'),
(1130, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 17:26:46'),
(1131, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 17:26:47'),
(1132, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 22:12:05'),
(1133, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:12:14'),
(1134, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 22:12:29'),
(1135, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 22:12:29'),
(1136, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 22:29:35'),
(1137, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 22:31:28'),
(1138, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 22:32:00'),
(1139, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:32:06'),
(1140, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:33:35'),
(1141, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:34:44'),
(1142, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/securityCode.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:34:44'),
(1143, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:34:45'),
(1144, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:36:34'),
(1145, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/securityCode.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:36:35'),
(1146, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:36:35'),
(1147, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:36:46'),
(1148, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/securityCode.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:36:46'),
(1149, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:36:47'),
(1150, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:37:34'),
(1151, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:37:41'),
(1152, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-19 22:42:20'),
(1153, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-19 22:42:32'),
(1154, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-20 19:17:33'),
(1155, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-20 19:17:54'),
(1156, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-20 19:17:54'),
(1157, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-20 19:18:03'),
(1158, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-20 19:18:14'),
(1159, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-20 19:18:14'),
(1160, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-21 13:40:10'),
(1161, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-21 13:40:41'),
(1162, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-21 13:40:41'),
(1163, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-21 13:41:37'),
(1164, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-21 13:42:47'),
(1165, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-21 13:42:47'),
(1166, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-21 13:43:39'),
(1167, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-21 13:44:43'),
(1168, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-21 13:44:43'),
(1169, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-21 13:44:50');
INSERT INTO `sc_traffic` (`trafficID`, `trafficIP`, `trafficCountryName`, `trafficCountryCode`, `trafficState`, `trafficCity`, `trafficAddressURL`, `trafficAddressFrom`, `trafficBrowser`, `trafficOS`, `trafficDate`) VALUES
(1170, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-21 16:45:10'),
(1171, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-21 16:50:28'),
(1172, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-21 23:11:19'),
(1173, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-23 11:32:44'),
(1174, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-23 11:32:51'),
(1175, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-23 11:32:52'),
(1176, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-23 11:32:59'),
(1177, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-23 11:41:58'),
(1178, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-23 11:42:03'),
(1179, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-23 11:42:13'),
(1180, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-23 11:47:22'),
(1181, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-23 11:47:26'),
(1182, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-23 11:47:34'),
(1183, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-24 17:42:24'),
(1184, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-24 17:42:32'),
(1185, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-24 17:42:33'),
(1186, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-24 17:42:43'),
(1187, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-24 17:44:29'),
(1188, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-26 15:03:38'),
(1189, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-26 15:03:47'),
(1190, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-26 15:03:47'),
(1191, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-26 15:03:56'),
(1192, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-27 13:28:34'),
(1193, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2019-12-27 13:28:41'),
(1194, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-27 13:28:41'),
(1195, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-27 13:28:48'),
(1196, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-27 13:46:46'),
(1197, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-27 13:47:50'),
(1198, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-27 13:52:12'),
(1199, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-27 13:56:04'),
(1200, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-27 13:56:19'),
(1201, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-27 13:58:22'),
(1202, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2019-12-27 13:58:26'),
(1203, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2019-12-27 13:58:38'),
(1204, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-05 12:56:14'),
(1205, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-05 13:00:07'),
(1206, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-05 13:05:06'),
(1207, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2020-01-05 13:05:13'),
(1208, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-05 13:05:13'),
(1209, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-05 13:05:22'),
(1210, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-05 13:33:44'),
(1211, '::1', 'Unknown countryyyy', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-07 16:15:24'),
(1212, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-07 16:15:44'),
(1213, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2020-01-07 16:15:51'),
(1214, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-07 16:15:51'),
(1215, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-07 16:15:59'),
(1216, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-07 16:53:48'),
(1217, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-07 16:53:56'),
(1218, '::1', 'Unknown countryyyy', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-07 16:54:25'),
(1219, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-07 16:54:29'),
(1220, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-07 16:54:36'),
(1221, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-07 17:01:14'),
(1222, '::1', 'Netherlands', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-07 17:01:22'),
(1223, '::1', 'Unknown countryyyy', 'NL', '', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-07 19:19:47'),
(1224, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-07 19:19:56'),
(1225, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2020-01-08 06:47:48'),
(1226, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-08 06:47:48'),
(1227, '::1', 'Netherlands', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-08 06:47:56'),
(1228, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-08 06:50:42'),
(1229, '::1', 'Unknown countryyyy', 'NL', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-08 06:50:50'),
(1230, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-08 06:52:03'),
(1231, '::1', 'Unknown countryyyy', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-08 06:52:08'),
(1232, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-08 06:52:11'),
(1233, '::1', 'Netherlands', '', '', 'Udenhout', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-08 06:52:18'),
(1234, '::1', 'Netherlands', 'NL', '', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-08 07:01:59'),
(1235, '::1', 'Unknown countryyyy', '', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-08 07:02:05'),
(1236, '::1', 'Unknown countryyyy', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-08 07:02:13'),
(1237, '::1', 'Netherlands', 'NL', '', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-08 07:02:35'),
(1238, '::1', 'Netherlands', '', 'North Brabant', '', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-08 13:27:20'),
(1239, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/logout.php', '', 'Google Chrome', 'Windows 7', '2020-01-08 13:27:29'),
(1240, '::1', 'Netherlands', '', 'North Brabant', 'Udenhout', '/PHP_CART/control_panel/login.php', '', 'Google Chrome', 'Windows 7', '2020-01-08 13:27:29'),
(1241, '::1', 'Netherlands', 'NL', 'North Brabant', '', '/PHP_CART/control_panel/login.php', 'http://localhost/PHP_CART/control_panel/login.php', 'Google Chrome', 'Windows 7', '2020-01-08 13:27:37');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `sc_admins`
--
ALTER TABLE `sc_admins`
  ADD PRIMARY KEY (`adminID`);

--
-- Indeksy dla tabeli `sc_coupons`
--
ALTER TABLE `sc_coupons`
  ADD PRIMARY KEY (`couponID`);

--
-- Indeksy dla tabeli `sc_media`
--
ALTER TABLE `sc_media`
  ADD PRIMARY KEY (`mediaID`);

--
-- Indeksy dla tabeli `sc_members`
--
ALTER TABLE `sc_members`
  ADD PRIMARY KEY (`memberID`);

--
-- Indeksy dla tabeli `sc_menus`
--
ALTER TABLE `sc_menus`
  ADD PRIMARY KEY (`menuID`);

--
-- Indeksy dla tabeli `sc_menus_links`
--
ALTER TABLE `sc_menus_links`
  ADD PRIMARY KEY (`linkID`);

--
-- Indeksy dla tabeli `sc_options`
--
ALTER TABLE `sc_options`
  ADD PRIMARY KEY (`optionID`);

--
-- Indeksy dla tabeli `sc_orders`
--
ALTER TABLE `sc_orders`
  ADD PRIMARY KEY (`orderID`);

--
-- Indeksy dla tabeli `sc_orders_items`
--
ALTER TABLE `sc_orders_items`
  ADD PRIMARY KEY (`itemID`);

--
-- Indeksy dla tabeli `sc_orders_payments`
--
ALTER TABLE `sc_orders_payments`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indeksy dla tabeli `sc_orders_shippings`
--
ALTER TABLE `sc_orders_shippings`
  ADD PRIMARY KEY (`shippingID`);

--
-- Indeksy dla tabeli `sc_pages`
--
ALTER TABLE `sc_pages`
  ADD PRIMARY KEY (`pageID`);

--
-- Indeksy dla tabeli `sc_products`
--
ALTER TABLE `sc_products`
  ADD PRIMARY KEY (`productID`);

--
-- Indeksy dla tabeli `sc_products_brands`
--
ALTER TABLE `sc_products_brands`
  ADD PRIMARY KEY (`brandID`);

--
-- Indeksy dla tabeli `sc_products_categories`
--
ALTER TABLE `sc_products_categories`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indeksy dla tabeli `sc_products_reviews`
--
ALTER TABLE `sc_products_reviews`
  ADD PRIMARY KEY (`reviewID`);

--
-- Indeksy dla tabeli `sc_sidebars`
--
ALTER TABLE `sc_sidebars`
  ADD PRIMARY KEY (`sidebarID`);

--
-- Indeksy dla tabeli `sc_sidebar_widgets`
--
ALTER TABLE `sc_sidebar_widgets`
  ADD PRIMARY KEY (`widgetID`);

--
-- Indeksy dla tabeli `sc_themes`
--
ALTER TABLE `sc_themes`
  ADD PRIMARY KEY (`themeID`);

--
-- Indeksy dla tabeli `sc_traffic`
--
ALTER TABLE `sc_traffic`
  ADD PRIMARY KEY (`trafficID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `sc_admins`
--
ALTER TABLE `sc_admins`
  MODIFY `adminID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `sc_coupons`
--
ALTER TABLE `sc_coupons`
  MODIFY `couponID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_media`
--
ALTER TABLE `sc_media`
  MODIFY `mediaID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_members`
--
ALTER TABLE `sc_members`
  MODIFY `memberID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_menus`
--
ALTER TABLE `sc_menus`
  MODIFY `menuID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_menus_links`
--
ALTER TABLE `sc_menus_links`
  MODIFY `linkID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_options`
--
ALTER TABLE `sc_options`
  MODIFY `optionID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT dla tabeli `sc_orders`
--
ALTER TABLE `sc_orders`
  MODIFY `orderID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_orders_items`
--
ALTER TABLE `sc_orders_items`
  MODIFY `itemID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_orders_payments`
--
ALTER TABLE `sc_orders_payments`
  MODIFY `paymentID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_orders_shippings`
--
ALTER TABLE `sc_orders_shippings`
  MODIFY `shippingID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_pages`
--
ALTER TABLE `sc_pages`
  MODIFY `pageID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `sc_products`
--
ALTER TABLE `sc_products`
  MODIFY `productID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_products_brands`
--
ALTER TABLE `sc_products_brands`
  MODIFY `brandID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_products_categories`
--
ALTER TABLE `sc_products_categories`
  MODIFY `categoryID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_products_reviews`
--
ALTER TABLE `sc_products_reviews`
  MODIFY `reviewID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_sidebars`
--
ALTER TABLE `sc_sidebars`
  MODIFY `sidebarID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `sc_sidebar_widgets`
--
ALTER TABLE `sc_sidebar_widgets`
  MODIFY `widgetID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_themes`
--
ALTER TABLE `sc_themes`
  MODIFY `themeID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sc_traffic`
--
ALTER TABLE `sc_traffic`
  MODIFY `trafficID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1242;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
