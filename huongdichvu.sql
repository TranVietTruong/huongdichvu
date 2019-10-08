-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2019 at 05:39 PM
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
(1, 61, 23, '<p>Căn cứ để kết luận về chất lượng sản phẩm h&agrave;ng h&oacute;a l&agrave; ph&acirc;n b&oacute;n lưu th&ocirc;ng tr&ecirc;n thị trường l&agrave; dựa kết quả thử nghiệm h&agrave;m lượng định lượng c&aacute;c chỉ ti&ecirc;u chất lượng của ph&acirc;n b&oacute;n được thực hiện bởi ph&ograve;ng thử nghiệm được&nbsp;cơ quan quản l&yacute; nh&agrave; nước c&oacute; thẩm quyền chỉ định đối chiếu với chỉ ti&ecirc;u chất lượng của sản phẩm ph&acirc;n b&oacute;n đ&oacute;.</p>\n\n<p>- Trường hợp kết quả thử nghiệm ph&acirc;n b&oacute;n ph&aacute;t hiện h&agrave;m lượng định lượng chỉ ti&ecirc;u chất lượng của sản phẩm ph&acirc;n b&oacute;n&nbsp;&lt;70% so với ti&ecirc;u chuẩn chất lượng hoặc quy chuẩn kỹ thuật, c&ocirc;ng bố &aacute;p dụng hoặc ghi tr&ecirc;n nh&atilde;n, bao b&igrave; sản phẩm ph&acirc;n b&oacute;n th&igrave; được coi l&agrave; ph&acirc;n b&oacute;n giả&nbsp;<em>(</em><em>điểm b khoản 8 Điều 3&nbsp;</em><em>Nghị định số 185/2013/NĐ-CP ng&agrave;y 15/11/2013 của Ch&iacute;nh phủ</em>&nbsp;<em>quy định xử phạt vi phạm h&agrave;nh ch&iacute;nh trong hoạt động thương mại, sản xuất, bu&ocirc;n b&aacute;n h&agrave;ng giả, h&agrave;ng cấm v&agrave; bảo vệ quyền lợi người ti&ecirc;u d&ugrave;ng, được sủa đổi bổ sung bởi Nghị định s&ocirc;́ 124/2015/NĐ-CP ngày 19/11/2015 của Ch&iacute;nh phủ)</em>.</p>\n\n<p>Việc xử phạt vi phạm h&agrave;nh ch&iacute;nh đối với h&agrave;nh vi vi phạm n&agrave;y &aacute;p dụng theo quy định tại Nghị định số 185/2013/NĐ-CP v&agrave; Nghị định s&ocirc;́ 124/2015/NĐ-CP sửa đổi, bổ sung một số điều của Nghị định số 185/2013/NĐ-CP.</p>\n\n<p>- Trong trường hợp kết quả thử nghiệm ph&acirc;n b&oacute;n ph&aacute;t hiện h&agrave;m lượng định lượng chỉ ti&ecirc;u chất lượng &gt;70% v&agrave; nhỏ hơn chỉ ti&ecirc;u chất lượng so với quy chuẩn kỹ thuật đ&atilde; đăng k&yacute;, c&ocirc;ng bố &aacute;p dụng hoặc ghi tr&ecirc;n nh&atilde;n, bao b&igrave; sản phẩm ph&acirc;n b&oacute;n th&igrave; &aacute;p dụng xử phạt vi phạm h&agrave;nh ch&iacute;nh theo quy định tại Nghị định số 119/2017/NĐ-CP ng&agrave;y 01/11/2017 của Ch&iacute;nh phủ quy định về xử phạt vi phạm h&agrave;nh ch&iacute;nh trong lĩnh vực ti&ecirc;u chuẩn, đo lường v&agrave; chất lượng sản phẩm, h&agrave;ng h&oacute;a.</p>\n', 'nông nghiệp,xử phạt,phân hữu cơ', 3, 1, '2019-10-04 07:45:26', 2147483647),
(2, 65, 25, '<p>Thời trang l&agrave; một ng&agrave;nh kh&ocirc;ng phải mới mẻ, nhưng lại l&agrave; ng&agrave;nh lu&ocirc;n c&oacute; sức h&uacute;t đầu tư đ&aacute;ng kinh ngạc từ đủ mọi c&aacute; nh&acirc;n, tổ chức lớn nhỏ. L&agrave; con đường m&agrave; c&oacute; tới 30% người bắt đầu kinh doanh chọn để khởi nghiệp. V&agrave; đ&acirc;y l&agrave; những l&yacute; do giải th&iacute;ch tại sao bạn n&ecirc;n kinh doanh thời trang thay v&igrave; những lĩnh vực kh&aacute;c:</p>\n\n<ul>\n	<li>Tập kh&aacute;ch h&agrave;ng lớn, thị trường tiềm năng v&agrave; chưa từng c&oacute; dấu hiệu chững lại</li>\n	<li>Tỉ lệ rủi ro khi đầu tư thấp hơn một số ng&agrave;nh thương mại kh&aacute;c</li>\n	<li>Vốn khởi nghiệp nhỏ</li>\n	<li>C&aacute;ch thức tiếp cận kh&aacute;ch h&agrave;ng dễ d&agrave;ng</li>\n</ul>\n\n<p>N&oacute;i tỉ lệ rủi ro thấp kh&ocirc;ng c&oacute; nghĩa l&agrave; bạn c&oacute; thể kinh doanh c&oacute; l&atilde;i nếu kh&ocirc;ng c&oacute; một kế hoạch kinh doanh cụ thể v&agrave; quyết t&acirc;m theo đuổi mục ti&ecirc;u. Thực tế, cứ 100 cửa h&agrave;ng mở ra c&oacute; đến gần 40 cửa h&agrave;ng thời trang sang nhượng lại cửa h&agrave;ng hoăc đ&oacute;ng cửa do kinh doanh thất bại. Ch&iacute;nh v&igrave; thế, h&atilde;y nắm chắc những kinh nghiệm đắt gi&aacute; dưới đ&acirc;y để kinh doanh thật th&agrave;nh c&ocirc;ng nh&eacute;!</p>\n', 'kinh nghiệm,quần áo,shop', 2, 1, '2019-10-04 08:00:47', 2147483647),
(3, 67, 31, '<p>Việc thi c&ocirc;ng x&acirc;y dựng c&ocirc;ng tr&igrave;nh, th&igrave; đơn vị thi c&ocirc;ng v&agrave; chủ đầu tư phải c&oacute; giải ph&aacute;p thi c&ocirc;ng hợp l&yacute;, đảm bảo an to&agrave;n x&acirc;y dựng,&hellip; v&agrave; phải c&oacute; giải ph&aacute;p thi c&ocirc;ng ph&ugrave; hợp. Tuyệt đối phải x&acirc;y dựng đ&uacute;ng quy hoạch, đ&uacute;ng lộ giới, khoảng l&ugrave;i x&acirc;y dựng v&agrave; quy chế quản l&yacute; kiến tr&uacute;c x&acirc;y dựng được duyệt của dự &aacute;n.</p>\n', 'công trình,biện pháp,thi công', 3, 1, '2019-10-07 19:29:49', 2147483647),
(4, 68, 32, '<p>Sau khi nghi&ecirc;n cứu, Cục Gi&aacute;m định Nh&agrave; nước về chất lượng c&ocirc;ng tr&igrave;nh x&acirc;y dựng c&oacute; &yacute; kiến như sau:<br />\n1. Theo quy định tại mục 1.2 v&agrave; mục 1.13.18 Th&ocirc;ng tư số 33/2009/TT-BXD ng&agrave;y 30/9/2009 của Bộ X&acirc;y dựng về ban h&agrave;nh quy chuẩn kỹ thuật quốc gia ph&acirc;n loại, ph&acirc;n cấp c&ocirc;ng tr&igrave;nh x&acirc;y dựng d&acirc;n dụng, c&ocirc;ng nghiệp v&agrave; hạ tầng kỹ thuật đ&ocirc; thị th&igrave; c&aacute;c c&ocirc;ng tr&igrave;nh hạ tầng kỹ thuật đ&ocirc; thị bao gồm: kết cấu hạ tầng giao th&ocirc;ng đ&ocirc; thị; cấp nước, tho&aacute;t nước, xử l&yacute; nước thải, chiếu s&aacute;ng, c&ocirc;ng vi&ecirc;n c&acirc;y xanh, nghĩa trang, r&aacute;c thải trong đ&ocirc; thị.<br />\nC&aacute;c c&ocirc;ng tr&igrave;nh giao th&ocirc;ng được n&ecirc;u tại phụ lục C.1 k&egrave;m theo Th&ocirc;ng tư n&agrave;y nằm trong đ&ocirc; thị được xếp v&agrave;o loại kết cấu hạ tầng giao th&ocirc;ng đ&ocirc; thị.<br />\n2. C&aacute;c c&ocirc;ng tr&igrave;nh giao th&ocirc;ng, c&ocirc;ng tr&igrave;nh thủy lợi v&agrave; c&ocirc;ng tr&igrave;nh hạ tầng kỹ thuật ngo&agrave;i đ&ocirc; thị vẫn &aacute;p dụng ph&acirc;n loại, ph&acirc;n cấp theo quy định tại Nghị định số 209/2004/NĐ-CP ng&agrave;y 16/12/2009 của Ch&iacute;nh phủ về quản l&yacute; chất lượng c&ocirc;ng tr&igrave;nh x&acirc;y dựng.<br />\nTheo www.moc.gov.vn</p>\n', 'phân loại,công trình,xây dựng', 2, 1, '2019-10-07 19:33:01', 2147483647);

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
  `slug` varchar(255) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catagory`
--

INSERT INTO `catagory` (`id`, `image`, `name`, `slug`, `rank`, `created_at`, `updated_at`) VALUES
(2, 'public/upload/catagory/1571693606icons8_tractor_96px.png', 'Nông nghiệp', 'nong-nghiep', 4, '2019-09-24 19:26:29', '2019-10-08 21:39:28'),
(3, 'public/upload/catagory/696258064icons8_hospital_3_96px.png', 'Y tế', 'y-te', 5, '2019-09-24 19:27:09', '2019-10-08 21:39:28'),
(16, 'public/upload/catagory/1316256150icons8_media_queries_96px.png', 'Công nghệ', 'cong-nghe', 1, '2019-09-24 21:16:55', '2019-10-08 21:39:27'),
(17, 'public/upload/catagory/717986872icons8_student_male_96px.png', 'Giáo dục', 'giao-duc', 3, '2019-09-25 21:37:16', '2019-10-08 21:39:28'),
(18, 'public/upload/catagory/739613276icons8_link_company_parent_96px.png', 'Bất động sản', 'bat-dong-san', 2, '2019-09-25 21:38:34', '2019-10-08 21:39:28'),
(19, 'public/upload/catagory/182524334icons8_Healthy_Food_Calories_Calculator_96px.png', 'Thực phẩm', 'thuc-pham', 6, '2019-09-25 21:46:48', '2019-10-08 21:39:28'),
(20, 'public/upload/catagory/836498596icons8_nature_96px.png', 'Kinh doanh', 'kinh-doanh', 7, '2019-09-25 21:48:55', '2019-10-08 21:39:28'),
(21, 'public/upload/catagory/1522363727icons8_delivery_96px.png', 'Vấn đề pháp lý', 'van-de-phap-ly', 8, '2019-09-25 21:54:39', '2019-10-08 21:39:28'),
(22, 'public/upload/catagory/1692089907icons8_doctors_laboratory_coat_96px.png', 'Thời trang', 'thoi-trang', 9, '2019-09-25 21:56:13', '2019-10-08 21:39:28'),
(23, 'public/upload/catagory/259839968icons8_worker_male_96px.png', 'Xây dựng', 'xay-dung', 10, '2019-09-25 22:01:13', '2019-10-08 21:39:28'),
(24, 'public/upload/catagory/1477128289icons8_airplane_take_off_96px.png', 'Du lịch, dịch vụ', 'du-lich-dich-vu', 11, '2019-09-25 22:03:31', '2019-10-08 21:39:28'),
(25, 'public/upload/catagory/519323757icons8_europe_96px.png', 'Lĩnh vực khác', 'linh-vuc-khac', 13, '2019-09-25 22:04:54', '2019-10-08 21:39:28'),
(26, 'public/upload/catagory/1582944570icons8_musical_notes_96px.png', 'Giải trí', 'giai-tri', 12, '2019-10-01 17:02:53', '2019-10-08 21:39:28');

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
  `post_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `image`, `title`, `slug`, `content`, `post_by`, `created_at`, `updated_at`, `id_category`) VALUES
