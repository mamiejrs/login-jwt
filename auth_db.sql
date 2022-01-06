/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100421
 Source Host           : localhost:3306
 Source Schema         : auth_db

 Target Server Type    : MySQL
 Target Server Version : 100421
 File Encoding         : 65001

 Date: 06/01/2022 16:50:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for userdetails
-- ----------------------------
DROP TABLE IF EXISTS `userdetails`;
CREATE TABLE `userdetails`  (
  `user_detail_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `nik` bigint NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tempat_lahir` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_kelamin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `agama` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status_perkawinan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pekerjaan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kewarganegaraan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `masa_berlaku` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rt_rw` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kelurahan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kecamatan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`user_detail_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userdetails
-- ----------------------------
INSERT INTO `userdetails` VALUES (1, 3, 2147483647, 'Imam Saifuloh', '0000-00-00', 'Tangerang', 'laki-laki', 'ini alamat nya', '0', '0', '0', '0', '0000-00-00', '05/05', 'kelurahan', 'kecamatan', '2022-01-06 15:44:50', '2022-01-06 15:44:50');
INSERT INTO `userdetails` VALUES (2, 2, 2147483647, 'Imam Saifuloh', '2022-01-05', 'Tangerang', 'laki-laki', 'ini alamat nya RT/RW 05/05 Kelurahan kelurahan Kecamatan kecamatan', 'islam', 'menikah', 'peg swasta', 'WNI', 'seumur hidup', '05/05', 'kelurahan', 'kecamatan', '2022-01-06 15:53:27', '2022-01-06 15:53:27');
INSERT INTO `userdetails` VALUES (3, 1, 2147483647, 'Imam Saifuloh', '2022-01-05', 'Tangerang', 'laki-laki', 'ini alamat nya RT/RW 05/05 Kelurahan kelurahan Kecamatan kecamatan', 'islam', 'menikah', 'peg swasta', 'WNI', 'seumur hidup', '05/05', 'kelurahan', 'kecamatan', '2022-01-06 15:55:14', '2022-01-06 15:55:14');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `refresh_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'imam', 'imam@test.com', '123456', '825y8i3hnfjmsbv7gwajbl7fobqrjfvbs7gbfj2q3bgh8f42', '2022-01-06 07:06:41', '2022-01-06 07:06:41');
INSERT INTO `users` VALUES (2, 'imam_test', 'imam@test1.com', '$2a$12$JVnnU7qtNNR07UeTKxHImelXujuaG6ji9sPiWpUvnEAietQXPw.Gu', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES (3, 'imam_test2', 'imam2@test.com', '$2a$12$oCvh7S6ILzreuGekVZhwWO5woKw5B.unTX3fgqgfWyZc1QwEphjvC', NULL, '2022-01-06 14:27:35', '2022-01-06 14:27:35');
INSERT INTO `users` VALUES (4, 'imam_test3', 'imam@test3.com', '$2a$12$DuvlXtlAEsuJI2I3KWxPcOlAMYEZXVpDh/5Q/xKvAh.A5xIb3dpyq', NULL, '2022-01-06 16:00:03', '2022-01-06 16:00:03');
INSERT INTO `users` VALUES (5, 'imam_test4', 'imam@test4.com', '$2a$12$Zb.TQ9JNoUEr1QdIf5ERVufiz9Y4mpYZJpC8RqaTvj6pgIhWfnPQK', NULL, '2022-01-06 16:00:11', '2022-01-06 16:00:11');
INSERT INTO `users` VALUES (6, 'imam_test5', 'imam@test5.com', '$2a$12$64Qa5Iu/W8kGUCLaDk6C7.stxz3Xexl.fberHp10HkgdSSKyonSKa', NULL, '2022-01-06 16:00:18', '2022-01-06 16:00:18');

SET FOREIGN_KEY_CHECKS = 1;
