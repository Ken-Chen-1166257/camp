/*
 Navicat Premium Dump SQL

 Source Server         : myConnection
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : localhost:3306
 Source Schema         : data

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 04/03/2025 16:19:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `issue_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id` DESC) USING BTREE,
  INDEX `fk2`(`issue_id` ASC) USING BTREE,
  INDEX `fk3`(`user_id` ASC) USING BTREE,
  CONSTRAINT `aa1` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aa2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 534 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (533, 30, 15, 'The Wi-Fi service has been down for days, and this is really inconvenient. I had planned to work during my stay, but this has ruined it.', '2025-03-04 11:33:33');
INSERT INTO `comments` VALUES (532, 29, 20, 'I’ve seen bears around Campsite 28, and it’s terrifying. More signage and clear guidelines are needed to ensure campers’ safety.', '2025-03-04 11:33:33');
INSERT INTO `comments` VALUES (531, 28, 4, 'I couldn’t set up my tent properly at Campsite 27 because my tent poles were damaged. This ruined my experience. A warning would have been helpful.', '2025-03-04 11:33:33');
INSERT INTO `comments` VALUES (530, 27, 17, 'Without trash disposal facilities, it’s really hard to keep the campsite clean. There is a huge amount of litter left behind, and it attracts wildlife.', '2025-03-04 11:33:33');
INSERT INTO `comments` VALUES (529, 26, 18, 'I got lost on the unmarked trail near Campsite 26. Proper signs are necessary for the safety of all hikers, especially in the dark.', '2025-03-04 11:33:33');
INSERT INTO `comments` VALUES (528, 25, 2, 'The lack of lighting at Campsite 25 is a major safety concern. I tripped several times while walking back to my tent after dark.', '2025-03-04 11:33:33');
INSERT INTO `comments` VALUES (527, 24, 13, 'The fence near Campsite 24 is falling apart, and it’s dangerous. It needs immediate repairs to keep campers and wildlife safe.', '2025-03-04 11:33:33');
INSERT INTO `comments` VALUES (526, 23, 9, 'The noise at Campsite 23 was ridiculous. It went on all night, and no one did anything about it. Not a peaceful camping experience at all.', '2025-03-04 11:33:33');
INSERT INTO `comments` VALUES (525, 22, 6, 'Campsite 22’s restroom has been out of service for over a week. This is unacceptable, especially when there are so many campers.', '2025-03-04 11:33:33');
INSERT INTO `comments` VALUES (524, 21, 11, 'The flooding at Campsite 21 is a serious issue. I had to leave early, and it was a nightmare for the other campers as well.', '2025-03-04 11:33:33');
INSERT INTO `comments` VALUES (523, 20, 6, 'The Wi-Fi service has been down for days, and this is really inconvenient. I had planned to work during my stay, but this has ruined it.', '2025-03-04 11:30:33');
INSERT INTO `comments` VALUES (522, 19, 2, 'I’ve seen bears around Campsite 15, and it’s terrifying. More signage and clear guidelines are needed to ensure campers’ safety.', '2025-03-04 11:30:33');
INSERT INTO `comments` VALUES (521, 18, 20, 'I couldn’t set up my tent properly at Campsite 9 because my tent poles were damaged. This ruined my experience. A warning would have been helpful.', '2025-03-04 11:30:33');
INSERT INTO `comments` VALUES (520, 17, 16, 'Without trash disposal facilities, it’s really hard to keep the campsite clean. There is a huge amount of litter left behind, and it attracts wildlife.', '2025-03-04 11:30:33');
INSERT INTO `comments` VALUES (519, 16, 4, 'I got lost on the unmarked trail near Campsite 4. Proper signs are necessary for the safety of all hikers, especially in the dark.', '2025-03-04 11:30:33');
INSERT INTO `comments` VALUES (518, 15, 11, 'The lack of lighting at Campsite 11 is a major safety concern. I tripped several times while walking back to my tent after dark.', '2025-03-04 11:30:33');
INSERT INTO `comments` VALUES (517, 14, 8, 'The fence near Campsite 8 is falling apart, and it’s dangerous. It needs immediate repairs to keep campers and wildlife safe.', '2025-03-04 11:30:33');
INSERT INTO `comments` VALUES (516, 13, 9, 'The noise at Campsite 5 was ridiculous. It went on all night, and no one did anything about it. Not a peaceful camping experience at all.', '2025-03-04 11:30:33');
INSERT INTO `comments` VALUES (515, 12, 3, 'Campsite 16’s restroom has been out of service for over a week. This is unacceptable, especially when there are so many campers.', '2025-03-04 11:30:33');
INSERT INTO `comments` VALUES (514, 11, 15, 'The flooding at Campsite 12 is a serious issue. I had to leave early, and it was a nightmare for the other campers as well.', '2025-03-04 11:30:33');
INSERT INTO `comments` VALUES (513, 10, 2, 'The check-in process is indeed very slow. It should be more streamlined to avoid long waits and confusion.', '2025-03-04 11:27:47');
INSERT INTO `comments` VALUES (512, 9, 1, 'The lake area is lovely but unsafe at night. Better lighting would help prevent accidents.', '2025-03-04 11:27:47');
INSERT INTO `comments` VALUES (511, 8, 12, 'I got lost last time because of unmarked trails. Clear signage would make hiking much safer for everyone.', '2025-03-04 11:27:47');
INSERT INTO `comments` VALUES (510, 7, 9, 'Wildlife encounters are scary, especially when they come close to campsites. More precautions need to be taken.', '2025-03-04 11:27:47');
INSERT INTO `comments` VALUES (509, 6, 3, 'Restroom cleanliness has been an ongoing issue at many campsites. I hope more attention will be given to it.', '2025-03-04 11:27:47');
INSERT INTO `comments` VALUES (508, 5, 8, 'Missing fire safety equipment is a huge concern. Fire safety should always be a priority at campsites.', '2025-03-04 11:27:47');
INSERT INTO `comments` VALUES (507, 4, 5, 'Water is essential for camping. This issue needs to be fixed quickly to avoid further inconvenience for campers.', '2025-03-04 11:27:47');
INSERT INTO `comments` VALUES (506, 3, 7, 'Glad to hear this issue was resolved! Cleanliness is very important for a positive camping experience.', '2025-03-04 11:27:47');
INSERT INTO `comments` VALUES (505, 2, 6, 'I stayed at Campsite 4 last weekend, and the noise was unbearable. The camp should have stricter rules on this.', '2025-03-04 11:27:47');
INSERT INTO `comments` VALUES (504, 1, 4, 'The reservation system has been a headache for weeks. It would be great if this issue could be resolved ASAP.', '2025-03-04 11:27:47');

-- ----------------------------
-- Table structure for issues
-- ----------------------------
DROP TABLE IF EXISTS `issues`;
CREATE TABLE `issues`  (
  `issue_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('new','open','stalled','resolved') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`issue_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `k1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 378 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of issues
-- ----------------------------
INSERT INTO `issues` VALUES (1, 1, 'Campground reservation system malfunction', 'The reservation system is not displaying the correct availability of campsites, especially during weekends.', '2025-03-04 11:23:49', 'new');
INSERT INTO `issues` VALUES (2, 2, 'Noise complaint at Campsite 4', 'There has been consistent noise past 10 PM from nearby campers at site 4. Disturbing others.', '2025-03-04 11:23:50', 'open');
INSERT INTO `issues` VALUES (3, 3, 'Campground cleanliness issues', 'Campers have raised concerns about littering and improper waste disposal near the trailheads.', '2025-03-04 11:23:51', 'resolved');
INSERT INTO `issues` VALUES (4, 4, 'Broken water supply at Campsite 7', 'Water taps at Campsite 7 are not functioning, leaving campers without fresh water for days.', '2025-03-04 11:23:52', 'stalled');
INSERT INTO `issues` VALUES (5, 5, 'Lack of fire safety equipment', 'Fire extinguishers are missing at several key campfire areas, posing a fire hazard.', '2025-03-04 11:23:53', 'new');
INSERT INTO `issues` VALUES (6, 6, 'Inadequate restroom facilities', 'The restroom at the campground is frequently out of order or not clean enough to use comfortably.', '2025-03-04 11:23:54', 'resolved');
INSERT INTO `issues` VALUES (7, 7, 'Wildlife safety concerns at Campsite 2', 'There have been sightings of bears and other wildlife near the campsite, causing concern for safety.', '2025-03-04 11:23:57', 'open');
INSERT INTO `issues` VALUES (8, 8, 'Unmarked trails', 'Several hiking trails lack proper signage, making it difficult for campers to follow the right path.', '2025-03-04 11:23:57', 'new');
INSERT INTO `issues` VALUES (9, 9, 'Poor lighting near lake area', 'The area near the lake is poorly lit, creating a safety hazard for nighttime campers.', '2025-03-04 11:23:58', 'stalled');
INSERT INTO `issues` VALUES (10, 10, 'Unclear check-in process', 'The check-in process is confusing and slow, leading to long wait times and frustration for visitors.', '2025-03-04 11:23:59', 'resolved');
INSERT INTO `issues` VALUES (11, 3, 'Flooding near Campsite 12', 'Heavy rain has caused flooding in the lower areas of Campsite 12, making it uninhabitable for campers. Needs immediate attention.', '2025-03-04 11:30:11', 'new');
INSERT INTO `issues` VALUES (12, 7, 'Campsite 16 restroom issues', 'The restroom at Campsite 16 is out of order, causing inconvenience for campers in the area.', '2025-03-04 11:30:12', 'open');
INSERT INTO `issues` VALUES (13, 10, 'Unresolved noise complaint at Campsite 5', 'Campers at Campsite 5 are making excessive noise late into the night, disturbing the peace of others.', '2025-03-04 11:30:12', 'resolved');
INSERT INTO `issues` VALUES (14, 2, 'Broken fence near Campsite 8', 'A fence near Campsite 8 has fallen, which might allow wild animals to enter. It needs to be repaired urgently.', '2025-03-04 11:30:13', 'stalled');
INSERT INTO `issues` VALUES (15, 14, 'No proper lighting at Campsite 11', 'Campsite 11 lacks adequate lighting, which poses a safety risk for campers returning to their tents after dark.', '2025-03-04 11:30:14', 'new');
INSERT INTO `issues` VALUES (16, 6, 'Unmarked hiking trail near Campsite 4', 'The hiking trail near Campsite 4 has no proper signage, causing hikers to get lost. This is a serious safety concern.', '2025-03-04 11:30:15', 'resolved');
INSERT INTO `issues` VALUES (17, 1, 'Lack of trash disposal facilities', 'There is no proper trash disposal at various campsites, leading to littering and wildlife attracted to human food.', '2025-03-04 11:30:15', 'new');
INSERT INTO `issues` VALUES (18, 19, 'Damaged tent poles at Campsite 9', 'Many campers at Campsite 9 reported that their tent poles are broken due to the harsh weather, making it difficult to set up camp.', '2025-03-04 11:30:16', 'open');
INSERT INTO `issues` VALUES (19, 12, 'Wildlife sightings near Campsite 15', 'Several campers have spotted bears near Campsite 15. There is a need for more signage and safety protocols for campers.', '2025-03-04 11:30:17', 'stalled');
INSERT INTO `issues` VALUES (20, 4, 'Unreliable Wi-Fi service', 'Wi-Fi service at the campground has been down for days. Many visitors depend on it for work and communication.', '2025-03-04 11:30:19', 'resolved');
INSERT INTO `issues` VALUES (21, 12, 'Flooding near Campsite 21', 'Heavy rain has caused flooding in the lower areas of Campsite 21, making it uninhabitable for campers. Needs immediate attention.', '2025-03-04 11:33:12', 'new');
INSERT INTO `issues` VALUES (22, 5, 'Campsite 22 restroom issues', 'The restroom at Campsite 22 is out of order, causing inconvenience for campers in the area.', '2025-03-04 11:33:13', 'open');
INSERT INTO `issues` VALUES (23, 8, 'Unresolved noise complaint at Campsite 23', 'Campers at Campsite 23 are making excessive noise late into the night, disturbing the peace of others.', '2025-03-04 11:33:14', 'resolved');
INSERT INTO `issues` VALUES (24, 16, 'Broken fence near Campsite 24', 'A fence near Campsite 24 has fallen, which might allow wild animals to enter. It needs to be repaired urgently.', '2025-03-04 11:33:15', 'stalled');
INSERT INTO `issues` VALUES (25, 3, 'No proper lighting at Campsite 25', 'Campsite 25 lacks adequate lighting, which poses a safety risk for campers returning to their tents after dark.', '2025-03-04 11:33:17', 'new');
INSERT INTO `issues` VALUES (26, 7, 'Unmarked hiking trail near Campsite 26', 'The hiking trail near Campsite 26 has no proper signage, causing hikers to get lost. This is a serious safety concern.', '2025-03-04 11:33:17', 'resolved');
INSERT INTO `issues` VALUES (27, 10, 'Lack of trash disposal facilities', 'There is no proper trash disposal at various campsites, leading to littering and wildlife attracted to human food.', '2025-03-04 11:33:18', 'new');
INSERT INTO `issues` VALUES (28, 14, 'Damaged tent poles at Campsite 27', 'Many campers at Campsite 27 reported that their tent poles are broken due to the harsh weather, making it difficult to set up camp.', '2025-03-04 11:33:19', 'open');
INSERT INTO `issues` VALUES (29, 19, 'Wildlife sightings near Campsite 28', 'Several campers have spotted bears near Campsite 28. There is a need for more signage and safety protocols for campers.', '2025-03-04 11:33:20', 'stalled');
INSERT INTO `issues` VALUES (30, 1, 'Unreliable Wi-Fi service', 'Wi-Fi service at the campground has been down for days. Many visitors depend on it for work and communication.', '2025-03-04 11:33:21', 'resolved');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `profile_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role` enum('visitor','helper','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id` DESC) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (20, 'john_doe', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'john.doe@example.com', 'John', 'Doe', 'New York', 'profile1.jpg', 'helper', 'active');
INSERT INTO `users` VALUES (19, 'jane_smith', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'jane.smith@example.com', 'Jane', 'Smith', 'Los Angeles', 'profile2.jpg', 'visitor', 'inactive');
INSERT INTO `users` VALUES (18, 'michael_brown', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'michael.brown@example.com', 'Michael', 'Brown', 'Chicago', 'profile3.jpg', 'admin', 'active');
INSERT INTO `users` VALUES (17, 'lucy_white', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'lucy.white@example.com', 'Lucy', 'White', 'San Francisco', 'profile4.jpg', 'helper', 'active');
INSERT INTO `users` VALUES (16, 'david_lee', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'david.lee@example.com', 'David', 'Lee', 'Seattle', 'profile5.jpg', 'visitor', 'inactive');
INSERT INTO `users` VALUES (15, 'emma_johnson', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'emma.johnson@example.com', 'Emma', 'Johnson', 'Miami', 'profile6.jpg', 'admin', 'active');
INSERT INTO `users` VALUES (14, 'oliver_martinez', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'oliver.martinez@example.com', 'Oliver', 'Martinez', 'Houston', 'profile7.jpg', 'helper', 'active');
INSERT INTO `users` VALUES (13, 'isabella_davis', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'isabella.davis@example.com', 'Isabella', 'Davis', 'Austin', 'profile8.jpg', 'visitor', 'inactive');
INSERT INTO `users` VALUES (12, 'noah_clark', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'noah.clark@example.com', 'Noah', 'Clark', 'Boston', 'profile9.jpg', 'helper', 'active');
INSERT INTO `users` VALUES (11, 'ava_rodriguez', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'ava.rodriguez@example.com', 'Ava', 'Rodriguez', 'Dallas', 'profile10.jpg', 'admin', 'inactive');
INSERT INTO `users` VALUES (10, 'sophia_wilson', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'sophia.wilson@example.com', 'Sophia', 'Wilson', 'Phoenix', 'profile11.jpg', 'helper', 'active');
INSERT INTO `users` VALUES (9, 'mason_taylor', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'mason.taylor@example.com', 'Mason', 'Taylor', 'Denver', 'profile12.jpg', 'visitor', 'inactive');
INSERT INTO `users` VALUES (8, 'harper_hall', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'harper.hall@example.com', 'Harper', 'Hall', 'Las Vegas', 'profile13.jpg', 'helper', 'active');
INSERT INTO `users` VALUES (7, 'elijah_adams', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'elijah.adams@example.com', 'Elijah', 'Adams', 'Portland', 'profile14.jpg', 'visitor', 'inactive');
INSERT INTO `users` VALUES (6, 'amelia_hernandez', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'amelia.hernandez@example.com', 'Amelia', 'Hernandez', 'Atlanta', 'profile15.jpg', 'admin', 'active');
INSERT INTO `users` VALUES (5, 'jackson_moore', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'jackson.moore@example.com', 'Jackson', 'Moore', 'Charlotte', 'profile16.jpg', 'helper', 'inactive');
INSERT INTO `users` VALUES (4, 'mia_martin', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'mia.martin@example.com', 'Mia', 'Martin', 'San Diego', 'profile17.jpg', 'visitor', 'active');
INSERT INTO `users` VALUES (3, 'sebastian_thomas', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'sebastian.thomas@example.com', 'Sebastian', 'Thomas', 'Orlando', 'profile18.jpg', 'helper', 'active');
INSERT INTO `users` VALUES (2, 'harry_jackson', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'harry.jackson@example.com', 'Harry', 'Jackson', 'Washington DC', 'profile19.jpg', 'admin', 'inactive');
INSERT INTO `users` VALUES (1, 'ella_white', '$2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2', 'ella.white@example.com', 'Ella', 'White', 'Detroit', 'profile20.jpg', 'helper', 'active');

SET FOREIGN_KEY_CHECKS = 1;
