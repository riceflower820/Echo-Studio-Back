-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2023-01-03 17:08:14
-- 伺服器版本： 10.4.25-MariaDB
-- PHP 版本： 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `add_db`
--

-- --------------------------------------------------------

--
-- 資料表結構 `activity`
--

CREATE TABLE `activity` (
  `id` int(6) NOT NULL,
  `sn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活動';

-- --------------------------------------------------------

--
-- 資料表結構 `activity_color_detial`
--

CREATE TABLE `activity_color_detial` (
  `id` int(6) NOT NULL,
  `ac_product_id` int(6) NOT NULL,
  `color_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `activity_detail`
--

CREATE TABLE `activity_detail` (
  `id` int(6) NOT NULL,
  `activity_id` int(6) NOT NULL,
  `ac_product_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活動頁面整合';

-- --------------------------------------------------------

--
-- 資料表結構 `activity_img`
--

CREATE TABLE `activity_img` (
  `id` int(6) NOT NULL,
  `ac_product_id` int(6) NOT NULL,
  `src` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活動多圖圖片';

-- --------------------------------------------------------

--
-- 資料表結構 `activity_product`
--

CREATE TABLE `activity_product` (
  `id` int(6) NOT NULL,
  `ac_product_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_img` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_id` int(6) NOT NULL,
  `spec_id` int(6) NOT NULL,
  `activity_price` int(6) NOT NULL,
  `information` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spec_decration` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '規格說明',
  `inventory` int(20) NOT NULL COMMENT '庫存',
  `activity_start` datetime NOT NULL COMMENT '活動開始',
  `activity_end` datetime NOT NULL COMMENT '活動結束',
  `activity_product_valid` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活動產品頁面';

-- --------------------------------------------------------

--
-- 資料表結構 `administrator`
--

CREATE TABLE `administrator` (
  `id` int(10) NOT NULL,
  `admin_account` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `administrator`
--

INSERT INTO `administrator` (`id`, `admin_account`, `admin_password`) VALUES
(1, 'administrator', '12325');

-- --------------------------------------------------------

--
-- 資料表結構 `answer`
--

CREATE TABLE `answer` (
  `id` int(6) NOT NULL,
  `administrator_id` int(6) NOT NULL,
  `question_id` int(6) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `article`
--

CREATE TABLE `article` (
  `id` int(6) UNSIGNED NOT NULL,
  `article_title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章標題',
  `article_img` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章圖片',
  `article_content` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章內容',
  `article_category_id` int(6) NOT NULL COMMENT '文章分類',
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章';

--
-- 傾印資料表的資料 `article`
--

INSERT INTO `article` (`id`, `article_title`, `article_img`, `article_content`, `article_category_id`, `create_time`) VALUES
(1, '【旅行吉他】可作為新手吉他嗎？', '6.png', '新手在選購吉他時，其實不用拘泥於到底要買一把「大」吉他還是「小」吉他，還是應該依據自己的身高、手臂長度、手掌大小以及舒適度，作綜合評估考量。只要彈奏起來不過於費力，長時間演奏下來身體也不會感到任何不適，至少在手感上和耐久度上，就是一把適合自己的吉他。', 1, '2022-11-10 13:15:00'),
(2, '【單板】【合板】是什麼？', 'aaa.jpeg', '「合板琴」有如三明治般的合板琴，其實是夾著的品質較差的木板、甚至夾著木材碎料的三層板，共鳴當然沒有比實心木來得好。而另一方面，所謂的「面單」吉他，就是面板是實心木製作，背側板為合板製作的琴；「全單」琴則是全部都使用實心木製作；還有另一種較少見的「面背單」，就是面板、背板都使用實心木製作。', 1, '2022-11-10 13:19:04'),
(3, '【預算】怎麼估？', 'Bridge.jpg', '即使是新手吉他，我們仍然不建議購買5000元以下的吉他。而價格5000元以上，就能購買到品質還不錯的高階合版琴；預算較充裕的新手可以選擇一萬上下的單板琴，在音質和延音表現都比合板琴有明顯的差異，並且可免於學一陣子後，還得多花錢換琴的損失（通常學一陣子會對音色有所要求，因此不會再購買一把合板琴）。', 1, '2022-11-10 13:21:51'),
(4, '桶身有哪些？', 'cov.jpg', '吉他桶身絕對不只是他的外觀而已，「不同」吉他桶身會有不同聲音特性，而「同」一桶身在不同廠牌也可能有些微差異。對於剛開始接觸「桶身」名詞的人，可先了解有哪些桶身、以及大概會有怎麼樣的聲音喔。', 1, '2022-11-10 13:22:59'),
(5, '您重視【外觀】嗎？', 'Martin.jpg', '外觀常是許多人考量的重要依據，畢竟一把好吉他有可能就陪伴自己一輩子。或許你不是注重外觀的人，但在一開始，您還可以依照吉他「木材」或「上漆方式」是來作為您考量的依據，因為這些對音色都會有影響。', 1, '2022-11-10 13:23:50'),
(6, '優良的教學品質 ', 'aaa.jpeg', '給予學生優良的教學品質是我們的首要考量，不同資歷的老師，有不同的收費標準，我們相信給予老師公平的待遇，才能有更優質的教學品質。建立一個高水準的教學機構，給予最專業的指導，並與學員一同用音樂串連生活，一直是我們最大的期許。', 2, '2022-11-10 13:42:15'),
(7, '多元的課程選擇41256', 'bbb.jpg', '音樂是一種生活，也是一種表達方式，它可以是各種形式。無論你有一日是想站上世界舞台，還是想隨心所欲的邊旅行邊走唱，我們明白人人心裡都有一個專屬於自己的音樂夢。在這我們提供多種樂器、多種曲風的專業課程，無論你是新手入門，還是想與名師學習，我們有最專業、完整的師資陣容，透過小班制的教學型態，為您量身打造專屬於你的築夢課程。', 2, '2022-11-10 13:44:03'),
(8, '學生專屬', 'ccc.jpg', '在此報名的學生，我們都給予最高的學員購琴優惠。不僅如此，無論您的吉他是否在這裡購買，或是家中陳放已久的古董吉他，我們都將以老師的角度為您做一次免費的徹底檢查、設定。一把好彈的吉他與否是延續學習的大關鍵，讓我們為您把關。\r\n\r\n諮詢課程・吉他免費健檢', 2, '2022-11-10 13:45:00'),
(9, '給你舞台', 'ddd.jpeg', '你感受過站上舞台的感受嗎？\r\n那種亢奮、沈浸與成就感，讓演奏者總是享受其中並對此留戀。\r\n我們深知在學習階段，也一樣擁有表演慾的你，需要一個自在的舞台，因此每年暑假，我們都會承租可容納數百人的表演廳舉辦「成果發表會」，學員們可以邀請親朋好友一起前來觀賞，完全不用支付任何費用。任何程度的學生皆可以自由報名參加。感受舞台、培養舞台經驗也是十分重要的喔！', 2, '2022-11-10 13:45:37'),
(10, '【他，在旅行】雙11超值滿額活動', 'ticket.png', '什麼？你說現在去【他，在旅行】就有機會可以 #出國旅行 ？\r\n什麼？你說「不限購買金額」都可以 #抽機票 ？\r\n沒錯！你沒聽錯！\r\n他，真的要去旅行啦✈️\r\n就這麼被禁足了2年，多麽可望去看看外面的世界\r\n如今終於開通了，荷包卻也已空了\r\n可望而不可及啊…\r\n\r\n凡是於11/11（五）下單者 #不限購買金額 皆可參加抽獎\r\n🎁獎品：【曼谷單人來回機票乙份】\r\n準備好了嗎？繫好安全帶，準備起飛✈️✈️', 3, '2022-11-10 13:50:03'),
(11, '最新講座資訊', 'case.jpg', '桓吟老師蟄伏好一陣子，終於在 2022 產下這段時間的心血，這本指彈吉他樂譜集灌注了他精心編寫的改編曲目，還有自己的原創曲，讓許多 Fingerstyle 愛好者們，能在老師循序漸進的編曲和樂譜解說中，彈出喜愛的曲子，改編曲都好好聽啊!!\r\n\r\n《隙光》指彈吉他樂譜集，請大家一定要支持\r\n➤ 收錄十四首原創以及改編曲吉他演奏樂譜\r\n➤ 譜面包含五線譜及六線譜對照譜組\r\n➤ 每首歌曲皆附詳細演奏解說\r\n➤ 預購加贈 遺珠樂譜【慢慢喜歡你－莫文蔚】、【向陽 EP】', 3, '2022-11-10 13:53:09'),
(12, '證面出吉 “學生獨享方案＂開跑～！', 'cart.jpg', '憑學生證換高階吉他：\r\n\r\n想買吉他？喜歡都是「高階琴」而且都貴鬆鬆？月底荷包快要見底？…別擔心，分期專案讓你少少的摳摳也可以選擇厲害的琴！ 即日起，來「他，在旅行」門市吉他任選，只要你年滿18歲（未滿20歲需家長作保），可證明為在校生、持有學生證，就享有分期付款優惠，最低 12000元～最高可到10萬元唷！馬上來把最喜歡的吉他帶回家～店內眾多各種琴，任你爽爽挑！慢慢付！\r\n\r\n還有不懂的嗎？詳情請在右邊  私訊小編 or 門市洽詢～', 3, '2022-11-10 13:55:16');

-- --------------------------------------------------------

--
-- 資料表結構 `article_category`
--

CREATE TABLE `article_category` (
  `id` int(6) UNSIGNED NOT NULL,
  `category_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章分類';

--
-- 傾印資料表的資料 `article_category`
--

INSERT INTO `article_category` (`id`, `category_name`) VALUES
(1, '精選文章'),
(2, '課程資訊'),
(3, '最新消息');

-- --------------------------------------------------------

--
-- 資料表結構 `class`
--

CREATE TABLE `class` (
  `id` int(6) UNSIGNED NOT NULL,
  `user_id` int(6) NOT NULL,
  `class_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_price` int(6) NOT NULL COMMENT '課程價格',
  `class_img` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '課程圖片',
  `hours` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '課程總時數',
  `chapter` int(1) NOT NULL COMMENT '課程章節',
  `start_date` date NOT NULL COMMENT '開始日期',
  `end_date` date NOT NULL COMMENT '結束日期',
  `information` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '課程資訊',
  `create_time` datetime NOT NULL,
  `class_valid` tinyint(1) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='課程';

--
-- 傾印資料表的資料 `class`
--

INSERT INTO `class` (`id`, `user_id`, `class_name`, `class_price`, `class_img`, `hours`, `chapter`, `start_date`, `end_date`, `information`, `create_time`, `class_valid`) VALUES
(1, 0, '鋼琴', 7000, '6.jpg', '', 0, '2022-11-09', '2022-11-11', '包含鋼琴彈奏、基礎樂理、 音感訓練、 檢定內容或比賽訓練。', '2022-11-08 10:53:42', 1),
(2, 0, '入門吉他', 4000, '2.jpg', '', 0, '2022-11-08', '2022-11-10', '建立基礎樂理概念、正確的彈奏姿勢、建立視譜能力、應用流行歌曲、簡易自彈自唱/簡易演奏能力', '2022-11-08 11:01:40', 1),
(3, 0, '爵士鼓', 7500, '7.webp', '', 0, '2022-11-09', '2022-11-10', '課程依學習者的程度設計，無論是從未碰過鼓棒的初學者，或曾經中斷學習者，都可以按部就班地學習。以適合自己的進度開心上課，並體驗廣泛的音樂類型，找到自己最愛的演奏風格。針對右手的彈奏指法（Chord Stroke）設定難易度訓練，以階段導入手指琶音的技巧，穩定訓練手指肌肉。', '2022-11-08 11:59:43', 1),
(4, 0, '中階貝斯', 6500, '5.jpg', '', 0, '2022-11-08', '2022-11-09', '認識不同電貝斯類型、\n電貝斯琶音階練習、\n左右手耐力訓練、\n左右手協調性訓練、\n各式電貝斯曲風認識、\n電貝斯指板認識、', '2022-11-08 12:00:01', 1),
(5, 0, '木箱鼓', 5000, '1.jpg', '', 0, '2022-11-09', '2022-11-12', '想要簡簡單單信手捻來就能敲打出不輸全套鼓的節奏嗎? 小朋友想學鼓卻因為踩不到大鼓而放棄很可惜嗎? 木箱鼓將帶給您令人驚艷的聽覺和視覺功能, 而且完全可以解決低年齡兒童學習打擊樂的絕佳方案。', '2022-11-09 07:46:11', 1),
(6, 0, '電子琴', 8500, '4.jpg', '', 0, '2022-11-01', '2022-11-05', '-電子琴結構及姿勢介紹  -左右手配合，手指靈活及耐力訓練  -指法認識、音階訓練及以不同的伴奏形式練習  -多種指法、和弦理論及和弦的彈奏要訣 -認識及學習世界著名電子琴手及經典樂隊的演奏技巧  -針對訓練Arpeggios,speed solo,scales/mode的運用  -深入研究藍調、搖滾、爵士及多種風格的即興演奏訓練  -獨奏演繹時如何更有感情  ', '2022-11-09 09:39:31', 1),
(7, 0, '進階烏克麗麗', 6500, '3.jpg', '', 0, '2022-11-08', '2022-11-10', '認識 7、9、13 和弦、烏克麗麗編曲練習、烏克麗麗進階指法 、轉調應用練習、進階節拍訓練、進階和弦應用', '2022-11-09 09:39:31', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `class_category`
--

CREATE TABLE `class_category` (
  `id` int(6) UNSIGNED NOT NULL,
  `category_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='課程分類';

-- --------------------------------------------------------

--
-- 資料表結構 `class_detail`
--

CREATE TABLE `class_detail` (
  `id` int(6) NOT NULL,
  `class_order_id` int(6) NOT NULL,
  `class_id` int(6) NOT NULL,
  `class_price` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='多筆課程';

-- --------------------------------------------------------

--
-- 資料表結構 `class_detail_message`
--

CREATE TABLE `class_detail_message` (
  `id` int(6) NOT NULL,
  `class_message_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `teacher_id` int(6) NOT NULL,
  `replay` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `creat_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `class_message`
--

CREATE TABLE `class_message` (
  `id` int(6) NOT NULL,
  `user_type` tinyint(1) NOT NULL COMMENT '登入狀態(0.user 1.teacher)',
  `class_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '留言',
  `parent_msgId` int(10) NOT NULL COMMENT '留言主id',
  `created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='留言板';

-- --------------------------------------------------------

--
-- 資料表結構 `class_order`
--

CREATE TABLE `class_order` (
  `id` int(6) UNSIGNED NOT NULL,
  `user_id` int(6) NOT NULL COMMENT '會員',
  `order_phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_price` int(6) NOT NULL COMMENT '價錢',
  `class_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_date` date NOT NULL COMMENT 'YYYY/MM/DD',
  `class_start_time` time NOT NULL COMMENT '00:00',
  `class_end_time` time NOT NULL COMMENT '00:00',
  `creat_date` date NOT NULL,
  `class_order_valid` tinyint(1) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='課程訂單';

--
-- 傾印資料表的資料 `class_order`
--

INSERT INTO `class_order` (`id`, `user_id`, `order_phone`, `order_price`, `class_email`, `class_date`, `class_start_time`, `class_end_time`, `creat_date`, `class_order_valid`) VALUES
(1, 2, '098463539', 5400, '', '0000-00-00', '00:00:00', '00:00:00', '0000-00-00', 1),
(2, 3, '0983748562', 4500, '', '0000-00-00', '00:00:00', '00:00:00', '0000-00-00', 1),
(3, 5, '0984632189', 3000, '', '0000-00-00', '00:00:00', '00:00:00', '0000-00-00', 1),
(4, 2, '0973648362', 2503, '', '0000-00-00', '00:00:00', '00:00:00', '0000-00-00', 1),
(5, 2, '0984637321', 5400, '', '0000-00-00', '00:00:00', '00:00:00', '0000-00-00', 1),
(6, 2, '0984738954', 5943, '', '0000-00-00', '00:00:00', '00:00:00', '0000-00-00', 1),
(7, 2, '0973632281', 4000, '', '0000-00-00', '00:00:00', '00:00:00', '0000-00-00', 1),
(8, 8, '0947326174', 3000, '', '0000-00-00', '00:00:00', '00:00:00', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `comment`
--

CREATE TABLE `comment` (
  `id` int(6) UNSIGNED NOT NULL,
  `user_id` int(6) NOT NULL,
  `order_product_id` int(6) NOT NULL,
  `class_detail_id` int(6) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `comment` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='評論';

--
-- 傾印資料表的資料 `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `order_product_id`, `class_detail_id`, `create_time`, `comment`) VALUES
(1, 2, 2, 0, '2022-11-09 01:27:50', '老闆超棒，十分細心也十分的講究！'),
(2, 3, 5, 0, '2022-11-11 15:00:00', '吸收音樂知識的好地方'),
(3, 5, 1, 0, '2022-11-13 11:28:19', '專業的教室1'),
(4, 7, 10, 0, '2022-11-13 15:28:30', '優質的音樂店家。'),
(5, 8, 67, 0, '2022-11-13 16:44:50', '感謝用心的團長與認真教學的老師，讓女兒開心的學習音樂，推薦給有需要的朋友！'),
(6, 1, 50, 0, '2022-11-13 18:00:05', '團長非常認真辦學，老師群都非常專業，學習環境非常歡樂，小朋友在這樣的環境學習音樂，效果特好的！'),
(7, 0, 30, 0, '2022-11-14 08:00:50', '老師很有耐心，孩子都很期待上課時間的到來……很棒的老師…把孩子交給他們就對了…'),
(8, 0, 55, 0, '2022-11-14 09:05:06', '莊老師大是美女， 專業用心深受孩子們的喜愛喔!'),
(9, 0, 165, 0, '2022-11-14 10:55:10', '服務小姐態度很好且又漂亮，價格優惠'),
(10, 0, 140, 0, '2022-11-15 06:22:30', '行政姐姐很可愛，老師教學用心，老闆專業.親切人又帥。'),
(11, 0, 136, 0, '2022-11-15 08:20:40', '孩子在這裡認真學習，老師（包括櫃檯小姐）也都細心的教導'),
(12, 0, 60, 0, '2022-11-15 15:20:10', '老師超專業\r\n環境一級棒\r\n女兒越來越進步'),
(13, 0, 45, 0, '2022-11-16 16:50:07', '很有耐心的店家，環境也很舒適'),
(14, 0, 86, 0, '2022-11-16 17:50:42', '服務優良的樂器很豐富該有的都有'),
(15, 0, 14, 0, '2022-11-16 18:09:35', '服務.環境都很棒唷～'),
(16, 0, 30, 0, '2022-11-16 18:50:40', '老闆專業 親切 非常推薦'),
(17, 0, 10, 0, '2022-11-16 19:30:50', '服務親切，可以帶來調音～'),
(18, 0, 30, 0, '2022-11-16 20:55:10', '超優質老師和教學環境。讚👍'),
(19, 0, 5, 0, '2022-11-16 21:30:20', '喜歡音樂的孩子不會變壞😀'),
(20, 0, 4, 0, '2022-11-16 22:30:40', 'fasd'),
(25, 646, 30, 0, NULL, '76866'),
(26, 676, 60, 0, NULL, '6786'),
(27, 575, 50, 0, NULL, '7575'),
(28, 50, 5, 0, NULL, '78676');

-- --------------------------------------------------------

--
-- 資料表結構 `coupon`
--

CREATE TABLE `coupon` (
  `sn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '優惠序號',
  `coupon_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '優惠名稱',
  `discount` int(2) NOT NULL COMMENT '優惠折扣',
  `quota` int(10) NOT NULL COMMENT '名額',
  `start_time` datetime NOT NULL COMMENT '開始時間',
  `end_time` datetime NOT NULL COMMENT '結束時間',
  `create_time` datetime NOT NULL,
  `valid` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='優惠碼';

--
-- 傾印資料表的資料 `coupon`
--

INSERT INTO `coupon` (`sn`, `coupon_name`, `discount`, `quota`, `start_time`, `end_time`, `create_time`, `valid`) VALUES
('MONTHNOV11', '11號優惠', 1111, 5, '2022-11-11 00:00:00', '2022-11-11 23:59:00', '2022-11-08 09:44:51', 1),
('MONTHNOV14', '14號優惠', 50, 10, '2022-11-14 00:00:00', '2022-11-14 23:59:00', '2022-11-07 11:11:37', 1),
('MONTHNOV15', '15號優惠', 50, 10, '2022-11-15 00:00:00', '2022-11-15 23:59:00', '2022-11-07 11:12:40', 1),
('MONTHNOV16', '16號優惠', 200, 8, '2022-11-16 00:00:00', '2022-11-16 23:59:00', '2022-11-07 11:09:26', 1),
('MONTHNOV17', '17號優惠', 50, 10, '2022-11-17 00:00:00', '2022-11-17 23:59:00', '2022-11-07 11:12:27', 1),
('MONTHNOV18', '18號優惠', 50, 10, '2022-11-17 00:00:00', '2022-11-18 23:59:00', '2022-11-07 11:43:32', 1),
('MONTHNOV19', '19號優惠', 1500, 3, '2022-11-19 00:00:00', '2022-11-19 23:59:00', '2022-11-07 09:53:41', 1),
('MONTHNOV20', '20號優惠', 50, 10, '2022-11-20 00:00:00', '2022-11-20 23:59:00', '2022-11-07 11:12:16', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `coupon_detail`
--

CREATE TABLE `coupon_detail` (
  `id` int(6) UNSIGNED NOT NULL,
  `sn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '序號',
  `user_id` int(6) NOT NULL COMMENT '會員',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '狀態\r\n1.已領取\r\n2.已使用\r\n3.已失效'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='優惠碼-使用判定';

--
-- 傾印資料表的資料 `coupon_detail`
--

INSERT INTO `coupon_detail` (`id`, `sn`, `user_id`, `status`) VALUES
(1, '12', 1, 0),
(2, '13', 2, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `id` int(6) UNSIGNED NOT NULL,
  `user_id` int(6) NOT NULL,
  `order_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂單編號',
  `order_phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '聯絡電話',
  `order_address` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '聯絡地址',
  `pay_method` int(1) NOT NULL COMMENT '付款方式 1, 2, 3',
  `take_method` int(1) NOT NULL COMMENT '取貨方式1, 2, 3',
  `order_status` int(1) NOT NULL COMMENT '訂單狀態 0, 1, 2, 3, 4',
  `coupon_sn` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '優惠',
  `freight` int(10) NOT NULL COMMENT '運費',
  `total_amount` int(10) UNSIGNED NOT NULL COMMENT '總計',
  `receipt` int(10) NOT NULL COMMENT '發票選擇 1.會員載具 2.紙本發票 3. 捐贈發票',
  `memo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '訂單備註',
  `gui` int(8) DEFAULT NULL COMMENT '統一編號',
  `carrier` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手機載具',
  `order_create_time` date NOT NULL,
  `order_valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='訂單';

--
-- 傾印資料表的資料 `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_number`, `order_phone`, `order_address`, `pay_method`, `take_method`, `order_status`, `coupon_sn`, `freight`, `total_amount`, `receipt`, `memo`, `gui`, `carrier`, `order_create_time`, `order_valid`) VALUES
(1, 3, '', '0955364819', '\0\0W?\0\0??\0\0^\0\0?\0\0N\0\0\0??\0\0\0 \0\0', 2, 2, 0, 'MONTHNOV11', 0, 0, 0, NULL, NULL, NULL, '2022-11-01', 1),
(2, 3, '', '0977778854', '\0\0??\0\0S\0\0^\0\0O?\0\0?\0\0S@\0\0^\0\0', 1, 2, 0, 'MONTHNOV11', 0, 0, 0, NULL, NULL, NULL, '2022-11-01', 1),
(3, 3, '', '0911885522', '\0\0??\0\0h\0\0~#\0\0??\0\0h\0\0^\0\0~#\0\0', 2, 1, 0, 'MONTHNOV11', 130, 0, 0, NULL, NULL, NULL, '2022-11-02', 1),
(4, 3, '', '0999556622', '\0\0e?\0\0z?\0\0^\0\0N-\0\0kc\0\0??\0\0\0 \0\0', 2, 2, 0, 'MONTHNOV17', 0, 0, 0, NULL, NULL, NULL, '2022-11-05', 1),
(5, 4, '', '0988445522', '\0\0_p\0\0S\0\0^\0\0N-\0\0\\q\0\0??\0\0N?\0\0', 1, 1, 0, 'MONTHNOV11', 130, 0, 0, NULL, NULL, NULL, '2022-11-05', 1),
(6, 3, '', '0966997788', '\0\0V	\0\0?\0\0^\0\0gq\0\0S@\0\0N-\0\0\\q\0\0', 2, 2, 0, 'MONTHNOV16', 0, 0, 0, NULL, NULL, NULL, '2022-11-06', 1),
(7, 3, '', '0933224411', '\0\0V	\0\0?\0\0~#\0\0Y*\0\0O?\0\0^\0\0ye\0\0', 2, 2, 0, 'MONTHNOV18', 0, 0, 0, NULL, NULL, NULL, '2022-11-07', 1),
(8, 2, '', '0966885500', '\0\0??\0\0SW\0\0^\0\0e?\0\0q?\0\0S@\0\0l\0\0', 1, 1, 0, 'MONTHNOV14', 130, 0, 0, NULL, NULL, NULL, '2022-11-08', 1),
(9, 3, '', '0945823614', '\0\0\\O\0\0gq\0\0^\0\0??\0\0u1\0\0??\0\0\0 \0\0', 2, 1, 0, 'MONTHNOV12', 130, 0, 0, NULL, NULL, NULL, '2022-11-08', 1),
(10, 9, '', '0933621894', '\0\0hC\0\0W\0\0^\0\0N-\0\0X?\0\0S@\0\0e?\0\0', 1, 1, 0, 'MONTHNOV20', 130, 0, 0, NULL, NULL, NULL, '2022-11-08', 1),
(11, 15, '', '0936954112', '\0\0??\0\0N-\0\0^\0\0?P\0\0S?\0\0S@\0\0?}\0\0', 2, 2, 0, 'MONTHNOV15', 0, 0, 0, NULL, NULL, NULL, '2022-11-08', 1),
(12, 11, '', '0998458888', '\0\0hC\0\0W\0\0^\0\0N-\0\0X?\0\0S@\0\0e?\0\0', 2, 1, 0, 'MONTHNOV19', 130, 0, 0, NULL, NULL, NULL, '2022-11-08', 1),
(13, 3, '', '0965482135', '\0\0S?\0\0S\0\0^\0\0Y\'\0\0[?\0\0S@\0\0?\0\0', 2, 1, 0, 'MONTHNOV11', 130, 0, 0, NULL, NULL, NULL, '2022-11-08', 1),
(14, 14, '', '0945823614', '\0\0\\O\0\0gq\0\0^\0\0??\0\0u1\0\0??\0\0\0 \0\0', 2, 1, 0, 'MONTHNOV14', 0, 0, 0, NULL, NULL, NULL, '2022-11-10', 1),
(15, 3, '', '0945823614', '\0\0\\O\0\0gq\0\0^\0\0??\0\0u1\0\0??\0\0\0 \0\0', 2, 2, 0, 'MONTHNOV20', 0, 0, 0, NULL, NULL, NULL, '2022-11-11', 1),
(16, 16, '', '0945823614', '\0\0W?\0\0??\0\0^\0\0N-\0\0kc\0\0S@\0\0?\0\0', 2, 1, 0, 'MONTHNOV15', 130, 0, 0, NULL, NULL, NULL, '2022-11-11', 1),
(17, 10, '', '0977777777', '\0\0hC\0\0W\0\0^\0\0N-\0\0X?\0\0S@\0\0e?\0\0', 1, 2, 0, 'MONTHNOV18', 0, 0, 0, NULL, NULL, NULL, '2022-11-12', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `order_product`
--

CREATE TABLE `order_product` (
  `id` int(6) UNSIGNED NOT NULL,
  `order_id` int(6) NOT NULL,
  `product_id` int(6) DEFAULT NULL,
  `ac_product_id` int(6) DEFAULT NULL,
  `product_price` int(6) NOT NULL,
  `color_id` int(6) NOT NULL,
  `spec_id` int(6) NOT NULL,
  `order_amount` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='產品訂單';

--
-- 傾印資料表的資料 `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `ac_product_id`, `product_price`, `color_id`, `spec_id`, `order_amount`) VALUES
(1, 1, 1, NULL, 8290, 0, 0, 1),
(2, 1, 2, NULL, 4990, 0, 0, 1),
(3, 2, 3, NULL, 8490, 0, 0, 2),
(4, 2, 4, NULL, 5900, 0, 0, 5),
(5, 3, 1, NULL, 8290, 0, 0, 2),
(6, 4, 1, NULL, 8290, 0, 0, 2),
(7, 5, 2, NULL, 4990, 0, 0, 3),
(8, 6, 4, NULL, 5900, 0, 0, 2),
(9, 4, 2, NULL, 4990, 0, 0, 3),
(10, 5, 10, NULL, 16500, 0, 0, 2),
(11, 7, 30, NULL, 11800, 0, 0, 5),
(12, 8, 18, NULL, 23900, 0, 0, 2),
(13, 9, 20, NULL, 33900, 0, 0, 2),
(14, 2, 24, NULL, 6500, 0, 0, 4),
(15, 8, 38, NULL, 11990, 0, 0, 1),
(16, 10, 29, NULL, 8800, 0, 0, 1),
(17, 11, 50, NULL, 3800, 0, 0, 1),
(18, 12, 9, NULL, 2700, 0, 0, 2),
(19, 10, 14, NULL, 39900, 0, 0, 5),
(20, 11, 33, NULL, 6600, 0, 0, 5),
(21, 13, 17, NULL, 33900, 0, 0, 2),
(22, 14, 6, NULL, 8900, 0, 0, 2),
(23, 15, 11, NULL, 6900, 0, 0, 1),
(24, 15, 2, NULL, 4990, 0, 0, 1),
(25, 16, 7, NULL, 16500, 0, 0, 1),
(26, 16, 20, NULL, 33900, 0, 0, 2),
(27, 17, 10, NULL, 16500, 0, 0, 1),
(28, 17, 12, NULL, 14500, 0, 0, 1),
(29, 16, 13, NULL, 30900, 0, 0, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `id` int(6) UNSIGNED NOT NULL,
  `category_id` int(6) NOT NULL COMMENT '產品分類',
  `product_name` varchar(60) CHARACTER SET utf8mb4 NOT NULL COMMENT '產品名稱',
  `subject_img` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spec_id` int(6) NOT NULL COMMENT '產品規格',
  `product_price` int(6) UNSIGNED NOT NULL COMMENT '產品價格',
  `information` varchar(200) CHARACTER SET utf8mb4 NOT NULL COMMENT '產品資訊',
  `spec_decration` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品規格說明',
  `inventory` int(5) NOT NULL COMMENT '庫存',
  `create_time` datetime NOT NULL,
  `product_valid` tinyint(1) NOT NULL DEFAULT 1 COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='產品';

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`id`, `category_id`, `product_name`, `subject_img`, `spec_id`, `product_price`, `information`, `spec_decration`, `inventory`, `create_time`, `product_valid`) VALUES
(1, 1, 'CASIO CT-S1 61鍵電子琴 多色款', 'CASIO CT-S1.jpeg', 7, 8290, '簡約時尚設計適合各式居家風格，重新定義專屬你的音樂人生。', '', 0, '2022-11-11 10:44:25', 1),
(2, 1, 'CASIO CT-S300 61鍵標準電子琴', 'CASIO-CT-S300.jpeg', 7, 4990, 'CT-S300具備多樣化的功能，同時具有簡單的操作介面。\r\n纖薄及時尚的輕便設計。', '', 3, '2022-11-11 10:44:25', 1),
(3, 1, 'CASIO CT-S400 61鍵自動伴奏電子琴', 'CASIO-CT-S400.jpeg', 7, 8490, '輕巧琴身搭載滑音輪 豐富你的演奏樂趣61鍵手提式電子琴。\r\n使用 Casiotone 活出聲色生活。', '', 6, '2022-11-11 10:44:25', 1),
(4, 1, 'CASIO LK-S250 61鍵魔光電子琴 CASIO LK-S250 61鍵魔光電子琴 CASI', 'CASIO-LK-S250.jpeg', 7, 5900, '您透過LK-S250便可隨時隨地享受音樂。輕薄時尚的便攜式設計。', '', 4, '2022-11-11 10:44:25', 1),
(5, 1, 'YAMAHA PSR-E273 61鍵電子琴', 'YAMAHA PSR-E273 61.jpeg', 7, 4999, '擁有61鍵的初階手提式鍵盤PSR-E273，具有多樣化的聲音和功能，\r\n對於在啟蒙階段的音樂愛好者來說此款是最理想的電子琴首選。', '', 3, '2022-11-11 10:44:25', 1),
(6, 1, 'YAMAHA PSR-E373 61鍵電子琴', 'YAMAHA-PSR-E373.jpeg', 7, 8900, 'PSR-E373 配有觸鍵感應鍵盤以及可帶來令人驚嘆的高品質聲音的\r\n全新音調產生器LSI，是 Yamaha 的新標準手提電子琴，\r\n學習及演奏均是完美之選。', '', 3, '2022-11-11 10:44:25', 1),
(7, 1, 'YAMAHA PSR-E473 61鍵 手提電子琴', 'YAMAHA-PSR-E473.jpeg', 7, 16500, 'PSR-E473 提供與高階型號相同的專業音色。\r\n樂器增加的增強效果和範圍廣泛的風格，從最新的熱門歌曲乃至全球各種\r\n音樂風格。', '', 6, '2022-11-11 10:44:25', 1),
(8, 1, 'YAMAHA PSR-SX900 61鍵自動伴奏琴 旗艦款', 'YAMAHA-PSR-SX900.jpeg', 7, 69000, '接續PSR-S 系列，PSR-SX系列，提供您新一代的數位工作音效、設計和\r\n使用者體驗。', '', 2, '2022-11-11 10:44:25', 1),
(9, 1, 'YAMAHA PSS-E30 迷你37鍵電子琴 兒童電子琴 白色款', 'YAMAHA-PSS-E30.jpeg', 7, 2700, '輕便小巧的樂器讓未來的音樂大師，可以自行彈奏並收納。', '', 10, '2022-11-11 10:44:25', 1),
(10, 2, 'Alesis Prestige 88鍵數位電鋼琴 標準黑色款', 'Alesis-Prestige-88.jpeg', 7, 16500, '結合了錄音室品質的多重採樣音色，具有現代最先進和多功能的音色庫，\r\n內置的50W 微陣列喇叭系統 配備了延音踏板和方便的譜架。', '', 6, '2022-11-11 11:52:51', 1),
(11, 2, 'Artesia A-61 61鍵數位電鋼琴', 'Artesia A-61 61-1.jpeg', 7, 6900, '鍵盤為半重，敏感度可調整6段，平台鋼琴音色為三層取樣疊成，\r\n8個高品質音色，可裝電池也可接電。', '', 2, '2022-11-11 11:52:51', 1),
(12, 2, 'Artesia PE-88 88鍵數位電鋼琴 經典黑色款', 'Artesia-PE-88.jpeg', 7, 14500, '擁有130種類聲音100種伴奏，優秀的鋼琴聲音與琴上喇叭，\r\n一台彈唱專用琴可裝電池也可接電。', '', 2, '2022-11-11 11:52:51', 1),
(13, 2, 'CASIO AP-270 88鍵數位電鋼琴 多色款', 'CASIO-AP-270.jpeg', 7, 30900, '史無前例地以自然的方式，產生出傳統鋼琴所擁有的豐富表現力和\r\n共鳴聲音。\r\n內建兩款平台鋼琴的音色，並快速選取更適用於各種表演。', '', 3, '2022-11-11 11:52:51', 1),
(14, 2, 'CASIO AP-470 88鍵數位電鋼琴 多色款', 'CASIO AP-470 88-8-white.jpeg', 7, 39900, '清脆明亮的音色，即便是在樂團中演奏爵士樂或流行樂也絲毫不遜色。\r\n具備明亮且華麗的音質。', '', 2, '2022-11-11 11:52:51', 1),
(15, 2, 'CASIO CDP-S110 數位電鋼琴 88鍵 經典黑色款', 'CASIO-CDP-S110.jpeg', 7, 14000, '三種基本音色，包括三角鋼琴和電子鋼琴，正待您探索和彈奏。 \r\n鋼琴音色隨演奏速度和時間顯現的細微變化，變得更加自然加強您的\r\n表現力。', '', 1, '2022-11-11 13:05:11', 1),
(16, 2, 'CASIO PX770 88 鍵數位電鋼琴 黑色/白色款', 'CASIO-PX770-88.jpeg', 7, 29900, '以全面注重細節的特性，表現出鋼琴豐富共鳴的固有音色。\r\n模擬鋼琴上精緻的迴響及圓渾的共鳴。', '', 2, '2022-11-11 13:05:11', 1),
(17, 2, 'CASIO PX870 88鍵電鋼琴 白色/黑色款', 'CASIO-PX870-88.jpeg', 7, 33900, '結合所有琴鍵所產生的琴弦共鳴，彈奏單音時與和弦音時的共鳴差異，\r\n以及彈奏強弱產生的共鳴差異等，皆能隨心 所欲地自然呈現。', '', 1, '2022-11-11 13:09:25', 1),
(18, 2, 'CASIO PX-S1100 BK/WE 88鍵數位電鋼琴 黑/白色款', 'CASIO-PX-S1100 BKWE.jpeg', 7, 23900, 'Privia PX-S1100 的主要特點之一是其輕薄的琴身，搭載88鍵琴槌動作系統\r\n中擁有世界最輕薄琴身的數位鋼琴。', '', 5, '2022-11-11 13:09:25', 1),
(19, 2, 'CASIO PX-S3100 BK 88鍵數位電鋼琴 黑色款', 'CASIO-PX-S3100-BK.jpeg', 7, 29900, '輕薄232mm琴身，將琴放在客廳或房間等任何喜歡地方，更加享受與\r\n鋼琴的生活。', '', 4, '2022-11-11 13:09:25', 1),
(20, 2, 'CASIO PX870 88鍵電鋼琴 白色/黑色款', 'CASIO-PX870-88.jpeg', 7, 33900, '結合所有琴鍵所產生的琴弦共鳴，彈奏單音時與和弦音時的共鳴差異\r\n以及彈奏強弱產生的共鳴差異等，皆能隨心 所欲地自然呈現。', '', 2, '2022-11-11 13:09:25', 1),
(21, 2, 'KAWAI ES120 88鍵數位電鋼琴 多色款', 'KAWAI-ES120-88.jpeg', 7, 33000, 'Shigeru Kawai SK-EX演奏型鋼琴音色、電子鋼琴、弦樂、Bass、直立式鋼琴音色 具有改良的RHC鍵盤系統，以及最新的SK-EX鋼琴取樣', '', 1, '2022-11-11 13:09:25', 1),
(22, 2, 'KORG B2SP 88鍵數位電鋼琴 黑色/白色', 'KORG-B2SP-88.jpeg', 7, 25600, '新的鋼琴聲音，帶有12 種精心挑選的音色。\r\n 鋼琴的新起點，通過專家為初學者提供各種功能。', '', 3, '2022-11-11 13:09:25', 1),
(23, 2, 'KORG LP380 U 88鍵數位電鋼琴 多色款', 'KORG-LP380-U-88.jpeg', 7, 38800, '30 個高品質音色、三種效果器 更輕巧的外觀尺寸和重量 時尚的外觀設計 豐富鋼琴音色，讓您享受彈琴樂趣', '', 1, '2022-11-11 13:09:25', 1),
(24, 2, 'KORG tinyPIANO 25鍵 迷你兒童電鋼琴 粉紅色', 'KORG-tinyPIANO.jpeg', 7, 6800, '可愛的設計本質上是一架小型立式鋼琴，帶有真正鋼琴一樣的滑蓋，以及KORG製造的微型25鍵鍵盤，便於演奏。', '', 2, '2022-11-11 13:09:25', 1),
(25, 3, 'aNueNue M3 M3E 羽毛鳥系列 台灣相思木 合板 36吋 旅行木吉他', 'aNueNue-M3-M3E.jpeg', 1, 6800, '左上偏移的補償音孔，平衡了高、中、低音的清晰度，在外型上也更增辨識度 M-面單原創系列『全新改版 全新升級』。', '', 6, '2022-11-11 13:31:46', 1),
(26, 3, 'aNueNue M10 M10E 羽毛鳥系列 雲杉木 面單 36吋 旅行木吉他', 'aNueNue-M10E.jpeg', 1, 8800, '左上偏移的補償音孔，平衡了高、中、低音的清晰度，在外型上也更增辨識度。', '', 5, '2022-11-11 13:31:46', 1),
(27, 3, 'aNueNue M10E 羽毛鳥 電民謠木吉他', 'aNueNue-M10E-electric.jpeg', 1, 11000, '桶身的直切角造型，能讓演奏者更輕易處理 高把位按弦。\r\n琴身鑲邊玫瑰木，美觀與功能兼具。', '', 6, '2022-11-11 13:31:46', 1),
(28, 3, 'aNueNue M12 面單羽毛鳥系列民謠木吉他', 'aNueNue-M12.jpeg', 1, 9600, '鳥吉他琴頭造型，玫瑰木琴頭貼片搭配白貝殼鑲嵌 aNueNue LOGO，\r\n音孔內側鑲嵌玫瑰木，增添層次與細節。\r\n玫瑰木鑲嵌琴身外側，美觀及保護功能兼具。', '', 4, '2022-11-11 13:31:46', 1),
(29, 3, 'aNueNue M20 M20E 羽毛鳥系列 桃花心木 面單 36吋 旅行木吉他', 'aNueNue-M20-M20E.jpeg', 1, 8800, '左上偏移的補償音孔，平衡了高、中、低音的清晰度，在外型上也更增辨識度。', '', 3, '2022-11-11 13:31:46', 1),
(30, 3, 'aNueNue M30 M30E 羽毛鳥系列 台灣相思木 面單 36吋 旅行木吉他', 'aNueNue-M30-M30E.jpeg', 1, 11800, '桶身的直切角造型，能讓演奏者更輕易處理 高把位按弦。\r\n琴身鑲邊玫瑰木，美觀與功能兼具。', '', 6, '2022-11-11 13:31:46', 1),
(31, 3, 'aNueNue MC10 AM BA GG LC QS 36吋旅行木吉他 多種顏色款', 'aNueNue-MC10-AM-BA-GG-L- QS.jpeg', 1, 7200, '在海底堅韌生機蓬勃的顏色，活潑而柔美，充滿活力、肯定生命的\r\n價值意義。', '', 9, '2022-11-11 13:31:46', 1),
(32, 3, 'aNueNue MTK Morelos Blue 36吋民謠旅行木吉他', 'aNueNue-MTK-Morelos-Blue.jpeg', 1, 6600, '雲杉面板搭配合板桃花心木背側板聲音傳導較快，音色清脆高亮。\r\n指板用硬度較高的玫瑰木氣孔較多，附贈專屬設計貼紙組合包。', '', 6, '2022-11-11 13:31:46', 1),
(33, 3, 'aNueNue MTK Palawan Sunrise 36吋民謠旅行木吉他', 'aNueNue-MTK-Palawan-Sunrise.jpeg', 1, 6600, '雲杉木面板搭合板桃花心木背側板楓木鑲嵌琴身外側指板用硬度較高的\r\n玫瑰木氣孔較多。', '', 5, '2022-11-11 13:31:46', 1),
(34, 3, 'aNueNue MY10 面單民謠木吉他', 'aNueNue-MY10.jpeg', 1, 6800, '為36吋面單鋼弦吉他，鳥吉他桶身搭配特殊立木結構，讓面板更穩定，\r\n提升六弦的低音。', '', 2, '2022-11-11 13:31:46', 1),
(35, 3, 'aNueNue MY20 面單民謠木吉他', 'aNueNue-MY20.jpeg', 1, 6800, '以36吋入門旅行吉他為基礎，簡約樸實的外觀與舒適手感，適合初學的你入手。', '', 1, '2022-11-11 13:31:46', 1),
(36, 3, 'LAVA ME 3 36吋智能吉他 多色款', 'LAVA-ME-3.jpeg', 1, 27990, '3.5寸多點觸控屏，搭載HILAVA交互系統進入未來出乎想像的聲音。', '', 10, '2022-11-11 13:31:46', 1),
(37, 3, 'LAVA Blue Touch 36吋 智能吉他 拿火吉他 多色款', 'LAVA Blue Touch 36.jpeg', 1, 19990, '3.5吋多點觸控面板搭載HILAVA 系統BlUE LAVA 繽紛色彩設計，全新上市！', '', 6, '2022-11-11 13:31:46', 1),
(38, 3, 'LAVA Blue Original 36吋 內建效果 民謠吉他 拿火吉他', 'LAVA Blue Original 36.jpeg', 1, 11990, '內建效果功能最新的LAVA 吉他，預算內的超值選擇！', '', 5, '2022-11-11 14:31:45', 1),
(39, 3, 'aNueNue L30 L30E 羽毛鳥系列 台灣相思木 面單 41吋 民謠木吉他', 'aNueNue-L30-L30E.jpeg', 2, 12800, '左上偏移的補償音孔，平衡了高、中、低音的清晰度，在外型上也更增辨識度。', '', 5, '2022-11-11 14:35:29', 1),
(40, 3, 'LAVA ME PRO 電民謠吉他內建效果41吋 多色款', 'LAVA-ME-PRO.jpeg', 2, 12800, '舞台演出實踐成果，極易上手，讓你的巡演，從此無需攜帶效果器。\r\n你的舞台，從此無需效果器！', '', 9, '2022-11-11 14:35:29', 1),
(41, 3, 'SQOE A2-V2 全單板高階民謠木吉他', 'SQOE-A2-V2.jpeg', 2, 22000, '琴頸筆直弦距低，按壓和弦彈奏都相對容易，手指較不容易疼痛。\r\n41 吋標準桶身共鳴好，彈奏上聲音傳達佳。', '', 14, '2022-11-11 14:35:29', 1),
(42, 3, 'SQOE A940C 面單民謠木吉他', 'SQOE-A940C.jpeg', 2, 12000, '41吋高檔手工泰勒桶面單吉他，與西班牙手工琴製作大師合作開發側背板採用玫瑰木、木紋相當顯眼 41 吋標準桶身共鳴好。', '', 3, '2022-11-11 14:35:29', 1),
(43, 3, 'SQOE S360 FG 桃花心木面單民謠木吉他', 'SQOE-S360-FG.jpeg', 2, 7600, '特殊的黑色透木紋設計，視覺效果更顯時尚有質感。 \r\n琴頸筆直弦距低，按壓和弦彈奏都相對容易，手指較不容易疼痛。\r\n 41 吋標準桶身共鳴好，彈奏上聲音傳達佳。', '', 5, '2022-11-11 14:35:29', 1),
(44, 3, 'SQOE S370 FG 面單民謠木吉他', 'SQOE-S370-FG.jpeg', 2, 7600, '琴頸筆直弦距低，按壓和弦彈奏都相對容易，手指較不容易疼痛。 \r\n41 吋標準桶身共鳴好，彈奏上聲音傳達佳。', '', 10, '2022-11-11 14:35:29', 1),
(45, 3, 'SQOE S460T-SK 面單民謠木吉他', 'SQOE-S460T-SK.jpeg', 2, 8800, '琴頸筆直弦距低，按壓和弦彈奏都相對容易，手指較不容易疼痛。 \r\n41 吋標準桶身共鳴好，彈奏上聲音傳達佳。', '', 8, '2022-11-11 14:35:29', 1),
(46, 3, 'SQOE SQ-C-BQJ 民謠木吉他 原木款', 'SQOE-SQ-C-BQJ.jpeg', 2, 5600, '琴頸筆直弦距低，按壓和弦彈奏都相對容易，手指較不容易疼痛。\r\n 41 吋標準桶身共鳴好，彈奏上聲音傳達佳。', '', 6, '2022-11-11 14:35:29', 1),
(47, 3, 'SQOE SQ-CC-SK 民謠木吉他', 'SQOE-SQ-CC-SK.jpeg', 2, 5600, '琴頸筆直弦距低，按壓和弦彈奏都相對容易，手指較不容易疼痛。\r\n 41 吋標準桶身共鳴好，彈奏上聲音傳達佳。', '', 3, '2022-11-11 14:35:29', 1),
(48, 3, 'SQOE SQ-DC-SK 民謠木吉他', 'SQOE-SQ-DC-SK.jpeg', 2, 4900, '琴頸筆直弦距低，按壓和弦彈奏都相對容易，手指較不容易疼痛。 \r\n41 吋標準桶身共鳴好，彈奏上聲音傳達佳。', '', 4, '2022-11-11 14:35:29', 1),
(49, 3, 'YAMAHA F310 民謠木吉他', 'YAMAHA-F310.jpeg', 2, 4200, 'F310可以算是學校團購初學入手最多指定款式之一，CP值高穩定度好、品管佳每一把F310的聲音品管都相當穩定。', '', 7, '2022-11-11 14:35:29', 1),
(50, 4, 'SBALAY SCJ-2 木箱鼓附贈袋子 多色款', 'SBALAY-SCJ-2.jpeg', 7, 3800, '使用鈴噹響線設計，更加完美呈現聲音的演奏， 底部防滑設計，更可以放心的表演練習使用！', '', 16, '2022-11-11 14:54:38', 1),
(51, 4, 'SBALAY SCJ-HPL 木箱鼓 三色款 附贈袋子', 'SBALAY-SCJ-HPL.jpeg', 7, 4200, '底部防滑設計，更可以放心的表演練習使用。', '', 5, '2022-11-11 14:54:38', 1),
(52, 4, '匠 CRAFTMAN C-CJ1SN C-CJSB C-CJSG 木箱鼓 多色款', 'CRAFTMAN-C-CJ1SN.jpeg', 7, 3980, '匠 C-CJ1系列木箱鼓CP值高,高級享受的木箱鼓最佳選擇。', '', 5, '2022-11-11 14:54:38', 1),
(53, 5, 'Fender MIJ Aerodyne II J Bass RW BLK 日廠 黑色款', 'Fender-MIJ-Aerodyne.jpeg', 7, 35670, '擁有專為現代演奏者量身定制的規格和風格。 \r\n該型號具有 PJ 拾音器組合，可用於多種聲音創作。', '', 2, '2022-11-11 15:04:30', 1),
(54, 5, 'Fender MIJ Hama Okamoto Precision Bass OWT 電貝斯 濱田郁', 'Fender-MIJ-Hama.jpeg', 7, 36000, '配上較細的JAZZ BASS琴頸與復古造型的橢圓形弦鈕、琴橋蓋與戴帽色的護板，濱田郁未簽名款，配上較細的J BASS琴頸、復古造型的橢圓形弦鈕。', '', 4, '2022-11-11 15:04:30', 1),
(55, 5, 'Fender MIJ Hybrid 60s Jazz Bass RW TRD 電貝斯 酒紅色款', 'Fender-MIJ-Hybrid.jpeg', 7, 39000, '採用經典 Strat 配置以及日本製造工藝確保了最好的彈奏感受 Fender \"Hybrid\" 代表了經典', '', 3, '2022-11-11 15:04:30', 1),
(56, 5, 'Fender MIJ LTD Hybrid II J Bass RW FPK 日廠 粉紅色款', 'Fender-MIJ-LTD.jpeg', 7, 42800, '著名的暢銷的傳奇款式Stratocaster 、Telecaster、Precision bass 和Jazz bass在玩家心目中是永遠的經典。', '', 4, '2022-11-11 15:04:30', 1),
(57, 5, 'Fender MIJ LTD Traditional II 60s J Bass RSTD RW OWT 日廠 白色款', 'Fender-MIJ-LTD-Traditional.jpeg', 7, 41800, '著名的暢銷的傳奇款式Stratocaster 、Telecaster、Precision bass 和Jazz bass在玩家心目中是永遠的經典。', '', 6, '2022-11-11 15:04:30', 1),
(58, 5, 'Fender MIJ LTD Traditional II 70s P Bass MN BLK 日廠 黑色款', 'Fender-MIJ-LTD-Traditional-II-70s.jpeg', 7, 34800, '著名的暢銷的傳奇款式Stratocaster 、Telecaster、Precision bass 和Jazz bass在玩家心目中是永遠的經典。', '', 1, '2022-11-11 15:04:30', 1),
(59, 5, 'Fender MIJ Traditonal II 60s J Bass RW 3TS 日廠 電貝斯', 'Fender-MIJ-Traditonal-II-60s.jpeg', 7, 35800, 'Fender \"Traditional\" 代表了經典、彈奏以及聲音的品質新領域', '', 7, '2022-11-11 15:04:30', 1),
(60, 5, 'Fender MIJ Traditonal II 60s J Bass RW OWT 日廠 電貝斯', 'Fender MIJ Traditonal II 60s J Bass RW OWT.jpeg', 7, 35800, 'Fender \"Traditional\" 代表了經典、彈奏以及聲音的品質新領域', '', 4, '2022-11-11 15:04:30', 1),
(61, 5, 'IBANEZ EHB1000-PWM BASS 無頭電貝斯 白色', 'IBANEZ-EHB1000-PWM-BASS.jpeg', 7, 378000, 'EHB的無頭結構和經過特殊設計琴體身使演奏者無論坐下還是站立都可以保持類似的演奏姿勢。\r\n\r\n琴頸的烤楓木經過熱處理，可以提高穩定性，耐用性，防潮性和溫度變化的承受能力。', '', 3, '2022-11-11 15:04:30', 1),
(62, 5, 'IBANEZ EHB1005MS-SFM BASS 無頭五弦電貝斯 綠色', 'IBANEZ-EHB1005MS-SFM-BASS.jpeg', 7, 43800, 'EHB的無頭結構和經過特殊設計琴體身使演奏者無論坐下還是站立都可以保持類似的演奏姿勢。  \r\n琴頸的烤楓木經過熱處理，可以提高穩定性，耐用性，防潮性和溫度變化的承受能力。', '', 10, '2022-11-11 15:04:30', 1),
(63, 5, 'IBANEZ SR300E 多色 BASS 電貝斯', 'IBANEZ SR300E.jpeg', 7, 16800, 'SR的琴頸一直以來就因為比較細薄容易上手好彈奏而知名，這楓木/玫瑰木指板組合提供了更完美強壯的支撐以及穩定度。', '', 2, '2022-11-11 15:04:30', 1),
(64, 5, 'IBANEZ SR300EB WK BASS 電貝斯 黑色', 'IBANEZ SR300EB WK BASS.jpeg', 7, 16800, 'Jatoba 產生豐富的中音和清脆的高音。', '', 3, '2022-11-11 15:04:30', 1),
(65, 5, 'IBANEZ SR1305SB-MGL BASS 黑色木紋 主動式電貝斯', 'IBANEZ SR1305SB-MGL BASS.jpeg', 7, 45800, 'MR5S 琴橋具有可調節的弦枕，可將琴弦間距調整為 +/- 1.5 毫米，滿足每位貝斯手的特定琴弦間距需求。', '', 7, '2022-11-11 15:04:30', 1),
(66, 5, 'YAMAHA ATTITUDE LIMITED 3 Billy Sheehan BASS 電貝斯', 'YAMAHA ATTITUDE LIMITED 3 Billy Sheehan BASS.jpeg', 7, 95000, 'Billy Sheehan 的傳奇 Attitude 貝斯由 Yamaha Music Craft 團隊重生。\r\n水藍色的琴身讓您瞬間成為全場焦點~ DiMarzio 拾音器、 半扇形琴頸，添加了初始響應技術和 聲學共振增強，讓 Attitude 的低音強勁有力，\r\n高音清晰且有音樂感！', '', 4, '2022-11-11 15:04:30', 1),
(67, 5, 'YAMAHA BB234 多色款 BASS 電貝斯', 'YAMAHA BB234.jpeg', 7, 11800, '改良的較小 BB 琴身擁有更好的演奏性、新的 6 螺栓鎖定琴頸更加穩固與增加琴體共鳴、 特製拾音器持有經典BB音色卻有更大的出力。', '', 8, '2022-11-11 15:04:30', 1),
(68, 5, 'YAMAHA BB434 Bass 電貝斯 多色款', 'YAMAHA BB434 Bass.jpeg', 7, 18500, '6螺栓接合技術使琴頸與琴體更為密合 榿木琴身', '', 6, '2022-11-11 15:04:30', 1),
(69, 5, 'YAMAHA BB734AMTB BASS 電貝斯 霧面黑', 'YAMAHA BB734AMTB BASS.jpeg', 7, 29800, '改良的較小BB琴身擁有更好的演奏性、新的 6 螺栓鎖定琴頸更加穩固與增加琴體共鳴、 特製拾音器持有經典BB音色卻有更大的出力。', '', 10, '2022-11-11 15:04:30', 1),
(70, 5, 'YAMAHA BBNE2 Nathan East 簽名款 BASS 電貝斯', 'YAMAHA BBNE2 Nathan East.jpeg', 7, 99000, '採貫穿式琴頸設計，琴頸由楓木與桃花心木打造而成，再配上鑲有花紋珍珠母的黑檀木指板。\r\nNathan East 都是靠此款 BBNE2 簽名琴五弦貝斯來傳遞他想要的音色。', '', 6, '2022-11-11 15:04:30', 1),
(71, 5, 'YAMAHA TRB1005J 五弦電貝斯 多色款', 'YAMAHA TRB1005J.jpeg', 7, 12000, 'TRB已採用長幅35吋以增強弦的在低音域時的清脆度，更調整弦的張力來提昇觸感。', '', 7, '2022-11-11 15:04:30', 1),
(72, 5, 'YAMAHA TRBX174 BASS 多色款', 'YAMAHA TRBX174 BASS.jpeg', 7, 8800, 'TRBX174帶來TRBX系列之中最經濟實惠的價格， 卻又一如所有YAMAHA貝斯一般擁有精緻的高品質。', '', 8, '2022-11-11 15:04:30', 1),
(73, 5, 'YAMAHA TRBX304 BASS 多色款', 'YAMAHA TRBX304 BASS.jpeg', 7, 13600, '一體成形的桃花心木琴身，立體琴身設計搭配其絕佳的配重在音色及演奏舒適性達到完美的平衡。 \r\nM3 拾音器可產生清晰且強大厚實的低音，提供表演時無可比擬的演奏性。', '', 4, '2022-11-11 15:04:30', 1),
(74, 5, '入門電貝斯套餐 YAMAHA TRBX174 BASS 多色款', 'YAMAHA TRBX174 BASS color.jpeg', 7, 9900, '開學季超值優惠 YAMAHA TRBX174 入門電貝斯套餐', '', 10, '2022-11-11 15:04:30', 1),
(75, 6, 'aNueNue Baby 900 17吋烏克麗麗', 'aNueNue Baby 900 17.jpeg', 3, 2800, '使用桃花心木面、背、側板。\r\n精巧玲瓏，琴身也Baby size 17吋的小巧輕盈的琴身，最適合帶著外出遊玩', '', 2, '2022-11-11 17:08:32', 1),
(76, 6, 'aNueNue Baby U 野兔款 17吋烏克麗麗', 'aNueNue Baby U 17.jpeg', 3, 2800, '使用桃花心木面、背、側板。\r\n精巧玲瓏，琴身也Baby size 17吋的小巧輕盈的琴身，最適合帶著外出遊玩', '', 4, '2022-11-11 17:08:32', 1),
(77, 6, 'aNueNue 900S 21吋桃花心木烏克麗麗', 'aNueNue 900S 21.jpeg', 4, 4800, '新一代U900升級面單桃花心木，內部結構升級，聲音較響亮、飽滿、顆粒扎實。\r\n超可愛的U900家族，與日本插畫家木原庸佐合作，推出U900聯名款烏克麗麗', '', 6, '2022-11-12 01:15:09', 1),
(78, 6, 'aNueNue K1 K1E 21吋台灣相思木烏克麗麗', 'aNueNue K1 K1E 21.jpeg', 4, 3100, '舒適手感與親民的價格，搭配個性夜光材質，提供初學者一個新選擇，就是要你與眾不同。', '', 4, '2022-11-12 01:15:09', 1),
(79, 6, 'aNueNue SS1 SS1E 21吋烏克麗麗 流星雲杉木系列', 'aNueNue SS1 SS1E 21.jpeg', 4, 3100, '舒適手感與親民的價格，搭配個性夜光材質，提供初學者一個新選擇，就是要你與眾不同。\r\n', '', 3, '2022-11-12 01:15:09', 1),
(80, 6, 'aNueNue TM1 21吋烏克麗麗 閃電桃花心木系列', 'aNueNue TM1 21.jpeg', 4, 3100, '使用 Aquila New Nylgut ®，材質為仿羊腸弦，外觀顏色偏白，顆粒感重，刷奏、指彈表現平均且穩定，製造產地為義大利。\r\n刷奏、指彈表現平均且穩定。', '', 8, '2022-11-12 01:15:09', 1),
(81, 6, 'aNueNue K2 K2E 23吋台灣相思木烏克麗麗', 'aNueNue K2 K2E 23.jpeg', 5, 3300, '舒適手感與親民的價格，搭配個性夜光材質，提供初學者一個新選擇，就是要你與眾不同。\r\n', '', 4, '2022-11-12 01:26:01', 1),
(82, 6, 'aNueNue MTK Kona Sky 23吋烏克麗麗', 'aNueNue MTK Kona Sky 23.jpeg', 5, 3200, '雲杉木面板搭配桃花心木背、側板 楓木鑲嵌琴身外側 指板使用硬度較高的玫瑰木。', '', 6, '2022-11-12 01:26:01', 1),
(83, 6, 'aNueNue SS2 SS2E 23吋烏克麗麗 流星雲杉木系列', 'aNueNue SS2 SS2E 23.jpeg', 5, 3300, '舒適手感與親民的價格，搭配個性夜光材質，提供初學者一個新選擇，就是要你與眾不同。', '', 9, '2022-11-12 01:26:01', 1),
(84, 6, 'aNueNue TM2 TM2E 23吋烏克麗麗 閃電桃花心木系列', 'aNueNue TM2 TM2E 23.jpeg', 5, 3300, '使用 Aquila New Nylgut ®，材質為仿羊腸弦，外觀顏色偏白，顆粒感重，刷奏、指彈表現平均且穩定，製造產地為義大利。', '', 10, '2022-11-12 01:26:01', 1),
(85, 6, 'aNueNue K3 K3E 26吋台灣相思木烏克麗麗', 'aNueNue K3 K3E 26.jpeg', 6, 3500, '舒適手感與親民的價格，搭配個性夜光材質，提供初學者一個新選擇，就是要你與眾不同。\r\n', '', 6, '2022-11-12 01:33:42', 1),
(86, 6, 'aNueNue SS3 SS3E 26吋烏克麗麗 流星雲杉木系列', 'aNueNue SS3 SS3E 26.jpeg', 6, 3500, '舒適手感與親民的價格，搭配個性夜光材質，提供初學者一個新選擇，就是要你與眾不同。\r\n使用雲杉木面板，搭配桃花心木背、側板。', '', 4, '2022-11-12 01:33:42', 1),
(87, 6, 'aNueNue TM3 TM3E 26吋烏克麗麗 閃電桃花心木系列', 'aNueNue TM3 TM3E 26.jpeg', 6, 3500, '使用 Aquila New Nylgut ®，材質為仿羊腸弦，外觀顏色偏白，顆粒感重，刷奏、指彈表現平均且穩定，製造產地為義大利。\r\n', '', 5, '2022-11-12 01:33:42', 1),
(88, 6, 'SQOE SQ-UK604 雲杉面單板烏克麗麗 26吋款', 'SQOE SQ-UK604.jpeg', 6, 3000, '聲音清亮好聽，在手感上也相對容易彈奏。 隨琴附贈專用琴袋，不論是在收納或是在攜帶上都很方便！\r\n', '', 2, '2022-11-12 01:33:42', 1),
(89, 6, 'SQOE SQ-UK651 全彩蝶木烏克麗麗 26吋款', 'SQOE SQ-UK651.jpeg', 6, 3400, '聲音清亮好聽，在手感上也相對容易彈奏。 隨琴附贈專用琴袋，不論是在收納或是在攜帶上都很方便！\r\n', '', 5, '2022-11-12 01:33:42', 1),
(90, 7, 'MAPEX ARMORY AR529S 爵士鼓組 多色款', 'MAPEX ARMORY AR529S.jpeg', 7, 32600, '終極的音色表現,SONIClear™導角設計\r\nARMORY系列是MAPEX混合鼓身(hybrid shell)概念的最新實現。', '', 5, '2022-11-12 02:20:37', 1),
(91, 7, 'MAPEX STORM ST5295F 爵士鼓組', 'MAPEX STORM ST5295F.jpeg', 7, 18800, '鼓身為全白楊木,MAPEX SONIClear™導角技術初階演奏者的第一套完整鼓組。', '', 4, '2022-11-12 02:20:37', 1),
(92, 7, 'TAMA IMPERIALSTAR IE52KH6W 5PCS爵士鼓組 多色款', 'TAMA IMPERIALSTAR IE52KH6W 5PCS.jpeg', 7, 32800, 'Imperialstar 系列提供各種配置和飾面、精確加工的鼓身和可靠耐用的硬件，增加鼓組的可用性。\r\nImperialstar 全套爵士鼓以實惠的價格提供鼓手所需的一切。', '', 3, '2022-11-12 02:20:37', 1),
(93, 7, 'TAMA MBS42S-CAR STARCLASSIC 爵士鼓組', 'TAMA MBS42S-CAR STARCLASSIC.jpeg', 7, 43700, '此款爵士鼓組是在樺木外殼內部使用布賓加木。\r\n樺木和布賓加木的混合殼創造出一種新的聲音，\r\n它結合了樺木的堅硬和布賓加木美麗的深沉和聲。', '', 6, '2022-11-12 02:20:37', 1),
(94, 7, 'TAMA Starclassic WB WBS42S-SPF CR W/MTH1000爵士鼓組', 'TAMA Starclassic WB WBS42S-SPF CR WMTH1000.jpeg', 7, 62800, 'Starclassic 系列繼續代表著我們集體鼓製作的熱情、智慧和追求', '', 9, '2022-11-12 02:20:37', 1),
(95, 7, 'TAMA Superstar Classic CL52KRS 爵士鼓組 多色款', 'TAMA Superstar Classic CL52KRS.jpeg', 7, 45000, '附贈TAMA SM5W支架組(大鼓踏板*1, 銅鈸架*2,小鼓架*1, HIHAT架*1)', '', 4, '2022-11-12 02:20:37', 1),
(96, 7, 'TAMA Superstar Classic 爵士鼓組 多色款', 'TAMA Superstar Classic.jpeg', 7, 39800, '贈TAMA SM5W支架組(大鼓踏板*1, 銅鈸架*2,小鼓架*1, HIHAT架*1)\r\n卓越的品質、純正的音色和清晰的穿透力。', '', 5, '2022-11-12 02:20:37', 1),
(97, 7, 'YAMAHA EAD10 爵士鼓收音 音響模組', 'YAMAHA EAD10.jpeg', 7, 16600, '50 組系統預置/200 種使用者情境，讓您的傳統鼓組擁有更多的音色動態。\r\n\r\nEAD10 電子傳統鼓系統可提升您使用傳統鼓做練習、錄音和演奏的方式。', '', 6, '2022-11-12 02:20:37', 1),
(98, 7, 'YAMAHA Stage Custom 爵士鼓組 多色款', 'YAMAHA Stage Custom.jpeg', 7, 55100, '高級鼓組中的經典\r\n100%樺木是高級鼓組中的經典,入門首選爵士鼓', '', 7, '2022-11-12 02:20:37', 1),
(99, 9, 'Audio-Technica 鐵三角 ATH-E40 雙動圈耳塞式耳機', 'Audio-Technica ATH-E40.jpeg', 7, 4000, '採用本公司設計的可拆卸式連接端子，提升音響性及耐久性。\r\n從舞台到外出使用 可體驗更高層次聆聽感受的耳塞式監聽耳機', '', 5, '2022-11-12 02:41:30', 1),
(100, 9, 'Audio-Technica 鐵三角 ATH-M20x 專業型監聽耳機', 'Audio-Technica ATH-M20x.jpeg', 7, 1800, '錄音室錄製與混音時的最佳選擇\r\n實現以平直均衡特性播放寬廣頻率 高音質錄音室用監聽耳機的入門機型', '', 5, '2022-11-12 02:41:30', 1),
(101, 9, 'Audio-Technica 鐵三角 ATH-M30x 專業型監聽耳機', 'Audio-Technica ATH-M30x.jpeg', 7, 2500, '錄音室錄製與混音時的最佳選擇\r\n實現高清晰度音響效果 最適合用於錄音室監聽等用途的監聽耳機', '', 5, '2022-11-12 02:41:30', 1),
(102, 9, 'Audio-Technica 鐵三角 ATH-M40x 專業型監聽耳機', 'Audio-Technica ATH-M40x.jpeg', 7, 3500, '錄音室錄製與混音時的最佳選擇\r\n全頻段無音染忠實呈現原音 實現正確音響監聽的監聽耳機', '', 10, '2022-11-12 02:41:30', 1),
(103, 9, 'Audio-Technica 鐵三角 ATH-M50x 專業型監聽耳機 黑/白色', 'Audio-Technica ATH-M50x.png', 7, 4800, '錄音室錄製與混音時的最佳選擇\r\n能滿足各種現場需求的專業監聽耳機 戴上它讓你成為全場亮點', '', 6, '2022-11-12 02:41:30', 1),
(104, 9, 'Audio-Technica 鐵三角 M20xBT 無線耳罩式耳機', 'Audio-Technica M20xBT.jpeg', 7, 2650, '搭載使用強力磁鐵的Ø40mmCCAW音圈驅動單元，\r\n將監聽級耳機寬廣的音域與高解析的音質表現化為無線，攜帶更方便。\r\n將世界認可的音質化為無線 追求使用便利性的輕量款機種', '', 4, '2022-11-12 02:41:30', 1),
(105, 9, 'Audio-Technica 鐵三角 M50xMO 專業型監聽耳機', 'Audio-Technica M50xMO.png', 7, 5800, '限定色票選中最受歡迎的 亮橙色限定款\r\n能滿足各種現場需求的專業監聽耳機 戴上它讓你成為全場亮點', '', 5, '2022-11-12 02:41:30', 1),
(106, 9, 'Austrian Audio Hi-X15 封閉式耳罩式耳機', 'Austrian Audio Hi-X15.jpeg', 7, 4200, '耳機設計 低抗阻 ‧ 易推動 可摺收納式設計 讓您好收納 不佔空間 監聽耳機入門首選\r\n此款 Hi-X15 封閉式耳罩式耳機是一款最經濟實惠的 Studio 級耳機。', '', 6, '2022-11-12 02:41:30', 1),
(107, 9, 'Austrian Audio HI-X60 封閉式 耳罩式耳機', 'Austrian Audio HI-X60.jpeg', 7, 12800, '是一款用於錄音、混音、母帶製作、控台監聽的專業級耳機。\r\nAustrian Audio 在成功的Hi-X6 耳機系列，擴充了最新耳機型號HI-X60！', '', 4, '2022-11-12 02:41:30', 1),
(108, 9, 'Beyerdynamic DT150 250ohms 監聽耳機', 'Beyerdynamic DT150 250ohms.jpeg', 7, 6000, 'DT150是適用於廣播、影視製作、錄音室的專業封閉式監聽耳機。\r\n德國百年傳奇耳機。', '', 8, '2022-11-12 02:41:30', 1),
(109, 9, 'Beyerdynamic DT250 PRO 80ohms 監聽耳機', 'Beyerdynamic DT250 PRO 80ohms.jpeg', 7, 6000, 'DT 250有著柔軟服貼的耳墊， 使您佩戴一整天也同樣感覺舒適。\r\n', '', 10, '2022-11-12 02:41:30', 1),
(110, 9, 'Beyerdynamic DT700 PRO X 48 ohms 封閉式監聽耳機', 'Beyerdynamic DT700 PRO X 48 ohms.jpeg', 7, 9400, '提供出色的隔音效果 更好的驅動彈性和性能潛力，突破傳統動圈單元技術高度，\r\n平滑細膩的高頻重現真實自然。', '', 5, '2022-11-12 02:41:30', 1),
(111, 9, 'Beyerdynamic DT770 PRO 80ohms 監聽耳機', 'Beyerdynamic DT770 PRO 80ohms.jpeg', 7, 6300, '廣泛使用於錄音室的經典封閉式耳機，精準、平衡具有極高的聲音分辨率和非常透明的聲音。\r\n', '', 5, '2022-11-12 02:41:30', 1),
(112, 9, 'Beyerdynamic DT770 PRO 250ohms 監聽耳機', 'Beyerdynamic DT770 PRO 250ohms.jpeg', 7, 6300, '廣泛使用於錄音室的經典封閉式耳機，精準、平衡具有極高的聲音分辨率和非常透明的聲音。\r\n', '', 2, '2022-11-12 02:41:30', 1),
(113, 9, 'Beyerdynamic DT770M 80ohms 監聽耳機', 'Beyerdynamic DT770M 80ohms.jpeg', 7, 6900, '動圈構造的DT 770 M是專為鼓手和FOH監聽用途而設計的封閉式耳機\r\n', '', 3, '2022-11-12 02:41:30', 1),
(114, 9, 'Beyerdynamic DT880 Edition 250ohms 監聽耳機', 'Beyerdynamic DT880 Edition 250ohms.jpeg', 7, 6800, 'DT880，白金級半開放式耳機，組合了開放式及封閉式耳機的優點', '', 8, '2022-11-12 02:41:30', 1),
(115, 9, 'Beyerdynamic DT900 PRO X 48 ohms 全開放式監聽耳機', 'Beyerdynamic DT900 PRO X 48 ohms.jpeg', 7, 9400, '提供出色的隔音效果 更好的驅動彈性和性能潛力 突破傳統動圈單元技術高度 平滑細膩的高頻重現真實自然\r\n', '', 4, '2022-11-12 02:41:30', 1),
(116, 9, 'Beyerdynamic DT990 PRO 250ohms 監聽耳機', 'Beyerdynamic DT990 PRO 250ohms.jpeg', 7, 6300, '開放式耳機DT 990 PRO有著極寬的頻響範圍，5Hz - 35,000Hz，由於是開放式耳機，用戶可以感受到周圍環境的聲音。\r\n', '', 3, '2022-11-12 02:41:30', 1),
(117, 9, 'Beyerdynamic DT1770 PRO 250ohms 監聽耳機', 'Beyerdynamic DT1770 PRO 250ohms.jpeg', 7, 17900, 'DT 1770 PRO是一款適合音樂家，聲音工程師，專業錄音監聽和音樂愛好者的參考級封閉式耳機。', '', 7, '2022-11-12 02:41:30', 1),
(118, 9, 'Electro Harmonix NYC CANS 藍芽耳罩式耳機', 'Electro Harmonix NYC CANS.jpeg', 7, 1480, '是一款擁有Electro-Harmonix 經典聲音表現的藍芽耳罩耳機，\r\n極輕量級和高舒適度的耳罩式耳機。', '', 5, '2022-11-12 02:41:30', 1),
(119, 9, 'SENNHEISER HD 300 PRO 專業級監聽耳機', 'SENNHEISER HD 300 PRO.jpeg', 7, 8900, '高水平的佩戴舒適度和有效的環境噪音衰減確保不會干擾您的注意力。\r\nHD 300新開發的聲學系統可實現中性、細膩的聲音再現。', '', 6, '2022-11-12 02:41:30', 1),
(120, 9, 'Superlux HD681 半開放耳罩式動圈式耳機', 'Superlux HD681.jpeg', 7, 650, '精準及透明具細節音色。', '', 3, '2022-11-12 02:41:30', 1),
(121, 10, 'IK Multimedia iLoud Micro Monitor 監聽喇叭 多色款', 'IK Multimedia iLoud Micro Monitor.jpeg', 7, 13800, '用世界最小的監聽音箱聆聽真實的聲音，小機身大能量 非常適合小錄音室，超便攜高品質錄音棚參考監聽音箱。', '', 5, '2022-11-12 04:12:02', 1),
(122, 10, 'IK Multimedia iLoud MTM 監聽喇叭 黑/白兩色(單支)', 'IK Multimedia iLoud MTM.jpeg', 7, 14950, '提供給現今錄音室指標性的監聽喇叭音色、準確性以及便利性。', '', 5, '2022-11-12 04:12:02', 1),
(123, 10, 'ISOACOUSTIC ISO-155 監聽喇叭架 七吋以下適用', 'ISOACOUSTIC ISO-155 7down.gif', 7, 4200, '三點特色可以讓高頻更加乾淨、中低頻更加緊實、有效改善音場定位、將您的監聽喇叭潛力徹底解放。', '', 6, '2022-11-12 04:12:02', 1),
(124, 10, 'ISOACOUSTIC ISO-200 監聽喇叭架 中型監聽喇叭適用', 'ISOACOUSTIC ISO-200.gif', 7, 6000, '三點特色\r\n可以讓高頻更加乾淨、中低頻更加緊實、有效改善音場定位、將您的監聽喇叭潛力徹底解放。', '', 4, '2022-11-12 04:12:02', 1),
(125, 10, 'MACKIE CR3-XBT 三吋 藍芽監聽喇叭 一對', 'MACKIE CR3-XBT.jpeg', 7, 5900, '多年來 MACKIE 以優質的錄音室監聽喇叭聞名\r\n全新推出的CR3-XBT 以實惠的價格，提供超越同級價位品質的聲音！\r\n50瓦輸出，D類放大器，高效優異表現', '', 9, '2022-11-12 04:12:02', 1),
(126, 10, 'Marshall Acton BT II 藍芽喇叭音箱 經典黑色款', 'Marshall Acton BT II.jpeg', 7, 11900, '精緻荔枝紋皮革金屬旋鈕經典設計', '', 5, '2022-11-12 04:12:02', 1),
(127, 10, 'NEUMANN KH-80 監聽喇叭一對', 'NEUMANN KH-80.jpeg', 7, 32900, '只要透過網路自動控制連接KH80 DSP，讓喇叭給予您空間真正的聲音。\r\n', '', 4, '2022-11-12 04:12:02', 1),
(128, 10, 'NEUMANN KH120 A 監聽喇叭 一對', 'NEUMANN KH120 A.jpeg', 7, 48000, '除了其出色的聲學特性外，這款低音還提供非基於 DSP 的 Neumann 監聽器連接（模擬）到其輸出的功能。\r\n適合在近距離的監聽使用，例如廣播、後製、混音等，同時也可使用數位輸入（D version）。', '', 5, '2022-11-12 04:12:02', 1),
(129, 10, 'Presonus E5 XT 專業五吋監聽喇叭 一對', 'Presonus E5 XT.jpeg', 7, 14000, 'Eris XT錄音室監聽器適用於家庭錄音室和專業混音工程，將立體聲音頻質量與您期望的PreSonus靈活的調音和連接功能相結合。\r\nEris XT錄音室監聽器適用於家庭錄音室和專業混音工程', '', 6, '2022-11-12 04:12:02', 1),
(130, 10, 'PreSonus Eris E3.5 監聽喇叭 (一對)', 'PreSonus Eris E3.5-1.jpeg', 7, 5000, '厚實低頻與均衡\r\n乾淨全面的低音單體', '', 4, '2022-11-12 04:12:02', 1),
(131, 10, 'TANNOY GOLD 5 監聽喇叭 一對', 'TANNOY GOLD 5.jpeg', 7, 209000, '無論您是錄製、編輯、混音還是母帶製作，\r\n真正出色的錄音室在挑選監聽喇叭方面一向 都是謹慎且嚴格的。\r\n旨在滿足專業人士在錄音、廣播和後期製作環境中的嚴格需求', '', 3, '2022-11-12 04:12:02', 1),
(132, 10, 'YAMAHA HS5M HS5MW 主動式監聽喇叭 5吋 一對 黑色 白色款', 'YAMAHA HS5M HS5MW.jpeg', 7, 17500, 'HS 系列全新開發的喇叭單體可在多種頻段上實現驚人的平滑響應。', '', 6, '2022-11-12 04:12:02', 1),
(133, 10, 'YAMAHA HS8 八吋二音路主動式錄音室監聽喇叭(支)', 'YAMAHA HS8.jpeg', 7, 12400, '二音路低音反射式雙擴大機近場錄音室監聽喇叭，配備8” 錐形低音單體和1”9半球形高音單體。', '', 9, '2022-11-12 04:12:02', 1),
(134, 10, 'YAMAHA MSP3A 主動式監聽喇叭 (顆)', 'YAMAHA MSP3A.jpeg', 7, 8200, '輕巧的箱體與真實的音色 可忠實重現音色的輕便型監聽喇叭 更簡潔且美觀的設計\r\n僅重 3.6 公斤', '', 10, '2022-11-12 04:12:02', 1),
(135, 11, 'ALCTRON BC800V2 動圈錄音直播麥克風', 'ALCTRON BC800V2.jpeg', 7, 4850, '超心型的動圈麥克風在拾音的過程中能夠減少環境噪聲錄入， 聲音清晰純淨。\r\n動圈播音麥克風提供心型指向拾音模式\r\n', '', 5, '2022-11-12 04:50:45', 1),
(136, 11, 'ALCTRON CM6X 大振膜直播錄音 XLR 電容麥克風', 'ALCTRON CM6X.jpeg', 7, 4950, '34mm 大振膜電容音頭比小振膜呈現更高的靈敏度，更寬的頻響範圍鍍金工藝比\r\n普通的大振膜讓中高頻細節更豐富,，品質更高。', '', 7, '2022-11-12 04:50:45', 1),
(137, 11, 'ALCTRON PM88 動圈式麥克風', 'ALCTRON PM88.jpeg', 7, 2500, '無論是室內、室外、唱歌、演講， PM88 是價格實惠的選擇。\r\nPM88 是一款心型動圈式麥克風，主要應用於錄音等領域。', '', 9, '2022-11-12 04:50:45', 1),
(138, 11, 'audio-technica AT2040 Podcast用超心形指向性麥克風', 'audio-technica AT2040 Podcast.jpeg', 7, 3000, 'XLR輸出支援常見錄音及需求，專用一體式避振架設計內部濾音防風罩設計，超心形指向收音，可抑制側邊及後方的環境音。', '', 10, '2022-11-12 04:50:45', 1),
(139, 11, 'Austrian Audio OD303 動圈式麥克風', 'Austrian Audio OD303.jpeg', 7, 4200, 'Austrian Audio 最新推出，專為舞台設計的人聲麥克風！', '', 11, '2022-11-12 04:50:45', 1),
(140, 11, 'Austrian Audio OD505 主動式動圈麥克風', 'Austrian Audio OD505.jpeg', 7, 9000, '採用雙音頭設計，由主動式音頭與被動式音頭組成 演唱和Podcast的完美選擇，不受舞台上噪音的影響。', '', 5, '2022-11-12 04:50:45', 1),
(141, 11, 'Beyerdynamic TG D70 MKII 大鼓收音麥克風', 'Beyerdynamic TG D70 MKI.jpeg', 7, 8300, '超心型指向讓收音範圍更加集中，提供溫暖飽滿的中低音，\r\n絕佳噪聲隔離和抑制回授能力。', '', 6, '2022-11-12 04:50:45', 1),
(142, 11, 'Beyerdynamic TGI51 樂器收音麥克風', 'Beyerdynamic TGI51.jpeg', 7, 4500, '動圈式麥克風（心型指向）\r\n', '', 8, '2022-11-12 04:50:45', 1),
(143, 11, 'RODE NT1 KIT 振膜電容麥克風套裝組', 'RODE NT1 KIT.jpeg', 7, 12800, '最先進的表面貼裝電路\r\nNT1是RØDE的一款革命性的振膜電容麥克風。', '', 9, '2022-11-12 04:50:45', 1),
(144, 11, 'RODE NT2A 電容式麥克風套裝組', 'RODE NT2A.jpeg', 7, 14700, '極美精緻的外表加上完美音質的演出，RODE 讓你的工作室變身成為專業錄音室。\r\n套裝內容： NT2A、防噴罩、防震架、XLR線、防塵套、麥克風收藏袋、麥克風夾', '', 4, '2022-11-12 04:50:45', 1),
(145, 11, 'RODE NT5MP Matched Pair 電容式麥克風組', 'RODE NT5MP Matched Pair.jpeg', 7, 15700, '採用堅固耐用鍍鎳外層，可做為一個單一的麥克風或聲學匹配對。\r\n', '', 12, '2022-11-12 04:50:45', 1),
(146, 11, 'RODE NT-USB Mini 電容USB麥克風', 'RODE NT-USB Mini.jpeg', 7, 4200, 'NT-USB Mini功能強大、使用上也相對容易，適合電競遊戲玩家、直播網紅、音樂人、商務專業人士使用\r\nRODE NT-USB Mini 時尚小巧的USB麥克風', '', 5, '2022-11-12 04:50:45', 1),
(147, 11, 'RODE Video Micro 微型指向性麥克風', 'RODE Video Micro.jpeg', 7, 2550, '包裝內還包含 WS9 毛製防風罩，專門為風大以及吵雜的室外環境設計，防止噪音干擾錄音質量。\r\nVideoMicro 可以有效減少不需要的環境音，確保錄製品質。 機身採用全鋁製成，堅固又耐用。', '', 2, '2022-11-12 04:50:45', 1),
(148, 11, 'RODE VideoMic NTG 收音麥克風', 'RODE VideoMic NTG.jpeg', 7, 8900, '集結許多革命性技術的 VideoMic NTG 可以說是世界上最好的槍式麥克風之一。\r\n', '', 7, '2022-11-12 04:50:45', 1),
(149, 11, 'Sennheiser E865S 超心型電容麥克風', 'Sennheiser E865S.jpeg', 7, 8280, '論聲音是遠或近E865靈敏度極高的振膜，能拾取演唱的每個細節，輕鬆地將極致的動態傳遞到信號鏈中。\r\n', '', 9, '2022-11-12 04:50:45', 1),
(150, 11, 'Sennheiser E901 電容式大鼓專用麥克風', 'Sennheiser E901.jpeg', 7, 8900, '擺放方式非常簡單：只需放上去即可。 前置放大器和鍍金的 XLR 連接頭足以證明它在舞台上的重要性及實用性！\r\nE901 為用於收取由大鼓發出精確、快速又逼真聲音的電容式麥克風。', '', 10, '2022-11-12 04:50:45', 1),
(151, 11, 'Sennheiser E914 電容麥克風 樂器收音專用', 'Sennheiser E914.jpeg', 7, 15400, '出色的聲音特性，適用於吉他、鈸、打擊樂器、架空樂器、弦樂、鋼琴等高度複雜的應用。\r\n', '', 12, '2022-11-12 04:50:45', 1),
(152, 11, 'Sennheiser E965 高端旗艦電容式麥克風', 'Sennheiser E965.jpeg', 7, 14800, 'E965 結合了頂級錄音室及舞台麥克風的優勢，具高清晰度、多層次的聲音，以及高度回音抑制和極為堅固的設計。', '', 5, '2022-11-12 04:50:45', 1),
(153, 11, 'YAMAHA YCM01 電容式麥克風 黑/白 兩色款', 'YAMAHA YCM01.jpeg', 7, 5000, '錄音室品質的電容式麥克風，採用心型指向以提供更集中的靈敏度。', '', 6, '2022-11-12 04:50:45', 1),
(154, 11, 'AKG P5S 動圈式麥克風', 'AKG P5S.jpeg', 7, 2800, 'P5S 採用結實的金屬機身，可以應付許多嚴酷的表演環境。\r\n高性能的動圈式麥克風，它專為使用者提供強而有力的聲音。', '', 2, '2022-11-12 04:50:45', 1),
(155, 8, 'JIM DUNLOP JDGP-41R 0.46mm(三片)', 'JIM DUNLOP JDGP-41R 0.46mm.jpeg', 7, 45, '厚度為 0.46 mm 厚度\r\n彈片為三片出貨單位', '', 190, '2022-11-12 05:48:23', 1),
(156, 8, 'JIM DUNLOP JDGP-45RFT 1.0mm(三片)', 'JIM DUNLOP JDGP-45RFT 1.0mm.jpeg', 7, 90, '厚度為 1.0 mm 厚度\r\n彈片為三片出貨單位', '', 154, '2022-11-12 05:48:23', 1),
(157, 8, 'JIM DUNLOP JDGP-47R1S 1.1mm(三片)', 'JIM DUNLOP JDGP-47R1S 1.1mm.jpeg', 7, 45, '特殊的邊緣角度設計讓彈奏上可以，更完美的呈現出您彈奏的技巧。\r\n彈片為三片出貨單位。', '', 168, '2022-11-12 05:48:23', 1),
(158, 8, 'JIM DUNLOP JDGP-418R 0.50mm(三片)', 'JIM DUNLOP JDGP-418R 0.50mm.jpeg', 7, 45, '0.50 適合拿來彈奏木吉他 彈性很好\r\n彈片為三片為出貨單位', '', 170, '2022-11-12 05:48:23', 1),
(159, 8, 'JIM DUNLOP JDGP-418R 0.73mm(三片)', 'JIM DUNLOP JDGP-418R 0.73mm.jpeg', 7, 45, 'Tortex Picks非常耐用，具有極佳的記憶力和恰到好處的靈活性，明亮清爽流暢度佳\r\n厚度0.73mm\r\n彈片為三片為出貨單位', '', 155, '2022-11-12 05:48:23', 1),
(160, 8, 'JIM DUNLOP JDGP-418R 0.88mm(三片)', 'JIM DUNLOP JDGP-418R 0.88mm.jpeg', 7, 45, '彈片厚度 0.88mm\r\n彈片為三片為出貨單位', '', 149, '2022-11-12 05:48:23', 1),
(161, 8, 'JIM DUNLOP JDGP-446R 0.53mm 夜光（三片)', 'JIM DUNLOP JDGP-446R 0.53mm.jpeg', 7, 45, '螢光特色 彈片厚度 0.53mm\r\n彈片為三片為出貨單位', '', 98, '2022-11-12 05:48:23', 1),
(162, 8, 'JIM DUNLOP JDGP-449R 0.88mm(三片)', 'JIM DUNLOP JDGP-449R 0.88mm.jpeg', 7, 45, '特殊的外型邊緣等設計加上軟硬度適中，可以增加彈奏速度以及準確性\r\nMAX GRIP 的特殊尼龍彈片設計增加強大的防滑面', '', 250, '2022-11-12 05:48:23', 1),
(163, 8, 'JIM DUNLOP JDGP-449R 1.5mm(三片)', 'JIM DUNLOP JDGP-449R 1.5mm.jpeg', 7, 45, '彈片厚度 1.5mm\r\n彈片為三片為出貨單位', '', 210, '2022-11-12 05:48:23', 1),
(164, 8, 'JIM DUNLOP JDGP-462R 0.50mm(三片)', 'JIM DUNLOP JDGP-462R 0.50mm.jpeg', 7, 45, '彈片厚度 0.60mm\r\n彈片為三片為出貨單位', '', 140, '2022-11-12 05:48:23', 1),
(165, 8, 'JIM DUNLOP JDGP-472RM3 0.88mm(三片)', 'JIM DUNLOP JDGP-472RM3 0.88mm.jpeg', 7, 45, 'Tortex 是 Jim Dunlop 最廣為樂手使用的彈片\r\n彈片厚度 0.88mm\r\n彈片為三片為出貨單位', '', 176, '2022-11-12 05:48:23', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `product_add`
--

CREATE TABLE `product_add` (
  `id` int(6) NOT NULL,
  `product_id` int(6) NOT NULL,
  `product_discount` int(2) NOT NULL COMMENT '95折扣'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='加購商品';

-- --------------------------------------------------------

--
-- 資料表結構 `product_category`
--

CREATE TABLE `product_category` (
  `id` int(6) UNSIGNED NOT NULL,
  `category_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分類名稱',
  `product_valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='產品分類';

--
-- 傾印資料表的資料 `product_category`
--

INSERT INTO `product_category` (`id`, `category_name`, `product_valid`) VALUES
(1, '電子琴', 1),
(2, '電鋼琴', 1),
(3, '木吉他', 1),
(4, '木鼓箱', 1),
(5, '貝斯', 1),
(6, '烏克麗麗', 1),
(7, '爵士鼓', 1),
(8, 'Pick專區', 1),
(9, '耳機', 1),
(10, '音響', 1),
(11, '麥克風', 1),
(12, '清潔保養', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `product_color`
--

CREATE TABLE `product_color` (
  `id` int(6) UNSIGNED NOT NULL,
  `color_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rgb` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '顏色色碼'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='產品顏色';

--
-- 傾印資料表的資料 `product_color`
--

INSERT INTO `product_color` (`id`, `color_name`, `rgb`) VALUES
(1, '黑色', '#000000'),
(2, '白色', '#ffffff'),
(3, '灰色', ''),
(4, '棕色', '#A05839'),
(5, '紅色', ''),
(6, '紫色', ''),
(7, '粉紅色', '#F46E62'),
(8, '藍色', ''),
(9, '金色', ''),
(10, '橘色', '#FF9900'),
(11, '綠色', ''),
(12, '黃色', '');

-- --------------------------------------------------------

--
-- 資料表結構 `product_color_detail`
--

CREATE TABLE `product_color_detail` (
  `id` int(6) NOT NULL,
  `product_id` int(6) NOT NULL,
  `color_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品的多種顏色';

--
-- 傾印資料表的資料 `product_color_detail`
--

INSERT INTO `product_color_detail` (`id`, `product_id`, `color_id`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `product_img`
--

CREATE TABLE `product_img` (
  `id` int(6) UNSIGNED NOT NULL,
  `product_id` int(6) NOT NULL,
  `src` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '圖片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='產品圖片';

--
-- 傾印資料表的資料 `product_img`
--

INSERT INTO `product_img` (`id`, `product_id`, `src`) VALUES
(1, 10, '20221115-033335_Alesis Prestige 88-1.jpeg'),
(2, 10, '20221115-033335_Alesis Prestige 88-2.jpeg'),
(3, 10, '20221115-033335_Alesis Prestige 88-3.jpeg'),
(4, 10, '20221115-033335_Alesis Prestige 88-4.jpeg'),
(5, 1, '20221115-033415_CASIO CT-S1 61-3-black.jpeg'),
(6, 1, '20221115-033419_CASIO CT-S1 61-1-white.jpeg'),
(7, 1, '20221115-033423_CASIO CT-S1 61-2-red.jpeg'),
(8, 1, '20221115-033426_CASIO CT-S1 61-4.jpeg'),
(9, 2, '20221115-033436_CASIO CT-S300 61-1.jpeg'),
(10, 2, '20221115-033436_CASIO CT-S300 61-2.jpeg'),
(11, 2, '20221115-033436_CASIO CT-S300 61-3.jpeg'),
(12, 2, '20221115-033436_CASIO CT-S300 61-4.jpeg'),
(13, 3, '20221115-033447_CASIO CT-S400 61-1.jpeg'),
(14, 3, '20221115-033447_CASIO CT-S400 61-2.jpeg'),
(15, 3, '20221115-033447_CASIO CT-S400 61-3.jpeg'),
(16, 4, '20221115-033457_CASIO LK-S250 61-1.jpeg'),
(17, 4, '20221115-033457_CASIO LK-S250 61-2.jpeg'),
(18, 4, '20221115-033503_CASIO LK-S250 61-4.jpeg'),
(19, 4, '20221115-033503_CASIO LK-S250 61-5.jpeg'),
(20, 5, '20221115-033514_YAMAHA PSR-E273 61-1.jpeg'),
(21, 5, '20221115-033514_YAMAHA PSR-E273 61-2.jpeg'),
(22, 5, '20221115-033518_YAMAHA PSR-E273 61-5.jpeg'),
(23, 5, '20221115-033518_YAMAHA PSR-E273 61-6.jpeg'),
(24, 6, '20221115-033528_YAMAHA PSR-E373 61-1.jpeg'),
(25, 6, '20221115-033531_YAMAHA PSR-E373 61-3.jpeg'),
(26, 6, '20221115-033534_YAMAHA PSR-E373 61-4.jpeg'),
(27, 6, '20221115-033534_YAMAHA PSR-E373 61-5.jpeg'),
(28, 7, '20221115-033545_YAMAHA PSR-E473 61-1.jpeg'),
(29, 7, '20221115-033545_YAMAHA PSR-E473 61-2.jpeg'),
(30, 7, '20221115-033545_YAMAHA PSR-E473 61-3.jpeg'),
(31, 7, '20221115-033550_YAMAHA PSR-E473 61-5.jpeg'),
(32, 8, '20221115-033601_YAMAHA PSR-SX900 61-1.jpeg'),
(33, 8, '20221115-033601_YAMAHA PSR-SX900 61-2.jpeg'),
(34, 8, '20221115-033601_YAMAHA PSR-SX900 61-3.jpeg'),
(35, 8, '20221115-033605_YAMAHA PSR-SX900 61-8.jpeg'),
(36, 9, '20221115-033615_YAMAHA PSS-E30-1.jpeg'),
(37, 9, '20221115-033615_YAMAHA PSS-E30-2.jpeg'),
(38, 9, '20221115-033618_YAMAHA PSS-E30-4.jpeg'),
(39, 9, '20221115-033618_YAMAHA PSS-E30-5.jpeg'),
(40, 11, '20221115-033639_Artesia A-61 61-1.jpeg'),
(41, 11, '20221115-033639_Artesia A-61 61-2.jpeg'),
(42, 11, '20221115-033639_Artesia A-61 61-3.jpeg'),
(43, 11, '20221115-033639_Artesia A-61 61-4.jpeg'),
(44, 12, '20221115-033654_Artesia PE-88 88-1.jpeg'),
(45, 12, '20221115-033654_Artesia PE-88 88-2.jpeg'),
(46, 12, '20221115-033654_Artesia PE-88 88-6.jpeg'),
(47, 13, '20221115-033708_CASIO AP-270 88-5.jpeg'),
(48, 13, '20221115-033708_CASIO AP-270 88-8-grown.jpeg'),
(49, 13, '20221115-033709_CASIO AP-270 88-9-white.jpeg'),
(50, 13, '20221115-033709_CASIO AP-270 88-10-black.jpeg'),
(51, 14, '20221115-033723_CASIO AP-470 88-4.png'),
(52, 14, '20221115-033723_CASIO AP-470 88-7-grown.jpeg'),
(53, 14, '20221115-033723_CASIO AP-470 88-8-white.jpeg'),
(54, 14, '20221115-033723_CASIO AP-470 88-9-black.jpeg'),
(55, 15, '20221115-033735_CASIO CDP-S110-1.jpeg'),
(56, 15, '20221115-033735_CASIO CDP-S110-2.jpeg'),
(57, 15, '20221115-033735_CASIO CDP-S110-5.jpeg'),
(58, 16, '20221115-033748_CASIO PX770 88-4.jpeg'),
(59, 16, '20221115-033748_CASIO PX770 88-7-grown.jpeg'),
(60, 16, '20221115-033748_CASIO PX770 88-8-white.jpeg'),
(61, 16, '20221115-033748_CASIO PX770 88-9-black.jpeg'),
(62, 17, '20221115-033810_CASIO PX870 88-3-black.jpeg'),
(63, 17, '20221115-033813_CASIO PX870 88-1-white.jpeg'),
(64, 17, '20221115-033816_CASIO PX870 88-7.jpeg'),
(65, 18, '20221115-033826_CASIO PX-S1100 BKWE 88-7.jpeg'),
(66, 18, '20221115-033826_CASIO PX-S1100 BKWE 88-10-black.jpeg'),
(67, 18, '20221115-033827_CASIO PX-S1100 BKWE 88-11-white.jpeg'),
(68, 19, '20221115-033843_CASIO PX-S3100 BK 88-1.jpeg'),
(69, 19, '20221115-033843_CASIO PX-S3100 BK 88-6.jpeg'),
(70, 20, '20221115-033908_CASIO PX870 88-1-white.jpeg'),
(71, 20, '20221115-033908_CASIO PX870 88-3-black.jpeg'),
(72, 20, '20221115-033908_CASIO PX870 88-7.jpeg'),
(73, 22, '20221115-033921_KORG B2SP 88-1-black.jpeg'),
(74, 22, '20221115-033921_KORG B2SP 88-3-white.jpeg'),
(75, 22, '20221115-033921_KORG B2SP 88-5.jpeg'),
(76, 23, '20221115-033938_KORG LP380 U 88-2-black.jpeg'),
(77, 23, '20221115-033938_KORG LP380 U 88-3-white.jpeg'),
(78, 23, '20221115-033938_KORG LP380 U 88-5-grown.jpeg'),
(79, 23, '20221115-033938_KORG LP380 U 88-6.jpeg'),
(80, 23, '20221115-033950_KORG LP380 U 88-4-purple.jpeg'),
(81, 24, '20221115-034005_KORG tinyPIANO 25-1.jpeg'),
(82, 24, '20221115-034005_KORG tinyPIANO 25-2.jpeg'),
(83, 24, '20221115-034005_KORG tinyPIANO 25-4.jpeg'),
(84, 24, '20221115-034005_KORG tinyPIANO 25-5.jpeg'),
(85, 25, '20221115-034021_aNueNue-M3-M3E-1.jpeg'),
(86, 25, '20221115-034021_aNueNue-M3-M3E-2.jpeg'),
(87, 25, '20221115-034021_aNueNue-M3-M3E-4.jpeg'),
(88, 25, '20221115-034021_aNueNue-M3-M3E-11.jpeg'),
(89, 26, '20221115-034032_aNueNue-M10E-1.jpeg'),
(90, 26, '20221115-034033_aNueNue-M10E-3.jpeg'),
(91, 26, '20221115-034033_aNueNue-M10E-11.jpeg'),
(92, 27, '20221115-034044_aNueNue-M10E-electric-1.jpeg'),
(93, 27, '20221115-034044_aNueNue-M10E-electric-5.jpeg'),
(94, 27, '20221115-034044_aNueNue-M10E-electric-6.jpeg'),
(95, 28, '20221115-034057_aNueNue-M10E-electric-1.jpeg'),
(96, 28, '20221115-034057_aNueNue-M10E-electric-5.jpeg'),
(97, 28, '20221115-034057_aNueNue-M10E-electric-6.jpeg'),
(98, 29, '20221115-034108_aNueNue-M12-1.jpeg'),
(99, 29, '20221115-034108_aNueNue-M12-5.jpeg'),
(100, 29, '20221115-034108_aNueNue-M12-6.jpeg'),
(101, 30, '20221115-034118_aNueNue-M20-M20E-1.jpeg'),
(102, 30, '20221115-034118_aNueNue-M20-M20E-3.jpeg'),
(103, 30, '20221115-034118_aNueNue-M20-M20E-11.jpeg'),
(104, 31, '20221115-034144_aNueNue-MC10-AM-BA-GG-L- QS-8-orange.jpeg'),
(105, 31, '20221115-034144_aNueNue-MC10-AM-BA-GG-L- QS-9-white.jpeg'),
(106, 31, '20221115-034144_aNueNue-MC10-AM-BA-GG-L- QS-10-gold.jpeg'),
(107, 31, '20221115-034144_aNueNue-MC10-AM-BA-GG-L- QS-11-blue.jpeg'),
(108, 31, '20221115-034144_aNueNue-MC10-AM-BA-GG-L- QS-12-gray.jpeg'),
(109, 32, '20221115-034159_aNueNue-MTK-Morelos-Blue-1.jpeg'),
(110, 32, '20221115-034200_aNueNue-MTK-Morelos-Blue-2.jpeg'),
(111, 32, '20221115-034200_aNueNue-MTK-Morelos-Blue-3.jpeg'),
(112, 33, '20221115-034209_aNueNue-MTK-Palawan-Sunrise-1.jpeg'),
(113, 33, '20221115-034209_aNueNue-MTK-Palawan-Sunrise-2.jpeg'),
(114, 33, '20221115-034209_aNueNue-MTK-Palawan-Sunrise-3.jpeg'),
(115, 33, '20221115-034209_aNueNue-MTK-Palawan-Sunrise-4.jpeg'),
(116, 34, '20221115-034218_aNueNue-MY10-1.jpeg'),
(117, 34, '20221115-034218_aNueNue-MY10-4.jpeg'),
(118, 34, '20221115-034218_aNueNue-MY10-6.jpeg'),
(119, 35, '20221115-034232_aNueNue-MY20-1.jpeg'),
(120, 35, '20221115-034232_aNueNue-MY20-2.jpeg'),
(121, 35, '20221115-034232_aNueNue-MY20-5.jpeg'),
(122, 36, '20221115-034245_LAVA ME 3 36-10-blue.jpeg'),
(123, 36, '20221115-034245_LAVA ME 3 36-11-pink.jpeg'),
(124, 36, '20221115-034245_LAVA ME 3 36-12-gray.jpeg'),
(125, 36, '20221115-034245_LAVA ME 3 36-13-white.jpeg'),
(126, 36, '20221115-034245_LAVA ME 3 36-14-gold.jpeg'),
(127, 36, '20221115-034245_LAVA ME 3 36-15-red.jpeg'),
(128, 37, '20221115-034256_LAVA Blue Touch 36-1.jpeg'),
(129, 37, '20221115-034256_LAVA Blue Touch 36-2.jpeg'),
(130, 37, '20221115-034256_LAVA Blue Touch 36-3.jpeg'),
(131, 37, '20221115-034256_LAVA Blue Touch 36-4.jpeg'),
(132, 37, '20221115-034256_LAVA Blue Touch 36-5.jpeg'),
(133, 38, '20221115-034308_LAVA Blue Original 36-1.jpeg'),
(134, 38, '20221115-034308_LAVA Blue Original 36-2.jpeg'),
(135, 38, '20221115-034308_LAVA Blue Original 36-6.jpeg'),
(136, 39, '20221115-034325_aNueNue-L30-L30E-1.jpeg'),
(137, 39, '20221115-034325_aNueNue-L30-L30E-3.jpeg'),
(138, 39, '20221115-034325_aNueNue-L30-L30E-8.jpeg'),
(139, 39, '20221115-034325_aNueNue-L30-L30E-10.jfif'),
(140, 40, '20221115-034343_LAVA-ME-PRO-2-gray.jpeg'),
(141, 40, '20221115-034343_LAVA-ME-PRO-3-gold.jpeg'),
(142, 40, '20221115-034343_LAVA-ME-PRO-4-gold.jpeg'),
(143, 40, '20221115-034343_LAVA-ME-PRO-5-gold.jpeg'),
(144, 41, '20221115-034400_SQOE-A2-V2-1.jpeg'),
(145, 41, '20221115-034400_SQOE-A2-V2-3.jpeg'),
(146, 41, '20221115-034400_SQOE-A2-V2-11.jpeg'),
(147, 41, '20221115-034400_SQOE-A2-V2-12.jpeg'),
(148, 42, '20221115-034413_SQOE-A940C-1.jpeg'),
(149, 42, '20221115-034413_SQOE-A940C-3.jpeg'),
(150, 42, '20221115-034413_SQOE-A940C-4.jpeg'),
(151, 42, '20221115-034413_SQOE-A940C-5.jpeg'),
(152, 43, '20221115-034425_SQOE-S360-FG-1.jpeg'),
(153, 43, '20221115-034425_SQOE-S360-FG-3.jpeg'),
(154, 43, '20221115-034425_SQOE-S360-FG-8.jpeg'),
(155, 43, '20221115-034425_SQOE-S360-FG-9.jpeg'),
(156, 44, '20221115-034436_SQOE-S370-FG-1.jpeg'),
(157, 44, '20221115-034436_SQOE-S370-FG-3.jpeg'),
(158, 44, '20221115-034436_SQOE-S370-FG-8.jpeg'),
(159, 44, '20221115-034436_SQOE-S370-FG-9.jpeg'),
(160, 45, '20221115-034450_SQOE-S460T-SK-1.jpeg'),
(161, 45, '20221115-034450_SQOE-S460T-SK-3.jpeg'),
(162, 45, '20221115-034450_SQOE-S460T-SK-9.jpeg'),
(163, 45, '20221115-034450_SQOE-S460T-SK-10.jpeg'),
(164, 46, '20221115-034459_SQOE SQ-C-BQJ-1.jpeg'),
(165, 46, '20221115-034459_SQOE SQ-C-BQJ-3.jpeg'),
(166, 46, '20221115-034459_SQOE SQ-C-BQJ-9.jpeg'),
(167, 46, '20221115-034459_SQOE SQ-C-BQJ-10.jpeg'),
(168, 47, '20221115-034510_SQOE-SQ-CC-SK-1.jpeg'),
(169, 47, '20221115-034510_SQOE-SQ-CC-SK-3.jpeg'),
(170, 47, '20221115-034510_SQOE-SQ-CC-SK-5.jpeg'),
(171, 47, '20221115-034510_SQOE-SQ-CC-SK-8.jpeg'),
(172, 48, '20221115-034522_SQOE-SQ-DC-SK-1.jpeg'),
(173, 48, '20221115-034522_SQOE-SQ-DC-SK-2.jpeg'),
(174, 48, '20221115-034522_SQOE-SQ-DC-SK-6.jpeg'),
(175, 48, '20221115-034522_SQOE-SQ-DC-SK-8.jpeg'),
(176, 49, '20221115-034545_YAMAHA-F310-1.jpeg'),
(177, 49, '20221115-034545_YAMAHA-F310-2.jpeg'),
(178, 49, '20221115-034545_YAMAHA-F310-4.jpeg'),
(179, 49, '20221115-034545_YAMAHA-F310-11.jpeg'),
(180, 50, '20221115-034559_SBALAY-SCJ-2-4-NT.jpeg'),
(181, 50, '20221115-034559_SBALAY-SCJ-2-5-BK.jpeg'),
(182, 50, '20221115-034559_SBALAY-SCJ-2-6-RD.jpeg'),
(183, 51, '20221115-034611_SBALAY-SCJ-HPL-2.jpeg'),
(184, 51, '20221115-034611_SBALAY-SCJ-HPL-3.jpeg'),
(185, 51, '20221115-034611_SBALAY-SCJ-HPL-4.jpeg'),
(186, 52, '20221115-034621_CRAFTMAN-C-CJ1SN-2.jpeg'),
(187, 52, '20221115-034621_CRAFTMAN-C-CJ1SN-3.jpeg'),
(188, 52, '20221115-034621_CRAFTMAN-C-CJ1SN-4.jpeg'),
(189, 52, '20221115-034621_CRAFTMAN-C-CJ1SN-5.jpeg'),
(190, 54, '20221115-034645_Fender-MIJ-Hama-1.jpeg'),
(191, 54, '20221115-034645_Fender-MIJ-Hama-2.jpeg'),
(192, 54, '20221115-034646_Fender-MIJ-Hama-3.jpeg'),
(193, 54, '20221115-034646_Fender-MIJ-Hama-5.jpeg'),
(194, 55, '20221115-034658_Fender-MIJ-Hybrid-1.jpeg'),
(195, 55, '20221115-034658_Fender-MIJ-Hybrid-2.jpeg'),
(196, 55, '20221115-034658_Fender-MIJ-Hybrid-3.jpeg'),
(197, 55, '20221115-034658_Fender-MIJ-Hybrid-4.jpeg'),
(198, 56, '20221115-034708_Fender-MIJ-LTD-1.jpeg'),
(199, 56, '20221115-034708_Fender-MIJ-LTD-2.jpeg'),
(200, 56, '20221115-034708_Fender-MIJ-LTD-3.jpeg'),
(201, 56, '20221115-034708_Fender-MIJ-LTD-4.jpeg'),
(202, 57, '20221115-034718_Fender-MIJ-LTD-Traditional-1.jpeg'),
(203, 57, '20221115-034718_Fender-MIJ-LTD-Traditional-2.jpeg'),
(204, 57, '20221115-034718_Fender-MIJ-LTD-Traditional-3.jpeg'),
(205, 57, '20221115-034718_Fender-MIJ-LTD-Traditional-4.jpeg'),
(206, 58, '20221115-034727_Fender-MIJ-LTD-Traditional-II-70s-1.jpeg'),
(207, 58, '20221115-034728_Fender-MIJ-LTD-Traditional-II-70s-2.jpeg'),
(208, 58, '20221115-034728_Fender-MIJ-LTD-Traditional-II-70s-3.jpeg'),
(209, 58, '20221115-034728_Fender-MIJ-LTD-Traditional-II-70s-4.jpeg'),
(210, 59, '20221115-034737_Fender-MIJ-Traditonal-II-60s-J-Bass-RW-3TS-1.jpeg'),
(211, 59, '20221115-034737_Fender-MIJ-Traditonal-II-60s-J-Bass-RW-3TS-2.jpeg'),
(212, 59, '20221115-034737_Fender-MIJ-Traditonal-II-60s-J-Bass-RW-3TS-3.jpeg'),
(213, 59, '20221115-034737_Fender-MIJ-Traditonal-II-60s-J-Bass-RW-3TS-4.jpeg'),
(214, 60, '20221115-034747_Fender-MIJ-Traditonal-II-60s-J-Bass-RW-OWT-1.jpeg'),
(215, 60, '20221115-034747_Fender-MIJ-Traditonal-II-60s-J-Bass-RW-OWT-2.jpeg'),
(216, 60, '20221115-034747_Fender-MIJ-Traditonal-II-60s-J-Bass-RW-OWT-3.jpeg'),
(217, 60, '20221115-034747_Fender-MIJ-Traditonal-II-60s-J-Bass-RW-OWT-4.jpeg'),
(218, 61, '20221115-034803_IBANEZ-EHB1000-PWM-BASS-1.jpeg'),
(219, 61, '20221115-034803_IBANEZ-EHB1000-PWM-BASS-3.jpeg'),
(220, 61, '20221115-034803_IBANEZ-EHB1000-PWM-BASS-16.jpeg'),
(221, 62, '20221115-034813_IBANEZ-EHB1005MS-SFM-BASS-1.jpeg'),
(222, 62, '20221115-034813_IBANEZ-EHB1005MS-SFM-BASS-3.jpeg'),
(223, 62, '20221115-034813_IBANEZ-EHB1005MS-SFM-BASS-16.jpeg'),
(224, 63, '20221115-034826_IBANEZ SR300E-7-red.jpeg'),
(225, 63, '20221115-034826_IBANEZ SR300E-8-black.jpeg'),
(226, 63, '20221115-034826_IBANEZ SR300E-9-green.jpeg'),
(227, 63, '20221115-034827_IBANEZ SR300E-10-white.jpeg'),
(228, 64, '20221115-034839_IBANEZ SR300EB WK BASS-1.jpeg'),
(229, 64, '20221115-034839_IBANEZ SR300EB WK BASS-3.jpeg'),
(230, 64, '20221115-034839_IBANEZ SR300EB WK BASS-9.jpeg'),
(231, 65, '20221115-034849_IBANEZ SR1305SB-MGL BASS-1.jpeg'),
(232, 65, '20221115-034849_IBANEZ SR1305SB-MGL BASS-5.jpeg'),
(233, 65, '20221115-034849_IBANEZ SR1305SB-MGL BASS-12.jpeg'),
(234, 66, '20221115-034858_YAMAHA ATTITUDE LIMITED 3 Billy Sheehan BASS-1.jpeg'),
(235, 66, '20221115-034858_YAMAHA ATTITUDE LIMITED 3 Billy Sheehan BASS-2.jpeg'),
(236, 66, '20221115-034858_YAMAHA ATTITUDE LIMITED 3 Billy Sheehan BASS-3.jpeg'),
(237, 67, '20221115-034908_YAMAHA BB234-8-red.jpeg'),
(238, 67, '20221115-034908_YAMAHA BB234-9-white.jpeg'),
(239, 67, '20221115-034908_YAMAHA BB234-10-black.jpeg'),
(240, 67, '20221115-034908_YAMAHA BB234-11-yellow.jpeg'),
(241, 68, '20221115-034918_YAMAHA BB434 Bass-10.jfif'),
(242, 68, '20221115-034918_YAMAHA BB434 Bass-14-blue.jpeg'),
(243, 68, '20221115-034918_YAMAHA BB434 Bass-15-black.jpeg'),
(244, 68, '20221115-034918_YAMAHA BB434 Bass-16-blue+balck.jpeg'),
(245, 69, '20221115-034927_YAMAHA BB734AMTB BASS-1.jpeg'),
(246, 69, '20221115-034927_YAMAHA BB734AMTB BASS-2.jpeg'),
(247, 69, '20221115-034927_YAMAHA BB734AMTB BASS-3.jpeg'),
(248, 69, '20221115-034927_YAMAHA BB734AMTB BASS-4.jpeg'),
(249, 70, '20221115-034937_YAMAHA BBNE2 Nathan East-1.jpeg'),
(250, 70, '20221115-034937_YAMAHA BBNE2 Nathan East-2.jpeg'),
(251, 70, '20221115-034937_YAMAHA BBNE2 Nathan East-3.jpeg'),
(252, 71, '20221115-034947_YAMAHA TRB1005J-7-yellow.jpeg'),
(253, 71, '20221115-034947_YAMAHA TRB1005J-8-black.jpeg'),
(254, 71, '20221115-034947_YAMAHA TRB1005J-9-red.jpeg'),
(255, 71, '20221115-034947_YAMAHA TRB1005J-10-blackkk.jpeg'),
(256, 72, '20221115-035000_YAMAHA TRBX174 BASS-3.png'),
(257, 72, '20221115-035000_YAMAHA TRBX174 BASS-5-blue.jpeg'),
(258, 72, '20221115-035000_YAMAHA TRBX174 BASS-6-black.jpeg'),
(259, 72, '20221115-035000_YAMAHA TRBX174 BASS-7-red.jpeg'),
(260, 72, '20221115-035000_YAMAHA TRBX174 BASS-8-grown.jpeg'),
(261, 73, '20221115-035015_YAMAHA TRBX304 BASS-6-green.jpeg'),
(262, 73, '20221115-035015_YAMAHA TRBX304 BASS-7-whtie.jpeg'),
(263, 73, '20221115-035015_YAMAHA TRBX304 BASS-8-blue.jpeg'),
(264, 73, '20221115-035015_YAMAHA TRBX304 BASS-9-black.jpeg'),
(265, 73, '20221115-035015_YAMAHA TRBX304 BASS-10-red.jpeg'),
(266, 75, '20221115-035119_aNueNue Baby 900 17-2.png'),
(267, 75, '20221115-035119_aNueNue Baby 900 17-3.png'),
(268, 75, '20221115-035119_aNueNue Baby 900 17-4.png'),
(269, 75, '20221115-035119_aNueNue Baby 900 17-6.png'),
(270, 76, '20221115-035131_aNueNue Baby U -1.png'),
(271, 76, '20221115-035131_aNueNue Baby U -3.png'),
(272, 76, '20221115-035131_aNueNue Baby U -4.png'),
(273, 76, '20221115-035131_aNueNue Baby U -6.png'),
(274, 77, '20221115-035141_aNueNue 900S 21-1.jpeg'),
(275, 77, '20221115-035141_aNueNue 900S 21-3.jpeg'),
(276, 77, '20221115-035141_aNueNue 900S 21-4.jpeg'),
(277, 78, '20221115-035215_aNueNue K1 K1E 21-1.jpeg'),
(278, 78, '20221115-035215_aNueNue K1 K1E 21-5.jpeg'),
(279, 78, '20221115-035215_aNueNue K1 K1E 21-7.jpeg'),
(280, 79, '20221115-035225_aNueNue SS1 SS1E 21-1.jpeg'),
(281, 79, '20221115-035225_aNueNue SS1 SS1E 21-3.jpeg'),
(282, 79, '20221115-035225_aNueNue SS1 SS1E 21-8.jpeg'),
(283, 80, '20221115-035236_aNueNue TM1 21-1.jpeg'),
(284, 80, '20221115-035236_aNueNue TM1 21-6.jpeg'),
(285, 80, '20221115-035236_aNueNue TM1 21-7.jpeg'),
(286, 81, '20221115-035247_aNueNue K2 K2E 23-1.jpeg'),
(287, 81, '20221115-035247_aNueNue K2 K2E 23-4.jpeg'),
(288, 81, '20221115-035247_aNueNue K2 K2E 23-6.jpeg'),
(289, 82, '20221115-035255_aNueNue MTK Kona Sky 23-1.jpeg'),
(290, 82, '20221115-035255_aNueNue MTK Kona Sky 23-3.jpeg'),
(291, 83, '20221115-035309_aNueNue SS2 SS2E 23-1.jpeg'),
(292, 83, '20221115-035309_aNueNue SS2 SS2E 23-5.jpeg'),
(293, 83, '20221115-035309_aNueNue SS2 SS2E 23-8.jpg'),
(294, 85, '20221115-035331_aNueNue K3 K3E 26-1.jpeg'),
(295, 85, '20221115-035331_aNueNue K3 K3E 26-4.jpeg'),
(296, 85, '20221115-035331_aNueNue K3 K3E 26-7.jpeg'),
(297, 86, '20221115-035342_aNueNue SS3 SS3E 26-1.jpeg'),
(298, 86, '20221115-035342_aNueNue SS3 SS3E 26-5.jpeg'),
(299, 86, '20221115-035342_aNueNue SS3 SS3E 26-8.jpeg'),
(300, 87, '20221115-035351_aNueNue TM3 TM3E 26-1.jpeg'),
(301, 87, '20221115-035351_aNueNue TM3 TM3E 26-8.jpeg'),
(302, 88, '20221115-035430_SQOE SQ-UK604-1.jpeg'),
(303, 88, '20221115-035430_SQOE SQ-UK604-4.jpeg'),
(304, 89, '20221115-035439_SQOE SQ-UK651-1.jpeg'),
(305, 89, '20221115-035439_SQOE SQ-UK651-4.jpeg'),
(306, 90, '20221115-035451_MAPEX ARMORY AR529S-1.jpeg'),
(307, 90, '20221115-035451_MAPEX ARMORY AR529S-2.jpeg'),
(308, 90, '20221115-035451_MAPEX ARMORY AR529S-3.jpeg'),
(309, 90, '20221115-035451_MAPEX ARMORY AR529S-4.jpeg'),
(310, 90, '20221115-035451_MAPEX ARMORY AR529S-5.jpeg'),
(311, 90, '20221115-035451_MAPEX ARMORY AR529S-6.jpg'),
(312, 91, '20221115-035504_MAPEX STORM ST5295F-1-black.jpeg'),
(313, 91, '20221115-035504_MAPEX STORM ST5295F-2.jpeg'),
(314, 91, '20221115-035504_MAPEX STORM ST5295F-3.jpeg'),
(315, 91, '20221115-035504_MAPEX STORM ST5295F-4.jpeg'),
(316, 91, '20221115-035504_MAPEX STORM ST5295F-5-red.jpeg'),
(317, 92, '20221115-035513_TAMA IMPERIALSTAR IE52KH6W 5PCS-1.jpeg'),
(318, 92, '20221115-035513_TAMA IMPERIALSTAR IE52KH6W 5PCS-2.jpeg'),
(319, 92, '20221115-035513_TAMA IMPERIALSTAR IE52KH6W 5PCS-3.jpeg'),
(320, 92, '20221115-035513_TAMA IMPERIALSTAR IE52KH6W 5PCS-4.jpeg'),
(321, 92, '20221115-035513_TAMA IMPERIALSTAR IE52KH6W 5PCS-5.jpeg'),
(322, 92, '20221115-035513_TAMA IMPERIALSTAR IE52KH6W 5PCS-6.jpeg'),
(323, 93, '20221115-035523_TAMA MBS42S-CAR STARCLASSIC-1.jpeg'),
(324, 93, '20221115-035523_TAMA MBS42S-CAR STARCLASSIC-2.jpeg'),
(325, 93, '20221115-035523_TAMA MBS42S-CAR STARCLASSIC-3.jpeg'),
(326, 93, '20221115-035523_TAMA MBS42S-CAR STARCLASSIC-4.jpeg'),
(327, 94, '20221115-035533_TAMA Starclassic WB WBS42S-SPF CR WMTH1000-1.jpeg'),
(328, 94, '20221115-035533_TAMA Starclassic WB WBS42S-SPF CR WMTH1000-2.jpeg'),
(329, 94, '20221115-035533_TAMA Starclassic WB WBS42S-SPF CR WMTH1000-11.jpeg'),
(330, 95, '20221115-035541_TAMA Superstar Classic CL52KRS-1.jpeg'),
(331, 95, '20221115-035541_TAMA Superstar Classic CL52KRS-2.jpeg'),
(332, 95, '20221115-035541_TAMA Superstar Classic CL52KRS-3.jpeg'),
(333, 95, '20221115-035541_TAMA Superstar Classic CL52KRS-4.jpeg'),
(334, 95, '20221115-035541_TAMA Superstar Classic CL52KRS-5.jpeg'),
(335, 95, '20221115-035541_TAMA Superstar Classic CL52KRS-6.jpeg'),
(336, 96, '20221115-035551_TAMA Superstar Classic-1.jpeg'),
(337, 96, '20221115-035552_TAMA Superstar Classic-2.jpeg'),
(338, 96, '20221115-035552_TAMA Superstar Classic-3.jpeg'),
(339, 96, '20221115-035552_TAMA Superstar Classic-4.jpeg'),
(340, 96, '20221115-035552_TAMA Superstar Classic-5.jpeg'),
(341, 96, '20221115-035552_TAMA Superstar Classic-6.jpeg'),
(342, 96, '20221115-035552_TAMA Superstar Classic-7.jpeg'),
(343, 96, '20221115-035552_TAMA Superstar Classic-8.jpeg'),
(344, 97, '20221115-035604_YAMAHA EAD10-1.jpeg'),
(345, 97, '20221115-035604_YAMAHA EAD10-5.jpeg'),
(346, 97, '20221115-035604_YAMAHA EAD10-7.jpeg'),
(347, 97, '20221115-035604_YAMAHA EAD10-9.jpeg'),
(348, 98, '20221115-035614_YAMAHA Stage Custom-6.jpeg'),
(349, 98, '20221115-035614_YAMAHA Stage Custom-7.jpeg'),
(350, 98, '20221115-035614_YAMAHA Stage Custom-8.jpeg'),
(351, 98, '20221115-035614_YAMAHA Stage Custom-9.jpeg'),
(352, 98, '20221115-035614_YAMAHA Stage Custom-10.jpeg'),
(353, 99, '20221115-035635_Audio-Technica ATH-E40-1.jpeg'),
(354, 99, '20221115-035635_Audio-Technica ATH-E40-3.jpeg'),
(355, 99, '20221115-035635_Audio-Technica ATH-E40-7.jpeg'),
(356, 100, '20221115-035646_Audio-Technica ATH-M20x-1.jpeg'),
(357, 100, '20221115-035646_Audio-Technica ATH-M20x-4.jpeg'),
(358, 100, '20221115-035646_Audio-Technica ATH-M20x-5.jpeg'),
(359, 101, '20221115-035656_Audio-Technica ATH-M30x-1.png'),
(360, 101, '20221115-035656_Audio-Technica ATH-M30x-2.png'),
(361, 101, '20221115-035656_Audio-Technica ATH-M30x-3.png'),
(362, 101, '20221115-035656_Audio-Technica ATH-M30x-6.png'),
(363, 102, '20221115-035708_Audio-Technica ATH-M40x-1.jpeg'),
(364, 102, '20221115-035708_Audio-Technica ATH-M40x-4.jpeg'),
(365, 102, '20221115-035708_Audio-Technica ATH-M40x-9.jpeg'),
(366, 103, '20221115-035720_Audio-Technica ATH-M50x-1.png'),
(367, 103, '20221115-035720_Audio-Technica ATH-M50x-2.png'),
(368, 103, '20221115-035720_Audio-Technica ATH-M50x-11.png'),
(369, 103, '20221115-035724_Audio-Technica ATH-M50x-10.png'),
(370, 104, '20221115-035736_Audio-Technica M20xBT-1.jpeg'),
(371, 104, '20221115-035737_Audio-Technica M20xBT-3.jpeg'),
(372, 104, '20221115-035737_Audio-Technica M20xBT-4.jpeg'),
(373, 104, '20221115-035737_Audio-Technica M20xBT-6.jpeg'),
(374, 105, '20221115-035749_Audio-Technica M50xMO-1 - 複製.png'),
(375, 105, '20221115-035749_Audio-Technica M50xMO-3 - 複製.png'),
(376, 105, '20221115-035749_Audio-Technica M50xMO-5 - 複製.png'),
(377, 105, '20221115-035749_Audio-Technica M50xMO-6 - 複製.png'),
(378, 105, '20221115-035749_Audio-Technica M50xMO-8 - 複製.png'),
(379, 106, '20221115-035803_Austrian Audio Hi-X15-1.jpeg'),
(380, 106, '20221115-035803_Austrian Audio Hi-X15-2.jpeg'),
(381, 106, '20221115-035803_Austrian Audio Hi-X15-3.jpeg'),
(382, 106, '20221115-035803_Austrian Audio Hi-X15-4.jpeg'),
(383, 107, '20221115-035815_Austrian Audio HI-X60-1.jpeg'),
(384, 107, '20221115-035815_Austrian Audio HI-X60-9.jpeg'),
(385, 107, '20221115-035815_Austrian Audio HI-X60-10.jpeg'),
(386, 107, '20221115-035815_Austrian Audio HI-X60-11.jpeg'),
(387, 108, '20221115-035822_Beyerdynamic DT150 250ohms-1.jpeg'),
(388, 108, '20221115-035823_Beyerdynamic DT150 250ohms-2.jpeg'),
(389, 108, '20221115-035823_Beyerdynamic DT150 250ohms-3.jpeg'),
(390, 109, '20221115-035832_Beyerdynamic DT250 PRO 80ohms-1.jpeg'),
(391, 109, '20221115-035832_Beyerdynamic DT250 PRO 80ohms-2.jpeg'),
(392, 109, '20221115-035832_Beyerdynamic DT250 PRO 80ohms-3.jpeg'),
(393, 110, '20221115-035845_Beyerdynamic DT700 PRO X 48 ohms-1.jpeg'),
(394, 110, '20221115-035845_Beyerdynamic DT700 PRO X 48 ohms-3.jpeg'),
(395, 110, '20221115-035845_Beyerdynamic DT700 PRO X 48 ohms-4.jpeg'),
(396, 110, '20221115-035845_Beyerdynamic DT700 PRO X 48 ohms-5.jpeg'),
(397, 111, '20221115-035853_Beyerdynamic DT770 PRO 80ohms-1.jpeg'),
(398, 111, '20221115-035853_Beyerdynamic DT770 PRO 80ohms-2.jpeg'),
(399, 111, '20221115-035853_Beyerdynamic DT770 PRO 80ohms-3.jpeg'),
(400, 111, '20221115-035853_Beyerdynamic DT770 PRO 80ohms-5.jpeg'),
(401, 112, '20221115-035903_Beyerdynamic DT770 PRO 250ohms-1.jpeg'),
(402, 112, '20221115-035903_Beyerdynamic DT770 PRO 250ohms-2.jpeg'),
(403, 112, '20221115-035903_Beyerdynamic DT770 PRO 250ohms-3.jpeg'),
(404, 112, '20221115-035903_Beyerdynamic DT770 PRO 250ohms-4.jpeg'),
(405, 113, '20221115-035911_Beyerdynamic DT770M 80ohms-1.jpeg'),
(406, 113, '20221115-035911_Beyerdynamic DT770M 80ohms-2.jpeg'),
(407, 113, '20221115-035911_Beyerdynamic DT770M 80ohms-3.jpeg'),
(408, 114, '20221115-035925_Beyerdynamic DT880 Edition 250ohms-1.jpeg'),
(409, 114, '20221115-035925_Beyerdynamic DT880 Edition 250ohms-2.jpeg'),
(410, 114, '20221115-035925_Beyerdynamic DT880 Edition 250ohms-3.jpeg'),
(411, 115, '20221115-035935_Beyerdynamic DT900 PRO X 48 ohms-1.jpeg'),
(412, 115, '20221115-035935_Beyerdynamic DT900 PRO X 48 ohms-2.jpeg'),
(413, 115, '20221115-035935_Beyerdynamic DT900 PRO X 48 ohms-5.jpeg'),
(414, 116, '20221115-035943_Beyerdynamic DT990 PRO 250ohms-1.jpeg'),
(415, 116, '20221115-035943_Beyerdynamic DT990 PRO 250ohms-2.jpeg'),
(416, 116, '20221115-035943_Beyerdynamic DT990 PRO 250ohms-3.jpeg'),
(417, 116, '20221115-035943_Beyerdynamic DT990 PRO 250ohms-4.jpeg'),
(418, 117, '20221115-035952_Beyerdynamic DT1770 PRO 250ohms-1.jpeg'),
(419, 117, '20221115-035952_Beyerdynamic DT1770 PRO 250ohms-2.jpeg'),
(420, 117, '20221115-035952_Beyerdynamic DT1770 PRO 250ohms-3.jpeg'),
(421, 118, '20221115-040000_Electro Harmonix NYC CANS-1.jpeg'),
(422, 118, '20221115-040000_Electro Harmonix NYC CANS-2.jpeg'),
(423, 118, '20221115-040000_Electro Harmonix NYC CANS-3.jpeg'),
(424, 118, '20221115-040000_Electro Harmonix NYC CANS-4.jpeg'),
(425, 119, '20221115-040007_SENNHEISER HD 300 PRO-1.jpeg'),
(426, 119, '20221115-040007_SENNHEISER HD 300 PRO-2.jpeg'),
(427, 119, '20221115-040007_SENNHEISER HD 300 PRO-3.jpeg'),
(428, 119, '20221115-040007_SENNHEISER HD 300 PRO-4.jpeg'),
(429, 120, '20221115-040016_Superlux HD681-1.jpeg'),
(430, 120, '20221115-040016_Superlux HD681-2.jpeg'),
(431, 121, '20221115-040032_IK Multimedia iLoud Micro Monitor-6.jpeg'),
(432, 121, '20221115-040032_IK Multimedia iLoud Micro Monitor-8.jpeg'),
(433, 123, '20221115-040102_ISOACOUSTIC ISO-155 7down-2.jpeg'),
(434, 123, '20221115-040102_ISOACOUSTIC ISO-155 7down-3.jpeg'),
(435, 123, '20221115-040102_ISOACOUSTIC ISO-155 7down-5.jpeg'),
(436, 123, '20221115-040102_ISOACOUSTIC ISO-155 7down-8.jpeg'),
(437, 124, '20221115-040118_ISOACOUSTIC ISO-200-1.gif'),
(438, 124, '20221115-040118_ISOACOUSTIC ISO-200-3.jpeg'),
(439, 124, '20221115-040118_ISOACOUSTIC ISO-200-4.jpeg'),
(440, 124, '20221115-040118_ISOACOUSTIC ISO-200-7.jpeg'),
(441, 124, '20221115-040118_ISOACOUSTIC ISO-200-8.jpeg'),
(442, 125, '20221115-040131_MACKIE CR3-XBT-1.jpeg'),
(443, 125, '20221115-040131_MACKIE CR3-XBT-2.jpeg'),
(444, 125, '20221115-040131_MACKIE CR3-XBT-3.jpeg'),
(445, 125, '20221115-040131_MACKIE CR3-XBT-7.jpeg'),
(446, 126, '20221115-040139_Marshall Acton BT II-1.jpeg'),
(447, 126, '20221115-040139_Marshall Acton BT II-3.jpeg'),
(448, 126, '20221115-040139_Marshall Acton BT II4.jpeg'),
(449, 126, '20221115-040139_Marshall Acton BT II-5.jpeg'),
(450, 127, '20221115-040148_NEUMANN KH-80-1.jpeg'),
(451, 127, '20221115-040148_NEUMANN KH-80-2.jpeg'),
(452, 127, '20221115-040148_NEUMANN KH-80-3.jpeg'),
(453, 127, '20221115-040148_NEUMANN KH-80-10.jpeg'),
(454, 128, '20221115-040156_NEUMANN KH120 A-1.jpeg'),
(455, 128, '20221115-040156_NEUMANN KH120 A-2.jpeg'),
(456, 128, '20221115-040156_NEUMANN KH120 A-3.jpeg'),
(457, 128, '20221115-040156_NEUMANN KH120 A-4.jpeg'),
(458, 130, '20221115-040214_Presonus E5 XT-1.jpeg'),
(459, 130, '20221115-040214_Presonus E5 XT2.jpeg'),
(460, 130, '20221115-040214_Presonus E5 XT-3.jpeg'),
(461, 130, '20221115-040214_Presonus E5 XT-4.jpeg'),
(462, 131, '20221115-040230_TANNOY GOLD 5-1.jpeg'),
(463, 131, '20221115-040230_TANNOY GOLD 5-2.jpeg'),
(464, 131, '20221115-040230_TANNOY GOLD 5-3.jpeg'),
(465, 132, '20221115-040240_YAMAHA HS5M HS5MW-1.jpeg'),
(466, 132, '20221115-040240_YAMAHA HS5M HS5MW-2-two.jpeg'),
(467, 132, '20221115-040240_YAMAHA HS5M HS5MW-3-two.jpeg'),
(468, 133, '20221115-040249_YAMAHA HS8-1.jpeg'),
(469, 133, '20221115-040249_YAMAHA HS8-2.jpeg'),
(470, 133, '20221115-040249_YAMAHA HS8-3.jpeg'),
(471, 133, '20221115-040249_YAMAHA HS8-4.jpeg'),
(472, 134, '20221115-040300_YAMAHA MSP3A-1.jpeg'),
(473, 134, '20221115-040300_YAMAHA MSP3A-2.jpeg'),
(474, 134, '20221115-040300_YAMAHA MSP3A-3.jpeg'),
(475, 134, '20221115-040300_YAMAHA MSP3A-5.jpeg'),
(476, 135, '20221115-040319_ALCTRON BC800V2-1.jpeg'),
(477, 135, '20221115-040319_ALCTRON BC800V2-2.jpeg'),
(478, 135, '20221115-040319_ALCTRON BC800V2-5.jpeg'),
(479, 136, '20221115-040327_ALCTRON CM6X-1.jpeg'),
(480, 136, '20221115-040327_ALCTRON CM6X-2.jpeg'),
(481, 136, '20221115-040327_ALCTRON CM6X-3.jpeg'),
(482, 136, '20221115-040327_ALCTRON CM6X-4.jpeg'),
(483, 138, '20221115-040345_ALCTRON PM88-1.jpeg'),
(484, 138, '20221115-040345_ALCTRON PM88-2.jpeg'),
(485, 138, '20221115-040345_ALCTRON PM88-3.jpeg'),
(486, 138, '20221115-040345_ALCTRON PM88-4.jpeg'),
(487, 139, '20221115-040400_Austrian Audio OD303-1.jpeg'),
(488, 139, '20221115-040400_Austrian Audio OD303-4.jpeg'),
(489, 139, '20221115-040400_Austrian Audio OD303-5.jpeg'),
(490, 139, '20221115-040400_Austrian Audio OD303-6.jpeg'),
(491, 140, '20221115-040411_Austrian Audio OD505-2.jpeg'),
(492, 140, '20221115-040412_Austrian Audio OD505-3.jpeg'),
(493, 140, '20221115-040412_Austrian Audio OD505-4.jpeg'),
(494, 140, '20221115-040412_Austrian Audio OD505-5.jpeg'),
(495, 141, '20221115-040419_Beyerdynamic TG D70 MKI-1.jpeg'),
(496, 141, '20221115-040419_Beyerdynamic TG D70 MKI-4.jpeg'),
(497, 141, '20221115-040419_Beyerdynamic TG D70 MKI-6.jpeg'),
(498, 141, '20221115-040419_Beyerdynamic TG D70 MKI-7.jpeg'),
(499, 142, '20221115-040430_Beyerdynamic TGI51-1.jpeg'),
(500, 142, '20221115-040430_Beyerdynamic TGI51-3.jpeg'),
(501, 142, '20221115-040430_Beyerdynamic TGI51-4.jpeg'),
(502, 142, '20221115-040430_Beyerdynamic TGI51-5.jpeg'),
(503, 144, '20221115-040449_RODE NT2A-1.jpeg'),
(504, 144, '20221115-040449_RODE NT2A-2.jpeg'),
(505, 144, '20221115-040449_RODE NT2A-5.jpeg'),
(506, 144, '20221115-040449_RODE NT2A-6.jpeg'),
(507, 144, '20221115-040449_RODE NT2A-7.jpeg'),
(508, 145, '20221115-040500_RODE NT5MP Matched Pair-2.jpeg'),
(509, 145, '20221115-040500_RODE NT5MP Matched Pair-3.jpeg'),
(510, 145, '20221115-040500_RODE NT5MP Matched Pair-4.jpeg'),
(511, 146, '20221115-040510_RODE NT-USB Mini-1.jpeg'),
(512, 146, '20221115-040510_RODE NT-USB Mini-2.jpeg'),
(513, 146, '20221115-040510_RODE NT-USB Mini-3.jpeg'),
(514, 146, '20221115-040510_RODE NT-USB Mini-6.jpeg'),
(515, 147, '20221115-040520_RODE Video Micro-1.jpeg'),
(516, 147, '20221115-040520_RODE Video Micro-2.jpeg'),
(517, 147, '20221115-040520_RODE Video Micro-3.jpeg'),
(518, 147, '20221115-040520_RODE Video Micro-5.jpeg'),
(519, 148, '20221115-040528_RODE VideoMic NTG-1.jpeg'),
(520, 148, '20221115-040528_RODE VideoMic NTG-2.jpeg'),
(521, 148, '20221115-040528_RODE VideoMic NTG-3.jpeg'),
(522, 148, '20221115-040528_RODE VideoMic NTG-4.jpeg'),
(523, 149, '20221115-040536_Sennheiser E865S-1.png'),
(524, 149, '20221115-040536_Sennheiser E865S-2.png'),
(525, 149, '20221115-040536_Sennheiser E865S-3.png'),
(526, 149, '20221115-040536_Sennheiser E865S-4.png'),
(527, 150, '20221115-040545_Sennheiser E901-1.jpeg'),
(528, 150, '20221115-040545_Sennheiser E901-2.jpeg'),
(529, 150, '20221115-040545_Sennheiser E901-3.jpeg'),
(530, 150, '20221115-040545_Sennheiser E901-5.jpeg'),
(531, 151, '20221115-040554_Sennheiser E914-1.jpeg'),
(532, 151, '20221115-040554_Sennheiser E914-2.jpeg'),
(533, 151, '20221115-040555_Sennheiser E914-3.jpeg'),
(534, 151, '20221115-040555_Sennheiser E914-5.jpeg'),
(535, 152, '20221115-040609_Sennheiser E965-3.jpeg'),
(536, 152, '20221115-040609_Sennheiser E965-4.jpeg'),
(537, 152, '20221115-040609_Sennheiser E965-5.jpeg'),
(538, 152, '20221115-040609_Sennheiser E965-6.jpeg'),
(539, 153, '20221115-040621_YAMAHA YCM01-3.jpeg'),
(540, 153, '20221115-040621_YAMAHA YCM01-5.jpeg'),
(541, 153, '20221115-040621_YAMAHA YCM01-6.jpeg'),
(542, 153, '20221115-040621_YAMAHA YCM01-7.jpeg'),
(543, 154, '20221115-040633_AKG P5S-1.jpeg'),
(544, 154, '20221115-040633_AKG P5S-2.jpeg'),
(545, 154, '20221115-040633_AKG P5S-3.jpeg'),
(546, 154, '20221115-040633_AKG P5S-4.jpeg'),
(547, 155, '20221115-040642_JIM DUNLOP JDGP-41R 0.46mm-1.jpeg'),
(548, 155, '20221115-040642_JIM DUNLOP JDGP-41R 0.46mm-2.jpeg'),
(549, 155, '20221115-040642_JIM DUNLOP JDGP-41R 0.46mm-3.jpeg'),
(550, 155, '20221115-040642_JIM DUNLOP JDGP-41R 0.46mm-4.jpeg'),
(551, 156, '20221115-040648_JIM DUNLOP JDGP-45RFT 1.0mm-1.jpeg'),
(552, 156, '20221115-040648_JIM DUNLOP JDGP-45RFT 1.0mm-2.jpeg'),
(553, 156, '20221115-040648_JIM DUNLOP JDGP-45RFT 1.0mm-3.jpeg'),
(554, 157, '20221115-040655_JIM DUNLOP JDGP-47R1S 1.1mm-1.jpeg'),
(555, 157, '20221115-040655_JIM DUNLOP JDGP-47R1S 1.1mm-2.jpeg'),
(556, 157, '20221115-040655_JIM DUNLOP JDGP-47R1S 1.1mm-3.jpeg'),
(557, 158, '20221115-040702_JIM DUNLOP JDGP-418R 0.50mm-1.jpeg'),
(558, 158, '20221115-040702_JIM DUNLOP JDGP-418R 0.50mm-2.jpeg'),
(559, 158, '20221115-040702_JIM DUNLOP JDGP-418R 0.50mm-3.jpeg'),
(560, 158, '20221115-040702_JIM DUNLOP JDGP-418R 0.50mm-4.jpeg'),
(561, 159, '20221115-040709_JIM DUNLOP JDGP-418R 0.73mm-1.jpeg'),
(562, 159, '20221115-040709_JIM DUNLOP JDGP-418R 0.73mm-2.jpeg'),
(563, 159, '20221115-040709_JIM DUNLOP JDGP-418R 0.73mm-3.jpeg'),
(564, 160, '20221115-040716_JIM DUNLOP JDGP-418R 0.88mm-1.jpeg'),
(565, 160, '20221115-040716_JIM DUNLOP JDGP-418R 0.88mm-2.jpeg'),
(566, 160, '20221115-040716_JIM DUNLOP JDGP-418R 0.88mm-3.jpeg'),
(567, 160, '20221115-040716_JIM DUNLOP JDGP-418R 0.88mm-4.jpeg'),
(568, 161, '20221115-040725_JIM DUNLOP JDGP-446R 0.53mm-1.jpeg'),
(569, 161, '20221115-040725_JIM DUNLOP JDGP-446R 0.53mm-2.jpeg'),
(570, 161, '20221115-040725_JIM DUNLOP JDGP-446R 0.53mm-3.jpeg'),
(571, 162, '20221115-040735_JIM DUNLOP JDGP-449R 0.88mm-1.jpeg'),
(572, 162, '20221115-040735_JIM DUNLOP JDGP-449R 0.88mm-2.jpeg'),
(573, 162, '20221115-040735_JIM DUNLOP JDGP-449R 0.88mm-3.jpeg'),
(574, 163, '20221115-040743_JIM DUNLOP JDGP-449R 1.5mm-1.jpeg'),
(575, 163, '20221115-040743_JIM DUNLOP JDGP-449R 1.5mm-2.jpeg'),
(576, 163, '20221115-040743_JIM DUNLOP JDGP-449R 1.5mm-3.jpeg'),
(577, 164, '20221115-040750_JIM DUNLOP JDGP-462R 0.50mm-1.jpeg'),
(578, 164, '20221115-040750_JIM DUNLOP JDGP-462R 0.50mm-2.jpeg'),
(579, 164, '20221115-040751_JIM DUNLOP JDGP-462R 0.50mm-3.jpeg'),
(583, 129, '20221115-065238_Presonus E5 XT-1.jpeg'),
(584, 129, '20221115-065239_Presonus E5 XT-2.jpeg'),
(585, 137, '20221115-065327_ALCTRON PM88-1.jpeg'),
(586, 137, '20221115-065327_ALCTRON PM88-2.jpeg'),
(587, 137, '20221115-065327_ALCTRON PM88-3.jpeg'),
(588, 137, '20221115-065327_ALCTRON PM88-4.jpeg'),
(589, 143, '20221115-065404_RODE NT1 KIT-1.jpeg'),
(590, 143, '20221115-065404_RODE NT1 KIT-2.jpeg'),
(591, 143, '20221115-065404_RODE NT1 KIT-3.jpeg'),
(592, 143, '20221115-065404_RODE NT1 KIT-4.jpeg');

-- --------------------------------------------------------

--
-- 資料表結構 `product_spec`
--

CREATE TABLE `product_spec` (
  `id` int(6) UNSIGNED NOT NULL,
  `spec_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '規格名稱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='產品規格';

--
-- 傾印資料表的資料 `product_spec`
--

INSERT INTO `product_spec` (`id`, `spec_name`) VALUES
(1, '36吋'),
(2, '41吋'),
(3, '17吋'),
(4, '21吋'),
(5, '23吋'),
(6, '26吋'),
(7, '無區分規格');

-- --------------------------------------------------------

--
-- 資料表結構 `question`
--

CREATE TABLE `question` (
  `id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '會員提問'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `rehearsal`
--

CREATE TABLE `rehearsal` (
  `id` int(6) UNSIGNED NOT NULL,
  `rehearsal_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '練團室名稱',
  `rehearsal_img` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '練團室圖片',
  `reserve_price` int(6) NOT NULL COMMENT '練團室預約金額',
  `rehearsal_info` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '練團室資訊',
  `rehearsal_device` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '練團室設備',
  `create_time` date NOT NULL,
  `rehearsal_vaild` tinyint(1) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='教室';

--
-- 傾印資料表的資料 `rehearsal`
--

INSERT INTO `rehearsal` (`id`, `rehearsal_name`, `rehearsal_img`, `reserve_price`, `rehearsal_info`, `rehearsal_device`, `create_time`, `rehearsal_vaild`) VALUES
(1, '練團室A', '2022-11-14.jpg', 1500, '大約15坪,可容納8人，提供樂器', '', '2022-11-09', 1),
(2, '練團室B', '2021-10-17.jpg', 2400, '大約15坪，可容納8人，提供樂器', '', '2022-11-12', 1),
(3, '練團室C', '2021-10-15.jpg', 3000, '大約20坪，可容納10人，提供樂器', '', '2022-11-12', 1),
(4, '個人爵士鼓教室', '2021-10-14.jpg', 900, '提供爵士鼓使用', '', '2022-11-10', 1),
(5, '個人鋼琴教室', '2022-11-13.jpg', 1350, '提供鋼琴使用', '', '2022-11-11', 1),
(6, '我是教室10', '2021-10-13.jpg', 99999999, '123', '', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `rehearsal_img`
--

CREATE TABLE `rehearsal_img` (
  `id` int(6) NOT NULL,
  `rehearsal_id` int(6) NOT NULL,
  `src` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='練團室多圖';

-- --------------------------------------------------------

--
-- 資料表結構 `rehearsal_reserve`
--

CREATE TABLE `rehearsal_reserve` (
  `id` int(6) UNSIGNED NOT NULL,
  `user_id` int(6) NOT NULL COMMENT '會員',
  `rehearsal_id` int(6) NOT NULL COMMENT '教室',
  `order_price` int(6) NOT NULL COMMENT '價錢',
  `reserve_date` date NOT NULL COMMENT '預約日期',
  `reserve_time` time NOT NULL COMMENT '預約時間',
  `resever_valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='教室預約';

--
-- 傾印資料表的資料 `rehearsal_reserve`
--

INSERT INTO `rehearsal_reserve` (`id`, `user_id`, `rehearsal_id`, `order_price`, `reserve_date`, `reserve_time`, `resever_valid`) VALUES
(1, 1, 2, 700, '2022-11-02', '13:00:00', 1),
(2, 3, 3, 800, '2022-11-03', '14:00:00', 1),
(3, 5, 2, 800, '2022-11-03', '16:00:00', 1),
(4, 6, 5, 9000, '2022-11-12', '09:00:00', 1),
(5, 8, 4, 9000, '2022-11-12', '12:30:00', 1),
(6, 5, 2, 800, '2022-11-12', '21:00:00', 1),
(7, 15, 1, 800, '2022-11-12', '11:00:00', 1),
(8, 3, 4, 800, '2022-11-12', '09:00:00', 1),
(9, 2, 5, 900, '2022-11-12', '17:00:00', 1),
(10, 4, 2, 900, '2022-11-12', '17:00:00', 1),
(11, 6, 1, 900, '2022-11-12', '15:00:00', 1),
(12, 7, 3, 900, '2022-11-12', '09:00:00', 1),
(13, 9, 5, 900, '2022-11-12', '13:00:00', 1),
(14, 14, 5, 900, '2022-11-13', '17:00:00', 1),
(15, 10, 2, 800, '2022-11-13', '18:00:00', 1),
(16, 12, 3, 800, '2022-11-14', '10:00:00', 1),
(17, 4, 2, 900, '2022-11-14', '17:00:00', 1),
(18, 11, 5, 900, '2022-11-15', '09:00:00', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `id` int(6) UNSIGNED NOT NULL,
  `user_account` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '會員帳號',
  `user_password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '會員密碼',
  `user_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '會員名字',
  `user_birthday` date NOT NULL COMMENT '會員生日',
  `user_mail` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '會員信箱',
  `user_phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '會員電話',
  `user_address` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '會員地址',
  `user_img` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手機載具',
  `owner` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '信用卡持有者',
  `number` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '信用卡卡號',
  `dateline` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '信用卡日期',
  `teacher_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teacher_fb` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teacher_youtube` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_level_id` int(6) NOT NULL COMMENT '會員等級',
  `create_time` datetime NOT NULL,
  `user_valid` tinyint(1) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='會員';

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`id`, `user_account`, `user_password`, `user_name`, `user_birthday`, `user_mail`, `user_phone`, `user_address`, `user_img`, `carrier`, `owner`, `number`, `dateline`, `teacher_info`, `teacher_fb`, `teacher_youtube`, `user_level_id`, `create_time`, `user_valid`) VALUES
(1, 'Lisa', '827CCB0EEA8A706C4C34A16891F84E7B', 'Lisa', '1999-01-22', 'jxq36569@cdfaq.com', '0912345678', '台北市中山區中山北路一段121巷36號', 'user_01.jpg', NULL, '', '', '', '', '', '', 1, '2022-11-11 15:09:41', 1),
(2, 'Cindy', '827CCB0EEA8A706C4C34A16891F84E7B', '陳宣勻', '1979-03-04', 'coi47783@xcoxc.com', '0955093350', '桃園市中壢區', 'user_02.jpg', NULL, '', '', '', '', '', '', 1, '2022-11-12 11:24:25', 1),
(3, 'cleo', '827CCB0EEA8A706C4C34A16891F84E7B', '陳子涵', '2008-07-03', 'cleo@gmail.com', '0911223423', '新北市板橋區', 'user_03.jpg', NULL, '', '', '', '', '', '', 2, '2022-11-12 11:25:33', 1),
(4, 'mai', '827CCB0EEA8A706C4C34A16891F84E7B', '郭昕沒', '2006-10-16', 'mai@test.com', '0921136272', '桃園市中壢區', 'user_04.jpg', NULL, '', '', '', '', '', '', 3, '2022-11-12 11:26:40', 1),
(5, 'yang1111', '827CCB0EEA8A706C4C34A16891F84E7B', '楊雅媗', '1998-08-04', 'ljf88848@nezid.com', '0911921234', '台中市', 'user_05.jpg', NULL, '', '', '', '', '', '', 2, '2022-11-12 11:28:17', 1),
(6, 'Shih-Hao Lo', '827CCB0EEA8A706C4C34A16891F84E7B', 'Shih-Hao L', '1994-06-16', 'wzf17903@xcoxc.com', '0916616745', '高雄市燕巢區', 'user_06.jpg', NULL, '', '', '', '', '', '', 1, '2022-11-12 11:30:28', 1),
(7, 'Huang1227', '827CCB0EEA8A706C4C34A16891F84E7B', '黃雅嬬', '1990-12-27', 'byt52906@cdfaq.com', '0975575658', '基隆市', 'user_07.jpg', NULL, '', '', '', '', '', '', 2, '2022-11-12 11:32:32', 1),
(8, 'Ada', '827CCB0EEA8A706C4C34A16891F84E7B', 'Ada Wang', '1991-08-25', 'oro46145@cdfaq.com', '0920148034', '新北市板橋區', 'user_05.jpg', NULL, '', '', '', '', '', '', 1, '2022-11-12 11:35:04', 1),
(9, 'b94510062', '827CCB0EEA8A706C4C34A16891F84E7B', '邱小昇', '2003-08-15', 'b94510062@test.com', '0921125126', '台中市西區五權西路一段2號', 'user_02.jpg', NULL, '', '', '', '', '', '', 2, '2022-11-12 11:36:25', 1),
(10, 'anzo22', '827CCB0EEA8A706C4C34A16891F84E7B', '郭芳婷', '1975-10-22', 'hyp59708@nezid.com', '0963078500', '台北市信義區林口街42號', 'user_03.jpg', NULL, '', '', '', '', '', '', 2, '2022-11-12 11:38:25', 1),
(11, 'Hsuuu', '827CCB0EEA8A706C4C34A16891F84E7B', '徐國彥', '2010-07-15', 'megan.hsu914@123.com', '0939417156', '台北市大安區師大路39巷', 'user_01.jpg', NULL, '', '', '', '', '', '', 1, '2022-11-12 11:40:16', 1),
(12, 'Leeyiling', '827CCB0EEA8A706C4C34A16891F84E7B', '李翊玲', '1999-08-30', 'eld42728@xcoxc.com', '0918337934', '台北市中山區南京東路二段', 'user_06.jpg', NULL, '', '', '', '', '', '', 3, '2022-11-12 11:41:44', 1),
(13, 'william', '827CCB0EEA8A706C4C34A16891F84E7B', '陳錦丘', '1993-01-13', 'iee54442@nezid.com', '0932057721', '台北市中正區中華路二段307巷', 'user_03.jpg', NULL, '', '', '', '', '', '', 2, '2022-11-12 11:43:03', 1),
(14, 'yovin', '827CCB0EEA8A706C4C34A16891F84E7B', '謝昀臻', '1985-08-03', 'wsk59286@xcoxc.com', '0926718972', '新北市三重區三張街4號', 'user_05.jpg', NULL, '', '', '', '', '', '', 1, '2022-11-12 11:44:27', 1),
(15, 'Joann', '827CCB0EEA8A706C4C34A16891F84E7B', '陳郁欣', '2000-12-30', 'ffo41140@nezid.com', '0926153407', '台北市士林區劍潭路95號', 'user_07.jpg', NULL, '', '', '', '', '', '', 3, '2022-11-12 11:45:52', 1),
(16, 'Jamie', '827CCB0EEA8A706C4C34A16891F84E7B', '趙家敏', '1998-07-05', 'jamie0705@test.com', '0956658912', '新北市板橋區', 'user_02.jpg', NULL, '', '', '', '', '', '', 3, '2022-11-12 11:46:59', 1),
(17, 'LUKA', '827CCB0EEA8A706C4C34A16891F84E7B', '盧冠余', '1999-07-24', 'luka724@test.com', '0928595252', '台北市中山區大直街46巷29號', 'user_04.jpg', NULL, '', '', '', '', '', '', 3, '2022-11-12 11:48:02', 1),
(18, 'tug9852', '934e7a1dbfccee54b04da69e38db7c79', '林孝吉', '1991-10-16', 'frorf@gmail.com', '0985478632', '台南市北區', 'w1200 (1).jfif', NULL, '', '', '', '', '', '', 1, '2022-11-16 15:04:23', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `user_level`
--

CREATE TABLE `user_level` (
  `id` int(6) NOT NULL,
  `level_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `user_level`
--

INSERT INTO `user_level` (`id`, `level_name`) VALUES
(1, '一般會員'),
(2, 'VIP'),
(3, '老師');

-- --------------------------------------------------------

--
-- 資料表結構 `user_like`
--

CREATE TABLE `user_like` (
  `id` int(6) UNSIGNED NOT NULL,
  `user_id` int(6) NOT NULL,
  `product_id` int(6) DEFAULT NULL,
  `class_id` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='會員收藏';

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sn` (`sn`);

--
-- 資料表索引 `activity_color_detial`
--
ALTER TABLE `activity_color_detial`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `activity_detail`
--
ALTER TABLE `activity_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_id` (`activity_id`),
  ADD KEY `activity_product_id` (`ac_product_id`);

--
-- 資料表索引 `activity_img`
--
ALTER TABLE `activity_img`
  ADD KEY `activity_product_id` (`ac_product_id`);

--
-- 資料表索引 `activity_product`
--
ALTER TABLE `activity_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `spec_id` (`spec_id`);

--
-- 資料表索引 `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administrator_id` (`administrator_id`),
  ADD KEY `question_id` (`question_id`);

--
-- 資料表索引 `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_category_id` (`article_category_id`);

--
-- 資料表索引 `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`user_id`);

--
-- 資料表索引 `class_category`
--
ALTER TABLE `class_category`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `class_detail`
--
ALTER TABLE `class_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_order_id`),
  ADD KEY `class_id_2` (`class_id`);

--
-- 資料表索引 `class_message`
--
ALTER TABLE `class_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `class_id` (`class_id`);

--
-- 資料表索引 `class_order`
--
ALTER TABLE `class_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_product_id` (`order_product_id`),
  ADD KEY `class_detail_id` (`class_detail_id`);

--
-- 資料表索引 `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`sn`);

--
-- 資料表索引 `coupon_detail`
--
ALTER TABLE `coupon_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sn` (`sn`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `coupon_detail_id` (`coupon_sn`);

--
-- 資料表索引 `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `spec_id` (`spec_id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `spec_id` (`spec_id`);

--
-- 資料表索引 `product_add`
--
ALTER TABLE `product_add`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `product_color_detail`
--
ALTER TABLE `product_color_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `color_id` (`color_id`);

--
-- 資料表索引 `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- 資料表索引 `product_spec`
--
ALTER TABLE `product_spec`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `rehearsal`
--
ALTER TABLE `rehearsal`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `rehearsal_img`
--
ALTER TABLE `rehearsal_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rehearsal_id` (`rehearsal_id`);

--
-- 資料表索引 `rehearsal_reserve`
--
ALTER TABLE `rehearsal_reserve`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `classroom_id` (`rehearsal_id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_level_id` (`user_level_id`);

--
-- 資料表索引 `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_like`
--
ALTER TABLE `user_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `class_id` (`class_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `activity_color_detial`
--
ALTER TABLE `activity_color_detial`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `activity_detail`
--
ALTER TABLE `activity_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `activity_product`
--
ALTER TABLE `activity_product`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `article`
--
ALTER TABLE `article`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `article_category`
--
ALTER TABLE `article_category`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `class`
--
ALTER TABLE `class`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `class_category`
--
ALTER TABLE `class_category`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `class_detail`
--
ALTER TABLE `class_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `class_message`
--
ALTER TABLE `class_message`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `class_order`
--
ALTER TABLE `class_order`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coupon_detail`
--
ALTER TABLE `coupon_detail`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_add`
--
ALTER TABLE `product_add`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_color_detail`
--
ALTER TABLE `product_color_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_img`
--
ALTER TABLE `product_img`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=593;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_spec`
--
ALTER TABLE `product_spec`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `question`
--
ALTER TABLE `question`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `rehearsal`
--
ALTER TABLE `rehearsal`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `rehearsal_img`
--
ALTER TABLE `rehearsal_img`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `rehearsal_reserve`
--
ALTER TABLE `rehearsal_reserve`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user`
--
ALTER TABLE `user`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_like`
--
ALTER TABLE `user_like`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
