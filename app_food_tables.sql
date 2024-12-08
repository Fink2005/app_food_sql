-- -------------------------------------------------------------
-- TablePlus 6.2.0(576)
--
-- https://tableplus.com/
--
-- Database: app_food
-- Generation Time: 2024-12-09 03:01:42.3970
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(1, 'Soup vi cá', 'vica.png', 30000, 'rat bo va ngon', 1),
(2, 'Bò bít tết', 'bittet.png', 30000, 'rat bo va ngon', 2),
(3, 'Bò lúc lắc', 'luclac.png', 30000, 'rat bo va ngon', 2),
(4, 'Heo chiên bột', 'heochienbot.png', 30000, 'rat bo va ngon', 3),
(5, 'Heo nướng nguyên con', 'heonguyencon.png', 30000, 'rat bo va ngon', 3),
(6, 'Chuột lăng ba vi bộ', 'chuotlangba.png', 30000, 'rat bo va ngon', 4),
(7, 'Gà rán KFC', 'kfc.png', 30000, 'rat bo va ngon', 6),
(8, 'Gà nướng nguyên con', 'ganuong.png', 30000, 'rat bo va ngon', 6),
(9, 'Gà luộc lá chanh', 'galuoc.png', 30000, 'rat bo va ngon', 6),
(10, 'Bánh cuốn trứng nóng', 'banhcuontrung.png', 30000, 'rat bo va ngon', 7),
(11, 'Phở gà', 'phoga.png', 30000, 'rat bo va ngon', 8),
(12, 'Phò bò', 'phobo.png', 30000, 'rat bo va ngon', 8),
(13, 'Xôi xá xíu', 'xoixaxiu.png', 30000, 'rat bo va ngon', 9),
(14, 'Bánh mì trứng cá đuối', 'banhmitrungca.png', 30000, 'rat bo va ngon', 10),
(15, 'bánh mì khủng lồ', 'banhmibutotrang.png', 30000, 'rat bo va ngon', 10);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Soup'),
(2, 'Thịt bò'),
(3, 'Thịt heo'),
(4, 'Thịt chuột'),
(5, 'Cá lóc'),
(6, 'Thịt gà'),
(7, 'Bánh cuốn'),
(8, 'Phở'),
(9, 'Xôi'),
(10, 'Bánh mì');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2024-12-10 10:00:00'),
(1, 2, '2024-12-10 10:00:00'),
(1, 1, '2024-12-10 10:00:00'),
(1, 3, '2024-12-10 10:00:00'),
(2, 2, '2024-12-10 10:00:00'),
(2, 1, '2024-12-10 10:00:00'),
(2, 2, '2024-12-10 10:00:00'),
(3, 4, '2024-12-10 10:00:00'),
(4, 1, '2024-12-10 10:00:00'),
(4, 1, '2024-12-10 10:00:00'),
(5, 1, '2024-12-10 10:00:00'),
(6, 1, '2024-12-10 10:00:00'),
(7, 2, '2024-12-10 10:00:00'),
(8, 1, '2024-12-10 10:00:00'),
(5, 1, '2024-12-10 10:00:00'),
(8, 1, '2024-12-10 10:00:00');

INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 2, 10, 'asd', 'zxc'),
(1, 3, 10, 'asd', 'zxc'),
(1, 1, 10, 'asd', 'zxc'),
(2, 4, 10, 'asd', 'zxc'),
(3, 5, 10, 'asd', 'cxz'),
(4, 6, 10, 'asd', 'zxc'),
(6, 5, 10, 'asd', 'zxc'),
(5, 7, 10, 'asd', 'zxc'),
(8, 9, 10, 'asd', 'zxc'),
(4, 10, 10, 'asd', 'zxc'),
(2, 5, 10, 'asd', 'zxc'),
(3, 2, NULL, NULL, NULL),
(3, 2, NULL, NULL, NULL),
(1, 2, NULL, NULL, NULL),
(1, 2, NULL, NULL, NULL),
(1, 2, NULL, NULL, NULL),
(3, 2, NULL, NULL, NULL),
(3, 2, NULL, NULL, NULL),
(1, 2, NULL, NULL, NULL),
(1, 3, NULL, NULL, NULL),
(1, 1, NULL, NULL, NULL),
(2, 4, NULL, NULL, NULL),
(3, 5, NULL, NULL, NULL),
(4, 6, NULL, NULL, NULL),
(6, 5, NULL, NULL, NULL),
(5, 7, NULL, NULL, NULL),
(8, 9, NULL, NULL, NULL),
(4, 10, NULL, NULL, NULL),
(2, 5, NULL, NULL, NULL);

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 10, '2024-12-10 10:00:00'),
(1, 2, 10, '2024-12-10 10:00:00'),
(1, 1, 10, '2024-12-10 10:00:00'),
(1, 3, 10, '2024-12-10 10:00:00'),
(2, 4, 10, '2024-12-10 10:00:00'),
(2, 1, 10, '2024-12-10 10:00:00'),
(2, 2, 10, '2024-12-10 10:00:00'),
(3, 3, 10, '2024-12-10 10:00:00'),
(4, 4, 10, '2024-12-10 10:00:00'),
(4, 4, 10, '2024-12-10 10:00:00'),
(5, 1, 10, '2024-12-10 10:00:00'),
(6, 1, 10, '2024-12-10 10:00:00'),
(7, 2, 10, '2024-12-10 10:00:00'),
(8, 1, 10, '2024-12-10 10:00:00'),
(5, 3, 10, '2024-12-10 10:00:00'),
(8, 1, 10, '2024-12-10 10:00:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(1, 'MY VI', 'mivi.png', 'Ngon hơn những gì bạn nghĩ'),
(2, 'Rua tien', 'ruatien.png', 'Ngon hơn những gì bạn nghĩ'),
(3, 'hop tui tien ban', 'ruatien.png', 'Ngon hơn những gì bạn nghĩ'),
(4, 'an gi cung dc', 'ruatien.png', 'Ngon hơn những gì bạn nghĩ');

INSERT INTO `sub_food` (`sub_id`, `food_name`, `sub_price`, `food_id`) VALUES
(1, 'Fish soup', 2000, 1),
(2, 'Beefsteak', 2000, 2),
(3, 'Dance beef', 2000, 2),
(4, 'Fried pork', 2000, 3),
(5, 'grill pork ', 2000, 3),
(6, 'kungfu mice', 2000, 4),
(7, 'KFC fried chicken', 2000, 6),
(8, 'Grilled chicken', 2000, 6),
(9, 'Boild chiken', 2000, 6),
(10, 'hot roll paper ', 2000, 7),
(11, 'Chicken pho', 2000, 8),
(12, 'Beef pho', 2000, 8),
(13, 'sticky rice', 2000, 9),
(14, 'banh mi ca duoi', 2000, 10),
(15, 'big banhmi', 2000, 10);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Phan Tan Sy', 'phans3801@gmail.com', '123123'),
(2, 'Phan Tan Sang', 'phans3802@gmail.com', '123123'),
(3, 'Phan Tan Su', 'phans3803@gmail.com', '123123'),
(4, 'Phan Tan Si', 'phans3804@gmail.com', '123123'),
(5, 'Phan Tan Sa', 'phans3805@gmail.com', '123123'),
(6, 'Phan Tan Su', 'phans3806@gmail.com', '123123'),
(7, 'Nguyen Thi Yen Nhi', 'yens3807@gmail.com', '123123'),
(8, 'Nguyen Thi Yen Ngu', 'yens3808@gmail.com', '123123'),
(9, 'Nguyen Thi Yen Kho', 'yens3809@gmail.com', '123123'),
(10, 'Nguyen thi Yen Xe', 'yens38010@gmail.com', '123123');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;