-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2019 at 04:43 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `huongdichvu`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` text NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `reset_password` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `full_name`, `email`, `username`, `password`, `reset_password`, `active`, `created_at`, `updated_at`) VALUES
(1, 'trần viết trưởng', 'tranviettruong1998@gmail.com', 'administrator', '123', NULL, 1, NULL, NULL);

--
-- Triggers `admin`
--
DELIMITER $$
CREATE TRIGGER `44444431` BEFORE UPDATE ON `admin` FOR EACH ROW SET NEW.updated_at = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `123123123123` BEFORE INSERT ON `admin` FOR EACH ROW SET NEW.created_at = NOW(), NEW.updated_at = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `tag` text,
  `vote` int(11) NOT NULL,
  `active` int(11) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `id_question`, `id_user`, `content`, `tag`, `vote`, `active`, `created_at`, `updated_at`) VALUES
(13, 36, 23, '<p>hah ahha hah ahha h hah ah hah hah ha hha ha haha ha haha</p>\n', 'tên miền,tên miền đẹp', 1, 1, '2019-09-30 18:33:18', 2147483647);

--
-- Triggers `answer`
--
DELIMITER $$
CREATE TRIGGER `1as` BEFORE INSERT ON `answer` FOR EACH ROW SET NEW.created_at = NOW(), NEW.updated_at = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `2a` BEFORE UPDATE ON `answer` FOR EACH ROW SET NEW.updated_at = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auto_giam_count_reply` BEFORE DELETE ON `answer` FOR EACH ROW UPDATE question SET question.count_reply = question.count_reply - 1 WHERE question.id = OLD.id_question
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auto_tang_count_reply` AFTER INSERT ON `answer` FOR EACH ROW UPDATE question SET question.count_reply = question.count_reply + 1 WHERE question.id = NEW.id_question
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `catagory`
--

CREATE TABLE `catagory` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catagory`
--

INSERT INTO `catagory` (`id`, `image`, `name`, `rank`, `created_at`, `updated_at`) VALUES
(2, 'public/upload/catagory/1571693606icons8_tractor_96px.png', 'Nông nghiệp', 4, '2019-09-24 19:26:29', '2019-09-25 21:39:16'),
(3, 'public/upload/catagory/696258064icons8_hospital_3_96px.png', 'Y tế', 5, '2019-09-24 19:27:09', '2019-09-25 21:39:18'),
(16, 'public/upload/catagory/1316256150icons8_media_queries_96px.png', 'Công nghệ', 1, '2019-09-24 21:16:55', '2019-09-25 21:39:09'),
(17, 'public/upload/catagory/717986872icons8_student_male_96px.png', 'Giáo dục', 3, '2019-09-25 21:37:16', '2019-09-25 21:39:12'),
(18, 'public/upload/catagory/739613276icons8_link_company_parent_96px.png', 'Bất động sản', 2, '2019-09-25 21:38:34', '2019-09-25 21:39:11'),
(19, 'public/upload/catagory/182524334icons8_Healthy_Food_Calories_Calculator_96px.png', 'Thực phẩm', 6, '2019-09-25 21:46:48', '2019-09-25 21:47:44'),
(20, 'public/upload/catagory/836498596icons8_nature_96px.png', 'Môi trường', 7, '2019-09-25 21:48:55', '2019-09-25 21:50:18'),
(21, 'public/upload/catagory/1522363727icons8_delivery_96px.png', 'Vấn đề pháp lý', 8, '2019-09-25 21:54:39', '2019-09-29 17:51:29'),
(22, 'public/upload/catagory/1692089907icons8_doctors_laboratory_coat_96px.png', 'Thời trang', 9, '2019-09-25 21:56:13', '2019-09-25 21:56:23'),
(23, 'public/upload/catagory/259839968icons8_worker_male_96px.png', 'Xây dựng', 10, '2019-09-25 22:01:13', '2019-09-25 22:01:20'),
(24, 'public/upload/catagory/1477128289icons8_airplane_take_off_96px.png', 'Du lịch, dịch vụ', 11, '2019-09-25 22:03:31', '2019-09-25 22:04:00'),
(25, 'public/upload/catagory/519323757icons8_europe_96px.png', 'Lĩnh vực khác', 12, '2019-09-25 22:04:54', '2019-09-25 22:05:03');

