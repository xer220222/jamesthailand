SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

CREATE DATABASE IF NOT EXISTS object
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE object;

CREATE TABLE `projects` (
  `project_id` varchar(50) NOT NULL COMMENT '項目編號',
  `name` varchar(100) DEFAULT NULL COMMENT '建案名稱',
  `developer` varchar(100) DEFAULT NULL COMMENT '建案開發商',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `location` varchar(255) DEFAULT NULL COMMENT '建案地點',
  `property_type` varchar(50) DEFAULT NULL COMMENT '建案類型',
  `completion_year` year(4) DEFAULT NULL COMMENT '完工日期',
  `unit_floor_parking` varchar(100) DEFAULT NULL COMMENT '單位/樓高/車位',
  `facilities` text COMMENT '公共設施',
  `surroundings` text COMMENT '周邊環境',
  `transportation` text COMMENT '鄰近交通',
  `mrt_station` varchar(100) DEFAULT NULL COMMENT '捷運站',
  `object_type` varchar(100) DEFAULT NULL COMMENT '房型',
  `price` decimal(15,2) DEFAULT NULL COMMENT '價格',
  `area` decimal(10,2) DEFAULT NULL COMMENT '面積',
  `description` text COMMENT '建案簡介'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 建立 phpMyAdmin 專用帳號
CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY '12345678';
GRANT ALL PRIVILEGES ON object.* TO 'admin'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

--
-- 資料表的匯出資料 `projects`
--

INSERT INTO `projects` (`project_id`, `name`, `developer`, `city`, `location`, `property_type`, `completion_year`, `unit_floor_parking`, `facilities`, `surroundings`, `transportation`, `mrt_station`, `object_type`, `price`, `area`, `description`) VALUES
('A40B122(207/1256)-32sqm-PH', 'Life ASOKE RAMA 9', 'AP', '曼谷', 'https://www.google.com/maps/place/Life+Asoke+-+Rama+9/@13.754437,100.563545,16z', '永久產權', 2021, '2248單位/46樓/905車位', '大廳、共同工作空間、屋頂花園、圓形劇場、觀景台、游泳池、兒童泳池、汗蒸室、健身房、天際酒廊', 'Central Plaza Rama 9、Fortune Town、G Tower、AIA Tower、聯合利華、泰國證券交易所、GMM Tower', '距離地鐵MRT Phra Ram9 200米；距離捷運機場線 Makkasan站 600米', 'Phra Ram9', '1房', '2000000.00', '32.00', '全景活動泳池、沉浸式垂直景觀、高度放鬆、成功共享、寧靜空中花園'),
('TESTID', 'TESTNAME', 'TESTD', '清邁', 'TESTL', 'TESTT', 2020, 'U/F/P', 'FFFFFFFFFF', 'SSSSSSSSSSSSSS', 'TTTTTTTTTTTTTTT', NULL, '2房', '100000.00', '30.00', 'DDDDDDDDDDDDDD');

