SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Health');
INSERT INTO `category` VALUES (2, 'Education');
INSERT INTO `category` VALUES (3, 'Animal Welfare');
INSERT INTO `category` VALUES (4, 'Community Development');
INSERT INTO `category` VALUES (5, 'Disaster Relief');

-- ----------------------------
-- Table structure for fundraiser
-- ----------------------------
DROP TABLE IF EXISTS `fundraiser`;
CREATE TABLE `fundraiser`  (
  `FUNDRAISER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORGANIZER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CAPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TARGET_FUNDING` decimal(10, 2) NOT NULL,
  `CURRENT_FUNDING` decimal(10, 2) NOT NULL,
  `CITY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ACTIVE` tinyint(1) NOT NULL,
  `CATEGORY_ID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`FUNDRAISER_ID`) USING BTREE,
  INDEX `CATEGORY_ID`(`CATEGORY_ID`) USING BTREE,
  CONSTRAINT `fundraiser_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fundraiser
-- ----------------------------
INSERT INTO `fundraiser` VALUES (1, 'Health Initiative', 'Fund a Mobile Clinic', 50000.00, 20000.00, 'Melbourne', 1, 1);
INSERT INTO `fundraiser` VALUES (2, 'Tech for Education', 'Provide Laptops for Schools', 30000.00, 18000.00, 'Sydney', 1, 2);
INSERT INTO `fundraiser` VALUES (3, 'Animal Shelter', 'Build a New Shelter', 25000.00, 15000.00, 'Brisbane', 1, 3);
INSERT INTO `fundraiser` VALUES (4, 'Community Garden', 'Create Urban Green Spaces', 20000.00, 12000.00, 'Hobart', 1, 4);
INSERT INTO `fundraiser` VALUES (5, 'Flood Relief Fund', 'Support Flood Victims', 40000.00, 25000.00, 'Lismore', 1, 5);
INSERT INTO `fundraiser` VALUES (6, 'Youth Sports Program', 'Organize Sports Events for Youth', 15000.00, 7000.00, 'Geelong', 1, 4);
INSERT INTO `fundraiser` VALUES (7, 'Mental Health Awareness', 'Run Workshops for Mental Health', 35000.00, 16000.00, 'Canberra', 1, 1);
INSERT INTO `fundraiser` VALUES (8, 'Art for Learning', 'Art Supplies for Schools', 22000.00, 11000.00, 'Adelaide', 1, 2);
INSERT INTO `fundraiser` VALUES (9, 'Wildlife Conservation', 'Protect Endangered Species', 30000.00, 13000.00, 'Gold Coast', 1, 3);
INSERT INTO `fundraiser` VALUES (10, 'Local Food Bank', 'Support the Local Food Bank', 18000.00, 9000.00, 'Wollongong', 1, 5);

SET FOREIGN_KEY_CHECKS = 1;