--
-- Triggers `catagory`
--
DELIMITER $$
CREATE TRIGGER `1ct` BEFORE INSERT ON `catagory` FOR EACH ROW SET NEW.created_at = NOW(), NEW.updated_at = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `2ct` BEFORE UPDATE ON `catagory` FOR EACH ROW SET NEW.updated_at = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `id_news` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `content` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `comment`
--
DELIMITER $$
CREATE TRIGGER `1ccc` BEFORE INSERT ON `comment` FOR EACH ROW SET NEW.created_at = NOW(), NEW.updated_at = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `22ccc` BEFORE UPDATE ON `comment` FOR EACH ROW SET NEW.updated_at = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `contact`
--
DELIMITER $$
CREATE TRIGGER `1c` BEFORE INSERT ON `contact` FOR EACH ROW SET NEW.created_at = NOW(), NEW.updated_at = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `2c` BEFORE UPDATE ON `contact` FOR EACH ROW SET NEW.updated_at = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` text NOT NULL,
  `content` text NOT NULL,
  `post_by` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `news`
--
DELIMITER $$
CREATE TRIGGER `11123` BEFORE INSERT ON `news` FOR EACH ROW SET NEW.created_at = NOW(), NEW.updated_at = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `1232333` BEFORE UPDATE ON `news` FOR EACH ROW SET NEW.updated_at = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `id_catagory` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `tag` text,
  `view` bigint(20) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL DEFAULT '0',
  `count_reply` int(11) NOT NULL DEFAULT '0',
  `active` int(11) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `id_catagory`, `id_user`, `title`, `slug`, `content`, `tag`, `view`, `vote`, `count_reply`, `active`, `created_at`, `updated_at`) VALUES
(36, 16, 23, 'Cách có tên miền mình mong muốn', 'cach-co-ten-mien-minh-mong-muon', '<p><strong>Ch&uacute;ng t&ocirc;i đang cần một t&ecirc;n miền cho website của c&ocirc;ng ty m&igrave;nh nhưng kh&ocirc;ng biết&nbsp;l&agrave;m thế n&agrave;o để ch&uacute;ng t&ocirc;i c&oacute; được t&ecirc;n miền m&agrave; m&igrave;nh muốn?</strong></p>\n', 'tên miền,tên miền đẹp', 3, 1, 1, 1, '2019-09-29 17:08:07', '2019-09-30 20:23:53'),
(37, 18, 23, 'Số vốn để kinh doanh bất động sản', 'so-von-de-kinh-doanh-bat-dong-san', '<p>T&ocirc;i đang c&oacute; một v&agrave;i &yacute; định để khởi nghiệp với bất động sản, t&ocirc;i n&ecirc;n d&agrave;nh ra số vốn bao nhi&ecirc;u để khởi nghiệp với bất động sản</p>\n', 'bất động sản,vốn,kinh doanh', 3, 0, 0, 1, '2019-09-29 17:49:14', '2019-09-30 21:06:58'),
(38, 25, 23, 'Tôi muốn khởi sự kinh doanh nhưng không có vốn, tôi phải làm gì đây???', 'toi-muon-khoi-su-kinh-doanh-nhung-khong-co-von-toi-phai-lam-gi-day', '<p>&ldquo;T&ocirc;i đang ch&aacute;n nản với thực tại &ndash; một cuộc sống m&agrave; h&agrave;ng ng&agrave;y cứ 8h s&aacute;ng s&aacute;ch cặp đi l&agrave;m c&ocirc;ng ty đến 5h chiều lại cắp cặp s&aacute;ch về nh&agrave; v&agrave; đợi chờ đến ng&agrave;y trả lương cuối th&aacute;ng trong khi đ&atilde; ti&ecirc;u hết khoản tiền lương của th&aacute;ng trước từ trước đ&oacute; mấy ng&agrave;y rồi. T&ocirc;i đang lo lắng cho những kế hoạch tương lai đầy tham vọng nhưng lại chưa t&igrave;m được hướng đi n&agrave;o khả thi để thực hiện n&oacute;, t&ocirc;i muốn kiếm thật nhiều tiền để được sở hữu những thứ m&igrave;nh th&iacute;ch, l&agrave;m những thứ m&igrave;nh muốn l&agrave;m, được nghỉ tho&aacute;i m&aacute;i khi ốm đau, được đầu tư cho con c&aacute;i học h&agrave;nh, được đi du lịch đ&oacute; đ&acirc;y, được&hellip;l&agrave;m chủ đồng tiền v&agrave; l&agrave;m cuộc sống của m&igrave;nh. Nhưng t&ocirc;i thực sự kh&ocirc;ng c&oacute; vốn t&iacute;ch lũy để bắt đầu khởi nghiệp, những &yacute; tưởng đến rồi lại đi, những kế hoạch lập rồi lại bỏ. T&ocirc;i thấy rằng cứ tiếp tục thế n&agrave;y l&agrave; kh&ocirc;ng ổn nhưng T&ocirc;i phải bắt đầu từ đ&acirc;u đ&acirc;y???&rdquo;</p>\n', 'khởi nghiệp,kinh doanh', 2, 0, 0, 1, '2019-09-29 17:56:28', '2019-09-30 17:21:20');

--
-- Triggers `question`
--
DELIMITER $$
CREATE TRIGGER `1q` BEFORE INSERT ON `question` FOR EACH ROW SET NEW.created_at = NOW(), NEW.updated_at = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `2q` BEFORE UPDATE ON `question` FOR EACH ROW SET NEW.updated_at = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `slogan`
--

CREATE TABLE `slogan` (
  `id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `post_by` varchar(255) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slogan`
--

INSERT INTO `slogan` (`id`, `author`, `image`, `description`, `content`, `post_by`, `rank`, `active`, `created_at`, `updated_at`) VALUES
(18, 'Thủ tướng Nguyễn Xuân Phúc', 'public/upload/slogan/1788323647thu-tuong_mxmo.jpg', 'Thủ tướng nước CHXHCNVN', 'Chưa bao giờ khởi nghiệp có điều kiện như lúc này.', 'trần viết trưởng', 1, 1, '2019-09-20 19:39:51', '2019-09-26 13:49:47'),
(19, 'Nguyễn Mạnh Hùng', 'public/upload/slogan/999471708btnguyenmanhhung_qcyp.jpg', 'Bộ trưởng bộ thông tin và truyền thông', 'Điều kiện quan trọng nhất của khởi nghiệp là trong tay chẳng có gì cả. Chúng ta phải bán đi cái xe máy của mình bán đi cả chiếc áo vest đang mặc thì mới là khởi nghiệp. Vì chỉ khi ấy mình mới xả thân.', 'trần viết trưởng', 5, 1, '2019-09-20 19:44:26', '2019-09-25 21:05:39'),
(20, 'Trần Bá Dương', 'public/upload/slogan/55568417photo-1-1520415240196945071866-1035.jpg', 'Chủ tịch HĐQT công ty cổ phần ô tô Trường Hải', 'Chúng ta đang mải mê cuốn theo phong trào mà quên đi mất giá trị khởi nghiệp.', 'trần viết trưởng', 4, 1, '2019-09-20 19:46:58', '2019-09-25 21:05:37'),
(21, 'Trịnh Văn Quyết ', 'public/upload/slogan/1928435683trinh_van_quyet_zing.jpg', 'Chủ tịch HĐQT FLC', 'Đừng sợ thất bại khi khởi nghiệp.', 'trần viết trưởng', 2, 1, '2019-09-20 19:48:49', '2019-09-25 21:05:33'),
(22, 'Trương Gia Bình ', 'public/upload/slogan/1341433286truong-gia-binh-1469586921563-0-0-936-1834-crop-1469586958690.jpg', 'Chủ tịch HĐQT FPT', 'Làm startup là mạo hiểm, đôi khi bất cần.', 'trần viết trưởng', 1, 1, '2019-09-20 19:50:02', '2019-09-25 21:11:40');

--
-- Triggers `slogan`
--
DELIMITER $$
CREATE TRIGGER `123123` BEFORE INSERT ON `slogan` FOR EACH ROW SET NEW.created_at = NOW(), NEW.updated_at = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `2222222` BEFORE UPDATE ON `slogan` FOR EACH ROW SET NEW.updated_at = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sub_comment`
--

