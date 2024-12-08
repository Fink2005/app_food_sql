CREATE DATABASE app_food
-- User
CREATE TABLE `user` (user_id INT PRIMARY KEY AUTO_INCREMENT, full_name VARCHAR(255), email VARCHAR(255), `password` VARCHAR(255))
INSERT INTO
	user (user_id, full_name, email, `password`)
VALUES
	(1, 'Phan Tan Sy', 'phans3801@gmail.com', '123123'),
	(2, 'Phan Tan Sang', 'phans3802@gmail.com', '123123'),
	(3, 'Phan Tan Su', 'phans3803@gmail.com', '123123'),
	(4, 'Phan Tan Si', 'phans3804@gmail.com', '123123'),
	(5, 'Phan Tan Sa', 'phans3805@gmail.com', '123123'),
	(6, 'Phan Tan Su', 'phans3806@gmail.com', '123123'),
	(7, 'Nguyen Thi Yen Nhi', 'yens3807@gmail.com', '123123'),
	(8, 'Nguyen Thi Yen Ngu', 'yens3808@gmail.com', '123123'),
	(9, 'Nguyen Thi Yen Kho', 'yens3809@gmail.com', '123123'),
	(10, 'Nguyen thi Yen Xe', 'yens38010@gmail.com', '123123')
	
SELECT
	*
FROM
	user
	-- Food type
CREATE TABLE food_type (type_id INT PRIMARY KEY AUTO_INCREMENT, type_name VARCHAR(255))
INSERT INTO
	food_type (type_id, type_name)
VALUES
	(1, 'Soup'),
	(2, 'Thịt bò'),
	(3, 'Thịt heo'),
	(4, 'Thịt chuột'),
	(5, 'Cá lóc'),
	(6, 'Thịt gà'),
	(7, 'Bánh cuốn'),
	(8, 'Phở'),
	(9, 'Xôi'),
	(10, 'Bánh mì')
SELECT
	*
FROM
	food_type
	
-- Food
CREATE TABLE food (food_id INT PRIMARY KEY AUTO_INCREMENT, food_name VARCHAR(255), image VARCHAR(255), price FLOAT, `desc` VARCHAR(255), type_id INT, FOREIGN KEY (type_id) REFERENCES food_type (type_id))

INSERT INTO
	food (food_id, food_name, image, price, `desc`, type_id)
VALUES
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
	(15, 'bánh mì khủng lồ', 'banhmibutotrang.png', 30000, 'rat bo va ngon', 10)
		
SELECT
	*
FROM
food


-- sub_food
CREATE TABLE sub_food (sub_id INT PRIMARY KEY AUTO_INCREMENT , food_name VARCHAR(255),sub_price FLOAT,food_id INT, FOREIGN KEY (food_id) REFERENCES food(food_id) )

INSERT INTO sub_food (sub_id, food_name, sub_price, food_id) VALUES
	(1, 'Fish soup',  20000, 1),
	(2, 'Beefsteak',  20000, 2),
	(3, 'Dance beef',  20000, 2),
	(4, 'Fried pork',  20000,  3),
	(5, 'grill pork ', 20000, 3),
	(6, 'kungfu mice',  20000,  4),
	(7, 'KFC fried chicken',  20000,  6),
	(8, 'Grilled chicken',  20000,  6),
	(9, 'Boild chiken', 20000,  6),
	(10, 'hot roll paper ',  20000,  7),
	(11, 'Chicken pho',  20000,  8),
	(12, 'Beef pho', 20000, 8),
	(13, 'sticky rice', 20000,  9),
	(14, 'banh mi ca duoi',  20000,  10),
	(15, 'big banhmi',  2000, 10)

SELECT * from sub_food

-- Order 
CREATE TABLE `order` (user_id INT, FOREIGN KEY (user_id) REFERENCES `user` (user_id), food_id INT, FOREIGN KEY (food_id) REFERENCES food (food_id), amount INT, `code` VARCHAR(255), arr_sub_id VARCHAR(255))


INSERT INTO `order` (user_id, food_id) VALUES
					(1, 2),
					(3, 2),
					(3, 2),
					(1, 2),
					(1, 3),
					(1, 1),
					(2, 4),
					(3, 5),
					(4, 6),
					(6, 5),
					(5, 7),
					(8, 9),
					(4, 10),
					(2, 5)