(2, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/chuong-trinh-thanh-vien-than-thiet-oded8j6cejx6axo40aj9rgzsqdtti782knnag02v9s.jpg', 'Chương trình thành viên thân thiết (VIP member)', 'chuong-trinh-thanh-vien-than-thiet-vip-member', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/chuong-trinh-thanh-vien-than-thiet-vip-member.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(3, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/trai-phieu-dau-tu-uu-dai-dich-vu-oaxw93pludt118vzjmfx4vo4ztk8sk8ip66720rbgw.png', 'Startup Fintech Findi &#8211; Giấc mơ về một nền tảng gọi vốn bằng trái phiếu cho các Startup', 'startup-fintech-findi-giac-mo-ve-mot-nen-tang-goi-von-bang-trai-phieu-cho-cac-startup', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/startup-fintech-findi-giac-mo-ve-mot-nen-tang-goi-von-bang-trai-phieu-cho-cac-startup.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(4, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/trai-phieu-dau-tu-oaa3ai3lh3nrpz3uds521f5ymq8sv0hpgvkp0991w0.png', 'Findi.vn &#8211; Startup nền tảng phát hành trái phiếu đầu tư cho doanh nghiệp nhỏ, startup', 'findi-vn-startup-nen-tang-phat-hanh-trai-phieu-dau-tu-cho-doanh-nghiep-nho-startup', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/findi-vn-startup-nen-tang-phat-hanh-trai-phieu-dau-tu-cho-doanh-nghiep-nho-startup.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(5, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/nguoi-sang-lap-que-yen-bai-o7rhlmg4sxbu1dhgugkz6o5sekt8p0qnxhgjjocxxs.jpg', 'Startup Quế Việt &#8211; Giấc mơ đưa cây quế Yên Bái trở thành thương hiệu quốc gia, vươn tầm thế giới', 'startup-que-viet-giac-mo-dua-cay-que-yen-bai-tro-thanh-thuong-hieu-quoc-gia-vuon-tam-the-gioi', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/startup-que-viet-giac-mo-dua-cay-que-yen-bai-tro-thanh-thuong-hieu-quoc-gia-vuon-tam-the-gioi.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(6, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/capp-o6s7hc4fye86eck9kdwe1ja6rs02g7hp39ztra7r2o.png', 'ĐÊM GALA CHUNG KẾT CUỘC THI “TÌM KIẾM CEO TƯƠNG LAI” LẦN 09 &#8211; NĂM 2019', 'dem-gala-chung-ket-cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/dem-gala-chung-ket-cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(7, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/ur-o5wiifrm5hscao584j9ipn5omgy6y4zntek1s0dkuo.jpg', 'TÌM KIẾM CEO TƯƠNG LAI LẦN 09 &#8211;  NĂM 2019 RECAP SAU CHẶNG PITCHING &#8211; PHỎNG VẤN NHÓM', 'tim-kiem-ceo-tuong-lai-lan-09-nam-2019-recap-sau-chang-pitching-phong-van-nhom', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/tim-kiem-ceo-tuong-lai-lan-09-nam-2019-recap-sau-chang-pitching-phong-van-nhom.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(8, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/urc2-o5nts9dhj26vet9xz4j7flsarz2nyot0mlkbwwzm4w.png', 'CUỘC THI TÌM KIẾM CEO TƯƠNG LAI LẦN 09 &#8211; NĂM 2019 RECAP CHẶNG HỌC TẠI DOANH NGHIỆP', 'cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019-recap-chang-hoc-tai-doanh-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019-recap-chang-hoc-tai-doanh-nghiep.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(9, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/anh-1-o531c7tz6ttsgr029ey2nu9bk6txr0tnhyvsa36uhc.png', 'CUỘC THI TÌM KIẾM CEO TƯƠNG LAI LẦN 09 &#8211; NĂM 2019 ĐÃ CHÍNH THỨC BẮT ĐẦU VỚI VÒNG 1: VÒNG SƠ LOẠI', 'cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019-da-chinh-thuc-bat-dau-voi-vong-1-vong-so-loai', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019-da-chinh-thuc-bat-dau-voi-vong-1-vong-so-loai.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(10, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/bepos-slide-03-o4uj4arttywx2buw79kisorjeqbl3ymr6n0g5kgp1s.jpg', 'bePOS &#8211; Phần Mềm Quản Lý Bán Hàng 4.0 &#8211; Nhiều hơn 30% khách hàng, nhanh hơn 55 % thời gian!', 'bepos-phan-mem-quan-ly-ban-hang-4-0-nhieu-hon-30-khach-hang-nhanh-hon-55-thoi-gian', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/bepos-phan-mem-quan-ly-ban-hang-4-0-nhieu-hon-30-khach-hang-nhanh-hon-55-thoi-gian.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(11, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/timthumb-o3x8gam5or2nbcjvlkolky1wgx248e5z01pyi2dck0.png', 'SỰ TRỞ LẠI CỦA CUỘC THI “TÌM KIẾM CEO TƯƠNG LAI” LẦN 09 &#8211; NĂM 2019', 'su-tro-lai-cua-cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/su-tro-lai-cua-cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(12, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/dich-vu-xay-dung-ke-hoach-kinh-doanh-o3lur7eb4wojysfdx76k1ts3xxfy8rax6tzsvuzqhc.jpg', 'Xây dựng kế hoạch kinh doanh chỉ với 500k', 'xay-dung-ke-hoach-kinh-doanh-chi-voi-500k', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/xay-dung-ke-hoach-kinh-doanh-chi-voi-500k.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(13, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/huong-dan-su-dung-san-goi-von-o3hzcmdjpwma9877xe04vqz8s3ek5uvfj5d5663hsg.png', 'Hướng dẫn sử dụng sàn gọi vốn hiệu quả', 'huong-dan-su-dung-san-goi-von-hieu-qua', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/huong-dan-su-dung-san-goi-von-hieu-qua.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(14, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/tim-nha-dau-tu-va-goi-von-findi.vn_-o3hwo57w92jsm2c6a6pnglf1tcxb48v8lmu0wr56fk.png', 'Findi.vn – Nền tảng tìm nhà đầu tư và phát triển dự án chuyên nghiệp', 'findi-vn-nen-tang-tim-nha-dau-tu-va-phat-trien-du-an-chuyen-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/findi-vn-nen-tang-tim-nha-dau-tu-va-phat-trien-du-an-chuyen-nghiep.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(15, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/ii-o0gbw4myvyt07qpqpplottyzz02rmx09rexxrdrxe8.png', 'Startup Findi – Nền tảng đầu tư dự án chuyên nghiệp', 'startup-findi-nen-tang-dau-tu-du-an-chuyen-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/startup-findi-nen-tang-dau-tu-du-an-chuyen-nghiep.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(16, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/doi-thoa-cung-sgarktank-nugleu7hgqo4btkg5h1mdq41b5taxm10946oinj7bk.png', 'Đối thoại cùng SharkTank', 'doi-thoai-cung-sharktank', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/doi-thoai-cung-sharktank.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(17, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/photo1528367699577-15283676995771863905761-ntqgkhdevgpe3c5f8tpvcsi7nkhna3266ezjnvg5hs.png', 'Startup Jupviec.vn gọi vốn series A thành công từ Quỹ đầu tư Mỹ', 'startup-jupviec-vn-goi-von-series-a-thanh-cong-tu-quy-dau-tu-my', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/startup-jupviec-vn-goi-von-series-a-thanh-cong-tu-quy-dau-tu-my.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(18, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/nghe-thuat-ban-hang-qua-facebook-tac-gia-kim-thuy-nspw1iomrqkmv5z9jlaxg8uk028dwbc8z4k8geflxs.png', 'Cảnh giác với cuốn sách Nghệ thuật bán hàng qua Facebook', 'canh-giac-voi-cuon-sach-nghe-thuat-ban-hang-qua-facebook', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/canh-giac-voi-cuon-sach-nghe-thuat-ban-hang-qua-facebook.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(19, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/sai-lam-khi-khoi-nghiep-nocoaezv7go9w3tnvk1kmmkbhfhdb2l4ssvlv082j4.png', 'Những suy nghĩ sai lầm khi khởi nghiệp', 'nhung-suy-nghi-sai-lam-khi-khoi-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/nhung-suy-nghi-sai-lam-khi-khoi-nghiep.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(20, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/tu-van-khoi-nghiep-noax68qsjw8mu2a6rwarsi2gn8qjiv7qql4bsj75jk.jpg', 'Dịch vụ tư vấn khởi nghiệp', 'dich-vu-tu-van-khoi-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/dich-vu-tu-van-khoi-nghiep.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(21, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/5-nguyen-tac-tim-tu-van-khoi-nghiep-no9awghrusj3rlfkd4971vc9dkg8t35kzil215ls5s.png', '5 nguyên tắc tìm tư vấn khởi nghiệp', '5-nguyen-tac-tim-tu-van-khoi-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/5-nguyen-tac-tim-tu-van-khoi-nghiep.html', 'div.content-single article', '2019-10-02 08:55:27', '2019-10-02 08:55:27', 1),
(22, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/canh-giac-voi-tu-van-khoi-nghiep-2-no9ahjrxge4dm936f69804s26jxnpwyulq2t05pkuo.png', 'Cảnh giác với các công ty tư vấn khởi nghiệp', 'canh-giac-voi-cac-cong-ty-tu-van-khoi-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/canh-giac-voi-cac-cong-ty-tu-van-khoi-nghiep.html', 'div.content-single article', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(23, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/kinh-nghiem-tim-chuyen-gia-tu-van-khoi-nghiep-no99zvf6xjx9a8rin16sm3d00p25ytski8f33tx3v4.png', 'Kinh nghiệm tìm chuyên gia tư vấn khởi nghiệp', 'kinh-nghiem-tim-chuyen-gia-tu-van-khoi-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/kinh-nghiem-tim-chuyen-gia-tu-van-khoi-nghiep.html', 'div.content-single article', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(24, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/tu-van-khoi-nghiep-la-gi-no99oqzy24p3wcx5l83q3wemyjvsvrmwz6i8nyeths.png', 'Tư vấn khởi nghiệp là gì?', 'tu-van-khoi-nghiep-la-gi', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/tu-van-khoi-nghiep-la-gi.html', 'div.content-single article', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(25, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/lo-trinh-startup-no6iyxt0stsqj112ckjqi6wt8u5xsq94pg73t9oki8.png', 'Quy trình 9 giai đoạn của 1 startup cơ bản', 'quy-trinh-9-giai-doan-cua-1-startup-co-ban', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/quy-trinh-9-giai-doan-cua-1-startup-co-ban.html', 'div.content-single article', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(26, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/thuong-hieu-dia-phuong-1-768x521-no623cwn622dwzko6xv7sigm0kuoc078i7eacejqhc.jpg', 'Khởi nghiệp với các mô hình mang tính địa phương', 'khoi-nghiep-voi-cac-mo-hinh-mang-tinh-dia-phuong', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/khoi-nghiep-voi-cac-mo-hinh-mang-tinh-dia-phuong.html', 'div.content-single article', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(27, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/bao-cao-chi-so-thuong-mai-dien-tu-viet-nam-nnfpd6owznku36eykm0sw76b6mf6iki42qv6vva3f4.png', 'Báo cáo Chỉ số Thương mại điện tử Việt Nam 2018', 'bao-cao-chi-so-thuong-mai-dien-tu-viet-nam-2018', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/tin-tuc/bao-cao-chi-so-thuong-mai-dien-tu-viet-nam-2018.html', 'div.content-single article', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(28, 'https://www.brandsvietnam.com/upload/news/200px/2019/19265_11.jpg', 'Bách Hóa Xanh Bình Phước: Doanh thu 1 ngày bằng siêu thị khác bán cả tháng', '19265-Bach-Hoa-Xanh-Binh-Phuoc-Doanh-thu-1-ngay-bang-sieu-thi-khac-ban-ca-thang', 'https://www.brandsvietnam.com/19265-Bach-Hoa-Xanh-Binh-Phuoc-Doanh-thu-1-ngay-bang-sieu-thi-khac-ban-ca-thang', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(29, 'https://www.brandsvietnam.com/upload/news/200px/2019/image4_1569567287.jpg', 'Tại sao các thương hiệu lại chọn quảng cáo trên Cốc Cốc?', '19245-Tai-sao-cac-thuong-hieu-lai-chon-quang-cao-tren-Coc-Coc', 'https://www.brandsvietnam.com/19245-Tai-sao-cac-thuong-hieu-lai-chon-quang-cao-tren-Coc-Coc', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(30, 'https://www.brandsvietnam.com/upload/news/200px/2019/19266_2.jpg', '[Infographics] Mở cafe nhượng quyền tốn bao nhiêu?', '19266-Infographics-Mo-cafe-nhuong-quyen-ton-bao-nhieu', 'https://www.brandsvietnam.com/19266-Infographics-Mo-cafe-nhuong-quyen-ton-bao-nhieu', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(31, 'https://www.brandsvietnam.com/upload/news/200px/2019/19259_20.jpg', 'Bloomberg: Bamboo Airways đặt mục tiêu chiếm 30% thị phần vào 2020', '19259-Bloomberg-Bamboo-Airways-dat-muc-tieu-chiem-30-thi-phan-vao-2020', 'https://www.brandsvietnam.com/19259-Bloomberg-Bamboo-Airways-dat-muc-tieu-chiem-30-thi-phan-vao-2020', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(32, 'https://www.brandsvietnam.com/upload/news/200px/2019/19268_2.jpg', 'Forever 21 phá sản', '19268-Forever-21-pha-san', 'https://www.brandsvietnam.com/19268-Forever-21-pha-san', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(33, 'https://www.brandsvietnam.com/upload/news/200px/2019/19249_another.jpg', 'Thỏa sức sáng tạo với cuộc thi ý tưởng thiết kế Bộ ấn phẩm Xuân 2020 cùng SHB', '19249-Thoa-suc-sang-tao-voi-cuoc-thi-y-tuong-thiet-ke-Bo-an-pham-Xuan-2020-cung-SHB', 'https://www.brandsvietnam.com/19249-Thoa-suc-sang-tao-voi-cuoc-thi-y-tuong-thiet-ke-Bo-an-pham-Xuan-2020-cung-SHB', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(34, 'https://www.brandsvietnam.com/upload/news/200px/2019/19243_image4.jpg', 'Điểm đặc biệt của các logo thời trang', '19243-Diem-dac-biet-cua-cac-logo-thoi-trang', 'https://www.brandsvietnam.com/19243-Diem-dac-biet-cua-cac-logo-thoi-trang', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(35, 'https://www.brandsvietnam.com/upload/news/200px/2019/19225_10.jpg', 'Từ 7 dòng code, hai anh em xây dựng được đế chế kinh doanh trị giá 35 tỷ USD', '19225-Tu-7-dong-code-hai-anh-em-xay-dung-duoc-de-che-kinh-doanh-tri-gia-35-ty-USD', 'https://www.brandsvietnam.com/19225-Tu-7-dong-code-hai-anh-em-xay-dung-duoc-de-che-kinh-doanh-tri-gia-35-ty-USD', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(36, 'https://www.brandsvietnam.com/upload/news/200px/2019/19222_19222.jpg', 'Xây dựng Brand Trust - Lợi thế cạnh tranh “bị bỏ quên” của doanh nghiệp', '19222-Xay-dung-Brand-Trust-Loi-the-canh-tranh-bi-bo-quen-cua-doanh-nghiep', 'https://www.brandsvietnam.com/19222-Xay-dung-Brand-Trust-Loi-the-canh-tranh-bi-bo-quen-cua-doanh-nghiep', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(37, 'https://www.brandsvietnam.com/upload/news/200px/2019/19242_Untitleddesign.png', 'Shopee dẫn dầu, Sendo bứt tốc cuộc đua bán hàng trên di động', '19242-Shopee-dan-dau-Sendo-but-toc-cuoc-dua-ban-hang-tren-di-dong', 'https://www.brandsvietnam.com/19242-Shopee-dan-dau-Sendo-but-toc-cuoc-dua-ban-hang-tren-di-dong', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(38, 'https://www.brandsvietnam.com/upload/news/200px/2019/19223_2.jpg', 'Apple rót tỷ USD cho Ấn Độ, Indonesia trong khi Việt Nam vẫn là \"kế hoạch\"', '19223-Apple-rot-ty-USD-cho-An-Do-Indonesia-trong-khi-Viet-Nam-van-la-ke-hoach', 'https://www.brandsvietnam.com/19223-Apple-rot-ty-USD-cho-An-Do-Indonesia-trong-khi-Viet-Nam-van-la-ke-hoach', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(39, 'https://www.brandsvietnam.com/upload/news/200px/2019/19233_14.jpg', 'Facebook \"bắt tay\" với Ray-Ban làm kính thông minh thay thế smartphone', '19233-Facebook-bat-tay-voi-RayBan-lam-kinh-thong-minh-thay-the-smartphone', 'https://www.brandsvietnam.com/19233-Facebook-bat-tay-voi-RayBan-lam-kinh-thong-minh-thay-the-smartphone', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(40, 'https://www.brandsvietnam.com/upload/news/200px/2019/19239_avatar.jpg', 'Thiết kế nhận diện của các thương hiệu thời trang cao cấp', '19239-Thiet-ke-nhan-dien-cua-cac-thuong-hieu-thoi-trang-cao-cap', 'https://www.brandsvietnam.com/19239-Thiet-ke-nhan-dien-cua-cac-thuong-hieu-thoi-trang-cao-cap', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(41, 'https://www.brandsvietnam.com/upload/news/200px/2019/19228_9.jpg', 'Siêu ứng dụng giúp Grab chiếm 73% thị phần mảng gọi xe tại Việt Nam', '19228-Sieu-ung-dung-giup-Grab-chiem-73-thi-phan-mang-goi-xe-tai-Viet-Nam', 'https://www.brandsvietnam.com/19228-Sieu-ung-dung-giup-Grab-chiem-73-thi-phan-mang-goi-xe-tai-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(42, 'https://www.brandsvietnam.com/upload/news/200px/2019/19224_2.jpg', 'Tiki đã tiêu sạch hơn 500 tỷ tiền đầu tư của VNG', '19224-Tiki-da-tieu-sach-hon-500-ty-tien-dau-tu-cua-VNG', 'https://www.brandsvietnam.com/19224-Tiki-da-tieu-sach-hon-500-ty-tien-dau-tu-cua-VNG', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(43, 'https://www.brandsvietnam.com/upload/news/200px/2019/19216_15.png', 'AhaMove cán mốc 60.000 đơn hàng mỗi ngày, tạo thu nhập cho 20.000 tài xế', '19216-AhaMove-can-moc-60000-don-hang-moi-ngay-tao-thu-nhap-cho-20000-tai-xe', 'https://www.brandsvietnam.com/19216-AhaMove-can-moc-60000-don-hang-moi-ngay-tao-thu-nhap-cho-20000-tai-xe', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(44, 'https://www.brandsvietnam.com/upload/news/200px/2019/19221_hinhavatar.jpg', 'Mango kỷ niệm 15 năm hoạt động tại Việt Nam', '19221-Mango-ky-niem-15-nam-hoat-dong-tai-Viet-Nam', 'https://www.brandsvietnam.com/19221-Mango-ky-niem-15-nam-hoat-dong-tai-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(45, 'https://www.brandsvietnam.com/upload/news/200px/2019/19229_11.jpg', 'Samsung trả đũa Huawei một cách thâm thúy', '19229-Samsung-tra-dua-Huawei-mot-cach-tham-thuy', 'https://www.brandsvietnam.com/19229-Samsung-tra-dua-Huawei-mot-cach-tham-thuy', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(46, 'https://www.brandsvietnam.com/upload/news/200px/2019/19230_3.jpg', '6 năm Facebook chật vật tìm chỗ đứng trong mảng phần cứng', '19230-6-nam-Facebook-chat-vat-tim-cho-dung-trong-mang-phan-cung', 'https://www.brandsvietnam.com/19230-6-nam-Facebook-chat-vat-tim-cho-dung-trong-mang-phan-cung', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(47, 'https://www.brandsvietnam.com/upload/news/200px/2019/19232_31.jpg', 'Chuỗi tạp hoá của Thế Giới Di Động thu hơn 6.000 tỷ đồng', '19232-Chuoi-tap-hoa-cua-The-Gioi-Di-Dong-thu-hon-6000-ty-dong', 'https://www.brandsvietnam.com/19232-Chuoi-tap-hoa-cua-The-Gioi-Di-Dong-thu-hon-6000-ty-dong', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(48, 'https://www.brandsvietnam.com/upload/news/200px/2019/19213_3.jpg', 'Berocca Performance Mango củng cố định vị “năng lượng” với chuỗi hoạt động tương tác tại các tòa nhà văn phòng', '19213-Berocca-Performance-Mango-cung-co-dinh-vi-nang-luong-voi-chuoi-hoat-dong-tuong-tac-tai-cac-toa-nha-van-phong', 'https://www.brandsvietnam.com/19213-Berocca-Performance-Mango-cung-co-dinh-vi-nang-luong-voi-chuoi-hoat-dong-tuong-tac-tai-cac-toa-nha-van-phong', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(49, 'https://www.brandsvietnam.com/upload/news/200px/2019/19201_image1.jpeg', 'Với 4 tiêu chí này, Coca-Cola đã hoàn toàn chinh phục giới trẻ Việt', '19201-Voi-4-tieu-chi-nay-CocaCola-da-hoan-toan-chinh-phuc-gioi-tre-Viet', 'https://www.brandsvietnam.com/19201-Voi-4-tieu-chi-nay-CocaCola-da-hoan-toan-chinh-phuc-gioi-tre-Viet', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(50, 'https://www.brandsvietnam.com/upload/news/200px/2019/19217_16.jpg', 'Co.op Food vượt mốc 400 cửa hàng', '19217-Coop-Food-vuot-moc-400-cua-hang', 'https://www.brandsvietnam.com/19217-Coop-Food-vuot-moc-400-cua-hang', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(51, 'https://www.brandsvietnam.com/upload/news/200px/2019/19210_thumbnail.png', 'Vascara thay đổi nhận diện, bước đi mới cho nhãn hàng thời trang hàng đầu Việt Nam', '19210-Vascara-thay-doi-nhan-dien-buoc-di-moi-cho-nhan-hang-thoi-trang-hang-dau-Viet-Nam', 'https://www.brandsvietnam.com/19210-Vascara-thay-doi-nhan-dien-buoc-di-moi-cho-nhan-hang-thoi-trang-hang-dau-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(52, 'https://www.brandsvietnam.com/upload/news/200px/2019/19212_19212_Ava_1.jpg', 'Hội An, vịnh Hạ Long, hoa sen Việt vào quảng cáo của Louis Vuitton', '19212-Hoi-An-vinh-Ha-Long-hoa-sen-Viet-vao-quang-cao-cua-Louis-Vuitton', 'https://www.brandsvietnam.com/19212-Hoi-An-vinh-Ha-Long-hoa-sen-Viet-vao-quang-cao-cua-Louis-Vuitton', ' div.reading-content', '2019-10-02 08:55:28', '2019-10-02 08:55:28', 1),
(53, 'https://www.brandsvietnam.com/upload/news/200px/2019/19211_19211_Ava_1.jpg', '6 tháng thay 2 CEO, chuyện gì đang xảy ra với Go-Viet?', '19211-6-thang-thay-2-CEO-chuyen-gi-dang-xay-ra-voi-GoViet', 'https://www.brandsvietnam.com/19211-6-thang-thay-2-CEO-chuyen-gi-dang-xay-ra-voi-GoViet', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(54, 'https://www.brandsvietnam.com/upload/news/200px/2019/19206_2.jpg', 'FPT tăng trưởng 30% lợi nhuận sau thuế', '19206-FPT-tang-truong-30-loi-nhuan-sau-thue', 'https://www.brandsvietnam.com/19206-FPT-tang-truong-30-loi-nhuan-sau-thue', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(55, 'https://www.brandsvietnam.com/upload/news/200px/2019/19208_17.jpg', 'Chủ tịch PNJ Cao Thị Ngọc Dung: Tôi không phải là \'iron women\', tôi chỉ là người dám nhìn thẳng vào sự thật', '19208-Chu-tich-PNJ-Cao-Thi-Ngoc-Dung-Toi-khong-phai-la-iron-women-toi-chi-la-nguoi-dam-nhin-thang-vao-su-that', 'https://www.brandsvietnam.com/19208-Chu-tich-PNJ-Cao-Thi-Ngoc-Dung-Toi-khong-phai-la-iron-women-toi-chi-la-nguoi-dam-nhin-thang-vao-su-that', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(56, 'https://www.brandsvietnam.com/upload/news/200px/2019/19202_9.jpg', 'Bà Lê Diệp Kiều Trang rời Go-Viet', '19202-Ba-Le-Diep-Kieu-Trang-roi-GoViet', 'https://www.brandsvietnam.com/19202-Ba-Le-Diep-Kieu-Trang-roi-GoViet', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(57, 'https://www.brandsvietnam.com/upload/news/200px/2019/19187_22.jpg', 'Facebook bắt tay Microsoft tổ chức cuộc thi phát hiện deepfake', '19187-Facebook-bat-tay-Microsoft-to-chuc-cuoc-thi-phat-hien-deepfake', 'https://www.brandsvietnam.com/19187-Facebook-bat-tay-Microsoft-to-chuc-cuoc-thi-phat-hien-deepfake', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(58, 'https://www.brandsvietnam.com/upload/news/200px/2019/19186_7.png', 'Facebook đe dọa “nồi cơm” của các ứng dụng hẹn hò', '19186-Facebook-de-doa-noi-com-cua-cac-ung-dung-hen-ho', 'https://www.brandsvietnam.com/19186-Facebook-de-doa-noi-com-cua-cac-ung-dung-hen-ho', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(59, 'https://www.brandsvietnam.com/upload/news/200px/2019/19170_1.jpg', 'MB tài trợ gói quản trị cho doanh nghiệp', '19170-MB-tai-tro-goi-quan-tri-cho-doanh-nghiep', 'https://www.brandsvietnam.com/19170-MB-tai-tro-goi-quan-tri-cho-doanh-nghiep', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(60, 'https://www.brandsvietnam.com/upload/news/200px/2019/19196_avatar_adamkhoo.jpg', 'Adam Khoo: từ một đứa trẻ dốt toán thành thần đồng toán học – bắt đầu chỉ với một niềm tin', '19196-Adam-Khoo-tu-mot-dua-tre-dot-toan-thanh-than-dong-toan-hoc-bat-dau-chi-voi-mot-niem-tin', 'https://www.brandsvietnam.com/19196-Adam-Khoo-tu-mot-dua-tre-dot-toan-thanh-than-dong-toan-hoc-bat-dau-chi-voi-mot-niem-tin', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(61, 'https://www.brandsvietnam.com/upload/news/200px/2019/19198_9.jpg', 'HSBC Việt Nam có tổng giám đốc mới', '19198-HSBC-Viet-Nam-co-tong-giam-doc-moi', 'https://www.brandsvietnam.com/19198-HSBC-Viet-Nam-co-tong-giam-doc-moi', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(62, 'https://www.brandsvietnam.com/upload/news/200px/2019/19188_7.jpg', 'Thương vụ thâu tóm 2,3 tỉ USD làm nóng thị trường Insuretech', '19188-Thuong-vu-thau-tom-23-ti-USD-lam-nong-thi-truong-Insuretech', 'https://www.brandsvietnam.com/19188-Thuong-vu-thau-tom-23-ti-USD-lam-nong-thi-truong-Insuretech', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(63, 'https://www.brandsvietnam.com/upload/news/200px/2019/19193_5.jpg', 'Nestlé đã đầu tư 100 triệu đô la vào Hưng Yên', '19193-Nestle-da-dau-tu-100-trieu-do-la-vao-Hung-Yen', 'https://www.brandsvietnam.com/19193-Nestle-da-dau-tu-100-trieu-do-la-vao-Hung-Yen', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(64, 'https://www.brandsvietnam.com/upload/news/200px/2019/19185_thunmbail.jpg', 'Jollibee Việt Nam đưa vào vận hành nhà máy mới và được chứng nhận ISO 22000:2018', '19185-Jollibee-Viet-Nam-dua-vao-van-hanh-nha-may-moi-va-duoc-chung-nhan-ISO-220002018', 'https://www.brandsvietnam.com/19185-Jollibee-Viet-Nam-dua-vao-van-hanh-nha-may-moi-va-duoc-chung-nhan-ISO-220002018', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(65, 'https://www.brandsvietnam.com/upload/news/200px/2019/19171_14.jpg', 'MoMo thêm tính năng thanh toán các dịch vụ của Apple', '19171-MoMo-them-tinh-nang-thanh-toan-cac-dich-vu-cua-Apple', 'https://www.brandsvietnam.com/19171-MoMo-them-tinh-nang-thanh-toan-cac-dich-vu-cua-Apple', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(66, 'https://www.brandsvietnam.com/upload/news/200px/2019/19172_1.jpg', 'Phó chủ tịch Bamboo Airways đầu quân cho Sunshine Group', '19172-Pho-chu-tich-Bamboo-Airways-dau-quan-cho-Sunshine-Group', 'https://www.brandsvietnam.com/19172-Pho-chu-tich-Bamboo-Airways-dau-quan-cho-Sunshine-Group', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(67, 'https://www.brandsvietnam.com/upload/news/200px/2019/19174_107.jpeg', '20 năm của Alibaba dưới thời Jack Ma', '19174-20-nam-cua-Alibaba-duoi-thoi-Jack-Ma', 'https://www.brandsvietnam.com/19174-20-nam-cua-Alibaba-duoi-thoi-Jack-Ma', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(68, 'https://www.brandsvietnam.com/upload/news/200px/2019/19173_20.jpg', 'Sanofi - Aventis Việt Nam nhập khẩu trực tiếp dược phẩm', '19173-Sanofi-Aventis-Viet-Nam-nhap-khau-truc-tiep-duoc-pham', 'https://www.brandsvietnam.com/19173-Sanofi-Aventis-Viet-Nam-nhap-khau-truc-tiep-duoc-pham', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(69, 'https://www.brandsvietnam.com/upload/news/200px/2019/19084_6.jpg', 'Cựu nhân viên khách sạn thành chủ startup dịch vụ lưu trú triệu USD', '19084-Cuu-nhan-vien-khach-san-thanh-chu-startup-dich-vu-luu-tru-trieu-USD', 'https://www.brandsvietnam.com/19084-Cuu-nhan-vien-khach-san-thanh-chu-startup-dich-vu-luu-tru-trieu-USD', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(70, 'https://www.brandsvietnam.com/upload/news/200px/2019/19155_9.jpg', 'Huyền thoại Cô Ba xà bông', '19155-Huyen-thoai-Co-Ba-xa-bong', 'https://www.brandsvietnam.com/19155-Huyen-thoai-Co-Ba-xa-bong', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(71, 'https://www.brandsvietnam.com/upload/news/200px/2019/19164_4.jpg', 'Volkswagen công bố logo mới, ứng dụng logo âm thanh đầu tiên trên thế giới', '19164-Volkswagen-cong-bo-logo-moi-ung-dung-logo-am-thanh-dau-tien-tren-the-gioi', 'https://www.brandsvietnam.com/19164-Volkswagen-cong-bo-logo-moi-ung-dung-logo-am-thanh-dau-tien-tren-the-gioi', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(72, 'https://www.brandsvietnam.com/upload/news/200px/2019/19166_avatar.jpg', 'Macaw: Nền tảng quản lý công việc và dự án với tinh thần Startup', '19166-Macaw-Nen-tang-quan-ly-cong-viec-va-du-an-voi-tinh-than-Startup', 'https://www.brandsvietnam.com/19166-Macaw-Nen-tang-quan-ly-cong-viec-va-du-an-voi-tinh-than-Startup', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(73, 'https://www.brandsvietnam.com/upload/news/200px/2019/19168_15.jpg', 'Viettel Global lãi sáu tháng gần 1.200 tỷ đồng', '19168-Viettel-Global-lai-sau-thang-gan-1200-ty-dong', 'https://www.brandsvietnam.com/19168-Viettel-Global-lai-sau-thang-gan-1200-ty-dong', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(74, 'https://www.brandsvietnam.com/upload/news/200px/2019/11_1568109665.jpg', 'CEO Nissan từ chức', '19167-CEO-Nissan-tu-chuc', 'https://www.brandsvietnam.com/19167-CEO-Nissan-tu-chuc', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(75, 'https://www.brandsvietnam.com/upload/news/200px/2019/19160_14.jpg', 'Thế giằng co của Gojek và Grab trên thị trường giao đồ ăn', '19160-The-giang-co-cua-Gojek-va-Grab-tren-thi-truong-giao-do-an', 'https://www.brandsvietnam.com/19160-The-giang-co-cua-Gojek-va-Grab-tren-thi-truong-giao-do-an', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(76, 'https://www.brandsvietnam.com/upload/news/200px/2019/19161_25.png', 'Nike chi 162 triệu euro thuê Cristiano Ronaldo quảng cáo', '19161-Nike-chi-162-trieu-euro-thue-Cristiano-Ronaldo-quang-cao', 'https://www.brandsvietnam.com/19161-Nike-chi-162-trieu-euro-thue-Cristiano-Ronaldo-quang-cao', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(77, 'https://www.brandsvietnam.com/upload/news/200px/2019/19162_Apple.jpg', 'Lễ ra mắt iPhone sẽ phát trực tiếp trên YouTube', '19162-Le-ra-mat-iPhone-se-phat-truc-tiep-tren-YouTube', 'https://www.brandsvietnam.com/19162-Le-ra-mat-iPhone-se-phat-truc-tiep-tren-YouTube', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(78, 'https://www.brandsvietnam.com/upload/news/200px/2019/19150_5.jpg', 'Samsung và Apple so kè từng chút một ở phân khúc smartphone cao cấp Việt Nam', '19150-Samsung-va-Apple-so-ke-tung-chut-mot-o-phan-khuc-smartphone-cao-cap-Viet-Nam', 'https://www.brandsvietnam.com/19150-Samsung-va-Apple-so-ke-tung-chut-mot-o-phan-khuc-smartphone-cao-cap-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(79, 'https://www.brandsvietnam.com/upload/news/200px/2019/19157_14.png', 'Vincom Retail lý giải gì về kết quả kinh doanh đột biến?', '19157-Vincom-Retail-ly-giai-gi-ve-ket-qua-kinh-doanh-dot-bien', 'https://www.brandsvietnam.com/19157-Vincom-Retail-ly-giai-gi-ve-ket-qua-kinh-doanh-dot-bien', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(80, 'https://www.brandsvietnam.com/upload/news/200px/2019/19134_6.jpg', 'Apple trước đòn thuế mới của Trump', '19134-Apple-truoc-don-thue-moi-cua-Trump', 'https://www.brandsvietnam.com/19134-Apple-truoc-don-thue-moi-cua-Trump', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(81, 'https://www.brandsvietnam.com/upload/news/200px/2019/19159_19159_Ava_1.jpg', '\'Gia tộc dầu hào\' sở hữu 15 tỷ USD tham vọng tồn tại 1.000 năm', '19159-Gia-toc-dau-hao-so-huu-15-ty-USD-tham-vong-ton-tai-1000-nam', 'https://www.brandsvietnam.com/19159-Gia-toc-dau-hao-so-huu-15-ty-USD-tham-vong-ton-tai-1000-nam', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(82, 'https://www.brandsvietnam.com/upload/news/200px/2019/19153_7.png', 'Sovico Group - Grab hợp tác hoàn thiện mạng lưới giao nhận hàng hóa đầu cuối', '19153-Sovico-Group-Grab-hop-tac-hoan-thien-mang-luoi-giao-nhan-hang-hoa-dau-cuoi', 'https://www.brandsvietnam.com/19153-Sovico-Group-Grab-hop-tac-hoan-thien-mang-luoi-giao-nhan-hang-hoa-dau-cuoi', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(83, 'https://www.brandsvietnam.com/upload/news/200px/2019/19140_1.jpg', '7 doanh nghiệp Việt tỷ \"đô\" tốt nhất châu Á - Thái Bình Dương', '19140-7-doanh-nghiep-Viet-ty-do-tot-nhat-chau-A-Thai-Binh-Duong', 'https://www.brandsvietnam.com/19140-7-doanh-nghiep-Viet-ty-do-tot-nhat-chau-A-Thai-Binh-Duong', ' div.reading-content', '2019-10-02 08:55:29', '2019-10-02 08:55:29', 1),
(84, 'https://www.brandsvietnam.com/upload/news/200px/2019/19135_5.jpg', 'Thế Giới Di Động mở loạt cửa hàng điện thoại giá rẻ', '19135-The-Gioi-Di-Dong-mo-loat-cua-hang-dien-thoai-gia-re', 'https://www.brandsvietnam.com/19135-The-Gioi-Di-Dong-mo-loat-cua-hang-dien-thoai-gia-re', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(85, 'https://www.brandsvietnam.com/upload/news/200px/2019/19156_100.jpg', 'Vietjet dẫn đầu thị phần hàng không nội địa 6 tháng, doanh thu quốc tế tăng 51%, doanh thu phụ trợ tăng 43%', '19156-Vietjet-dan-dau-thi-phan-hang-khong-noi-dia-6-thang-doanh-thu-quoc-te-tang-51-doanh-thu-phu-tro-tang-43', 'https://www.brandsvietnam.com/19156-Vietjet-dan-dau-thi-phan-hang-khong-noi-dia-6-thang-doanh-thu-quoc-te-tang-51-doanh-thu-phu-tro-tang-43', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(86, 'https://www.brandsvietnam.com/upload/news/200px/2019/19152_LaVielogo.png', 'Ngưng sử dụng màng co nắp chai La Vie', '19152-Ngung-su-dung-mang-co-nap-chai-La-Vie', 'https://www.brandsvietnam.com/19152-Ngung-su-dung-mang-co-nap-chai-La-Vie', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(87, 'https://www.brandsvietnam.com/upload/news/200px/2019/19136_1.jpg', 'Vinamilk lọt vào Top 200 công ty có doanh thu tỷ USD tốt nhất châu Á - Thái Bình Dương', '19136-Vinamilk-lot-vao-Top-200-cong-ty-co-doanh-thu-ty-USD-tot-nhat-chau-A-Thai-Binh-Duong', 'https://www.brandsvietnam.com/19136-Vinamilk-lot-vao-Top-200-cong-ty-co-doanh-thu-ty-USD-tot-nhat-chau-A-Thai-Binh-Duong', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(88, 'https://www.brandsvietnam.com/upload/news/200px/2019/19244_3.jpg', 'Facebook bắt đầu ẩn số lượt like bài viết', '19244-Facebook-bat-dau-an-so-luot-like-bai-viet', 'https://www.brandsvietnam.com/19244-Facebook-bat-dau-an-so-luot-like-bai-viet', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(89, 'https://www.brandsvietnam.com/upload/news/200px/2019/19240_8.jpg', 'TikTok và cuộc đua thông tin ngắn', '19240-TikTok-va-cuoc-dua-thong-tin-ngan', 'https://www.brandsvietnam.com/19240-TikTok-va-cuoc-dua-thong-tin-ngan', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(90, 'https://www.brandsvietnam.com/upload/news/200px/2019/19234_2.png', 'Vấp phải làn sóng phản đối, chương trình xác minh mới của YouTube phải hủy bỏ', '19234-Vap-phai-lan-song-phan-doi-chuong-trinh-xac-minh-moi-cua-YouTube-phai-huy-bo', 'https://www.brandsvietnam.com/19234-Vap-phai-lan-song-phan-doi-chuong-trinh-xac-minh-moi-cua-YouTube-phai-huy-bo', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(91, 'https://www.brandsvietnam.com/upload/news/200px/2019/19179_5.png', 'Facebook Việt Nam nói gì sau tin \"50 triệu điện thoại người dùng Việt bị lộ\"?', '19179-Facebook-Viet-Nam-noi-gi-sau-tin-50-trieu-dien-thoai-nguoi-dung-Viet-bi-lo', 'https://www.brandsvietnam.com/19179-Facebook-Viet-Nam-noi-gi-sau-tin-50-trieu-dien-thoai-nguoi-dung-Viet-bi-lo', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(92, 'https://www.brandsvietnam.com/upload/news/200px/2019/19126_13.jpg', 'Facebook xem xét bỏ hiển thị lượt thích', '19126-Facebook-xem-xet-bo-hien-thi-luot-thich', 'https://www.brandsvietnam.com/19126-Facebook-xem-xet-bo-hien-thi-luot-thich', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(93, 'https://www.brandsvietnam.com/upload/news/200px/2019/18993_7.png', 'PewPew thông báo rút khỏi giải trí để chuyển sang kinh doanh', '18993-PewPew-thong-bao-rut-khoi-giai-tri-de-chuyen-sang-kinh-doanh', 'https://www.brandsvietnam.com/18993-PewPew-thong-bao-rut-khoi-giai-tri-de-chuyen-sang-kinh-doanh', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(94, 'https://www.brandsvietnam.com/upload/news/200px/2019/18943_google-records-your-voice-searches-and-you-can-hear-them-all-image-cultofandroidcomwp-contentuploads201407Ok-Google-Voice-Search-780x495.png', 'Google thay đổi quan trọng đối với ứng dụng Search', '18943-Google-thay-doi-quan-trong-doi-voi-ung-dung-Search', 'https://www.brandsvietnam.com/18943-Google-thay-doi-quan-trong-doi-voi-ung-dung-Search', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(95, 'https://www.brandsvietnam.com/upload/news/200px/2019/IMG_8798ava_1564456926.jpg', 'MediaStep Software ra mắt nền tảng tạo Web - App kinh doanh', '18944-MediaStep-Software-ra-mat-nen-tang-tao-Web-App-kinh-doanh', 'https://www.brandsvietnam.com/18944-MediaStep-Software-ra-mat-nen-tang-tao-Web-App-kinh-doanh', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(96, 'https://www.brandsvietnam.com/upload/news/200px/2019/18917_3.jpg', 'Facebook chính thức nhận án phạt lịch sử 5 tỷ USD, chấp nhận bị giám sát chặt hơn', '18917-Facebook-chinh-thuc-nhan-an-phat-lich-su-5-ty-USD-chap-nhan-bi-giam-sat-chat-hon', 'https://www.brandsvietnam.com/18917-Facebook-chinh-thuc-nhan-an-phat-lich-su-5-ty-USD-chap-nhan-bi-giam-sat-chat-hon', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(97, 'https://www.brandsvietnam.com/upload/news/200px/2019/18923_2.jpg', 'Chân dung nữ sáng lập 26 tuổi của dự án tiền ảo Facebook', '18923-Chan-dung-nu-sang-lap-26-tuoi-cua-du-an-tien-ao-Facebook', 'https://www.brandsvietnam.com/18923-Chan-dung-nu-sang-lap-26-tuoi-cua-du-an-tien-ao-Facebook', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(98, 'https://www.brandsvietnam.com/upload/news/200px/2019/18929_facebook.jpg', 'Facebook chính thức nhận án phạt lịch sử 5 tỷ USD, chấp nhận bị giám sát chặt hơn', '18929-Facebook-chinh-thuc-nhan-an-phat-lich-su-5-ty-USD-chap-nhan-bi-giam-sat-chat-hon', 'https://www.brandsvietnam.com/18929-Facebook-chinh-thuc-nhan-an-phat-lich-su-5-ty-USD-chap-nhan-bi-giam-sat-chat-hon', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(99, 'https://www.brandsvietnam.com/upload/news/200px/2019/18906_Untitleddesign-7.png', 'GCOMM công bố mua lại mảng tư vấn doanh nghiệp của CASK Academy, tái cấu trúc với 3 bộ phận lõi: Business Solution, Business Analysis và Business Insight', '18906-GCOMM-cong-bo-mua-lai-mang-tu-van-doanh-nghiep-cua-CASK-Academy-tai-cau-truc-voi-3-bo-phan-loi-Business-Solution-Business-Analysis-va-Business-Insight', 'https://www.brandsvietnam.com/18906-GCOMM-cong-bo-mua-lai-mang-tu-van-doanh-nghiep-cua-CASK-Academy-tai-cau-truc-voi-3-bo-phan-loi-Business-Solution-Business-Analysis-va-Business-Insight', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(100, 'https://www.brandsvietnam.com/upload/news/200px/2019/18900_18900_Ava.png', 'Hội nghị Mindshare Huddle: chặng tiếp sức của Truyền thông kỹ thuật số', '18900-Hoi-nghi-Mindshare-Huddle-chang-tiep-suc-cua-Truyen-thong-ky-thuat-so', 'https://www.brandsvietnam.com/18900-Hoi-nghi-Mindshare-Huddle-chang-tiep-suc-cua-Truyen-thong-ky-thuat-so', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(101, 'https://www.brandsvietnam.com/upload/news/200px/2019/18873_hiip-brvn-thumb.jpg', 'CEO Việt gọi vốn triệu USD \'tấn công\' thị trường KOL Thái Lan, Indonesia', '18873-CEO-Viet-goi-von-trieu-USD-tan-cong-thi-truong-KOL-Thai-Lan-Indonesia', 'https://www.brandsvietnam.com/18873-CEO-Viet-goi-von-trieu-USD-tan-cong-thi-truong-KOL-Thai-Lan-Indonesia', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(102, 'https://www.brandsvietnam.com/upload/news/200px/2019/18839_18839_Ava11.png', 'Mindshare Việt Nam ra mắt Hội nghị truyền thông Mindshare Huddle', '18839-Mindshare-Viet-Nam-ra-mat-Hoi-nghi-truyen-thong-Mindshare-Huddle', 'https://www.brandsvietnam.com/18839-Mindshare-Viet-Nam-ra-mat-Hoi-nghi-truyen-thong-Mindshare-Huddle', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(103, 'https://www.brandsvietnam.com/upload/news/200px/2019/18824_TikTok.jpg', 'TikTok kết nối nhà sáng tạo và nhãn hàng tại Đông Nam Á', '18824-TikTok-ket-noi-nha-sang-tao-va-nhan-hang-tai-Dong-Nam-A', 'https://www.brandsvietnam.com/18824-TikTok-ket-noi-nha-sang-tao-va-nhan-hang-tai-Dong-Nam-A', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(104, 'https://www.brandsvietnam.com/upload/news/200px/2019/18817_elle-viet-nam-instagram-01.jpg', 'Instagram sẽ cho phép ẩn comment tiêu cực', '18817-Instagram-se-cho-phep-an-comment-tieu-cuc', 'https://www.brandsvietnam.com/18817-Instagram-se-cho-phep-an-comment-tieu-cuc', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(105, 'https://www.brandsvietnam.com/upload/news/200px/2019/18818_100000.png', 'Instagram tham vọng trở thành ứng dụng mua hàng', '18818-Instagram-tham-vong-tro-thanh-ung-dung-mua-hang', 'https://www.brandsvietnam.com/18818-Instagram-tham-vong-tro-thanh-ung-dung-mua-hang', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(106, 'https://www.brandsvietnam.com/upload/news/200px/2019/18806_nielsen.png', 'Sẵn sàng cho thời đại đổi mới với giải pháp chiến lược Nielsen BASES ra mắt tại Việt Nam', '18806-San-sang-cho-thoi-dai-doi-moi-voi-giai-phap-chien-luoc-Nielsen-BASES-ra-mat-tai-Viet-Nam', 'https://www.brandsvietnam.com/18806-San-sang-cho-thoi-dai-doi-moi-voi-giai-phap-chien-luoc-Nielsen-BASES-ra-mat-tai-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(107, 'https://www.brandsvietnam.com/upload/news/200px/2019/18753_Heniken2.png', 'Công ty cung cấp \'chân dài\' làm ăn thế nào khi Heineken cắt hợp đồng?', '18753-Cong-ty-cung-cap-chan-dai-lam-an-the-nao-khi-Heineken-cat-hop-dong', 'https://www.brandsvietnam.com/18753-Cong-ty-cung-cap-chan-dai-lam-an-the-nao-khi-Heineken-cat-hop-dong', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(108, 'https://www.brandsvietnam.com/upload/news/200px/2019/genz-gender-norms-CONTENT-2019_1561533521.jpg', 'Gen Z đang dần thay đổi các chuẩn mực giới tính', '18701-Gen-Z-dang-dan-thay-doi-cac-chuan-muc-gioi-tinh', 'https://www.brandsvietnam.com/18701-Gen-Z-dang-dan-thay-doi-cac-chuan-muc-gioi-tinh', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(109, 'https://www.brandsvietnam.com/upload/news/200px/2019/18724_Instagram.jpg', 'Quảng cáo trên thẻ Instagram Explore là \'mỏ vàng\' của Facebook', '18724-Quang-cao-tren-the-Instagram-Explore-la-mo-vang-cua-Facebook', 'https://www.brandsvietnam.com/18724-Quang-cao-tren-the-Instagram-Explore-la-mo-vang-cua-Facebook', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(110, 'https://www.brandsvietnam.com/upload/news/200px/2019/18729_YouTube.jpg', 'Những điều chỉnh về tính năng mới của YouTube bạn nên biết', '18729-Nhung-dieu-chinh-ve-tinh-nang-moi-cua-YouTube-ban-nen-biet', 'https://www.brandsvietnam.com/18729-Nhung-dieu-chinh-ve-tinh-nang-moi-cua-YouTube-ban-nen-biet', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(111, 'https://www.brandsvietnam.com/upload/news/200px/2019/18710_Facebook.jpg', 'Facebook ra mắt công cụ minh bạch quảng cáo trên toàn cầu', '18710-Facebook-ra-mat-cong-cu-minh-bach-quang-cao-tren-toan-cau', 'https://www.brandsvietnam.com/18710-Facebook-ra-mat-cong-cu-minh-bach-quang-cao-tren-toan-cau', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(112, 'https://www.brandsvietnam.com/upload/news/200px/2019/18682_GenZ.jpg', 'Nhiều xu hướng sáng tạo của Gen Z được Snapchat công bố tại Cannes', '18682-Nhieu-xu-huong-sang-tao-cua-Gen-Z-duoc-Snapchat-cong-bo-tai-Cannes', 'https://www.brandsvietnam.com/18682-Nhieu-xu-huong-sang-tao-cua-Gen-Z-duoc-Snapchat-cong-bo-tai-Cannes', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(113, 'https://www.brandsvietnam.com/upload/news/200px/2019/18678_TikTok.jpg', 'TikTok tuyên bố có 1 tỷ người dùng hoạt động tích cực hàng tháng', '18678-TikTok-tuyen-bo-co-1-ty-nguoi-dung-hoat-dong-tich-cuc-hang-thang', 'https://www.brandsvietnam.com/18678-TikTok-tuyen-bo-co-1-ty-nguoi-dung-hoat-dong-tich-cuc-hang-thang', ' div.reading-content', '2019-10-02 08:55:30', '2019-10-02 08:55:30', 1),
(114, 'https://www.brandsvietnam.com/upload/news/200px/2019/18670_YouTube.jpg', 'YouTube ẩn phần bình luận video', '18670-YouTube-an-phan-binh-luan-video', 'https://www.brandsvietnam.com/18670-YouTube-an-phan-binh-luan-video', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(115, 'https://www.brandsvietnam.com/upload/news/200px/2019/18652_GamesOfThrones.jpg', 'Những ứng cử viên ưu tú cho giải Titanium tại Cannes Lion 2019', '18652-Nhung-ung-cu-vien-uu-tu-cho-giai-Titanium-tai-Cannes-Lion-2019', 'https://www.brandsvietnam.com/18652-Nhung-ung-cu-vien-uu-tu-cho-giai-Titanium-tai-Cannes-Lion-2019', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(116, 'https://www.brandsvietnam.com/upload/news/200px/2019/18626_DEAF911.jpg', '5 chiến dịch của Mỹ dự đoán đạt giải The Innovation Lions tại Cannes 2019', '18626-5-chien-dich-cua-My-du-doan-dat-giai-The-Innovation-Lions-tai-Cannes-2019', 'https://www.brandsvietnam.com/18626-5-chien-dich-cua-My-du-doan-dat-giai-The-Innovation-Lions-tai-Cannes-2019', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(117, 'https://www.brandsvietnam.com/upload/news/200px/2019/18640_Chrome.png', 'Chrome chặn Quảng cáo: Thách thức mới cho Publisher, Nhà quảng cáo và Thương hiệu', '18640-Chrome-chan-Quang-cao-Thach-thuc-moi-cho-Publisher-Nha-quang-cao-va-Thuong-hieu', 'https://www.brandsvietnam.com/18640-Chrome-chan-Quang-cao-Thach-thuc-moi-cho-Publisher-Nha-quang-cao-va-Thuong-hieu', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(118, 'https://www.brandsvietnam.com/upload/news/200px/2019/18639_SundarPichai.jpg', 'CEO Google: YouTube quá lớn, không thể sửa lỗi hoàn toàn', '18639-CEO-Google-YouTube-qua-lon-khong-the-sua-loi-hoan-toan', 'https://www.brandsvietnam.com/18639-CEO-Google-YouTube-qua-lon-khong-the-sua-loi-hoan-toan', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(119, 'https://www.brandsvietnam.com/upload/news/200px/2019/18629_TikTok.jpg', 'Sau thu hút người dùng, TikTok âm thầm tìm cách tăng doanh thu', '18629-Sau-thu-hut-nguoi-dung-TikTok-am-tham-tim-cach-tang-doanh-thu', 'https://www.brandsvietnam.com/18629-Sau-thu-hut-nguoi-dung-TikTok-am-tham-tim-cach-tang-doanh-thu', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(120, 'https://www.brandsvietnam.com/upload/news/200px/2019/18612_BreMiller.jpg', 'Facebook: \'Người dùng Việt Nam thích xem livestream về game\'', '18612-Facebook-Nguoi-dung-Viet-Nam-thich-xem-livestream-ve-game', 'https://www.brandsvietnam.com/18612-Facebook-Nguoi-dung-Viet-Nam-thich-xem-livestream-ve-game', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(121, 'https://www.brandsvietnam.com/upload/news/200px/2019/18621_DigitalAgency.jpg', 'Điểm danh các Digital Marketing Agency nổi bật ở Việt Nam', '18621-Diem-danh-cac-Digital-Marketing-Agency-noi-bat-o-Viet-Nam', 'https://www.brandsvietnam.com/18621-Diem-danh-cac-Digital-Marketing-Agency-noi-bat-o-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(122, 'https://www.brandsvietnam.com/upload/news/200px/2019/18613_Facebook.jpg', 'Facebook tiến hành xếp hạng comment, ngăn chặn bình luận nhảm, vô văn hóa', '18613-Facebook-tien-hanh-xep-hang-comment-ngan-chan-binh-luan-nham-vo-van-hoa', 'https://www.brandsvietnam.com/18613-Facebook-tien-hanh-xep-hang-comment-ngan-chan-binh-luan-nham-vo-van-hoa', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(123, 'https://www.brandsvietnam.com/upload/news/200px/2019/18594_FacebookWatch.png', 'Facebook Watch tăng trưởng mạnh mẽ sau một năm ra mắt', '18594-Facebook-Watch-tang-truong-manh-me-sau-mot-nam-ra-mat', 'https://www.brandsvietnam.com/18594-Facebook-Watch-tang-truong-manh-me-sau-mot-nam-ra-mat', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(124, 'https://www.brandsvietnam.com/upload/news/200px/2019/18587_PR_1.png', 'Danh sách thắng giải PR Awards Asia 2019: Dentsu Redder đạt 2 giải Bạc', '18587-Danh-sach-thang-giai-PR-Awards-Asia-2019-Dentsu-Redder-dat-2-giai-Bac', 'https://www.brandsvietnam.com/18587-Danh-sach-thang-giai-PR-Awards-Asia-2019-Dentsu-Redder-dat-2-giai-Bac', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(125, 'https://www.brandsvietnam.com/upload/news/200px/2019/18561_InstagramStory.png', 'Instagram thêm tính năng chèn lời bài hát trong Stories', '18561-Instagram-them-tinh-nang-chen-loi-bai-hat-trong-Stories', 'https://www.brandsvietnam.com/18561-Instagram-them-tinh-nang-chen-loi-bai-hat-trong-Stories', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(126, 'https://www.brandsvietnam.com/upload/news/200px/2019/18532_Facebook.jpg', 'Facebook khóa hàng loạt fanpage tại Việt Nam', '18532-Facebook-khoa-hang-loat-fanpage-tai-Viet-Nam', 'https://www.brandsvietnam.com/18532-Facebook-khoa-hang-loat-fanpage-tai-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1);
INSERT INTO `news` (`id`, `image`, `title`, `slug`, `content`, `post_by`, `created_at`, `updated_at`, `id_category`) VALUES
(127, 'https://www.brandsvietnam.com/upload/news/200px/2019/18483_FacebookPortal.jpg', 'Facebook Portal có ứng dụng Android riêng để quản lý ảnh và video', '18483-Facebook-Portal-co-ung-dung-Android-rieng-de-quan-ly-anh-va-video', 'https://www.brandsvietnam.com/18483-Facebook-Portal-co-ung-dung-Android-rieng-de-quan-ly-anh-va-video', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(128, 'https://www.brandsvietnam.com/upload/news/200px/2019/18490_Tech.jpg', 'Công nghệ xoay chuyển ngành truyền thông tiếp thị như thế nào?', '18490-Cong-nghe-xoay-chuyen-nganh-truyen-thong-tiep-thi-nhu-the-nao', 'https://www.brandsvietnam.com/18490-Cong-nghe-xoay-chuyen-nganh-truyen-thong-tiep-thi-nhu-the-nao', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(129, 'https://www.brandsvietnam.com/upload/news/200px/2019/18433_WhatsApp.jpg', 'WhatsApp cho di động sẽ hiển thị quảng cáo', '18433-WhatsApp-cho-di-dong-se-hien-thi-quang-cao', 'https://www.brandsvietnam.com/18433-WhatsApp-cho-di-dong-se-hien-thi-quang-cao', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(130, 'https://www.brandsvietnam.com/upload/news/200px/2019/18435_Instagram.jpg', 'Instagram IGTV chính thức hỗ trợ thêm video ngang', '18435-Instagram-IGTV-chinh-thuc-ho-tro-them-video-ngang', 'https://www.brandsvietnam.com/18435-Instagram-IGTV-chinh-thuc-ho-tro-them-video-ngang', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(131, 'https://www.brandsvietnam.com/upload/news/200px/2019/18434_Google.jpg', 'Google Search thêm tên trang web và logo vào trang kết quả tìm kiếm', '18434-Google-Search-them-ten-trang-web-va-logo-vao-trang-ket-qua-tim-kiem', 'https://www.brandsvietnam.com/18434-Google-Search-them-ten-trang-web-va-logo-vao-trang-ket-qua-tim-kiem', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(132, 'https://www.brandsvietnam.com/upload/news/200px/2019/18428_Facebook.jpg', 'Facebook tuyên bố xóa 2,2 tỷ tài khoản giả mạo trong quý đầu năm 2019', '18428-Facebook-tuyen-bo-xoa-22-ty-tai-khoan-gia-mao-trong-quy-dau-nam-2019', 'https://www.brandsvietnam.com/18428-Facebook-tuyen-bo-xoa-22-ty-tai-khoan-gia-mao-trong-quy-dau-nam-2019', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(133, 'https://www.brandsvietnam.com/upload/news/200px/2019/18394_GroupM.jpg', 'GroupM bổ nhiệm CEO mới tại Việt Nam', '18394-GroupM-bo-nhiem-CEO-moi-tai-Viet-Nam', 'https://www.brandsvietnam.com/18394-GroupM-bo-nhiem-CEO-moi-tai-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(134, 'https://www.brandsvietnam.com/upload/news/200px/2019/18377_Facebook.jpg', 'Facebook chính thức ra mắt tính năng hẹn hò (Facebook Dating) tại Việt Nam', '18377-Facebook-chinh-thuc-ra-mat-tinh-nang-hen-ho-Facebook-Dating-tai-Viet-Nam', 'https://www.brandsvietnam.com/18377-Facebook-chinh-thuc-ra-mat-tinh-nang-hen-ho-Facebook-Dating-tai-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(135, 'https://www.brandsvietnam.com/upload/news/200px/2019/18389_Facebook.jpg', '5 công bố lớn nhất của Facebook tại Hội nghị nhà phát triển F8', '18389-5-cong-bo-lon-nhat-cua-Facebook-tai-Hoi-nghi-nha-phat-trien-F8', 'https://www.brandsvietnam.com/18389-5-cong-bo-lon-nhat-cua-Facebook-tai-Hoi-nghi-nha-phat-trien-F8', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(136, 'https://www.brandsvietnam.com/upload/news/200px/2019/18376_Facebook.jpg', 'Facebook công bố giao diện hoàn toàn mới', '18376-Facebook-cong-bo-giao-dien-hoan-toan-moi', 'https://www.brandsvietnam.com/18376-Facebook-cong-bo-giao-dien-hoan-toan-moi', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(137, 'https://www.brandsvietnam.com/upload/news/200px/2019/18366_Google.jpg', 'Quảng cáo trực tuyến không còn ‘đẻ trứng vàng’ cho Google?', '18366-Quang-cao-truc-tuyen-khong-con-de-trung-vang-cho-Google', 'https://www.brandsvietnam.com/18366-Quang-cao-truc-tuyen-khong-con-de-trung-vang-cho-Google', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(138, 'https://www.brandsvietnam.com/upload/news/200px/2019/18355_Facebook.jpeg', 'Ứng dụng đoán tính cách sẽ không còn \'đất sống\' trên Facebook', '18355-Ung-dung-doan-tinh-cach-se-khong-con-dat-song-tren-Facebook', 'https://www.brandsvietnam.com/18355-Ung-dung-doan-tinh-cach-se-khong-con-dat-song-tren-Facebook', ' div.reading-content', '2019-10-02 08:55:31', '2019-10-02 08:55:31', 1),
(139, 'https://www.brandsvietnam.com/upload/news/200px/2019/18457_18441_Teaser_avatar01.jpg', 'Câu chuyện đằng sau “3 giây hút khách” của Founder Teaser.vn hay chàng kỹ sư yêu Marketing', '18457-Cau-chuyen-dang-sau-3-giay-hut-khach-cua-Founder-Teaservn-hay-chang-ky-su-yeu-Marketing', 'https://www.brandsvietnam.com/18457-Cau-chuyen-dang-sau-3-giay-hut-khach-cua-Founder-Teaservn-hay-chang-ky-su-yeu-Marketing', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(140, 'https://www.brandsvietnam.com/upload/news/200px/2019/18343_Hiip.png', 'Hiip mua lại BP Network ở Indonesia', '18343-Hiip-mua-lai-BP-Network-o-Indonesia', 'https://www.brandsvietnam.com/18343-Hiip-mua-lai-BP-Network-o-Indonesia', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(141, 'https://www.brandsvietnam.com/upload/news/200px/2019/18334_Facebook.jpg', 'Facebook kiếm hơn 6,4 USD từ mỗi người dùng', '18334-Facebook-kiem-hon-64-USD-tu-moi-nguoi-dung', 'https://www.brandsvietnam.com/18334-Facebook-kiem-hon-64-USD-tu-moi-nguoi-dung', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(142, 'https://www.brandsvietnam.com/upload/news/200px/2019/18338_YouTube.jpg', 'Việt Nam là một trong 5 thị trường lớn nhất của YouTube', '18338-Viet-Nam-la-mot-trong-5-thi-truong-lon-nhat-cua-YouTube', 'https://www.brandsvietnam.com/18338-Viet-Nam-la-mot-trong-5-thi-truong-lon-nhat-cua-YouTube', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(143, 'https://www.brandsvietnam.com/upload/news/200px/2019/18326_Twitter.jpg', 'Twitter tăng vọt 16% sau báo cáo kết quả kinh doanh vượt kỳ vọng', '18326-Twitter-tang-vot-16-sau-bao-cao-ket-qua-kinh-doanh-vuot-ky-vong', 'https://www.brandsvietnam.com/18326-Twitter-tang-vot-16-sau-bao-cao-ket-qua-kinh-doanh-vuot-ky-vong', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(144, 'https://www.brandsvietnam.com/upload/news/200px/2019/18331_18331-10.png', 'TikTok chính thức ra mắt tại Việt Nam và công bố chiến lược đa dạng hóa nội dung', '18331-TikTok-chinh-thuc-ra-mat-tai-Viet-Nam-va-cong-bo-chien-luoc-da-dang-hoa-noi-dung', 'https://www.brandsvietnam.com/18331-TikTok-chinh-thuc-ra-mat-tai-Viet-Nam-va-cong-bo-chien-luoc-da-dang-hoa-noi-dung', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(145, 'https://www.brandsvietnam.com/upload/news/200px/2019/18318_18318_Minet_Avatar.png', 'SocialFeed Marketing sẽ thay thế Influencer trong tương lai như thế nào?', '18318-SocialFeed-Marketing-se-thay-the-Influencer-trong-tuong-lai-nhu-the-nao', 'https://www.brandsvietnam.com/18318-SocialFeed-Marketing-se-thay-the-Influencer-trong-tuong-lai-nhu-the-nao', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(146, 'https://www.brandsvietnam.com/upload/news/200px/2019/18310_YouNet.jpg', 'R&D team YouNet Group: “AI và Machine Learning phát hiện 98% hồ sơ Influencers Việt Nam không đạt chuẩn của SociaLift”', '18310-RD-team-YouNet-Group-AI-va-Machine-Learning-phat-hien-98-ho-so-Influencers-Viet-Nam-khong-dat-chuan-cua-SociaLift', 'https://www.brandsvietnam.com/18310-RD-team-YouNet-Group-AI-va-Machine-Learning-phat-hien-98-ho-so-Influencers-Viet-Nam-khong-dat-chuan-cua-SociaLift', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(147, 'https://www.brandsvietnam.com/upload/news/200px/2019/18307_Pinterest.jpg', 'Pinterest lên sàn, là IPO \'hot\' thứ nhì năm nay', '18307-Pinterest-len-san-la-IPO-hot-thu-nhi-nam-nay', 'https://www.brandsvietnam.com/18307-Pinterest-len-san-la-IPO-hot-thu-nhi-nam-nay', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(148, 'https://www.brandsvietnam.com/upload/news/200px/2019/19241_5.jpg', 'Burger King và cuộc chuyển đổi hoành tráng', '19241-Burger-King-va-cuoc-chuyen-doi-hoanh-trang', 'https://www.brandsvietnam.com/19241-Burger-King-va-cuoc-chuyen-doi-hoanh-trang', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(149, 'https://www.brandsvietnam.com/upload/news/200px/2019/18992_viettel.jpg', 'Quyền chủ tịch Viettel: Chuyển đổi số phải quyết tâm kiểu \'nếu không làm thì sẽ chết\'!', '18992-Quyen-chu-tich-Viettel-Chuyen-doi-so-phai-quyet-tam-kieu-neu-khong-lam-thi-se-chet', 'https://www.brandsvietnam.com/18992-Quyen-chu-tich-Viettel-Chuyen-doi-so-phai-quyet-tam-kieu-neu-khong-lam-thi-se-chet', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(150, 'https://www.brandsvietnam.com/upload/news/200px/2019/18913_1.jpg', 'Tư duy lãnh đạo: Thông minh hơn A.I - Chạy đua cùng robot', '18913-Tu-duy-lanh-dao-Thong-minh-hon-AI-Chay-dua-cung-robot', 'https://www.brandsvietnam.com/18913-Tu-duy-lanh-dao-Thong-minh-hon-AI-Chay-dua-cung-robot', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(151, 'https://www.brandsvietnam.com/upload/news/200px/2019/18936_Starbuck.jpg', '“Bậc thầy” tâm lý học Starbucks và 4 “cạm bẫy” chực chờ trên menu', '18936-Bac-thay-tam-ly-hoc-Starbucks-va-4-cam-bay-chuc-cho-tren-menu', 'https://www.brandsvietnam.com/18936-Bac-thay-tam-ly-hoc-Starbucks-va-4-cam-bay-chuc-cho-tren-menu', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(152, 'https://www.brandsvietnam.com/upload/news/200px/2019/18852_17.jpg', 'Đường đến 10 tỉ USD của Thế Giới Di Động', '18852-Duong-den-10-ti-USD-cua-The-Gioi-Di-Dong', 'https://www.brandsvietnam.com/18852-Duong-den-10-ti-USD-cua-The-Gioi-Di-Dong', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(153, 'https://www.brandsvietnam.com/upload/news/200px/2019/18855_emotion-marketing.png', 'Người tiêu dùng không mua sản phẩm, họ mua cả sự hoàn hảo được khơi gợi từ cảm xúc', '18855-Nguoi-tieu-dung-khong-mua-san-pham-ho-mua-ca-su-hoan-hao-duoc-khoi-goi-tu-cam-xuc', 'https://www.brandsvietnam.com/18855-Nguoi-tieu-dung-khong-mua-san-pham-ho-mua-ca-su-hoan-hao-duoc-khoi-goi-tu-cam-xuc', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(154, 'https://www.brandsvietnam.com/upload/news/200px/2019/18854_sang-tao.jpg', 'Hãy giúp người dùng cùng sáng tạo sản phẩm, họ sẽ quảng bá nó miễn phí', '18854-Hay-giup-nguoi-dung-cung-sang-tao-san-pham-ho-se-quang-ba-no-mien-phi', 'https://www.brandsvietnam.com/18854-Hay-giup-nguoi-dung-cung-sang-tao-san-pham-ho-se-quang-ba-no-mien-phi', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(155, 'https://www.brandsvietnam.com/upload/news/200px/2019/18861_Gan-nhu-khong-quang-cao-Zara-thu-hut-khach-hang-nhu-the-nao.jpg', 'Những điều làm nên sự thành công của Zara', '18861-Nhung-dieu-lam-nen-su-thanh-cong-cua-Zara', 'https://www.brandsvietnam.com/18861-Nhung-dieu-lam-nen-su-thanh-cong-cua-Zara', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(156, 'https://www.brandsvietnam.com/upload/news/200px/2019/18798_rawImage.jpg', '6 chiến thuật đơn giản giúp Eric Yuan xây dựng Zoom thành doanh nghiệp 20 tỷ USD', '18798-6-chien-thuat-don-gian-giup-Eric-Yuan-xay-dung-Zoom-thanh-doanh-nghiep-20-ty-USD', 'https://www.brandsvietnam.com/18798-6-chien-thuat-don-gian-giup-Eric-Yuan-xay-dung-Zoom-thanh-doanh-nghiep-20-ty-USD', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(157, 'https://www.brandsvietnam.com/upload/news/200px/2019/18719_Thumb-4.png', 'Re-think CSR #1 - Ông Khuất Quang Hưng @ Nestlé  Vietnam: “Đầu tư dài hạn để phát triển bền vững”', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/18719-Rethink-CSR-1-Ong-Khuat-Quang-Hung-Nestle-Vietnam-Dau-tu-dai-han-de-phat-trien-ben-vung', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(158, 'https://www.brandsvietnam.com/upload/news/200px/2019/18742_Walls.jpg', 'Wall’s trở thành hãng kem phổ biến nhất thế giới như thế nào?', '18742-Walls-tro-thanh-hang-kem-pho-bien-nhat-the-gioi-nhu-the-nao', 'https://www.brandsvietnam.com/18742-Walls-tro-thanh-hang-kem-pho-bien-nhat-the-gioi-nhu-the-nao', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(159, 'https://www.brandsvietnam.com/upload/news/200px/2019/18676_ToysRUs.jpg', 'Chuỗi đồ chơi Toys \'R\' Us của Mỹ \'hồi sinh từ cái chết\'', '18676-Chuoi-do-choi-Toys-R-Us-cua-My-hoi-sinh-tu-cai-chet', 'https://www.brandsvietnam.com/18676-Chuoi-do-choi-Toys-R-Us-cua-My-hoi-sinh-tu-cai-chet', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(160, 'https://www.brandsvietnam.com/upload/news/200px/2019/Vinamilk_1_1560737587.jpg', 'Hero - Hub - Help: Ba chiến lược nội dung giúp Vinamilk thành công trên kênh digital', '18619-Hero-Hub-Help-Ba-chien-luoc-noi-dung-giup-Vinamilk-thanh-cong-tren-kenh-digital', 'https://www.brandsvietnam.com/18619-Hero-Hub-Help-Ba-chien-luoc-noi-dung-giup-Vinamilk-thanh-cong-tren-kenh-digital', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(161, 'https://www.brandsvietnam.com/upload/news/200px/2019/18623_lon_coke.jpg', 'Phiên bản lon “Việt Nam tôi yêu, Coca-Cola tôi yêu” tương tác khách hàng cả Online & Offline', '18623-Phien-ban-lon-Viet-Nam-toi-yeu-CocaCola-toi-yeu-tuong-tac-khach-hang-ca-Online-Offline', 'https://www.brandsvietnam.com/18623-Phien-ban-lon-Viet-Nam-toi-yeu-CocaCola-toi-yeu-tuong-tac-khach-hang-ca-Online-Offline', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(162, 'https://www.brandsvietnam.com/upload/news/200px/2019/18572_Listerine.jpeg', 'Thừa nhận điểm yếu: Độc chiêu tiếp thị dễ chiếm cảm tình của khách hàng', '18572-Thua-nhan-diem-yeu-Doc-chieu-tiep-thi-de-chiem-cam-tinh-cua-khach-hang', 'https://www.brandsvietnam.com/18572-Thua-nhan-diem-yeu-Doc-chieu-tiep-thi-de-chiem-cam-tinh-cua-khach-hang', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(163, 'https://www.brandsvietnam.com/upload/news/200px/2019/18564_CocaColaPepsi.png', 'Muốn sống sót, thương hiệu mới phải tìm ra thuộc tính trái ngược với kẻ dẫn đầu', '18564-Muon-song-sot-thuong-hieu-moi-phai-tim-ra-thuoc-tinh-trai-nguoc-voi-ke-dan-dau', 'https://www.brandsvietnam.com/18564-Muon-song-sot-thuong-hieu-moi-phai-tim-ra-thuoc-tinh-trai-nguoc-voi-ke-dan-dau', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(164, 'https://www.brandsvietnam.com/upload/news/200px/2019/18565_Nike.jpg', 'Nói về bất công để tăng độ gắn bó của khách hàng: Nghệ thuật xây dựng thương hiệu của Nike', '18565-Noi-ve-bat-cong-de-tang-do-gan-bo-cua-khach-hang-Nghe-thuat-xay-dung-thuong-hieu-cua-Nike', 'https://www.brandsvietnam.com/18565-Noi-ve-bat-cong-de-tang-do-gan-bo-cua-khach-hang-Nghe-thuat-xay-dung-thuong-hieu-cua-Nike', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(165, 'https://www.brandsvietnam.com/upload/news/200px/2019/18491_Digital.jpg', 'Để tiếp thị kỹ thuật số đến gần với khách hàng hơn', '18491-De-tiep-thi-ky-thuat-so-den-gan-voi-khach-hang-hon', 'https://www.brandsvietnam.com/18491-De-tiep-thi-ky-thuat-so-den-gan-voi-khach-hang-hon', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(166, 'https://www.brandsvietnam.com/upload/news/200px/2019/18383_Zara.jpg', 'Gần như không quảng cáo, Zara thu hút khách hàng như thế nào?', '18383-Gan-nhu-khong-quang-cao-Zara-thu-hut-khach-hang-nhu-the-nao', 'https://www.brandsvietnam.com/18383-Gan-nhu-khong-quang-cao-Zara-thu-hut-khach-hang-nhu-the-nao', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(167, 'https://www.brandsvietnam.com/upload/news/200px/2019/18381_eCommerce.jpg', 'Những bài học thành công trong thương mại điện tử', '18381-Nhung-bai-hoc-thanh-cong-trong-thuong-mai-dien-tu', 'https://www.brandsvietnam.com/18381-Nhung-bai-hoc-thanh-cong-trong-thuong-mai-dien-tu', ' div.reading-content', '2019-10-02 08:55:32', '2019-10-02 08:55:32', 1),
(168, 'https://www.brandsvietnam.com/upload/news/200px/2019/18356_FB.png', 'Thương hiệu ẩm thực: Thành công bắt đầu từ chiếc điện thoại di động', '18356-Thuong-hieu-am-thuc-Thanh-cong-bat-dau-tu-chiec-dien-thoai-di-dong', 'https://www.brandsvietnam.com/18356-Thuong-hieu-am-thuc-Thanh-cong-bat-dau-tu-chiec-dien-thoai-di-dong', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(169, 'https://www.brandsvietnam.com/upload/news/200px/2019/18315_Ollies.jpg', 'Đế chế bán lẻ 5 tỉ USD Ollie’s nói không với bán hàng trực tuyến', '18315-De-che-ban-le-5-ti-USD-Ollies-noi-khong-voi-ban-hang-truc-tuyen', 'https://www.brandsvietnam.com/18315-De-che-ban-le-5-ti-USD-Ollies-noi-khong-voi-ban-hang-truc-tuyen', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(170, 'https://www.brandsvietnam.com/upload/news/200px/2019/18240_DJKoh.jpg', 'Chuyện chiếc quần jeans và chiến lược mới của Samsung', '18240-Chuyen-chiec-quan-jeans-va-chien-luoc-moi-cua-Samsung', 'https://www.brandsvietnam.com/18240-Chuyen-chiec-quan-jeans-va-chien-luoc-moi-cua-Samsung', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(171, 'https://www.brandsvietnam.com/upload/news/200px/2019/18215_Mickey.jpg', 'Disney đã xây dựng thương hiệu Chuột Mickey cho người lớn như thế nào? (Phần 2)', '18215-Disney-da-xay-dung-thuong-hieu-Chuot-Mickey-cho-nguoi-lon-nhu-the-nao-Phan-2', 'https://www.brandsvietnam.com/18215-Disney-da-xay-dung-thuong-hieu-Chuot-Mickey-cho-nguoi-lon-nhu-the-nao-Phan-2', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(172, 'https://www.brandsvietnam.com/upload/news/200px/2019/18214_InfluencerMarketing.png', 'Tiếp thị thông qua người ảnh hưởng: Nên xem họ như những sứ giả nhãn hiệu', '18214-Tiep-thi-thong-qua-nguoi-anh-huong-Nen-xem-ho-nhu-nhung-su-gia-nhan-hieu', 'https://www.brandsvietnam.com/18214-Tiep-thi-thong-qua-nguoi-anh-huong-Nen-xem-ho-nhu-nhung-su-gia-nhan-hieu', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(173, 'https://www.brandsvietnam.com/upload/news/200px/2019/18216_Mickey.jpg', 'Disney đã xây dựng thương hiệu Chuột Mickey cho người lớn như thế nào? (Phần 1)', '18216-Disney-da-xay-dung-thuong-hieu-Chuot-Mickey-cho-nguoi-lon-nhu-the-nao-Phan-1', 'https://www.brandsvietnam.com/18216-Disney-da-xay-dung-thuong-hieu-Chuot-Mickey-cho-nguoi-lon-nhu-the-nao-Phan-1', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(174, 'https://www.brandsvietnam.com/upload/news/200px/2019/18130_DanielWellington.png', 'Chiến lược marketing của đồng hồ Daniel Wellington', '18130-Chien-luoc-marketing-cua-dong-ho-Daniel-Wellington', 'https://www.brandsvietnam.com/18130-Chien-luoc-marketing-cua-dong-ho-Daniel-Wellington', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(175, 'https://www.brandsvietnam.com/upload/news/200px/2019/18118_Smartphone.jpg', 'Chiến lược hai nhãn hiệu đang giúp smartphone Trung Quốc cạnh tranh thế nào?', '18118-Chien-luoc-hai-nhan-hieu-dang-giup-smartphone-Trung-Quoc-canh-tranh-the-nao', 'https://www.brandsvietnam.com/18118-Chien-luoc-hai-nhan-hieu-dang-giup-smartphone-Trung-Quoc-canh-tranh-the-nao', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(176, 'https://www.brandsvietnam.com/upload/news/200px/2019/18107_Creative.jpg', 'Sáng tạo để tìm chiến lược mới', '18107-Sang-tao-de-tim-chien-luoc-moi', 'https://www.brandsvietnam.com/18107-Sang-tao-de-tim-chien-luoc-moi', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(177, 'https://www.brandsvietnam.com/upload/news/200px/2019/18069_CSR.jpg', 'Những điều cần biết trong xây dựng chiến lược CSR 4.0', '18069-Nhung-dieu-can-biet-trong-xay-dung-chien-luoc-CSR-40', 'https://www.brandsvietnam.com/18069-Nhung-dieu-can-biet-trong-xay-dung-chien-luoc-CSR-40', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(178, 'https://www.brandsvietnam.com/upload/news/200px/2019/18065_Data.jpg', '6 bước xây dựng chiến lược dữ liệu', '18065-6-buoc-xay-dung-chien-luoc-du-lieu', 'https://www.brandsvietnam.com/18065-6-buoc-xay-dung-chien-luoc-du-lieu', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(179, 'https://www.brandsvietnam.com/upload/news/200px/2019/18011_Manager.jpg', '4 chiến thuật của một nhà lãnh đạo hiệu quả', '18011-4-chien-thuat-cua-mot-nha-lanh-dao-hieu-qua', 'https://www.brandsvietnam.com/18011-4-chien-thuat-cua-mot-nha-lanh-dao-hieu-qua', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(180, 'https://www.brandsvietnam.com/upload/news/200px/2019/17997_7Eleven.jpg', 'Bài học thành công từ 7-Eleven ở Đài Loan', '17997-Bai-hoc-thanh-cong-tu-7Eleven-o-Dai-Loan', 'https://www.brandsvietnam.com/17997-Bai-hoc-thanh-cong-tu-7Eleven-o-Dai-Loan', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(181, 'https://www.brandsvietnam.com/upload/news/200px/2019/17945_RedBull.jpg', 'Nghệ thuật Marketing của Redbull', '17945-Nghe-thuat-Marketing-cua-Redbull', 'https://www.brandsvietnam.com/17945-Nghe-thuat-Marketing-cua-Redbull', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(182, 'https://www.brandsvietnam.com/upload/news/200px/2019/17873_Branding.jpg', '5 xu hướng xây dựng thương hiệu đáng chú ý', '17873-5-xu-huong-xay-dung-thuong-hieu-dang-chu-y', 'https://www.brandsvietnam.com/17873-5-xu-huong-xay-dung-thuong-hieu-dang-chu-y', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(183, 'https://www.brandsvietnam.com/upload/news/200px/2019/17872_HomeDepot.jpg', 'Cải thiện trải nghiệm của khách hàng trong ngành bán lẻ: Bài học từ Home Depot', '17872-Cai-thien-trai-nghiem-cua-khach-hang-trong-nganh-ban-le-Bai-hoc-tu-Home-Depot', 'https://www.brandsvietnam.com/17872-Cai-thien-trai-nghiem-cua-khach-hang-trong-nganh-ban-le-Bai-hoc-tu-Home-Depot', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(184, 'https://www.brandsvietnam.com/upload/news/200px/2019/17771_Amazon.jpg', '\"Kiềng 3 chân\" quyết định sự sống còn của Amazon', '17771-Kieng-3-chan-quyet-dinh-su-song-con-cua-Amazon', 'https://www.brandsvietnam.com/17771-Kieng-3-chan-quyet-dinh-su-song-con-cua-Amazon', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(185, 'https://www.brandsvietnam.com/upload/news/200px/2019/17773_Lush.jpg', 'Lush - chuỗi cửa hàng xà bông tăng trưởng bất chấp \"ác mộng\" bán lẻ', '17773-Lush-chuoi-cua-hang-xa-bong-tang-truong-bat-chap-ac-mong-ban-le', 'https://www.brandsvietnam.com/17773-Lush-chuoi-cua-hang-xa-bong-tang-truong-bat-chap-ac-mong-ban-le', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(186, 'https://www.brandsvietnam.com/upload/news/200px/2019/17745_Thuonghieu.jpg', '3 cách để thương hiệu luôn đáp ứng được kỳ vọng của khách hàng', '17745-3-cach-de-thuong-hieu-luon-dap-ung-duoc-ky-vong-cua-khach-hang', 'https://www.brandsvietnam.com/17745-3-cach-de-thuong-hieu-luon-dap-ung-duoc-ky-vong-cua-khach-hang', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(187, 'https://www.brandsvietnam.com/upload/news/200px/2019/17759_PNJ.jpg', 'Bước nhảy tiếp theo của PNJ', '17759-Buoc-nhay-tiep-theo-cua-PNJ', 'https://www.brandsvietnam.com/17759-Buoc-nhay-tiep-theo-cua-PNJ', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(188, 'https://www.brandsvietnam.com/upload/news/200px/2019/17756_Levis.jpeg', 'Tự biến mình thành startup, doanh thu 2017 của Levi’s lập kỷ lục sau gần 2 thập kỷ', '17756-Tu-bien-minh-thanh-startup-doanh-thu-2017-cua-Levis-lap-ky-luc-sau-gan-2-thap-ky', 'https://www.brandsvietnam.com/17756-Tu-bien-minh-thanh-startup-doanh-thu-2017-cua-Levis-lap-ky-luc-sau-gan-2-thap-ky', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(189, 'https://www.brandsvietnam.com/upload/news/200px/2019/17753_Millennials.jpg', 'Làm thế nào để thế hệ Millennials tin vào quảng cáo?', '17753-Lam-the-nao-de-the-he-Millennials-tin-vao-quang-cao', 'https://www.brandsvietnam.com/17753-Lam-the-nao-de-the-he-Millennials-tin-vao-quang-cao', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(190, 'https://www.brandsvietnam.com/upload/news/200px/2019/17615_Gillette.JPG', 'Công ty hàng tiêu dùng nhắm khách hàng mua định kỳ', '17615-Cong-ty-hang-tieu-dung-nham-khach-hang-mua-dinh-ky', 'https://www.brandsvietnam.com/17615-Cong-ty-hang-tieu-dung-nham-khach-hang-mua-dinh-ky', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(191, 'https://www.brandsvietnam.com/upload/news/200px/2019/17536_SethGodin.jpg', '3 cách đơn giản cho chiến lược marketing năm 2019', '17536-3-cach-don-gian-cho-chien-luoc-marketing-nam-2019', 'https://www.brandsvietnam.com/17536-3-cach-don-gian-cho-chien-luoc-marketing-nam-2019', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(192, 'https://www.brandsvietnam.com/upload/news/200px/2019/17463_Microsoft.jpg', 'Khi Microsoft mở rộng cửa công nghệ và phần mềm', '17463-Khi-Microsoft-mo-rong-cua-cong-nghe-va-phan-mem', 'https://www.brandsvietnam.com/17463-Khi-Microsoft-mo-rong-cua-cong-nghe-va-phan-mem', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(193, 'https://www.brandsvietnam.com/upload/news/200px/2019/17493_Netflix.jpg', '“Thủ đoạn” của Netflix', '17493-Thu-doan-cua-Netflix', 'https://www.brandsvietnam.com/17493-Thu-doan-cua-Netflix', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(194, 'https://www.brandsvietnam.com/upload/news/200px/2019/17475_DigiEcosystem.jpeg', 'Chuỗi giá trị, Hệ sinh thái và các quy luật mới về Chiến lược Kinh doanh (Phần 1)', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/17475-Chuoi-gia-tri-He-sinh-thai-va-cac-quy-luat-moi-ve-Chien-luoc-Kinh-doanh-Phan-1', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(195, 'https://www.brandsvietnam.com/upload/news/200px/2019/17477_Hotmail.png', 'Sự tăng trưởng thần kỳ của Hotmail sau 18 tháng ra mắt', '17477-Su-tang-truong-than-ky-cua-Hotmail-sau-18-thang-ra-mat', 'https://www.brandsvietnam.com/17477-Su-tang-truong-than-ky-cua-Hotmail-sau-18-thang-ra-mat', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(196, 'https://www.brandsvietnam.com/upload/news/200px/2018/17339_Casper.jpg', 'Cách Casper lật đổ thị trường nệm truyền thống', '17339-Cach-Casper-lat-do-thi-truong-nem-truyen-thong', 'https://www.brandsvietnam.com/17339-Cach-Casper-lat-do-thi-truong-nem-truyen-thong', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(197, 'https://www.brandsvietnam.com/upload/news/200px/2018/17268_FMCG.jpg', 'Ngành hàng nào, chiến lược ấy', '17268-Nganh-hang-nao-chien-luoc-ay', 'https://www.brandsvietnam.com/17268-Nganh-hang-nao-chien-luoc-ay', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(198, 'https://www.brandsvietnam.com/upload/news/200px/2018/17216_T-Mobile.png', 'T-Mobile: Làm mới “đường dây nóng” để làm hài lòng khách hàng và giữ chân nhân viên', '17216-TMobile-Lam-moi-duong-day-nong-de-lam-hai-long-khach-hang-va-giu-chan-nhan-vien', 'https://www.brandsvietnam.com/17216-TMobile-Lam-moi-duong-day-nong-de-lam-hai-long-khach-hang-va-giu-chan-nhan-vien', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(199, 'https://www.brandsvietnam.com/upload/news/200px/2018/17200_Whatsapp.jpg', 'Whatsapp: Công cụ để Facebook khai phá thị trường mới nổi', '17200-Whatsapp-Cong-cu-de-Facebook-khai-pha-thi-truong-moi-noi', 'https://www.brandsvietnam.com/17200-Whatsapp-Cong-cu-de-Facebook-khai-pha-thi-truong-moi-noi', ' div.reading-content', '2019-10-02 08:55:33', '2019-10-02 08:55:33', 1),
(200, 'https://www.brandsvietnam.com/upload/news/200px/2018/17190_VinMec.jpg', 'Mảnh ghép dược phẩm tỉ đô của Vingroup', '17190-Manh-ghep-duoc-pham-ti-do-cua-Vingroup', 'https://www.brandsvietnam.com/17190-Manh-ghep-duoc-pham-ti-do-cua-Vingroup', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(201, 'https://www.brandsvietnam.com/upload/news/200px/2018/17169_Branding.png', 'Phát triển tính cách thương hiệu như thế nào?', '17169-Phat-trien-tinh-cach-thuong-hieu-nhu-the-nao', 'https://www.brandsvietnam.com/17169-Phat-trien-tinh-cach-thuong-hieu-nhu-the-nao', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(202, 'https://www.brandsvietnam.com/upload/news/200px/2018/17144_DigitalMarketing.jpg', 'Tăng cường hiệu quả marketing sử dụng website và mạng xã hội', '17144-Tang-cuong-hieu-qua-marketing-su-dung-website-va-mang-xa-hoi', 'https://www.brandsvietnam.com/17144-Tang-cuong-hieu-qua-marketing-su-dung-website-va-mang-xa-hoi', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(203, 'https://www.brandsvietnam.com/upload/news/200px/2018/17133_Oto.jpg', 'Chiến lược dài hơi nào cho ngành công nghiệp ô tô Việt Nam?', '17133-Chien-luoc-dai-hoi-nao-cho-nganh-cong-nghiep-o-to-Viet-Nam', 'https://www.brandsvietnam.com/17133-Chien-luoc-dai-hoi-nao-cho-nganh-cong-nghiep-o-to-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(204, 'https://www.brandsvietnam.com/upload/news/200px/2018/17113_Febreze.jpg', 'Xâm nhập tiềm thức, P&G thay đổi thói quen người dùng với Febreze', '17113-Xam-nhap-tiem-thuc-PG-thay-doi-thoi-quen-nguoi-dung-voi-Febreze', 'https://www.brandsvietnam.com/17113-Xam-nhap-tiem-thuc-PG-thay-doi-thoi-quen-nguoi-dung-voi-Febreze', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(205, 'https://www.brandsvietnam.com/upload/news/200px/2018/17048_Banle.jpg', 'Thị trường bán lẻ: Khi trải nghiệm khách hàng vượt qua ranh giới cửa hàng thực tế', '17048-Thi-truong-ban-le-Khi-trai-nghiem-khach-hang-vuot-qua-ranh-gioi-cua-hang-thuc-te', 'https://www.brandsvietnam.com/17048-Thi-truong-ban-le-Khi-trai-nghiem-khach-hang-vuot-qua-ranh-gioi-cua-hang-thuc-te', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(206, 'https://www.brandsvietnam.com/upload/news/200px/2018/17115_CyberMonday.png', 'Cyber Monday tận dụng dữ liệu lớn như thế nào?', '17115-Cyber-Monday-tan-dung-du-lieu-lon-nhu-the-nao', 'https://www.brandsvietnam.com/17115-Cyber-Monday-tan-dung-du-lieu-lon-nhu-the-nao', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(207, 'https://www.brandsvietnam.com/upload/news/200px/2018/16940_Bukalapak.jpg', 'Cách bán hàng online cho người không có Internet ở Indonesia', '16940-Cach-ban-hang-online-cho-nguoi-khong-co-Internet-o-Indonesia', 'https://www.brandsvietnam.com/16940-Cach-ban-hang-online-cho-nguoi-khong-co-Internet-o-Indonesia', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(208, 'https://www.brandsvietnam.com/upload/news/200px/2019/19016_maxresdefault_mevj.jpg', 'Microsoft “đá đểu” Apple trong quảng cáo Surface Laptop 2 mới nhất', '19016-Microsoft-da-deu-Apple-trong-quang-cao-Surface-Laptop-2-moi-nhat', 'https://www.brandsvietnam.com/19016-Microsoft-da-deu-Apple-trong-quang-cao-Surface-Laptop-2-moi-nhat', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(209, 'https://www.brandsvietnam.com/upload/news/200px/2019/18751_YouTubeWorksLogo2.jpg', 'YouTube Works Awards - Điểm hẹn của những chiến dịch Tết xuất sắc nhất 2019', '18751-YouTube-Works-Awards-Diem-hen-cua-nhung-chien-dich-Tet-xuat-sac-nhat-2019', 'https://www.brandsvietnam.com/18751-YouTube-Works-Awards-Diem-hen-cua-nhung-chien-dich-Tet-xuat-sac-nhat-2019', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(210, 'https://www.brandsvietnam.com/upload/news/200px/2019/avt_1561695351.jpg', 'Chiến dịch phản đối đánh thuế băng vệ sinh giành giải Grand Prix', '18720-Chien-dich-phan-doi-danh-thue-bang-ve-sinh-gianh-giai-Grand-Prix', 'https://www.brandsvietnam.com/18720-Chien-dich-phan-doi-danh-thue-bang-ve-sinh-gianh-giai-Grand-Prix', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(211, 'https://www.brandsvietnam.com/upload/news/200px/2019/18698_Camxuc.jpg', 'Tại sao cảm xúc lại quan trọng trong thiết kế và cách khai thác', '18698-Tai-sao-cam-xuc-lai-quan-trong-trong-thiet-ke-va-cach-khai-thac', 'https://www.brandsvietnam.com/18698-Tai-sao-cam-xuc-lai-quan-trong-trong-thiet-ke-va-cach-khai-thac', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(212, 'https://www.brandsvietnam.com/upload/news/200px/2019/18655_Nestle.jpg', 'Quả ngọt từ nỗ lực bền bỉ thấu hiểu người dùng Việt của Nestlé', '18655-Qua-ngot-tu-no-luc-ben-bi-thau-hieu-nguoi-dung-Viet-cua-Nestle', 'https://www.brandsvietnam.com/18655-Qua-ngot-tu-no-luc-ben-bi-thau-hieu-nguoi-dung-Viet-cua-Nestle', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(213, 'https://www.brandsvietnam.com/upload/news/200px/2019/18620_5.jpg', '7 chiến dịch phản đối định kiến giới tính của Mỹ dự báo sẽ đạt giải Glass Lion', '18620-7-chien-dich-phan-doi-dinh-kien-gioi-tinh-cua-My-du-bao-se-dat-giai-Glass-Lion', 'https://www.brandsvietnam.com/18620-7-chien-dich-phan-doi-dinh-kien-gioi-tinh-cua-My-du-bao-se-dat-giai-Glass-Lion', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(214, 'https://www.brandsvietnam.com/upload/news/200px/2019/1_1_1560800487.jpg', 'Bảng xếp hạng YouTube Ads Leaderboard tại Cannes 2019: “Quang Hải – Thắp lửa những giấc mơ” đứng thứ 4', '18634-Bang-xep-hang-YouTube-Ads-Leaderboard-tai-Cannes-2019-Quang-Hai-Thap-lua-nhung-giac-mo-dung-thu-4', 'https://www.brandsvietnam.com/18634-Bang-xep-hang-YouTube-Ads-Leaderboard-tai-Cannes-2019-Quang-Hai-Thap-lua-nhung-giac-mo-dung-thu-4', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(215, 'https://www.brandsvietnam.com/upload/news/200px/2019/18617_Redbull.jpg', 'Nghệ thuật quảng bá thương hiệu qua sự kiện thể thao của Red Bull', '18617-Nghe-thuat-quang-ba-thuong-hieu-qua-su-kien-the-thao-cua-Red-Bull', 'https://www.brandsvietnam.com/18617-Nghe-thuat-quang-ba-thuong-hieu-qua-su-kien-the-thao-cua-Red-Bull', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(216, 'https://www.brandsvietnam.com/upload/news/200px/2019/18607_AvengersEndgame.jpg', 'Chiến dịch marketing khủng của Avengers: Endgame và các thương hiệu liên kết', '18607-Chien-dich-marketing-khung-cua-Avengers-Endgame-va-cac-thuong-hieu-lien-ket', 'https://www.brandsvietnam.com/18607-Chien-dich-marketing-khung-cua-Avengers-Endgame-va-cac-thuong-hieu-lien-ket', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(217, 'https://www.brandsvietnam.com/upload/news/200px/2019/18580_IKEA.jpg', 'IKEA đã tăng 50% lượt truy cập các sản phẩm của mình như thế nào?', '18580-IKEA-da-tang-50-luot-truy-cap-cac-san-pham-cua-minh-nhu-the-nao', 'https://www.brandsvietnam.com/18580-IKEA-da-tang-50-luot-truy-cap-cac-san-pham-cua-minh-nhu-the-nao', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(218, 'https://www.brandsvietnam.com/upload/news/200px/2019/18529_Huda.jpeg', 'The Brief #7: Huda Central\'s Top Talent - Làm mới nhãn hiệu di sản bằng platform âm nhạc', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/18529-The-Brief-7-Huda-Centrals-Top-Talent-Lam-moi-nhan-hieu-di-san-bang-platform-am-nhac', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(219, 'https://www.brandsvietnam.com/upload/news/200px/2019/18517_Pepsi.jpg', 'Pepsi “chơi lớn” trên Instagram cho chiến dịch hè', '18517-Pepsi-choi-lon-tren-Instagram-cho-chien-dich-he', 'https://www.brandsvietnam.com/18517-Pepsi-choi-lon-tren-Instagram-cho-chien-dich-he', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(220, 'https://www.brandsvietnam.com/upload/news/200px/2019/18497_IKEA.jpg', 'IKEA biến phòng khách trong các phim nổi tiếng thành quảng cáo một cách sáng tạo', '18497-IKEA-bien-phong-khach-trong-cac-phim-noi-tieng-thanh-quang-cao-mot-cach-sang-tao', 'https://www.brandsvietnam.com/18497-IKEA-bien-phong-khach-trong-cac-phim-noi-tieng-thanh-quang-cao-mot-cach-sang-tao', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(221, 'https://www.brandsvietnam.com/upload/news/200px/2019/18444_BurgerKing.jpg', '7 lần châm chọc McDonald’s, 7 lần Burger King tăng mạnh doanh thu', '18444-7-lan-cham-choc-McDonalds-7-lan-Burger-King-tang-manh-doanh-thu', 'https://www.brandsvietnam.com/18444-7-lan-cham-choc-McDonalds-7-lan-Burger-King-tang-manh-doanh-thu', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(222, 'https://www.brandsvietnam.com/upload/news/200px/2019/18449_Pepsi.jpg', 'Happiness Saigon cùng Pepsi dùng rác thay lời muốn nói', '18449-Happiness-Saigon-cung-Pepsi-dung-rac-thay-loi-muon-noi', 'https://www.brandsvietnam.com/18449-Happiness-Saigon-cung-Pepsi-dung-rac-thay-loi-muon-noi', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(223, 'https://www.brandsvietnam.com/upload/news/200px/2019/18421_OldSpice.jpg', 'Bán lăn khử mùi nam cho… nữ giới, Old Spice lội ngược dòng ngoạn mục', '18421-Ban-lan-khu-mui-nam-cho-nu-gioi-Old-Spice-loi-nguoc-dong-ngoan-muc', 'https://www.brandsvietnam.com/18421-Ban-lan-khu-mui-nam-cho-nu-gioi-Old-Spice-loi-nguoc-dong-ngoan-muc', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(224, 'https://www.brandsvietnam.com/upload/news/200px/2019/18429_Logos.jpg', 'Những logo kỳ quặc nhất thế giới', '18429-Nhung-logo-ky-quac-nhat-the-gioi', 'https://www.brandsvietnam.com/18429-Nhung-logo-ky-quac-nhat-the-gioi', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(225, 'https://www.brandsvietnam.com/upload/news/200px/2019/18388_PlasticSalt.png', 'Tác hại của hạt vi nhựa - thông điệp ấn tượng từ Dentsu Singapore', '18388-Tac-hai-cua-hat-vi-nhua-thong-diep-an-tuong-tu-Dentsu-Singapore', 'https://www.brandsvietnam.com/18388-Tac-hai-cua-hat-vi-nhua-thong-diep-an-tuong-tu-Dentsu-Singapore', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(226, 'https://www.brandsvietnam.com/upload/news/200px/2019/18308_Samsung.jpeg', 'Samsung đặt những trạm sạc không dây tại các bến xe bus ở khu vực trung tâm Singapore', '18308-Samsung-dat-nhung-tram-sac-khong-day-tai-cac-ben-xe-bus-o-khu-vuc-trung-tam-Singapore', 'https://www.brandsvietnam.com/18308-Samsung-dat-nhung-tram-sac-khong-day-tai-cac-ben-xe-bus-o-khu-vuc-trung-tam-Singapore', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(227, 'https://www.brandsvietnam.com/upload/news/200px/2019/18165_Creative.jpg', '9 chiến thuật “hâm nóng” lửa sáng tạo cho đội ngũ tiếp thị', '18165-9-chien-thuat-ham-nong-lua-sang-tao-cho-doi-ngu-tiep-thi', 'https://www.brandsvietnam.com/18165-9-chien-thuat-ham-nong-lua-sang-tao-cho-doi-ngu-tiep-thi', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(228, 'https://www.brandsvietnam.com/upload/news/200px/2019/18132_Durex.jpg', 'Các nhãn hàng mượn Cá tháng Tư để chơi khăm khách hàng như thế nào?', '18132-Cac-nhan-hang-muon-Ca-thang-Tu-de-choi-kham-khach-hang-nhu-the-nao', 'https://www.brandsvietnam.com/18132-Cac-nhan-hang-muon-Ca-thang-Tu-de-choi-kham-khach-hang-nhu-the-nao', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(229, 'https://www.brandsvietnam.com/upload/news/200px/2019/18092_18092_Viettel_Avatar.png', 'Viettel thấu hiểu giới trẻ qua chiến dịch “Gia đình hay sự nghiệp quan trọng hơn?”', '18092-Viettel-thau-hieu-gioi-tre-qua-chien-dich-Gia-dinh-hay-su-nghiep-quan-trong-hon', 'https://www.brandsvietnam.com/18092-Viettel-thau-hieu-gioi-tre-qua-chien-dich-Gia-dinh-hay-su-nghiep-quan-trong-hon', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(230, 'https://www.brandsvietnam.com/upload/news/200px/2019/18048_LaCaja.jpg', 'Billboard quảng cáo thắp sáng những đoạn đường nguy hiểm của La Caja', '18048-Billboard-quang-cao-thap-sang-nhung-doan-duong-nguy-hiem-cua-La-Caja', 'https://www.brandsvietnam.com/18048-Billboard-quang-cao-thap-sang-nhung-doan-duong-nguy-hiem-cua-La-Caja', ' div.reading-content', '2019-10-02 08:55:34', '2019-10-02 08:55:34', 1),
(231, 'https://www.brandsvietnam.com/upload/news/200px/2019/18037_Ogilvy.png', '3 chiến dịch gây tiếng vang lớn của Ogilvy Việt Nam về quảng cáo hiện đại', '18037-3-chien-dich-gay-tieng-vang-lon-cua-Ogilvy-Viet-Nam-ve-quang-cao-hien-dai', 'https://www.brandsvietnam.com/18037-3-chien-dich-gay-tieng-vang-lon-cua-Ogilvy-Viet-Nam-ve-quang-cao-hien-dai', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(232, 'https://www.brandsvietnam.com/upload/news/200px/2019/18012_18012_Ogilvy_Avatar.png', 'Giám đốc Sáng tạo Ogilvy: \"Người làm sáng tạo vẫn cần xem trọng tư duy kinh doanh\"', '18012-Giam-doc-Sang-tao-Ogilvy-Nguoi-lam-sang-tao-van-can-xem-trong-tu-duy-kinh-doanh', 'https://www.brandsvietnam.com/18012-Giam-doc-Sang-tao-Ogilvy-Nguoi-lam-sang-tao-van-can-xem-trong-tu-duy-kinh-doanh', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(233, 'https://www.brandsvietnam.com/upload/news/200px/2019/17993_17993_Ogilvy_Avatar.png', 'Ogilvy chính thức khởi động Tuần Lễ Ogilvy Việt Nam 2019 với sự ra mắt của Content Studio', '17993-Ogilvy-chinh-thuc-khoi-dong-Tuan-Le-Ogilvy-Viet-Nam-2019-voi-su-ra-mat-cua-Content-Studio', 'https://www.brandsvietnam.com/17993-Ogilvy-chinh-thuc-khoi-dong-Tuan-Le-Ogilvy-Viet-Nam-2019-voi-su-ra-mat-cua-Content-Studio', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(234, 'https://www.brandsvietnam.com/upload/news/200px/2019/17918_BalanceforBetter.jpg', 'Cách giúp các thương hiệu thoát khỏi định kiến giới tính vào ngày 8/3?', '17918-Cach-giup-cac-thuong-hieu-thoat-khoi-dinh-kien-gioi-tinh-vao-ngay-83', 'https://www.brandsvietnam.com/17918-Cach-giup-cac-thuong-hieu-thoat-khoi-dinh-kien-gioi-tinh-vao-ngay-83', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(235, 'https://www.brandsvietnam.com/upload/news/200px/2019/17913_Bitis_Ava.jpg', 'Biti’s x H’Hen Niê: Tham vọng chinh phục phân khúc giày nữ cùng câu chuyện ý nghĩa, sâu sắc và táo bạo về nữ quyền', '17913-Bitis-x-HHen-Nie-Tham-vong-chinh-phuc-phan-khuc-giay-nu-cung-cau-chuyen-y-nghia-sau-sac-va-tao-bao-ve-nu-quyen', 'https://www.brandsvietnam.com/17913-Bitis-x-HHen-Nie-Tham-vong-chinh-phuc-phan-khuc-giay-nu-cung-cau-chuyen-y-nghia-sau-sac-va-tao-bao-ve-nu-quyen', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(236, 'https://www.brandsvietnam.com/upload/news/200px/2019/17847_Abbott_480X360.png', 'Tạo “Chiến dịch Tết” cho thương hiệu sữa trẻ em - Bài toán khó hay dễ?', '17847-Tao-Chien-dich-Tet-cho-thuong-hieu-sua-tre-em-Bai-toan-kho-hay-de', 'https://www.brandsvietnam.com/17847-Tao-Chien-dich-Tet-cho-thuong-hieu-sua-tre-em-Bai-toan-kho-hay-de', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(237, 'https://www.brandsvietnam.com/upload/news/200px/2019/17861_CocaCola.jpg', 'Nằm trong top những chiến dịch hot nhất bên lề Hội nghị thượng đỉnh Mỹ - Triều, Coca-Cola đã làm gì?', '17861-Nam-trong-top-nhung-chien-dich-hot-nhat-ben-le-Hoi-nghi-thuong-dinh-My-Trieu-CocaCola-da-lam-gi', 'https://www.brandsvietnam.com/17861-Nam-trong-top-nhung-chien-dich-hot-nhat-ben-le-Hoi-nghi-thuong-dinh-My-Trieu-CocaCola-da-lam-gi', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(238, 'https://www.brandsvietnam.com/upload/news/200px/2019/17836_BiaSaigon.jpg', 'Các thương hiệu quảng cáo như thế nào nhân hội nghị Trump - Kim tại Việt Nam?', '17836-Cac-thuong-hieu-quang-cao-nhu-the-nao-nhan-hoi-nghi-Trump-Kim-tai-Viet-Nam', 'https://www.brandsvietnam.com/17836-Cac-thuong-hieu-quang-cao-nhu-the-nao-nhan-hoi-nghi-Trump-Kim-tai-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(239, 'https://www.brandsvietnam.com/upload/news/200px/2019/17825_Neptune.png', 'Không còn lấy nước mắt người tiêu dùng, Neptune Tết năm nay thành công hay thất bại?', '17825-Khong-con-lay-nuoc-mat-nguoi-tieu-dung-Neptune-Tet-nam-nay-thanh-cong-hay-that-bai', 'https://www.brandsvietnam.com/17825-Khong-con-lay-nuoc-mat-nguoi-tieu-dung-Neptune-Tet-nam-nay-thanh-cong-hay-that-bai', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(240, 'https://www.brandsvietnam.com/upload/news/200px/2019/17821_Ytuong.jpg', 'Các chiêu \'ăn theo\' Hội nghị Trump - Kim tại Singapore', '17821-Cac-chieu-an-theo-Hoi-nghi-Trump-Kim-tai-Singapore', 'https://www.brandsvietnam.com/17821-Cac-chieu-an-theo-Hoi-nghi-Trump-Kim-tai-Singapore', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(241, 'https://www.brandsvietnam.com/upload/news/200px/2019/17808_ThePizzaCompany_Thumb.jpg', 'Nỗ lực khai thác chất liệu dân gian vào campaign Tết của The Pizza Company', '17808-No-luc-khai-thac-chat-lieu-dan-gian-vao-campaign-Tet-cua-The-Pizza-Company', 'https://www.brandsvietnam.com/17808-No-luc-khai-thac-chat-lieu-dan-gian-vao-campaign-Tet-cua-The-Pizza-Company', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(242, 'https://www.brandsvietnam.com/upload/news/200px/2019/17776_DuongsachBienHoa_Avatar.jpg', 'Chiến dịch Tết đầu tiên của đường sạch Biên Hòa chạm vào nỗi sợ Tết của người Việt', '17776-Chien-dich-Tet-dau-tien-cua-duong-sach-Bien-Hoa-cham-vao-noi-so-Tet-cua-nguoi-Viet', 'https://www.brandsvietnam.com/17776-Chien-dich-Tet-dau-tien-cua-duong-sach-Bien-Hoa-cham-vao-noi-so-Tet-cua-nguoi-Viet', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(243, 'https://www.brandsvietnam.com/upload/news/200px/2019/17747_adidas.jpg', '\"Chiến dịch bất tử\" của adidas', '17747-Chien-dich-bat-tu-cua-adidas', 'https://www.brandsvietnam.com/17747-Chien-dich-bat-tu-cua-adidas', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(244, 'https://www.brandsvietnam.com/upload/news/200px/2019/17717_BurgerKing.jpg', 'Burger King và chiến dịch chơi khăm đối thủ', '17717-Burger-King-va-chien-dich-choi-kham-doi-thu', 'https://www.brandsvietnam.com/17717-Burger-King-va-chien-dich-choi-kham-doi-thu', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(245, 'https://www.brandsvietnam.com/upload/news/200px/2019/17716_PR.jpg', 'Làm PR bằng sự sáng tạo', '17716-Lam-PR-bang-su-sang-tao', 'https://www.brandsvietnam.com/17716-Lam-PR-bang-su-sang-tao', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(246, 'https://www.brandsvietnam.com/upload/news/200px/2019/17668_MiCungDinh.png', 'Phim Tết “độc và lạ” trong chiến dịch Tết 2019', '17668-Phim-Tet-doc-va-la-trong-chien-dich-Tet-2019', 'https://www.brandsvietnam.com/17668-Phim-Tet-doc-va-la-trong-chien-dich-Tet-2019', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(247, 'https://www.brandsvietnam.com/upload/news/200px/2019/17666_Dongvat.jpg', 'Tê giác, voi quỳ \'kêu cứu\' ở sân chùa Vĩnh Nghiêm, Minh Đăng Quang', '17666-Te-giac-voi-quy-keu-cuu-o-san-chua-Vinh-Nghiem-Minh-Dang-Quang', 'https://www.brandsvietnam.com/17666-Te-giac-voi-quy-keu-cuu-o-san-chua-Vinh-Nghiem-Minh-Dang-Quang', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(248, 'https://www.brandsvietnam.com/upload/news/200px/2019/17654_Oppo.png', 'Campaign OPPO Tết 2019: Dùng điện thoại thông minh thế nào mới thông minh?', '17654-Campaign-OPPO-Tet-2019-Dung-dien-thoai-thong-minh-the-nao-moi-thong-minh', 'https://www.brandsvietnam.com/17654-Campaign-OPPO-Tet-2019-Dung-dien-thoai-thong-minh-the-nao-moi-thong-minh', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(249, 'https://www.brandsvietnam.com/upload/news/200px/2019/17653_Durex.jpg', 'Cách Durex “lách” nghịch cảnh để làm chủ thị trường Trung Quốc', '17653-Cach-Durex-lach-nghich-canh-de-lam-chu-thi-truong-Trung-Quoc', 'https://www.brandsvietnam.com/17653-Cach-Durex-lach-nghich-canh-de-lam-chu-thi-truong-Trung-Quoc', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(250, 'https://www.brandsvietnam.com/upload/news/200px/2019/17607_Toyota.png', 'Toyota quảng bá rộng rãi dịch vụ “Bảo dưỡng xe EM60” bằng phong cách Hip-Hop', '17607-Toyota-quang-ba-rong-rai-dich-vu-Bao-duong-xe-EM60-bang-phong-cach-HipHop', 'https://www.brandsvietnam.com/17607-Toyota-quang-ba-rong-rai-dich-vu-Bao-duong-xe-EM60-bang-phong-cach-HipHop', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(251, 'https://www.brandsvietnam.com/upload/news/200px/2019/17606_TheCoffeeHouse.jpg', '\"Hai lá thư\" của The Coffee House: Chọn đề tài gai góc để lan toả thông điệp ý nghĩa', '17606-Hai-la-thu-cua-The-Coffee-House-Chon-de-tai-gai-goc-de-lan-toa-thong-diep-y-nghia', 'https://www.brandsvietnam.com/17606-Hai-la-thu-cua-The-Coffee-House-Chon-de-tai-gai-goc-de-lan-toa-thong-diep-y-nghia', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(252, 'https://www.brandsvietnam.com/upload/news/200px/2019/17576_HuuNghi.jpg', 'Tết Hữu Nghị 2019: Quên hết lo toan - Rộn ràng đón Tết', '17576-Tet-Huu-Nghi-2019-Quen-het-lo-toan-Ron-rang-don-Tet', 'https://www.brandsvietnam.com/17576-Tet-Huu-Nghi-2019-Quen-het-lo-toan-Ron-rang-don-Tet', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(253, 'https://www.brandsvietnam.com/upload/news/200px/2019/17531_OREO.png', '#OreoPeople: Khi ăn bánh cũng là cách thể hiện cá tính', '17531-OreoPeople-Khi-an-banh-cung-la-cach-the-hien-ca-tinh', 'https://www.brandsvietnam.com/17531-OreoPeople-Khi-an-banh-cung-la-cach-the-hien-ca-tinh', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1);
INSERT INTO `news` (`id`, `image`, `title`, `slug`, `content`, `post_by`, `created_at`, `updated_at`, `id_category`) VALUES
(254, 'https://www.brandsvietnam.com/upload/news/200px/2019/17515_Font.jpg', '9 Font chữ sáng tạo dự báo “khuynh đảo” năm 2019', '17515-9-Font-chu-sang-tao-du-bao-khuynh-dao-nam-2019', 'https://www.brandsvietnam.com/17515-9-Font-chu-sang-tao-du-bao-khuynh-dao-nam-2019', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(255, 'https://www.brandsvietnam.com/upload/news/200px/2019/17506_Thoitrang.jpg', 'Chất liệu tái chế hữu cơ sẽ là tương lai của thời trang?', '17506-Chat-lieu-tai-che-huu-co-se-la-tuong-lai-cua-thoi-trang', 'https://www.brandsvietnam.com/17506-Chat-lieu-tai-che-huu-co-se-la-tuong-lai-cua-thoi-trang', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(256, 'https://www.brandsvietnam.com/upload/news/200px/2019/17514_Website.jpg', '10 xu hướng thiết kế website trong năm 2019', '17514-10-xu-huong-thiet-ke-website-trong-nam-2019', 'https://www.brandsvietnam.com/17514-10-xu-huong-thiet-ke-website-trong-nam-2019', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(257, 'https://www.brandsvietnam.com/upload/news/200px/2019/17453_Colors.jpg', '6 màu sắc dự báo “thống trị” năm 2019', '17453-6-mau-sac-du-bao-thong-tri-nam-2019', 'https://www.brandsvietnam.com/17453-6-mau-sac-du-bao-thong-tri-nam-2019', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(258, 'https://www.brandsvietnam.com/upload/news/200px/2019/17241_PizzaHut.jpg', '19 ý tưởng quảng cáo thú vị', '17241-19-y-tuong-quang-cao-thu-vi', 'https://www.brandsvietnam.com/17241-19-y-tuong-quang-cao-thu-vi', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(259, 'https://www.brandsvietnam.com/upload/news/200px/2018/17340_DzungYoko.jpg', 'Dzũng Yoko: “Tôi chỉ là người làm nghệ thuật thời trang, không phải là nhiếp ảnh gia\"', '17340-Dzung-Yoko-Toi-chi-la-nguoi-lam-nghe-thuat-thoi-trang-khong-phai-la-nhiep-anh-gia', 'https://www.brandsvietnam.com/17340-Dzung-Yoko-Toi-chi-la-nguoi-lam-nghe-thuat-thoi-trang-khong-phai-la-nhiep-anh-gia', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(260, 'https://www.brandsvietnam.com/upload/news/200px/2018/17330_ChateauDaLat.png', '“Vụ trộm lâu đài vang - La Casse” - phim ngắn hành động khơi gợi niềm tự hào vang Việt', '17330-Vu-trom-lau-dai-vang-La-Casse-phim-ngan-hanh-dong-khoi-goi-niem-tu-hao-vang-Viet', 'https://www.brandsvietnam.com/17330-Vu-trom-lau-dai-vang-La-Casse-phim-ngan-hanh-dong-khoi-goi-niem-tu-hao-vang-Viet', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(261, 'https://www.brandsvietnam.com/upload/news/200px/2018/17205_Pantone.jpg', 'Pantone công bố \"Living Coral\" là màu sắc của năm 2019', '17205-Pantone-cong-bo-Living-Coral-la-mau-sac-cua-nam-2019', 'https://www.brandsvietnam.com/17205-Pantone-cong-bo-Living-Coral-la-mau-sac-cua-nam-2019', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(262, 'https://www.brandsvietnam.com/upload/news/200px/2018/17158_CocaCola.png', '“Cùng Coca-Cola tri ân thầy cô” – Sức mạnh của marketing activation khi kết hợp cùng digital', '17158-Cung-CocaCola-tri-an-thay-co-Suc-manh-cua-marketing-activation-khi-ket-hop-cung-digital', 'https://www.brandsvietnam.com/17158-Cung-CocaCola-tri-an-thay-co-Suc-manh-cua-marketing-activation-khi-ket-hop-cung-digital', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(263, 'https://www.brandsvietnam.com/upload/news/200px/2018/17156_Shutterstock.jpg', 'Shutterstock: 3 màu sắc thịnh hành nhất năm 2019', '17156-Shutterstock-3-mau-sac-thinh-hanh-nhat-nam-2019', 'https://www.brandsvietnam.com/17156-Shutterstock-3-mau-sac-thinh-hanh-nhat-nam-2019', ' div.reading-content', '2019-10-02 08:55:35', '2019-10-02 08:55:35', 1),
(264, 'https://www.brandsvietnam.com/upload/news/200px/2018/17085_LexusES.jpg', 'Video quảng cáo đầu tiên do trí thông minh nhân tạo AI viết kịch bản', '17085-Video-quang-cao-dau-tien-do-tri-thong-minh-nhan-tao-AI-viet-kich-ban', 'https://www.brandsvietnam.com/17085-Video-quang-cao-dau-tien-do-tri-thong-minh-nhan-tao-AI-viet-kich-ban', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(265, 'https://www.brandsvietnam.com/upload/news/200px/2018/16943_Dulux.jpg', 'The Brief #6: Dulux - Bảo vệ hải đăng', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/16943-The-Brief-6-Dulux-Bao-ve-hai-dang', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(266, 'https://www.brandsvietnam.com/upload/news/200px/2018/16958_OMO.PNG', '“Tạm rời màn hình, trải nghiệm cuộc sống” - OMO dùng công nghệ giải quyết vấn đề của công nghệ', '16958-Tam-roi-man-hinh-trai-nghiem-cuoc-song-OMO-dung-cong-nghe-giai-quyet-van-de-cua-cong-nghe', 'https://www.brandsvietnam.com/16958-Tam-roi-man-hinh-trai-nghiem-cuoc-song-OMO-dung-cong-nghe-giai-quyet-van-de-cua-cong-nghe', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(267, 'https://www.brandsvietnam.com/upload/news/200px/2018/16918_Dove.jpg', 'Thương hiệu và khả năng thấu cảm', '16918-Thuong-hieu-va-kha-nang-thau-cam', 'https://www.brandsvietnam.com/16918-Thuong-hieu-va-kha-nang-thau-cam', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(268, 'https://www.brandsvietnam.com/upload/news/200px/2019/19253_0.png', '\"Tam quốc tranh hùng\" thị trường smartphone Việt Nam', '19253-Tam-quoc-tranh-hung-thi-truong-smartphone-Viet-Nam', 'https://www.brandsvietnam.com/19253-Tam-quoc-tranh-hung-thi-truong-smartphone-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(269, 'https://www.brandsvietnam.com/upload/news/200px/2019/19260_80.jpg', 'Doanh thu từ ngành bán lẻ tiếp tục đà tăng trưởng', '19260-Doanh-thu-tu-nganh-ban-le-tiep-tuc-da-tang-truong', 'https://www.brandsvietnam.com/19260-Doanh-thu-tu-nganh-ban-le-tiep-tuc-da-tang-truong', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(270, 'https://www.brandsvietnam.com/upload/news/200px/2019/19252_16.jpg', 'Thị trường tablet tại Việt Nam tiếp tục giảm sút', '19252-Thi-truong-tablet-tai-Viet-Nam-tiep-tuc-giam-sut', 'https://www.brandsvietnam.com/19252-Thi-truong-tablet-tai-Viet-Nam-tiep-tuc-giam-sut', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(271, 'https://www.brandsvietnam.com/upload/news/200px/2019/19247_9.jpg', '[Infographic] Toàn cảnh kinh tế xã hội 9 tháng đầu năm 2019 qua những con số', '19247-Infographic-Toan-canh-kinh-te-xa-hoi-9-thang-dau-nam-2019-qua-nhung-con-so', 'https://www.brandsvietnam.com/19247-Infographic-Toan-canh-kinh-te-xa-hoi-9-thang-dau-nam-2019-qua-nhung-con-so', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(272, 'https://www.brandsvietnam.com/upload/news/200px/2019/5_1569802713.jpg', 'Nhập khẩu ô tô đạt 2,4 tỷ USD từ đầu năm', '19248-Nhap-khau-o-to-dat-24-ty-USD-tu-dau-nam', 'https://www.brandsvietnam.com/19248-Nhap-khau-o-to-dat-24-ty-USD-tu-dau-nam', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(273, 'https://www.brandsvietnam.com/upload/news/200px/2019/19237_24.jpg', 'Cuộc đua thị trường đặt phòng trực tuyến', '19237-Cuoc-dua-thi-truong-dat-phong-truc-tuyen', 'https://www.brandsvietnam.com/19237-Cuoc-dua-thi-truong-dat-phong-truc-tuyen', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(274, 'https://www.brandsvietnam.com/upload/news/200px/2019/19231_7.jpg', 'Khách hàng đang dần dần rời xa chợ truyền thống?', '19231-Khach-hang-dang-dan-dan-roi-xa-cho-truyen-thong', 'https://www.brandsvietnam.com/19231-Khach-hang-dang-dan-dan-roi-xa-cho-truyen-thong', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(275, 'https://www.brandsvietnam.com/upload/news/200px/2019/19218_13.jpg', 'Mua ô tô trên thương mại điện tử ngày càng tăng', '19218-Mua-o-to-tren-thuong-mai-dien-tu-ngay-cang-tang', 'https://www.brandsvietnam.com/19218-Mua-o-to-tren-thuong-mai-dien-tu-ngay-cang-tang', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(276, 'https://www.brandsvietnam.com/upload/news/200px/2019/19203_10.jpeg', 'Tình hình hoạt động của các mạng xã hội \'Made in Vietnam\'', '19203-Tinh-hinh-hoat-dong-cua-cac-mang-xa-hoi-Made-in-Vietnam', 'https://www.brandsvietnam.com/19203-Tinh-hinh-hoat-dong-cua-cac-mang-xa-hoi-Made-in-Vietnam', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(277, 'https://www.brandsvietnam.com/upload/news/200px/2019/19205_15.jpg', 'Lại sắp nóng M&A ngành ngân hàng', '19205-Lai-sap-nong-MA-nganh-ngan-hang', 'https://www.brandsvietnam.com/19205-Lai-sap-nong-MA-nganh-ngan-hang', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(278, 'https://www.brandsvietnam.com/upload/news/200px/2019/19207_4.jpg', 'Doanh nghiệp hướng đến tiêu dùng xanh', '19207-Doanh-nghiep-huong-den-tieu-dung-xanh', 'https://www.brandsvietnam.com/19207-Doanh-nghiep-huong-den-tieu-dung-xanh', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(279, 'https://www.brandsvietnam.com/upload/news/200px/2019/19200_Hangkhong.jpg', 'Các hãng hàng không bắt đầu lo mất thị phần', '19200-Cac-hang-hang-khong-bat-dau-lo-mat-thi-phan', 'https://www.brandsvietnam.com/19200-Cac-hang-hang-khong-bat-dau-lo-mat-thi-phan', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(280, 'https://www.brandsvietnam.com/upload/news/200px/2019/19195_16.jpeg', 'Cuộc cạnh tranh khốc liệt của các \"siêu ứng dụng\" tại châu Á', '19195-Cuoc-canh-tranh-khoc-liet-cua-cac-sieu-ung-dung-tai-chau-A', 'https://www.brandsvietnam.com/19195-Cuoc-canh-tranh-khoc-liet-cua-cac-sieu-ung-dung-tai-chau-A', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(281, 'https://www.brandsvietnam.com/upload/news/200px/2019/19191_2.jpg', 'Cà phê là nạn nhân trực tiếp của cuộc chiến tranh thương mại Mỹ - Trung Quốc', '19191-Ca-phe-la-nan-nhan-truc-tiep-cua-cuoc-chien-tranh-thuong-mai-My-Trung-Quoc', 'https://www.brandsvietnam.com/19191-Ca-phe-la-nan-nhan-truc-tiep-cua-cuoc-chien-tranh-thuong-mai-My-Trung-Quoc', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(282, 'https://www.brandsvietnam.com/upload/news/200px/2019/19190_15.jpg', 'Thay đổi du lịch từ công nghệ dữ liệu', '19190-Thay-doi-du-lich-tu-cong-nghe-du-lieu', 'https://www.brandsvietnam.com/19190-Thay-doi-du-lich-tu-cong-nghe-du-lieu', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(283, 'https://www.brandsvietnam.com/upload/news/200px/2019/19189_12.jpg', 'Việt Nam muốn vào danh sách hệ sinh thái khởi nghiệp hàng đầu Đông Nam Á', '19189-Viet-Nam-muon-vao-danh-sach-he-sinh-thai-khoi-nghiep-hang-dau-Dong-Nam-A', 'https://www.brandsvietnam.com/19189-Viet-Nam-muon-vao-danh-sach-he-sinh-thai-khoi-nghiep-hang-dau-Dong-Nam-A', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(284, 'https://www.brandsvietnam.com/upload/news/200px/2019/19178_2.jpg', 'Việt Nam thuộc nhóm phát tán trang web lừa đảo nhiều nhất Đông Nam Á', '19178-Viet-Nam-thuoc-nhom-phat-tan-trang-web-lua-dao-nhieu-nhat-Dong-Nam-A', 'https://www.brandsvietnam.com/19178-Viet-Nam-thuoc-nhom-phat-tan-trang-web-lua-dao-nhieu-nhat-Dong-Nam-A', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(285, 'https://www.brandsvietnam.com/upload/news/200px/2019/19184_20.jpg', 'Thương hiệu bán lẻ ngoại: Vào - ra, sống - chết', '19184-Thuong-hieu-ban-le-ngoai-Vao-ra-song-chet', 'https://www.brandsvietnam.com/19184-Thuong-hieu-ban-le-ngoai-Vao-ra-song-chet', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(286, 'https://www.brandsvietnam.com/upload/news/200px/2019/19145_3.jpg', 'Tiêu dùng nhanh đi vội lên trực tuyến', '19145-Tieu-dung-nhanh-di-voi-len-truc-tuyen', 'https://www.brandsvietnam.com/19145-Tieu-dung-nhanh-di-voi-len-truc-tuyen', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(287, 'https://www.brandsvietnam.com/upload/news/200px/2019/105_1568110718.jpg', 'Airbnb, Agoda, Booking dần lấy thị phần khách sạn bình dân', '19169-Airbnb-Agoda-Booking-dan-lay-thi-phan-khach-san-binh-dan', 'https://www.brandsvietnam.com/19169-Airbnb-Agoda-Booking-dan-lay-thi-phan-khach-san-binh-dan', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(288, 'https://www.brandsvietnam.com/upload/news/200px/2019/19165_7.jpg', 'Thị trường bia, cà phê vỉa hè hơn 3 tỷ USD', '19165-Thi-truong-bia-ca-phe-via-he-hon-3-ty-USD', 'https://www.brandsvietnam.com/19165-Thi-truong-bia-ca-phe-via-he-hon-3-ty-USD', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(289, 'https://www.brandsvietnam.com/upload/news/200px/2019/19149_103.jpg', 'Ngân hàng  hai bảng nợ xấu', '19149-Ngan-hang-hai-bang-no-xau', 'https://www.brandsvietnam.com/19149-Ngan-hang-hai-bang-no-xau', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(290, 'https://www.brandsvietnam.com/upload/news/200px/2019/19138_3.jpg', 'Nội địa hoá được 5%: Doanh nghiệp Việt đánh mất mình trong thị trường điện tử 12 tỷ USD', '19138-Noi-dia-hoa-duoc-5-Doanh-nghiep-Viet-danh-mat-minh-trong-thi-truong-dien-tu-12-ty-USD', 'https://www.brandsvietnam.com/19138-Noi-dia-hoa-duoc-5-Doanh-nghiep-Viet-danh-mat-minh-trong-thi-truong-dien-tu-12-ty-USD', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(291, 'https://www.brandsvietnam.com/upload/news/200px/2019/19146_11.jpg', 'Sóng ngầm vay ngang hàng', '19146-Song-ngam-vay-ngang-hang', 'https://www.brandsvietnam.com/19146-Song-ngam-vay-ngang-hang', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(292, 'https://www.brandsvietnam.com/upload/news/200px/2019/19147_1.png', 'Hưởng lợi từ thương chiến, xuất khẩu điện thoại của Việt Nam tăng mạnh', '19147-Huong-loi-tu-thuong-chien-xuat-khau-dien-thoai-cua-Viet-Nam-tang-manh', 'https://www.brandsvietnam.com/19147-Huong-loi-tu-thuong-chien-xuat-khau-dien-thoai-cua-Viet-Nam-tang-manh', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(293, 'https://www.brandsvietnam.com/upload/news/200px/2019/19151_2.jpg', 'Sức hấp dẫn của thị trường mỹ phẩm', '19151-Suc-hap-dan-cua-thi-truong-my-pham', 'https://www.brandsvietnam.com/19151-Suc-hap-dan-cua-thi-truong-my-pham', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(294, 'https://www.brandsvietnam.com/upload/news/200px/2019/19158_19158_Ava_1.jpg', 'Quảng cáo trên Facebook, Google, YouTube: Doanh nghiệp phải nộp thay thuế nhà thầu', '19158-Quang-cao-tren-Facebook-Google-YouTube-Doanh-nghiep-phai-nop-thay-thue-nha-thau', 'https://www.brandsvietnam.com/19158-Quang-cao-tren-Facebook-Google-YouTube-Doanh-nghiep-phai-nop-thay-thue-nha-thau', ' div.reading-content', '2019-10-02 08:55:36', '2019-10-02 08:55:36', 1),
(295, 'https://www.brandsvietnam.com/upload/news/200px/2019/19137_9.png', 'Việt Nam có thêm 2 ngành hàng xuất khẩu 10 tỷ USD', '19137-Viet-Nam-co-them-2-nganh-hang-xuat-khau-10-ty-USD', 'https://www.brandsvietnam.com/19137-Viet-Nam-co-them-2-nganh-hang-xuat-khau-10-ty-USD', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(296, 'https://www.brandsvietnam.com/upload/news/200px/2019/19132_6.jpg', 'Thêm công ty được cấp phép trung gian thanh toán', '19132-Them-cong-ty-duoc-cap-phep-trung-gian-thanh-toan', 'https://www.brandsvietnam.com/19132-Them-cong-ty-duoc-cap-phep-trung-gian-thanh-toan', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(297, 'https://www.brandsvietnam.com/upload/news/200px/2019/19128_16.jpg', 'Thế lưỡng cực trong thị trường bán lẻ Việt Nam', '19128-The-luong-cuc-trong-thi-truong-ban-le-Viet-Nam', 'https://www.brandsvietnam.com/19128-The-luong-cuc-trong-thi-truong-ban-le-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(298, 'https://www.brandsvietnam.com/upload/news/200px/2019/19125_Ava_1_1567487485.jpg', 'Chi tiêu cho FMCG tăng mạnh ở Nông thôn', '19130-Chi-tieu-cho-FMCG-tang-manh-o-Nong-thon', 'https://www.brandsvietnam.com/19130-Chi-tieu-cho-FMCG-tang-manh-o-Nong-thon', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(299, 'https://www.brandsvietnam.com/upload/news/200px/2019/12_1567410383.jpg', 'Thương mại điện tử đua đầu tư kho vận hậu cần', '19124-Thuong-mai-dien-tu-dua-dau-tu-kho-van-hau-can', 'https://www.brandsvietnam.com/19124-Thuong-mai-dien-tu-dua-dau-tu-kho-van-hau-can', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(300, 'https://www.brandsvietnam.com/upload/news/200px/2019/19109_10.jpg', 'Chính phủ ủng hộ Kinh tế chia sẻ', '19109-Chinh-phu-ung-ho-Kinh-te-chia-se', 'https://www.brandsvietnam.com/19109-Chinh-phu-ung-ho-Kinh-te-chia-se', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(301, 'https://www.brandsvietnam.com/upload/news/200px/2019/19120_4.jpg', 'Hàng không chạy đua vé rẻ', '19120-Hang-khong-chay-dua-ve-re', 'https://www.brandsvietnam.com/19120-Hang-khong-chay-dua-ve-re', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(302, 'https://www.brandsvietnam.com/upload/news/200px/2019/19122_2.jpg', 'Du lịch Việt thu được bao nhiêu từ du khách trong 8 tháng?', '19122-Du-lich-Viet-thu-duoc-bao-nhieu-tu-du-khach-trong-8-thang', 'https://www.brandsvietnam.com/19122-Du-lich-Viet-thu-duoc-bao-nhieu-tu-du-khach-trong-8-thang', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(303, 'https://www.brandsvietnam.com/upload/news/200px/2019/19119_news-facebook-account-kit.jpg', 'Người dùng Việt Nam bị nhận nhiều tin nhắn lạ từ Facebook', '19119-Nguoi-dung-Viet-Nam-bi-nhan-nhieu-tin-nhan-la-tu-Facebook', 'https://www.brandsvietnam.com/19119-Nguoi-dung-Viet-Nam-bi-nhan-nhieu-tin-nhan-la-tu-Facebook', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(304, 'https://www.brandsvietnam.com/upload/news/200px/2019/19099_4.jpg', 'Thặng dư thương mại hàng hoá đã đạt 2,9 tỷ USD', '19099-Thang-du-thuong-mai-hang-hoa-da-dat-29-ty-USD', 'https://www.brandsvietnam.com/19099-Thang-du-thuong-mai-hang-hoa-da-dat-29-ty-USD', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(305, 'https://www.brandsvietnam.com/upload/news/200px/2019/19115_19115_Ava_1.jpg', 'Sau 20h sẽ không còn cuộc gọi quảng cáo?', '19115-Sau-20h-se-khong-con-cuoc-goi-quang-cao', 'https://www.brandsvietnam.com/19115-Sau-20h-se-khong-con-cuoc-goi-quang-cao', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(306, 'https://www.brandsvietnam.com/upload/news/200px/2019/19113_19113_Ava_1.jpg', 'Cơ cấu khách quốc tế quá lệch, cách nào cho du lịch đa dạng thị trường?', '19113-Co-cau-khach-quoc-te-qua-lech-cach-nao-cho-du-lich-da-dang-thi-truong', 'https://www.brandsvietnam.com/19113-Co-cau-khach-quoc-te-qua-lech-cach-nao-cho-du-lich-da-dang-thi-truong', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(307, 'https://www.brandsvietnam.com/upload/news/200px/2019/19078_19078_Ava_1.jpg', 'Edtech Việt Nam - chạm tay vào một giấc mơ toàn cầu', '19078-Edtech-Viet-Nam-cham-tay-vao-mot-giac-mo-toan-cau', 'https://www.brandsvietnam.com/19078-Edtech-Viet-Nam-cham-tay-vao-mot-giac-mo-toan-cau', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(308, 'https://www.brandsvietnam.com/upload/news/200px/2019/19091_16.jpg', 'Bánh Trung thu: Trong nước tăng, xuất khẩu giảm', '19091-Banh-Trung-thu-Trong-nuoc-tang-xuat-khau-giam', 'https://www.brandsvietnam.com/19091-Banh-Trung-thu-Trong-nuoc-tang-xuat-khau-giam', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(309, 'https://www.brandsvietnam.com/upload/news/200px/2019/19060_6.jpg', 'ESPORTS: Cuộc đấu tỉ đô', '19060-ESPORTS-Cuoc-dau-ti-do', 'https://www.brandsvietnam.com/19060-ESPORTS-Cuoc-dau-ti-do', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(310, 'https://www.brandsvietnam.com/upload/news/200px/2019/19070_10.jpg', 'Bứt phá M&A: Tháo nút thắt chính sách', '19070-But-pha-MA-Thao-nut-that-chinh-sach', 'https://www.brandsvietnam.com/19070-But-pha-MA-Thao-nut-that-chinh-sach', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(311, 'https://www.brandsvietnam.com/upload/news/200px/2019/19067_13.jpg', 'Xuất khẩu qua Alibaba & Amazon', '19067-Xuat-khau-qua-Alibaba-Amazon', 'https://www.brandsvietnam.com/19067-Xuat-khau-qua-Alibaba-Amazon', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(312, 'https://www.brandsvietnam.com/upload/news/200px/2019/19069_7.jpg', 'Thị trường giao hàng nhanh: Cuộc đua công nghệ', '19069-Thi-truong-giao-hang-nhanh-Cuoc-dua-cong-nghe', 'https://www.brandsvietnam.com/19069-Thi-truong-giao-hang-nhanh-Cuoc-dua-cong-nghe', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(313, 'https://www.brandsvietnam.com/upload/news/200px/2019/19071_4.jpg', 'Vay tiêu dùng vào cuộc đua mới', '19071-Vay-tieu-dung-vao-cuoc-dua-moi', 'https://www.brandsvietnam.com/19071-Vay-tieu-dung-vao-cuoc-dua-moi', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(314, 'https://www.brandsvietnam.com/upload/news/200px/2019/19062_9.jpg', 'GrabFood, Go-Food bùng nổ, các cửa hàng truyền thống có lao đao?', '19062-GrabFood-GoFood-bung-no-cac-cua-hang-truyen-thong-co-lao-dao', 'https://www.brandsvietnam.com/19062-GrabFood-GoFood-bung-no-cac-cua-hang-truyen-thong-co-lao-dao', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(315, 'https://www.brandsvietnam.com/upload/news/200px/2019/19064_1.jpg', 'Bùng nổ nhượng quyền thương hiệu', '19064-Bung-no-nhuong-quyen-thuong-hieu', 'https://www.brandsvietnam.com/19064-Bung-no-nhuong-quyen-thuong-hieu', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(316, 'https://www.brandsvietnam.com/upload/news/200px/2019/11_1566286123.jpg', 'Hơn nửa đầu năm 2019, ô tô nhập khẩu tăng 500%', '19059-Hon-nua-dau-nam-2019-o-to-nhap-khau-tang-500', 'https://www.brandsvietnam.com/19059-Hon-nua-dau-nam-2019-o-to-nhap-khau-tang-500', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(317, 'https://www.brandsvietnam.com/upload/news/200px/2019/19050_3.jpg', 'Thị trường smartphone: Oppo “đe dọa” vị trí số 1 của Samsung', '19050-Thi-truong-smartphone-Oppo-de-doa-vi-tri-so-1-cua-Samsung', 'https://www.brandsvietnam.com/19050-Thi-truong-smartphone-Oppo-de-doa-vi-tri-so-1-cua-Samsung', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(318, 'https://www.brandsvietnam.com/upload/news/200px/2019/19045_2.jpg', 'Việt Nam chi hơn 4,3 tỷ USD nhập ô tô, linh kiện phụ tùng', '19045-Viet-Nam-chi-hon-43-ty-USD-nhap-o-to-linh-kien-phu-tung', 'https://www.brandsvietnam.com/19045-Viet-Nam-chi-hon-43-ty-USD-nhap-o-to-linh-kien-phu-tung', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(319, 'https://www.brandsvietnam.com/upload/news/200px/2019/19048_8.jpg', 'Ngành FMCG sẽ tận dụng dữ liệu khách hàng để cá nhân hoá tiêu dùng', '19048-Nganh-FMCG-se-tan-dung-du-lieu-khach-hang-de-ca-nhan-hoa-tieu-dung', 'https://www.brandsvietnam.com/19048-Nganh-FMCG-se-tan-dung-du-lieu-khach-hang-de-ca-nhan-hoa-tieu-dung', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(320, 'https://www.brandsvietnam.com/upload/news/200px/2019/19025_5.jpg', 'Sau Vingroup và Masan, SK Group tiếp tục tìm thương vụ mới tại Việt Nam', '19025-Sau-Vingroup-va-Masan-SK-Group-tiep-tuc-tim-thuong-vu-moi-tai-Viet-Nam', 'https://www.brandsvietnam.com/19025-Sau-Vingroup-va-Masan-SK-Group-tiep-tuc-tim-thuong-vu-moi-tai-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(321, 'https://www.brandsvietnam.com/upload/news/200px/2019/19041_19040_Ava_1.jpg', 'Grab và Go-Jek đang hơn thua nhau thế nào ở Đông Nam Á?', '19041-Grab-va-GoJek-dang-hon-thua-nhau-the-nao-o-Dong-Nam-A', 'https://www.brandsvietnam.com/19041-Grab-va-GoJek-dang-hon-thua-nhau-the-nao-o-Dong-Nam-A', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(322, 'https://www.brandsvietnam.com/upload/news/200px/2019/19040_19040_Ava_1.jpg', 'Du khách nội – ngoại: Ai mang lại nguồn thu lớn hơn?', '19040-Du-khach-noi-ngoai-Ai-mang-lai-nguon-thu-lon-hon', 'https://www.brandsvietnam.com/19040-Du-khach-noi-ngoai-Ai-mang-lai-nguon-thu-lon-hon', ' div.reading-content', '2019-10-02 08:55:37', '2019-10-02 08:55:37', 1),
(323, 'https://www.brandsvietnam.com/upload/news/200px/2019/19044_1003.jpg', 'Thị trường mỹ phẩm hút nhà đầu tư mới', '19044-Thi-truong-my-pham-hut-nha-dau-tu-moi', 'https://www.brandsvietnam.com/19044-Thi-truong-my-pham-hut-nha-dau-tu-moi', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(324, 'https://www.brandsvietnam.com/upload/news/200px/2019/19023_Yola.png', 'Vốn tư nhân đang đổ vào những dự án giáo dục nào?', '19023-Von-tu-nhan-dang-do-vao-nhung-du-an-giao-duc-nao', 'https://www.brandsvietnam.com/19023-Von-tu-nhan-dang-do-vao-nhung-du-an-giao-duc-nao', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(325, 'https://www.brandsvietnam.com/upload/news/200px/2019/19039_19039_Ava_1.jpg', 'Cửa hàng nhỏ đóng cửa ồ ạt, vì sao TGDĐ mở chuỗi Điện Thoại Siêu Rẻ?', '19039-Cua-hang-nho-dong-cua-o-at-vi-sao-TGDD-mo-chuoi-Dien-Thoai-Sieu-Re', 'https://www.brandsvietnam.com/19039-Cua-hang-nho-dong-cua-o-at-vi-sao-TGDD-mo-chuoi-Dien-Thoai-Sieu-Re', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(326, 'https://www.brandsvietnam.com/upload/news/200px/2019/19037_6.jpg', 'Taxi truyền thống Hà Nội muốn chuyển sang mô hình như Grab', '19037-Taxi-truyen-thong-Ha-Noi-muon-chuyen-sang-mo-hinh-nhu-Grab', 'https://www.brandsvietnam.com/19037-Taxi-truyen-thong-Ha-Noi-muon-chuyen-sang-mo-hinh-nhu-Grab', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(327, 'https://www.brandsvietnam.com/upload/news/200px/2019/19027_artificialintelligence5-1.jpg', 'Chỉ 1% các startup trên thế giới đang sử dụng công nghệ AI', '19027-Chi-1-cac-startup-tren-the-gioi-dang-su-dung-cong-nghe-AI', 'https://www.brandsvietnam.com/19027-Chi-1-cac-startup-tren-the-gioi-dang-su-dung-cong-nghe-AI', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(328, 'https://www.brandsvietnam.com/upload/news/200px/2019/19163_19.jpg', 'Bất hòa nhận thức: Cách người bán thay đổi niềm tin người mua qua marketing', '19163-Bat-hoa-nhan-thuc-Cach-nguoi-ban-thay-doi-niem-tin-nguoi-mua-qua-marketing', 'https://www.brandsvietnam.com/19163-Bat-hoa-nhan-thuc-Cach-nguoi-ban-thay-doi-niem-tin-nguoi-mua-qua-marketing', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(329, 'https://www.brandsvietnam.com/upload/news/200px/2019/19141_4.jpg', '6 lời khuyên để đời của tỷ phú Warren Buffett', '19141-6-loi-khuyen-de-doi-cua-ty-phu-Warren-Buffett', 'https://www.brandsvietnam.com/19141-6-loi-khuyen-de-doi-cua-ty-phu-Warren-Buffett', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(330, 'https://www.brandsvietnam.com/upload/news/200px/2019/19110_1.jpg', 'Sai lầm cần tránh trong thiết kế cửa hàng bán lẻ', '19110-Sai-lam-can-tranh-trong-thiet-ke-cua-hang-ban-le', 'https://www.brandsvietnam.com/19110-Sai-lam-can-tranh-trong-thiet-ke-cua-hang-ban-le', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(331, 'https://www.brandsvietnam.com/upload/news/200px/2019/18333_18333_SmartR_Avatar.png', 'Blended Learning: Phương pháp trị bệnh “lười học” tiếng Anh của dân công sở', '18333-Blended-Learning-Phuong-phap-tri-benh-luoi-hoc-tieng-Anh-cua-dan-cong-so', 'https://www.brandsvietnam.com/18333-Blended-Learning-Phuong-phap-tri-benh-luoi-hoc-tieng-Anh-cua-dan-cong-so', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(332, 'https://www.brandsvietnam.com/upload/news/200px/2019/18973_18973_Ava_1.jpg', 'Chuyển đổi văn hóa doanh nghiệp phù hợp “Kỷ nguyên số”', '18973-Chuyen-doi-van-hoa-doanh-nghiep-phu-hop-Ky-nguyen-so', 'https://www.brandsvietnam.com/18973-Chuyen-doi-van-hoa-doanh-nghiep-phu-hop-Ky-nguyen-so', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(333, 'https://www.brandsvietnam.com/upload/news/200px/2019/18946_5.jpg', 'Nâng tầm thương hiệu: Thời bán lẻ kiểu mới', '18946-Nang-tam-thuong-hieu-Thoi-ban-le-kieu-moi', 'https://www.brandsvietnam.com/18946-Nang-tam-thuong-hieu-Thoi-ban-le-kieu-moi', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(334, 'https://www.brandsvietnam.com/upload/news/200px/2019/18862_LEADERSHIP.jpg', '4 đặc điểm giúp nhân viên bình thường thành CEO', '18862-4-dac-diem-giup-nhan-vien-binh-thuong-thanh-CEO', 'https://www.brandsvietnam.com/18862-4-dac-diem-giup-nhan-vien-binh-thuong-thanh-CEO', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(335, 'https://www.brandsvietnam.com/upload/news/200px/2019/18863_hand-holding-magnet.jpg', '4 kiểu phong cách quản lý giữ chân người tài của sếp có tầm', '18863-4-kieu-phong-cach-quan-ly-giu-chan-nguoi-tai-cua-sep-co-tam', 'https://www.brandsvietnam.com/18863-4-kieu-phong-cach-quan-ly-giu-chan-nguoi-tai-cua-sep-co-tam', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(336, 'https://www.brandsvietnam.com/upload/news/200px/2019/18833_3.jpg', 'Chiến lược định vị ngày nay có mới?', '18833-Chien-luoc-dinh-vi-ngay-nay-co-moi', 'https://www.brandsvietnam.com/18833-Chien-luoc-dinh-vi-ngay-nay-co-moi', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(337, 'https://www.brandsvietnam.com/upload/news/200px/2019/18760_changes_to_family_law_ontario.jpg', 'Luật cạnh tranh 2018: Làm rõ tiêu chí xác định doanh nghiệp thống lĩnh thị trường', '18760-Luat-canh-tranh-2018-Lam-ro-tieu-chi-xac-dinh-doanh-nghiep-thong-linh-thi-truong', 'https://www.brandsvietnam.com/18760-Luat-canh-tranh-2018-Lam-ro-tieu-chi-xac-dinh-doanh-nghiep-thong-linh-thi-truong', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(338, 'https://www.brandsvietnam.com/upload/news/200px/2019/18730_Apples-keynote-event_Tim_Cook.jpg', 'Để thuyết trình ra mắt sản phẩm mới đạt hiệu quả cao như Apple', '18730-De-thuyet-trinh-ra-mat-san-pham-moi-dat-hieu-qua-cao-nhu-Apple', 'https://www.brandsvietnam.com/18730-De-thuyet-trinh-ra-mat-san-pham-moi-dat-hieu-qua-cao-nhu-Apple', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(339, 'https://www.brandsvietnam.com/upload/news/200px/2019/18718_Service.jpg', 'Servqual: Mô hình 5 khoảng cách để cải thiện chất lượng dịch vụ', '18718-Servqual-Mo-hinh-5-khoang-cach-de-cai-thien-chat-luong-dich-vu', 'https://www.brandsvietnam.com/18718-Servqual-Mo-hinh-5-khoang-cach-de-cai-thien-chat-luong-dich-vu', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(340, 'https://www.brandsvietnam.com/upload/news/200px/2019/18688_CannesLions.jpg', 'Học thêm từ Cannes Lions bằng 3 câu hỏi', '18688-Hoc-them-tu-Cannes-Lions-bang-3-cau-hoi', 'https://www.brandsvietnam.com/18688-Hoc-them-tu-Cannes-Lions-bang-3-cau-hoi', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(341, 'https://www.brandsvietnam.com/upload/news/200px/2019/18664_avatar.jpg', 'Chọn đại sứ thương hiệu dễ hay khó? Các nhãn hàng đã chọn đại sứ cho mình như thế nào?', '18664-Chon-dai-su-thuong-hieu-de-hay-kho-Cac-nhan-hang-da-chon-dai-su-cho-minh-nhu-the-nao', 'https://www.brandsvietnam.com/18664-Chon-dai-su-thuong-hieu-de-hay-kho-Cac-nhan-hang-da-chon-dai-su-cho-minh-nhu-the-nao', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(342, 'https://www.brandsvietnam.com/upload/news/200px/2019/18622_Design.jpg', 'Bí quyết làm slide thuyết trình ấn tượng', '18622-Bi-quyet-lam-slide-thuyet-trinh-an-tuong', 'https://www.brandsvietnam.com/18622-Bi-quyet-lam-slide-thuyet-trinh-an-tuong', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(343, 'https://www.brandsvietnam.com/upload/news/200px/2019/18569_elon-musk.jpg', 'Năm bài học từ hành trình khởi nghiệp của Elon Musk', '18569-Nam-bai-hoc-tu-hanh-trinh-khoi-nghiep-cua-Elon-Musk', 'https://www.brandsvietnam.com/18569-Nam-bai-hoc-tu-hanh-trinh-khoi-nghiep-cua-Elon-Musk', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(344, 'https://www.brandsvietnam.com/upload/news/200px/2019/18576_GreyCells.jpg', 'Con người - Yếu tố quan trọng nhất trong dịch vụ', '18576-Con-nguoi-Yeu-to-quan-trong-nhat-trong-dich-vu', 'https://www.brandsvietnam.com/18576-Con-nguoi-Yeu-to-quan-trong-nhat-trong-dich-vu', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(345, 'https://www.brandsvietnam.com/upload/news/200px/2019/18557_SteveJobs.jpg', 'Steve Jobs \'thao túng\' người khác như thế nào?', '18557-Steve-Jobs-thao-tung-nguoi-khac-nhu-the-nao', 'https://www.brandsvietnam.com/18557-Steve-Jobs-thao-tung-nguoi-khac-nhu-the-nao', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(346, 'https://www.brandsvietnam.com/upload/news/200px/2019/18547_Paying.jpg', '2 câu hỏi khám phá thói quen tiêu xài của khách hàng', '18547-2-cau-hoi-kham-pha-thoi-quen-tieu-xai-cua-khach-hang', 'https://www.brandsvietnam.com/18547-2-cau-hoi-kham-pha-thoi-quen-tieu-xai-cua-khach-hang', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(347, 'https://www.brandsvietnam.com/upload/news/200px/2019/18419_Leadership.jpg', '5 chiến lược thú vị giúp bạn xây dựng kĩ năng lãnh đạo', '18419-5-chien-luoc-thu-vi-giup-ban-xay-dung-ki-nang-lanh-dao', 'https://www.brandsvietnam.com/18419-5-chien-luoc-thu-vi-giup-ban-xay-dung-ki-nang-lanh-dao', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(348, 'https://www.brandsvietnam.com/upload/news/200px/2019/18439_Marketing.jpg', 'Làm thế nào để khiến cho khách hàng tiếp thị thay bạn?', '18439-Lam-the-nao-de-khien-cho-khach-hang-tiep-thi-thay-ban', 'https://www.brandsvietnam.com/18439-Lam-the-nao-de-khien-cho-khach-hang-tiep-thi-thay-ban', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(349, 'https://www.brandsvietnam.com/upload/news/200px/2019/18413_CEO.jpg', '5 cách xây dựng thương hiệu cá nhân đơn giản, hiệu quả cho CEO', '18413-5-cach-xay-dung-thuong-hieu-ca-nhan-don-gian-hieu-qua-cho-CEO', 'https://www.brandsvietnam.com/18413-5-cach-xay-dung-thuong-hieu-ca-nhan-don-gian-hieu-qua-cho-CEO', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(350, 'https://www.brandsvietnam.com/upload/news/200px/2019/18414_PersonalBrand.png', 'Thương hiệu cá nhân: Chìa khóa mở cửa thành công', '18414-Thuong-hieu-ca-nhan-Chia-khoa-mo-cua-thanh-cong', 'https://www.brandsvietnam.com/18414-Thuong-hieu-ca-nhan-Chia-khoa-mo-cua-thanh-cong', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(351, 'https://www.brandsvietnam.com/upload/news/200px/2019/18400_Customer.jpg', '5 sai lầm chết người trong dịch vụ khách hàng', '18400-5-sai-lam-chet-nguoi-trong-dich-vu-khach-hang', 'https://www.brandsvietnam.com/18400-5-sai-lam-chet-nguoi-trong-dich-vu-khach-hang', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(352, 'https://www.brandsvietnam.com/upload/news/200px/2019/18399_Ytuong.png', 'Có thêm ý tưởng phong phú với 3 cách đơn giản', '18399-Co-them-y-tuong-phong-phu-voi-3-cach-don-gian', 'https://www.brandsvietnam.com/18399-Co-them-y-tuong-phong-phu-voi-3-cach-don-gian', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(353, 'https://www.brandsvietnam.com/upload/news/200px/2019/18367_CEO.jpg', 'Bài học từ những sai lầm của các CEO', '18367-Bai-hoc-tu-nhung-sai-lam-cua-cac-CEO', 'https://www.brandsvietnam.com/18367-Bai-hoc-tu-nhung-sai-lam-cua-cac-CEO', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(354, 'https://www.brandsvietnam.com/upload/news/200px/2019/18266_eCommerce.jpg', 'Kinh doanh điện tử và thương mại điện tử', '18266-Kinh-doanh-dien-tu-va-thuong-mai-dien-tu', 'https://www.brandsvietnam.com/18266-Kinh-doanh-dien-tu-va-thuong-mai-dien-tu', ' div.reading-content', '2019-10-02 08:55:38', '2019-10-02 08:55:38', 1),
(355, 'https://www.brandsvietnam.com/upload/news/200px/2019/18248_Leading.jpg', 'Thay đổi khi đang dẫn đầu cuộc chơi', '18248-Thay-doi-khi-dang-dan-dau-cuoc-choi', 'https://www.brandsvietnam.com/18248-Thay-doi-khi-dang-dan-dau-cuoc-choi', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(356, 'https://www.brandsvietnam.com/upload/news/200px/2019/18222_SteveJobs.jpg', 'Lý thuyết đơn giản của Steve Jobs về trách nhiệm của người lãnh đạo', '18222-Ly-thuyet-don-gian-cua-Steve-Jobs-ve-trach-nhiem-cua-nguoi-lanh-dao', 'https://www.brandsvietnam.com/18222-Ly-thuyet-don-gian-cua-Steve-Jobs-ve-trach-nhiem-cua-nguoi-lanh-dao', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(357, 'https://www.brandsvietnam.com/upload/news/200px/2019/18138_Salesperson.jpg', 'Người hướng nội có hợp với nghề sales?', '18138-Nguoi-huong-noi-co-hop-voi-nghe-sales', 'https://www.brandsvietnam.com/18138-Nguoi-huong-noi-co-hop-voi-nghe-sales', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(358, 'https://www.brandsvietnam.com/upload/news/200px/2019/18147_Khoinghiep.png', 'Công ty khởi nghiệp: Lớn mạnh nhưng cần giữ vững văn hóa', '18147-Cong-ty-khoi-nghiep-Lon-manh-nhung-can-giu-vung-van-hoa', 'https://www.brandsvietnam.com/18147-Cong-ty-khoi-nghiep-Lon-manh-nhung-can-giu-vung-van-hoa', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(359, 'https://www.brandsvietnam.com/upload/news/200px/2019/18095_CEO.jpg', 'Nhiệm kỳ chớp nhoáng của CEO', '18095-Nhiem-ky-chop-nhoang-cua-CEO', 'https://www.brandsvietnam.com/18095-Nhiem-ky-chop-nhoang-cua-CEO', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(360, 'https://www.brandsvietnam.com/upload/news/200px/2019/18085_Adtima.jpg', 'Gợi ý nơi làm việc đáng mơ ước cho sinh viên marketing 2019', '18085-Goi-y-noi-lam-viec-dang-mo-uoc-cho-sinh-vien-marketing-2019', 'https://www.brandsvietnam.com/18085-Goi-y-noi-lam-viec-dang-mo-uoc-cho-sinh-vien-marketing-2019', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(361, 'https://www.brandsvietnam.com/upload/news/200px/2019/17989_Manager.jpg', 'Kỹ năng quản trị trong bối cảnh đa văn hóa', '17989-Ky-nang-quan-tri-trong-boi-canh-da-van-hoa', 'https://www.brandsvietnam.com/17989-Ky-nang-quan-tri-trong-boi-canh-da-van-hoa', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(362, 'https://www.brandsvietnam.com/upload/news/200px/2019/18020_Book.jpg', '8 quyển sách dành cho sinh viên thiết kế', '18020-8-quyen-sach-danh-cho-sinh-vien-thiet-ke', 'https://www.brandsvietnam.com/18020-8-quyen-sach-danh-cho-sinh-vien-thiet-ke', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(363, 'https://www.brandsvietnam.com/upload/news/200px/2019/17994_Supermarket.jpg', 'Những yếu tố ảnh hưởng đến doanh thu khi doanh nghiệp chọn kênh phân phối siêu thị', '17994-Nhung-yeu-to-anh-huong-den-doanh-thu-khi-doanh-nghiep-chon-kenh-phan-phoi-sieu-thi', 'https://www.brandsvietnam.com/17994-Nhung-yeu-to-anh-huong-den-doanh-thu-khi-doanh-nghiep-chon-kenh-phan-phoi-sieu-thi', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(364, 'https://www.brandsvietnam.com/upload/news/200px/2019/18006_Quyetdinh.jpg', '3 mô hình ra quyết định', '18006-3-mo-hinh-ra-quyet-dinh', 'https://www.brandsvietnam.com/18006-3-mo-hinh-ra-quyet-dinh', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(365, 'https://www.brandsvietnam.com/upload/news/200px/2019/17954_Book.jpg', 'Những bài học đắt giá đằng sau 8 cuốn sách kinh doanh hay nhất mọi thời đại', '17954-Nhung-bai-hoc-dat-gia-dang-sau-8-cuon-sach-kinh-doanh-hay-nhat-moi-thoi-dai', 'https://www.brandsvietnam.com/17954-Nhung-bai-hoc-dat-gia-dang-sau-8-cuon-sach-kinh-doanh-hay-nhat-moi-thoi-dai', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(366, 'https://www.brandsvietnam.com/upload/news/200px/2019/17960_Thuyetphuc.jpg', 'Nói trước đám đông không còn là “kỹ năng mềm”', '17960-Noi-truoc-dam-dong-khong-con-la-ky-nang-mem', 'https://www.brandsvietnam.com/17960-Noi-truoc-dam-dong-khong-con-la-ky-nang-mem', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(367, 'https://www.brandsvietnam.com/upload/news/200px/2019/17987_Adtima.jpg', 'Nếu bạn theo đuổi con đường trở thành Account, hãy thử một lần chơi lớn với Adtima Ignite', '17987-Neu-ban-theo-duoi-con-duong-tro-thanh-Account-hay-thu-mot-lan-choi-lon-voi-Adtima-Ignite', 'https://www.brandsvietnam.com/17987-Neu-ban-theo-duoi-con-duong-tro-thanh-Account-hay-thu-mot-lan-choi-lon-voi-Adtima-Ignite', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(368, 'https://www.brandsvietnam.com/upload/news/200px/2019/17980_Creative.jpg', 'Chỉ số sáng tạo quan trọng ra sao với doanh nghiệp?', '17980-Chi-so-sang-tao-quan-trong-ra-sao-voi-doanh-nghiep', 'https://www.brandsvietnam.com/17980-Chi-so-sang-tao-quan-trong-ra-sao-voi-doanh-nghiep', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(369, 'https://www.brandsvietnam.com/upload/news/200px/2019/17953_CMO.jpg', '3 bài học đơn giản mà giám đốc marketing cần có', '17953-3-bai-hoc-don-gian-ma-giam-doc-marketing-can-co', 'https://www.brandsvietnam.com/17953-3-bai-hoc-don-gian-ma-giam-doc-marketing-can-co', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(370, 'https://www.brandsvietnam.com/upload/news/200px/2019/17944_Kythuatso.jpg', 'Havard Business Review: 3 cách để trở lại hành trình kỹ thuật số', '17944-Havard-Business-Review-3-cach-de-tro-lai-hanh-trinh-ky-thuat-so', 'https://www.brandsvietnam.com/17944-Havard-Business-Review-3-cach-de-tro-lai-hanh-trinh-ky-thuat-so', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(371, 'https://www.brandsvietnam.com/upload/news/200px/2019/17902_restaurant-management-matrix-0.jpg', '4 yếu tố cần biết khi chuẩn bị mở Quán ăn - Nhà hàng', '17902-4-yeu-to-can-biet-khi-chuan-bi-mo-Quan-an-Nha-hang', 'https://www.brandsvietnam.com/17902-4-yeu-to-can-biet-khi-chuan-bi-mo-Quan-an-Nha-hang', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(372, 'https://www.brandsvietnam.com/upload/news/200px/2019/17923_Pareto.jpg', 'Nguyên tắc Pareto trong quản trị cung ứng', '17923-Nguyen-tac-Pareto-trong-quan-tri-cung-ung', 'https://www.brandsvietnam.com/17923-Nguyen-tac-Pareto-trong-quan-tri-cung-ung', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(373, 'https://www.brandsvietnam.com/upload/news/200px/2019/17880_Data.jpg', '4 lưu ý khi sử dụng dữ liệu trong marketing', '17880-4-luu-y-khi-su-dung-du-lieu-trong-marketing', 'https://www.brandsvietnam.com/17880-4-luu-y-khi-su-dung-du-lieu-trong-marketing', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(374, 'https://www.brandsvietnam.com/upload/news/200px/2019/17869_Franchise.jpg', '5 bước để nhượng quyền thương mại thành công', '17869-5-buoc-de-nhuong-quyen-thuong-mai-thanh-cong', 'https://www.brandsvietnam.com/17869-5-buoc-de-nhuong-quyen-thuong-mai-thanh-cong', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(375, 'https://www.brandsvietnam.com/upload/news/200px/2019/17850_DonaldTrump.png', 'Bài học kinh doanh từ nghệ thuật đàm phán của ông Donald Trump', '17850-Bai-hoc-kinh-doanh-tu-nghe-thuat-dam-phan-cua-ong-Donald-Trump', 'https://www.brandsvietnam.com/17850-Bai-hoc-kinh-doanh-tu-nghe-thuat-dam-phan-cua-ong-Donald-Trump', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(376, 'https://www.brandsvietnam.com/upload/news/200px/2019/17853_JohnPaulDeJoria.jpg', '3 yếu tố quyết định tiềm năng của sản phẩm mới', '17853-3-yeu-to-quyet-dinh-tiem-nang-cua-san-pham-moi', 'https://www.brandsvietnam.com/17853-3-yeu-to-quyet-dinh-tiem-nang-cua-san-pham-moi', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(377, 'https://www.brandsvietnam.com/upload/news/200px/2019/17827_TTConsultant_avatar.jpg', 'Những sai lầm \"giết chết\" fanpage Facebook của một doanh nghiệp', '17827-Nhung-sai-lam-giet-chet-fanpage-Facebook-cua-mot-doanh-nghiep', 'https://www.brandsvietnam.com/17827-Nhung-sai-lam-giet-chet-fanpage-Facebook-cua-mot-doanh-nghiep', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(378, 'https://www.brandsvietnam.com/upload/news/200px/2019/17818_ConsumerPower.png', 'Khai thác “quyền lực mới” để dẫn đầu', '17818-Khai-thac-quyen-luc-moi-de-dan-dau', 'https://www.brandsvietnam.com/17818-Khai-thac-quyen-luc-moi-de-dan-dau', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(379, 'https://www.brandsvietnam.com/upload/news/200px/2019/17787_Creative.jpg', 'Cách duy trì sáng tạo khi đang căng thẳng', '17787-Cach-duy-tri-sang-tao-khi-dang-cang-thang', 'https://www.brandsvietnam.com/17787-Cach-duy-tri-sang-tao-khi-dang-cang-thang', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(380, 'https://www.brandsvietnam.com/upload/news/200px/2019/17720_CocaCola.png', '“Cá nhân hóa” (Personalization) trong markerting', '17720-Ca-nhan-hoa-Personalization-trong-markerting', 'https://www.brandsvietnam.com/17720-Ca-nhan-hoa-Personalization-trong-markerting', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(381, 'https://www.brandsvietnam.com/upload/news/200px/2019/17735_Restaurant.jpg', '7 bài học quản lý từ các nhà hàng Michelin', '17735-7-bai-hoc-quan-ly-tu-cac-nha-hang-Michelin', 'https://www.brandsvietnam.com/17735-7-bai-hoc-quan-ly-tu-cac-nha-hang-Michelin', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(382, 'https://www.brandsvietnam.com/upload/news/200px/2019/17736_Franchise.jpg', 'Kinh doanh nhượng quyền: 23 câu hỏi cần đặt ra cho nhà nhượng quyền khi gặp mặt trực tiếp', '17736-Kinh-doanh-nhuong-quyen-23-cau-hoi-can-dat-ra-cho-nha-nhuong-quyen-khi-gap-mat-truc-tiep', 'https://www.brandsvietnam.com/17736-Kinh-doanh-nhuong-quyen-23-cau-hoi-can-dat-ra-cho-nha-nhuong-quyen-khi-gap-mat-truc-tiep', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(383, 'https://www.brandsvietnam.com/upload/news/200px/2019/17724_SoichiroHonda.jpg', 'Những triết lý làm nên sức mạnh của Honda', '17724-Nhung-triet-ly-lam-nen-suc-manh-cua-Honda', 'https://www.brandsvietnam.com/17724-Nhung-triet-ly-lam-nen-suc-manh-cua-Honda', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(384, 'https://www.brandsvietnam.com/upload/news/200px/2019/17711_Manager.png', 'Sử dụng hiệu quả các nguồn lực tiếp thị', '17711-Su-dung-hieu-qua-cac-nguon-luc-tiep-thi', 'https://www.brandsvietnam.com/17711-Su-dung-hieu-qua-cac-nguon-luc-tiep-thi', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(385, 'https://www.brandsvietnam.com/upload/news/200px/2019/17634_LarryEllison.jpg', '7 bài học kinh doanh thành công từ ông chủ Oracle', '17634-7-bai-hoc-kinh-doanh-thanh-cong-tu-ong-chu-Oracle', 'https://www.brandsvietnam.com/17634-7-bai-hoc-kinh-doanh-thanh-cong-tu-ong-chu-Oracle', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(386, 'https://www.brandsvietnam.com/upload/news/200px/2019/17628_SocialMedia.jpg', 'Những thước đo hiệu quả tiếp thị bằng truyền thông xã hội', '17628-Nhung-thuoc-do-hieu-qua-tiep-thi-bang-truyen-thong-xa-hoi', 'https://www.brandsvietnam.com/17628-Nhung-thuoc-do-hieu-qua-tiep-thi-bang-truyen-thong-xa-hoi', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(387, 'https://www.brandsvietnam.com/upload/news/200px/2019/17601_OprahWinfrey.jpg', '3 bài học kinh doanh từ \"nữ hoàng truyền thông\" Oprah Winfrey', '17601-3-bai-hoc-kinh-doanh-tu-nu-hoang-truyen-thong-Oprah-Winfrey', 'https://www.brandsvietnam.com/17601-3-bai-hoc-kinh-doanh-tu-nu-hoang-truyen-thong-Oprah-Winfrey', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(388, 'https://www.brandsvietnam.com/upload/news/200px/2019/17590_Presentation.jpg', 'Kỹ năng thuyết trình: Càng đơn giản, càng thuyết phục', '17590-Ky-nang-thuyet-trinh-Cang-don-gian-cang-thuyet-phuc', 'https://www.brandsvietnam.com/17590-Ky-nang-thuyet-trinh-Cang-don-gian-cang-thuyet-phuc', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(389, 'https://www.brandsvietnam.com/upload/news/200px/2019/17600_Marketer.jpg', '8 quy tắc cơ bản các marketer phải tuân theo', '17600-8-quy-tac-co-ban-cac-marketer-phai-tuan-theo', 'https://www.brandsvietnam.com/17600-8-quy-tac-co-ban-cac-marketer-phai-tuan-theo', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(390, 'https://www.brandsvietnam.com/upload/news/200px/2019/17586_Storytelling.jpg', 'Nghệ thuật kể chuyện bằng tên thương hiệu', '17586-Nghe-thuat-ke-chuyen-bang-ten-thuong-hieu', 'https://www.brandsvietnam.com/17586-Nghe-thuat-ke-chuyen-bang-ten-thuong-hieu', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(391, 'https://www.brandsvietnam.com/upload/news/200px/2019/17511_2.jpg', '5 bí mật thú vị về khả năng lãnh đạo', '17511-5-bi-mat-thu-vi-ve-kha-nang-lanh-dao', 'https://www.brandsvietnam.com/17511-5-bi-mat-thu-vi-ve-kha-nang-lanh-dao', ' div.reading-content', '2019-10-02 08:55:39', '2019-10-02 08:55:39', 1),
(392, 'https://www.brandsvietnam.com/upload/news/200px/2019/17528_sangtao1.jpg', '5 câu hỏi giết chết khả năng sáng tạo của bạn', '17528-5-cau-hoi-giet-chet-kha-nang-sang-tao-cua-ban', 'https://www.brandsvietnam.com/17528-5-cau-hoi-giet-chet-kha-nang-sang-tao-cua-ban', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1);
INSERT INTO `news` (`id`, `image`, `title`, `slug`, `content`, `post_by`, `created_at`, `updated_at`, `id_category`) VALUES
(393, 'https://www.brandsvietnam.com/upload/news/200px/2019/17545_Pipelines.jpeg', 'Chuỗi giá trị, Hệ sinh thái và các quy luật mới về Chiến lược Kinh doanh (Phần 2)', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/17545-Chuoi-gia-tri-He-sinh-thai-va-cac-quy-luat-moi-ve-Chien-luoc-Kinh-doanh-Phan-2', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(394, 'https://www.brandsvietnam.com/upload/news/200px/2019/17461_Salesteam.jpg', '7 tiêu chí để trở thành đội ngũ bán hàng xuất sắc', '17461-7-tieu-chi-de-tro-thanh-doi-ngu-ban-hang-xuat-sac', 'https://www.brandsvietnam.com/17461-7-tieu-chi-de-tro-thanh-doi-ngu-ban-hang-xuat-sac', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(395, 'https://www.brandsvietnam.com/upload/news/200px/2019/17455_CEO.jpg', '3 nhóm đối tượng CEO cần giao tiếp hiệu quả để thành công', '17455-3-nhom-doi-tuong-CEO-can-giao-tiep-hieu-qua-de-thanh-cong', 'https://www.brandsvietnam.com/17455-3-nhom-doi-tuong-CEO-can-giao-tiep-hieu-qua-de-thanh-cong', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(396, 'https://www.brandsvietnam.com/upload/news/200px/2019/17456_DVKhachhang.jpg', '2 quyết định quan trọng mang lại sự hài lòng cho khách hàng', '17456-2-quyet-dinh-quan-trong-mang-lai-su-hai-long-cho-khach-hang', 'https://www.brandsvietnam.com/17456-2-quyet-dinh-quan-trong-mang-lai-su-hai-long-cho-khach-hang', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(397, 'https://www.brandsvietnam.com/upload/news/200px/2018/17373_Bookaholic7.png', 'Bookaholic #7: “90-20-30” - 90 Bài học vỡ lòng về ý tưởng và câu chữ', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/17373-Bookaholic-7-902030-90-Bai-hoc-vo-long-ve-y-tuong-va-cau-chu', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(398, 'https://www.brandsvietnam.com/upload/news/200px/2018/17368_InboundMarketing.jpg', 'Inbound Marketing dùng sao cho đúng?', '17368-Inbound-Marketing-dung-sao-cho-dung', 'https://www.brandsvietnam.com/17368-Inbound-Marketing-dung-sao-cho-dung', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(399, 'https://www.brandsvietnam.com/upload/news/200px/2018/17379_Lanhdao.jpg', 'Chuyển đổi vai trò của nhà quản lý để phát triển doanh nghiệp', '17379-Chuyen-doi-vai-tro-cua-nha-quan-ly-de-phat-trien-doanh-nghiep', 'https://www.brandsvietnam.com/17379-Chuyen-doi-vai-tro-cua-nha-quan-ly-de-phat-trien-doanh-nghiep', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(400, 'https://www.brandsvietnam.com/upload/news/200px/2018/17370_ProductTest.png', 'Sản phẩm mới doanh nghiệp tự thử nghiệm được không?', '17370-San-pham-moi-doanh-nghiep-tu-thu-nghiem-duoc-khong', 'https://www.brandsvietnam.com/17370-San-pham-moi-doanh-nghiep-tu-thu-nghiem-duoc-khong', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(401, 'https://www.brandsvietnam.com/upload/news/200px/2018/17348_Content.jpg', 'Nội dung – trái tim của tiếp thị số', '17348-Noi-dung-trai-tim-cua-tiep-thi-so', 'https://www.brandsvietnam.com/17348-Noi-dung-trai-tim-cua-tiep-thi-so', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(402, 'https://www.brandsvietnam.com/upload/news/200px/2018/17267_Banhang.jpg', 'Làm sao để bán hàng cho Tổng thống?', '17267-Lam-sao-de-ban-hang-cho-Tong-thong', 'https://www.brandsvietnam.com/17267-Lam-sao-de-ban-hang-cho-Tong-thong', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(403, 'https://www.brandsvietnam.com/upload/news/200px/2018/17290_Leader.jpg', 'Câu chuyện bất ngờ về thuật lãnh đạo', '17290-Cau-chuyen-bat-ngo-ve-thuat-lanh-dao', 'https://www.brandsvietnam.com/17290-Cau-chuyen-bat-ngo-ve-thuat-lanh-dao', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(404, 'https://www.brandsvietnam.com/upload/news/200px/2018/17275_Sales.jpg', 'Nhiệm vụ nghề sales: Tìm ra nhu cầu của khách hàng', '17275-Nhiem-vu-nghe-sales-Tim-ra-nhu-cau-cua-khach-hang', 'https://www.brandsvietnam.com/17275-Nhiem-vu-nghe-sales-Tim-ra-nhu-cau-cua-khach-hang', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(405, 'https://www.brandsvietnam.com/upload/news/200px/2018/17251_Salesperson.jpg', 'Vượt qua nỗi sợ bán hàng', '17251-Vuot-qua-noi-so-ban-hang', 'https://www.brandsvietnam.com/17251-Vuot-qua-noi-so-ban-hang', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(406, 'https://www.brandsvietnam.com/upload/news/200px/2018/17210_CEO.jpg', '3 kiểu tư duy cần có của CEO', '17210-3-kieu-tu-duy-can-co-cua-CEO', 'https://www.brandsvietnam.com/17210-3-kieu-tu-duy-can-co-cua-CEO', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(407, 'https://www.brandsvietnam.com/upload/news/200px/2018/17232_Statista.jpg', '18 nguồn miễn phí để tự nghiên cứu đối thủ / thị trường', '17232-18-nguon-mien-phi-de-tu-nghien-cuu-doi-thu-thi-truong', 'https://www.brandsvietnam.com/17232-18-nguon-mien-phi-de-tu-nghien-cuu-doi-thu-thi-truong', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(408, 'https://www.brandsvietnam.com/upload/news/200px/2018/17208_Smile.jpg', 'Tiếp thị bằng nụ cười: Hiểu đúng để ứng dụng hiệu quả', '17208-Tiep-thi-bang-nu-cuoi-Hieu-dung-de-ung-dung-hieu-qua', 'https://www.brandsvietnam.com/17208-Tiep-thi-bang-nu-cuoi-Hieu-dung-de-ung-dung-hieu-qua', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(409, 'https://www.brandsvietnam.com/upload/news/200px/2018/17121_Content.jpeg', '3 câu hỏi cho chiến lược tiếp thị nội dung', '17121-3-cau-hoi-cho-chien-luoc-tiep-thi-noi-dung', 'https://www.brandsvietnam.com/17121-3-cau-hoi-cho-chien-luoc-tiep-thi-noi-dung', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(410, 'https://www.brandsvietnam.com/upload/news/200px/2018/17130_GenYZ.png', 'Xây dựng mối quan hệ khách hàng Gen Y & Z với CRM và dữ liệu', '17130-Xay-dung-moi-quan-he-khach-hang-Gen-Y-Z-voi-CRM-va-du-lieu', 'https://www.brandsvietnam.com/17130-Xay-dung-moi-quan-he-khach-hang-Gen-Y-Z-voi-CRM-va-du-lieu', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(411, 'https://www.brandsvietnam.com/upload/news/200px/2018/17095_YoungMarketers.jpeg', 'Chung kết cuộc thi Young Marketers 7: Khi ‘Gen Z’ lội ngược dòng văn hóa để cứu tuồng (hát bội)', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/17095-Chung-ket-cuoc-thi-Young-Marketers-7-Khi-Gen-Z-loi-nguoc-dong-van-hoa-de-cuu-tuong-hat-boi', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(412, 'https://www.brandsvietnam.com/upload/news/200px/2018/17081_Bookaholic6.png', 'Bookaholic #6: HBR On Strategic Marketing - Marketing Chiến lược', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/17081-Bookaholic-6-HBR-On-Strategic-Marketing-Marketing-Chien-luoc', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(413, 'https://www.brandsvietnam.com/upload/news/200px/2018/17067_Sales.jpg', 'Kỹ năng bán hàng: Đừng bỏ qua cuộc gặp “mặt đối mặt, tay bắt tay”', '17067-Ky-nang-ban-hang-Dung-bo-qua-cuoc-gap-mat-doi-mat-tay-bat-tay', 'https://www.brandsvietnam.com/17067-Ky-nang-ban-hang-Dung-bo-qua-cuoc-gap-mat-doi-mat-tay-bat-tay', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(414, 'https://www.brandsvietnam.com/upload/news/200px/2018/17030_Leader.jpg', '4 kỹ năng ra quyết định quan trọng cần có trong công việc', '17030-4-ky-nang-ra-quyet-dinh-quan-trong-can-co-trong-cong-viec', 'https://www.brandsvietnam.com/17030-4-ky-nang-ra-quyet-dinh-quan-trong-can-co-trong-cong-viec', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(415, 'https://www.brandsvietnam.com/upload/news/200px/2018/16992_Military.jpg', '7 nguyên tắc quân sự có thể áp dụng vào chiến lược marketing', '16992-7-nguyen-tac-quan-su-co-the-ap-dung-vao-chien-luoc-marketing', 'https://www.brandsvietnam.com/16992-7-nguyen-tac-quan-su-co-the-ap-dung-vao-chien-luoc-marketing', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(416, 'https://www.brandsvietnam.com/upload/news/200px/2018/16983_Startup.jpg', 'Công ty startup và bốn sai lầm lớn trong điều hành', '16983-Cong-ty-startup-va-bon-sai-lam-lon-trong-dieu-hanh', 'https://www.brandsvietnam.com/16983-Cong-ty-startup-va-bon-sai-lam-lon-trong-dieu-hanh', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(417, 'https://www.brandsvietnam.com/upload/news/200px/2018/16945_MarketingPlan.jpg', '3 câu hỏi kinh điển của người làm marketing', '16945-3-cau-hoi-kinh-dien-cua-nguoi-lam-marketing', 'https://www.brandsvietnam.com/16945-3-cau-hoi-kinh-dien-cua-nguoi-lam-marketing', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(418, 'https://www.brandsvietnam.com/upload/news/200px/2018/16842_PiyushGupta.jpg', '5 chữ \"I\" của một nhà lãnh đạo xuất sắc', '16842-5-chu-I-cua-mot-nha-lanh-dao-xuat-sac', 'https://www.brandsvietnam.com/16842-5-chu-I-cua-mot-nha-lanh-dao-xuat-sac', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(419, 'https://www.brandsvietnam.com/upload/news/200px/2018/16836_BusinessRelationship.jpg', 'Thành công nhờ xây dựng mối quan hệ hiệu quả', '16836-Thanh-cong-nho-xay-dung-moi-quan-he-hieu-qua', 'https://www.brandsvietnam.com/16836-Thanh-cong-nho-xay-dung-moi-quan-he-hieu-qua', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(420, 'https://www.brandsvietnam.com/upload/news/200px/2018/16831_Content.jpg', 'Thêm gia vị cho nội dung tiếp thị', '16831-Them-gia-vi-cho-noi-dung-tiep-thi', 'https://www.brandsvietnam.com/16831-Them-gia-vi-cho-noi-dung-tiep-thi', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(421, 'https://www.brandsvietnam.com/upload/news/200px/2018/16814_CEOChallange.jpg', 'Cuộc thi P&G CEO Challenge 2018 - Cơ hội để người trẻ học cách tư duy như một CEO', '16814-Cuoc-thi-PG-CEO-Challenge-2018-Co-hoi-de-nguoi-tre-hoc-cach-tu-duy-nhu-mot-CEO', 'https://www.brandsvietnam.com/16814-Cuoc-thi-PG-CEO-Challenge-2018-Co-hoi-de-nguoi-tre-hoc-cach-tu-duy-nhu-mot-CEO', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(422, 'https://www.brandsvietnam.com/upload/news/200px/2018/16805_Branding.jpg', 'Thương hiệu và ảnh hưởng từ quốc gia xuất xứ', '16805-Thuong-hieu-va-anh-huong-tu-quoc-gia-xuat-xu', 'https://www.brandsvietnam.com/16805-Thuong-hieu-va-anh-huong-tu-quoc-gia-xuat-xu', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(423, 'https://www.brandsvietnam.com/upload/news/200px/2018/16769_Innovative.jpg', 'Cách các công ty trên thế giới đổi mới sáng tạo', '16769-Cach-cac-cong-ty-tren-the-gioi-doi-moi-sang-tao', 'https://www.brandsvietnam.com/16769-Cach-cac-cong-ty-tren-the-gioi-doi-moi-sang-tao', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(424, 'https://www.brandsvietnam.com/upload/news/200px/2018/16734_16734JeffBezos.jpg', '3 lời khuyên về việc lắng nghe lời phê bình của tỷ phú Jeff Bezos', '16734-3-loi-khuyen-ve-viec-lang-nghe-loi-phe-binh-cua-ty-phu-Jeff-Bezos', 'https://www.brandsvietnam.com/16734-3-loi-khuyen-ve-viec-lang-nghe-loi-phe-binh-cua-ty-phu-Jeff-Bezos', ' div.reading-content', '2019-10-02 08:55:40', '2019-10-02 08:55:40', 1),
(425, 'https://www.brandsvietnam.com/upload/news/200px/2018/16737_CustomerExperience.jpg', 'Trải nghiệm của khách hàng trong quá trình sáp nhập công ty', '16737-Trai-nghiem-cua-khach-hang-trong-qua-trinh-sap-nhap-cong-ty', 'https://www.brandsvietnam.com/16737-Trai-nghiem-cua-khach-hang-trong-qua-trinh-sap-nhap-cong-ty', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(426, 'https://www.brandsvietnam.com/upload/news/200px/2018/16736_Target.jpg', 'Quản trị bằng mục tiêu', '16736-Quan-tri-bang-muc-tieu', 'https://www.brandsvietnam.com/16736-Quan-tri-bang-muc-tieu', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(427, 'https://www.brandsvietnam.com/upload/news/200px/2018/16692_AzrielRatz.jpg', '4 bài học lội ngược dòng từ một CEO', '16692-4-bai-hoc-loi-nguoc-dong-tu-mot-CEO', 'https://www.brandsvietnam.com/16692-4-bai-hoc-loi-nguoc-dong-tu-mot-CEO', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(428, 'https://www.brandsvietnam.com/upload/news/200px/2018/16697_Logos.jpg', 'Logo cũng có ảnh hưởng tới quyết định mua hàng', '16697-Logo-cung-co-anh-huong-toi-quyet-dinh-mua-hang', 'https://www.brandsvietnam.com/16697-Logo-cung-co-anh-huong-toi-quyet-dinh-mua-hang', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(429, 'https://www.brandsvietnam.com/upload/news/200px/2018/16706_PhamHongHai.jpg', 'CEO HSBC Việt Nam chia sẻ những thất bại trên giảng đường', '16706-CEO-HSBC-Viet-Nam-chia-se-nhung-that-bai-tren-giang-duong', 'https://www.brandsvietnam.com/16706-CEO-HSBC-Viet-Nam-chia-se-nhung-that-bai-tren-giang-duong', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(430, 'https://www.brandsvietnam.com/upload/news/200px/2018/16690_InternetofThings.jpg', '3 lưu ý cho doanh nghiệp Việt muốn tiếp cận Internet vạn vật', '16690-3-luu-y-cho-doanh-nghiep-Viet-muon-tiep-can-Internet-van-vat', 'https://www.brandsvietnam.com/16690-3-luu-y-cho-doanh-nghiep-Viet-muon-tiep-can-Internet-van-vat', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(431, 'https://www.brandsvietnam.com/upload/news/200px/2018/16645_Branding.png', 'Các cấp độ làm thương hiệu', '16645-Cac-cap-do-lam-thuong-hieu', 'https://www.brandsvietnam.com/16645-Cac-cap-do-lam-thuong-hieu', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(432, 'https://www.brandsvietnam.com/upload/news/200px/2018/16667_Manager.jpg', '3 bẫy nhận thức khiến nhà lãnh đạo ra quyết định sai trong thời đại dữ liệu', '16667-3-bay-nhan-thuc-khien-nha-lanh-dao-ra-quyet-dinh-sai-trong-thoi-dai-du-lieu', 'https://www.brandsvietnam.com/16667-3-bay-nhan-thuc-khien-nha-lanh-dao-ra-quyet-dinh-sai-trong-thoi-dai-du-lieu', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(433, 'https://www.brandsvietnam.com/upload/news/200px/2018/16686_CocaCola.jpg', 'Thu hút khách hàng bằng tâm lý sở hữu', '16686-Thu-hut-khach-hang-bang-tam-ly-so-huu', 'https://www.brandsvietnam.com/16686-Thu-hut-khach-hang-bang-tam-ly-so-huu', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(434, 'https://www.brandsvietnam.com/upload/news/200px/2018/16681_YoungMarketers.png', 'Công bố Đề thi Vòng loại Young Marketers 7', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/16681-Cong-bo-De-thi-Vong-loai-Young-Marketers-7', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(435, 'https://www.brandsvietnam.com/upload/news/200px/2018/16677_Video.jpg', '6 cách giúp thương hiệu tỏa sáng với các chiến lược video marketing', '16677-6-cach-giup-thuong-hieu-toa-sang-voi-cac-chien-luoc-video-marketing', 'https://www.brandsvietnam.com/16677-6-cach-giup-thuong-hieu-toa-sang-voi-cac-chien-luoc-video-marketing', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(436, 'https://www.brandsvietnam.com/upload/news/200px/2018/16666_Investor.jpg', 'Nhà đầu tư nhìn vào những yếu tố nào để quyết định rót vốn cho một ý tưởng khởi nghiệp?', '16666-Nha-dau-tu-nhin-vao-nhung-yeu-to-nao-de-quyet-dinh-rot-von-cho-mot-y-tuong-khoi-nghiep', 'https://www.brandsvietnam.com/16666-Nha-dau-tu-nhin-vao-nhung-yeu-to-nao-de-quyet-dinh-rot-von-cho-mot-y-tuong-khoi-nghiep', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(437, 'https://www.brandsvietnam.com/upload/news/200px/2018/16644_Shopper.jpg', 'Trải nghiệm khách hàng', '16644-Trai-nghiem-khach-hang', 'https://www.brandsvietnam.com/16644-Trai-nghiem-khach-hang', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(438, 'https://www.brandsvietnam.com/upload/news/200px/2018/16643_AmbushMarketing.jpg', 'Tổng quan về Tiếp thị phục kích (Ambush Marketing)', '16643-Tong-quan-ve-Tiep-thi-phuc-kich-Ambush-Marketing', 'https://www.brandsvietnam.com/16643-Tong-quan-ve-Tiep-thi-phuc-kich-Ambush-Marketing', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(439, 'https://www.brandsvietnam.com/upload/news/200px/2018/16587_SteveJobs.jpg', '12 bài học từ Steve Jobs dành cho doanh nhân khởi nghiệp', '16587-12-bai-hoc-tu-Steve-Jobs-danh-cho-doanh-nhan-khoi-nghiep', 'https://www.brandsvietnam.com/16587-12-bai-hoc-tu-Steve-Jobs-danh-cho-doanh-nhan-khoi-nghiep', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(440, 'https://www.brandsvietnam.com/upload/news/200px/2018/16616_YoungMarketers7.jpg', 'Công bố danh sách 18 thành viên Ban giám khảo và Giảng viên Young Marketers 7', '16616-Cong-bo-danh-sach-18-thanh-vien-Ban-giam-khao-va-Giang-vien-Young-Marketers-7', 'https://www.brandsvietnam.com/16616-Cong-bo-danh-sach-18-thanh-vien-Ban-giam-khao-va-Giang-vien-Young-Marketers-7', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(441, 'https://www.brandsvietnam.com/upload/news/200px/2018/16615_RichardBranson.JPG', 'Tư duy linh hoạt - bài học từ các CEO thành công', '16615-Tu-duy-linh-hoat-bai-hoc-tu-cac-CEO-thanh-cong', 'https://www.brandsvietnam.com/16615-Tu-duy-linh-hoat-bai-hoc-tu-cac-CEO-thanh-cong', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(442, 'https://www.brandsvietnam.com/upload/news/200px/2018/16514_JeffBezos.jpg', 'Thúc đẩy sáng tạo theo cách của Jeff Bezos', '16514-Thuc-day-sang-tao-theo-cach-cua-Jeff-Bezos', 'https://www.brandsvietnam.com/16514-Thuc-day-sang-tao-theo-cach-cua-Jeff-Bezos', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(443, 'https://www.brandsvietnam.com/upload/news/200px/2018/16582_Combo.jpg', 'Nghệ thuật bán hàng theo gói', '16582-Nghe-thuat-ban-hang-theo-goi', 'https://www.brandsvietnam.com/16582-Nghe-thuat-ban-hang-theo-goi', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(444, 'https://www.brandsvietnam.com/upload/news/200px/2018/16573_TadashiYanai.jpg', '7 \"nguyên tắc vàng\" trong kinh doanh của tỷ phú Tadashi Yanai', '16573-7-nguyen-tac-vang-trong-kinh-doanh-cua-ty-phu-Tadashi-Yanai', 'https://www.brandsvietnam.com/16573-7-nguyen-tac-vang-trong-kinh-doanh-cua-ty-phu-Tadashi-Yanai', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(445, 'https://www.brandsvietnam.com/upload/news/200px/2018/16542_BillGatesWarrenBuffett.jpg', '4 điều Bill Gates học được từ Warren Buffett suốt 25 năm', '16542-4-dieu-Bill-Gates-hoc-duoc-tu-Warren-Buffett-suot-25-nam', 'https://www.brandsvietnam.com/16542-4-dieu-Bill-Gates-hoc-duoc-tu-Warren-Buffett-suot-25-nam', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(446, 'https://www.brandsvietnam.com/upload/news/200px/2018/16558_YoungMarketers.png', 'Công bố thể lệ cuộc thi Young Marketers 7', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/16558-Cong-bo-the-le-cuoc-thi-Young-Marketers-7', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(447, 'https://www.brandsvietnam.com/upload/news/200px/2018/16543_KitKat.jpg', 'Bài học xây dựng thương hiệu từ KitKat Nhật Bản', '16543-Bai-hoc-xay-dung-thuong-hieu-tu-KitKat-Nhat-Ban', 'https://www.brandsvietnam.com/16543-Bai-hoc-xay-dung-thuong-hieu-tu-KitKat-Nhat-Ban', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(448, 'https://www.brandsvietnam.com/upload/news/200px/2019/19261_7.jpg', 'Vì sao startup đình đám Uber và WeWork đốt hàng chục tỷ USD?', '19261-Vi-sao-startup-dinh-dam-Uber-va-WeWork-dot-hang-chuc-ty-USD', 'https://www.brandsvietnam.com/19261-Vi-sao-startup-dinh-dam-Uber-va-WeWork-dot-hang-chuc-ty-USD', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(449, 'https://www.brandsvietnam.com/upload/news/200px/2019/19264_10.jpg', 'Hơn 70% thị phần trong tay Grab, cơ hội nào cho Go-Viet và Be?', '19264-Hon-70-thi-phan-trong-tay-Grab-co-hoi-nao-cho-GoViet-va-Be', 'https://www.brandsvietnam.com/19264-Hon-70-thi-phan-trong-tay-Grab-co-hoi-nao-cho-GoViet-va-Be', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(450, 'https://www.brandsvietnam.com/upload/news/200px/2019/19258_13.png', 'Vì sao Netflix từ chối đề nghị mua lại của ông chủ Amazon 20 năm trước?', '19258-Vi-sao-Netflix-tu-choi-de-nghi-mua-lai-cua-ong-chu-Amazon-20-nam-truoc', 'https://www.brandsvietnam.com/19258-Vi-sao-Netflix-tu-choi-de-nghi-mua-lai-cua-ong-chu-Amazon-20-nam-truoc', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(451, 'https://www.brandsvietnam.com/upload/news/200px/2019/19246_8.jpg', 'Bán lẻ: Trải nghiệm khách hàng là chìa khóa', '19246-Ban-le-Trai-nghiem-khach-hang-la-chia-khoa', 'https://www.brandsvietnam.com/19246-Ban-le-Trai-nghiem-khach-hang-la-chia-khoa', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(452, 'https://www.brandsvietnam.com/upload/news/200px/2019/19235_3.jpg', 'Phát triển startup tỉ đô la từ nền tảng thương mại điện tử', '19235-Phat-trien-startup-ti-do-la-tu-nen-tang-thuong-mai-dien-tu', 'https://www.brandsvietnam.com/19235-Phat-trien-startup-ti-do-la-tu-nen-tang-thuong-mai-dien-tu', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(453, 'https://www.brandsvietnam.com/upload/news/200px/2019/19214_23.jpg', 'Triết lý “quản trị bằng yêu thương” của ông chủ Thế Giới Di Động Nguyễn Đức Tài', '19214-Triet-ly-quan-tri-bang-yeu-thuong-cua-ong-chu-The-Gioi-Di-Dong-Nguyen-Duc-Tai', 'https://www.brandsvietnam.com/19214-Triet-ly-quan-tri-bang-yeu-thuong-cua-ong-chu-The-Gioi-Di-Dong-Nguyen-Duc-Tai', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(454, 'https://www.brandsvietnam.com/upload/news/200px/2019/19227_13.jpg', 'Chuyên gia “hiến kế” cho ngành ô tô Việt', '19227-Chuyen-gia-hien-ke-cho-nganh-o-to-Viet', 'https://www.brandsvietnam.com/19227-Chuyen-gia-hien-ke-cho-nganh-o-to-Viet', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(455, 'https://www.brandsvietnam.com/upload/news/200px/2019/19238_12.jpg', 'Quản lý thương mại điện tử xuyên biên giới: Hãy học kinh nghiệm từ quốc tế', '19238-Quan-ly-thuong-mai-dien-tu-xuyen-bien-gioi-Hay-hoc-kinh-nghiem-tu-quoc-te', 'https://www.brandsvietnam.com/19238-Quan-ly-thuong-mai-dien-tu-xuyen-bien-gioi-Hay-hoc-kinh-nghiem-tu-quoc-te', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(456, 'https://www.brandsvietnam.com/upload/news/200px/2019/19236_15.jpg', 'Để thương mại điện tử Việt trở nên hấp dẫn với \"người khổng lồ\"', '19236-De-thuong-mai-dien-tu-Viet-tro-nen-hap-dan-voi-nguoi-khong-lo', 'https://www.brandsvietnam.com/19236-De-thuong-mai-dien-tu-Viet-tro-nen-hap-dan-voi-nguoi-khong-lo', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(457, 'https://www.brandsvietnam.com/upload/news/200px/2019/19226_14.jpg', 'Federer gây dựng khối tài sản nửa tỷ USD thế nào?', '19226-Federer-gay-dung-khoi-tai-san-nua-ty-USD-the-nao', 'https://www.brandsvietnam.com/19226-Federer-gay-dung-khoi-tai-san-nua-ty-USD-the-nao', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(458, 'https://www.brandsvietnam.com/upload/news/200px/2019/19215_20.jpg', 'Tỷ phú Phạm Nhật Vượng chấp nhận khó khăn, dồn lực cho “đứa con” Vinfast', '19215-Ty-phu-Pham-Nhat-Vuong-chap-nhan-kho-khan-don-luc-cho-dua-con-Vinfast', 'https://www.brandsvietnam.com/19215-Ty-phu-Pham-Nhat-Vuong-chap-nhan-kho-khan-don-luc-cho-dua-con-Vinfast', ' div.reading-content', '2019-10-02 08:55:41', '2019-10-02 08:55:41', 1),
(459, 'https://www.brandsvietnam.com/upload/news/200px/2019/19220_90.jpeg', 'Facebook, Google, Amazon... đã chứng minh cho cả thế giới thấy dầu mỏ không còn là tài nguyên số 1', '19220-Facebook-Google-Amazon-da-chung-minh-cho-ca-the-gioi-thay-dau-mo-khong-con-la-tai-nguyen-so-1', 'https://www.brandsvietnam.com/19220-Facebook-Google-Amazon-da-chung-minh-cho-ca-the-gioi-thay-dau-mo-khong-con-la-tai-nguyen-so-1', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(460, 'https://www.brandsvietnam.com/upload/news/200px/2019/19219_15.png', 'Giải mã câu chuyện thành công của Starbucks, Slack, Pinterest', '19219-Giai-ma-cau-chuyen-thanh-cong-cua-Starbucks-Slack-Pinterest', 'https://www.brandsvietnam.com/19219-Giai-ma-cau-chuyen-thanh-cong-cua-Starbucks-Slack-Pinterest', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(461, 'https://www.brandsvietnam.com/upload/news/200px/2019/19143_8.jpg', '\"Tinh thần khởi nghiệp ở Việt Nam luôn mạnh mẽ và đầy cảm hứng”', '19143-Tinh-than-khoi-nghiep-o-Viet-Nam-luon-manh-me-va-day-cam-hung', 'https://www.brandsvietnam.com/19143-Tinh-than-khoi-nghiep-o-Viet-Nam-luon-manh-me-va-day-cam-hung', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(462, 'https://www.brandsvietnam.com/upload/news/200px/2019/19139_2.jpg', 'Startup triệu \"đô\" của Shark Tank tham vọng thành công ty công nghệ hàng đầu về F&B', '19139-Startup-trieu-do-cua-Shark-Tank-tham-vong-thanh-cong-ty-cong-nghe-hang-dau-ve-FB', 'https://www.brandsvietnam.com/19139-Startup-trieu-do-cua-Shark-Tank-tham-vong-thanh-cong-ty-cong-nghe-hang-dau-ve-FB', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(463, 'https://www.brandsvietnam.com/upload/news/200px/2019/Ava_1_1568735734.jpg', 'Đề xuất quảng cáo rượu, bia phải có cảnh báo tác hại', '19199-De-xuat-quang-cao-ruou-bia-phai-co-canh-bao-tac-hai', 'https://www.brandsvietnam.com/19199-De-xuat-quang-cao-ruou-bia-phai-co-canh-bao-tac-hai', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(464, 'https://www.brandsvietnam.com/upload/news/200px/2019/19144_9.jpg', 'Kinh tế chia sẻ, phép thử đối với tư duy quản lý', '19144-Kinh-te-chia-se-phep-thu-doi-voi-tu-duy-quan-ly', 'https://www.brandsvietnam.com/19144-Kinh-te-chia-se-phep-thu-doi-voi-tu-duy-quan-ly', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(465, 'https://www.brandsvietnam.com/upload/news/200px/2019/19180_10.jpg', 'Ra sức thâu tóm, cuộc đua chiếm lĩnh thị phần bán lẻ sắp có hồi kết?', '19180-Ra-suc-thau-tom-cuoc-dua-chiem-linh-thi-phan-ban-le-sap-co-hoi-ket', 'https://www.brandsvietnam.com/19180-Ra-suc-thau-tom-cuoc-dua-chiem-linh-thi-phan-ban-le-sap-co-hoi-ket', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(466, 'https://www.brandsvietnam.com/upload/news/200px/2019/19182_5.jpeg', 'Quyền năng ABCD', '19182-Quyen-nang-ABCD', 'https://www.brandsvietnam.com/19182-Quyen-nang-ABCD', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(467, 'https://www.brandsvietnam.com/upload/news/200px/2019/19154_13.JPG', 'Tổng giám đốc Canon Marketing Việt Nam: \"Canon nổi tiếng về máy ảnh nhưng cũng đứng đầu về giải pháp doanh nghiệp\"', '19154-Tong-giam-doc-Canon-Marketing-Viet-Nam-Canon-noi-tieng-ve-may-anh-nhung-cung-dung-dau-ve-giai-phap-doanh-nghiep', 'https://www.brandsvietnam.com/19154-Tong-giam-doc-Canon-Marketing-Viet-Nam-Canon-noi-tieng-ve-may-anh-nhung-cung-dung-dau-ve-giai-phap-doanh-nghiep', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(468, 'https://www.brandsvietnam.com/upload/news/200px/2019/19181_3.jpg', '\"Chết yểu\" quy hoạch ngành công nghiệp ô tô', '19181-Chet-yeu-quy-hoach-nganh-cong-nghiep-o-to', 'https://www.brandsvietnam.com/19181-Chet-yeu-quy-hoach-nganh-cong-nghiep-o-to', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(469, 'https://www.brandsvietnam.com/upload/news/200px/2019/19183_10.png', 'Vì sao Facebook, Instagram và YouTube muốn bỏ các chỉ số tương tác?', '19183-Vi-sao-Facebook-Instagram-va-YouTube-muon-bo-cac-chi-so-tuong-tac', 'https://www.brandsvietnam.com/19183-Vi-sao-Facebook-Instagram-va-YouTube-muon-bo-cac-chi-so-tuong-tac', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(470, 'https://www.brandsvietnam.com/upload/news/200px/2019/19175_6.jpg', 'Đế chế Alibaba ra sao sau khi Jack Ma nghỉ hưu?', '19175-De-che-Alibaba-ra-sao-sau-khi-Jack-Ma-nghi-huu', 'https://www.brandsvietnam.com/19175-De-che-Alibaba-ra-sao-sau-khi-Jack-Ma-nghi-huu', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(471, 'https://www.brandsvietnam.com/upload/news/200px/2019/19148_21.jpg', 'Nữ tướng YellowBlocks', '19148-Nu-tuong-YellowBlocks', 'https://www.brandsvietnam.com/19148-Nu-tuong-YellowBlocks', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(472, 'https://www.brandsvietnam.com/upload/news/200px/2019/19108_10.jpg', 'WSJ: Việt Nam sẽ cần thêm nhiều năm nữa để trở thành công xưởng của thế giới', '19108-WSJ-Viet-Nam-se-can-them-nhieu-nam-nua-de-tro-thanh-cong-xuong-cua-the-gioi', 'https://www.brandsvietnam.com/19108-WSJ-Viet-Nam-se-can-them-nhieu-nam-nua-de-tro-thanh-cong-xuong-cua-the-gioi', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(473, 'https://www.brandsvietnam.com/upload/news/200px/2019/19142_5.jpeg', 'Jack Ma và Elon Musk \"khẩu chiến\" về trí tuệ nhân tạo, khai phá sao Hỏa', '19142-Jack-Ma-va-Elon-Musk-khau-chien-ve-tri-tue-nhan-tao-khai-pha-sao-Hoa', 'https://www.brandsvietnam.com/19142-Jack-Ma-va-Elon-Musk-khau-chien-ve-tri-tue-nhan-tao-khai-pha-sao-Hoa', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(474, 'https://www.brandsvietnam.com/upload/news/200px/2019/19090_11.jpg', 'Ý tưởng “khởi nghiệp toàn cầu” để thúc đẩy kinh tế số', '19090-Y-tuong-khoi-nghiep-toan-cau-de-thuc-day-kinh-te-so', 'https://www.brandsvietnam.com/19090-Y-tuong-khoi-nghiep-toan-cau-de-thuc-day-kinh-te-so', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(475, 'https://www.brandsvietnam.com/upload/news/200px/2019/19100_8.jpg', 'CEO Tập đoàn CMC: Kế hoạch Digital Hub', '19100-CEO-Tap-doan-CMC-Ke-hoach-Digital-Hub', 'https://www.brandsvietnam.com/19100-CEO-Tap-doan-CMC-Ke-hoach-Digital-Hub', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(476, 'https://www.brandsvietnam.com/upload/news/200px/2019/19082_3.jpg', '\"Chúng tôi sẽ công bố nhà đầu tư mạng xã hội Lotus nhưng không phải lúc này\"', '19082-Chung-toi-se-cong-bo-nha-dau-tu-mang-xa-hoi-Lotus-nhung-khong-phai-luc-nay', 'https://www.brandsvietnam.com/19082-Chung-toi-se-cong-bo-nha-dau-tu-mang-xa-hoi-Lotus-nhung-khong-phai-luc-nay', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(477, 'https://www.brandsvietnam.com/upload/news/200px/2019/19081_Fintech.jpg', 'Vì sao hạn chế đầu tư nước ngoài vào Fintech tại Việt Nam?', '19081-Vi-sao-han-che-dau-tu-nuoc-ngoai-vao-Fintech-tai-Viet-Nam', 'https://www.brandsvietnam.com/19081-Vi-sao-han-che-dau-tu-nuoc-ngoai-vao-Fintech-tai-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(478, 'https://www.brandsvietnam.com/upload/news/200px/2019/19114_19114_Ava_1.jpg', 'Bối rối quanh cam kết không làm việc cho đối thủ', '19114-Boi-roi-quanh-cam-ket-khong-lam-viec-cho-doi-thu', 'https://www.brandsvietnam.com/19114-Boi-roi-quanh-cam-ket-khong-lam-viec-cho-doi-thu', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(479, 'https://www.brandsvietnam.com/upload/news/200px/2019/19107_2.jpeg', '3 lời khuyên cho các nữ doanh nhân từ CEO startup tỷ đô Canva', '19107-3-loi-khuyen-cho-cac-nu-doanh-nhan-tu-CEO-startup-ty-do-Canva', 'https://www.brandsvietnam.com/19107-3-loi-khuyen-cho-cac-nu-doanh-nhan-tu-CEO-startup-ty-do-Canva', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(480, 'https://www.brandsvietnam.com/upload/news/200px/2019/19098_11.png', 'Chống hàng giả trong thương mại điện tử', '19098-Chong-hang-gia-trong-thuong-mai-dien-tu', 'https://www.brandsvietnam.com/19098-Chong-hang-gia-trong-thuong-mai-dien-tu', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(481, 'https://www.brandsvietnam.com/upload/news/200px/2019/19083_7.jpg', 'Đề án thúc đẩy mô hình kinh tế chia sẻ: Một chuyển biến trong hành động của Chính phủ', '19083-De-an-thuc-day-mo-hinh-kinh-te-chia-se-Mot-chuyen-bien-trong-hanh-dong-cua-Chinh-phu', 'https://www.brandsvietnam.com/19083-De-an-thuc-day-mo-hinh-kinh-te-chia-se-Mot-chuyen-bien-trong-hanh-dong-cua-Chinh-phu', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(482, 'https://www.brandsvietnam.com/upload/news/200px/2019/19075_19075_Ava_1.jpg', 'Shark Phú và tham vọng làm chủ công nghệ gốc ở Sunhouse', '19075-Shark-Phu-va-tham-vong-lam-chu-cong-nghe-goc-o-Sunhouse', 'https://www.brandsvietnam.com/19075-Shark-Phu-va-tham-vong-lam-chu-cong-nghe-goc-o-Sunhouse', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(483, 'https://www.brandsvietnam.com/upload/news/200px/2019/19079_2.jpg', 'Nhà sáng lập Huawei cảnh báo nhân viên về “thời khắc sống còn” của công ty', '19079-Nha-sang-lap-Huawei-canh-bao-nhan-vien-ve-thoi-khac-song-con-cua-cong-ty', 'https://www.brandsvietnam.com/19079-Nha-sang-lap-Huawei-canh-bao-nhan-vien-ve-thoi-khac-song-con-cua-cong-ty', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(484, 'https://www.brandsvietnam.com/upload/news/200px/2019/19103_10.jpg', 'CEO MoMo: MoMo sẽ là công cụ tài chính cho mọi người Việt, \"đo ni đóng giày\" cho người Việt', '19103-CEO-MoMo-MoMo-se-la-cong-cu-tai-chinh-cho-moi-nguoi-Viet-do-ni-dong-giay-cho-nguoi-Viet', 'https://www.brandsvietnam.com/19103-CEO-MoMo-MoMo-se-la-cong-cu-tai-chinh-cho-moi-nguoi-Viet-do-ni-dong-giay-cho-nguoi-Viet', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(485, 'https://www.brandsvietnam.com/upload/news/200px/2019/19106_4.jpg', 'Đằng sau tình bạn kéo dài hàng thập kỷ giữa Jeff Bezos và Jame Dimon', '19106-Dang-sau-tinh-ban-keo-dai-hang-thap-ky-giua-Jeff-Bezos-va-Jame-Dimon', 'https://www.brandsvietnam.com/19106-Dang-sau-tinh-ban-keo-dai-hang-thap-ky-giua-Jeff-Bezos-va-Jame-Dimon', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(486, 'https://www.brandsvietnam.com/upload/news/200px/2019/19092_10.jpg', 'Thu hút khách du lịch quốc tế đến Việt Nam bằng cách nào?', '19092-Thu-hut-khach-du-lich-quoc-te-den-Viet-Nam-bang-cach-nao', 'https://www.brandsvietnam.com/19092-Thu-hut-khach-du-lich-quoc-te-den-Viet-Nam-bang-cach-nao', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(487, 'https://www.brandsvietnam.com/upload/news/200px/2019/19074_3.jpg', 'CEO Soya Garden: Tiêu tiền của nhà đầu tư khó gấp 10 - 20 lần việc tiêu tiền của chính mình!', '19074-CEO-Soya-Garden-Tieu-tien-cua-nha-dau-tu-kho-gap-10-20-lan-viec-tieu-tien-cua-chinh-minh', 'https://www.brandsvietnam.com/19074-CEO-Soya-Garden-Tieu-tien-cua-nha-dau-tu-kho-gap-10-20-lan-viec-tieu-tien-cua-chinh-minh', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(488, 'https://www.brandsvietnam.com/upload/news/200px/2019/19061_10.jpg', 'Nhà đầu tư Nhật tìm kiếm gì từ các thương vụ M&A tại Việt Nam?', '19061-Nha-dau-tu-Nhat-tim-kiem-gi-tu-cac-thuong-vu-MA-tai-Viet-Nam', 'https://www.brandsvietnam.com/19061-Nha-dau-tu-Nhat-tim-kiem-gi-tu-cac-thuong-vu-MA-tai-Viet-Nam', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(489, 'https://www.brandsvietnam.com/upload/news/200px/2019/19055_19055_Ava_1.jpg', 'Ai hiểu khách hàng nhanh hơn, người ấy thắng', '19055-Ai-hieu-khach-hang-nhanh-hon-nguoi-ay-thang', 'https://www.brandsvietnam.com/19055-Ai-hieu-khach-hang-nhanh-hon-nguoi-ay-thang', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(490, 'https://www.brandsvietnam.com/upload/news/200px/2019/19049_6.jpg', 'Xu hướng phát triển chủ chốt của y tế, năng lượng và hàng không là gì?', '19049-Xu-huong-phat-trien-chu-chot-cua-y-te-nang-luong-va-hang-khong-la-gi', 'https://www.brandsvietnam.com/19049-Xu-huong-phat-trien-chu-chot-cua-y-te-nang-luong-va-hang-khong-la-gi', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(491, 'https://www.brandsvietnam.com/upload/news/200px/2019/19047_1007.jpg', 'Vì sao hàng hóa có tỷ lệ nội địa 30% sẽ được ghi \'made in Vietnam\'?', '19047-Vi-sao-hang-hoa-co-ty-le-noi-dia-30-se-duoc-ghi-made-in-Vietnam', 'https://www.brandsvietnam.com/19047-Vi-sao-hang-hoa-co-ty-le-noi-dia-30-se-duoc-ghi-made-in-Vietnam', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(492, 'https://www.brandsvietnam.com/upload/news/200px/2019/19015_4.jpeg', 'Những nông trại “cày view” bằng điện thoại, kiếm tiền từ giá trị ảo', '19015-Nhung-nong-trai-cay-view-bang-dien-thoai-kiem-tien-tu-gia-tri-ao', 'https://www.brandsvietnam.com/19015-Nhung-nong-trai-cay-view-bang-dien-thoai-kiem-tien-tu-gia-tri-ao', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(493, 'https://www.brandsvietnam.com/upload/news/200px/2019/19005_101.jpg', 'Xây dựng chính phủ điện tử cần bắt đầu từ “lấy dân làm gốc”', '19005-Xay-dung-chinh-phu-dien-tu-can-bat-dau-tu-lay-dan-lam-goc', 'https://www.brandsvietnam.com/19005-Xay-dung-chinh-phu-dien-tu-can-bat-dau-tu-lay-dan-lam-goc', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(494, 'https://www.brandsvietnam.com/upload/news/200px/2019/19014_cooktim02242017getty.jpg', 'Apple đang chi nhiều tiền cho “học thuyết Tim Cook”', '19014-Apple-dang-chi-nhieu-tien-cho-hoc-thuyet-Tim-Cook', 'https://www.brandsvietnam.com/19014-Apple-dang-chi-nhieu-tien-cho-hoc-thuyet-Tim-Cook', ' div.reading-content', '2019-10-02 08:55:42', '2019-10-02 08:55:42', 1),
(495, 'https://www.brandsvietnam.com/upload/news/200px/2019/19010_10.jpg', 'Vì đâu Fintech hút vốn ngoại?', '19010-Vi-dau-Fintech-hut-von-ngoai', 'https://www.brandsvietnam.com/19010-Vi-dau-Fintech-hut-von-ngoai', ' div.reading-content', '2019-10-02 08:55:43', '2019-10-02 08:55:43', 1),
(496, 'https://www.brandsvietnam.com/upload/news/200px/2019/19006_1.jpg', 'Ông Trần Hải Linh - Tổng giám đốc Sendo: Chúng tôi luôn tìm cách tạo giá trị cho xã hội', '19006-Ong-Tran-Hai-Linh-Tong-giam-doc-Sendo-Chung-toi-luon-tim-cach-tao-gia-tri-cho-xa-hoi', 'https://www.brandsvietnam.com/19006-Ong-Tran-Hai-Linh-Tong-giam-doc-Sendo-Chung-toi-luon-tim-cach-tao-gia-tri-cho-xa-hoi', ' div.reading-content', '2019-10-02 08:55:43', '2019-10-02 08:55:43', 1),
(497, 'https://www.brandsvietnam.com/upload/news/200px/2019/18999_vnf-ngan-hang-quoc-doanh.jpg', 'Ngân hàng big 4 khát  vốn ngoại', '18999-Ngan-hang-big-4-khat-von-ngoai', 'https://www.brandsvietnam.com/18999-Ngan-hang-big-4-khat-von-ngoai', ' div.reading-content', '2019-10-02 08:55:43', '2019-10-02 08:55:43', 1),
(498, 'https://www.brandsvietnam.com/upload/news/200px/2019/18982_18982_Ava_1.jpg', 'Warren Buffett: Đừng bao giờ nghe lời chuyên gia khi đầu tư', '18982-Warren-Buffett-Dung-bao-gio-nghe-loi-chuyen-gia-khi-dau-tu', 'https://www.brandsvietnam.com/18982-Warren-Buffett-Dung-bao-gio-nghe-loi-chuyen-gia-khi-dau-tu', ' div.reading-content', '2019-10-02 08:55:43', '2019-10-02 08:55:43', 1),
(499, 'https://www.brandsvietnam.com/upload/news/200px/2019/paper-drinking-straws_1564973162.jpg', 'Ống hút nhựa: Thay thế hay tái chế?', '18972-Ong-hut-nhua-Thay-the-hay-tai-che', 'https://www.brandsvietnam.com/18972-Ong-hut-nhua-Thay-the-hay-tai-che', ' div.reading-content', '2019-10-02 08:55:43', '2019-10-02 08:55:43', 1),
(500, 'https://www.brandsvietnam.com/upload/news/200px/2019/18968_1011.jpg', 'Mạng xã hội mới tại Việt Nam liệu có “chết yểu” trước Facebook, Zalo?', '18968-Mang-xa-hoi-moi-tai-Viet-Nam-lieu-co-chet-yeu-truoc-Facebook-Zalo', 'https://www.brandsvietnam.com/18968-Mang-xa-hoi-moi-tai-Viet-Nam-lieu-co-chet-yeu-truoc-Facebook-Zalo', ' div.reading-content', '2019-10-02 08:55:43', '2019-10-02 08:55:43', 1),
(501, 'https://www.brandsvietnam.com/upload/news/200px/2019/18948_178a0112_281436476.jpg', 'Thách đấu Facebook: Không thể & có thể', '18948-Thach-dau-Facebook-Khong-the-co-the', 'https://www.brandsvietnam.com/18948-Thach-dau-Facebook-Khong-the-co-the', ' div.reading-content', '2019-10-02 08:55:43', '2019-10-02 08:55:43', 1),
(502, 'https://www.brandsvietnam.com/upload/news/200px/2019/18934_13.jpg', 'CEO Tiki: Tôi tin trong vòng 5 năm tới, Việt Nam sẽ là đất nước của những kỳ lân!', '18934-CEO-Tiki-Toi-tin-trong-vong-5-nam-toi-Viet-Nam-se-la-dat-nuoc-cua-nhung-ky-lan', 'https://www.brandsvietnam.com/18934-CEO-Tiki-Toi-tin-trong-vong-5-nam-toi-Viet-Nam-se-la-dat-nuoc-cua-nhung-ky-lan', ' div.reading-content', '2019-10-02 08:55:43', '2019-10-02 08:55:43', 1),
(503, 'https://www.brandsvietnam.com/upload/news/200px/2019/18933_3.jpg', 'Khởi nghiệp nên dùng tiền của bản thân hay của người khác?', '18933-Khoi-nghiep-nen-dung-tien-cua-ban-than-hay-cua-nguoi-khac', 'https://www.brandsvietnam.com/18933-Khoi-nghiep-nen-dung-tien-cua-ban-than-hay-cua-nguoi-khac', ' div.reading-content', '2019-10-02 08:55:43', '2019-10-02 08:55:43', 1),
(504, 'https://www.brandsvietnam.com/upload/news/200px/2019/18927_1.jpg', 'Zalo không muốn là mạng xã hội?', '18927-Zalo-khong-muon-la-mang-xa-hoi', 'https://www.brandsvietnam.com/18927-Zalo-khong-muon-la-mang-xa-hoi', ' div.reading-content', '2019-10-02 08:55:43', '2019-10-02 08:55:43', 1),
(505, 'https://www.brandsvietnam.com/upload/news/200px/2019/18928_avt1.jpg', '“3 năm nữa, người dân dùng Mobile Money sẽ không cần cầm ví tiền ra ngoài”', '18928-3-nam-nua-nguoi-dan-dung-Mobile-Money-se-khong-can-cam-vi-tien-ra-ngoai', 'https://www.brandsvietnam.com/18928-3-nam-nua-nguoi-dan-dung-Mobile-Money-se-khong-can-cam-vi-tien-ra-ngoai', ' div.reading-content', '2019-10-02 08:55:43', '2019-10-02 08:55:43', 1),
(506, 'https://www.brandsvietnam.com/upload/news/200px/2019/18909_1banle.jpg', 'Savills: ‘Bán lẻ đòi hỏi đầu tư nhiều nhưng thu hồi vốn lại chậm’', '18909-Savills-Ban-le-doi-hoi-dau-tu-nhieu-nhung-thu-hoi-von-lai-cham', 'https://www.brandsvietnam.com/18909-Savills-Ban-le-doi-hoi-dau-tu-nhieu-nhung-thu-hoi-von-lai-cham', ' div.reading-content', '2019-10-02 08:55:43', '2019-10-02 08:55:43', 1),
(507, 'https://www.brandsvietnam.com/upload/news/200px/2019/18910_1avt.jpg', 'Đấu nổi Google?', '18910-Dau-noi-Google', 'https://www.brandsvietnam.com/18910-Dau-noi-Google', ' div.reading-content', '2019-10-02 08:55:43', '2019-10-02 08:55:43', 1);

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
(36, 16, 23, 'Cách có tên miền mình mong muốn', 'cach-co-ten-mien-minh-mong-muon', '<p><strong>Ch&uacute;ng t&ocirc;i đang cần một t&ecirc;n miền cho website của c&ocirc;ng ty m&igrave;nh nhưng kh&ocirc;ng biết&nbsp;l&agrave;m thế n&agrave;o để ch&uacute;ng t&ocirc;i c&oacute; được t&ecirc;n miền m&agrave; m&igrave;nh muốn?</strong></p>\n', 'tên miền,tên miền đẹp', 14, 5, 0, 1, '2019-09-29 17:08:07', '2019-10-08 18:31:48'),
(37, 18, 23, 'Số vốn để kinh doanh bất động sản', 'so-von-de-kinh-doanh-bat-dong-san', '<p>T&ocirc;i đang c&oacute; một v&agrave;i &yacute; định để khởi nghiệp với bất động sản, t&ocirc;i n&ecirc;n d&agrave;nh ra số vốn bao nhi&ecirc;u để khởi nghiệp với bất động sản</p>\n', 'bất động sản,vốn,kinh doanh', 7, 3, 0, 1, '2019-09-29 17:49:14', '2019-10-02 21:00:47'),
(38, 25, 23, 'Tôi muốn khởi sự kinh doanh nhưng không có vốn, tôi phải làm gì đây???', 'toi-muon-khoi-su-kinh-doanh-nhung-khong-co-von-toi-phai-lam-gi-day', '<p>&ldquo;T&ocirc;i đang ch&aacute;n nản với thực tại &ndash; một cuộc sống m&agrave; h&agrave;ng ng&agrave;y cứ 8h s&aacute;ng s&aacute;ch cặp đi l&agrave;m c&ocirc;ng ty đến 5h chiều lại cắp cặp s&aacute;ch về nh&agrave; v&agrave; đợi chờ đến ng&agrave;y trả lương cuối th&aacute;ng trong khi đ&atilde; ti&ecirc;u hết khoản tiền lương của th&aacute;ng trước từ trước đ&oacute; mấy ng&agrave;y rồi. T&ocirc;i đang lo lắng cho những kế hoạch tương lai đầy tham vọng nhưng lại chưa t&igrave;m được hướng đi n&agrave;o khả thi để thực hiện n&oacute;, t&ocirc;i muốn kiếm thật nhiều tiền để được sở hữu những thứ m&igrave;nh th&iacute;ch, l&agrave;m những thứ m&igrave;nh muốn l&agrave;m, được nghỉ tho&aacute;i m&aacute;i khi ốm đau, được đầu tư cho con c&aacute;i học h&agrave;nh, được đi du lịch đ&oacute; đ&acirc;y, được&hellip;l&agrave;m chủ đồng tiền v&agrave; l&agrave;m cuộc sống của m&igrave;nh. Nhưng t&ocirc;i thực sự kh&ocirc;ng c&oacute; vốn t&iacute;ch lũy để bắt đầu khởi nghiệp, những &yacute; tưởng đến rồi lại đi, những kế hoạch lập rồi lại bỏ. T&ocirc;i thấy rằng cứ tiếp tục thế n&agrave;y l&agrave; kh&ocirc;ng ổn nhưng T&ocirc;i phải bắt đầu từ đ&acirc;u đ&acirc;y???&rdquo;</p>\n', 'khởi nghiệp,kinh doanh', 7, 4, 0, 1, '2019-09-29 17:56:28', '2019-10-05 07:34:09'),
(39, 25, 24, 'Làm thế nào để các nhà đầu tư mạo hiểm chú ý đến tôi ? ', 'lam-the-nao-de-cac-nha-dau-tu-mao-hiem-chu-y-den-toi-', '<p>L&agrave;m c&aacute;ch n&agrave;o để t&ocirc;i c&oacute; thể thu h&uacute;t c&aacute;c nh&agrave; đầu tư mạo hiểm khi m&agrave; c&aacute;c nh&agrave; đầu tư thường đặt sự an to&agrave;n l&ecirc;n tr&ecirc;n hết. V&agrave; t&ocirc;i c&oacute; thể t&igrave;m c&aacute;c nh&agrave; đầu tư mạo hiểm ở đ&acirc;u. M&ocirc; h&igrave;nh kinh doanh của ch&uacute;ng t&ocirc;i c&oacute; tăng trưởng ng&agrave;y c&agrave;ng lớn v&agrave; c&oacute; nhiều sức h&uacute;t tới thị trường. t&ocirc;i xin cảm ơn !</p>\n', 'đầu tư,mạo hiểm,chú ý', 2, 2, 0, 1, '2019-10-01 15:44:41', '2019-10-02 19:13:13'),
(40, 22, 24, 'Đặt tên doanh nghiệp và thiết kế logo cho doanh nghiệp', 'dat-ten-doanh-nghiep-va-thiet-ke-logo-cho-doanh-nghiep', '<p>C&ocirc;ng ty của ch&uacute;ng t&ocirc;i l&agrave; một c&ocirc;ng ty chuy&ecirc;n về thiết kế v&agrave; ph&acirc;n phối thời trang.C&ocirc;ng ty của t&ocirc;i đ&atilde; gi&agrave;nh rất nhiều thời gian v&agrave; tiền bạc để c&oacute; một c&aacute;i t&ecirc;n v&agrave; biểu tượng hay. Theo t&ocirc;i một c&aacute;i t&ecirc;n c&ocirc;ng ty phải g&acirc;y ấn tượng . Mọi người c&oacute; thể tư vấn gi&uacute;p t&ocirc;i để c&ocirc;ng ty t&ocirc;i c&oacute; được một c&aacute;i t&ecirc;n v&agrave; logo tốt nhất.</p>\n', 'logo ,đặt tên doanh nghiệp', 4, 3, 0, 1, '2019-10-01 15:50:55', '2019-10-07 20:44:39'),
(41, 21, 24, 'Các nguồn vốn của doanh nghiệp ', 'cac-nguon-von-cua-doanh-nghiep', '<p>M&igrave;nh muốn hỏi về c&aacute;c nguồn vốn của doanh nghiệp trong nền kinh tế thị trường v&agrave; c&aacute;c nh&acirc;n tố tới việc huy động vốn của doanh nghiệp.</p>\n', 'vốn,doanh nghiệp', 2, 1, 0, 1, '2019-10-01 15:54:26', '2019-10-08 20:01:06'),
(42, 21, 23, 'Thủ tục mở nhà hàng kinh doanh dịch vụ ăn uống', 'thu-tuc-mo-nha-hang-kinh-doanh-dich-vu-an-uong', '<p>T&ocirc;i muốn mở một nh&agrave; h&agrave;ng kinh doanh dịch vụ ăn uống th&igrave; cần phải c&oacute; c&aacute;c thủ tục cần thiết n&agrave;o để xin giấy ph&eacute;p kinh doanh?</p>\n', 'nhà hàng,thủ tục,kinh doanh', 3, 3, 0, 1, '2019-10-01 15:56:05', '2019-10-03 23:21:53'),
(43, 25, 24, 'Start up là gì', 'start-up-la-gi', '<p>Hiện nay t&ocirc;i nghe n&oacute;i rất nhiều kh&aacute;i niệm về start up nhưng t&ocirc;i thực sự rất mơ hồ về kh&aacute;i niệm n&agrave;y mong được sự g&oacute;p &yacute; của mọi người&nbsp;</p>\n', 'start up', 1, 0, 0, 1, '2019-10-01 15:58:03', '2019-10-02 07:11:29'),
(44, 16, 25, 'Cách tìm một nhà đầu tư nước ngoài', 'cach-tim-mot-nha-dau-tu-nuoc-ngoai', '<p>T&ocirc;i c&oacute; một sản phẩm về c&ocirc;ng nghệ m&agrave; t&ocirc;i cho rằng sẽ đặc biệt hấp dẫn đối với&nbsp;giới trẻ ch&acirc;u &Aacute; ở Nhật Bản, Trung Quốc v&agrave; H&agrave;n Quốc. C&ocirc;ng ty của t&ocirc;i đặt trụ sở tại New York, nhưng t&ocirc;i cảm thấy c&aacute;c nh&agrave; đầu tư của&nbsp;t&ocirc;i&nbsp;kh&ocirc;ng hiểu nhiều về thị trường m&agrave; t&ocirc;i đang hướng tới. Vậy l&agrave;m thế n&agrave;o t&ocirc;i c&oacute; thể t&igrave;m được một nh&agrave; đầu tư được đ&agrave;o tạo tại c&aacute;c thị trường nước ngo&agrave;i?</p>\n', 'đầu tư,nước ngoài', 3, 1, 0, 1, '2019-10-01 16:14:17', '2019-10-08 19:01:53'),
(45, 25, 25, 'Tránh tình trạng các nhà đầu tư kéo dài thời gian xác nhận có đầu tư hay không', 'tranh-tinh-cac-nha-dau-tu-keo-dai-thoi-gian-xac-nhan-co-dau-tu-hay-khong', '<p>Ch&uacute;ng t&ocirc;i đ&atilde; nhận được c&aacute;c c&acirc;u trả lời &ldquo;<strong>Kh&ocirc;ng</strong>&rdquo; chắc như đinh đ&oacute;ng cột từ hầu hết c&aacute;c nh&agrave; đầu tư m&agrave; ch&uacute;ng t&ocirc;i tiếp cận, tuy nhi&ecirc;n c&ograve;n một hai người kh&ocirc;ng trả lời, để ch&uacute;ng t&ocirc;i chờ đợi h&agrave;ng tuần m&agrave; chẳng n&oacute;i kh&ocirc;ng cũng chẳng n&oacute;i c&oacute;, rồi cuối c&ugrave;ng vẫn để ch&uacute;ng t&ocirc;i rớt đ&agrave;i. Đ&acirc;y c&oacute; phải l&agrave; t&igrave;nh trạng chung kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; thể l&agrave;m g&igrave; để tr&aacute;nh t&igrave;nh trạng bị k&eacute;o d&agrave;i thời gian m&agrave; kh&ocirc;ng đầy c&aacute;c nh&agrave; đầu tư đến c&acirc;u trả lời &ldquo;<strong>kh&ocirc;ng</strong>&rdquo;?</p>\n', 'thời gian,xác nhận đầu tư', 2, 1, 0, 1, '2019-10-01 16:19:05', '2019-10-02 20:52:18'),
(46, 2, 25, 'Xác định loại hình kinh doanh ', 'xac-dinh-loai-hinh-kinh-doanh', '<p>T&ocirc;i muốn khởi sự doanh nghiệp của ri&ecirc;ng m&igrave;nh về lĩnh vực n&ocirc;ng nghiệp&nbsp;nhưng kh&ocirc;ng biết n&ecirc;n bắt đầu từ loại kinh doanh n&agrave;o. Mọi người c&oacute; thể gợi &yacute; c&aacute;ch tốt nhất để t&igrave;m một việc kinh doanh ph&ugrave; hợp với lĩnh vực n&agrave;y kh&ocirc;ng?</p>\n', 'loại hình,kinh doanh', 0, 0, 0, 1, '2019-10-01 16:29:13', '2019-10-01 16:29:13'),
(47, 21, 27, 'Đăng kí doanh nghiệp', 'dang-ki-doanh-nghiep', '<p>T&ocirc;i n&ecirc;n đăng k&yacute; doanh nghiệp của t&ocirc;i l&agrave; c&ocirc;ng ty hay hợp doanh? Ưu v&agrave; nhược điểm của hai sự lựa chọn n&agrave;y l&agrave; g&igrave;?</p>\n', 'đăng ký,doanh nghiệp', 1, 1, 0, 1, '2019-10-01 16:35:19', '2019-10-07 19:35:03'),
(48, 23, 27, 'Thị trường cạnh tranh gay gắt', 'thi-truong-canh-tranh-gay-gat', '<p>L&agrave;m thế n&agrave;o t&ocirc;i c&oacute; thể th&agrave;nh c&ocirc;ng tr&ecirc;n thị trường x&acirc;y dựng&nbsp;được khi tất cả mọi người đều b&aacute;m v&agrave;o c&aacute;c hợp đồng, cạnh tranh gay gắt v&agrave; kh&ocirc;ng cho sản phẩm của t&ocirc;i một ch&uacute;t cơ hội n&agrave;o?</p>\n', 'thị trường,cạnh tranh', 1, 0, 0, 1, '2019-10-01 16:38:04', '2019-10-01 21:36:41'),
(49, 25, 27, 'Làm gì để trở thành nhà đầu tư vốn khi là sinh viên', 'lam-gi-de-tro-thanh-nha-dau-tu-von-khi-la-sinh-vien', '<p>T&ocirc;i l&agrave; sinh vi&ecirc;n năm thứ hai đại học. T&ocirc;i muốn biết t&ocirc;i cần phải học g&igrave; để trở th&agrave;nh một nh&agrave; đầu tư vốn. Người ta c&oacute; cần c&aacute;i gọi l&agrave; &ldquo;sinh ra trong gi&agrave;u c&oacute;&rdquo; để th&agrave;nh c&ocirc;ng trong nghề nghiệp n&agrave;y kh&ocirc;ng</p>\n', 'sinh viên,đầu tư vốn ', 2, 1, 0, 1, '2019-10-01 16:41:36', '2019-10-07 17:57:27'),
(50, 16, 27, 'Cách thu hút vốn tài trợ ', 'cach-thu-hut-von-tai-tro', '<p>Hiện nay t&ocirc;i đang l&agrave;m việc với tư c&aacute;ch l&agrave; kế to&aacute;n trưởng của một nh&agrave; ph&acirc;n phối cỡ trung trong ng&agrave;nh c&ocirc;ng nghệ th&ocirc;ngtin. Tuy nhi&ecirc;n, t&ocirc;i nhận thấy rằng cuộc chơi ng&agrave;y c&agrave;ng chuyển sang hướng dịch vụ, v&agrave; t&ocirc;i muốn khởi sự doanh nghiệp của ri&ecirc;ng m&igrave;nh v&agrave; đi v&agrave;o cửa ng&aacute;ch n&agrave;y. Vậy c&aacute;ch tốt nhất để thu h&uacute;t được vốn t&agrave;i trợ l&agrave; g&igrave; v&agrave; t&ocirc;i n&ecirc;n t&igrave;m tới ai? T&ocirc;i sẽ cần giấy tờ/ kế hoạch/dự &aacute;n g&igrave;? T&ocirc;i c&oacute; thể t&igrave;m nguồn</p>\n', 'công nghệ,thu hút vốn,ngách', 1, 2, 0, 1, '2019-10-01 16:46:15', '2019-10-04 07:52:29'),
(51, 20, 27, 'Hỏi về việc mở rộng kinh doanh cửa hàng cà phê vào thành phố Hồ Chí Minh', 'hoi-ve-viec-mo-rong-kinh-doanh-cua-hang-ca-phe-vao-thanh-pho-ho-chi-minh', '<p>T&ocirc;i đang kinh doanh 3 cửa h&agrave;ng caf&eacute; c&oacute; tiếng tại H&agrave; Nội. T&ocirc;i muốn mở rộng kinh doanh v&agrave;o khu vực TP Hồ Ch&iacute; Minh nhưng kh&ocirc;ng c&oacute; đủ vốn, c&oacute; phương &aacute;n n&agrave;o cho t&ocirc;i kh&ocirc;ng? Thủ tục như thế n&agrave;o? Hợp đồng c&oacute; cần lưu &yacute; g&igrave; kh&ocirc;ng?. Thủ tục nhượng quyền như thế n&agrave;o? Hợp đồng nhượng quyền c&oacute; những nội dung g&igrave;?</p>\n', 'kinh doanh,quán cafe', 0, 0, 0, 1, '2019-10-01 16:56:13', '2019-10-01 16:56:13'),
(52, 20, 28, 'Góp vốn kinh doanh như thế nào ', 'gop-von-kinh-doanh-nhu-the-nao', '<p>Tổ chức x&atilde; hội - nghề nghiệp c&oacute; thuộc đối tượng cấm g&oacute;p vốn kinh doanh kh&ocirc;ng?</p>\n', 'vốn,kinh doanh', 1, 1, 0, 1, '2019-10-01 17:00:21', '2019-10-08 11:53:06'),
(53, 26, 28, 'Sinh viên bắt đầu kinh doanh từ đâu', 'sinh-vien-bat-dau-kinh-doanh-tu-dau', '<p>T&ocirc;i l&agrave; một nh&agrave; kinh doanh nhiều tham vọng. T&ocirc;i mới v&agrave;o năm thứ nhất trường đại học v&agrave; t&ocirc;i c&oacute; một kế hoạch kinh doanh cụ cụ thể. T&ocirc;i rất quan t&acirc;m đến ng&agrave;nh giải tr&iacute;, nhưng lại định khởi sự doanh nghiệp ngo&agrave;i ng&agrave;nh n&agrave;y. T&ocirc;i n&ecirc;n bắt đầu từ đ&acirc;u? T&ocirc;i cần t&igrave;m hiểu vấn đề g&igrave;? T&ocirc;i sẽ nhận được bằng cử nh&acirc;n về quản trị doanh nghiệp. Đ&oacute; c&oacute; phải l&agrave; một bước khởi đầu tốt kh&ocirc;ng?</p>\n', 'sinh viên,kinh doanh,giải trí', 1, 1, 0, 1, '2019-10-01 17:05:33', '2019-10-04 08:38:27'),
(54, 20, 28, 'Nền tìm sản phẩm trước hay tìm thị trường trước', 'nen-tim-san-pham-truoc-hay-tim-thi-truong-truoc', '<p>C&aacute;i g&igrave; c&oacute; trước, sản phẩm hay thị trường? T&ocirc;i n&ecirc;n t&igrave;m một sản phẩm rồi sau đ&oacute; mới t&igrave;m c&aacute;ch b&aacute;n n&oacute;, hay t&ocirc;i n&ecirc;n t&igrave;m một thị trường chưa được khai th&aacute;c v&agrave; rồi t&igrave;m sản phẩm để đưa v&agrave;o đ&oacute;</p>\n', 'thị trường,sản phầm,tìm', 1, 1, 0, 1, '2019-10-01 17:08:26', '2019-10-02 08:33:38'),
(55, 21, 28, 'Thành lập công ty riêng khi chỉ mới 18 tuổi', 'thanh-lap-cong-ty-rieng-khi-chi-moi-18-tuoi', '<p>T&ocirc;i rất muốn th&agrave;nh lập c&ocirc;ng ty ri&ecirc;ng, nhưng giờ t&ocirc;i mới 18 tuổi, t&ocirc;i c&oacute; thể l&agrave;m g&igrave; để c&aacute;c nh&agrave; đầu tư nh&igrave;n nhận m&igrave;nhmột c&aacute;ch nghi&ecirc;m t&uacute;c được?</p>\n', 'thành lập công ty,công ty riêng', 1, 1, 0, 1, '2019-10-01 17:12:04', '2019-10-07 19:35:24'),
(56, 20, 28, 'Bảo vệ ý tưởng kinh doanh', 'bao-ve-y-tuong-kinh-doanh', '<p>T&ocirc;i nghĩ rằng &yacute; tưởng kinh doanh của t&ocirc;i sẽ th&agrave;nh c&ocirc;ng, nhưng t&ocirc;i lo rằng n&oacute; c&oacute; thể bị người kh&aacute;c đ&aacute;nh cắp nếu t&ocirc;i đến gặp nhữngnh&agrave; đầu tư. T&ocirc;i c&oacute; thể bảo vệ &yacute; tưởng kinh doanh của m&igrave;nh tốt nhất bằng c&aacute;ch n&agrave;o?</p>\n', 'ý tưởng ,kinh doanh,bảo vê', 1, 1, 0, 1, '2019-10-01 17:13:37', '2019-10-03 09:07:56'),
(57, 17, 28, 'Tính cách, phẩm chất để trở thành một doanh nghiệp thành công', 'tinh-cach-pham-chat-de-tro-thanh-mot-doanh-nghiep-thanh-cong', '<p>Cần phải c&oacute; những t&iacute;nh c&aacute;ch/phẩm chất n&agrave;o để trở th&agrave;nh một doanh nghiệp th&agrave;nh c&ocirc;ng?</p>\n', 'doanh nghiệp,tính cách', 3, 2, 0, 1, '2019-10-01 17:14:59', '2019-10-08 19:11:34'),
(58, 25, 29, 'Các lĩnh vực có thể lựa chọn để bắt đầu khởi nghiệp', 'cac-linh-vuc-co-the-lua-chon-de-bat-dau-khoi-nghiep', '<p>L&agrave;m c&aacute;ch n&agrave;o để t&ocirc;i c&oacute; thể x&aacute;c định v&agrave; lựa chọn một lĩnh vực, một ng&agrave;nh nghề đ&uacute;ng, ph&ugrave; hợp với bản th&acirc;n m&igrave;nh?</p>\n', 'lĩnh vực,Kinh doanh,khởi nghiệp', 3, 4, 0, 1, '2019-10-01 18:54:39', '2019-10-07 22:09:40'),
(59, 20, 29, 'Tôi có nên thuê ai viết kế hoạch kinh doanh hay không', 'toi-co-nen-thue-ai-viet-ke-hoach-kinh-doanh-hay-khong', '<p>T&ocirc;i&nbsp;đang chuẩn bị k&ecirc;u gọi vốn&nbsp;đầu tư của quỹ Hỗ trợ doanh nghiệp khởi nghiệp. Vậy&nbsp;để cho chuy&ecirc;n nghiệp t&ocirc;i c&oacute; n&ecirc;n thu&ecirc; ai viết kế hoạch kinh doanh hay kh&ocirc;ng ?&nbsp;</p>\n', 'Kinh doanh,khởi nghiệp', 4, 3, 0, 1, '2019-10-01 18:55:45', '2019-10-05 20:21:45'),
(60, 3, 29, 'Khởi nghiệp về y tế cần gì', 'khoi-nghiep-ve-y-te-can-gi', '<p>Theo mọi người để khởi nghiệp th&agrave;nh c&ocirc;ng trong lĩnh vực &yacute; tế cần những yếu tố g&igrave;</p>\n', 'khởi nghiệp,ý tế', 8, 4, 0, 1, '2019-10-01 18:59:48', '2019-10-08 11:47:34'),
(61, 2, 30, 'Bộ nông nghiệp xử phạt phân hữu cơ', 'bo-nong-nghiep-xu-phat-phan-huu-co', '<p>T&ocirc;i c&oacute; thắc mắc xin hỏi.</p>\n\n<p>&nbsp;T&ocirc;i la doanh nghiệp nhập khẩu v&agrave; bu&ocirc;n b&aacute;n ph&acirc;n hữu cơ.</p>\n\n<p>Vừa qua cty c&oacute; nhập khẩu 1 l&ocirc; h&agrave;ng ph&acirc;n hưu cơ th&agrave;nh phẩm để kinh doanh về thủ tục qui định đầy đủ hết v&agrave; kiểm tra nh&agrave; nước đạt y&ecirc;u cầu để lưu th&ocirc;ng tr&ecirc;n thị trường.</p>\n\n<p>trong qu&aacute; tr&igrave;nh&nbsp;lưu th&ocirc;ng tr&ecirc;n thị trường thanh tra sở NN.. lấy mẫu kiểm tra v&agrave; cho kết quả kh&ocirc;ng đạt chất lượng, v&agrave; sở NN .. ra quyết định xử phạt vi phạm h&agrave;nh ch&iacute;nh theo nghị định 185/2013.</p>\n\n<p>Xin hỏi so NN xử phạt c&oacute; đ&uacute;ng kh&ocirc;ng, v&agrave; nếu phạt th&igrave; theo nghị định n&agrave;o.</p>\n', 'nông nghiệp,xử phạt,phân hữu cơ', 5, 3, 1, 1, '2019-10-04 07:44:39', '2019-10-05 11:29:35'),
(62, 2, 30, 'Dữ liệu về sản xuất chè theo tiêu chuẩn GAP của các tỉnh thành ở VN hiện nay', 'du-lieu-ve-san-xuat-che-theo-tieu-chuan-gap-cua-cac-tinh-thanh-o-vn-hien-nay', '<p>Em t&igrave;m dữ liệu ở mục dữ liệu trồng trọt th&igrave; kh&ocirc;ng c&oacute;, vậy cho e hỏi e cần li&ecirc;n hệ đến bộ phận n&agrave;o hay qua k&ecirc;nh n&agrave;o để e c&oacute; thể c&oacute; dữ liệu về sản xuất ch&egrave; theo ti&ecirc;u chuẩn GAP của c&aacute;c tỉnh th&agrave;nh ở VN hiện nay? Tr&acirc;n trọng!</p>\r\n', 'dữ liệu,sản xuất,chè,GAP', 4, 3, 0, 1, '2019-10-04 07:48:42', '2019-10-07 20:45:37'),
(63, 2, 30, 'Gia hạn giấy phép nhập thóc giống', 'gia-han-giay-phep-nhap-thoc-giong', '<p>Trước đ&acirc;y c&ocirc;ng ty em đ&atilde; nhập th&oacute;c giống từ nhật về nhưng đến ng&agrave;y 30/10/2017 giấy ph&eacute;p nhập khẩu của bộn n&ocirc;ng nghiệp&nbsp;cho c&ocirc;ng ty em đ&atilde; hết hạn, n&ecirc;n em muốn xin gia hạn giấy ph&eacute;p th&igrave; phải l&agrave;m những g&igrave; ạ? V&agrave; cần những giấy tờ cần thiết g&igrave; để gia hạn giấy ph&eacute;p kh&ocirc;ng ạ?</p>\n', 'thóc,giấy phép,gia hạn', 7, 3, 0, 1, '2019-10-04 07:51:30', '2019-10-08 22:17:09'),
(64, 2, 27, 'Xin số liệu về tình hình sản xuất rau an toàn trên địa bàn TP. HCM', 'xin-so-lieu-ve-tinh-hinh-san-xuat-rau-an-toan-tren-dia-ban-tp-hcm', '<p>Anh, Chị cho em hỏi em muốn xin số liệu về t&igrave;nh h&igrave;nh sản xuất rau an to&agrave;n tr&ecirc;n địa b&agrave;n Tp. HCM tờ năm 2010 đến nay th&igrave; phải l&agrave;m c&aacute;ch n&agrave;o. Em c&oacute; v&agrave;o mục t&igrave;m kiếm nhưng kh&ocirc;ng c&oacute; t&agrave;i khoản vậy l&agrave;m sao em đăng k&yacute; được t&agrave;i khoản để lấy số liệu m&agrave; em c&agrave;n t&igrave;m? Xin Anh, Chị hổ trợ gi&uacute;p em em cảm ơn nhiều</p>\n', 'số liệu,rau,sản xuất', 6, 3, 0, 1, '2019-10-04 07:54:18', '2019-10-08 21:21:39'),
(65, 22, 31, 'Kinh nghiệm mở shop quần áo', 'kinh-nghiem-mo-shop-quan-ao', '<p>T&ocirc;i đang c&oacute; dự định kinh doanh quần &aacute;o, thời trang nhưng chưa biết bắt đầu từ đ&acirc;u? Nhập quần &aacute;o ở đ&acirc;u gi&aacute; rẻ, chọn mặt bằng kinh doanh thế n&agrave;o, l&agrave;m c&aacute;ch n&agrave;o để thu h&uacute;t kh&aacute;ch h&agrave;ng?</p>\n', 'kinh nghiệm,quần áo,shop', 6, 2, 1, 1, '2019-10-04 07:59:37', '2019-10-08 22:27:16'),
(67, 23, 32, 'Biện pháp thi công công trình ', 'bien-phap-thi-cong-cong-trinh', '<p>Để kh&ocirc;ng vi phạm trong qu&aacute; tr&igrave;nh x&acirc;y dựng, khi thi c&ocirc;ng c&ocirc;ng tr&igrave;nh, ch&uacute;ng t&ocirc;i thi c&ocirc;ng từ sau ra trước được kh&ocirc;ng, hay l&agrave; phải thi c&ocirc;ng từ mặt tiền v&agrave;o?</p>\n', 'công trình,biện pháp,thi công', 2, 2, 1, 1, '2019-10-07 19:28:30', '2019-10-08 19:26:36'),
(68, 23, 31, 'Phân loại, phân cấp công trình xây dựng', 'phan-loai-phan-cap-cong-trinh-xay-dung', '<p>Theo khoản 1-điều 1-Nghị định 49/2008/NĐ-CP th&igrave; c&ocirc;ng tr&igrave;nh x&acirc;y dựng được ph&acirc;n th&agrave;nh 5 loại: C&ocirc;ng tr&igrave;nh d&acirc;n dụng, c&ocirc;ng tr&igrave;nh c&ocirc;ng nghiệp, c&ocirc;ng tr&igrave;nh giao th&ocirc;ng, c&ocirc;ng tr&igrave;nh thủy lợi, c&ocirc;ng tr&igrave;nh hạ tầng kỹ thuật. Tuy nhi&ecirc;n, theo Th&ocirc;ng tư 33/2009/TT-BXD th&igrave; c&ocirc;ng tr&igrave;nh giao th&ocirc;ng được gộp với c&ocirc;ng tr&igrave;nh hạ tầng kỹ thuật v&agrave; kh&ocirc;ng thấy đề cập tới c&ocirc;ng tr&igrave;nh thủy lợi. Như vậy, xin ph&eacute;p hỏi Qu&yacute; Bộ l&agrave; Th&ocirc;ng tư 33/2009/TT-BXD c&oacute; ph&ugrave; hợp với Nghị định 49/2008/NĐ-CP v&agrave; việc ph&acirc;n cấp c&ocirc;ng tr&igrave;nh thủy lợi t&ocirc;i phải tu&acirc;n thủ theo văn bản n&agrave;o?</p>\n', 'phân loại,công trình,xây dựng', 3, 2, 1, 1, '2019-10-07 19:32:22', '2019-10-08 21:23:55');

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
-- Table structure for table `search`
--

CREATE TABLE `search` (
  `id` int(11) NOT NULL,
  `keyword` text NOT NULL,
  `species` text,
  `total` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `search`
--

INSERT INTO `search` (`id`, `keyword`, `species`, `total`, `created_at`, `updated_at`) VALUES
(2, 'khởi nghiệp là gì', 'news', 1, '2019-10-08 18:10:41', '2019-10-08 18:10:41'),
(3, 'start up là gì', 'question', 1, '2019-10-08 18:11:24', '2019-10-08 18:11:24'),
(4, 'khởi nghiệp về y tế', 'question', 1, '2019-10-08 19:04:54', '2019-10-08 19:04:54'),
(5, 'xử phạt phân hữu cơ', 'question', 1, '2019-10-08 19:32:29', '2019-10-08 19:32:29'),
(9, 'google', 'news', 1, '2019-10-08 20:12:30', '2019-10-08 20:12:30');

--
-- Triggers `search`
--
DELIMITER $$
CREATE TRIGGER `ádasd` BEFORE INSERT ON `search` FOR EACH ROW SET NEW.created_at = NOW(), NEW.updated_at = NOW()
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
(19, 'Nguyễn Mạnh Hùng', 'public/upload/slogan/999471708btnguyenmanhhung_qcyp.jpg', 'Bộ trưởng bộ thông tin và truyền thông', 'Điều kiện quan trọng nhất của khởi nghiệp là trong tay chẳng có gì cả. Chúng ta phải bán đi cái xe máy của mình bán đi cả chiếc áo vest đang mặc thì mới là khởi nghiệp. Vì chỉ khi ấy mình mới xả thân.', 'trần viết trưởng', 5, 0, '2019-09-20 19:44:26', '2019-10-02 20:59:23'),
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
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `total` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`, `slug`, `total`) VALUES
(11, 'tên miền', 'ten-mien', 2),
(12, 'tên miền đẹp', 'ten-mien-dep', 1),
(13, 'bất động sản', 'bat-dong-san', 1),
(15, 'kinh doanh', 'kinh-doanh', 3),
(16, 'khởi nghiệp', 'khoi-nghiep', 1),
(19, 'mạo hiểm', 'mao-hiem', 1),
(20, 'chú ý', 'chu-y', 1),
(21, 'logo ', 'logo', 1),
(22, 'đặt tên doanh nghiệp', 'dat-ten-doanh-nghiep', 1),
(23, 'vốn', 'von', 1),
(25, 'nhà hàng', 'nha-hang', 1),
(26, 'thủ tục', 'thu-tuc', 1),
(28, 'start up', 'start-up', 1),
(29, 'đầu tư', 'dau-tu', 1),
(30, 'nước ngoài', 'nuoc-ngoai', 1),
(31, 'thời gian', 'thoi-gian', 1),
(32, 'xác nhận đầu tư', 'xac-nhan-dau-tu', 1),
(33, 'loại hình', 'loai-hinh', 1),
(35, 'đăng ký', 'dang-ky', 1),
(38, 'cạnh tranh', 'canh-tranh', 1),
(39, 'sinh viên', 'sinh-vien', 1),
(40, 'đầu tư vốn ', 'dau-tu-von', 1),
(41, 'công nghệ', 'cong-nghe', 1),
(42, 'thu hút vốn', 'thu-hut-von', 1),
(43, 'ngách', 'ngach', 1),
(45, 'quán cafe', 'quan-cafe', 1),
(50, 'giải trí', 'giai-tri', 1),
(51, 'thị trường', 'thi-truong', 1),
(52, 'sản phầm', 'san-pham', 1),
(53, 'tìm', 'tim', 1),
(54, 'thành lập công ty', 'thanh-lap-cong-ty', 1),
(55, 'công ty riêng', 'cong-ty-rieng', 1),
(56, 'ý tưởng ', 'y-tuong', 1),
(58, 'bảo vê', 'bao-ve', 1),
(59, 'doanh nghiệp', 'doanh-nghiep', 1),
(60, 'tính cách', 'tinh-cach', 1),
(61, 'lĩnh vực', 'linh-vuc', 1),
(63, 'y tế', 'y-te', 1),
(64, 'test', 'test', 1),
(65, 'nông nghiệp', 'nong-nghiep', 1),
(66, 'xử phạt', 'xu-phat', 1),
(67, 'phân hữu cơ', 'phan-huu-co', 1),
(68, 'dữ liệu', 'du-lieu', 1),
(69, 'sản xuất', 'san-xuat', 2),
(70, 'chè', 'che', 1),
(71, 'GAP', 'gap', 1),
(72, 'thóc', 'thoc', 1),
(73, 'giấy phép', 'giay-phep', 1),
(74, 'gia hạn', 'gia-han', 1),
(75, 'số liệu', 'so-lieu', 1),
(76, 'rau', 'rau', 1),
(77, 'kinh nghiệm', 'kinh-nghiem', 1),
(78, 'quần áo', 'quan-ao', 1),
(79, 'shop', 'shop', 1),
(80, 'công trình', 'cong-trinh', 2),
(81, 'biện pháp', 'bien-phap', 1),
(82, 'thi công', 'thi-cong', 1),
(83, 'phân loại', 'phan-loai', 1),
(84, 'xây dựng', 'xay-dung', 1);

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
(23, 'Trần Viết Trưởng', 'tranviettruong1998@gmail.com', 'truong', '$2y$10$3CT2jngDlSpb6OSRLZFG.ukNANdqrOTf0eO8dGryDKrTQr7sjlZei', '', 1, NULL, 1, 'thóc,giấy phép,gia hạn,công trình,biện pháp,thi công,,kinh nghiệm,quần áo,shop', '2019-09-28 10:46:40', '2019-10-08 22:27:11'),
(24, 'Nguyễn Văn Nam', 'nguyenvannamhero40@gmail.com', 'nam', '$2y$10$2dt3dAbRYDeaUD8ilm3GFupRk2UGzZHWWZu04fKS95efxxt1jbjDm', '', 1, NULL, 1, 'tên miền,tên miền đẹp,bất động sản,vốn,kinh doanh,khởi nghiệp,nhà hàng,thủ tục,thời gian,xác nhận đầu tư', '2019-10-01 15:33:49', '2019-10-01 23:01:10'),
(25, 'Đoàn Quang Nhật', 'mrnhatdoan98@gmail.com', 'nhat', '$2y$10$Zm3JwtCUkU1nylbARcCTf.XkCEOetxJQ/LVzijweRHv3LTbNg/EOC', '', 1, NULL, 1, 'chú ý,bất động sản,vốn,kinh doanh,kinh nghiệm,quần áo,shop,nước ngoài,Kinh doanh,khởi nghiệp', '2019-10-01 15:59:52', '2019-10-05 08:17:58'),
(27, 'Trần Thị Thu', 'thu@gmail.com', 'thu', '$2y$10$3k3opE39HcP3FxHN7NwQquc5dVcJVBC6zk0OkJeUqNkRJ324qXp3W', '', 1, NULL, 1, 'xử phạt,phân hữu cơ,thóc,giấy phép,gia hạn,dữ liệu,chè,GAP,số kiệu],rau', '2019-10-01 16:33:02', '2019-10-04 07:55:56'),
(28, 'Hồ Văn Đồ', 'do@gmail.com', 'hodo', '$2y$10$Mqp4ggJBo0N8XOukRwPGx.DIr531v08c7LvqImHus9KX5GuvLi1dm', '', 1, NULL, 1, 'bất động sản,vốn,kinh doanh,khởi nghiệp,đầu tư,mạo hiểm,chú ý,ý tế,Kinh doanh,lĩnh vực', '2019-10-01 16:58:14', '2019-10-03 10:51:29'),
(29, 'Nguyễn Thị Hà', 'ha@gmail.com', 'thuha', '$2y$10$.vBoNGkGYuOzAugyrA1LUOuNakYfGqHm1GyeY3gc2PZVDeLYllD6O', '', 1, NULL, 1, ',tên miền,tên miền đẹp,ý tưởng ,kinh doanh,bảo vê,đăng ký,doanh nghiệp,đầu tư,nước ngoài', '2019-10-01 18:50:00', '2019-10-01 22:55:04'),
(30, 'Đoàn Thị Mai', 'mai@gmail.com', 'mai', '$2y$10$eA7O56./rhWwBCxeJV6tAuElXGbGcCVPNR.QMuTnbumLvjkvTsPAm', '', 1, NULL, 1, 'nông nghiệp,xử phạt,phân hữu cơ,Kinh doanh,lĩnh vực,doanh nghiệp,tính cách,công nghệ,thu hút vốn,ngách', '2019-10-04 07:40:03', '2019-10-04 07:52:36'),
(31, 'Vũ Đình Công', 'cong@gmail.com', 'cong', '$2y$10$96./xE5ilVqg9dDP.Gt5/urFmE0x7x15qxFlemXF74eut.RptqBGO', '', 1, NULL, 1, ',công trình,biện pháp,thi công', '2019-10-04 07:56:38', '2019-10-07 19:29:32'),
(32, 'Nguyễn Thị Ngân', 'ngan@gmail.com', 'ngan', '$2y$10$nmnm/kXlS3.4iskMOHJTCO2flHu6pblTnLNY0CBOkyP7Sqh6hwgm.', '', 1, NULL, 1, 'sản xuất,chè,GAP,số liệu,rau,tên miền,tên miền đẹp,phân loại,công trình,xây dựng', '2019-10-07 19:24:14', '2019-10-08 13:23:42');

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
(1, 1, 23),
(5, 2, 23),
(9, 3, 23),
(10, 4, 23),
(4, 2, 25),
(3, 1, 27),
(2, 1, 30),
(6, 3, 31),
(7, 3, 32),
(8, 4, 32);

--
-- Triggers `vote_answer`
--
DELIMITER $$
CREATE TRIGGER `auto_giam_vote_answer` AFTER DELETE ON `vote_answer` FOR EACH ROW UPDATE answer SET answer.vote = answer.vote - 1 WHERE answer.id = OLD.id_answer
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auto_vote_answer` AFTER INSERT ON `vote_answer` FOR EACH ROW UPDATE answer SET answer.vote = answer.vote + 1 WHERE answer.id = NEW.id_answer
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
(87, 23, 36),
(94, 24, 36),
(89, 25, 36),
(99, 28, 36),
(88, 29, 36),
(90, 23, 37),
(95, 24, 37),
(100, 28, 37),
(91, 23, 38),
(96, 24, 38),
(114, 27, 38),
(101, 28, 38),
(105, 25, 39),
(102, 28, 39),
(93, 23, 40),
(116, 27, 40),
(148, 32, 40),
(106, 23, 41),
(92, 23, 42),
(97, 24, 42),
(117, 27, 42),
(133, 25, 44),
(98, 24, 45),
(146, 32, 47),
(139, 23, 49),
(104, 23, 50),
(126, 30, 50),
(140, 23, 52),
(135, 23, 53),
(103, 23, 54),
(147, 32, 55),
(107, 23, 56),
(149, 23, 57),
(125, 30, 57),
(112, 23, 58),
(115, 27, 58),
(110, 28, 58),
(124, 30, 58),
(134, 25, 59),
(109, 28, 59),
(123, 30, 59),
(111, 23, 60),
(113, 27, 60),
(108, 28, 60),
(121, 30, 60),
(118, 23, 61),
(128, 27, 61),
(122, 30, 61),
(131, 27, 62),
(120, 30, 62),
(143, 32, 62),
(138, 23, 63),
(130, 27, 63),
(119, 30, 63),
(137, 23, 64),
(127, 27, 64),
(145, 32, 64),
(136, 23, 65),
(132, 25, 65),
(141, 31, 67),
(144, 32, 67),
(150, 23, 68),
(142, 32, 68);

--
-- Triggers `vote_question`
--
DELIMITER $$
CREATE TRIGGER `auto_giam_vote` AFTER DELETE ON `vote_question` FOR EACH ROW UPDATE question SET question.vote = question.vote - 1 WHERE question.id = OLD.id_question
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auto_tang_vote` AFTER INSERT ON `vote_question` FOR EACH ROW UPDATE question SET question.vote = question.vote + 1 WHERE question.id = NEW.id_question
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

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
ALTER TABLE `question` ADD FULLTEXT KEY `title` (`title`);

--
-- Indexes for table `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `search` ADD FULLTEXT KEY `keyword` (`keyword`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `catagory`
--
ALTER TABLE `catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=508;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `search`
--
ALTER TABLE `search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `vote_answer`
--
ALTER TABLE `vote_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vote_question`
--
ALTER TABLE `vote_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

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