CREATE TABLE `sub_comment` (
  `id` int(11) NOT NULL,
  `id_comment` int(11) NOT NULL,
  `id_user_reply` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `sub_comment`
--
DELIMITER $$
CREATE TRIGGER `1s` BEFORE INSERT ON `sub_comment` FOR EACH ROW SET NEW.created_at = NOW(), NEW.updated_at = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `2s` BEFORE UPDATE ON `sub_comment` FOR EACH ROW SET NEW.updated_at = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(11, 'tên miền'),
(12, 'tên miền đẹp'),
(13, 'bất động sản'),
(14, 'vốn'),
(15, 'kinh doanh'),
(16, 'khởi nghiệp'),
(17, 'kinh doanh');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `code_email` text NOT NULL,
  `email_verified` int(11) DEFAULT '0',
  `reset_password` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `tag` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `full_name`, `email`, `username`, `password`, `code_email`, `email_verified`, `reset_password`, `active`, `tag`, `created_at`, `updated_at`) VALUES
(23, 'Trần Viết Trưởng', 'tranviettruong1998@gmail.com', 'truong', '$2y$10$8n02muh8l98uWJfTj8a7Ue2SmR8e6ypYSdTyePzFQR2pBwnOfvRIG', '', 1, NULL, 1, '', '2019-09-28 10:46:40', '2019-09-28 11:19:03');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `1u` BEFORE INSERT ON `user` FOR EACH ROW SET NEW.created_at = NOW(), NEW.updated_at = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `2u` BEFORE UPDATE ON `user` FOR EACH ROW SET NEW.updated_at = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `vote_answer`
--