-- restaurant
	CREATE TABLE restaurant (res_id INT PRIMARY KEY AUTO_INCREMENT, res_name VARCHAR(255), image VARCHAR(255), `desc` VARCHAR(255))
	
	INSERT INTO restaurant (res_id, res_name, image, `desc`) VALUES
					
										
				(1, 'MY VI', 'mivi.png', 'Ngon hơn những gì bạn nghĩ')
				(2, 'Rua tien', 'ruatien.png', 'Ngon hơn những gì bạn nghĩ')	
				(3, 'hop tui tien ban','ruatien.png', 'Ngon hơn những gì bạn nghĩ')
				(4 , 'an gi cung dc','ruatien.png', 'Ngon hơn những gì bạn nghĩ')
-- rate_res 

	CREATE TABLE rate_res (user_id INT, FOREIGN KEY (user_id) REFERENCES `user`(user_id), res_id INT, FOREIGN KEY (res_id) REFERENCES restaurant(res_id), amount INT, date_rate DATETIME)
	
	INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES 
							(1,1, 10,'2024-12-10 10:00:00'),
							(1,2, 10,'2024-12-10 10:00:00'),
							(1,1, 10,'2024-12-10 10:00:00'),
							(1,3, 10,'2024-12-10 10:00:00'),
							(2,4, 10,'2024-12-10 10:00:00'),
							(2,1, 10,'2024-12-10 10:00:00'),
							(2,2, 10,'2024-12-10 10:00:00'),
							(3,3, 10,'2024-12-10 10:00:00'),
							(4,4, 10,'2024-12-10 10:00:00'),
							(4,4, 10,'2024-12-10 10:00:00'),
							(5,1, 10,'2024-12-10 10:00:00'),
							(6,1, 10,'2024-12-10 10:00:00'),
							(7,2, 10,'2024-12-10 10:00:00'),
							(8,1, 10,'2024-12-10 10:00:00'),
							(5,3, 10,'2024-12-10 10:00:00'),
							(8,1, 10,'2024-12-10 10:00:00')
							
SELECT * FROM rate_res


-- like res 

CREATE TABLE like_res (user_id INT, FOREIGN KEY (user_id) REFERENCES `user`(user_id),res_id INT, FOREIGN KEY (res_id) REFERENCES restaurant(res_id), date_like DATETIME )



INSERT INTO like_res (user_id, res_id , date_like) VALUES 
						(1,1,'2024-12-10 10:00:00'),
						(1,2,'2024-12-10 10:00:00'),
						(1,1,'2024-12-10 10:00:00'),
						(1,3,'2024-12-10 10:00:00'),
						(2,2,'2024-12-10 10:00:00'),
						(2,1,'2024-12-10 10:00:00'),
						(2,2,'2024-12-10 10:00:00'),
						(3,4,'2024-12-10 10:00:00'),
						(4,1,'2024-12-10 10:00:00'),
						(4,1,'2024-12-10 10:00:00'),
						(5,1,'2024-12-10 10:00:00'),
						(6,1,'2024-12-10 10:00:00'),
						(7,2,'2024-12-10 10:00:00'),
						(8,1,'2024-12-10 10:00:00'),
						(5,1,'2024-12-10 10:00:00'),
						(8,1,'2024-12-10 10:00:00')
						
						
-- BAI TAP YEU CAU 
	-- TIM 5 nguoi da like nha hang nhieu nhat
		SELECT  COUNT(like_res.user_id) as `quantity`, user.user_id, user.full_name, like_res.user_id from like_res INNER JOIN `user` ON like_res.user_id = user.user_id GROUP BY like_res.user_id ORDER BY `quantity` DESC LIMIT 5
		
		
	-- Tim 2 nha hang co luot like nhieu nhat
	
	SELECT COUNT(like_res.res_id) as `quantity`, restaurant.res_name , like_res.res_id from like_res INNER JOIN restaurant on restaurant.res_id = l
	
	--  TIM NGUOI DA DAT HANG NHIEU NHAT

SELECT COUNT(order.user_id) as `quantity`, user.user_id, user.full_name, order.user_id from `user` INNER JOIN `order` ON order.user_id = user.user_id GROUP BY order.user_id ORDER BY `quantity` DESC LIMIT 1

	-- TIM NGUOI DUNG KHONG HOAT DONG (KO DAT HANG, LIKE, DANH GIA NHA HANG)
		-- ko dat hang
		SELECT order.user_id, user.user_id , user.full_name  from `order` RIGHT JOIN `user` ON order.user_id = user.user_id WHERE order.user_id IS NULL
		-- ko like
		SELECT like_res.user_id, user.user_id , user.full_name from like_res RIGHT JOIN `user` ON like_res.user_id = user.user_id WHERE like_res.user_id IS NULL
		-- ko danh gia
		SELECT rate_res.user_id, user.user_id , user.full_name from `user` LEFT JOIN  
		rate_res ON rate_res.user_id = user.user_id WHERE rate_res.user_id IS NULL
	
	
	
			