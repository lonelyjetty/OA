/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_mysql
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost
 Source Database       : sun

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : utf-8

 Date: 09/07/2017 17:23:10 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `admin_init`
-- ----------------------------
DROP TABLE IF EXISTS `admin_init`;
CREATE TABLE `admin_init` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `date` datetime NOT NULL,
  `state` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `admin_init`
-- ----------------------------
BEGIN;
INSERT INTO `admin_init` VALUES ('4028b88158e243d20158e243e1c00000', '2016-12-09 14:27:29', b'1');
COMMIT;

-- ----------------------------
--  Table structure for `admin_login_logout`
-- ----------------------------
DROP TABLE IF EXISTS `admin_login_logout`;
CREATE TABLE `admin_login_logout` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(255) COLLATE utf8_bin NOT NULL,
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `admin_login_logout`
-- ----------------------------
BEGIN;
INSERT INTO `admin_login_logout` VALUES ('402880f35e1a3099015e1a31d4740002', 'admin 于 2017-08-26 00:20:26 成功登录后台管理系统 ', '2017-08-26 00:20:27', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1a3099015e1a31e3000003', 'admin 于 2017-08-26 00:20:30 安全退出系统 ', '2017-08-26 00:20:31', '127.0.0.1', 'LOGOUT', 'admin'), ('402880f35e1a4713015e1a4758de0000', 'admin 于 2017-08-26 00:43:57 成功登录后台管理系统 ', '2017-08-26 00:43:57', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1a4713015e1a47a5000001', 'admin 于 2017-08-26 00:44:16 成功登录后台管理系统 ', '2017-08-26 00:44:17', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1a4713015e1a484f3d0002', 'admin 于 2017-08-26 00:45:00 成功登录后台管理系统 ', '2017-08-26 00:45:00', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1a4e09015e1a4e507b0000', 'admin 于 2017-08-26 00:51:33 成功登录后台管理系统 ', '2017-08-26 00:51:34', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1a4e09015e1a4e9e260001', 'admin 于 2017-08-26 00:51:53 成功登录后台管理系统 ', '2017-08-26 00:51:54', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1a4e09015e1a4eaa320002', 'admin 于 2017-08-26 00:51:56 安全退出系统 ', '2017-08-26 00:51:57', '127.0.0.1', 'LOGOUT', 'admin'), ('402880f35e1a4e09015e1a4ebef40003', 'admin 于 2017-08-26 00:52:01 成功登录后台管理系统 ', '2017-08-26 00:52:02', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1a5079015e1a50b0b30000', 'admin 于 2017-08-26 00:54:09 成功登录后台管理系统 ', '2017-08-26 00:54:09', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1e9323015e1e9462210000', 'admin 于 2017-08-26 20:46:34 成功登录后台管理系统 ', '2017-08-26 20:46:35', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1e9323015e1e95fcdd0001', 'admin 于 2017-08-26 20:48:19 安全退出系统 ', '2017-08-26 20:48:20', '127.0.0.1', 'LOGOUT', 'admin'), ('402880f35e1e9323015e1e965df80002', 'admin 于 2017-08-26 20:48:44 成功登录后台管理系统 ', '2017-08-26 20:48:45', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1e9323015e1e96c6510003', 'admin 于 2017-08-26 20:49:11 安全退出系统 ', '2017-08-26 20:49:11', '127.0.0.1', 'LOGOUT', 'admin'), ('402880f35e1e9323015e1e977e4c0004', 'admin 于 2017-08-26 20:49:58 成功登录后台管理系统 ', '2017-08-26 20:49:58', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1e9323015e1e97e7cb0005', 'admin 于 2017-08-26 20:50:25 安全退出系统 ', '2017-08-26 20:50:25', '127.0.0.1', 'LOGOUT', 'admin'), ('402880f35e1e9323015e1e9827600006', 'admin 于 2017-08-26 20:50:41 成功登录后台管理系统 ', '2017-08-26 20:50:42', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1e9323015e1e9836430007', 'admin 于 2017-08-26 20:50:45 安全退出系统 ', '2017-08-26 20:50:45', '127.0.0.1', 'LOGOUT', 'admin'), ('402880f35e1ea5e7015e1eaa390c0000', 'admin 于 2017-08-26 21:10:25 成功登录后台管理系统 ', '2017-08-26 21:10:26', '192.168.0.115', 'LOGIN', 'admin'), ('402880f35e1eca0a015e1ecbbb810000', 'admin 于 2017-08-26 21:47:01 成功登录后台管理系统 ', '2017-08-26 21:47:02', '192.168.0.115', 'LOGIN', 'admin'), ('402880f35e1ecf58015e1ed016b10000', 'admin 于 2017-08-26 21:51:47 成功登录后台管理系统 ', '2017-08-26 21:51:47', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1ecf58015e1ed250ce0001', 'admin 于 2017-08-26 21:54:13 成功登录后台管理系统 ', '2017-08-26 21:54:13', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1ecf58015e1ed324560002', 'admin 于 2017-08-26 21:55:07 成功登录后台管理系统 ', '2017-08-26 21:55:07', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1ecf58015e1ed3fac00003', 'admin 于 2017-08-26 21:56:02 成功登录后台管理系统 ', '2017-08-26 21:56:02', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1ef1af015e1ef30b920000', 'admin 于 2017-08-26 22:29:58 成功登录后台管理系统 ', '2017-08-26 22:29:58', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1ef1af015e1ef35d7e0001', 'admin 于 2017-08-26 22:30:19 安全退出系统 ', '2017-08-26 22:30:19', '127.0.0.1', 'LOGOUT', 'admin'), ('402880f35e1ef1af015e1ef37c340002', 'admin 于 2017-08-26 22:30:27 成功登录后台管理系统 ', '2017-08-26 22:30:27', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1ef1af015e1ef3c4c10003', 'admin 于 2017-08-26 22:30:45 安全退出系统 ', '2017-08-26 22:30:46', '127.0.0.1', 'LOGOUT', 'admin'), ('402880f35e1ef1af015e1ef3efc00004', 'admin 于 2017-08-26 22:30:56 成功登录后台管理系统 ', '2017-08-26 22:30:57', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1ef4dd015e1ef687fd0000', 'admin 于 2017-08-26 22:33:46 成功登录后台管理系统 ', '2017-08-26 22:33:47', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1ef4dd015e1ef69d380001', 'admin 于 2017-08-26 22:33:52 安全退出系统 ', '2017-08-26 22:33:52', '127.0.0.1', 'LOGOUT', 'admin'), ('402880f35e1efee1015e1eff4d720000', 'admin 于 2017-08-26 22:43:21 成功登录后台管理系统 ', '2017-08-26 22:43:22', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1f20bf015e1f216a540000', 'admin 于 2017-08-26 23:20:37 成功登录后台管理系统 ', '2017-08-26 23:20:37', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e1f20bf015e1f2216090001', 'admin 于 2017-08-26 23:21:21 成功登录后台管理系统 ', '2017-08-26 23:21:21', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e229491015e2294f5010000', 'admin 于 2017-08-27 15:25:40 成功登录后台管理系统 ', '2017-08-27 15:25:41', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e22a307015e22a50b400000', 'test 于 2017-08-27 15:43:15 成功登录后台管理系统 ', '2017-08-27 15:43:15', '127.0.0.1', 'LOGIN', 'test'), ('402880f35e22a307015e22a698700001', 'test 于 2017-08-27 15:44:56 安全退出系统 ', '2017-08-27 15:44:57', '127.0.0.1', 'LOGOUT', 'test'), ('402880f35e22a307015e22a816920002', 'admin 于 2017-08-27 15:46:34 成功登录后台管理系统 ', '2017-08-27 15:46:35', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e22b8a7015e22b94fe80000', 'test 于 2017-08-27 16:05:23 成功登录后台管理系统 ', '2017-08-27 16:05:24', '127.0.0.1', 'LOGIN', 'test'), ('402880f35e22b8a7015e22ba0a8b0001', 'test 于 2017-08-27 16:06:11 安全退出系统 ', '2017-08-27 16:06:11', '127.0.0.1', 'LOGOUT', 'test'), ('402880f35e22b8a7015e22ba1f940002', 'admin 于 2017-08-27 16:06:16 成功登录后台管理系统 ', '2017-08-27 16:06:17', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e22b8a7015e22ba35ab0003', 'admin 于 2017-08-27 16:06:22 安全退出系统 ', '2017-08-27 16:06:22', '127.0.0.1', 'LOGOUT', 'admin'), ('402880f35e22b8a7015e22ba71880004', 'test 于 2017-08-27 16:06:37 成功登录后台管理系统 ', '2017-08-27 16:06:38', '127.0.0.1', 'LOGIN', 'test'), ('402880f35e22b8a7015e22bae8a90005', 'test 于 2017-08-27 16:07:08 安全退出系统 ', '2017-08-27 16:07:08', '127.0.0.1', 'LOGOUT', 'test'), ('402880f35e22b8a7015e22bb52f50006', 'test 于 2017-08-27 16:07:35 成功登录后台管理系统 ', '2017-08-27 16:07:35', '127.0.0.1', 'LOGIN', 'test'), ('402880f35e22b8a7015e22bb68460007', 'test 于 2017-08-27 16:07:40 安全退出系统 ', '2017-08-27 16:07:41', '127.0.0.1', 'LOGOUT', 'test'), ('402880f35e22b8a7015e22bb7f6a0008', 'admin 于 2017-08-27 16:07:46 成功登录后台管理系统 ', '2017-08-27 16:07:47', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e22b8a7015e22bc6e01000a', 'gjj 于 2017-08-27 16:08:47 成功登录后台管理系统 ', '2017-08-27 16:08:48', '127.0.0.1', 'LOGIN', 'gjj'), ('402880f35e22b8a7015e22bc7c2a000b', 'gjj 于 2017-08-27 16:08:51 安全退出系统 ', '2017-08-27 16:08:51', '127.0.0.1', 'LOGOUT', 'gjj'), ('402880f35e22b8a7015e22bd2d1d000c', 'gjj 于 2017-08-27 16:09:36 成功登录后台管理系统 ', '2017-08-27 16:09:37', '127.0.0.1', 'LOGIN', 'gjj'), ('402880f35e22bf08015e22bf60590000', 'admin 于 2017-08-27 16:12:00 成功登录后台管理系统 ', '2017-08-27 16:12:01', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e23cb01015e23cb6e830000', 'admin 于 2017-08-27 21:04:48 成功登录后台管理系统 ', '2017-08-27 21:04:48', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e23cb01015e23cb7dc20001', 'admin 于 2017-08-27 21:04:52 安全退出系统 ', '2017-08-27 21:04:52', '127.0.0.1', 'LOGOUT', 'admin'), ('402880f35e23de41015e23deb7ce0000', 'admin 于 2017-08-27 21:25:52 成功登录后台管理系统 ', '2017-08-27 21:25:52', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e23de41015e23df14130001', 'admin 于 2017-08-27 21:26:15 安全退出系统 ', '2017-08-27 21:26:16', '127.0.0.1', 'LOGOUT', 'admin'), ('402880f35e23e4f0015e23e60b860000', 'admin 于 2017-08-27 21:33:52 成功登录后台管理系统 ', '2017-08-27 21:33:52', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e23e4f0015e23e625320001', 'admin 于 2017-08-27 21:33:58 安全退出系统 ', '2017-08-27 21:33:59', '127.0.0.1', 'LOGOUT', 'admin'), ('402880f35e23f6cc015e2411ed6b0000', 'admin 于 2017-08-27 22:21:48 成功登录后台管理系统 ', '2017-08-27 22:21:48', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e2412e1015e241436d20000', 'admin 于 2017-08-27 22:24:18 成功登录后台管理系统 ', '2017-08-27 22:24:18', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e241993015e2419f9580000', 'admin 于 2017-08-27 22:30:35 成功登录后台管理系统 ', '2017-08-27 22:30:36', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e24294d015e24299a380000', 'admin 于 2017-08-27 22:47:39 成功登录后台管理系统 ', '2017-08-27 22:47:40', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e242e48015e242ea8430000', 'admin 于 2017-08-27 22:53:11 成功登录后台管理系统 ', '2017-08-27 22:53:11', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e243558015e24365e4d0000', 'admin 于 2017-08-27 23:01:36 成功登录后台管理系统 ', '2017-08-27 23:01:36', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e245141015e245235de0000', 'admin 于 2017-08-27 23:32:01 成功登录后台管理系统 ', '2017-08-27 23:32:01', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e245d42015e245e2c320000', 'admin 于 2017-08-27 23:45:05 成功登录后台管理系统 ', '2017-08-27 23:45:05', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e246532015e2465f5b60000', 'admin 于 2017-08-27 23:53:35 成功登录后台管理系统 ', '2017-08-27 23:53:35', '127.0.0.1', 'LOGIN', 'admin'), ('402880f35e246ca0015e246deeed0000', 'admin 于 2017-08-28 00:02:17 成功登录后台管理系统 ', '2017-08-28 00:02:18', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e5615d4015e561630860000', 'admin 于 2017-09-06 15:27:28 成功登录后台管理系统 ', '2017-09-06 15:27:28', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e5618fb015e561965240000', 'admin 于 2017-09-06 15:30:58 成功登录后台管理系统 ', '2017-09-06 15:30:58', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e561c68015e561ce8fe0000', 'admin 于 2017-09-06 15:34:48 成功登录后台管理系统 ', '2017-09-06 15:34:49', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e56232a015e5623b1690000', 'admin 于 2017-09-06 15:42:13 成功登录后台管理系统 ', '2017-09-06 15:42:13', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e564f68015e56549cea0000', 'admin 于 2017-09-06 16:35:39 成功登录后台管理系统 ', '2017-09-06 16:35:39', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e569dd7015e56a09c770000', 'admin 于 2017-09-06 17:58:39 成功登录后台管理系统 ', '2017-09-06 17:58:40', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e569dd7015e56c6c5e60001', 'admin 于 2017-09-06 18:40:20 成功登录后台管理系统 ', '2017-09-06 18:40:21', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e56f350015e56f3cd0b0000', 'admin 于 2017-09-06 19:29:31 成功登录后台管理系统 ', '2017-09-06 19:29:32', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e56f4d2015e56f559630000', 'admin 于 2017-09-06 19:31:13 成功登录后台管理系统 ', '2017-09-06 19:31:13', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e56f72b015e56f790910000', 'admin 于 2017-09-06 19:33:38 成功登录后台管理系统 ', '2017-09-06 19:33:39', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e570e18015e570e773c0000', 'admin 于 2017-09-06 19:58:39 成功登录后台管理系统 ', '2017-09-06 19:58:39', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e57226d015e5722e6ac0000', 'admin 于 2017-09-06 20:20:58 成功登录后台管理系统 ', '2017-09-06 20:20:59', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e57226d015e573323b20001', 'admin 于 2017-09-06 20:38:42 安全退出系统 ', '2017-09-06 20:38:43', '127.0.0.1', 'LOGOUT', 'admin'), ('402881f85e57226d015e573385760002', 'admin 于 2017-09-06 20:39:07 成功登录后台管理系统 ', '2017-09-06 20:39:08', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e574725015e5747895f0000', 'admin 于 2017-09-06 21:00:59 成功登录后台管理系统 ', '2017-09-06 21:01:00', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e5765c8015e57662b300000', 'admin 于 2017-09-06 21:34:27 成功登录后台管理系统 ', '2017-09-06 21:34:27', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e5768c6015e576c1a4f0000', 'admin 于 2017-09-06 21:40:56 成功登录后台管理系统 ', '2017-09-06 21:40:56', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e57866f015e5786e0a60000', 'admin 于 2017-09-06 22:10:10 成功登录后台管理系统 ', '2017-09-06 22:10:11', '127.0.0.1', 'LOGIN', 'admin'), ('402881f85e57866f015e57a3bc9e0002', 'admin 于 2017-09-06 22:41:42 成功登录后台管理系统 ', '2017-09-06 22:41:42', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e1d26ab015e1d2770b30000', 'admin 于 2017-08-26 14:07:57 成功登录后台管理系统 ', '2017-08-26 14:07:58', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e1d3691015e1d3892ca0000', 'admin 于 2017-08-26 14:26:40 成功登录后台管理系统 ', '2017-08-26 14:26:40', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e1e44c1015e1e45c5c90000', 'admin 于 2017-08-26 19:20:42 成功登录后台管理系统 ', '2017-08-26 19:20:43', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e1e44c1015e1e464e880001', 'admin 于 2017-08-26 19:21:17 成功登录后台管理系统 ', '2017-08-26 19:21:18', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e1e44c1015e1e474c310002', 'admin 于 2017-08-26 19:22:22 安全退出系统 ', '2017-08-26 19:22:23', '127.0.0.1', 'LOGOUT', 'admin'), ('4028d86b5e1e44c1015e1e47c5640003', 'admin 于 2017-08-26 19:22:53 成功登录后台管理系统 ', '2017-08-26 19:22:54', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e1e44c1015e1e4857120004', 'admin 于 2017-08-26 19:23:30 安全退出系统 ', '2017-08-26 19:23:31', '127.0.0.1', 'LOGOUT', 'admin'), ('4028d86b5e1e48fc015e1e4a23c00000', 'admin 于 2017-08-26 19:25:28 成功登录后台管理系统 ', '2017-08-26 19:25:29', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e1e48fc015e1e4a35600001', 'admin 于 2017-08-26 19:25:33 安全退出系统 ', '2017-08-26 19:25:33', '127.0.0.1', 'LOGOUT', 'admin'), ('4028d86b5e1e4b15015e1e4bbcec0000', 'admin 于 2017-08-26 19:27:13 成功登录后台管理系统 ', '2017-08-26 19:27:14', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e1e4b15015e1e4d69dc0001', 'admin 于 2017-08-26 19:29:03 成功登录后台管理系统 ', '2017-08-26 19:29:03', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e1e4b15015e1e4e336d0002', 'admin 于 2017-08-26 19:29:55 安全退出系统 ', '2017-08-26 19:29:55', '127.0.0.1', 'LOGOUT', 'admin'), ('4028d86b5e1e4b15015e1e50786e0003', 'admin 于 2017-08-26 19:32:23 成功登录后台管理系统 ', '2017-08-26 19:32:24', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e1e4b15015e1e54c6170004', 'admin 于 2017-08-26 19:37:05 成功登录后台管理系统 ', '2017-08-26 19:37:06', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e1e5fb8015e1e60e8f30000', 'admin 于 2017-08-26 19:50:21 成功登录后台管理系统 ', '2017-08-26 19:50:21', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e1e6473015e1e64f6a90000', 'admin 于 2017-08-26 19:54:46 成功登录后台管理系统 ', '2017-08-26 19:54:47', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e2792f9015e27944cca0000', 'admin 于 2017-08-28 14:43:03 成功登录后台管理系统 ', '2017-08-28 14:43:04', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e2792f9015e27956dff0001', 'admin 于 2017-08-28 14:44:18 成功登录后台管理系统 ', '2017-08-28 14:44:18', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e27a3b4015e27a5f0130000', 'admin 于 2017-08-28 15:02:19 成功登录后台管理系统 ', '2017-08-28 15:02:20', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e27a6fc015e27a76ea00000', 'admin 于 2017-08-28 15:03:57 成功登录后台管理系统 ', '2017-08-28 15:03:58', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e286945015e286c88ec0000', 'admin 于 2017-08-28 18:39:15 成功登录后台管理系统 ', '2017-08-28 18:39:15', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e286945015e28961aa40001', 'admin 于 2017-08-28 19:24:39 成功登录后台管理系统 ', '2017-08-28 19:24:39', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e286945015e28962c990002', 'admin 于 2017-08-28 19:24:44 安全退出系统 ', '2017-08-28 19:24:44', '127.0.0.1', 'LOGOUT', 'admin'), ('4028d86b5e286945015e2898b6830003', 'admin 于 2017-08-28 19:27:30 成功登录后台管理系统 ', '2017-08-28 19:27:30', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e286945015e2898c8ed0004', 'admin 于 2017-08-28 19:27:35 安全退出系统 ', '2017-08-28 19:27:35', '127.0.0.1', 'LOGOUT', 'admin'), ('4028d86b5e28e60e015e28e932ac0000', 'admin 于 2017-08-28 20:55:25 成功登录后台管理系统 ', '2017-08-28 20:55:25', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e28f413015e28f878290000', 'admin 于 2017-08-28 21:12:05 成功登录后台管理系统 ', '2017-08-28 21:12:06', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e28f413015e28f88a990001', 'admin 于 2017-08-28 21:12:10 安全退出系统 ', '2017-08-28 21:12:11', '127.0.0.1', 'LOGOUT', 'admin'), ('4028d86b5e29054d015e290733e00000', 'admin 于 2017-08-28 21:28:11 成功登录后台管理系统 ', '2017-08-28 21:28:11', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e292673015e292a00eb0000', 'admin 于 2017-08-28 22:06:12 成功登录后台管理系统 ', '2017-08-28 22:06:12', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e292673015e292a32310001', 'admin 于 2017-08-28 22:06:24 安全退出系统 ', '2017-08-28 22:06:25', '127.0.0.1', 'LOGOUT', 'admin'), ('4028d86b5e292673015e292a62c90002', 'admin 于 2017-08-28 22:06:37 成功登录后台管理系统 ', '2017-08-28 22:06:37', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e2bd542015e2bd61ca50000', 'admin 于 2017-08-29 10:33:25 成功登录后台管理系统 ', '2017-08-29 10:33:26', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e2bd542015e2bd63df80001', 'admin 于 2017-08-29 10:33:34 安全退出系统 ', '2017-08-29 10:33:34', '127.0.0.1', 'LOGOUT', 'admin'), ('4028d86b5e2bd7b2015e2bd8f6780000', 'admin 于 2017-08-29 10:36:32 成功登录后台管理系统 ', '2017-08-29 10:36:33', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e4fa789015e4fb5886b0000', 'admin 于 2017-09-05 09:44:10 成功登录后台管理系统 ', '2017-09-05 09:44:11', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e4fdbc7015e4fddadb10000', 'admin 于 2017-09-05 10:28:01 成功登录后台管理系统 ', '2017-09-05 10:28:02', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e4fde89015e4fdfd9f60000', 'admin 于 2017-09-05 10:30:23 成功登录后台管理系统 ', '2017-09-05 10:30:24', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e500725015e500827ff0000', 'admin 于 2017-09-05 11:14:25 成功登录后台管理系统 ', '2017-09-05 11:14:25', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e500a0c015e500a85180000', 'admin 于 2017-09-05 11:17:00 成功登录后台管理系统 ', '2017-09-05 11:17:00', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e500a0c015e5064ba890001', 'admin 于 2017-09-05 12:55:32 成功登录后台管理系统 ', '2017-09-05 12:55:32', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e50b32f015e50b3a2150000', 'admin 于 2017-09-05 14:21:43 成功登录后台管理系统 ', '2017-09-05 14:21:43', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e50bbb0015e50bd82b50000', 'admin 于 2017-09-05 14:32:30 成功登录后台管理系统 ', '2017-09-05 14:32:31', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e5169ce015e516a2dda0000', 'admin 于 2017-09-05 17:41:06 成功登录后台管理系统 ', '2017-09-05 17:41:07', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e516bc1015e516c27940000', 'admin 于 2017-09-05 17:43:16 成功登录后台管理系统 ', '2017-09-05 17:43:16', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e516df2015e516e50d30000', 'admin 于 2017-09-05 17:45:37 成功登录后台管理系统 ', '2017-09-05 17:45:38', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e516fd7015e5170786b0000', 'admin 于 2017-09-05 17:47:58 成功登录后台管理系统 ', '2017-09-05 17:47:59', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e516fd7015e51b22dd10001', 'admin 于 2017-09-05 18:59:45 成功登录后台管理系统 ', '2017-09-05 18:59:45', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e51bbe1015e51bc41a70000', 'admin 于 2017-09-05 19:10:45 成功登录后台管理系统 ', '2017-09-05 19:10:46', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e51bdd2015e51be7e020000', 'admin 于 2017-09-05 19:13:12 成功登录后台管理系统 ', '2017-09-05 19:13:12', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e51c5ae015e51c64b000000', 'admin 于 2017-09-05 19:21:43 成功登录后台管理系统 ', '2017-09-05 19:21:43', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e51de9c015e51df38950000', 'admin 于 2017-09-05 19:48:57 成功登录后台管理系统 ', '2017-09-05 19:48:57', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e51e3c7015e51e462470000', 'admin 于 2017-09-05 19:54:35 成功登录后台管理系统 ', '2017-09-05 19:54:35', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e51f829015e51f912ee0000', 'admin 于 2017-09-05 20:17:11 成功登录后台管理系统 ', '2017-09-05 20:17:11', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e51fbbf015e51fc27200000', 'admin 于 2017-09-05 20:20:33 成功登录后台管理系统 ', '2017-09-05 20:20:33', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e51fd52015e51fdc7d40000', 'admin 于 2017-09-05 20:22:19 成功登录后台管理系统 ', '2017-09-05 20:22:20', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e520bec015e520c4f070000', 'admin 于 2017-09-05 20:38:11 成功登录后台管理系统 ', '2017-09-05 20:38:12', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e520dfc015e520e599a0000', 'admin 于 2017-09-05 20:40:25 成功登录后台管理系统 ', '2017-09-05 20:40:26', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e520fd9015e5210397a0000', 'admin 于 2017-09-05 20:42:28 成功登录后台管理系统 ', '2017-09-05 20:42:29', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e522a9e015e522b28500000', 'admin 于 2017-09-05 21:11:53 成功登录后台管理系统 ', '2017-09-05 21:11:54', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e526e5d015e526f25ab0000', 'admin 于 2017-09-05 22:26:09 成功登录后台管理系统 ', '2017-09-05 22:26:09', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e5274f7015e5275547c0000', 'admin 于 2017-09-05 22:32:54 成功登录后台管理系统 ', '2017-09-05 22:32:55', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e528848015e5288a5cb0000', 'admin 于 2017-09-05 22:54:00 成功登录后台管理系统 ', '2017-09-05 22:54:01', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e52a0aa015e52a110130000', 'admin 于 2017-09-05 23:20:40 成功登录后台管理系统 ', '2017-09-05 23:20:41', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e52b442015e52b4be2d0000', 'admin 于 2017-09-05 23:42:10 成功登录后台管理系统 ', '2017-09-05 23:42:10', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e52cfad015e52d008980000', 'admin 于 2017-09-06 00:11:58 成功登录后台管理系统 ', '2017-09-06 00:11:59', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e54c2b2015e54c312e00000', 'admin 于 2017-09-06 09:17:04 成功登录后台管理系统 ', '2017-09-06 09:17:04', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e553774015e5537ca5f0000', 'admin 于 2017-09-06 11:24:33 成功登录后台管理系统 ', '2017-09-06 11:24:33', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e554506015e554569080000', 'admin 于 2017-09-06 11:39:25 成功登录后台管理系统 ', '2017-09-06 11:39:26', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e5546ff015e55476dac0000', 'admin 于 2017-09-06 11:41:38 成功登录后台管理系统 ', '2017-09-06 11:41:38', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e555472015e5554db8e0000', 'admin 于 2017-09-06 11:56:18 成功登录后台管理系统 ', '2017-09-06 11:56:18', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e5558a3015e5558f4960000', 'admin 于 2017-09-06 12:00:46 成功登录后台管理系统 ', '2017-09-06 12:00:47', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e55624c015e5562a37a0000', 'admin 于 2017-09-06 12:11:21 成功登录后台管理系统 ', '2017-09-06 12:11:21', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e5565d5015e55662fa00000', 'admin 于 2017-09-06 12:15:13 成功登录后台管理系统 ', '2017-09-06 12:15:14', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e557c15015e557c64670000', 'admin 于 2017-09-06 12:39:29 成功登录后台管理系统 ', '2017-09-06 12:39:29', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e557c15015e55cdecf70005', 'admin 于 2017-09-06 14:08:32 成功登录后台管理系统 ', '2017-09-06 14:08:33', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e5a56cf015e5a57bb2d0000', 'admin 于 2017-09-07 11:17:32 成功登录后台管理系统 ', '2017-09-07 11:17:33', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e5a638c015e5a63f9860000', 'admin 于 2017-09-07 11:30:54 成功登录后台管理系统 ', '2017-09-07 11:30:55', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e5a7c78015e5a7cfb3e0000', 'admin 于 2017-09-07 11:58:13 成功登录后台管理系统 ', '2017-09-07 11:58:14', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e5a7ff3015e5a8058160000', 'admin 于 2017-09-07 12:01:54 成功登录后台管理系统 ', '2017-09-07 12:01:54', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e5a7ff3015e5ad796080002', 'admin 于 2017-09-07 13:37:11 成功登录后台管理系统 ', '2017-09-07 13:37:12', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e5a7ff3015e5b2a1ddb0003', 'admin 于 2017-09-07 15:07:20 成功登录后台管理系统 ', '2017-09-07 15:07:20', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e5b87e0015e5b884bbb0000', 'admin 于 2017-09-07 16:50:12 成功登录后台管理系统 ', '2017-09-07 16:50:13', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e5b8d40015e5b8f7ec50000', 'admin 于 2017-09-07 16:58:04 成功登录后台管理系统 ', '2017-09-07 16:58:04', '127.0.0.1', 'LOGIN', 'admin'), ('4028d86b5e5ba322015e5ba475290000', 'admin 于 2017-09-07 17:20:58 成功登录后台管理系统 ', '2017-09-07 17:20:58', '127.0.0.1', 'LOGIN', 'admin');
COMMIT;

-- ----------------------------
--  Table structure for `admin_organization`
-- ----------------------------
DROP TABLE IF EXISTS `admin_organization`;
CREATE TABLE `admin_organization` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `expanded` bit(1) NOT NULL,
  `isleaf` bit(1) NOT NULL,
  `level` int(11) NOT NULL,
  `loaded` bit(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `admin_organization`
-- ----------------------------
BEGIN;
INSERT INTO `admin_organization` VALUES ('1', b'1', b'0', '0', b'1', '组织机构', '0'), ('2', b'1', b'1', '1', b'1', '部门测试', '1');
COMMIT;

-- ----------------------------
--  Table structure for `admin_resource`
-- ----------------------------
DROP TABLE IF EXISTS `admin_resource`;
CREATE TABLE `admin_resource` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `expanded` bit(1) NOT NULL,
  `icon` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_initialized` bit(1) NOT NULL,
  `isleaf` bit(1) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `loaded` bit(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8_bin NOT NULL,
  `root` bit(1) DEFAULT NULL,
  `sort_num` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `admin_resource`
-- ----------------------------
BEGIN;
INSERT INTO `admin_resource` VALUES ('1', b'1', null, b'1', b'0', '0', b'1', '资源', '0', 'root', b'1', '-1', 'ROOT', null), ('10', b'1', '', b'1', b'1', '3', b'1', '角色删除', '7', 'sys:role:delete', b'0', '2', 'ACTION', ''), ('11', b'1', '', b'1', b'0', '2', b'1', '部门管理', '2', 'sys:organization:view', b'0', '3', 'MENU', '/organization'), ('12', b'1', '', b'1', b'1', '3', b'1', '部门新增', '11', 'sys:organization:create', b'0', '0', 'ACTION', ''), ('13', b'1', '', b'1', b'1', '3', b'1', '部门修改', '11', 'sys:organization:update', b'0', '1', 'ACTION', ''), ('14', b'1', '', b'1', b'1', '3', b'1', '部门删除', '11', 'sys:organization:delete', b'0', '2', 'ACTION', ''), ('15', b'1', '', b'1', b'0', '2', b'1', '资源管理', '2', 'sys:resource:view', b'0', '2', 'MENU', '/resource'), ('16', b'1', '', b'1', b'1', '3', b'1', '资源新增', '15', 'sys:resource:create', b'0', '0', 'ACTION', ''), ('17', b'1', '', b'1', b'1', '3', b'1', '资源修改', '15', 'sys:resource:update', b'0', '1', 'ACTION', ''), ('18', b'1', '', b'1', b'1', '3', b'1', '资源删除', '15', 'sys:resource:delete', b'0', '2', 'ACTION', ''), ('19', b'1', '', b'1', b'0', '2', b'1', '登录退出', '2', 'sys:loginlogout:view', b'0', '4', 'MENU', '/loginlogout'), ('2', b'1', 'glyphicon glyphicon-align-justify', b'1', b'0', '1', b'1', '系统管理', '1', 'sys:view', b'0', '99', 'COLUMN', ''), ('20', b'1', 'glyphicon', b'0', b'1', '3', b'1', '密码重置', '3', 'sys:password:reset', b'0', '3', 'ACTION', ''), ('3', b'1', '', b'1', b'0', '2', b'1', '用户管理', '2', 'sys:user:view', b'0', '0', 'MENU', '/user'), ('4', b'1', '', b'1', b'1', '3', b'1', '用户新增', '3', 'sys:user:create', b'0', '0', 'ACTION', ''), ('402881f85e56232a015e562642760001', b'1', 'glyphicon glyphicon-align-right', b'0', b'0', '1', b'1', '6项基础数据', '1', 'data:view', b'0', '1', 'COLUMN', ''), ('402881f85e56232a015e56282a300003', b'1', 'glyphicon', b'0', b'1', '2', b'1', '运动数据', '402881f85e56232a015e562642760001', 'sport_data:view', b'0', '1', 'MENU', '/sport_data'), ('402881f85e56232a015e5628aaa70004', b'1', 'glyphicon', b'0', b'1', '2', b'1', '睡眠数据', '402881f85e56232a015e562642760001', 'sleep_data:view', b'0', '2', 'MENU', '/sleep_data'), ('402881f85e56232a015e5629687d0005', b'1', 'glyphicon', b'0', b'1', '2', b'1', '血压数据', '402881f85e56232a015e562642760001', 'bp_data:view', b'0', '3', 'MENU', '/bp_data'), ('402881f85e56232a015e562a63b30006', b'1', 'glyphicon', b'0', b'1', '2', b'1', '血糖数据', '402881f85e56232a015e562642760001', 'glu_data:view', b'0', '4', 'MENU', '/glu_data'), ('402881f85e56232a015e562b2d280007', b'1', 'glyphicon', b'0', b'1', '2', b'1', '瘦身数据', '402881f85e56232a015e562642760001', 'loseweight_data:view', b'0', '5', 'MENU', '/loseweight_data'), ('402881f85e56232a015e562bf37e0008', b'1', 'glyphicon', b'0', b'1', '2', b'1', '体温数据', '402881f85e56232a015e562642760001', 'temperature_data:view', b'0', '6', 'MENU', '/temperature_data'), ('4028d83b58f10ffc0158f110b28c0001', b'1', 'glyphicon glyphicon-eye-open', b'0', b'1', '1', b'1', '测试', '1', 'test:test1:view', b'0', '98', 'COLUMN', ''), ('4028d86b5e4fa789015e4fbb7f340003', b'1', 'glyphicon glyphicon-play-circle', b'0', b'0', '1', b'1', '运营管理', '1', 'operate:view', b'0', '3', 'COLUMN', ''), ('4028d86b5e4fde89015e4fe0f3d90001', b'1', 'glyphicon', b'0', b'1', '2', b'1', '启动页管理', '4028d86b5e4fa789015e4fbb7f340003', 'boot:view', b'0', '2', 'MENU', '/boot'), ('4028d86b5e528848015e528933740001', b'1', 'glyphicon', b'0', b'1', '2', b'1', 'Banner管理', '4028d86b5e4fa789015e4fbb7f340003', 'banner:view', b'0', '1', 'MENU', '/banner'), ('5', b'1', '', b'1', b'1', '3', b'1', '用户修改', '3', 'sys:user:update', b'0', '1', 'ACTION', ''), ('6', b'1', '', b'1', b'1', '3', b'1', '用户删除', '3', 'sys:user:delete', b'0', '2', 'ACTION', ''), ('7', b'1', '', b'1', b'0', '2', b'1', '角色管理', '2', 'sys:role:view', b'0', '1', 'MENU', '/role'), ('8', b'1', '', b'1', b'1', '3', b'1', '角色新增', '7', 'sys:role:create', b'0', '0', 'ACTION', ''), ('9', b'1', '', b'1', b'1', '3', b'1', '角色修改', '7', 'sys:role:update', b'0', '1', 'ACTION', '');
COMMIT;

-- ----------------------------
--  Table structure for `admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `admin_role`
-- ----------------------------
BEGIN;
INSERT INTO `admin_role` VALUES ('1', '超级管理员', 'admin'), ('4028d83b58f10ffc0158f11110890002', 'user', 'user');
COMMIT;

-- ----------------------------
--  Table structure for `admin_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_resource`;
CREATE TABLE `admin_role_resource` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `resourceid` varchar(255) COLLATE utf8_bin NOT NULL,
  `roleid` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq04scdraic0dm4mo49jkticug` (`resourceid`),
  KEY `FK2e1cgfujbdvtvc8my4bosyud2` (`roleid`),
  CONSTRAINT `FK2e1cgfujbdvtvc8my4bosyud2` FOREIGN KEY (`roleid`) REFERENCES `admin_role` (`id`),
  CONSTRAINT `FKq04scdraic0dm4mo49jkticug` FOREIGN KEY (`resourceid`) REFERENCES `admin_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `admin_role_resource`
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_resource` VALUES ('1', '2', '1'), ('10', '15', '1'), ('11', '16', '1'), ('12', '17', '1'), ('13', '18', '1'), ('14', '11', '1'), ('15', '12', '1'), ('16', '13', '1'), ('17', '14', '1'), ('18', '19', '1'), ('19', '20', '1'), ('2', '3', '1'), ('3', '4', '1'), ('4', '5', '1'), ('402881f85e56232a015e562689cf0002', '402881f85e56232a015e562642760001', '1'), ('402881f85e56232a015e562c6d740009', '402881f85e56232a015e56282a300003', '1'), ('402881f85e56232a015e562c6fe3000a', '402881f85e56232a015e5628aaa70004', '1'), ('402881f85e56232a015e562c7262000b', '402881f85e56232a015e5629687d0005', '1'), ('402881f85e56232a015e562c750c000c', '402881f85e56232a015e562a63b30006', '1'), ('402881f85e56232a015e562c77e3000d', '402881f85e56232a015e562b2d280007', '1'), ('402881f85e56232a015e562c7acf000e', '402881f85e56232a015e562bf37e0008', '1'), ('4028d83b58f10ffc0158f1943faf000a', '2', '4028d83b58f10ffc0158f11110890002'), ('4028d83b58f10ffc0158f19660e9000c', '19', '4028d83b58f10ffc0158f11110890002'), ('4028d83b58f10ffc0158f196943d000d', '4028d83b58f10ffc0158f110b28c0001', '4028d83b58f10ffc0158f11110890002'), ('4028d86b5e4fa789015e4fbb982c0004', '4028d86b5e4fa789015e4fbb7f340003', '1'), ('4028d86b5e4fde89015e4fe10d920002', '4028d86b5e4fde89015e4fe0f3d90001', '1'), ('4028d86b5e528848015e528947430002', '4028d86b5e528848015e528933740001', '1'), ('5', '6', '1'), ('6', '7', '1'), ('7', '8', '1'), ('8', '9', '1'), ('9', '10', '1');
COMMIT;

-- ----------------------------
--  Table structure for `admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `create_time` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `locked` bit(1) NOT NULL,
  `organization_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `password_update_time` datetime DEFAULT NULL,
  `username` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_lvod9bfm438ex1071ku1glb70` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `admin_user`
-- ----------------------------
BEGIN;
INSERT INTO `admin_user` VALUES ('1', '2016-01-01 00:00:00', 'sdevil507@163.com', '2017-09-07 17:20:58', b'0', '2', 'be05977add575832dc52655d4ad5c42e', '2016-01-01 00:00:00', 'admin'), ('4028b88158e243d20158e244c6fc0002', '2016-12-09 14:28:28', 'test1@163.com', '2017-08-27 16:07:35', b'0', '2', '126cfbcd4d16ae6d25c9bfcae76d8ee4', '2017-08-27 16:07:05', 'test');
COMMIT;

-- ----------------------------
--  Table structure for `admin_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role` (
  `userid` varchar(255) COLLATE utf8_bin NOT NULL,
  `roleid` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`roleid`,`userid`),
  KEY `FK7qut35m6ve8ecxco1tlg11kki` (`userid`),
  CONSTRAINT `FK7qut35m6ve8ecxco1tlg11kki` FOREIGN KEY (`userid`) REFERENCES `admin_user` (`id`),
  CONSTRAINT `FKje0w5pddf34j5wc4e4550ux4t` FOREIGN KEY (`roleid`) REFERENCES `admin_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `admin_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `admin_user_role` VALUES ('1', '1'), ('4028b88158e243d20158e244c6fc0002', '4028d83b58f10ffc0158f11110890002');
COMMIT;

-- ----------------------------
--  Table structure for `app_banner`
-- ----------------------------
DROP TABLE IF EXISTS `app_banner`;
CREATE TABLE `app_banner` (
  `id` varchar(255) NOT NULL,
  `banner_position_enum` varchar(255) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pic_url` varchar(255) DEFAULT NULL,
  `serial_num` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `target_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `app_banner`
-- ----------------------------
BEGIN;
INSERT INTO `app_banner` VALUES ('402881f85e57866f015e57878da10001', 'HOME', '2017-09-22 00:00:00', '333', '8daf1a5b-adf9-42f3-b7fa-801741506394.jpg', '333', '2017-09-13 00:00:00', ''), ('4028d86b5e55624c015e55632b580001', 'INFORMATION', '2017-09-22 00:00:00', 'b1', 'ac6acb9b-f5fa-45f0-98a0-d248a38b07b5.jpg', '2', '2017-09-06 00:00:00', 'www.baidu.com'), ('4028d86b5e557c15015e558183a80001', 'MIAO_GROUP', '2017-09-15 00:00:00', '2', '8a769785-435a-4c16-971a-443d31820a63.jpg', '2', '2017-09-08 00:00:00', '');
COMMIT;

-- ----------------------------
--  Table structure for `app_boot`
-- ----------------------------
DROP TABLE IF EXISTS `app_boot`;
CREATE TABLE `app_boot` (
  `id` varchar(255) NOT NULL COMMENT 'uuid',
  `serial_num` int(11) NOT NULL COMMENT '排序序号',
  `remark_name` varchar(255) NOT NULL COMMENT '备注名称',
  `pic_url` varchar(500) NOT NULL COMMENT '图片地址',
  `target_url` varchar(255) NOT NULL COMMENT '跳转地址',
  `boot_online_state_enum` varchar(255) DEFAULT NULL COMMENT '在线状态',
  `end_time` datetime DEFAULT NULL COMMENT '启始时间',
  `start_time` datetime DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `app_boot`
-- ----------------------------
BEGIN;
INSERT INTO `app_boot` VALUES ('4028d86b5e522a9e015e5269835d0001', '1', 'CE', 'e2170072-df3e-4d04-a6f5-2aa628646d75.jpg', '中文测试', 'OFFLINE', '2017-09-20 00:00:00', '2017-09-05 00:00:00'), ('4028d86b5e557c15015e5581e63b0002', '1', '1', 'c7eeafdc-9483-462f-9ba5-fe7f8186f6e7.png', '', 'ONLINE', '2017-09-21 00:00:00', '2017-09-12 00:00:00'), ('4028d86b5e557c15015e558226330003', '3', '13', '79f8bd31-52b1-4bb8-ab68-cc3d231b7e7c.jpg', '', 'ONLINE', '2017-09-28 00:00:00', '2017-09-13 00:00:00'), ('4028d86b5e557c15015e55825b9c0004', '4', '14', '8372ea3b-066c-44ba-babf-e0307ec72c5e.jpg', '', 'OFFLINE', '2017-09-30 00:00:00', '2017-09-27 00:00:00'), ('4028d86b5e5a638c015e5a7b747d0001', '100', 'xxx', '465d9631-863f-4bf0-bdee-2b17efc34691.jpg', '', 'OFFLINE', '2017-09-28 00:00:00', '2017-09-12 00:00:00'), ('4028d86b5e5a7ff3015e5a80b3bf0001', '111', 'sss', '7d46297d-5e0f-480e-99d6-cdf4c8ca7721.png', '', 'OFFLINE', '2017-09-12 00:00:00', '2017-09-05 00:00:00'), ('5', '5', '19', '8372ea3b-066c-44ba-babf-e0307ec72c5e.jpg', '', 'OFFLINE', '2017-09-30 00:00:00', '2017-09-27 00:00:00'), ('6', '6', '18', '8372ea3b-066c-44ba-babf-e0307ec72c5e.jpg', '', 'OFFLINE', '2017-09-30 00:00:00', '2017-09-27 00:00:00'), ('7', '7', '17', '8372ea3b-066c-44ba-babf-e0307ec72c5e.jpg', '', 'OFFLINE', '2017-09-30 00:00:00', '2017-09-27 00:00:00'), ('8', '8', '16', '8372ea3b-066c-44ba-babf-e0307ec72c5e.jpg', '', 'OFFLINE', '2017-09-30 00:00:00', '2017-09-27 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `hd_blood_pressure_record`
-- ----------------------------
DROP TABLE IF EXISTS `hd_blood_pressure_record`;
CREATE TABLE `hd_blood_pressure_record` (
  `id` varchar(255) NOT NULL,
  `appid` varchar(255) NOT NULL,
  `device_sn` varchar(50) DEFAULT NULL,
  `device_no` varchar(50) DEFAULT NULL,
  `profile_id` varchar(255) DEFAULT NULL,
  `high_press` int(11) DEFAULT NULL,
  `low_press` int(11) DEFAULT NULL,
  `avg_press_value` int(11) DEFAULT NULL,
  `heart_rate` int(11) DEFAULT NULL,
  `heart_rate_level` int(11) DEFAULT NULL,
  `blood_press_level` int(11) DEFAULT NULL,
  `blood_press_trend` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `data_source` varchar(50) DEFAULT NULL,
  `part_of_day` varchar(10) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL,
  `display` int(11) DEFAULT NULL,
  `measure_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `hd_blood_pressure_record`
-- ----------------------------
BEGIN;
INSERT INTO `hd_blood_pressure_record` VALUES ('1', '1', '11', '1', '1', '1', '1', '1', '1', '2', '2', '2', '2017-08-22 11:33:28', '1', '1', '0', '1', '2017-08-21 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `hd_sleep_data`
-- ----------------------------
DROP TABLE IF EXISTS `hd_sleep_data`;
CREATE TABLE `hd_sleep_data` (
  `id` varchar(255) NOT NULL,
  `appid` varchar(255) NOT NULL,
  `device_sn` varchar(50) DEFAULT NULL,
  `device_no` varchar(50) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `profile_id` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `effect_duration` int(11) DEFAULT NULL,
  `quality` varchar(10) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `memo` varchar(2000) DEFAULT NULL,
  `data_source` varchar(50) DEFAULT NULL,
  `display` int(11) DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `hd_sleep_data`
-- ----------------------------
BEGIN;
INSERT INTO `hd_sleep_data` VALUES ('1', '1', '1', '1', '2017-08-21 11:46:56', '1', '1', '1', '1', '2017-08-21 00:00:00', '1', '1', '1', '2017-08-21 11:47:56', '2017-08-29 11:48:00');
COMMIT;

-- ----------------------------
--  Table structure for `hd_sport_data`
-- ----------------------------
DROP TABLE IF EXISTS `hd_sport_data`;
CREATE TABLE `hd_sport_data` (
  `id` varchar(255) NOT NULL,
  `appid` varchar(255) NOT NULL,
  `device_sn` varchar(50) DEFAULT NULL,
  `device_no` varchar(50) DEFAULT NULL,
  `profile_id` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `calories` double(9,3) DEFAULT NULL,
  `distance` double(9,2) DEFAULT NULL,
  `steps` int(11) DEFAULT NULL,
  `speed` double(9,3) DEFAULT NULL,
  `sport_item` varchar(10) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `memo` varchar(2000) DEFAULT NULL,
  `data_source` varchar(50) DEFAULT NULL,
  `heart_rate` int(11) DEFAULT NULL,
  `display` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `hd_sport_data`
-- ----------------------------
BEGIN;
INSERT INTO `hd_sport_data` VALUES ('1', '1', '1', '1', '2', '2017-08-21 19:20:09', '1.000', '1.00', '1', '1.000', '1', '1', '10000', '2017-08-21 00:00:00', '1', '1', '1', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