CREATE TABLE `vote_answer` (
  `id` int(11) NOT NULL,
  `id_answer` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vote_answer`
--

INSERT INTO `vote_answer` (`id`, `id_answer`, `id_user`) VALUES
(37, 13, 23);

--
-- Triggers `vote_answer`
--
DELIMITER $$
CREATE TRIGGER `auto_giam_vote_answer` AFTER DELETE ON `vote_answer` FOR EACH ROW UPDATE answer SET answer.vote = answer.vote - 1 WHERE answer.id = OLD.id_answer AND OLD.id_user = OLD.id_user
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auto_vote_answer` AFTER INSERT ON `vote_answer` FOR EACH ROW UPDATE answer SET answer.vote = answer.vote + 1 WHERE answer.id = NEW.id_answer AND NEW.id_user = NEW.id_user
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `vote_question`
--

CREATE TABLE `vote_question` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_question` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vote_question`
--

INSERT INTO `vote_question` (`id`, `id_user`, `id_question`) VALUES
(68, 23, 36);

--
-- Triggers `vote_question`
--
DELIMITER $$
CREATE TRIGGER `auto_giam_vote` AFTER DELETE ON `vote_question` FOR EACH ROW UPDATE question SET question.vote = question.vote - 1 WHERE question.id = OLD.id_question AND question.id_user = OLD.id_user
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auto_tang_vote` AFTER INSERT ON `vote_question` FOR EACH ROW UPDATE question SET question.vote = question.vote + 1 WHERE question.id = NEW.id_question AND question.id_user = NEW.id_user
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foregin_key_question` (`id_question`),
  ADD KEY `foregin_key_user_answer` (`id_user`);

--
-- Indexes for table `catagory`
--
ALTER TABLE `catagory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `123123` (`id_news`),
  ADD KEY `3213231` (`id_user`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `foregin_key_catagory` (`id_catagory`),
  ADD KEY `foregin_key_user` (`id_user`);

--
-- Indexes for table `slogan`
--
ALTER TABLE `slogan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_comment`
--
ALTER TABLE `sub_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aaaaaaaa` (`id_comment`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vote_answer`
--
ALTER TABLE `vote_answer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`id_user`,`id_answer`),
  ADD KEY `aaaaadsadas` (`id_answer`);

--
-- Indexes for table `vote_question`
--
ALTER TABLE `vote_question`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_question` (`id_question`,`id_user`),
  ADD KEY `123svcvxxcv` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `catagory`
--
ALTER TABLE `catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `slogan`
--
ALTER TABLE `slogan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sub_comment`
--
ALTER TABLE `sub_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `vote_answer`
--
ALTER TABLE `vote_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `vote_question`
--
ALTER TABLE `vote_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `foregin_key_question` FOREIGN KEY (`id_question`) REFERENCES `question` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `foregin_key_user_answer` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `123123` FOREIGN KEY (`id_news`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `3213231` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `foregin_key_catagory` FOREIGN KEY (`id_catagory`) REFERENCES `catagory` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `foregin_key_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sub_comment`
--
ALTER TABLE `sub_comment`
  ADD CONSTRAINT `aaaaaaaa` FOREIGN KEY (`id_comment`) REFERENCES `comment` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vote_answer`
--
ALTER TABLE `vote_answer`
  ADD CONSTRAINT `123qweqe` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `aaaaadsadas` FOREIGN KEY (`id_answer`) REFERENCES `answer` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vote_question`
--
ALTER TABLE `vote_question`
  ADD CONSTRAINT `123gdfgdf` FOREIGN KEY (`id_question`) REFERENCES `question` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `123svcvxxcv` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
