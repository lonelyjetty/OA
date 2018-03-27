/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : zz

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2018-01-08 09:43:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `aboutus`
-- ----------------------------
DROP TABLE IF EXISTS `aboutus`;
CREATE TABLE `aboutus` (
  `id` varchar(255) NOT NULL,
  `content` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aboutus
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_flow`
-- ----------------------------
DROP TABLE IF EXISTS `activity_flow`;
CREATE TABLE `activity_flow` (
  `id` int(11) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `face_value` float(10,2) default '0.00',
  `mobile` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_flow
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_hots`
-- ----------------------------
DROP TABLE IF EXISTS `activity_hots`;
CREATE TABLE `activity_hots` (
  `id` varchar(255) NOT NULL,
  `end_date` datetime default NULL,
  `event_name` varchar(255) default NULL,
  `event_url` varchar(255) default NULL,
  `join_base_num` int(11) default NULL,
  `pic_url` varchar(255) default NULL,
  `start_date` datetime default NULL,
  `state` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_hots
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_lotto`
-- ----------------------------
DROP TABLE IF EXISTS `activity_lotto`;
CREATE TABLE `activity_lotto` (
  `id` varchar(255) NOT NULL,
  `end_date` datetime default NULL,
  `lotto_name` varchar(255) default NULL,
  `lotto_url` varchar(255) default NULL,
  `pic_url` varchar(255) default NULL,
  `sort_no` int(11) default NULL,
  `start_date` datetime default NULL,
  `state` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_lotto
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_paoma`
-- ----------------------------
DROP TABLE IF EXISTS `activity_paoma`;
CREATE TABLE `activity_paoma` (
  `id` varchar(255) NOT NULL,
  `action_name` varchar(255) default NULL,
  `deadline` datetime default NULL,
  `end_date` datetime default NULL,
  `activity_no` varchar(255) default NULL,
  `pic_url` varchar(255) default NULL,
  `prize_url` varchar(255) default NULL,
  `ranking_limit` varchar(255) default NULL,
  `ranking_type` varchar(255) default NULL,
  `start_date` datetime default NULL,
  `state` varchar(255) default NULL,
  `prize_id` int(11) default NULL,
  `is_stick` varchar(255) default NULL,
  `people_num` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_paoma
-- ----------------------------
INSERT INTO `activity_paoma` VALUES ('297e94d95ebd20cb015ebd2251f70001', '跑马圈3', '2017-10-12 00:00:00', '2017-10-26 00:00:00', null, 'c10faab0-cfae-496e-bf1f-99825d12132f.jpg', null, '1', '1', '2017-10-17 00:00:00', '0', '1', '0', null);
INSERT INTO `activity_paoma` VALUES ('297e94d95ebd20cb015ebd2316a90002', '跑马圈4', '2017-10-10 00:00:00', '2017-10-26 00:00:00', null, '79f9753f-07d5-49c2-ac56-0c80d93bccd8.jpg', null, '1', '1', '2017-10-21 00:00:00', '0', '1', '0', null);
INSERT INTO `activity_paoma` VALUES ('402881fe5ea72fdf015ea733bbd70003', '跑马圈2', '2017-09-30 00:00:00', '2017-09-26 00:00:00', null, 'c46f1285-69f9-4b98-9789-186de966747e.jpg', null, '1', '1', '2017-09-25 00:00:00', '0', '1', '0', null);
INSERT INTO `activity_paoma` VALUES ('402881fe5ea72fdf015ea7399d260004', '跑马圈3', '2017-09-15 00:00:00', '2017-09-26 00:00:00', null, '6c1c5eee-616a-4146-80f5-ee72e58ea3b1.jpg', null, '1', '1', '2017-09-18 00:00:00', '0', '1', '0', null);
INSERT INTO `activity_paoma` VALUES ('8f8e8f7a5ec63aa9015ec64e10550001', '跑马圈5', '2017-10-08 00:00:00', '2017-10-26 00:00:00', null, '58196410-7eee-4fff-bf52-a22ff3bd924f.jpg', null, '1', '1', '2017-10-14 00:00:00', '0', '1', '0', null);
INSERT INTO `activity_paoma` VALUES ('8f8e8f7a5ec63aa9015ec64ecbea0002', '跑马圈6', '2017-10-15 00:00:00', '2017-10-26 00:00:00', null, 'c8b71f26-2256-4242-b537-a8fb7d2230b2.jpg', null, '1', '1', '2017-10-16 00:00:00', '0', '1', '0', null);

-- ----------------------------
-- Table structure for `activity_paoma_map_people`
-- ----------------------------
DROP TABLE IF EXISTS `activity_paoma_map_people`;
CREATE TABLE `activity_paoma_map_people` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `activity_id` varchar(255) default NULL COMMENT '活动主键',
  `ranking` int(11) default NULL COMMENT '用户排名',
  `user_id` varchar(255) default NULL COMMENT '用户ID',
  `mileage` int(11) default NULL COMMENT '用户里程',
  `is_accept` varchar(255) default NULL,
  `is_goods` varchar(255) default NULL,
  `is_prize` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='跑马圈和用户之间的关系';

-- ----------------------------
-- Records of activity_paoma_map_people
-- ----------------------------
INSERT INTO `activity_paoma_map_people` VALUES ('1', '402881fe5ea72fdf015ea733bbd70003', '1', 'ff8080815e74b3f7015e74b508d70001', '25', '1', null, null);
INSERT INTO `activity_paoma_map_people` VALUES ('2', '402881fe5ea72fdf015ea7399d260004', '2', 'ff8080815e74b3f7015e74b508d70001', '44', '1', null, null);
INSERT INTO `activity_paoma_map_people` VALUES ('3', '402881fe5ea72fdf015ea733bbd70003', '2', 'ff8080815e74b3f7015e74b5ffa70006', '20', null, null, null);
INSERT INTO `activity_paoma_map_people` VALUES ('402882f45ecccec9015ecd5f0f680000', '297e94d95ebd20cb015ebd2251f70001', '0', 'ff8080815e74b3f7015e74b508d70001', '0', null, null, null);
INSERT INTO `activity_paoma_map_people` VALUES ('402882f45ed23a91015ed26648800007', '8f8e8f7a5ec63aa9015ec64ecbea0002', '0', 'ff8080815e74b3f7015e74b508d70001', '0', null, null, null);

-- ----------------------------
-- Table structure for `activity_paoma_prize`
-- ----------------------------
DROP TABLE IF EXISTS `activity_paoma_prize`;
CREATE TABLE `activity_paoma_prize` (
  `id` varchar(255) NOT NULL,
  `activity_id` varchar(255) default NULL,
  `prize_id` int(11) default NULL,
  `ranking` int(11) default NULL,
  `ranking_end` int(11) default NULL,
  `pic_url` varchar(255) default NULL,
  `prize_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_paoma_prize
-- ----------------------------
INSERT INTO `activity_paoma_prize` VALUES ('1', '402881fe5ea72fdf015ea733bbd70003', '1', '1', null, null, null);
INSERT INTO `activity_paoma_prize` VALUES ('2', '402881fe5ea72fdf015ea733bbd70003', '1', '2', null, null, null);
INSERT INTO `activity_paoma_prize` VALUES ('3', '402881fe5ea72fdf015ea7399d260004', '1', '1', null, null, null);
INSERT INTO `activity_paoma_prize` VALUES ('4', '402881fe5ea72fdf015ea7399d260004', '1', '2', null, null, null);

-- ----------------------------
-- Table structure for `admin_init`
-- ----------------------------
DROP TABLE IF EXISTS `admin_init`;
CREATE TABLE `admin_init` (
  `id` varchar(255) collate utf8_bin NOT NULL,
  `date` datetime NOT NULL,
  `state` bit(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin_init
-- ----------------------------
INSERT INTO `admin_init` VALUES ('4028b88158e243d20158e243e1c00000', '2016-12-09 14:27:29', '');

-- ----------------------------
-- Table structure for `admin_login_logout`
-- ----------------------------
DROP TABLE IF EXISTS `admin_login_logout`;
CREATE TABLE `admin_login_logout` (
  `id` varchar(255) collate utf8_bin NOT NULL,
  `content` varchar(255) collate utf8_bin NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(255) collate utf8_bin NOT NULL,
  `type` varchar(255) collate utf8_bin NOT NULL,
  `username` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin_login_logout
-- ----------------------------
INSERT INTO `admin_login_logout` VALUES ('28288be35e78d59b015e78d6a7680000', 'admin 于 2017-09-13 09:24:47 成功登录后台管理系统 ', '2017-09-13 09:24:47', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('28288be35e7905aa015e790896630000', 'admin 于 2017-09-13 10:19:19 成功登录后台管理系统 ', '2017-09-13 10:19:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('28288be35e792e73015e7930a93c0000', 'admin 于 2017-09-13 11:03:05 成功登录后台管理系统 ', '2017-09-13 11:03:06', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('28288be35e793b81015e793c955a0000', 'admin 于 2017-09-13 11:16:07 成功登录后台管理系统 ', '2017-09-13 11:16:07', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('28288be35e7f25e1015e7f2a6b4b0000', 'admin 于 2017-09-14 14:53:59 成功登录后台管理系统 ', '2017-09-14 14:54:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('28288be35e7f5cff015e7f5df0b90000', 'admin 于 2017-09-14 15:50:16 成功登录后台管理系统 ', '2017-09-14 15:50:16', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('28288be35e7f5f03015e7f60413f0000', 'admin 于 2017-09-14 15:52:48 成功登录后台管理系统 ', '2017-09-14 15:52:48', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('28288be35e7f6c87015e7f6ec52b0000', 'admin 于 2017-09-14 16:08:39 成功登录后台管理系统 ', '2017-09-14 16:08:39', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1a3099015e1a31d4740002', 'admin 于 2017-08-26 00:20:26 成功登录后台管理系统 ', '2017-08-26 00:20:27', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1a3099015e1a31e3000003', 'admin 于 2017-08-26 00:20:30 安全退出系统 ', '2017-08-26 00:20:31', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1a4713015e1a4758de0000', 'admin 于 2017-08-26 00:43:57 成功登录后台管理系统 ', '2017-08-26 00:43:57', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1a4713015e1a47a5000001', 'admin 于 2017-08-26 00:44:16 成功登录后台管理系统 ', '2017-08-26 00:44:17', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1a4713015e1a484f3d0002', 'admin 于 2017-08-26 00:45:00 成功登录后台管理系统 ', '2017-08-26 00:45:00', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1a4e09015e1a4e507b0000', 'admin 于 2017-08-26 00:51:33 成功登录后台管理系统 ', '2017-08-26 00:51:34', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1a4e09015e1a4e9e260001', 'admin 于 2017-08-26 00:51:53 成功登录后台管理系统 ', '2017-08-26 00:51:54', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1a4e09015e1a4eaa320002', 'admin 于 2017-08-26 00:51:56 安全退出系统 ', '2017-08-26 00:51:57', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1a4e09015e1a4ebef40003', 'admin 于 2017-08-26 00:52:01 成功登录后台管理系统 ', '2017-08-26 00:52:02', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1a5079015e1a50b0b30000', 'admin 于 2017-08-26 00:54:09 成功登录后台管理系统 ', '2017-08-26 00:54:09', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1e9323015e1e9462210000', 'admin 于 2017-08-26 20:46:34 成功登录后台管理系统 ', '2017-08-26 20:46:35', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1e9323015e1e95fcdd0001', 'admin 于 2017-08-26 20:48:19 安全退出系统 ', '2017-08-26 20:48:20', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1e9323015e1e965df80002', 'admin 于 2017-08-26 20:48:44 成功登录后台管理系统 ', '2017-08-26 20:48:45', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1e9323015e1e96c6510003', 'admin 于 2017-08-26 20:49:11 安全退出系统 ', '2017-08-26 20:49:11', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1e9323015e1e977e4c0004', 'admin 于 2017-08-26 20:49:58 成功登录后台管理系统 ', '2017-08-26 20:49:58', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1e9323015e1e97e7cb0005', 'admin 于 2017-08-26 20:50:25 安全退出系统 ', '2017-08-26 20:50:25', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1e9323015e1e9827600006', 'admin 于 2017-08-26 20:50:41 成功登录后台管理系统 ', '2017-08-26 20:50:42', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1e9323015e1e9836430007', 'admin 于 2017-08-26 20:50:45 安全退出系统 ', '2017-08-26 20:50:45', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1ea5e7015e1eaa390c0000', 'admin 于 2017-08-26 21:10:25 成功登录后台管理系统 ', '2017-08-26 21:10:26', '192.168.0.115', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1eca0a015e1ecbbb810000', 'admin 于 2017-08-26 21:47:01 成功登录后台管理系统 ', '2017-08-26 21:47:02', '192.168.0.115', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1ecf58015e1ed016b10000', 'admin 于 2017-08-26 21:51:47 成功登录后台管理系统 ', '2017-08-26 21:51:47', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1ecf58015e1ed250ce0001', 'admin 于 2017-08-26 21:54:13 成功登录后台管理系统 ', '2017-08-26 21:54:13', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1ecf58015e1ed324560002', 'admin 于 2017-08-26 21:55:07 成功登录后台管理系统 ', '2017-08-26 21:55:07', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1ecf58015e1ed3fac00003', 'admin 于 2017-08-26 21:56:02 成功登录后台管理系统 ', '2017-08-26 21:56:02', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1ef1af015e1ef30b920000', 'admin 于 2017-08-26 22:29:58 成功登录后台管理系统 ', '2017-08-26 22:29:58', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1ef1af015e1ef35d7e0001', 'admin 于 2017-08-26 22:30:19 安全退出系统 ', '2017-08-26 22:30:19', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1ef1af015e1ef37c340002', 'admin 于 2017-08-26 22:30:27 成功登录后台管理系统 ', '2017-08-26 22:30:27', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1ef1af015e1ef3c4c10003', 'admin 于 2017-08-26 22:30:45 安全退出系统 ', '2017-08-26 22:30:46', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1ef1af015e1ef3efc00004', 'admin 于 2017-08-26 22:30:56 成功登录后台管理系统 ', '2017-08-26 22:30:57', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1ef4dd015e1ef687fd0000', 'admin 于 2017-08-26 22:33:46 成功登录后台管理系统 ', '2017-08-26 22:33:47', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1ef4dd015e1ef69d380001', 'admin 于 2017-08-26 22:33:52 安全退出系统 ', '2017-08-26 22:33:52', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1efee1015e1eff4d720000', 'admin 于 2017-08-26 22:43:21 成功登录后台管理系统 ', '2017-08-26 22:43:22', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1f20bf015e1f216a540000', 'admin 于 2017-08-26 23:20:37 成功登录后台管理系统 ', '2017-08-26 23:20:37', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e1f20bf015e1f2216090001', 'admin 于 2017-08-26 23:21:21 成功登录后台管理系统 ', '2017-08-26 23:21:21', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e229491015e2294f5010000', 'admin 于 2017-08-27 15:25:40 成功登录后台管理系统 ', '2017-08-27 15:25:41', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22a307015e22a50b400000', 'test 于 2017-08-27 15:43:15 成功登录后台管理系统 ', '2017-08-27 15:43:15', '127.0.0.1', 'LOGIN', 'test');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22a307015e22a698700001', 'test 于 2017-08-27 15:44:56 安全退出系统 ', '2017-08-27 15:44:57', '127.0.0.1', 'LOGOUT', 'test');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22a307015e22a816920002', 'admin 于 2017-08-27 15:46:34 成功登录后台管理系统 ', '2017-08-27 15:46:35', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22b8a7015e22b94fe80000', 'test 于 2017-08-27 16:05:23 成功登录后台管理系统 ', '2017-08-27 16:05:24', '127.0.0.1', 'LOGIN', 'test');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22b8a7015e22ba0a8b0001', 'test 于 2017-08-27 16:06:11 安全退出系统 ', '2017-08-27 16:06:11', '127.0.0.1', 'LOGOUT', 'test');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22b8a7015e22ba1f940002', 'admin 于 2017-08-27 16:06:16 成功登录后台管理系统 ', '2017-08-27 16:06:17', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22b8a7015e22ba35ab0003', 'admin 于 2017-08-27 16:06:22 安全退出系统 ', '2017-08-27 16:06:22', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22b8a7015e22ba71880004', 'test 于 2017-08-27 16:06:37 成功登录后台管理系统 ', '2017-08-27 16:06:38', '127.0.0.1', 'LOGIN', 'test');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22b8a7015e22bae8a90005', 'test 于 2017-08-27 16:07:08 安全退出系统 ', '2017-08-27 16:07:08', '127.0.0.1', 'LOGOUT', 'test');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22b8a7015e22bb52f50006', 'test 于 2017-08-27 16:07:35 成功登录后台管理系统 ', '2017-08-27 16:07:35', '127.0.0.1', 'LOGIN', 'test');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22b8a7015e22bb68460007', 'test 于 2017-08-27 16:07:40 安全退出系统 ', '2017-08-27 16:07:41', '127.0.0.1', 'LOGOUT', 'test');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22b8a7015e22bb7f6a0008', 'admin 于 2017-08-27 16:07:46 成功登录后台管理系统 ', '2017-08-27 16:07:47', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22b8a7015e22bc6e01000a', 'gjj 于 2017-08-27 16:08:47 成功登录后台管理系统 ', '2017-08-27 16:08:48', '127.0.0.1', 'LOGIN', 'gjj');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22b8a7015e22bc7c2a000b', 'gjj 于 2017-08-27 16:08:51 安全退出系统 ', '2017-08-27 16:08:51', '127.0.0.1', 'LOGOUT', 'gjj');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22b8a7015e22bd2d1d000c', 'gjj 于 2017-08-27 16:09:36 成功登录后台管理系统 ', '2017-08-27 16:09:37', '127.0.0.1', 'LOGIN', 'gjj');
INSERT INTO `admin_login_logout` VALUES ('402880f35e22bf08015e22bf60590000', 'admin 于 2017-08-27 16:12:00 成功登录后台管理系统 ', '2017-08-27 16:12:01', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e23cb01015e23cb6e830000', 'admin 于 2017-08-27 21:04:48 成功登录后台管理系统 ', '2017-08-27 21:04:48', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e23cb01015e23cb7dc20001', 'admin 于 2017-08-27 21:04:52 安全退出系统 ', '2017-08-27 21:04:52', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e23de41015e23deb7ce0000', 'admin 于 2017-08-27 21:25:52 成功登录后台管理系统 ', '2017-08-27 21:25:52', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e23de41015e23df14130001', 'admin 于 2017-08-27 21:26:15 安全退出系统 ', '2017-08-27 21:26:16', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e23e4f0015e23e60b860000', 'admin 于 2017-08-27 21:33:52 成功登录后台管理系统 ', '2017-08-27 21:33:52', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e23e4f0015e23e625320001', 'admin 于 2017-08-27 21:33:58 安全退出系统 ', '2017-08-27 21:33:59', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e23f6cc015e2411ed6b0000', 'admin 于 2017-08-27 22:21:48 成功登录后台管理系统 ', '2017-08-27 22:21:48', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e2412e1015e241436d20000', 'admin 于 2017-08-27 22:24:18 成功登录后台管理系统 ', '2017-08-27 22:24:18', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e241993015e2419f9580000', 'admin 于 2017-08-27 22:30:35 成功登录后台管理系统 ', '2017-08-27 22:30:36', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e24294d015e24299a380000', 'admin 于 2017-08-27 22:47:39 成功登录后台管理系统 ', '2017-08-27 22:47:40', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e242e48015e242ea8430000', 'admin 于 2017-08-27 22:53:11 成功登录后台管理系统 ', '2017-08-27 22:53:11', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e243558015e24365e4d0000', 'admin 于 2017-08-27 23:01:36 成功登录后台管理系统 ', '2017-08-27 23:01:36', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e245141015e245235de0000', 'admin 于 2017-08-27 23:32:01 成功登录后台管理系统 ', '2017-08-27 23:32:01', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e245d42015e245e2c320000', 'admin 于 2017-08-27 23:45:05 成功登录后台管理系统 ', '2017-08-27 23:45:05', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e246532015e2465f5b60000', 'admin 于 2017-08-27 23:53:35 成功登录后台管理系统 ', '2017-08-27 23:53:35', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402880f35e246ca0015e246deeed0000', 'admin 于 2017-08-28 00:02:17 成功登录后台管理系统 ', '2017-08-28 00:02:18', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e752785015e7528d80f0000', 'admin 于 2017-09-12 16:16:04 成功登录后台管理系统 ', '2017-09-12 16:16:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e752785015e756b2bb00001', 'admin 于 2017-09-12 17:28:31 成功登录后台管理系统 ', '2017-09-12 17:28:31', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e7576d9015e757977140000', 'admin 于 2017-09-12 17:44:08 成功登录后台管理系统 ', '2017-09-12 17:44:08', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e75be42015e75bf5b1a0000', 'admin 于 2017-09-12 19:00:28 成功登录后台管理系统 ', '2017-09-12 19:00:29', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e75f519015e75f592c90000', 'admin 于 2017-09-12 19:59:41 成功登录后台管理系统 ', '2017-09-12 19:59:42', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e75faaa015e75fbe6cd0000', 'admin 于 2017-09-12 20:06:36 成功登录后台管理系统 ', '2017-09-12 20:06:36', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e75fd3c015e75fdca670000', 'admin 于 2017-09-12 20:08:40 成功登录后台管理系统 ', '2017-09-12 20:08:40', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e8960f5015e8962f66c0000', 'admin 于 2017-09-16 14:31:57 成功登录后台管理系统 ', '2017-09-16 14:31:58', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e8967b8015e89689ed10000', 'admin 于 2017-09-16 14:38:08 成功登录后台管理系统 ', '2017-09-16 14:38:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e89737e015e8974a6630000', 'admin 于 2017-09-16 14:51:16 成功登录后台管理系统 ', '2017-09-16 14:51:17', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e89aef8015e89af56fd0000', 'admin 于 2017-09-16 15:55:23 成功登录后台管理系统 ', '2017-09-16 15:55:23', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e89e576015e89e69e990000', 'admin 于 2017-09-16 16:55:46 成功登录后台管理系统 ', '2017-09-16 16:55:46', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e89f581015e89f7b0370000', 'admin 于 2017-09-16 17:14:24 成功登录后台管理系统 ', '2017-09-16 17:14:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e8a1073015e8a117b150000', 'admin 于 2017-09-16 17:42:34 成功登录后台管理系统 ', '2017-09-16 17:42:35', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e92af22015e92afe8ea0000', 'admin 于 2017-09-18 09:52:35 成功登录后台管理系统 ', '2017-09-18 09:52:36', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e982b5e015e982c680e0000', 'admin 于 2017-09-19 11:26:40 成功登录后台管理系统 ', '2017-09-19 11:26:41', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e983f88015e983ff9a70000', 'admin 于 2017-09-19 11:48:03 成功登录后台管理系统 ', '2017-09-19 11:48:03', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e99d7c1015e99d878dc0000', 'admin 于 2017-09-19 19:14:14 成功登录后台管理系统 ', '2017-09-19 19:14:14', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e99d9e1015e99dc324b0000', 'admin 于 2017-09-19 19:18:18 成功登录后台管理系统 ', '2017-09-19 19:18:18', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e99e0af015e99e147710000', 'admin 于 2017-09-19 19:23:51 成功登录后台管理系统 ', '2017-09-19 19:23:51', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e99e8c8015e99ebb65d0000', 'admin 于 2017-09-19 19:35:15 成功登录后台管理系统 ', '2017-09-19 19:35:15', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e9a118b015e9a1236270000', 'admin 于 2017-09-19 20:17:18 成功登录后台管理系统 ', '2017-09-19 20:17:18', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881025e9a2c78015e9a2d31d80000', 'admin 于 2017-09-19 20:46:46 成功登录后台管理系统 ', '2017-09-19 20:46:47', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e5615d4015e561630860000', 'admin 于 2017-09-06 15:27:28 成功登录后台管理系统 ', '2017-09-06 15:27:28', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e5618fb015e561965240000', 'admin 于 2017-09-06 15:30:58 成功登录后台管理系统 ', '2017-09-06 15:30:58', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e561c68015e561ce8fe0000', 'admin 于 2017-09-06 15:34:48 成功登录后台管理系统 ', '2017-09-06 15:34:49', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e56232a015e5623b1690000', 'admin 于 2017-09-06 15:42:13 成功登录后台管理系统 ', '2017-09-06 15:42:13', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e564f68015e56549cea0000', 'admin 于 2017-09-06 16:35:39 成功登录后台管理系统 ', '2017-09-06 16:35:39', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e569dd7015e56a09c770000', 'admin 于 2017-09-06 17:58:39 成功登录后台管理系统 ', '2017-09-06 17:58:40', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e569dd7015e56c6c5e60001', 'admin 于 2017-09-06 18:40:20 成功登录后台管理系统 ', '2017-09-06 18:40:21', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e56f350015e56f3cd0b0000', 'admin 于 2017-09-06 19:29:31 成功登录后台管理系统 ', '2017-09-06 19:29:32', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e56f4d2015e56f559630000', 'admin 于 2017-09-06 19:31:13 成功登录后台管理系统 ', '2017-09-06 19:31:13', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e56f72b015e56f790910000', 'admin 于 2017-09-06 19:33:38 成功登录后台管理系统 ', '2017-09-06 19:33:39', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e570e18015e570e773c0000', 'admin 于 2017-09-06 19:58:39 成功登录后台管理系统 ', '2017-09-06 19:58:39', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e57226d015e5722e6ac0000', 'admin 于 2017-09-06 20:20:58 成功登录后台管理系统 ', '2017-09-06 20:20:59', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e57226d015e573323b20001', 'admin 于 2017-09-06 20:38:42 安全退出系统 ', '2017-09-06 20:38:43', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e57226d015e573385760002', 'admin 于 2017-09-06 20:39:07 成功登录后台管理系统 ', '2017-09-06 20:39:08', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e574725015e5747895f0000', 'admin 于 2017-09-06 21:00:59 成功登录后台管理系统 ', '2017-09-06 21:01:00', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e5765c8015e57662b300000', 'admin 于 2017-09-06 21:34:27 成功登录后台管理系统 ', '2017-09-06 21:34:27', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e5768c6015e576c1a4f0000', 'admin 于 2017-09-06 21:40:56 成功登录后台管理系统 ', '2017-09-06 21:40:56', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e57866f015e5786e0a60000', 'admin 于 2017-09-06 22:10:10 成功登录后台管理系统 ', '2017-09-06 22:10:11', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881f85e57866f015e57a3bc9e0002', 'admin 于 2017-09-06 22:41:42 成功登录后台管理系统 ', '2017-09-06 22:41:42', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881fe5e74e6aa015e74e861030000', 'admin 于 2017-09-12 15:05:39 成功登录后台管理系统 ', '2017-09-12 15:05:40', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881fe5e88aa11015e88b0acb10000', 'admin 于 2017-09-16 11:17:13 成功登录后台管理系统 ', '2017-09-16 11:17:13', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881fe5e88bce7015e88be91850000', 'admin 于 2017-09-16 11:32:24 成功登录后台管理系统 ', '2017-09-16 11:32:24', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881fe5e88c138015e88c1c5ff0000', 'admin 于 2017-09-16 11:35:54 成功登录后台管理系统 ', '2017-09-16 11:35:54', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881fe5e88c138015e893b43810001', 'admin 于 2017-09-16 13:48:36 成功登录后台管理系统 ', '2017-09-16 13:48:36', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402881fe5ea72fdf015ea73239780000', 'admin 于 2017-09-22 09:27:20 成功登录后台管理系统 ', '2017-09-22 09:27:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e45f46f2f6015f4706dffa0000', 'admin 于 2017-10-23 10:19:13 成功登录后台管理系统 ', '2017-10-23 10:19:14', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e45f46f2f6015f472819cd0002', 'admin 于 2017-10-23 10:55:31 成功登录后台管理系统 ', '2017-10-23 10:55:31', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e45f46f2f6015f472b957f0003', 'admin 于 2017-10-23 10:59:19 成功登录后台管理系统 ', '2017-10-23 10:59:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e45f472c6f015f472d43b00000', 'admin 于 2017-10-23 11:01:09 成功登录后台管理系统 ', '2017-10-23 11:01:10', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e45f472c6f015f47ecab4a0001', 'admin 于 2017-10-23 14:30:13 成功登录后台管理系统 ', '2017-10-23 14:30:14', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e45f4880bc015f48815c550000', 'admin 于 2017-10-23 17:12:38 成功登录后台管理系统 ', '2017-10-23 17:12:38', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e45f4880bc015f48d1f82d0002', 'admin 于 2017-10-23 18:40:41 成功登录后台管理系统 ', '2017-10-23 18:40:41', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e55f3e9ab7015f3e9b4d140000', 'admin 于 2017-10-21 19:04:46 成功登录后台管理系统 ', '2017-10-21 19:04:46', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e55f3e9ab7015f3ef11a090009', 'admin 于 2017-10-21 20:38:29 成功登录后台管理系统 ', '2017-10-21 20:38:29', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5606e3cb701606e3d29fa0000', 'admin 于 2017-12-19 18:06:30 成功登录后台管理系统 ', '2017-12-19 18:06:30', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5606e57b001606e5820bc0000', 'admin 于 2017-12-19 18:35:57 成功登录后台管理系统 ', '2017-12-19 18:35:57', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5606e57b001606e8ae8c40006', 'admin 于 2017-12-19 19:31:25 成功登录后台管理系统 ', '2017-12-19 19:31:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560718c660160718cc8dd0000', 'admin 于 2017-12-20 09:32:20 成功登录后台管理系统 ', '2017-12-20 09:32:20', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607197b10160719840270000', 'admin 于 2017-12-20 09:44:51 成功登录后台管理系统 ', '2017-12-20 09:44:51', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607197b10160727190cb0006', 'admin 于 2017-12-20 13:42:13 成功登录后台管理系统 ', '2017-12-20 13:42:13', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607197b101607290da440007', 'admin 于 2017-12-20 14:16:23 成功登录后台管理系统 ', '2017-12-20 14:16:23', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56072b57e016072b605b80000', 'admin 于 2017-12-20 14:56:59 成功登录后台管理系统 ', '2017-12-20 14:56:59', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56072b57e016072e54e920028', 'admin 于 2017-12-20 15:48:38 安全退出系统 ', '2017-12-20 15:48:38', '0:0:0:0:0:0:0:1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56072b57e016072e5b8600029', 'admin 于 2017-12-20 15:49:05 成功登录后台管理系统 ', '2017-12-20 15:49:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56072fe38016072feac620000', 'admin 于 2017-12-20 16:16:21 成功登录后台管理系统 ', '2017-12-20 16:16:21', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56072fe38016073243e77000b', 'admin 于 2017-12-20 16:57:23 成功登录后台管理系统 ', '2017-12-20 16:57:23', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607334bd01607335229b0000', 'admin 于 2017-12-20 17:15:50 成功登录后台管理系统 ', '2017-12-20 17:15:50', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560733a8f0160733b08120000', 'admin 于 2017-12-20 17:22:16 成功登录后台管理系统 ', '2017-12-20 17:22:16', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560733a8f01607342f7df0001', 'admin 于 2017-12-20 17:30:56 成功登录后台管理系统 ', '2017-12-20 17:30:56', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560733a8f016073b4a9f1000b', 'admin 于 2017-12-20 19:35:08 成功登录后台管理系统 ', '2017-12-20 19:35:08', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56076acfb016076ad68780000', 'admin 于 2017-12-21 09:26:04 成功登录后台管理系统 ', '2017-12-21 09:26:04', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56076acfb016076df62c30005', 'admin 于 2017-12-21 10:20:39 成功登录后台管理系统 ', '2017-12-21 10:20:39', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56076e3fc016076e45cd80000', 'admin 于 2017-12-21 10:26:05 成功登录后台管理系统 ', '2017-12-21 10:26:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56076efb1016076f12eb20000', 'admin 于 2017-12-21 10:40:05 成功登录后台管理系统 ', '2017-12-21 10:40:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560770b1f0160770b8d6e0000', 'admin 于 2017-12-21 11:08:53 成功登录后台管理系统 ', '2017-12-21 11:08:53', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560771f350160771fbed00000', 'admin 于 2017-12-21 11:30:57 成功登录后台管理系统 ', '2017-12-21 11:30:57', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607724bf01607725346e0000', 'admin 于 2017-12-21 11:36:55 成功登录后台管理系统 ', '2017-12-21 11:36:55', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607727e601607728594a0000', 'admin 于 2017-12-21 11:40:21 成功登录后台管理系统 ', '2017-12-21 11:40:21', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607732e00160773351820000', 'admin 于 2017-12-21 11:52:20 成功登录后台管理系统 ', '2017-12-21 11:52:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56077608b01607760fa520000', 'admin 于 2017-12-21 12:42:12 成功登录后台管理系统 ', '2017-12-21 12:42:12', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560778b370160778ba0090000', 'admin 于 2017-12-21 13:28:47 成功登录后台管理系统 ', '2017-12-21 13:28:47', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56077ad0b016077ad702a0000', 'admin 于 2017-12-21 14:05:43 成功登录后台管理系统 ', '2017-12-21 14:05:43', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56077b0aa016077b1a8b20000', 'admin 于 2017-12-21 14:10:19 成功登录后台管理系统 ', '2017-12-21 14:10:19', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56077b7e6016077b854840000', 'admin 于 2017-12-21 14:17:37 成功登录后台管理系统 ', '2017-12-21 14:17:37', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56077bd65016077bdf15b0000', 'admin 于 2017-12-21 14:23:44 成功登录后台管理系统 ', '2017-12-21 14:23:44', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56077d2e0016077d34d650000', 'admin 于 2017-12-21 14:47:04 成功登录后台管理系统 ', '2017-12-21 14:47:04', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56077d534016077d59b4a0000', 'admin 于 2017-12-21 14:49:35 成功登录后台管理系统 ', '2017-12-21 14:49:35', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56077d86a016077d8dca00000', 'admin 于 2017-12-21 14:53:09 成功登录后台管理系统 ', '2017-12-21 14:53:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56077e364016077e3e68d0000', 'admin 于 2017-12-21 15:05:12 成功登录后台管理系统 ', '2017-12-21 15:05:12', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56077e838016077e8af410000', 'admin 于 2017-12-21 15:10:26 成功登录后台管理系统 ', '2017-12-21 15:10:26', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56077f0ef016077f153350000', 'admin 于 2017-12-21 15:19:52 成功登录后台管理系统 ', '2017-12-21 15:19:52', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56077faec016077fb5dd40000', 'admin 于 2017-12-21 15:30:50 成功登录后台管理系统 ', '2017-12-21 15:30:50', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56077fd57016077fe09590000', 'admin 于 2017-12-21 15:33:45 成功登录后台管理系统 ', '2017-12-21 15:33:45', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56078036301607803f77c0000', 'admin 于 2017-12-21 15:40:14 成功登录后台管理系统 ', '2017-12-21 15:40:14', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56078140a016078149cc10000', 'admin 于 2017-12-21 15:58:24 成功登录后台管理系统 ', '2017-12-21 15:58:24', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56078297101607829dbc00000', 'admin 于 2017-12-21 16:21:37 成功登录后台管理系统 ', '2017-12-21 16:21:37', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560782c090160782c718c0000', 'admin 于 2017-12-21 16:24:26 成功登录后台管理系统 ', '2017-12-21 16:24:26', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560782d790160782dd3610000', 'admin 于 2017-12-21 16:25:57 成功登录后台管理系统 ', '2017-12-21 16:25:57', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607880f901607881ce890000', 'admin 于 2017-12-21 17:57:41 成功登录后台管理系统 ', '2017-12-21 17:57:41', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56078c147016078c236c30000', 'admin 于 2017-12-21 19:08:02 成功登录后台管理系统 ', '2017-12-21 19:08:02', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56078c613016078c6b1690000', 'admin 于 2017-12-21 19:12:55 成功登录后台管理系统 ', '2017-12-21 19:12:55', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56078eba9016078ec1a910000', 'admin 于 2017-12-21 19:53:47 成功登录后台管理系统 ', '2017-12-21 19:53:47', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607bc3ff01607bc496da0000', 'admin 于 2017-12-22 09:09:29 成功登录后台管理系统 ', '2017-12-22 09:09:29', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607be75001607be7d9160000', 'admin 于 2017-12-22 09:48:00 成功登录后台管理系统 ', '2017-12-22 09:48:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607be91f01607be97b6e0000', 'admin 于 2017-12-22 09:49:47 成功登录后台管理系统 ', '2017-12-22 09:49:47', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607beec101607bef2f180000', 'admin 于 2017-12-22 09:56:00 成功登录后台管理系统 ', '2017-12-22 09:56:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607bf60e01607bf670850000', 'admin 于 2017-12-22 10:03:56 成功登录后台管理系统 ', '2017-12-22 10:03:56', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607c1a8501607c1aed5d0000', 'admin 于 2017-12-22 10:43:47 成功登录后台管理系统 ', '2017-12-22 10:43:47', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607c204301607c20c6380000', 'admin 于 2017-12-22 10:50:10 成功登录后台管理系统 ', '2017-12-22 10:50:10', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607c280801607c285d860000', 'admin 于 2017-12-22 10:58:28 成功登录后台管理系统 ', '2017-12-22 10:58:28', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607c29e201607c2aaf370000', 'admin 于 2017-12-22 11:01:00 成功登录后台管理系统 ', '2017-12-22 11:01:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607c2f6301607c2fbdd80000', 'admin 于 2017-12-22 11:06:31 成功登录后台管理系统 ', '2017-12-22 11:06:31', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607c455a01607c45d4e20000', 'admin 于 2017-12-22 11:30:39 成功登录后台管理系统 ', '2017-12-22 11:30:39', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607c455a01607c7b096e000c', 'admin 于 2017-12-22 12:28:46 成功登录后台管理系统 ', '2017-12-22 12:28:46', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607c455a01607cc1f260000d', 'admin 于 2017-12-22 13:46:13 成功登录后台管理系统 ', '2017-12-22 13:46:13', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607cd57d01607cd5f1fd0000', 'admin 于 2017-12-22 14:08:04 成功登录后台管理系统 ', '2017-12-22 14:08:04', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607cd57d01607d1582610002', 'admin 于 2017-12-22 15:17:29 成功登录后台管理系统 ', '2017-12-22 15:17:29', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607d1d2901607d1d9d120000', 'admin 于 2017-12-22 15:26:20 成功登录后台管理系统 ', '2017-12-22 15:26:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607d1ed401607d1f34150000', 'admin 于 2017-12-22 15:28:05 成功登录后台管理系统 ', '2017-12-22 15:28:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607d245501607d24be980000', 'admin 于 2017-12-22 15:34:08 成功登录后台管理系统 ', '2017-12-22 15:34:08', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607d467b01607d48a1c00000', 'admin 于 2017-12-22 16:13:20 成功登录后台管理系统 ', '2017-12-22 16:13:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607d499b01607d4a04580000', 'admin 于 2017-12-22 16:14:50 成功登录后台管理系统 ', '2017-12-22 16:14:50', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607d50db01607d5226cc0000', 'admin 于 2017-12-22 16:23:44 成功登录后台管理系统 ', '2017-12-22 16:23:44', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607d50db01607d8ea66d0004', 'admin 于 2017-12-22 17:29:48 成功登录后台管理系统 ', '2017-12-22 17:29:48', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607d904401607d90a4ff0000', 'admin 于 2017-12-22 17:31:59 成功登录后台管理系统 ', '2017-12-22 17:31:59', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5607d904401607dc0772b0001', 'admin 于 2017-12-22 18:24:13 成功登录后台管理系统 ', '2017-12-22 18:24:13', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608164f50160816a4f380000', 'admin 于 2017-12-23 11:28:36 成功登录后台管理系统 ', '2017-12-23 11:28:36', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56081701a0160817088bb0000', 'admin 于 2017-12-23 11:35:24 成功登录后台管理系统 ', '2017-12-23 11:35:24', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56081a4be016081a520840000', 'admin 于 2017-12-23 12:32:50 成功登录后台管理系统 ', '2017-12-23 12:32:50', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56081a790016081a810480000', 'admin 于 2017-12-23 12:36:03 成功登录后台管理系统 ', '2017-12-23 12:36:03', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56081ab08016081ab82390000', 'admin 于 2017-12-23 12:39:49 成功登录后台管理系统 ', '2017-12-23 12:39:49', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56081b3e6016081b44a650000', 'admin 于 2017-12-23 12:49:24 成功登录后台管理系统 ', '2017-12-23 12:49:24', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56081c886016081c8ddfd0000', 'admin 于 2017-12-23 13:11:53 成功登录后台管理系统 ', '2017-12-23 13:11:53', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56081d5e9016081d661300000', 'admin 于 2017-12-23 13:26:38 成功登录后台管理系统 ', '2017-12-23 13:26:38', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56081f28a016081f2ef6a0000', 'admin 于 2017-12-23 13:57:50 成功登录后台管理系统 ', '2017-12-23 13:57:50', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56082073f01608207c7c80000', 'admin 于 2017-12-23 14:20:36 成功登录后台管理系统 ', '2017-12-23 14:20:36', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560822ba90160822ca6880000', 'admin 于 2017-12-23 15:00:52 成功登录后台管理系统 ', '2017-12-23 15:00:52', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608232cc0160823336b70000', 'admin 于 2017-12-23 15:08:02 成功登录后台管理系统 ', '2017-12-23 15:08:02', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56082358a01608235edf00000', 'admin 于 2017-12-23 15:11:00 成功登录后台管理系统 ', '2017-12-23 15:11:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608239060160823960900000', 'admin 于 2017-12-23 15:14:46 成功登录后台管理系统 ', '2017-12-23 15:14:46', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560824d1f0160824db8e90000', 'admin 于 2017-12-23 15:36:59 成功登录后台管理系统 ', '2017-12-23 15:36:59', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56082605f016082612bf30000', 'admin 于 2017-12-23 15:58:14 成功登录后台管理系统 ', '2017-12-23 15:58:14', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56082868d01608286f0c00000', 'admin 于 2017-12-23 16:39:29 成功登录后台管理系统 ', '2017-12-23 16:39:29', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608b3c1401608b3c9e960000', 'admin 于 2017-12-25 09:14:53 成功登录后台管理系统 ', '2017-12-25 09:14:53', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608b575c01608b57adb00000', 'admin 于 2017-12-25 09:44:27 成功登录后台管理系统 ', '2017-12-25 09:44:27', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608b575c01608b75af300001', 'admin 于 2017-12-25 10:17:13 成功登录后台管理系统 ', '2017-12-25 10:17:13', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608ba40001608ba461ca0000', 'admin 于 2017-12-25 11:08:14 成功登录后台管理系统 ', '2017-12-25 11:08:14', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608ba5bd01608ba61f630000', 'admin 于 2017-12-25 11:10:08 成功登录后台管理系统 ', '2017-12-25 11:10:08', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608ba87901608ba93bad0000', 'admin 于 2017-12-25 11:13:32 成功登录后台管理系统 ', '2017-12-25 11:13:32', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608bab9a01608bac432d0000', 'admin 于 2017-12-25 11:16:50 成功登录后台管理系统 ', '2017-12-25 11:16:50', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608c1a2f01608c1a93490000', 'admin 于 2017-12-25 13:17:20 成功登录后台管理系统 ', '2017-12-25 13:17:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608c339701608c3404840000', 'admin 于 2017-12-25 13:45:07 成功登录后台管理系统 ', '2017-12-25 13:45:07', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608c34fe01608c355d6a0000', 'admin 于 2017-12-25 13:46:35 成功登录后台管理系统 ', '2017-12-25 13:46:35', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608c34fe01608d0a86240007', 'admin 于 2017-12-25 17:39:25 成功登录后台管理系统 ', '2017-12-25 17:39:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5608c34fe01608d4680770008', 'admin 于 2017-12-25 18:44:56 成功登录后台管理系统 ', '2017-12-25 18:44:56', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56090787a0160907908e80000', 'admin 于 2017-12-26 09:38:59 成功登录后台管理系统 ', '2017-12-26 09:38:59', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56090787a0160921c78f80004', 'admin 于 2017-12-26 17:17:07 成功登录后台管理系统 ', '2017-12-26 17:17:07', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56092279301609227f38d0000', 'admin 于 2017-12-26 17:29:39 成功登录后台管理系统 ', '2017-12-26 17:29:39', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560959c9b0160959d0a3a0000', 'admin 于 2017-12-27 09:36:25 成功登录后台管理系统 ', '2017-12-27 09:36:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560959e840160959ede580000', 'admin 于 2017-12-27 09:38:24 成功登录后台管理系统 ', '2017-12-27 09:38:24', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560959e84016095d70c7e0008', 'admin 于 2017-12-27 10:39:46 成功登录后台管理系统 ', '2017-12-27 10:39:46', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56095e9e0016095ea464c0000', 'admin 于 2017-12-27 11:00:46 成功登录后台管理系统 ', '2017-12-27 11:00:46', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56095ec30016095ec9f7e0000', 'admin 于 2017-12-27 11:03:20 成功登录后台管理系统 ', '2017-12-27 11:03:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56095f286016095f2de450000', 'admin 于 2017-12-27 11:10:09 成功登录后台管理系统 ', '2017-12-27 11:10:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56095fdfe016095fe524e0000', 'admin 于 2017-12-27 11:22:40 成功登录后台管理系统 ', '2017-12-27 11:22:40', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56096007701609600cad40000', 'admin 于 2017-12-27 11:25:22 成功登录后台管理系统 ', '2017-12-27 11:25:22', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609601a90160960204720000', 'admin 于 2017-12-27 11:26:42 成功登录后台管理系统 ', '2017-12-27 11:26:42', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56097024d016097031f850000', 'admin 于 2017-12-27 16:07:32 成功登录后台管理系统 ', '2017-12-27 16:07:32', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e56097170b016097176ab30000', 'admin 于 2017-12-27 16:29:42 成功登录后台管理系统 ', '2017-12-27 16:29:42', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560975ef80160975f66c70000', 'admin 于 2017-12-27 17:48:20 成功登录后台管理系统 ', '2017-12-27 17:48:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560976a830160976af3ed0000', 'admin 于 2017-12-27 18:00:57 成功登录后台管理系统 ', '2017-12-27 18:00:57', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560976a83016097be435f0001', 'admin 于 2017-12-27 19:31:56 成功登录后台管理系统 ', '2017-12-27 19:31:56', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560976a83016097c06a9a0002', 'admin 于 2017-12-27 19:34:18 成功登录后台管理系统 ', '2017-12-27 19:34:18', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609aafe701609ab181fa0000', 'admin 于 2017-12-28 09:16:52 成功登录后台管理系统 ', '2017-12-28 09:16:52', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609aafe701609af422d50001', 'admin 于 2017-12-28 10:29:39 成功登录后台管理系统 ', '2017-12-28 10:29:39', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609b082e01609b0889a20000', 'admin 于 2017-12-28 10:51:56 成功登录后台管理系统 ', '2017-12-28 10:51:56', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609b0c3401609b0c90a40000', 'admin 于 2017-12-28 10:56:20 成功登录后台管理系统 ', '2017-12-28 10:56:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609b164601609b16a3520000', 'admin 于 2017-12-28 11:07:20 成功登录后台管理系统 ', '2017-12-28 11:07:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609b381e01609b3879270000', 'admin 于 2017-12-28 11:44:17 成功登录后台管理系统 ', '2017-12-28 11:44:17', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609b381e01609b6c67030001', 'admin 于 2017-12-28 12:41:00 成功登录后台管理系统 ', '2017-12-28 12:41:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609b381e01609b8af63c0002', 'admin 于 2017-12-28 13:14:23 成功登录后台管理系统 ', '2017-12-28 13:14:23', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609b381e01609b8b5e6b0003', 'admin 于 2017-12-28 13:14:50 成功登录后台管理系统 ', '2017-12-28 13:14:50', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609b381e01609b975abf0004', 'admin 于 2017-12-28 13:27:55 成功登录后台管理系统 ', '2017-12-28 13:27:55', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609b381e01609c473a100005', 'admin 于 2017-12-28 16:40:01 成功登录后台管理系统 ', '2017-12-28 16:40:01', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609b381e01609c6cd4ef0006', 'admin 于 2017-12-28 17:21:06 成功登录后台管理系统 ', '2017-12-28 17:21:06', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609b381e01609ca137050007', 'admin 于 2017-12-28 18:18:19 成功登录后台管理系统 ', '2017-12-28 18:18:19', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e5609b381e01609cc61cd90008', 'admin 于 2017-12-28 18:58:37 成功登录后台管理系统 ', '2017-12-28 18:58:37', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560a0093f0160a0119afc0000', 'admin 于 2017-12-29 10:19:56 成功登录后台管理系统 ', '2017-12-29 10:19:56', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560a0132f0160a01394cb0000', 'admin 于 2017-12-29 10:22:06 成功登录后台管理系统 ', '2017-12-29 10:22:06', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560a015780160a015fa4d0000', 'admin 于 2017-12-29 10:24:43 成功登录后台管理系统 ', '2017-12-29 10:24:43', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560a015780160a05fcb100003', 'admin 于 2017-12-29 11:45:20 成功登录后台管理系统 ', '2017-12-29 11:45:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560a015780160a0e04fde0005', 'admin 于 2017-12-29 14:05:43 成功登录后台管理系统 ', '2017-12-29 14:05:43', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560a0eb770160a0ebd4290000', 'admin 于 2017-12-29 14:18:18 成功登录后台管理系统 ', '2017-12-29 14:18:18', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560a0eb770160a0f9c3650001', 'admin 于 2017-12-29 14:33:31 成功登录后台管理系统 ', '2017-12-29 14:33:31', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560a0eb770160a170fb6a0002', 'admin 于 2017-12-29 16:43:44 成功登录后台管理系统 ', '2017-12-29 16:43:44', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560a1ba260160a1bb04fb0000', 'admin 于 2017-12-29 18:04:36 成功登录后台管理系统 ', '2017-12-29 18:04:36', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560a1cba70160a1cc3de10000', 'admin 于 2017-12-29 18:23:25 成功登录后台管理系统 ', '2017-12-29 18:23:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560b4868d0160b48712080000', 'admin 于 2018-01-02 09:40:38 成功登录后台管理系统 ', '2018-01-02 09:40:38', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560b4868d0160b49f9c850001', 'admin 于 2018-01-02 10:07:27 成功登录后台管理系统 ', '2018-01-02 10:07:27', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560b4868d0160b533838e0007', 'admin 于 2018-01-02 12:49:00 成功登录后台管理系统 ', '2018-01-02 12:49:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560b4868d0160b5a3b4d40009', 'admin 于 2018-01-02 14:51:32 成功登录后台管理系统 ', '2018-01-02 14:51:32', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560b4868d0160b5c15a50000a', 'admin 于 2018-01-02 15:23:55 成功登录后台管理系统 ', '2018-01-02 15:23:55', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560b4868d0160b628d9f0000f', 'admin 于 2018-01-02 17:16:58 成功登录后台管理系统 ', '2018-01-02 17:16:58', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560b9a01e0160b9a0c3f90000', 'admin 于 2018-01-03 09:26:49 成功登录后台管理系统 ', '2018-01-03 09:26:49', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560b9d0e60160b9d152820000', 'admin 于 2018-01-03 10:19:51 成功登录后台管理系统 ', '2018-01-03 10:19:51', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bab8c90160bab93a890000', 'admin 于 2018-01-03 14:33:09 成功登录后台管理系统 ', '2018-01-03 14:33:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bab8c90160bad8e7db0001', 'admin 于 2018-01-03 15:07:45 成功登录后台管理系统 ', '2018-01-03 15:07:45', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560baf9360160baf98d650000', 'admin 于 2018-01-03 15:43:25 成功登录后台管理系统 ', '2018-01-03 15:43:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb23d20160bb242af50000', 'admin 于 2018-01-03 16:29:57 成功登录后台管理系统 ', '2018-01-03 16:29:57', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb2ca00160bb2d14180000', 'admin 于 2018-01-03 16:39:41 成功登录后台管理系统 ', '2018-01-03 16:39:41', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb2f670160bb2fc4300000', 'admin 于 2018-01-03 16:42:37 成功登录后台管理系统 ', '2018-01-03 16:42:37', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb30790160bb3101390000', 'admin 于 2018-01-03 16:43:59 成功登录后台管理系统 ', '2018-01-03 16:43:59', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb31fe0160bb3278020000', 'admin 于 2018-01-03 16:45:35 成功登录后台管理系统 ', '2018-01-03 16:45:35', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb33db0160bb3434d80000', 'admin 于 2018-01-03 16:47:28 成功登录后台管理系统 ', '2018-01-03 16:47:28', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb36eb0160bb3743250000', 'admin 于 2018-01-03 16:50:49 成功登录后台管理系统 ', '2018-01-03 16:50:49', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb3dd50160bb3e291e0000', 'admin 于 2018-01-03 16:58:21 成功登录后台管理系统 ', '2018-01-03 16:58:21', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb450c0160bb4560730000', 'admin 于 2018-01-03 17:06:14 成功登录后台管理系统 ', '2018-01-03 17:06:14', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb47af0160bb48092b0000', 'admin 于 2018-01-03 17:09:08 成功登录后台管理系统 ', '2018-01-03 17:09:08', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb49130160bb49686b0000', 'admin 于 2018-01-03 17:10:38 成功登录后台管理系统 ', '2018-01-03 17:10:38', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb53890160bb53e8100000', 'admin 于 2018-01-03 17:22:06 成功登录后台管理系统 ', '2018-01-03 17:22:06', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb63490160bb63b69f0000', 'admin 于 2018-01-03 17:39:22 成功登录后台管理系统 ', '2018-01-03 17:39:22', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb68000160bb6941fc0000', 'admin 于 2018-01-03 17:45:25 成功登录后台管理系统 ', '2018-01-03 17:45:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb6ef50160bb713b110000', 'admin 于 2018-01-03 17:54:08 成功登录后台管理系统 ', '2018-01-03 17:54:08', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb73280160bb73781c0000', 'admin 于 2018-01-03 17:56:34 成功登录后台管理系统 ', '2018-01-03 17:56:34', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bb99a80160bb9a0ce50000', 'admin 于 2018-01-03 18:38:43 成功登录后台管理系统 ', '2018-01-03 18:38:43', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bec28d0160bec3162a0000', 'admin 于 2018-01-04 09:22:24 成功登录后台管理系统 ', '2018-01-04 09:22:24', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bf17ce0160bf1a1f380000', 'admin 于 2018-01-04 10:57:28 成功登录后台管理系统 ', '2018-01-04 10:57:28', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bf261e0160bf2680e20000', 'admin 于 2018-01-04 11:10:59 成功登录后台管理系统 ', '2018-01-04 11:10:59', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bf34450160bf3493b40000', 'admin 于 2018-01-04 11:26:22 成功登录后台管理系统 ', '2018-01-04 11:26:22', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bf34450160bf8d6c9f0003', 'admin 于 2018-01-04 13:03:24 成功登录后台管理系统 ', '2018-01-04 13:03:24', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bfa1d60160bfa2a03c0000', 'admin 于 2018-01-04 13:26:34 成功登录后台管理系统 ', '2018-01-04 13:26:34', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bfaf820160bfafe8380000', 'admin 于 2018-01-04 13:41:04 成功登录后台管理系统 ', '2018-01-04 13:41:04', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bfb2e70160bfb33d890000', 'admin 于 2018-01-04 13:44:43 成功登录后台管理系统 ', '2018-01-04 13:44:43', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bfb5f80160bfb67b770000', 'admin 于 2018-01-04 13:48:15 成功登录后台管理系统 ', '2018-01-04 13:48:15', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bfb5f80160bfc173400001', 'admin 于 2018-01-04 14:00:14 成功登录后台管理系统 ', '2018-01-04 14:00:14', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bfb5f80160bfc70fa00002', 'admin 于 2018-01-04 14:06:22 成功登录后台管理系统 ', '2018-01-04 14:06:22', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bfdc250160bfe0850e0000', 'admin 于 2018-01-04 14:34:10 成功登录后台管理系统 ', '2018-01-04 14:34:10', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bfe0fe0160bfe157f20000', 'admin 于 2018-01-04 14:35:04 成功登录后台管理系统 ', '2018-01-04 14:35:04', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560bffba20160bffbf8600000', 'admin 于 2018-01-04 15:04:09 成功登录后台管理系统 ', '2018-01-04 15:04:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c005570160c00640ad0000', 'admin 于 2018-01-04 15:15:23 成功登录后台管理系统 ', '2018-01-04 15:15:23', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c016030160c0165eaa0000', 'admin 于 2018-01-04 15:32:59 成功登录后台管理系统 ', '2018-01-04 15:32:59', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c01a090160c01a69d30000', 'admin 于 2018-01-04 15:37:24 成功登录后台管理系统 ', '2018-01-04 15:37:24', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c09f440160c0a11d270000', 'admin 于 2018-01-04 18:04:32 成功登录后台管理系统 ', '2018-01-04 18:04:32', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c3e7b30160c3e84da40000', 'admin 于 2018-01-05 09:21:09 成功登录后台管理系统 ', '2018-01-05 09:21:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c3e7b30160c42b67c40002', 'admin 于 2018-01-05 10:34:27 成功登录后台管理系统 ', '2018-01-05 10:34:27', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c4388c0160c4390bdf0000', 'admin 于 2018-01-05 10:49:21 成功登录后台管理系统 ', '2018-01-05 10:49:21', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c4388c0160c497a3de0001', 'admin 于 2018-01-05 12:32:40 成功登录后台管理系统 ', '2018-01-05 12:32:40', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c4388c0160c501f60c0002', 'admin 于 2018-01-05 14:28:48 成功登录后台管理系统 ', '2018-01-05 14:28:48', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c4388c0160c5413c900003', 'admin 于 2018-01-05 15:37:55 成功登录后台管理系统 ', '2018-01-05 15:37:55', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c4388c0160c5534b770004', 'admin 于 2018-01-05 15:57:38 成功登录后台管理系统 ', '2018-01-05 15:57:38', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c4388c0160c58895b60009', 'admin 于 2018-01-05 16:55:50 成功登录后台管理系统 ', '2018-01-05 16:55:50', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c5acc50160c5c836360000', 'admin 于 2018-01-05 18:05:20 成功登录后台管理系统 ', '2018-01-05 18:05:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c5acc50160c5d5391d0001', 'admin 于 2018-01-05 18:19:33 成功登录后台管理系统 ', '2018-01-05 18:19:33', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c5acc50160c5dd1ef50002', 'admin 于 2018-01-05 18:28:11 成功登录后台管理系统 ', '2018-01-05 18:28:11', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c975160160c975f2c30000', 'admin 于 2018-01-06 11:13:58 成功登录后台管理系统 ', '2018-01-06 11:13:58', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c985e70160c9865db70000', 'admin 于 2018-01-06 11:31:54 成功登录后台管理系统 ', '2018-01-06 11:31:54', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c9f1310160c9f1a69c0000', 'admin 于 2018-01-06 13:29:05 成功登录后台管理系统 ', '2018-01-06 13:29:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c9f1310160ca0f1e730001', 'admin 于 2018-01-06 14:01:16 成功登录后台管理系统 ', '2018-01-06 14:01:16', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560c9f1310160ca59f9080002', 'admin 于 2018-01-06 15:23:02 成功登录后台管理系统 ', '2018-01-06 15:23:02', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560cac3500160cac3aa8a0000', 'admin 于 2018-01-06 17:18:28 成功登录后台管理系统 ', '2018-01-06 17:18:28', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560d358670160d3590d510000', 'admin 于 2018-01-08 09:18:36 成功登录后台管理系统 ', '2018-01-08 09:18:36', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e560d35e4a0160d35ea6150000', 'admin 于 2018-01-08 09:24:43 成功登录后台管理系统 ', '2018-01-08 09:24:43', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65f4bfd5d015f4bfe8b440000', 'admin 于 2017-10-24 09:28:13 成功登录后台管理系统 ', '2017-10-24 09:28:14', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65f909f92015f90a0dde10000', 'admin 于 2017-11-06 17:19:42 成功登录后台管理系统 ', '2017-11-06 17:19:43', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65f9539c9015f953a81a80000', 'admin 于 2017-11-07 14:46:00 成功登录后台管理系统 ', '2017-11-07 14:46:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65f956d4a015f956e5b480000', 'admin 于 2017-11-07 15:42:38 成功登录后台管理系统 ', '2017-11-07 15:42:38', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65f957e4c015f957efc700000', 'admin 于 2017-11-07 16:00:48 成功登录后台管理系统 ', '2017-11-07 16:00:48', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65f957e4c015f95aa43ef0001', 'admin 于 2017-11-07 16:48:04 成功登录后台管理系统 ', '2017-11-07 16:48:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65f957e4c015f95e6138e0002', 'admin 于 2017-11-07 17:53:24 成功登录后台管理系统 ', '2017-11-07 17:53:24', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65f957e4c015f960540b30003', 'admin 于 2017-11-07 18:27:27 成功登录后台管理系统 ', '2017-11-07 18:27:28', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65f997595015f9976c70e0000', 'admin 于 2017-11-08 10:30:19 成功登录后台管理系统 ', '2017-11-08 10:30:19', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fa40416015fa404f2ec0000', 'admin 于 2017-11-10 11:41:48 成功登录后台管理系统 ', '2017-11-10 11:41:49', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fa40416015fa405dadb0001', 'admin 于 2017-11-10 11:42:48 成功登录后台管理系统 ', '2017-11-10 11:42:48', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fa40416015fa43b3cae0009', 'admin 于 2017-11-10 12:41:06 成功登录后台管理系统 ', '2017-11-10 12:41:06', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fa40416015fa470be21000d', 'admin 于 2017-11-10 13:39:33 成功登录后台管理系统 ', '2017-11-10 13:39:33', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fa40416015fa49c3f15000e', 'admin 于 2017-11-10 14:27:04 成功登录后台管理系统 ', '2017-11-10 14:27:04', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fa40416015fa4f34302001c', 'admin 于 2017-11-10 16:02:06 成功登录后台管理系统 ', '2017-11-10 16:02:07', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fa40416015fa529a0a0001d', 'admin 于 2017-11-10 17:01:29 成功登录后台管理系统 ', '2017-11-10 17:01:30', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb3e8b4015fb3ec05490000', 'admin 于 2017-11-13 13:48:30 成功登录后台管理系统 ', '2017-11-13 13:48:30', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb3f297015fb3f3b9820000', 'admin 于 2017-11-13 13:56:55 成功登录后台管理系统 ', '2017-11-13 13:56:55', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb3f297015fb40ec2b60001', 'admin 于 2017-11-13 14:26:27 成功登录后台管理系统 ', '2017-11-13 14:26:27', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb3f297015fb4104fd90002', 'admin 于 2017-11-13 14:28:08 成功登录后台管理系统 ', '2017-11-13 14:28:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb3f297015fb4665f410003', 'admin 于 2017-11-13 16:02:08 成功登录后台管理系统 ', '2017-11-13 16:02:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb48433015fb48508810000', 'admin 于 2017-11-13 16:35:38 成功登录后台管理系统 ', '2017-11-13 16:35:38', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb48433015fb49978170001', 'admin 于 2017-11-13 16:57:57 成功登录后台管理系统 ', '2017-11-13 16:57:58', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb48433015fb4dd367e0002', 'admin 于 2017-11-13 18:11:57 成功登录后台管理系统 ', '2017-11-13 18:11:57', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb48433015fb516ea8d0003', 'admin 于 2017-11-13 19:14:58 成功登录后台管理系统 ', '2017-11-13 19:14:59', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb48433015fb529c6030006', 'admin 于 2017-11-13 19:35:34 成功登录后台管理系统 ', '2017-11-13 19:35:35', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb48433015fb53444990007', 'admin 于 2017-11-13 19:47:02 成功登录后台管理系统 ', '2017-11-13 19:47:02', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb48433015fb571b5880008', 'admin 于 2017-11-13 20:54:09 成功登录后台管理系统 ', '2017-11-13 20:54:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb82828015fb82990350000', 'admin 于 2017-11-14 09:34:12 成功登录后台管理系统 ', '2017-11-14 09:34:12', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb83180015fb832218e0000', 'admin 于 2017-11-14 09:43:34 成功登录后台管理系统 ', '2017-11-14 09:43:34', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb83f5e015fb84007390000', 'admin 于 2017-11-14 09:58:44 成功登录后台管理系统 ', '2017-11-14 09:58:45', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb83f5e015fb8882d500001', 'admin 于 2017-11-14 11:17:33 成功登录后台管理系统 ', '2017-11-14 11:17:33', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb83f5e015fb8895c530002', 'admin 于 2017-11-14 11:18:50 成功登录后台管理系统 ', '2017-11-14 11:18:51', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb83f5e015fb88a675f0003', 'admin 于 2017-11-14 11:19:59 成功登录后台管理系统 ', '2017-11-14 11:19:59', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb83f5e015fb88e6b530004', 'admin 于 2017-11-14 11:24:22 成功登录后台管理系统 ', '2017-11-14 11:24:22', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb83f5e015fb8e3d0e30005', 'admin 于 2017-11-14 12:57:38 成功登录后台管理系统 ', '2017-11-14 12:57:39', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb83f5e015fb928898b0006', 'admin 于 2017-11-14 14:12:42 成功登录后台管理系统 ', '2017-11-14 14:12:43', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb928ff015fb92bb6620000', 'admin 于 2017-11-14 14:16:10 成功登录后台管理系统 ', '2017-11-14 14:16:11', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb95d97015fb95ffed00000', 'admin 于 2017-11-14 15:13:16 成功登录后台管理系统 ', '2017-11-14 15:13:17', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb95d97015fb9a81ed90001', 'admin 于 2017-11-14 16:32:03 成功登录后台管理系统 ', '2017-11-14 16:32:04', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fb95d97015fba44aede0002', 'admin 于 2017-11-14 19:23:04 成功登录后台管理系统 ', '2017-11-14 19:23:04', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fbd4ef0015fbd50fad10000', 'admin 于 2017-11-15 09:35:21 成功登录后台管理系统 ', '2017-11-15 09:35:22', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fbd4ef0015fbe3a4db10001', 'admin 于 2017-11-15 13:50:12 成功登录后台管理系统 ', '2017-11-15 13:50:13', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fbe827d015fbe86b9480000', 'admin 于 2017-11-15 15:13:41 成功登录后台管理系统 ', '2017-11-15 15:13:41', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc29cdc015fc29e1fa10000', 'admin 于 2017-11-16 10:17:43 成功登录后台管理系统 ', '2017-11-16 10:17:44', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc29cdc015fc329e4cf0001', 'admin 于 2017-11-16 12:50:23 成功登录后台管理系统 ', '2017-11-16 12:50:24', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc29cdc015fc36a20440002', 'admin 于 2017-11-16 14:00:33 成功登录后台管理系统 ', '2017-11-16 14:00:33', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc29cdc015fc3a27fcf0003', 'admin 于 2017-11-16 15:02:07 成功登录后台管理系统 ', '2017-11-16 15:02:08', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc29cdc015fc43b829c0004', 'admin 于 2017-11-16 17:49:15 成功登录后台管理系统 ', '2017-11-16 17:49:15', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc78ae9015fc78df2da0000', 'admin 于 2017-11-17 09:18:09 成功登录后台管理系统 ', '2017-11-17 09:18:10', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc7f1e4015fc7f32fa40000', 'admin 于 2017-11-17 11:08:44 成功登录后台管理系统 ', '2017-11-17 11:08:44', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc7f1e4015fc85dc1b30003', 'admin 于 2017-11-17 13:05:08 成功登录后台管理系统 ', '2017-11-17 13:05:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc85fe4015fc860a76a0000', 'admin 于 2017-11-17 13:08:18 成功登录后台管理系统 ', '2017-11-17 13:08:18', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc85fe4015fc88272330001', 'admin 于 2017-11-17 13:45:13 成功登录后台管理系统 ', '2017-11-17 13:45:13', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc88a74015fc88af8180000', 'admin 于 2017-11-17 13:54:31 成功登录后台管理系统 ', '2017-11-17 13:54:32', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc88ca4015fc88eef190000', 'admin 于 2017-11-17 13:58:51 成功登录后台管理系统 ', '2017-11-17 13:58:51', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc8a7ed015fc8a8e6050000', 'admin 于 2017-11-17 14:27:13 成功登录后台管理系统 ', '2017-11-17 14:27:13', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc8b46b015fc8b5022b0000', 'admin 于 2017-11-17 14:40:26 成功登录后台管理系统 ', '2017-11-17 14:40:27', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc93c4d015fc93cceab0000', 'admin 于 2017-11-17 17:08:46 成功登录后台管理系统 ', '2017-11-17 17:08:46', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fc93c4d015fc97195220001', 'admin 于 2017-11-17 18:06:25 成功登录后台管理系统 ', '2017-11-17 18:06:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fcdf739015fcdf823960000', 'admin 于 2017-11-18 15:11:52 成功登录后台管理系统 ', '2017-11-18 15:11:52', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fcdf739015fce2d9d750001', 'admin 于 2017-11-18 16:10:16 成功登录后台管理系统 ', '2017-11-18 16:10:17', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fcdf739015fcea760440002', 'admin 于 2017-11-18 18:23:16 成功登录后台管理系统 ', '2017-11-18 18:23:17', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fd7063c015fd707f5c60000', 'admin 于 2017-11-20 09:25:43 成功登录后台管理系统 ', '2017-11-20 09:25:44', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fd733c4015fd734feb20000', 'admin 于 2017-11-20 10:14:55 成功登录后台管理系统 ', '2017-11-20 10:14:55', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fd733c4015fd7ddf9040002', 'admin 于 2017-11-20 13:19:29 成功登录后台管理系统 ', '2017-11-20 13:19:30', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fd733c4015fd804ff770003', 'admin 于 2017-11-20 14:02:07 成功登录后台管理系统 ', '2017-11-20 14:02:07', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fd733c4015fd836746a0004', 'admin 于 2017-11-20 14:56:08 成功登录后台管理系统 ', '2017-11-20 14:56:08', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fd733c4015fd859f4bc0005', 'admin 于 2017-11-20 15:34:54 成功登录后台管理系统 ', '2017-11-20 15:34:55', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fd8751f015fd875a8d30000', 'admin 于 2017-11-20 16:05:10 成功登录后台管理系统 ', '2017-11-20 16:05:10', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fdc2e62015fdc39a9b10000', 'admin 于 2017-11-21 09:38:07 成功登录后台管理系统 ', '2017-11-21 09:38:07', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fdc2e62015fdc47bfc50001', 'admin 于 2017-11-21 09:53:30 成功登录后台管理系统 ', '2017-11-21 09:53:31', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fdc4869015fdc495c310000', 'admin 于 2017-11-21 09:55:16 成功登录后台管理系统 ', '2017-11-21 09:55:16', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fdc4869015fdc7132b30001', 'admin 于 2017-11-21 10:38:46 成功登录后台管理系统 ', '2017-11-21 10:38:47', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fdc4869015fdc9c648a0002', 'admin 于 2017-11-21 11:25:57 成功登录后台管理系统 ', '2017-11-21 11:25:58', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fdc4869015fdd2b6ef30003', 'admin 于 2017-11-21 14:02:12 成功登录后台管理系统 ', '2017-11-21 14:02:12', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fdd34c3015fdd355d180000', 'admin 于 2017-11-21 14:13:02 成功登录后台管理系统 ', '2017-11-21 14:13:03', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fdd34c3015fddaa72a10001', 'admin 于 2017-11-21 16:20:56 成功登录后台管理系统 ', '2017-11-21 16:20:56', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fe15289015fe16de6cb0000', 'admin 于 2017-11-22 09:53:16 成功登录后台管理系统 ', '2017-11-22 09:53:17', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fe15289015fe173634e0001', 'admin 于 2017-11-22 09:59:16 成功登录后台管理系统 ', '2017-11-22 09:59:17', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fe15289015fe1c0a0630002', 'admin 于 2017-11-22 11:23:38 成功登录后台管理系统 ', '2017-11-22 11:23:38', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fe15289015fe1f008720003', 'admin 于 2017-11-22 12:15:25 成功登录后台管理系统 ', '2017-11-22 12:15:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fe15289015fe28699690004', 'admin 于 2017-11-22 14:59:52 成功登录后台管理系统 ', '2017-11-22 14:59:53', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fe15289015fe2fb66060006', 'admin 于 2017-11-22 17:07:27 成功登录后台管理系统 ', '2017-11-22 17:07:27', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fe6a4bf015fe6a581b30000', 'admin 于 2017-11-23 10:12:07 成功登录后台管理系统 ', '2017-11-23 10:12:07', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e65fe6a4bf015fe761b50a0001', 'admin 于 2017-11-23 13:37:41 成功登录后台管理系统 ', '2017-11-23 13:37:41', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66015abda016015b7424a0000', 'admin 于 2017-12-02 13:33:39 成功登录后台管理系统 ', '2017-12-02 13:33:40', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66015abda016015edbfbc0001', 'admin 于 2017-12-02 14:33:10 成功登录后台管理系统 ', '2017-12-02 14:33:11', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66015abda016015f7de7f0002', 'admin 于 2017-12-02 14:44:14 成功登录后台管理系统 ', '2017-12-02 14:44:14', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6601611d20160161352660000', 'admin 于 2017-12-02 15:14:13 成功登录后台管理系统 ', '2017-12-02 15:14:13', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6601630f201601631b0d90000', 'admin 于 2017-12-02 15:47:23 成功登录后台管理系统 ', '2017-12-02 15:47:23', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6601630f20160169188d40001', 'admin 于 2017-12-02 17:32:04 成功登录后台管理系统 ', '2017-12-02 17:32:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6601f1a2301601f20b8d70000', 'admin 于 2017-12-04 09:25:26 成功登录后台管理系统 ', '2017-12-04 09:25:26', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660246db40160246eadea0000', 'admin 于 2017-12-05 10:08:41 成功登录后台管理系统 ', '2017-12-05 10:08:41', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602599d10160259bb8f70000', 'admin 于 2017-12-05 15:37:30 成功登录后台管理系统 ', '2017-12-05 15:37:31', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66025a4f2016025a59a460000', 'admin 于 2017-12-05 15:48:18 成功登录后台管理系统 ', '2017-12-05 15:48:18', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66025a4f2016025a688d20001', 'admin 于 2017-12-05 15:49:19 成功登录后台管理系统 ', '2017-12-05 15:49:19', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66025a4f2016025a9f6360002', 'admin 于 2017-12-05 15:53:03 成功登录后台管理系统 ', '2017-12-05 15:53:04', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66025a4f2016025ac6e500003', 'admin 于 2017-12-05 15:55:45 成功登录后台管理系统 ', '2017-12-05 15:55:46', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66025b917016025b9b63d0000', 'admin 于 2017-12-05 16:10:15 成功登录后台管理系统 ', '2017-12-05 16:10:16', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602610a401602612aa040000', 'admin 于 2017-12-05 17:47:25 成功登录后台管理系统 ', '2017-12-05 17:47:26', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602b179201602b1a15280000', 'admin 于 2017-12-06 17:13:37 成功登录后台管理系统 ', '2017-12-06 17:13:38', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602e909401602e91a0040000', 'admin 于 2017-12-07 09:23:03 成功登录后台管理系统 ', '2017-12-07 09:23:04', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602e909401602ea4e0650003', 'admin 于 2017-12-07 09:44:05 成功登录后台管理系统 ', '2017-12-07 09:44:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602ea82001602ea8a2750000', 'admin 于 2017-12-07 09:48:11 成功登录后台管理系统 ', '2017-12-07 09:48:12', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602eabcd01602eac52e90000', 'admin 于 2017-12-07 09:52:13 成功登录后台管理系统 ', '2017-12-07 09:52:14', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602eabcd01602ebb6fda0001', 'admin 于 2017-12-07 10:08:43 成功登录后台管理系统 ', '2017-12-07 10:08:44', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602ede7c01602edf12780000', 'admin 于 2017-12-07 10:47:39 成功登录后台管理系统 ', '2017-12-07 10:47:39', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602ee0e601602ee1c7160000', 'admin 于 2017-12-07 10:50:36 成功登录后台管理系统 ', '2017-12-07 10:50:37', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602ee6a101602ee80c510000', 'admin 于 2017-12-07 10:57:27 成功登录后台管理系统 ', '2017-12-07 10:57:28', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602ee96b01602ee9fd6c0000', 'admin 于 2017-12-07 10:59:34 成功登录后台管理系统 ', '2017-12-07 10:59:35', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f164c01602f3b17600000', 'admin 于 2017-12-07 12:28:09 成功登录后台管理系统 ', '2017-12-07 12:28:10', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f164c01602f3f8dc60001', 'admin 于 2017-12-07 12:33:02 成功登录后台管理系统 ', '2017-12-07 12:33:02', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f164c01602f4834670002', 'admin 于 2017-12-07 12:42:29 成功登录后台管理系统 ', '2017-12-07 12:42:29', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f164c01602f4b7ef70003', 'admin 于 2017-12-07 12:46:05 成功登录后台管理系统 ', '2017-12-07 12:46:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f4ea401602f4f34d70000', 'admin 于 2017-12-07 12:50:08 成功登录后台管理系统 ', '2017-12-07 12:50:08', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f511001602f51abf10000', 'admin 于 2017-12-07 12:52:49 成功登录后台管理系统 ', '2017-12-07 12:52:50', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f6d1d01602f6d9d8f0000', 'admin 于 2017-12-07 13:23:21 成功登录后台管理系统 ', '2017-12-07 13:23:21', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f7a4801602f7b03e40000', 'admin 于 2017-12-07 13:37:59 成功登录后台管理系统 ', '2017-12-07 13:37:59', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f7a4801602f8e66810007', 'admin 于 2017-12-07 13:59:09 成功登录后台管理系统 ', '2017-12-07 13:59:10', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f8f6601602f8ff3c40000', 'admin 于 2017-12-07 14:00:51 成功登录后台管理系统 ', '2017-12-07 14:00:51', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f911401602f919f1a0000', 'admin 于 2017-12-07 14:02:40 成功登录后台管理系统 ', '2017-12-07 14:02:41', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f911401602fba9bd10002', 'admin 于 2017-12-07 14:47:26 成功登录后台管理系统 ', '2017-12-07 14:47:27', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f911401602fd3ce310004', 'admin 于 2017-12-07 15:14:58 成功登录后台管理系统 ', '2017-12-07 15:14:58', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f911401602fd6c0260005', 'admin 于 2017-12-07 15:18:11 成功登录后台管理系统 ', '2017-12-07 15:18:11', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602f911401602fd9a2190006', 'admin 于 2017-12-07 15:21:20 成功登录后台管理系统 ', '2017-12-07 15:21:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602fe86a01602fe8e7b70000', 'admin 于 2017-12-07 15:38:00 成功登录后台管理系统 ', '2017-12-07 15:38:01', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6602feb9801602fec11910000', 'admin 于 2017-12-07 15:41:28 成功登录后台管理系统 ', '2017-12-07 15:41:28', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66030160d01603017ceed0000', 'admin 于 2017-12-07 16:29:14 成功登录后台管理系统 ', '2017-12-07 16:29:15', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66030160d0160302f1b510001', 'admin 于 2017-12-07 16:54:41 成功登录后台管理系统 ', '2017-12-07 16:54:42', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66030372501603037a1700000', 'admin 于 2017-12-07 17:04:00 成功登录后台管理系统 ', '2017-12-07 17:04:00', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603038a90160303936710000', 'admin 于 2017-12-07 17:05:44 成功登录后台管理系统 ', '2017-12-07 17:05:44', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660303a480160303ad3e30000', 'admin 于 2017-12-07 17:07:29 成功登录后台管理系统 ', '2017-12-07 17:07:30', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660303ce30160303d6e4b0000', 'admin 于 2017-12-07 17:10:20 成功登录后台管理系统 ', '2017-12-07 17:10:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660303ce30160303e64f80001', 'admin 于 2017-12-07 17:11:23 成功登录后台管理系统 ', '2017-12-07 17:11:24', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660303ce30160303f77430002', 'admin 于 2017-12-07 17:12:33 成功登录后台管理系统 ', '2017-12-07 17:12:34', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603043e2016030447ad60000', 'admin 于 2017-12-07 17:18:02 成功登录后台管理系统 ', '2017-12-07 17:18:02', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603049650160304a31240000', 'admin 于 2017-12-07 17:24:16 成功登录后台管理系统 ', '2017-12-07 17:24:17', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603049650160305451500001', 'admin 于 2017-12-07 17:35:20 成功登录后台管理系统 ', '2017-12-07 17:35:20', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603049650160307d36990003', 'admin 于 2017-12-07 18:20:00 成功登录后台管理系统 ', '2017-12-07 18:20:01', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66033ca76016033cbadfd0000', 'admin 于 2017-12-08 09:44:34 成功登录后台管理系统 ', '2017-12-08 09:44:35', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66033eb0e016033ebaf900000', 'admin 于 2017-12-08 10:19:32 成功登录后台管理系统 ', '2017-12-08 10:19:32', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66033eb0e01603402c4cf0001', 'admin 于 2017-12-08 10:44:44 成功登录后台管理系统 ', '2017-12-08 10:44:45', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660340ab10160340b4cff0000', 'admin 于 2017-12-08 10:54:04 成功登录后台管理系统 ', '2017-12-08 10:54:04', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660340cfd0160340d8d440000', 'admin 于 2017-12-08 10:56:31 成功登录后台管理系统 ', '2017-12-08 10:56:32', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66034114101603411cfda0000', 'admin 于 2017-12-08 11:01:10 成功登录后台管理系统 ', '2017-12-08 11:01:11', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603414ba01603415cf810000', 'admin 于 2017-12-08 11:05:32 成功登录后台管理系统 ', '2017-12-08 11:05:33', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603418a80160341946630000', 'admin 于 2017-12-08 11:09:19 成功登录后台管理系统 ', '2017-12-08 11:09:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660341a690160341af0820000', 'admin 于 2017-12-08 11:11:08 成功登录后台管理系统 ', '2017-12-08 11:11:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660341e0f0160341f53790000', 'admin 于 2017-12-08 11:15:56 成功登录后台管理系统 ', '2017-12-08 11:15:56', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660343e240160343eae530000', 'admin 于 2017-12-08 11:50:11 成功登录后台管理系统 ', '2017-12-08 11:50:11', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660343e24016034457db50001', 'admin 于 2017-12-08 11:57:37 成功登录后台管理系统 ', '2017-12-08 11:57:38', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660344867016034494dbd0000', 'admin 于 2017-12-08 12:01:47 成功登录后台管理系统 ', '2017-12-08 12:01:47', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603448670160346da41b0001', 'admin 于 2017-12-08 12:41:28 成功登录后台管理系统 ', '2017-12-08 12:41:29', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603448670160347f0f9a0004', 'admin 于 2017-12-08 13:00:30 成功登录后台管理系统 ', '2017-12-08 13:00:30', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603448670160349c09330005', 'admin 于 2017-12-08 13:32:09 成功登录后台管理系统 ', '2017-12-08 13:32:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603448670160349c44fa0006', 'admin 于 2017-12-08 13:32:24 成功登录后台管理系统 ', '2017-12-08 13:32:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660344867016034a997cd0007', 'admin 于 2017-12-08 13:46:57 成功登录后台管理系统 ', '2017-12-08 13:46:58', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660344867016034b76abe0008', 'admin 于 2017-12-08 14:02:03 成功登录后台管理系统 ', '2017-12-08 14:02:04', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660344867016034c669100009', 'admin 于 2017-12-08 14:18:26 成功登录后台管理系统 ', '2017-12-08 14:18:26', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660344867016034d59358000a', 'admin 于 2017-12-08 14:35:00 成功登录后台管理系统 ', '2017-12-08 14:35:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660344867016034dcf7f1000b', 'admin 于 2017-12-08 14:43:04 成功登录后台管理系统 ', '2017-12-08 14:43:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66034dfab016034e058ff0000', 'admin 于 2017-12-08 14:46:46 成功登录后台管理系统 ', '2017-12-08 14:46:46', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66034dfab016034e630b90002', 'admin 于 2017-12-08 14:53:09 成功登录后台管理系统 ', '2017-12-08 14:53:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66034dfab016034e840850004', 'admin 于 2017-12-08 14:55:24 成功登录后台管理系统 ', '2017-12-08 14:55:24', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66034dfab016034e97d340006', 'admin 于 2017-12-08 14:56:45 成功登录后台管理系统 ', '2017-12-08 14:56:45', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66034dfab016034eb18700008', 'admin 于 2017-12-08 14:58:30 成功登录后台管理系统 ', '2017-12-08 14:58:31', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66034dfab016034ed3f93000a', 'admin 于 2017-12-08 15:00:51 成功登录后台管理系统 ', '2017-12-08 15:00:52', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66034f500016034f5de110000', 'admin 于 2017-12-08 15:10:16 成功登录后台管理系统 ', '2017-12-08 15:10:17', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66034f500016034ff6c2e0001', 'admin 于 2017-12-08 15:20:42 成功登录后台管理系统 ', '2017-12-08 15:20:43', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66034f5000160350538920002', 'admin 于 2017-12-08 15:27:02 成功登录后台管理系统 ', '2017-12-08 15:27:03', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660350ea601603510a26e0000', 'admin 于 2017-12-08 15:39:30 成功登录后台管理系统 ', '2017-12-08 15:39:31', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660350ea60160351278480001', 'admin 于 2017-12-08 15:41:31 成功登录后台管理系统 ', '2017-12-08 15:41:31', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660350ea60160351807550002', 'admin 于 2017-12-08 15:47:35 成功登录后台管理系统 ', '2017-12-08 15:47:35', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660350ea601603519c3270003', 'admin 于 2017-12-08 15:49:28 成功登录后台管理系统 ', '2017-12-08 15:49:29', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660350ea60160351ae1100004', 'admin 于 2017-12-08 15:50:42 成功登录后台管理系统 ', '2017-12-08 15:50:42', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660350ea6016035227a780005', 'admin 于 2017-12-08 15:59:00 成功登录后台管理系统 ', '2017-12-08 15:59:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660350ea60160352998ba0007', 'admin 于 2017-12-08 16:06:46 成功登录后台管理系统 ', '2017-12-08 16:06:47', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660350ea60160352bc12f0009', 'admin 于 2017-12-08 16:09:08 成功登录后台管理系统 ', '2017-12-08 16:09:08', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660350ea6016035341712000b', 'admin 于 2017-12-08 16:18:14 成功登录后台管理系统 ', '2017-12-08 16:18:14', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66035361801603536997e0000', 'admin 于 2017-12-08 16:20:58 成功登录后台管理系统 ', '2017-12-08 16:20:59', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66035373801603537c3250000', 'admin 于 2017-12-08 16:22:15 成功登录后台管理系统 ', '2017-12-08 16:22:15', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603549ec0160354a86300000', 'admin 于 2017-12-08 16:42:44 成功登录后台管理系统 ', '2017-12-08 16:42:45', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603549ec0160354e18f80003', 'admin 于 2017-12-08 16:46:38 成功登录后台管理系统 ', '2017-12-08 16:46:39', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603549ec016035523d930004', 'admin 于 2017-12-08 16:51:10 成功登录后台管理系统 ', '2017-12-08 16:51:10', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603549ec016035569fc10005', 'admin 于 2017-12-08 16:55:57 成功登录后台管理系统 ', '2017-12-08 16:55:58', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66035634501603563d3f50000', 'admin 于 2017-12-08 17:10:22 成功登录后台管理系统 ', '2017-12-08 17:10:23', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603568940160356932230000', 'admin 于 2017-12-08 17:16:14 成功登录后台管理系统 ', '2017-12-08 17:16:15', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660356894016035714c850002', 'admin 于 2017-12-08 17:25:05 成功登录后台管理系统 ', '2017-12-08 17:25:06', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6603568940160357a29650004', 'admin 于 2017-12-08 17:34:46 成功登录后台管理系统 ', '2017-12-08 17:34:47', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660357d290160357dfc520000', 'admin 于 2017-12-08 17:38:57 成功登录后台管理系统 ', '2017-12-08 17:38:57', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660357d2901603587ef660002', 'admin 于 2017-12-08 17:49:49 成功登录后台管理系统 ', '2017-12-08 17:49:49', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660357d290160358e6db90004', 'admin 于 2017-12-08 17:56:54 成功登录后台管理系统 ', '2017-12-08 17:56:55', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660357d290160359974370006', 'admin 于 2017-12-08 18:08:57 成功登录后台管理系统 ', '2017-12-08 18:08:57', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660357d290160359c4e700007', 'admin 于 2017-12-08 18:12:04 成功登录后台管理系统 ', '2017-12-08 18:12:04', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048660501604866af1c0000', 'admin 于 2017-12-12 09:46:17 成功登录后台管理系统 ', '2017-12-12 09:46:17', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048686e016048693ef10000', 'admin 于 2017-12-12 09:49:05 成功登录后台管理系统 ', '2017-12-12 09:49:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660486b1e0160486ce36f0000', 'admin 于 2017-12-12 09:53:03 成功登录后台管理系统 ', '2017-12-12 09:53:04', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660486e060160486ea1010000', 'admin 于 2017-12-12 09:54:57 成功登录后台管理系统 ', '2017-12-12 09:54:58', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048a477016048a75aa60000', 'admin 于 2017-12-12 10:56:55 成功登录后台管理系统 ', '2017-12-12 10:56:55', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048aa10016048aa9c980000', 'admin 于 2017-12-12 11:00:28 成功登录后台管理系统 ', '2017-12-12 11:00:29', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048ad60016048adf2ae0000', 'admin 于 2017-12-12 11:04:07 成功登录后台管理系统 ', '2017-12-12 11:04:08', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048b0dc016048b16b520000', 'admin 于 2017-12-12 11:07:55 成功登录后台管理系统 ', '2017-12-12 11:07:55', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048b0dc016048b92a6f0003', 'admin 于 2017-12-12 11:16:22 成功登录后台管理系统 ', '2017-12-12 11:16:23', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048b0dc016048ed98720004', 'admin 于 2017-12-12 12:13:38 成功登录后台管理系统 ', '2017-12-12 12:13:39', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048f7dc016048f86b690000', 'admin 于 2017-12-12 12:25:28 成功登录后台管理系统 ', '2017-12-12 12:25:28', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048f7dc016048ffbd1b0002', 'admin 于 2017-12-12 12:33:27 成功登录后台管理系统 ', '2017-12-12 12:33:28', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048f7dc0160490371ce0004', 'admin 于 2017-12-12 12:37:30 成功登录后台管理系统 ', '2017-12-12 12:37:31', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048f7dc0160491232970005', 'admin 于 2017-12-12 12:53:37 成功登录后台管理系统 ', '2017-12-12 12:53:38', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048f7dc0160491a98150006', 'admin 于 2017-12-12 13:02:47 成功登录后台管理系统 ', '2017-12-12 13:02:48', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048f7dc01604949533f0007', 'admin 于 2017-12-12 13:53:50 成功登录后台管理系统 ', '2017-12-12 13:53:50', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048f7dc016049533ca80009', 'admin 于 2017-12-12 14:04:39 成功登录后台管理系统 ', '2017-12-12 14:04:40', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66048f7dc0160495a571b000a', 'admin 于 2017-12-12 14:12:25 成功登录后台管理系统 ', '2017-12-12 14:12:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604960860160496146350000', 'admin 于 2017-12-12 14:19:59 成功登录后台管理系统 ', '2017-12-12 14:20:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66049608601604962f4c00002', 'admin 于 2017-12-12 14:21:50 成功登录后台管理系统 ', '2017-12-12 14:21:50', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66049608601604967d2600006', 'admin 于 2017-12-12 14:27:09 成功登录后台管理系统 ', '2017-12-12 14:27:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604972a1016049732ae60000', 'admin 于 2017-12-12 14:39:32 成功登录后台管理系统 ', '2017-12-12 14:39:33', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604972a10160497c80c30001', 'admin 于 2017-12-12 14:49:44 成功登录后台管理系统 ', '2017-12-12 14:49:44', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604972a10160497ddb0b0002', 'admin 于 2017-12-12 14:51:13 成功登录后台管理系统 ', '2017-12-12 14:51:13', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604982a6016049832b890000', 'admin 于 2017-12-12 14:57:01 成功登录后台管理系统 ', '2017-12-12 14:57:01', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604982a60160498846880001', 'admin 于 2017-12-12 15:02:35 成功登录后台管理系统 ', '2017-12-12 15:02:36', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604982a601604988ba2b0002', 'admin 于 2017-12-12 15:03:05 成功登录后台管理系统 ', '2017-12-12 15:03:06', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660498de30160498e710d0000', 'admin 于 2017-12-12 15:09:19 成功登录后台管理系统 ', '2017-12-12 15:09:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660498de3016049a1dcdb0004', 'admin 于 2017-12-12 15:30:32 成功登录后台管理系统 ', '2017-12-12 15:30:33', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660498de3016049a889170005', 'admin 于 2017-12-12 15:37:50 成功登录后台管理系统 ', '2017-12-12 15:37:50', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660498de3016049a93b450006', 'admin 于 2017-12-12 15:38:35 成功登录后台管理系统 ', '2017-12-12 15:38:36', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66049ac78016049b907e20000', 'admin 于 2017-12-12 15:55:51 成功登录后台管理系统 ', '2017-12-12 15:55:51', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66049b9de016049baddd80000', 'admin 于 2017-12-12 15:57:51 成功登录后台管理系统 ', '2017-12-12 15:57:51', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66049bd14016049bd9af30000', 'admin 于 2017-12-12 16:00:50 成功登录后台管理系统 ', '2017-12-12 16:00:51', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66049be82016049bf0f830000', 'admin 于 2017-12-12 16:02:26 成功登录后台管理系统 ', '2017-12-12 16:02:26', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66049c349016049c45d370000', 'admin 于 2017-12-12 16:08:13 成功登录后台管理系统 ', '2017-12-12 16:08:14', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66049ca0f016049ca97090000', 'admin 于 2017-12-12 16:15:01 成功登录后台管理系统 ', '2017-12-12 16:15:02', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66049cc89016049cd10630000', 'admin 于 2017-12-12 16:17:44 成功登录后台管理系统 ', '2017-12-12 16:17:44', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66049d8d8016049daaf530000', 'admin 于 2017-12-12 16:32:36 成功登录后台管理系统 ', '2017-12-12 16:32:37', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66049dbbd016049dc43a80000', 'admin 于 2017-12-12 16:34:20 成功登录后台管理系统 ', '2017-12-12 16:34:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604a118a01604a1227100000', 'admin 于 2017-12-12 17:33:11 成功登录后台管理系统 ', '2017-12-12 17:33:12', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604a186001604a19bbc40000', 'admin 于 2017-12-12 17:41:28 成功登录后台管理系统 ', '2017-12-12 17:41:29', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604a24b701604a2558200000', 'admin 于 2017-12-12 17:54:09 成功登录后台管理系统 ', '2017-12-12 17:54:10', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604a2e4b01604a2ed21d0000', 'admin 于 2017-12-12 18:04:30 成功登录后台管理系统 ', '2017-12-12 18:04:31', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604a2e4b01604a383e9d0001', 'admin 于 2017-12-12 18:14:48 成功登录后台管理系统 ', '2017-12-12 18:14:48', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604d91ed01604d93cdc60000', 'admin 于 2017-12-13 09:53:40 成功登录后台管理系统 ', '2017-12-13 09:53:40', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604da5a201604da640d40000', 'admin 于 2017-12-13 10:13:49 成功登录后台管理系统 ', '2017-12-13 10:13:49', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604da5a201604da86ebf0001', 'admin 于 2017-12-13 10:16:12 成功登录后台管理系统 ', '2017-12-13 10:16:12', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604dae3f01604daeca0d0000', 'admin 于 2017-12-13 10:23:08 成功登录后台管理系统 ', '2017-12-13 10:23:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604db2d901604db365830000', 'admin 于 2017-12-13 10:28:10 成功登录后台管理系统 ', '2017-12-13 10:28:11', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604db2d901604db74aa20001', 'admin 于 2017-12-13 10:32:26 成功登录后台管理系统 ', '2017-12-13 10:32:26', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604dc3a001604dc42a6f0000', 'admin 于 2017-12-13 10:46:29 成功登录后台管理系统 ', '2017-12-13 10:46:30', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604dc5a401604dc6bf020000', 'admin 于 2017-12-13 10:49:18 成功登录后台管理系统 ', '2017-12-13 10:49:19', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604dc8b001604dca784b0000', 'admin 于 2017-12-13 10:53:22 成功登录后台管理系统 ', '2017-12-13 10:53:23', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604dc8b001604dcf6cc90001', 'admin 于 2017-12-13 10:58:47 成功登录后台管理系统 ', '2017-12-13 10:58:48', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604dd2d501604dd3cf3b0000', 'admin 于 2017-12-13 11:03:34 成功登录后台管理系统 ', '2017-12-13 11:03:35', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604dd2d501604dd626ab0001', 'admin 于 2017-12-13 11:06:08 成功登录后台管理系统 ', '2017-12-13 11:06:08', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604dd84c01604dd8e5790000', 'admin 于 2017-12-13 11:09:08 成功登录后台管理系统 ', '2017-12-13 11:09:08', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604dd84c01604dde06c50001', 'admin 于 2017-12-13 11:14:44 成功登录后台管理系统 ', '2017-12-13 11:14:45', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604dd84c01604ddef3cc0002', 'admin 于 2017-12-13 11:15:45 成功登录后台管理系统 ', '2017-12-13 11:15:45', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604de06801604de0ecdc0000', 'admin 于 2017-12-13 11:17:54 成功登录后台管理系统 ', '2017-12-13 11:17:55', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604de06801604de6f4cc0001', 'admin 于 2017-12-13 11:24:29 成功登录后台管理系统 ', '2017-12-13 11:24:30', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604df08201604df296ec0000', 'admin 于 2017-12-13 11:37:12 成功登录后台管理系统 ', '2017-12-13 11:37:12', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604df08201604df2ca250001', 'admin 于 2017-12-13 11:37:25 成功登录后台管理系统 ', '2017-12-13 11:37:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604df08201604df566fd0002', 'admin 于 2017-12-13 11:40:16 成功登录后台管理系统 ', '2017-12-13 11:40:17', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604df08201604e2c45a10003', 'admin 于 2017-12-13 12:40:12 成功登录后台管理系统 ', '2017-12-13 12:40:12', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604df08201604e2f23720004', 'admin 于 2017-12-13 12:43:20 成功登录后台管理系统 ', '2017-12-13 12:43:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604df08201604e2fd9f20005', 'admin 于 2017-12-13 12:44:07 成功登录后台管理系统 ', '2017-12-13 12:44:07', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604e7e2a01604e7f5c510000', 'admin 于 2017-12-13 14:10:57 成功登录后台管理系统 ', '2017-12-13 14:10:58', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604e842a01604e857b880000', 'admin 于 2017-12-13 14:17:38 成功登录后台管理系统 ', '2017-12-13 14:17:39', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604e876f01604e8941790000', 'admin 于 2017-12-13 14:21:46 成功登录后台管理系统 ', '2017-12-13 14:21:46', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604e876f01604ea113cb0001', 'admin 于 2017-12-13 14:47:47 成功登录后台管理系统 ', '2017-12-13 14:47:47', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604eaf5b01604eb017a90000', 'admin 于 2017-12-13 15:04:11 成功登录后台管理系统 ', '2017-12-13 15:04:11', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604ed94901604eda454f0000', 'admin 于 2017-12-13 15:50:15 成功登录后台管理系统 ', '2017-12-13 15:50:16', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604edf9401604ee02a330000', 'admin 于 2017-12-13 15:56:41 成功登录后台管理系统 ', '2017-12-13 15:56:42', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604edf9401604ee39a510001', 'admin 于 2017-12-13 16:00:27 成功登录后台管理系统 ', '2017-12-13 16:00:27', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604ee52401604ee6efd90000', 'admin 于 2017-12-13 16:04:05 成功登录后台管理系统 ', '2017-12-13 16:04:06', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604ee8f401604eea00ba0000', 'admin 于 2017-12-13 16:07:26 成功登录后台管理系统 ', '2017-12-13 16:07:27', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604ee8f401604f09ce0a0004', 'admin 于 2017-12-13 16:42:10 成功登录后台管理系统 ', '2017-12-13 16:42:11', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604ee8f401604f161fb30005', 'admin 于 2017-12-13 16:55:38 成功登录后台管理系统 ', '2017-12-13 16:55:38', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604f338901604f3433fe0000', 'admin 于 2017-12-13 17:28:29 成功登录后台管理系统 ', '2017-12-13 17:28:29', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604f384d01604f38dd770000', 'admin 于 2017-12-13 17:33:34 成功登录后台管理系统 ', '2017-12-13 17:33:35', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604f3d0701604f3e00480000', 'admin 于 2017-12-13 17:39:11 成功登录后台管理系统 ', '2017-12-13 17:39:12', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604f41ca01604f42542e0000', 'admin 于 2017-12-13 17:43:55 成功登录后台管理系统 ', '2017-12-13 17:43:55', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6604f41ca01604f4b94750002', 'admin 于 2017-12-13 17:54:01 成功登录后台管理系统 ', '2017-12-13 17:54:01', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66052aa89016052ab4bb50000', 'admin 于 2017-12-14 09:37:25 成功登录后台管理系统 ', '2017-12-14 09:37:26', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66052c84d016052c8d90c0000', 'admin 于 2017-12-14 10:09:42 成功登录后台管理系统 ', '2017-12-14 10:09:43', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66052c84d016052dbb8080005', 'admin 于 2017-12-14 10:30:19 成功登录后台管理系统 ', '2017-12-14 10:30:19', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66052dedd016052df6dd90000', 'admin 于 2017-12-14 10:34:22 成功登录后台管理系统 ', '2017-12-14 10:34:23', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66052eea2016052ef6e8b0000', 'admin 于 2017-12-14 10:51:51 成功登录后台管理系统 ', '2017-12-14 10:51:51', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66052f07e016052f24e560000', 'admin 于 2017-12-14 10:54:59 成功登录后台管理系统 ', '2017-12-14 10:55:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6605307ab016053083f930000', 'admin 于 2017-12-14 11:18:57 成功登录后台管理系统 ', '2017-12-14 11:18:58', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66053094b0160530b04380000', 'admin 于 2017-12-14 11:21:59 成功登录后台管理系统 ', '2017-12-14 11:21:59', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660530d270160530db8d20000', 'admin 于 2017-12-14 11:24:56 成功登录后台管理系统 ', '2017-12-14 11:24:56', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660531f3801605320484d0000', 'admin 于 2017-12-14 11:45:12 成功登录后台管理系统 ', '2017-12-14 11:45:13', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6605324af01605325a7700000', 'admin 于 2017-12-14 11:51:04 成功登录后台管理系统 ', '2017-12-14 11:51:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660532af70160532e25910000', 'admin 于 2017-12-14 12:00:21 成功登录后台管理系统 ', '2017-12-14 12:00:21', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660532af7016053433e430002', 'admin 于 2017-12-14 12:23:23 成功登录后台管理系统 ', '2017-12-14 12:23:24', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660532af70160535050390004', 'admin 于 2017-12-14 12:37:40 成功登录后台管理系统 ', '2017-12-14 12:37:41', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660532af7016053740273000e', 'admin 于 2017-12-14 13:16:39 成功登录后台管理系统 ', '2017-12-14 13:16:40', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660532af70160539bdf5a000f', 'admin 于 2017-12-14 14:00:12 成功登录后台管理系统 ', '2017-12-14 14:00:12', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660532af7016053a12b280010', 'admin 于 2017-12-14 14:05:59 成功登录后台管理系统 ', '2017-12-14 14:05:59', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66053bf07016053bfa79b0000', 'admin 于 2017-12-14 14:39:17 成功登录后台管理系统 ', '2017-12-14 14:39:17', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66053bf07016053cd82ac0001', 'admin 于 2017-12-14 14:54:25 成功登录后台管理系统 ', '2017-12-14 14:54:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66053bf07016053dac8af0002', 'admin 于 2017-12-14 15:08:55 成功登录后台管理系统 ', '2017-12-14 15:08:55', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66053e186016053e257590000', 'admin 于 2017-12-14 15:17:10 成功登录后台管理系统 ', '2017-12-14 15:17:11', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66053e48b016053e511840000', 'admin 于 2017-12-14 15:20:09 成功登录后台管理系统 ', '2017-12-14 15:20:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66053fd83016053fe65330000', 'admin 于 2017-12-14 15:47:49 成功登录后台管理系统 ', '2017-12-14 15:47:49', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660540ec70160540f923d0000', 'admin 于 2017-12-14 16:06:34 成功登录后台管理系统 ', '2017-12-14 16:06:35', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660540ec70160541b03d60001', 'admin 于 2017-12-14 16:19:04 成功登录后台管理系统 ', '2017-12-14 16:19:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660540ec70160541d2e770002', 'admin 于 2017-12-14 16:21:26 成功登录后台管理系统 ', '2017-12-14 16:21:27', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660543e410160543ed9dc0000', 'admin 于 2017-12-14 16:58:13 成功登录后台管理系统 ', '2017-12-14 16:58:13', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66054414601605441d7570000', 'admin 于 2017-12-14 17:01:29 成功登录后台管理系统 ', '2017-12-14 17:01:29', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6605442b60160544339550000', 'admin 于 2017-12-14 17:02:59 成功登录后台管理系统 ', '2017-12-14 17:03:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6605446860160544788860000', 'admin 于 2017-12-14 17:07:42 成功登录后台管理系统 ', '2017-12-14 17:07:42', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660544da70160544e35900000', 'admin 于 2017-12-14 17:14:59 成功登录后台管理系统 ', '2017-12-14 17:15:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6605461b6016054623e320000', 'admin 于 2017-12-14 17:36:52 成功登录后台管理系统 ', '2017-12-14 17:36:53', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6605466890160546711b60000', 'admin 于 2017-12-14 17:42:09 成功登录后台管理系统 ', '2017-12-14 17:42:09', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66054668901605470b7bc0001', 'admin 于 2017-12-14 17:52:41 成功登录后台管理系统 ', '2017-12-14 17:52:41', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66057dd74016057def0950000', 'admin 于 2017-12-15 09:51:56 成功登录后台管理系统 ', '2017-12-15 09:51:57', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66057dd74016057f0d61d0001', 'admin 于 2017-12-15 10:11:29 成功登录后台管理系统 ', '2017-12-15 10:11:29', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e66057dd74016057ff97ac0004', 'admin 于 2017-12-15 10:27:36 成功登录后台管理系统 ', '2017-12-15 10:27:36', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660583c7a0160583d04010000', 'admin 于 2017-12-15 11:34:41 成功登录后台管理系统 ', '2017-12-15 11:34:42', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660583eb20160583f63310000', 'admin 于 2017-12-15 11:37:17 成功登录后台管理系统 ', '2017-12-15 11:37:17', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6605845c101605846583e0000', 'admin 于 2017-12-15 11:44:53 成功登录后台管理系统 ', '2017-12-15 11:44:53', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6605845c101605848b0450001', 'admin 于 2017-12-15 11:47:26 成功登录后台管理系统 ', '2017-12-15 11:47:27', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660584f12016058cb94fc0000', 'admin 于 2017-12-15 14:10:25 成功登录后台管理系统 ', '2017-12-15 14:10:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660584f12016058d268810001', 'admin 于 2017-12-15 14:17:52 成功登录后台管理系统 ', '2017-12-15 14:17:53', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660584f120160592aa8190002', 'admin 于 2017-12-15 15:54:15 成功登录后台管理系统 ', '2017-12-15 15:54:16', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660584f1201605932f3b40003', 'admin 于 2017-12-15 16:03:19 成功登录后台管理系统 ', '2017-12-15 16:03:20', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660584f120160594d9b460004', 'admin 于 2017-12-15 16:32:26 成功登录后台管理系统 ', '2017-12-15 16:32:26', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660584f1201605985b89d0006', 'admin 于 2017-12-15 17:33:43 成功登录后台管理系统 ', '2017-12-15 17:33:44', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660584f12016059960f050007', 'admin 于 2017-12-15 17:51:34 成功登录后台管理系统 ', '2017-12-15 17:51:35', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660584f1201605996516b0008', 'admin 于 2017-12-15 17:51:51 成功登录后台管理系统 ', '2017-12-15 17:51:52', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660584f12016059b9838b000a', 'admin 于 2017-12-15 18:30:18 成功登录后台管理系统 ', '2017-12-15 18:30:18', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660584f12016059cc9702000b', 'admin 于 2017-12-15 18:51:08 成功登录后台管理系统 ', '2017-12-15 18:51:08', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660584f12016059d50569000c', 'admin 于 2017-12-15 19:00:20 成功登录后台管理系统 ', '2017-12-15 19:00:21', '192.168.2.2', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660584f12016059e91997000e', 'admin 于 2017-12-15 19:22:16 成功登录后台管理系统 ', '2017-12-15 19:22:17', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e6605e20f901605e2417c70000', 'admin 于 2017-12-16 15:05:11 成功登录后台管理系统 ', '2017-12-16 15:05:12', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('402882e660675d000160675dfe2b0000', 'admin 于 2017-12-18 10:05:01 成功登录后台管理系统 ', '2017-12-18 10:05:01', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1d26ab015e1d2770b30000', 'admin 于 2017-08-26 14:07:57 成功登录后台管理系统 ', '2017-08-26 14:07:58', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1d3691015e1d3892ca0000', 'admin 于 2017-08-26 14:26:40 成功登录后台管理系统 ', '2017-08-26 14:26:40', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1e44c1015e1e45c5c90000', 'admin 于 2017-08-26 19:20:42 成功登录后台管理系统 ', '2017-08-26 19:20:43', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1e44c1015e1e464e880001', 'admin 于 2017-08-26 19:21:17 成功登录后台管理系统 ', '2017-08-26 19:21:18', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1e44c1015e1e474c310002', 'admin 于 2017-08-26 19:22:22 安全退出系统 ', '2017-08-26 19:22:23', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1e44c1015e1e47c5640003', 'admin 于 2017-08-26 19:22:53 成功登录后台管理系统 ', '2017-08-26 19:22:54', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1e44c1015e1e4857120004', 'admin 于 2017-08-26 19:23:30 安全退出系统 ', '2017-08-26 19:23:31', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1e48fc015e1e4a23c00000', 'admin 于 2017-08-26 19:25:28 成功登录后台管理系统 ', '2017-08-26 19:25:29', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1e48fc015e1e4a35600001', 'admin 于 2017-08-26 19:25:33 安全退出系统 ', '2017-08-26 19:25:33', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1e4b15015e1e4bbcec0000', 'admin 于 2017-08-26 19:27:13 成功登录后台管理系统 ', '2017-08-26 19:27:14', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1e4b15015e1e4d69dc0001', 'admin 于 2017-08-26 19:29:03 成功登录后台管理系统 ', '2017-08-26 19:29:03', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1e4b15015e1e4e336d0002', 'admin 于 2017-08-26 19:29:55 安全退出系统 ', '2017-08-26 19:29:55', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1e4b15015e1e50786e0003', 'admin 于 2017-08-26 19:32:23 成功登录后台管理系统 ', '2017-08-26 19:32:24', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1e4b15015e1e54c6170004', 'admin 于 2017-08-26 19:37:05 成功登录后台管理系统 ', '2017-08-26 19:37:06', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1e5fb8015e1e60e8f30000', 'admin 于 2017-08-26 19:50:21 成功登录后台管理系统 ', '2017-08-26 19:50:21', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e1e6473015e1e64f6a90000', 'admin 于 2017-08-26 19:54:46 成功登录后台管理系统 ', '2017-08-26 19:54:47', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e2792f9015e27944cca0000', 'admin 于 2017-08-28 14:43:03 成功登录后台管理系统 ', '2017-08-28 14:43:04', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e2792f9015e27956dff0001', 'admin 于 2017-08-28 14:44:18 成功登录后台管理系统 ', '2017-08-28 14:44:18', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e27a3b4015e27a5f0130000', 'admin 于 2017-08-28 15:02:19 成功登录后台管理系统 ', '2017-08-28 15:02:20', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e27a6fc015e27a76ea00000', 'admin 于 2017-08-28 15:03:57 成功登录后台管理系统 ', '2017-08-28 15:03:58', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e286945015e286c88ec0000', 'admin 于 2017-08-28 18:39:15 成功登录后台管理系统 ', '2017-08-28 18:39:15', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e286945015e28961aa40001', 'admin 于 2017-08-28 19:24:39 成功登录后台管理系统 ', '2017-08-28 19:24:39', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e286945015e28962c990002', 'admin 于 2017-08-28 19:24:44 安全退出系统 ', '2017-08-28 19:24:44', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e286945015e2898b6830003', 'admin 于 2017-08-28 19:27:30 成功登录后台管理系统 ', '2017-08-28 19:27:30', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e286945015e2898c8ed0004', 'admin 于 2017-08-28 19:27:35 安全退出系统 ', '2017-08-28 19:27:35', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e28e60e015e28e932ac0000', 'admin 于 2017-08-28 20:55:25 成功登录后台管理系统 ', '2017-08-28 20:55:25', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e28f413015e28f878290000', 'admin 于 2017-08-28 21:12:05 成功登录后台管理系统 ', '2017-08-28 21:12:06', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e28f413015e28f88a990001', 'admin 于 2017-08-28 21:12:10 安全退出系统 ', '2017-08-28 21:12:11', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e29054d015e290733e00000', 'admin 于 2017-08-28 21:28:11 成功登录后台管理系统 ', '2017-08-28 21:28:11', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e292673015e292a00eb0000', 'admin 于 2017-08-28 22:06:12 成功登录后台管理系统 ', '2017-08-28 22:06:12', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e292673015e292a32310001', 'admin 于 2017-08-28 22:06:24 安全退出系统 ', '2017-08-28 22:06:25', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e292673015e292a62c90002', 'admin 于 2017-08-28 22:06:37 成功登录后台管理系统 ', '2017-08-28 22:06:37', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e2bd542015e2bd61ca50000', 'admin 于 2017-08-29 10:33:25 成功登录后台管理系统 ', '2017-08-29 10:33:26', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e2bd542015e2bd63df80001', 'admin 于 2017-08-29 10:33:34 安全退出系统 ', '2017-08-29 10:33:34', '127.0.0.1', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e2bd7b2015e2bd8f6780000', 'admin 于 2017-08-29 10:36:32 成功登录后台管理系统 ', '2017-08-29 10:36:33', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e4fa789015e4fb5886b0000', 'admin 于 2017-09-05 09:44:10 成功登录后台管理系统 ', '2017-09-05 09:44:11', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e4fdbc7015e4fddadb10000', 'admin 于 2017-09-05 10:28:01 成功登录后台管理系统 ', '2017-09-05 10:28:02', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e4fde89015e4fdfd9f60000', 'admin 于 2017-09-05 10:30:23 成功登录后台管理系统 ', '2017-09-05 10:30:24', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e500725015e500827ff0000', 'admin 于 2017-09-05 11:14:25 成功登录后台管理系统 ', '2017-09-05 11:14:25', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e500a0c015e500a85180000', 'admin 于 2017-09-05 11:17:00 成功登录后台管理系统 ', '2017-09-05 11:17:00', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e500a0c015e5064ba890001', 'admin 于 2017-09-05 12:55:32 成功登录后台管理系统 ', '2017-09-05 12:55:32', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e50b32f015e50b3a2150000', 'admin 于 2017-09-05 14:21:43 成功登录后台管理系统 ', '2017-09-05 14:21:43', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e50bbb0015e50bd82b50000', 'admin 于 2017-09-05 14:32:30 成功登录后台管理系统 ', '2017-09-05 14:32:31', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e5169ce015e516a2dda0000', 'admin 于 2017-09-05 17:41:06 成功登录后台管理系统 ', '2017-09-05 17:41:07', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e516bc1015e516c27940000', 'admin 于 2017-09-05 17:43:16 成功登录后台管理系统 ', '2017-09-05 17:43:16', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e516df2015e516e50d30000', 'admin 于 2017-09-05 17:45:37 成功登录后台管理系统 ', '2017-09-05 17:45:38', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e516fd7015e5170786b0000', 'admin 于 2017-09-05 17:47:58 成功登录后台管理系统 ', '2017-09-05 17:47:59', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e516fd7015e51b22dd10001', 'admin 于 2017-09-05 18:59:45 成功登录后台管理系统 ', '2017-09-05 18:59:45', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e51bbe1015e51bc41a70000', 'admin 于 2017-09-05 19:10:45 成功登录后台管理系统 ', '2017-09-05 19:10:46', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e51bdd2015e51be7e020000', 'admin 于 2017-09-05 19:13:12 成功登录后台管理系统 ', '2017-09-05 19:13:12', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e51c5ae015e51c64b000000', 'admin 于 2017-09-05 19:21:43 成功登录后台管理系统 ', '2017-09-05 19:21:43', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e51de9c015e51df38950000', 'admin 于 2017-09-05 19:48:57 成功登录后台管理系统 ', '2017-09-05 19:48:57', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e51e3c7015e51e462470000', 'admin 于 2017-09-05 19:54:35 成功登录后台管理系统 ', '2017-09-05 19:54:35', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e51f829015e51f912ee0000', 'admin 于 2017-09-05 20:17:11 成功登录后台管理系统 ', '2017-09-05 20:17:11', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e51fbbf015e51fc27200000', 'admin 于 2017-09-05 20:20:33 成功登录后台管理系统 ', '2017-09-05 20:20:33', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e51fd52015e51fdc7d40000', 'admin 于 2017-09-05 20:22:19 成功登录后台管理系统 ', '2017-09-05 20:22:20', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e520bec015e520c4f070000', 'admin 于 2017-09-05 20:38:11 成功登录后台管理系统 ', '2017-09-05 20:38:12', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e520dfc015e520e599a0000', 'admin 于 2017-09-05 20:40:25 成功登录后台管理系统 ', '2017-09-05 20:40:26', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e520fd9015e5210397a0000', 'admin 于 2017-09-05 20:42:28 成功登录后台管理系统 ', '2017-09-05 20:42:29', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e522a9e015e522b28500000', 'admin 于 2017-09-05 21:11:53 成功登录后台管理系统 ', '2017-09-05 21:11:54', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e526e5d015e526f25ab0000', 'admin 于 2017-09-05 22:26:09 成功登录后台管理系统 ', '2017-09-05 22:26:09', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e5274f7015e5275547c0000', 'admin 于 2017-09-05 22:32:54 成功登录后台管理系统 ', '2017-09-05 22:32:55', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e528848015e5288a5cb0000', 'admin 于 2017-09-05 22:54:00 成功登录后台管理系统 ', '2017-09-05 22:54:01', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e52a0aa015e52a110130000', 'admin 于 2017-09-05 23:20:40 成功登录后台管理系统 ', '2017-09-05 23:20:41', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e52b442015e52b4be2d0000', 'admin 于 2017-09-05 23:42:10 成功登录后台管理系统 ', '2017-09-05 23:42:10', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e52cfad015e52d008980000', 'admin 于 2017-09-06 00:11:58 成功登录后台管理系统 ', '2017-09-06 00:11:59', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e54c2b2015e54c312e00000', 'admin 于 2017-09-06 09:17:04 成功登录后台管理系统 ', '2017-09-06 09:17:04', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e553774015e5537ca5f0000', 'admin 于 2017-09-06 11:24:33 成功登录后台管理系统 ', '2017-09-06 11:24:33', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e554506015e554569080000', 'admin 于 2017-09-06 11:39:25 成功登录后台管理系统 ', '2017-09-06 11:39:26', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e5546ff015e55476dac0000', 'admin 于 2017-09-06 11:41:38 成功登录后台管理系统 ', '2017-09-06 11:41:38', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e555472015e5554db8e0000', 'admin 于 2017-09-06 11:56:18 成功登录后台管理系统 ', '2017-09-06 11:56:18', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e5558a3015e5558f4960000', 'admin 于 2017-09-06 12:00:46 成功登录后台管理系统 ', '2017-09-06 12:00:47', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e55624c015e5562a37a0000', 'admin 于 2017-09-06 12:11:21 成功登录后台管理系统 ', '2017-09-06 12:11:21', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e5565d5015e55662fa00000', 'admin 于 2017-09-06 12:15:13 成功登录后台管理系统 ', '2017-09-06 12:15:14', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e557c15015e557c64670000', 'admin 于 2017-09-06 12:39:29 成功登录后台管理系统 ', '2017-09-06 12:39:29', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e557c15015e55cdecf70005', 'admin 于 2017-09-06 14:08:32 成功登录后台管理系统 ', '2017-09-06 14:08:33', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e5a56cf015e5a57bb2d0000', 'admin 于 2017-09-07 11:17:32 成功登录后台管理系统 ', '2017-09-07 11:17:33', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e5a638c015e5a63f9860000', 'admin 于 2017-09-07 11:30:54 成功登录后台管理系统 ', '2017-09-07 11:30:55', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e5a7c78015e5a7cfb3e0000', 'admin 于 2017-09-07 11:58:13 成功登录后台管理系统 ', '2017-09-07 11:58:14', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e5a7ff3015e5a8058160000', 'admin 于 2017-09-07 12:01:54 成功登录后台管理系统 ', '2017-09-07 12:01:54', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e5a7ff3015e5ad796080002', 'admin 于 2017-09-07 13:37:11 成功登录后台管理系统 ', '2017-09-07 13:37:12', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e5a7ff3015e5b2a1ddb0003', 'admin 于 2017-09-07 15:07:20 成功登录后台管理系统 ', '2017-09-07 15:07:20', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e5b87e0015e5b884bbb0000', 'admin 于 2017-09-07 16:50:12 成功登录后台管理系统 ', '2017-09-07 16:50:13', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e5b8d40015e5b8f7ec50000', 'admin 于 2017-09-07 16:58:04 成功登录后台管理系统 ', '2017-09-07 16:58:04', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('4028d86b5e5ba322015e5ba475290000', 'admin 于 2017-09-07 17:20:58 成功登录后台管理系统 ', '2017-09-07 17:20:58', '127.0.0.1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('8f8e8f635e7f1dff015e7f1f20730000', 'admin 于 2017-09-14 14:41:39 成功登录后台管理系统 ', '2017-09-14 14:41:40', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('8f8e8f635e8343f5015e83475d500000', 'admin 于 2017-09-15 10:04:05 成功登录后台管理系统 ', '2017-09-15 10:04:06', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('8f8e8f635e8343f5015e83874e030001', 'admin 于 2017-09-15 11:13:56 成功登录后台管理系统 ', '2017-09-15 11:13:56', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('8f8e8f635e98ad55015e98ae2c910000', 'admin 于 2017-09-19 13:48:25 成功登录后台管理系统 ', '2017-09-19 13:48:25', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('8f8e8f635e98bbc1015e98bc6be60000', 'admin 于 2017-09-19 14:03:58 成功登录后台管理系统 ', '2017-09-19 14:03:59', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('8f8e8f635e98c0b4015e98c11b790000', 'admin 于 2017-09-19 14:09:05 成功登录后台管理系统 ', '2017-09-19 14:09:06', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('8f8e8f635e98d99b015e98da06220000', 'admin 于 2017-09-19 14:36:18 成功登录后台管理系统 ', '2017-09-19 14:36:19', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('8f8e8f635e98daf5015e98db7b950000', 'admin 于 2017-09-19 14:37:54 成功登录后台管理系统 ', '2017-09-19 14:37:54', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('8f8e8f635e98daf5015e9943f0cc0001', 'admin 于 2017-09-19 16:32:00 成功登录后台管理系统 ', '2017-09-19 16:32:00', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('8f8e8f635e99907c015e9990ed240000', 'admin 于 2017-09-19 17:56:05 成功登录后台管理系统 ', '2017-09-19 17:56:05', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('8f8e8f635e99907c015e99d42c4a0003', 'admin 于 2017-09-19 19:09:32 成功登录后台管理系统 ', '2017-09-19 19:09:33', '0:0:0:0:0:0:0:1', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5cd02e015e5cd0c13f0000', 'admin 于 2017-09-07 22:48:58 成功登录后台管理系统 ', '2017-09-07 22:48:58', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5cd02e015e5cd70add0001', 'admin 于 2017-09-07 22:55:50 成功登录后台管理系统 ', '2017-09-07 22:55:50', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5cdcab015e5cdd12da0000', 'admin 于 2017-09-07 23:02:25 成功登录后台管理系统 ', '2017-09-07 23:02:26', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5ce875015e5ce8db320000', 'admin 于 2017-09-07 23:15:17 成功登录后台管理系统 ', '2017-09-07 23:15:18', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5ce875015e5cf045340001', 'admin 于 2017-09-07 23:23:23 成功登录后台管理系统 ', '2017-09-07 23:23:24', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5ce875015e5cf661d20002', 'admin 于 2017-09-07 23:30:04 成功登录后台管理系统 ', '2017-09-07 23:30:04', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5ce875015e5d04caf10004', 'admin 于 2017-09-07 23:45:48 成功登录后台管理系统 ', '2017-09-07 23:45:49', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d05d9015e5d0780cd0000', 'admin 于 2017-09-07 23:48:46 成功登录后台管理系统 ', '2017-09-07 23:48:46', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d05d9015e5d079c180001', 'admin 于 2017-09-07 23:48:53 安全退出系统 ', '2017-09-07 23:48:53', '10.50.0.245', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d05d9015e5d08023d0002', 'admin 于 2017-09-07 23:49:19 成功登录后台管理系统 ', '2017-09-07 23:49:20', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d0b62015e5d0c6d230000', 'admin 于 2017-09-07 23:54:09 成功登录后台管理系统 ', '2017-09-07 23:54:09', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d0e55015e5d0ecac10000', 'admin 于 2017-09-07 23:56:44 成功登录后台管理系统 ', '2017-09-07 23:56:44', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d218b015e5d2226be0000', 'admin 于 2017-09-08 00:17:52 成功登录后台管理系统 ', '2017-09-08 00:17:53', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d218b015e5d24d6230001', 'admin 于 2017-09-08 00:20:48 成功登录后台管理系统 ', '2017-09-08 00:20:49', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d218b015e5d29be2f0002', 'admin 于 2017-09-08 00:26:10 成功登录后台管理系统 ', '2017-09-08 00:26:10', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d365e015e5d36c8030000', 'admin 于 2017-09-08 00:40:24 成功登录后台管理系统 ', '2017-09-08 00:40:25', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d365e015e5d370fbf0001', 'admin 于 2017-09-08 00:40:43 安全退出系统 ', '2017-09-08 00:40:43', '10.50.0.245', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d365e015e5f3da7650002', 'admin 于 2017-09-08 10:07:09 成功登录后台管理系统 ', '2017-09-08 10:07:10', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d365e015e5f3e57f90003', 'admin 于 2017-09-08 10:07:54 安全退出系统 ', '2017-09-08 10:07:55', '10.50.0.245', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d365e015e5f3e8c260004', 'admin 于 2017-09-08 10:08:08 成功登录后台管理系统 ', '2017-09-08 10:08:08', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d365e015e5f3ec0630005', 'admin 于 2017-09-08 10:08:21 安全退出系统 ', '2017-09-08 10:08:22', '10.50.0.245', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d365e015e60fbf9a80006', 'admin 于 2017-09-08 18:14:39 成功登录后台管理系统 ', '2017-09-08 18:14:40', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d365e015e645f71d90007', 'admin 于 2017-09-09 10:02:10 成功登录后台管理系统 ', '2017-09-09 10:02:10', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d365e015e647aad4e0008', 'admin 于 2017-09-09 10:31:54 成功登录后台管理系统 ', '2017-09-09 10:31:55', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d365e015e648c16370009', 'admin 于 2017-09-09 10:50:55 成功登录后台管理系统 ', '2017-09-09 10:50:56', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d365e015e6f0d11a7000a', 'admin 于 2017-09-11 11:48:01 成功登录后台管理系统 ', '2017-09-11 11:48:01', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d365e015e6f0e0e70000b', 'admin 于 2017-09-11 11:49:05 安全退出系统 ', '2017-09-11 11:49:06', '10.50.0.245', 'LOGOUT', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e5d365e015e74a15e0c000c', 'admin 于 2017-09-12 13:48:05 成功登录后台管理系统 ', '2017-09-12 13:48:06', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e9ee6b3015e9ee78a7f0000', 'admin 于 2017-09-20 18:48:47 成功登录后台管理系统 ', '2017-09-20 18:48:48', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e9ee6b3015e9f0e69be0001', 'admin 于 2017-09-20 19:31:15 成功登录后台管理系统 ', '2017-09-20 19:31:15', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e9ee6b3015ea22fd2e00002', 'admin 于 2017-09-21 10:06:36 成功登录后台管理系统 ', '2017-09-21 10:06:36', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e9ee6b3015ea2308c110003', 'admin 于 2017-09-21 10:07:24 成功登录后台管理系统 ', '2017-09-21 10:07:24', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e9ee6b3015ea24cc5a20004', 'admin 于 2017-09-21 10:38:13 成功登录后台管理系统 ', '2017-09-21 10:38:14', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e9ee6b3015ea2a6fd520005', 'admin 于 2017-09-21 12:16:46 成功登录后台管理系统 ', '2017-09-21 12:16:46', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e9ee6b3015ea2f90bee0006', 'admin 于 2017-09-21 13:46:24 成功登录后台管理系统 ', '2017-09-21 13:46:24', '10.50.0.245', 'LOGIN', 'admin');
INSERT INTO `admin_login_logout` VALUES ('ff8080815e9ee6b3015ea37c4ef80007', 'admin 于 2017-09-21 16:09:46 成功登录后台管理系统 ', '2017-09-21 16:09:46', '10.50.0.245', 'LOGIN', 'admin');

-- ----------------------------
-- Table structure for `admin_organization`
-- ----------------------------
DROP TABLE IF EXISTS `admin_organization`;
CREATE TABLE `admin_organization` (
  `id` varchar(255) collate utf8_bin NOT NULL,
  `expanded` bit(1) NOT NULL,
  `isleaf` bit(1) NOT NULL,
  `level` int(11) NOT NULL,
  `loaded` bit(1) NOT NULL,
  `name` varchar(255) collate utf8_bin NOT NULL,
  `parent` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin_organization
-- ----------------------------
INSERT INTO `admin_organization` VALUES ('1', '', '', '0', '', '组织机构', '0');
INSERT INTO `admin_organization` VALUES ('2', '', '', '1', '', '鹅鹅鹅鹅', '1');
INSERT INTO `admin_organization` VALUES ('402882e65fe15289015fe28c54510005', '', '', '1', '', '产品部门', '1');
INSERT INTO `admin_organization` VALUES ('402882e6602e909401602e9254cd0001', '', '', '1', '', '测试部门问问', '1');
INSERT INTO `admin_organization` VALUES ('402882e660357d29016035a853db0008', '', '', '1', '', '大智装', '1');
INSERT INTO `admin_organization` VALUES ('402882e66048f7dc016048fd395a0001', '', '', '1', '', '故事一', '1');

-- ----------------------------
-- Table structure for `admin_resource`
-- ----------------------------
DROP TABLE IF EXISTS `admin_resource`;
CREATE TABLE `admin_resource` (
  `id` varchar(255) collate utf8_bin NOT NULL,
  `expanded` bit(1) NOT NULL,
  `icon` varchar(255) collate utf8_bin default NULL,
  `is_initialized` bit(1) NOT NULL,
  `isleaf` bit(1) default NULL,
  `level` int(11) NOT NULL,
  `loaded` bit(1) NOT NULL,
  `name` varchar(255) collate utf8_bin NOT NULL,
  `parent` varchar(255) collate utf8_bin default NULL,
  `permission` varchar(255) collate utf8_bin NOT NULL,
  `root` bit(1) default NULL,
  `sort_num` int(11) NOT NULL,
  `type` varchar(255) collate utf8_bin NOT NULL,
  `url` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin_resource
-- ----------------------------
INSERT INTO `admin_resource` VALUES ('1', '', null, '', '', '0', '', '资源', '0', 'root', '', '-1', 'ROOT', null);
INSERT INTO `admin_resource` VALUES ('10', '', '', '', '', '3', '', '角色删除', '7', 'sys:role:delete', '', '2', 'ACTION', '');
INSERT INTO `admin_resource` VALUES ('11', '', '', '', '', '2', '', '部门管理', '2', 'sys:organization:view', '', '3', 'MENU', '/organization');
INSERT INTO `admin_resource` VALUES ('12', '', '', '', '', '3', '', '部门新增', '11', 'sys:organization:create', '', '0', 'ACTION', '');
INSERT INTO `admin_resource` VALUES ('13', '', '', '', '', '3', '', '部门修改', '11', 'sys:organization:update', '', '1', 'ACTION', '');
INSERT INTO `admin_resource` VALUES ('14', '', '', '', '', '3', '', '部门删除', '11', 'sys:organization:delete', '', '2', 'ACTION', '');
INSERT INTO `admin_resource` VALUES ('15', '', '', '', '', '2', '', '资源管理', '2', 'sys:resource:view', '', '2', 'MENU', '/resource');
INSERT INTO `admin_resource` VALUES ('16', '', '', '', '', '3', '', '资源新增', '15', 'sys:resource:create', '', '0', 'ACTION', '');
INSERT INTO `admin_resource` VALUES ('17', '', '', '', '', '3', '', '资源修改', '15', 'sys:resource:update', '', '1', 'ACTION', '');
INSERT INTO `admin_resource` VALUES ('18', '', '', '', '', '3', '', '资源删除', '15', 'sys:resource:delete', '', '2', 'ACTION', '');
INSERT INTO `admin_resource` VALUES ('19', '', '', '', '', '2', '', '登录退出', '2', 'sys:loginlogout:view', '', '4', 'MENU', '/loginlogout');
INSERT INTO `admin_resource` VALUES ('2', '', 'glyphicon glyphicon-align-justify', '', '', '1', '', '系统管理', '1', 'sys:view', '', '99', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('20', '', 'glyphicon', '', '', '3', '', '密码重置', '3', 'sys:password:reset', '', '3', 'ACTION', '');
INSERT INTO `admin_resource` VALUES ('28288be35e78d59b015e78d863e40001', '', 'glyphicon glyphicon-align-justify', '', '', '1', '', '位置管理', '1', 'location:view', '', '3', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('28288be35e78d59b015e78d9d1580002', '', 'glyphicon', '', '', '2', '', '首页健康资讯位置管理', '28288be35e78d59b015e78d863e40001', 'home_location:view', '', '1', 'MENU', '/home_location');
INSERT INTO `admin_resource` VALUES ('28288be35e78d59b015e78db2f0e0003', '', 'glyphicon', '', '', '2', '', '资讯位置管理', '28288be35e78d59b015e78d863e40001', 'inform_location:view', '', '2', 'MENU', '/inform_location');
INSERT INTO `admin_resource` VALUES ('28288be35e78d59b015e78dcb99c0004', '', 'glyphicon', '', '', '2', '', '快捷键词配置管理', '4028d86b5e4fa789015e4fbb7f340003', 'shortcut_key:view', '', '3', 'MENU', '/shortcut_key');
INSERT INTO `admin_resource` VALUES ('28288be35e7f25e1015e7f42488d0004', '', 'glyphicon glyphicon-list', '', '', '1', '', '内容管理', '1', 'content:view', '', '4', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('28288be35e7f25e1015e7f42f6110005', '', 'glyphicon', '', '', '2', '', '栏目管理', '28288be35e7f25e1015e7f42488d0004', 'column:view', '', '1', 'MENU', '/column');
INSERT INTO `admin_resource` VALUES ('28288be35e7f25e1015e7f43a7080006', '', 'glyphicon', '', '', '2', '', '文章管理', '28288be35e7f25e1015e7f42488d0004', 'article:view', '', '2', 'MENU', '/article');
INSERT INTO `admin_resource` VALUES ('28288be35e7f25e1015e7f4463b50007', '', 'glyphicon', '', '', '2', '', '帮助Q&A', '28288be35e7f25e1015e7f42488d0004', 'helpqa:view', '', '3', 'MENU', '/helpqa');
INSERT INTO `admin_resource` VALUES ('3', '', '', '', '', '2', '', '用户管理', '2', 'sys:user:view', '', '0', 'MENU', '/user');
INSERT INTO `admin_resource` VALUES ('4', '', '', '', '', '3', '', '用户新增', '3', 'sys:user:create', '', '0', 'ACTION', '');
INSERT INTO `admin_resource` VALUES ('402881025e89aef8015e89b636ce0001', '', 'glyphicon glyphicon-forward', '', '', '1', '', '奖品管理', '1', 'prize:view', '', '6', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('402881025e89aef8015e89bad8ed0002', '', 'glyphicon', '', '', '2', '', '奖品库管理', '402881025e89aef8015e89b636ce0001', 'prize_library:view', '', '1', 'MENU', '/prize_library');
INSERT INTO `admin_resource` VALUES ('402881025e89aef8015e89bc85b30003', '', 'glyphicon', '', '', '2', '', '签到奖励管理', '402881025e89aef8015e89b636ce0001', 'prize_sign:view', '', '2', 'MENU', '/prize_sign');
INSERT INTO `admin_resource` VALUES ('402881025e89aef8015e89bd696c0004', '', 'glyphicon', '', '', '2', '', '通用奖励管理', '402881025e89aef8015e89b636ce0001', 'prize_general:view', '', '3', 'MENU', '/prize_general');
INSERT INTO `admin_resource` VALUES ('402881025e89aef8015e89bf19340005', '', 'glyphicon', '', '', '2', '', '妙币奖励规则', '402881025e89aef8015e89b636ce0001', 'prize_miao:view', '', '4', 'MENU', '/prize_miao');
INSERT INTO `admin_resource` VALUES ('402881025e89aef8015e89bfffb70006', '', 'glyphicon', '', '', '2', '', '消息管理', '4028d86b5e4fa789015e4fbb7f340003', 'information:view', '', '4', 'MENU', '/information');
INSERT INTO `admin_resource` VALUES ('402881025e89aef8015e89c0d2890007', '', 'glyphicon', '', '', '2', '', '推送管理', '4028d86b5e4fa789015e4fbb7f340003', 'push:view', '', '5', 'MENU', '/push');
INSERT INTO `admin_resource` VALUES ('402881025e89aef8015e89c1df8d0008', '', 'glyphicon', '', '', '2', '', '意见反馈', '4028d86b5e4fa789015e4fbb7f340003', 'feedback:view', '', '6', 'MENU', '/feedback');
INSERT INTO `admin_resource` VALUES ('402881025e89aef8015e89c646c00009', '', 'glyphicon', '', '', '2', '', 'APP配置管理', '4028d86b5e4fa789015e4fbb7f340003', 'app_mag:view', '', '7', 'MENU', '/app_mag');
INSERT INTO `admin_resource` VALUES ('402881f85e56232a015e562642760001', '', 'glyphicon glyphicon-align-right', '', '', '1', '', '6项基础数据', '1', 'data:view', '', '1', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('402881f85e56232a015e56282a300003', '', 'glyphicon', '', '', '2', '', '运动数据', '402881f85e56232a015e562642760001', 'sport_data:view', '', '1', 'MENU', '/sport_data');
INSERT INTO `admin_resource` VALUES ('402881f85e56232a015e5628aaa70004', '', 'glyphicon', '', '', '2', '', '睡眠数据', '402881f85e56232a015e562642760001', 'sleep_data:view', '', '2', 'MENU', '/sleep_data');
INSERT INTO `admin_resource` VALUES ('402881f85e56232a015e5629687d0005', '', 'glyphicon', '', '', '2', '', '血压数据', '402881f85e56232a015e562642760001', 'bp_data:view', '', '3', 'MENU', '/bp_data');
INSERT INTO `admin_resource` VALUES ('402881f85e56232a015e562a63b30006', '', 'glyphicon', '', '', '2', '', '血糖数据', '402881f85e56232a015e562642760001', 'bg_data:view', '', '4', 'MENU', '/bg_data');
INSERT INTO `admin_resource` VALUES ('402881f85e56232a015e562b2d280007', '', 'glyphicon', '', '', '2', '', '瘦身数据', '402881f85e56232a015e562642760001', 'loseweight_data:view', '', '5', 'MENU', '/loseweight_data');
INSERT INTO `admin_resource` VALUES ('402881f85e56232a015e562bf37e0008', '', 'glyphicon', '', '', '2', '', '体温数据', '402881f85e56232a015e562642760001', 'temperature_data:view', '', '6', 'MENU', '/temperature_data');
INSERT INTO `admin_resource` VALUES ('402881fe5e74e6aa015e74ed1d710001', '', 'glyphicon glyphicon-user', '', '', '1', '', '用户信息管理', '1', 'user:view', '', '0', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('402881fe5e74e6aa015e74ee3e5c0002', '', 'glyphicon', '', '', '2', '', '用户管理', '402881fe5e74e6aa015e74ed1d710001', 'mag_user:view', '', '1', 'MENU', '/mag_user');
INSERT INTO `admin_resource` VALUES ('402881fe5e74e6aa015e74ef34ec0003', '', 'glyphicon', '', '', '2', '', '用户妙币合计', '402881fe5e74e6aa015e74ed1d710001', 'miao_total:view', '', '2', 'MENU', '/miao_total');
INSERT INTO `admin_resource` VALUES ('402881fe5e74e6aa015e74f0673f0004', '', 'glyphicon', '', '', '2', '', '用户妙币获取明细', '402881fe5e74e6aa015e74ed1d710001', 'miao_detail:view', '', '3', 'MENU', '/miao_detail');
INSERT INTO `admin_resource` VALUES ('402881fe5e88c138015e893bf5db0002', '', 'glyphicon glyphicon-align-left', '', '', '1', '', '活动管理', '1', 'activity:view', '', '5', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('402881fe5e88c138015e893ce14a0003', '', 'glyphicon', '', '', '2', '', '热门活动', '402881fe5e88c138015e893bf5db0002', 'hot_events:view', '', '1', 'MENU', '/hot_events');
INSERT INTO `admin_resource` VALUES ('402881fe5e88c138015e8950c2800004', '', 'glyphicon', '', '', '2', '', '抽奖活动', '402881fe5e88c138015e893bf5db0002', 'lotto:view', '', '2', 'MENU', '/lotto');
INSERT INTO `admin_resource` VALUES ('402881fe5e88c138015e895175a90005', '', 'glyphicon', '', '', '2', '', '流量充值管理', '402881fe5e88c138015e893bf5db0002', 'flow:view', '', '3', 'MENU', '/flow');
INSERT INTO `admin_resource` VALUES ('402881fe5ea72fdf015ea732d6cd0001', '', 'glyphicon', '', '', '2', '', '跑马圈奖', '402881fe5e88c138015e893bf5db0002', 'paoma:view', '', '4', 'MENU', '/paoma');
INSERT INTO `admin_resource` VALUES ('402882e55f3e9ab7015f3e9c78d80001', '', 'glyphicon glyphicon-wrench', '', '', '1', '', '设备管理', '1', 'device:view', '', '7', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('402882e55f3e9ab7015f3e9d26a20002', '', 'glyphicon', '', '', '2', '', '设备库', '402882e55f3e9ab7015f3e9c78d80001', 'source_device:view', '', '1', 'MENU', '/devicesource');
INSERT INTO `admin_resource` VALUES ('402882e55f3e9ab7015f3e9dd5590003', '', 'glyphicon', '', '', '2', '', '设备库管理', '402882e55f3e9ab7015f3e9c78d80001', 'manager_device:view', '', '2', 'MENU', '/devicemanager');
INSERT INTO `admin_resource` VALUES ('402882e55f3e9ab7015f3e9e5dce0004', '', 'glyphicon', '', '', '2', '', '设备分类管理', '402882e55f3e9ab7015f3e9c78d80001', 'cata_device:view', '', '3', 'MENU', '/devicecata');
INSERT INTO `admin_resource` VALUES ('402882e65f9539c9015f953e1ace0001', '', 'glyphicon glyphicon-th', '', '', '1', '', 'MyTask', '1', 'whiteboard:view', '', '0', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('402882e65f9539c9015f953fb15a0004', '', 'glyphicon', '', '', '2', '', '白板详情', '402882e65f9539c9015f953e1ace0001', 'whiteboard_:view', '', '1', 'MENU', '/whiteboard');
INSERT INTO `admin_resource` VALUES ('402882e65fa40416015fa4076c130002', '', 'glyphicon glyphicon-list', '', '', '1', '', '项目管理', '1', 'projectmanager:view', '', '1', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('402882e65fa40416015fa408755a0003', '', 'glyphicon', '', '', '2', '', '项目列表', '402882e65fa40416015fa4076c130002', 'projectList:view', '', '2', 'MENU', '/projectList');
INSERT INTO `admin_resource` VALUES ('402882e65fa40416015fa43c16ba000a', '', 'glyphicon glyphicon-dashboard', '', '', '1', '', '考勤管理', '1', 'dailytime:view', '', '2', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('402882e65fa40416015fa43d0516000b', '', 'glyphicon', '', '', '2', '', '考勤', '402882e65fa40416015fa43c16ba000a', 'dailytime_:view', '', '1', 'MENU', '/dailytime');
INSERT INTO `admin_resource` VALUES ('402882e65fa40416015fa43de32b000c', '', 'glyphicon glyphicon-user', '', '', '1', '', '员工管理', '1', 'staff:view', '', '3', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('402882e65fa40416015fa49edf480011', '', 'glyphicon glyphicon-pencil', '', '', '1', '', '技术交流', '1', 'exchange_skills:view', '', '3', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('402882e65fa40416015fa49f7bdf0012', '', 'glyphicon', '', '', '2', '', '技术交流', '402882e65fa40416015fa49edf480011', 'skills_exchange:view', '', '1', 'MENU', '/skills_exchange');
INSERT INTO `admin_resource` VALUES ('402882e65fa40416015fa4a166670016', '', 'glyphicon', '', '', '2', '', '员工管理', '402882e65fa40416015fa43de32b000c', 'staffs:view', '', '1', 'MENU', '/staffs');
INSERT INTO `admin_resource` VALUES ('402882e65fa40416015fa4a2b4b90018', '', 'glyphicon glyphicon-yen', '', '', '1', '', '报销流程管理', '1', 'money:view', '', '4', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('402882e65fa40416015fa4a36efb0019', '', 'glyphicon', '', '', '2', '', '报销流程', '402882e65fa40416015fa4a2b4b90018', 'takemoney:view', '', '1', 'MENU', '/takemoney');
INSERT INTO `admin_resource` VALUES ('402882e65fb3f297015fb47a05020004', '', 'glyphicon glyphicon-align-center', '', '', '1', '', '个人信息', '1', 'person:view', '', '4', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('402882e65fb3f297015fb47aaad40005', '', 'glyphicon', '', '', '2', '', '个人信息查询', '402882e65fb3f297015fb47a05020004', 'person_:view', '', '1', 'MENU', '/person');
INSERT INTO `admin_resource` VALUES ('402882e65fc7f1e4015fc817cfb50001', '', 'glyphicon', '', '', '2', '', '员工手册', '402882e65fa40416015fa43de32b000c', 'staff_manual:view', '', '2', 'MENU', '/staff_manual');
INSERT INTO `admin_resource` VALUES ('402882e65fc88ca4015fc8a228ae0001', '', 'glyphicon', '', '', '2', '', '出差', '402882e65fa40416015fa49edf480011', 'business_trip:view', '', '2', 'MENU', '/business_trip');
INSERT INTO `admin_resource` VALUES ('402882e65fc8b46b015fc9213b7d0001', '', 'glyphicon', '', '', '2', '', '任务模版', '402882e65fa40416015fa4076c130002', 'projectmodel:view', '', '3', 'MENU', '/projectmodel');
INSERT INTO `admin_resource` VALUES ('402882e66025a4f2016025b4fb7a0004', '', 'glyphicon', '', '', '2', '', '员工测评', '402882e65fa40416015fa43de32b000c', 'staffs_test:view', '', '3', 'MENU', '/staffs/staffs_test');
INSERT INTO `admin_resource` VALUES ('402882e66033ca76016033de70030001', '', 'glyphicon', '', '', '2', '', '新建项目', '402882e65fa40416015fa4076c130002', 'projectList:add', '', '1', 'MENU', '/projectList/add');
INSERT INTO `admin_resource` VALUES ('402882e66052dedd016052e79cf20003', '', 'glyphicon', '', '', '2', '', '资源配置项', '2', 'product_source:view', '', '3', 'MENU', '/product_source_edit');
INSERT INTO `admin_resource` VALUES ('4028d86b5e4fa789015e4fbb7f340003', '', 'glyphicon glyphicon-play-circle', '', '', '1', '', '运营管理', '1', 'operate:view', '', '2', 'COLUMN', '');
INSERT INTO `admin_resource` VALUES ('4028d86b5e4fde89015e4fe0f3d90001', '', 'glyphicon', '', '', '2', '', '启动页管理', '4028d86b5e4fa789015e4fbb7f340003', 'boot:view', '', '2', 'MENU', '/boot');
INSERT INTO `admin_resource` VALUES ('4028d86b5e528848015e528933740001', '', 'glyphicon', '', '', '2', '', 'Banner管理', '4028d86b5e4fa789015e4fbb7f340003', 'banner:view', '', '1', 'MENU', '/banner');
INSERT INTO `admin_resource` VALUES ('5', '', '', '', '', '3', '', '用户修改', '3', 'sys:user:update', '', '1', 'ACTION', '');
INSERT INTO `admin_resource` VALUES ('6', '', '', '', '', '3', '', '用户删除', '3', 'sys:user:delete', '', '2', 'ACTION', '');
INSERT INTO `admin_resource` VALUES ('7', '', '', '', '', '2', '', '角色管理', '2', 'sys:role:view', '', '1', 'MENU', '/role');
INSERT INTO `admin_resource` VALUES ('8', '', '', '', '', '3', '', '角色新增', '7', 'sys:role:create', '', '0', 'ACTION', '');
INSERT INTO `admin_resource` VALUES ('9', '', '', '', '', '3', '', '角色修改', '7', 'sys:role:update', '', '1', 'ACTION', '');

-- ----------------------------
-- Table structure for `admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` varchar(255) collate utf8_bin NOT NULL,
  `description` varchar(255) collate utf8_bin default NULL,
  `role` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('1', '超级管理员', 'admin');
INSERT INTO `admin_role` VALUES ('4028d83b58f10ffc0158f11110890002', 'user', 'user');

-- ----------------------------
-- Table structure for `admin_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_resource`;
CREATE TABLE `admin_role_resource` (
  `id` varchar(255) collate utf8_bin NOT NULL,
  `resourceid` varchar(255) collate utf8_bin NOT NULL,
  `roleid` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FKq04scdraic0dm4mo49jkticug` (`resourceid`),
  KEY `FK2e1cgfujbdvtvc8my4bosyud2` (`roleid`),
  CONSTRAINT `FK2e1cgfujbdvtvc8my4bosyud2` FOREIGN KEY (`roleid`) REFERENCES `admin_role` (`id`),
  CONSTRAINT `FKq04scdraic0dm4mo49jkticug` FOREIGN KEY (`resourceid`) REFERENCES `admin_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin_role_resource
-- ----------------------------
INSERT INTO `admin_role_resource` VALUES ('1', '2', '1');
INSERT INTO `admin_role_resource` VALUES ('10', '15', '1');
INSERT INTO `admin_role_resource` VALUES ('11', '16', '1');
INSERT INTO `admin_role_resource` VALUES ('12', '17', '1');
INSERT INTO `admin_role_resource` VALUES ('13', '18', '1');
INSERT INTO `admin_role_resource` VALUES ('14', '11', '1');
INSERT INTO `admin_role_resource` VALUES ('15', '12', '1');
INSERT INTO `admin_role_resource` VALUES ('16', '13', '1');
INSERT INTO `admin_role_resource` VALUES ('17', '14', '1');
INSERT INTO `admin_role_resource` VALUES ('18', '19', '1');
INSERT INTO `admin_role_resource` VALUES ('2', '3', '1');
INSERT INTO `admin_role_resource` VALUES ('3', '4', '1');
INSERT INTO `admin_role_resource` VALUES ('4', '5', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e5606e57b001606e5c1a400002', '1', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e229a40006', '1', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e2f18a000c', '1', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e2fcad000d', '402882e65f9539c9015f953e1ace0001', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e2fedb000e', '402882e65f9539c9015f953fb15a0004', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e30e5c000f', '402882e65fa40416015fa4076c130002', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e3107c0010', '402882e66033ca76016033de70030001', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e312690011', '402882e65fa40416015fa408755a0003', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e3141b0012', '402882e65fc8b46b015fc9213b7d0001', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e318ac0013', '402882e65fa40416015fa43c16ba000a', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e31a760014', '402882e65fa40416015fa43d0516000b', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e32b810015', '402882e65fa40416015fa43de32b000c', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e32cf10016', '402882e65fa40416015fa4a166670016', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e32ea90017', '402882e65fc7f1e4015fc817cfb50001', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e3305b0018', '402882e66025a4f2016025b4fb7a0004', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e33b510019', '402882e65fa40416015fa49edf480011', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e33d39001a', '402882e65fa40416015fa49f7bdf0012', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e33eee001b', '402882e65fc88ca4015fc8a228ae0001', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e34ff2001c', '402882e65fa40416015fa4a2b4b90018', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e351d1001d', '402882e65fa40416015fa4a36efb0019', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e359c2001e', '402882e65fb3f297015fb47a05020004', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e35ba3001f', '402882e65fb3f297015fb47aaad40005', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e36d590020', '2', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e37bc20021', '3', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e383830022', '7', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e38c340023', '15', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e3a1ab0024', '11', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e3aabb0025', '402882e66052dedd016052e79cf20003', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e3afbb0026', '19', '1');
INSERT INTO `admin_role_resource` VALUES ('402882e56072b57e016072e3d28d0027', '1', '1');
INSERT INTO `admin_role_resource` VALUES ('4028d83b58f10ffc0158f1943faf000a', '2', '4028d83b58f10ffc0158f11110890002');
INSERT INTO `admin_role_resource` VALUES ('4028d83b58f10ffc0158f19660e9000c', '19', '4028d83b58f10ffc0158f11110890002');
INSERT INTO `admin_role_resource` VALUES ('5', '6', '1');
INSERT INTO `admin_role_resource` VALUES ('6', '7', '1');
INSERT INTO `admin_role_resource` VALUES ('7', '8', '1');
INSERT INTO `admin_role_resource` VALUES ('8', '9', '1');
INSERT INTO `admin_role_resource` VALUES ('9', '10', '1');

-- ----------------------------
-- Table structure for `admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` varchar(255) collate utf8_bin NOT NULL,
  `create_time` datetime NOT NULL,
  `email` varchar(255) collate utf8_bin NOT NULL,
  `last_login_time` datetime default NULL,
  `locked` bit(1) NOT NULL,
  `organization_id` varchar(255) collate utf8_bin default NULL,
  `password` varchar(255) collate utf8_bin NOT NULL,
  `password_update_time` datetime default NULL,
  `username` varchar(40) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_lvod9bfm438ex1071ku1glb70` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', '2016-01-01 00:00:00', 'sdevil507@163.com', '2018-01-08 09:24:43', '', '2', 'be05977add575832dc52655d4ad5c42e', '2016-01-01 00:00:00', 'admin');
INSERT INTO `admin_user` VALUES ('402882e6603448670160346f75190002', '2017-12-08 12:43:28', 'baishui@qq.com', null, '', '402882e65fe15289015fe28c54510005', 'be05977add575832dc52655d4ad5c42e', '2017-12-08 12:43:28', 'baishui');
INSERT INTO `admin_user` VALUES ('402882e6603448670160346fc0f40003', '2017-12-08 12:43:47', 'baishui1@qq.com', null, '', '402882e6602e909401602e9254cd0001', 'be05977add575832dc52655d4ad5c42e', '2017-12-08 12:43:47', 'baishui1');
INSERT INTO `admin_user` VALUES ('402882e660357d29016035a8c7d90009', '2017-12-08 18:25:42', '7777777@qq.com', null, '', '402882e660357d29016035a853db0008', 'be05977add575832dc52655d4ad5c42e', '2017-12-08 18:25:42', 'zhizhuang');
INSERT INTO `admin_user` VALUES ('4028b88158e243d20158e244c6fc0002', '2016-12-09 14:28:28', 'test1@163.com', '2017-08-27 16:07:35', '', '2', '126cfbcd4d16ae6d25c9bfcae76d8ee4', '2017-08-27 16:07:05', 'test');

-- ----------------------------
-- Table structure for `admin_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role` (
  `userid` varchar(255) collate utf8_bin NOT NULL,
  `roleid` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`roleid`,`userid`),
  KEY `FK7qut35m6ve8ecxco1tlg11kki` (`userid`),
  CONSTRAINT `FK7qut35m6ve8ecxco1tlg11kki` FOREIGN KEY (`userid`) REFERENCES `admin_user` (`id`),
  CONSTRAINT `FKje0w5pddf34j5wc4e4550ux4t` FOREIGN KEY (`roleid`) REFERENCES `admin_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin_user_role
-- ----------------------------
INSERT INTO `admin_user_role` VALUES ('1', '1');
INSERT INTO `admin_user_role` VALUES ('402882e6603448670160346f75190002', '1');
INSERT INTO `admin_user_role` VALUES ('402882e6603448670160346fc0f40003', '1');
INSERT INTO `admin_user_role` VALUES ('402882e660357d29016035a8c7d90009', '1');
INSERT INTO `admin_user_role` VALUES ('4028b88158e243d20158e244c6fc0002', '4028d83b58f10ffc0158f11110890002');

-- ----------------------------
-- Table structure for `app_app_mag`
-- ----------------------------
DROP TABLE IF EXISTS `app_app_mag`;
CREATE TABLE `app_app_mag` (
  `id` varchar(255) NOT NULL,
  `createdate` datetime default NULL,
  `downaddress` varchar(255) default NULL,
  `enddate` datetime default NULL,
  `magid` int(11) default NULL,
  `platformnum` varchar(255) default NULL,
  `startdate` datetime default NULL,
  `state` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `versionnum` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_app_mag
-- ----------------------------

-- ----------------------------
-- Table structure for `app_article`
-- ----------------------------
DROP TABLE IF EXISTS `app_article`;
CREATE TABLE `app_article` (
  `id` varchar(255) NOT NULL COMMENT '文章主键',
  `no` int(4) default NULL COMMENT '序号',
  `column_name` varchar(255) default NULL COMMENT '栏目名称',
  `column_id` int(255) default NULL COMMENT '栏目ID',
  `label` varchar(255) default NULL COMMENT '文章标签',
  `intro` varchar(255) default NULL COMMENT '简介',
  `update_date` datetime default NULL COMMENT '更新时间',
  `create_date` datetime default NULL COMMENT '创建时间',
  `sort_no` int(4) default NULL COMMENT '排序号',
  `is_recommend` varchar(2) default NULL COMMENT '是否首页推荐',
  `home_sort_no` int(4) default NULL COMMENT '首页排序号',
  `praise_num` int(8) default NULL COMMENT '点赞数',
  `comment_num` int(8) default NULL COMMENT '评论数',
  `share_content` varchar(255) default NULL COMMENT '分享文案',
  `share_ico` varchar(255) default NULL COMMENT '分享缩略图',
  `state` varchar(2) default NULL COMMENT '状态',
  `article_content` text COMMENT '文章内容',
  `article_title` varchar(255) default NULL COMMENT '文章标题',
  `columnart_id` varchar(255) NOT NULL,
  `guess_id` varchar(255) default '',
  `logo_url` varchar(255) default NULL,
  `plate` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章管理';

-- ----------------------------
-- Records of app_article
-- ----------------------------
INSERT INTO `app_article` VALUES ('402882e45f472c6f015f480e3a740002', '0', null, '11', '0', 'baishui', '2017-10-23 15:07:23', '2017-10-23 15:07:23', '1', '0', '0', '0', '0', '', 'http://127.0.0.1:8123/', '1', 'baishui-----', 'baishui', 'aaa7', '3,2,1', 'baishui,', '1');
INSERT INTO `app_article` VALUES ('402882e45f472c6f015f48208ec60003', '0', null, '12', '0', 'baishui888', '2017-10-23 15:26:54', '2017-10-23 15:26:54', '0', '0', '0', '0', '0', 'baishui888', '', '1', 'baishui888', 'baishui888', 'aaa7', '6,7,8', '', '1');
INSERT INTO `app_article` VALUES ('402882e55f331809015f331fc02c0002', '0', null, '8', '0', '文章测试1', '2017-10-23 11:30:11', '2017-10-23 11:30:11', '1', '0', '2', '0', '0', '文章测试1', 'http://127.0.0.1:8123/107f2397-c4b8-4e19-967a-70b555e78b4b.png', '1', '<p style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><span>pasteType函数，默认值是2，设置为1</span></span>\r\n</p>\r\n<p style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">\r\n	<span><span style=\"color:#FF0000;\">粘贴类型：0（<span>禁止粘贴</span>），1（<span>纯文本粘贴</span>），2（<span>HTML粘贴</span>）</span></span>\r\n</p>\r\n<p style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">\r\n	<span><span style=\"color:#FF0000;\"><br />\r\n</span></span>\r\n</p>\r\n<br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">&lt;link rel=\"stylesheet\" href=\"/editor/themes/default/default.css\" /&gt;</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">&lt;script charset=\"utf-8\" src=\"/editor/kindeditor-min.js\"&gt;&lt;/script&gt;</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">&lt;script charset=\"utf-8\" src=\"/editor/lang/en.js\"&gt;&lt;/script&gt;</span><br />\r\n<br />\r\n<br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">&lt;script&gt;</span><br />\r\n<br />\r\n<br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">KindEditor.ready(function(K) {</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">editor = K.create(\'textarea[name=&lt;?php echo $ContentName ?&gt;]\', {</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">resizeType : 1,</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">pasteType : 1, &nbsp;//粘贴 没格式</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">allowPreviewEmoticons : false,</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">allowImageRemote:false, &nbsp;//网络图片关闭</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">allowImageUpload : true, //本地图片开启</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">afterBlur:function(){this.sync(); }, &nbsp;//失去焦点 将 kindeditor的值同步给textarea</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">items : [ \'removeformat\', \'|\', \'image\' ]</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">});</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">});</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">&lt;/script&gt;</span><br />\r\n<br />\r\n<br />\r\n<br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">&lt;textarea name=\"&lt;?php echo $ContentName ?&gt;\" id=\"&lt;?php echo $ContentName ?&gt;\" style=\"width:&lt;?php echo $width ?&gt;px;height:250px;visibility:hidden;\"&gt;&lt;?php echo htmlspecialchars($Content) ?&gt;&lt;/textarea&gt;</span>', '文章测试1', 'aaa1', '2,3,4', '文章测试1文章测试1文章测试1文章测试1,107f2397-c4b8-4e19-967a-70b555e78b4b.png', '1');
INSERT INTO `app_article` VALUES ('402882e55f331809015f332120410003', '0', null, '7', '0', '文章测试2', '2017-10-23 11:28:12', '2017-10-23 11:28:12', '5', '0', '4', '0', '0', '文章测试2', 'http://127.0.0.1:8123/107f2397-c4b8-4e19-967a-70b555e78b4b.png', '1', '文章测试2文章测试2文章测试2文章测试2文章测试2文章测试2999999999999999999999999999999999', '文章测试2', 'aaa1', '3,2,1', '文章测试2文章测试2文章测试2文章测试2文章测试2文章测试2,107f2397-c4b8-4e19-967a-70b555e78b4b.png', '1');
INSERT INTO `app_article` VALUES ('402882e55f331809015f332236f40004', '0', null, '3', '0', '文章测试3', '2017-10-19 13:36:41', '2017-10-19 13:36:41', '3', '0', '6', '0', '7', '文章测试3', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', '1', '<p style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><span>pasteType函数，默认值是2，设置为1</span></span>\r\n</p>\r\n<p style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">\r\n	<span><span style=\"color:#FF0000;\">粘贴类型：0（<span>禁止粘贴</span>），1（<span>纯文本粘贴</span>），2（<span>HTML粘贴</span>）</span></span>\r\n</p>\r\n<p style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">\r\n	<span><span style=\"color:#FF0000;\"><br />\r\n</span></span>\r\n</p>\r\n<br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">&lt;link rel=\"stylesheet\" href=\"/editor/themes/default/default.css\" /&gt;</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">&lt;script charset=\"utf-8\" src=\"/editor/kindeditor-min.js\"&gt;&lt;/script&gt;</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">&lt;script charset=\"utf-8\" src=\"/editor/lang/en.js\"&gt;&lt;/script&gt;</span><br />\r\n<br />\r\n<br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">&lt;script&gt;</span><br />\r\n<br />\r\n<br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">KindEditor.ready(function(K) {</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">editor = K.create(\'textarea[name=&lt;?php echo $ContentName ?&gt;]\', {</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">resizeType : 1,</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">pasteType : 1, &nbsp;//粘贴 没格式</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">allowPreviewEmoticons : false,</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">allowImageRemote:false, &nbsp;//网络图片关闭</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">allowImageUpload : true, //本地图片开启</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">afterBlur:function(){this.sync(); }, &nbsp;//失去焦点 将 kindeditor的值同步给textarea</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">items : [ \'removeformat\', \'|\', \'image\' ]</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">});</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">});</span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\"></span><br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">&lt;/script&gt;</span><br />\r\n<br />\r\n<br />\r\n<br />\r\n<span style=\"color:#454545;font-family:&quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun;font-size:16px;background-color:#FFFFFF;\">&lt;textarea name=\"&lt;?php echo $ContentName ?&gt;\" id=\"&lt;?php echo $ContentName ?&gt;\" style=\"width:&lt;?php echo $width ?&gt;px;height:250px;visibility:hidden;\"&gt;&lt;?php echo htmlspecialchars($Content) ?&gt;&lt;/textarea&gt;</span>', '文章测试3', 'aaa1', '4,3,2', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', '1');
INSERT INTO `app_article` VALUES ('402882e55f331809015f3322e7170005', '0', null, '4', '1', '文章测试4', '2017-10-19 13:37:26', '2017-10-19 13:37:26', '4', '0', '4', '0', '0', '文章测试4', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', '1', '文章测试4文章测试4文章测试4文章测试4文章测试4文章测试4', '文章测试4', 'aaa1', '2,6,4', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', '1');
INSERT INTO `app_article` VALUES ('402882e55f331809015f3323b4a50006', '0', null, '9', '0', '文章测试5', '2017-10-23 11:36:11', '2017-10-23 11:36:11', '2', '0', '1', '0', '0', '文章测试5文章测试5', 'http://127.0.0.1:8123/107f2397-c4b8-4e19-967a-70b555e78b4b.png', '1', '也同样拥有', '文章测试5', 'aaa7', '6,4,3', '文章测试5文章测试5文章测试5文章测试5文章测试5文章测试5,107f2397-c4b8-4e19-967a-70b555e78b4b.png', '1');
INSERT INTO `app_article` VALUES ('402882e55f331809015f3324117a0007', '0', null, '6', '2', '文章测试6', '2017-10-19 13:38:43', '2017-10-19 13:38:43', '4', '0', '5', '0', '0', '文章测试6', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', '1', '文章测试6文章测试6文章测试6文章测试6文章测试6', '文章测试6', 'aaa10', '4,5,6', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', '1');

-- ----------------------------
-- Table structure for `app_article_pra`
-- ----------------------------
DROP TABLE IF EXISTS `app_article_pra`;
CREATE TABLE `app_article_pra` (
  `id` varchar(255) NOT NULL,
  `article_id` varchar(255) NOT NULL,
  `createtime` datetime default NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_article_pra
-- ----------------------------
INSERT INTO `app_article_pra` VALUES ('31231', '2322', '2017-09-29 19:24:45', '21212');
INSERT INTO `app_article_pra` VALUES ('333', '11212', '2017-09-29 19:21:40', '21212');
INSERT INTO `app_article_pra` VALUES ('402882e55ed122c7015ed122f9ab0000', '333', '2017-09-30 12:54:44', '21212');
INSERT INTO `app_article_pra` VALUES ('402882e55ed12fa4015ed138076e0000', '6565', '2017-09-30 13:17:44', '21212');
INSERT INTO `app_article_pra` VALUES ('402882f45f336277015f336e18d60006', '402882e55f331809015f332dddda0013', '2017-10-19 14:59:34', '402881ef5ea8c2bd015ea8dfdde80001');

-- ----------------------------
-- Table structure for `app_art_criticism`
-- ----------------------------
DROP TABLE IF EXISTS `app_art_criticism`;
CREATE TABLE `app_art_criticism` (
  `id` varchar(255) NOT NULL,
  `content` varchar(255) default NULL,
  `createtime` datetime default NULL,
  `target_id` varchar(255) default NULL,
  `user_id` varchar(255) default NULL,
  `user_img` varchar(255) default NULL,
  `user_name` varchar(255) default NULL,
  `num` int(11) default NULL,
  `target_num` int(11) default NULL,
  `floor` int(11) default NULL,
  `ip` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_art_criticism
-- ----------------------------
INSERT INTO `app_art_criticism` VALUES ('402882f45f393883015f39c9f21c0022', '1', '2017-10-20 20:37:37', '402882f45f34c181015f34c629aa0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '2', '3', '1', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f393883015f39ca0b730023', '1-1', '2017-10-20 20:37:43', '402882f45f393883015f39c9f21c0022', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '4', '1', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f393883015f39ca2db20024', '1-2', '2017-10-20 20:37:52', '402882f45f393883015f39c9f21c0022', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '4', '2', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f393883015f39cca2220025', '12323', '2017-10-20 20:40:33', '402882f45f34c181015f34c629aa0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '1', '3', '2', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f393883015f39cccc570026', '12323123231', '2017-10-20 20:40:44', '402882f45f393883015f39cca2220025', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '4', '1', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f393883015f39cce3240027', '12323123231AAA', '2017-10-20 20:40:50', '402882f45f34c181015f34c629aa0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '3', '3', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f393883015f39ce45ff0028', '123', '2017-10-20 20:42:21', '402882f45f34c181015f34c629aa0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '3', '4', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f393883015f39ce47650029', '123', '2017-10-20 20:42:21', '402882f45f34c181015f34c629aa0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '3', '4', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f393883015f39ce7a71002a', '1', '2017-10-20 20:42:34', '402882f45f34c181015f34c629aa0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '3', '5', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f393883015f39d06f66002b', '131212', '2017-10-20 20:44:42', '402882f45f34c181015f34c629aa0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '3', '6', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f393883015f39d23ecf002c', '12', '2017-10-20 20:46:41', '402882f45f34c181015f34c629aa0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '3', '7', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f393883015f39d2b77e002d', '1213', '2017-10-20 20:47:12', '402882f45f34c181015f34c629aa0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '3', '8', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f39d55a015f39d5898a0000', '123', '2017-10-20 20:50:17', '402882f45f34c181015f34c629aa0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '2', '3', '9', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f39d55a015f39d589db0001', '123', '2017-10-20 20:50:17', '402882f45f34c181015f34c629aa0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '3', '10', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f39d55a015f39d686ff0002', '12', '2017-10-20 20:51:21', '402882f45f34c181015f34c629aa0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '2', '3', '11', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f39d55a015f39da23cf0003', '12-1', '2017-10-20 20:55:18', '402882f45f39d55a015f39d686ff0002', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '4', '1', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f39d55a015f39da5af90004', '12-2', '2017-10-20 20:55:32', '402882f45f39d55a015f39d686ff0002', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '4', '2', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f39d55a015f39da7da70005', '123-1', '2017-10-20 20:55:41', '402882f45f39d55a015f39d5898a0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '4', '1', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f39d55a015f39da98b20006', '123-2', '2017-10-20 20:55:48', '402882f45f39d55a015f39d5898a0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '4', '2', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f39d55a015f39dbb9a80007', '12121', '2017-10-20 20:57:02', '402882f45f34c181015f34c629aa0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '3', '12', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f3ddf32015f3df74d5c0000', '戒子', '2017-10-21 16:05:38', '402882e55f331809015f332236f40004', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '2', '0', '1', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f3ddf32015f3df78b660001', 'abc', '2017-10-21 16:05:54', '402882f45f3ddf32015f3df74d5c0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '1', '1', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f3ddf32015f3df7f6d40002', 'abc', '2017-10-21 16:06:22', '402882e55f331809015f332236f40004', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '0', '2', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f3ddf32015f3df7f6f40003', 'abc', '2017-10-21 16:06:22', '402882e55f331809015f332236f40004', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '0', '2', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f3ddf32015f3df7f7130004', 'abc', '2017-10-21 16:06:22', '402882e55f331809015f332236f40004', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '0', '3', '192.168.2.100', '0', null);
INSERT INTO `app_art_criticism` VALUES ('402882f45f3ddf32015f3e01ce4c0005', '123', '2017-10-21 16:17:07', '402882f45f3ddf32015f3df74d5c0000', '402881ef5ea8c2bd015ea8dfdde80001', null, null, '0', '1', '2', '192.168.2.100', '0', null);

-- ----------------------------
-- Table structure for `app_banner`
-- ----------------------------
DROP TABLE IF EXISTS `app_banner`;
CREATE TABLE `app_banner` (
  `id` varchar(255) NOT NULL,
  `banner_position_enum` varchar(255) default NULL,
  `end_time` datetime default NULL,
  `name` varchar(255) default NULL,
  `pic_url` varchar(255) default NULL,
  `serial_num` int(11) default NULL,
  `start_time` datetime default NULL,
  `target_url` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_banner
-- ----------------------------
INSERT INTO `app_banner` VALUES ('402881f85e57866f015e57878da10001', 'HOME', '2017-09-22 00:00:00', 'rtrddff', '8daf1a5b-adf9-42f3-b7fa-801741506394.jpg', '333', '2017-09-13 00:00:00', 'www.baidu.com');
INSERT INTO `app_banner` VALUES ('402882e65fd733c4015fd73fcaeb0001', 'HOME', '2017-11-20 10:26:39', '123', '', '0', '2017-11-21 00:00:00', null);

-- ----------------------------
-- Table structure for `app_boot`
-- ----------------------------
DROP TABLE IF EXISTS `app_boot`;
CREATE TABLE `app_boot` (
  `id` varchar(255) NOT NULL COMMENT 'uuid',
  `serial_num` int(11) NOT NULL COMMENT '排序序号',
  `remark_name` varchar(255) NOT NULL COMMENT '备注名称',
  `pic_url` varchar(500) NOT NULL COMMENT '图片地址',
  `target_url` varchar(255) NOT NULL COMMENT '跳转地址',
  `boot_online_state_enum` varchar(255) default NULL COMMENT '在线状态',
  `end_time` datetime default NULL COMMENT '启始时间',
  `start_time` datetime default NULL COMMENT '结束时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_boot
-- ----------------------------
INSERT INTO `app_boot` VALUES ('4028d86b5e557c15015e5581e63b0002', '1', '1', 'c7eeafdc-9483-462f-9ba5-fe7f8186f6e7.png', '', 'ONLINE', '2017-09-21 00:00:00', '2017-09-12 00:00:00');
INSERT INTO `app_boot` VALUES ('4028d86b5e557c15015e558226330003', '3', '13', '79f8bd31-52b1-4bb8-ab68-cc3d231b7e7c.jpg', '', 'ONLINE', '2017-09-28 00:00:00', '2017-09-13 00:00:00');
INSERT INTO `app_boot` VALUES ('4028d86b5e557c15015e55825b9c0004', '4', '14', '8372ea3b-066c-44ba-babf-e0307ec72c5e.jpg', '', 'OFFLINE', '2017-09-30 00:00:00', '2017-09-27 00:00:00');
INSERT INTO `app_boot` VALUES ('4028d86b5e5a638c015e5a7b747d0001', '100', 'xxx', '465d9631-863f-4bf0-bdee-2b17efc34691.jpg', '', 'OFFLINE', '2017-09-28 00:00:00', '2017-09-12 00:00:00');
INSERT INTO `app_boot` VALUES ('4028d86b5e5a7ff3015e5a80b3bf0001', '111', 'sss', '7d46297d-5e0f-480e-99d6-cdf4c8ca7721.png', '', 'OFFLINE', '2017-09-12 00:00:00', '2017-09-05 00:00:00');
INSERT INTO `app_boot` VALUES ('5', '5', '19', '8372ea3b-066c-44ba-babf-e0307ec72c5e.jpg', '', 'OFFLINE', '2017-09-30 00:00:00', '2017-09-27 00:00:00');
INSERT INTO `app_boot` VALUES ('6', '6', '18', '8372ea3b-066c-44ba-babf-e0307ec72c5e.jpg', '', 'OFFLINE', '2017-09-30 00:00:00', '2017-09-27 00:00:00');
INSERT INTO `app_boot` VALUES ('7', '7', '17', '8372ea3b-066c-44ba-babf-e0307ec72c5e.jpg', '', 'OFFLINE', '2017-09-30 00:00:00', '2017-09-27 00:00:00');
INSERT INTO `app_boot` VALUES ('8', '8', '16', '8372ea3b-066c-44ba-babf-e0307ec72c5e.jpg', '', 'OFFLINE', '2017-09-30 00:00:00', '2017-09-27 00:00:00');

-- ----------------------------
-- Table structure for `app_circle`
-- ----------------------------
DROP TABLE IF EXISTS `app_circle`;
CREATE TABLE `app_circle` (
  `id` varchar(255) NOT NULL,
  `circle_id` int(11) default NULL,
  `description` varchar(255) default NULL,
  `logo` varchar(255) default NULL,
  `lord_id` varchar(255) default NULL,
  `state` int(11) default NULL,
  `title` varchar(255) default NULL,
  `circle_class` varchar(255) default NULL,
  `create_name` varchar(255) default NULL,
  `createtime` datetime default NULL,
  `create_time` datetime default NULL,
  `circleclassid` varchar(255) default NULL,
  `topicnum` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_circle
-- ----------------------------
INSERT INTO `app_circle` VALUES ('402882e55f331809015f332a603b000e', '1', '1', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', '测试1', '1', '圈子测试1', null, 'admin', '2017-10-19 13:45:36', null, '402882e55f331809015f3328664d0008', null);
INSERT INTO `app_circle` VALUES ('402882e55f331809015f332ac3c3000f', '2', '2', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', '测试2', '1', '圈子测试2', null, 'admin', '2017-10-19 13:46:02', null, '402882e55f331809015f332887d50009', null);
INSERT INTO `app_circle` VALUES ('402882e55f331809015f332b7fe70010', '3', '234234', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', '圈主1', '1', '圈子测试3', null, 'admin', '2017-10-19 13:46:50', null, '402882e55f331809015f3328664d0008', null);
INSERT INTO `app_circle` VALUES ('402882e55f331809015f332bf0a10011', '4', '4', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', '圈主1', '1', '圈子测试4', null, 'admin', '2017-10-19 13:47:19', null, '402882e55f331809015f3328664d0008', null);

-- ----------------------------
-- Table structure for `app_circle_class`
-- ----------------------------
DROP TABLE IF EXISTS `app_circle_class`;
CREATE TABLE `app_circle_class` (
  `id` varchar(255) NOT NULL,
  `createdate` datetime default NULL,
  `createname` varchar(255) default NULL,
  `serial_num` int(11) default NULL,
  `state_enum` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_circle_class
-- ----------------------------
INSERT INTO `app_circle_class` VALUES ('402882e55f331809015f3328664d0008', '2017-10-19 13:43:27', 'admin', '1', 'NORMAL', '圈子分类测试1');
INSERT INTO `app_circle_class` VALUES ('402882e55f331809015f332887d50009', '2017-10-19 13:43:35', 'admin', '2', 'NORMAL', '圈子分类测试2');
INSERT INTO `app_circle_class` VALUES ('402882e55f331809015f3328ab1f000a', '2017-10-19 13:43:44', 'admin', '3', 'NORMAL', '圈子分类测试3');
INSERT INTO `app_circle_class` VALUES ('402882e55f331809015f3328cce6000b', '2017-10-19 13:43:53', 'admin', '4', 'NORMAL', '圈子分类测试4');
INSERT INTO `app_circle_class` VALUES ('402882e55f331809015f3328ed23000c', '2017-10-19 13:44:01', 'admin', '5', 'NORMAL', '圈子分类测试5');
INSERT INTO `app_circle_class` VALUES ('402882e55f331809015f3329a8e3000d', '2017-10-19 13:44:49', 'admin', '6', 'NORMAL', '圈子分类测试6');

-- ----------------------------
-- Table structure for `app_circle_topic`
-- ----------------------------
DROP TABLE IF EXISTS `app_circle_topic`;
CREATE TABLE `app_circle_topic` (
  `id` varchar(255) NOT NULL,
  `circle_id` int(11) default NULL,
  `class_id` varchar(255) default NULL,
  `examine` int(11) default NULL,
  `home_sort` int(11) default NULL,
  `is_essence` int(11) default NULL,
  `is_generalize` int(11) default NULL,
  `is_stick` int(11) default NULL,
  `praise_num` int(11) default NULL,
  `reply` int(11) default NULL,
  `share` int(11) default NULL,
  `share_copy` varchar(255) default NULL,
  `share_pic` varchar(255) NOT NULL,
  `state` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `user_id` varchar(255) default NULL,
  `createdate` datetime default NULL,
  `topicid` int(11) default NULL,
  `create_date` datetime default NULL,
  `content` text,
  `pics` varchar(255) default NULL,
  `circleeeid` varchar(255) default NULL,
  PRIMARY KEY  (`id`,`share_pic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_circle_topic
-- ----------------------------
INSERT INTO `app_circle_topic` VALUES ('402882e55f331809015f332cd46b0012', '1', '402882e55f331809015f3328664d0008', '0', '5', '1', '1', '1', '0', '20', '0', '话题测试113213213', '73e37eb8-04d2-43d2-acae-2db1b8cb2a40.png', '1', '话题测试1', '121213131', null, '0', '2017-10-19 13:48:17', '话题测试1话题测试1话题测试1话题测试1', null, '402882e55f331809015f332a603b000e');
INSERT INTO `app_circle_topic` VALUES ('402882e55f331809015f332dddda0013', '2', '402882e55f331809015f3328664d0008', '0', '2', '1', '1', '1', '0', '0', '0', '话题测试2', '73e37eb8-04d2-43d2-acae-2db1b8cb2a40.png', '1', '话题测试2', '3134454', null, '0', '2017-10-19 13:49:25', '话题测试2话题测试2话题测试2话题测试2话题测试2话题测试2', null, '402882e55f331809015f332a603b000e');
INSERT INTO `app_circle_topic` VALUES ('402882f45f34c181015f34c629aa0000', '1', null, '0', '0', '-1', '-1', '-1', '0', '32', '0', 'owow', '', '1', 'owow', '402881ef5ea8c2bd015ea8dfdde80001', null, '0', '2017-10-19 21:15:23', '<p>kwkw<br/></p>', null, '402882e55f331809015f332a603b000e');
INSERT INTO `app_circle_topic` VALUES ('402882f45f34c181015f34c7835d0001', '1', null, '0', '0', '-1', '-1', '-1', '0', '0', '0', 'aaa', '', '1', 'aaa', '402881ef5ea8c2bd015ea8dfdde80001', null, '0', '2017-10-19 21:16:51', '<p>aaa</p>', null, '402882e55f331809015f332a603b000e');
INSERT INTO `app_circle_topic` VALUES ('402882f45f3790e5015f37a8390c0001', '1', null, '0', '0', '-1', '-1', '-1', '0', '0', '0', 'Ces ', '', '1', 'Ces ', '402881ef5ea8c2bd015ea8dfdde80001', null, '0', '2017-10-20 10:41:32', '<p>Hjjk nxnxjjx jjxnxjx hxjxjxjxhjxjxj hxjjxxjjx&nbsp;</p>', null, '402882e55f331809015f332a603b000e');

-- ----------------------------
-- Table structure for `app_column`
-- ----------------------------
DROP TABLE IF EXISTS `app_column`;
CREATE TABLE `app_column` (
  `id` varchar(255) NOT NULL COMMENT '栏目主键',
  `parent_column_id` int(255) default NULL COMMENT '父级栏目(上级栏目id)',
  `parent_column_name` varchar(255) default NULL COMMENT '父级栏目(上级栏目名称)',
  `column_name` varchar(255) default NULL COMMENT '栏目名称',
  `column_short_name` varchar(255) default NULL COMMENT '栏目简称',
  `column_ico` varchar(255) default NULL COMMENT '栏目图标',
  `article_num` int(20) default NULL COMMENT '文章数量',
  `sort_no` int(4) default NULL COMMENT '排序号',
  `state` varchar(2) default NULL COMMENT '状态(0:正常,1:下线)',
  `column_id` int(11) NOT NULL,
  `columnbanner` varchar(255) default NULL,
  `descripiton` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of app_column
-- ----------------------------
INSERT INTO `app_column` VALUES ('402882e45f46f2f6015f471a35a80001', '0', null, '白水', '白水', '', '0', '20', '1', '12', '', '白水');
INSERT INTO `app_column` VALUES ('402882e45f4880bc015f488d39c10001', '0', null, '123', '123', '', '0', '123', '0', '13', '', '123');
INSERT INTO `app_column` VALUES ('402882e55f331809015f331ca4410001', '0', null, '栏目测试1', '栏目测试1', '73e37eb8-04d2-43d2-acae-2db1b8cb2a40.png', '0', '11', '1', '11', '', '栏目测试11');
INSERT INTO `app_column` VALUES ('aaa1', '0', '无', '瘦身运动馆', '瘦身运动全解读', '19b10263-86e4-4506-98dc-1504e52b4a21.png', '1000', '1', '1', '1', '', '栏目测试1');
INSERT INTO `app_column` VALUES ('aaa10', '0', '无', '生活小百科', '健康百科全书', 'de509495-ef4e-4776-890e-abe71052b6b5.png', '900', '10', '1', '10', '', '栏目测试10');
INSERT INTO `app_column` VALUES ('aaa2', '0', '无', '谣言粉碎机', '健康谣言终结站', '255d945e-6f11-4773-bc58-cfebcf31abee.png', '100', '2', '1', '2', '', '栏目测试2');
INSERT INTO `app_column` VALUES ('aaa3', '0', '无', '关爱夕阳红', '关爱老人健康从这开始', '4de289b7-a488-4ea0-b50d-24c11bd5134c.jpg', '200', '3', '1', '3', '', '栏目测试3');
INSERT INTO `app_column` VALUES ('aaa4', '0', '无', '慢性病管理', '提高健康素养', '591039ab-75a4-4d19-92bb-1071ee433c63.png', '300', '4', '1', '4', '', '栏目测试4');
INSERT INTO `app_column` VALUES ('aaa5', '0', '无', '急救医药箱', '急救常识关键时刻能救命', '6c1c5eee-616a-4146-80f5-ee72e58ea3b1.jpg', '400', '5', '1', '5', '', '栏目测试5');
INSERT INTO `app_column` VALUES ('aaa6', '0', '无', '育儿研究所', '育儿教育健康知识大全', '77cc1378-82fd-4207-8089-3de9d693d2d6.png', '500', '6', '1', '6', '', '栏目测试6');
INSERT INTO `app_column` VALUES ('aaa7', '0', '无', '季节话养生', '顺应节气养生益寿延年', 'fc8bcd97-4b68-4ffc-8924-a63991f6de67.png', '600', '7', '1', '7', '', '栏目测7');
INSERT INTO `app_column` VALUES ('aaa8', '0', '无', '两性健康宝典', '两性健康的小秘密', 'd59f6fd6-4752-4f5b-be80-2854a8799e5d.png', '700', '8', '1', '8', '', '栏目测试8');
INSERT INTO `app_column` VALUES ('aaa9', '0', '无', '女性私房话', '属于女性的健康悄悄话', '73e37eb8-04d2-43d2-acae-2db1b8cb2a40.png', '800', '9', '1', '9', '', '栏目测试9');

-- ----------------------------
-- Table structure for `app_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `app_feedback`;
CREATE TABLE `app_feedback` (
  `id` varchar(255) NOT NULL,
  `backdate` datetime default NULL,
  `description` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `userid` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_feedback
-- ----------------------------
INSERT INTO `app_feedback` VALUES ('402882f45f0a86eb015f0aa18f030004', '2017-10-11 16:51:21', '123123', '123123', '账号找回', 'ff8080815e74b3f7015e74b508d70001');
INSERT INTO `app_feedback` VALUES ('402882f45f0a86eb015f0aa248a10005', '2017-10-11 16:52:08', '', '', '请选择问题类型', 'ff8080815e74b3f7015e74b508d70001');
INSERT INTO `app_feedback` VALUES ('402882f45f0a86eb015f0aa2506e0006', '2017-10-11 16:52:10', '', '', '请选择问题类型', 'ff8080815e74b3f7015e74b508d70001');
INSERT INTO `app_feedback` VALUES ('402882f45f0a86eb015f0aa256280007', '2017-10-11 16:52:12', '', '', '请选择问题类型', 'ff8080815e74b3f7015e74b508d70001');
INSERT INTO `app_feedback` VALUES ('402882f45f0a86eb015f0aa8b93c0008', '2017-10-11 16:59:11', '123123', '123123', '账号找回', 'ff8080815e74b3f7015e74b508d70001');
INSERT INTO `app_feedback` VALUES ('402882f45f0a86eb015f0aa8bbcb0009', '2017-10-11 16:59:11', '123123', '123123', '账号找回', 'ff8080815e74b3f7015e74b508d70001');
INSERT INTO `app_feedback` VALUES ('402882f45f0a86eb015f0aa8bd90000a', '2017-10-11 16:59:12', '123123', '123123', '账号找回', 'ff8080815e74b3f7015e74b508d70001');
INSERT INTO `app_feedback` VALUES ('402882f45f0a86eb015f0aa8be7a000b', '2017-10-11 16:59:12', '123123', '123123', '账号找回', 'ff8080815e74b3f7015e74b508d70001');
INSERT INTO `app_feedback` VALUES ('402882f45f0a86eb015f0ab04987000c', '2017-10-11 17:07:26', '', '', '请选择问题类型', 'ff8080815e74b3f7015e74b508d70001');
INSERT INTO `app_feedback` VALUES ('402882f45f0a86eb015f0ab06428000d', '2017-10-11 17:07:33', '', '', '请选择问题类型', 'ff8080815e74b3f7015e74b508d70001');

-- ----------------------------
-- Table structure for `app_help`
-- ----------------------------
DROP TABLE IF EXISTS `app_help`;
CREATE TABLE `app_help` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `question` varchar(255) default NULL COMMENT '问题名称',
  `answer` varchar(255) default NULL COMMENT '答案',
  `create_date` datetime default NULL COMMENT '创建时间',
  `state` varchar(2) default NULL COMMENT '状态',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题帮助表';

-- ----------------------------
-- Records of app_help
-- ----------------------------
INSERT INTO `app_help` VALUES ('1', '如何注册帐号？', '您需要打开妙健康APP', null, null);
INSERT INTO `app_help` VALUES ('402881025e99d9e1015e99dc702c0001', '问题3', '问题3', null, null);
INSERT INTO `app_help` VALUES ('402881025e99e0af015e99e1795f0001', '问题3', '		            		', '2017-09-19 20:48:18', '0');
INSERT INTO `app_help` VALUES ('402881025e99e8c8015e99ec328a0001', '问题4', '		            		', '2017-09-19 20:48:26', '0');
INSERT INTO `app_help` VALUES ('402881025e99e8c8015e99f3f2470002', '问题4', '		            		', '2017-09-19 20:48:32', '0');
INSERT INTO `app_help` VALUES ('8f8e8f635e99907c015e99912ded0001', '问题1', '答案1', null, null);
INSERT INTO `app_help` VALUES ('8f8e8f635e99907c015e99927ef70002', '问题2', '答案2', null, null);

-- ----------------------------
-- Table structure for `app_homelocation`
-- ----------------------------
DROP TABLE IF EXISTS `app_homelocation`;
CREATE TABLE `app_homelocation` (
  `id` varchar(255) NOT NULL,
  `article_name` varchar(255) default NULL,
  `classify` varchar(255) default NULL,
  `location_id` int(11) NOT NULL,
  `location_no` int(11) NOT NULL,
  `location_picture` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_homelocation
-- ----------------------------
INSERT INTO `app_homelocation` VALUES ('1', '听听音乐！放松一下！', '0', '3', '2', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', null);
INSERT INTO `app_homelocation` VALUES ('2', '一张有态度的照片！', '0', '5', '1', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', null);
INSERT INTO `app_homelocation` VALUES ('3', '健康宝典623', '0', '4', '3', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', null);
INSERT INTO `app_homelocation` VALUES ('4', '健康宝典3232', '0', '2', '4', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', null);
INSERT INTO `app_homelocation` VALUES ('5', '565', '0', '1', '5', '107f2397-c4b8-4e19-967a-70b555e78b4b.png', null);

-- ----------------------------
-- Table structure for `app_information`
-- ----------------------------
DROP TABLE IF EXISTS `app_information`;
CREATE TABLE `app_information` (
  `id` varchar(255) NOT NULL,
  `createdate` datetime default NULL,
  `information_target_enum` varchar(255) default NULL,
  `information_type_enum` varchar(255) default NULL,
  `informationcontent` varchar(255) default NULL,
  `pushdate` datetime default NULL,
  `state` varchar(255) default NULL,
  `theme` varchar(255) default NULL,
  `userinf` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  `read_users` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_information
-- ----------------------------
INSERT INTO `app_information` VALUES ('402881095e995317015e9953aee00001', null, 'USER', 'SYSTEM_INF', '1', null, null, '1', '1', null, null, null);
INSERT INTO `app_information` VALUES ('402881095e99570b015e9957aea20001', null, 'USER', 'SYSTEM_INF', '1', null, null, '1', '1', null, null, null);
INSERT INTO `app_information` VALUES ('402881095e995976015e995a07460001', null, 'USER', 'SYSTEM_INF', '1', null, null, '1', '1', null, null, null);
INSERT INTO `app_information` VALUES ('402881095e995976015e995ad31f0002', null, 'USER', 'SYSTEM_INF', '4', null, null, '2', '3', null, null, null);

-- ----------------------------
-- Table structure for `app_informlocation`
-- ----------------------------
DROP TABLE IF EXISTS `app_informlocation`;
CREATE TABLE `app_informlocation` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime default NULL,
  `inform_id` int(11) default NULL,
  `location` varchar(255) default NULL,
  `sort` int(11) default NULL,
  `state` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_informlocation
-- ----------------------------
INSERT INTO `app_informlocation` VALUES ('1', '2017-09-29 13:38:25', '12', '12', '1', '1', '1');

-- ----------------------------
-- Table structure for `app_key`
-- ----------------------------
DROP TABLE IF EXISTS `app_key`;
CREATE TABLE `app_key` (
  `id` varchar(255) NOT NULL,
  `sort_no` varchar(10) default NULL COMMENT '位置序号',
  `type` varchar(10) default NULL COMMENT '类型',
  `key` varchar(500) default NULL COMMENT '关键词',
  `update_date` datetime default NULL COMMENT '更新时间',
  `device_sn` varchar(50) default NULL COMMENT '设备SN码',
  `description` varchar(255) default NULL,
  `keyes` varchar(255) default NULL,
  `types` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关键词配置表';

-- ----------------------------
-- Records of app_key
-- ----------------------------

-- ----------------------------
-- Table structure for `app_location_home`
-- ----------------------------
DROP TABLE IF EXISTS `app_location_home`;
CREATE TABLE `app_location_home` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `classify` varchar(50) default NULL COMMENT '分类',
  `location_id` varchar(50) default NULL COMMENT 'ID',
  `location_no` tinyint(2) default NULL COMMENT '位置序号',
  `article_name` varchar(100) default NULL COMMENT '文章名称',
  `location_picture` varchar(200) default NULL COMMENT '图片路径',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页资讯位置管理';

-- ----------------------------
-- Records of app_location_home
-- ----------------------------
INSERT INTO `app_location_home` VALUES ('1', '文章', '111', '1', '听听音乐！放松一下！', 'http://221.226.9.50:8081/4648e643-c9cb-4ebe-8651-d12782f40370.png');
INSERT INTO `app_location_home` VALUES ('2', '文章', '222', '2', '一张有态度的照片', 'http://221.226.9.50:8081/c7eeafdc-9483-462f-9ba5-fe7f8186f6e7.png');
INSERT INTO `app_location_home` VALUES ('3', '文章', '333', '3', '健康宝典623', 'http://221.226.9.50:8081/04648e6e-033a-4742-8094-43192e133900.jpg');
INSERT INTO `app_location_home` VALUES ('4', '文章', '444', '4', '健康宝典3232', '');
INSERT INTO `app_location_home` VALUES ('5', '5', '555', '5', '5', null);

-- ----------------------------
-- Table structure for `app_location_inform`
-- ----------------------------
DROP TABLE IF EXISTS `app_location_inform`;
CREATE TABLE `app_location_inform` (
  `id` varchar(255) NOT NULL,
  `location` varchar(255) default NULL COMMENT '资讯位置',
  `inform_id` varchar(20) default NULL COMMENT '资讯id',
  `title` varchar(500) default NULL COMMENT '标题',
  `create_time` datetime default NULL COMMENT '添加时间',
  `sort` tinyint(2) default NULL COMMENT '排序',
  `state` varchar(10) default NULL COMMENT '状态',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_location_inform
-- ----------------------------

-- ----------------------------
-- Table structure for `app_push`
-- ----------------------------
DROP TABLE IF EXISTS `app_push`;
CREATE TABLE `app_push` (
  `id` varchar(255) NOT NULL,
  `add_adress` varchar(255) default NULL,
  `content` varchar(255) default NULL,
  `countsend` int(11) default NULL,
  `countsucc` int(11) default NULL,
  `createdate` datetime default NULL,
  `icon` varchar(255) default NULL,
  `result` varchar(255) default NULL,
  `sound` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `updatedate` datetime default NULL,
  `push_enum` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_push
-- ----------------------------

-- ----------------------------
-- Table structure for `app_report`
-- ----------------------------
DROP TABLE IF EXISTS `app_report`;
CREATE TABLE `app_report` (
  `id` varchar(255) NOT NULL,
  `num` varchar(255) default NULL,
  `reason` varchar(255) default NULL,
  `reporttime` datetime default NULL,
  `state` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_report
-- ----------------------------

-- ----------------------------
-- Table structure for `app_report_detal`
-- ----------------------------
DROP TABLE IF EXISTS `app_report_detal`;
CREATE TABLE `app_report_detal` (
  `id` varchar(255) NOT NULL,
  `state` int(11) NOT NULL,
  `createdate` datetime default NULL,
  `reason` varchar(255) default NULL,
  `targetid` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `userid` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_report_detal
-- ----------------------------

-- ----------------------------
-- Table structure for `app_sensitive_word`
-- ----------------------------
DROP TABLE IF EXISTS `app_sensitive_word`;
CREATE TABLE `app_sensitive_word` (
  `id` varchar(255) NOT NULL,
  `type` varchar(255) default NULL,
  `updatetime` datetime default NULL,
  `word` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_sensitive_word
-- ----------------------------
INSERT INTO `app_sensitive_word` VALUES ('1', '1', '2017-10-10 17:18:29', '台独');
INSERT INTO `app_sensitive_word` VALUES ('2', '1', '2017-10-14 20:31:37', '港独');

-- ----------------------------
-- Table structure for `chunyu_problem`
-- ----------------------------
DROP TABLE IF EXISTS `chunyu_problem`;
CREATE TABLE `chunyu_problem` (
  `id` int(11) NOT NULL auto_increment,
  `add_time` datetime default NULL,
  `age` int(11) default NULL,
  `appid` varchar(255) default NULL,
  `audio` varchar(255) default NULL,
  `clinic_name` varchar(255) default NULL,
  `clinic_no` int(11) default NULL,
  `close_msg` varchar(255) default NULL,
  `close_time` datetime default NULL,
  `content` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `old` varchar(255) default NULL,
  `patient_id` int(11) default NULL,
  `patient_type` int(11) default NULL,
  `problem_id` varchar(255) default NULL,
  `profile_id` varchar(255) default NULL,
  `sex` int(11) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chunyu_problem
-- ----------------------------

-- ----------------------------
-- Table structure for `chunyu_reply`
-- ----------------------------
DROP TABLE IF EXISTS `chunyu_reply`;
CREATE TABLE `chunyu_reply` (
  `id` varchar(255) NOT NULL,
  `atime` bigint(20) default NULL,
  `content` varchar(255) default NULL,
  `doctor_id` varchar(255) default NULL,
  `problem_id` int(11) default NULL,
  `profile_id` varchar(255) default NULL,
  `reply_type` int(11) NOT NULL default '1',
  `sign` varchar(255) default NULL,
  `state` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chunyu_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `device_cata`
-- ----------------------------
DROP TABLE IF EXISTS `device_cata`;
CREATE TABLE `device_cata` (
  `id` varchar(255) NOT NULL,
  `cata_logo` varchar(255) default NULL,
  `create_date` datetime default NULL,
  `description` varchar(255) default NULL,
  `device_cata_name` varchar(255) default NULL,
  `is_del` varchar(255) default NULL,
  `sort_no` int(11) default NULL,
  `type_code` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_cata
-- ----------------------------

-- ----------------------------
-- Table structure for `device_manager`
-- ----------------------------
DROP TABLE IF EXISTS `device_manager`;
CREATE TABLE `device_manager` (
  `id` varchar(255) NOT NULL,
  `accredit_type` varchar(255) default NULL,
  `binging_img` varchar(255) default NULL,
  `commodity_no` varchar(255) default NULL,
  `connect_type` varchar(255) default NULL,
  `create_date` datetime default NULL,
  `description` varchar(255) default NULL,
  `device_cata_id` varchar(255) default NULL,
  `device_code` varchar(255) default NULL,
  `device_logo` varchar(255) default NULL,
  `device_name` varchar(255) default NULL,
  `device_no` varchar(255) default NULL,
  `function_type` varchar(255) default NULL,
  `function_type_des` varchar(255) default NULL,
  `is_recommend` varchar(255) default NULL,
  `link_type` varchar(255) default NULL,
  `sort_no` int(11) default NULL,
  `state` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_manager
-- ----------------------------

-- ----------------------------
-- Table structure for `device_source`
-- ----------------------------
DROP TABLE IF EXISTS `device_source`;
CREATE TABLE `device_source` (
  `id` varchar(255) NOT NULL,
  `accredit_type` varchar(255) default NULL,
  `connection_type` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `description_url` varchar(255) default NULL,
  `device_code` varchar(255) default NULL,
  `device_logo` varchar(255) default NULL,
  `device_name` varchar(255) default NULL,
  `device_no` varchar(255) default NULL,
  `function_type` varchar(255) default NULL,
  `function_type_des` varchar(255) default NULL,
  `link_type` varchar(255) default NULL,
  `type_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_source
-- ----------------------------

-- ----------------------------
-- Table structure for `ha_assessment`
-- ----------------------------
DROP TABLE IF EXISTS `ha_assessment`;
CREATE TABLE `ha_assessment` (
  `id` varchar(255) collate utf8_bin NOT NULL,
  `assessment_name` varchar(255) collate utf8_bin default NULL,
  `assessment_code` varchar(255) collate utf8_bin default NULL,
  `assessment_pic` varchar(255) collate utf8_bin default NULL,
  `short_description` varchar(255) collate utf8_bin default NULL,
  `assessment_question_url` varchar(255) collate utf8_bin default NULL,
  `description` varchar(255) collate utf8_bin default NULL,
  `sex` int(11) NOT NULL,
  `source` varchar(255) collate utf8_bin default NULL,
  `type` int(11) NOT NULL,
  `first_question_code` varchar(255) collate utf8_bin default NULL,
  `question_num` int(11) NOT NULL,
  `create_time` datetime default NULL,
  `shop_code` varchar(255) collate utf8_bin default NULL,
  `state` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ha_assessment
-- ----------------------------
INSERT INTO `ha_assessment` VALUES ('1', '家庭史', '1', '家族史.png', '家族史', null, '家庭史', '3', null, '3', '1', '2', '2017-09-19 17:16:30', null, null);
INSERT INTO `ha_assessment` VALUES ('2', '疾病史', '2', '疾病史.png', '疾病史', null, '疾病史', '3', null, '3', '1', '2', '2017-09-19 17:16:30', null, null);
INSERT INTO `ha_assessment` VALUES ('3', '过敏史', '3', '过敏史.png', '过敏史', null, '过敏史', '3', null, '3', '1', '2', '2017-09-19 17:16:30', null, null);
INSERT INTO `ha_assessment` VALUES ('4', '用药史', '4', '用药史.png', '用药史', null, '用药史', '3', null, '3', '1', '2', '2017-09-19 17:16:30', null, null);
INSERT INTO `ha_assessment` VALUES ('5', '手术史', '5', '手术史.png', '手术史', null, '手术史', '3', null, '3', '1', '2', '2017-09-19 17:16:30', null, null);
INSERT INTO `ha_assessment` VALUES ('6', '月经生育史', '6', '月经生育史.png', '月经生育史', null, '月经生育史', '3', null, '3', '1', '2', '2017-09-19 17:16:30', null, null);
INSERT INTO `ha_assessment` VALUES ('7', '吸烟史', '7', '吸烟史.png', '吸烟史', null, '吸烟史', '3', null, '3', '1', '2', '2017-09-19 17:16:30', null, null);
INSERT INTO `ha_assessment` VALUES ('8', '饮酒史', '8', '饮酒史.png', '饮酒史', null, '饮酒史', '3', null, '3', '1', '2', '2017-09-19 17:16:30', null, null);

-- ----------------------------
-- Table structure for `ha_assessment_question`
-- ----------------------------
DROP TABLE IF EXISTS `ha_assessment_question`;
CREATE TABLE `ha_assessment_question` (
  `id` varchar(255) collate utf8_bin NOT NULL,
  `assessment_id` varchar(255) collate utf8_bin default NULL,
  `question_id` varchar(255) collate utf8_bin default NULL,
  `sort` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_a1ut9q0aa0c4p6sifq26hh3j5` (`question_id`),
  CONSTRAINT `FKl57bqw5ubshw4hh8rwv71q48n` FOREIGN KEY (`question_id`) REFERENCES `ha_question` (`id`),
  CONSTRAINT `FK_a1ut9q0aa0c4p6sifq26hh3j5` FOREIGN KEY (`question_id`) REFERENCES `ha_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ha_assessment_question
-- ----------------------------
INSERT INTO `ha_assessment_question` VALUES ('1', '1', '1', '1', '1');
INSERT INTO `ha_assessment_question` VALUES ('2', '1', '2', '2', '1');

-- ----------------------------
-- Table structure for `ha_option`
-- ----------------------------
DROP TABLE IF EXISTS `ha_option`;
CREATE TABLE `ha_option` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime default NULL,
  `description` varchar(255) default NULL,
  `option_code` varchar(255) default NULL,
  `option_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ha_option
-- ----------------------------

-- ----------------------------
-- Table structure for `ha_question`
-- ----------------------------
DROP TABLE IF EXISTS `ha_question`;
CREATE TABLE `ha_question` (
  `id` varchar(255) collate utf8_bin NOT NULL,
  `answer_type` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `create_time` datetime default NULL,
  `description` varchar(255) collate utf8_bin NOT NULL,
  `pid` varchar(255) collate utf8_bin default NULL,
  `question_code` varchar(255) collate utf8_bin default NULL,
  `question_name` varchar(255) collate utf8_bin default NULL,
  `question_type` int(11) NOT NULL,
  `sort_no` varchar(255) collate utf8_bin default NULL,
  `state` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ha_question
-- ----------------------------
INSERT INTO `ha_question` VALUES ('1', '1', '2', '2017-09-19 18:25:25', '是否有遗传糖尿病？', null, '11', '是否有遗传糖尿病', '1', null, null);
INSERT INTO `ha_question` VALUES ('2', '1', '2', '2017-09-19 18:25:25', '是否有心脏病？', null, '11', '是否有心脏病？', '1', null, null);

-- ----------------------------
-- Table structure for `ha_question_option`
-- ----------------------------
DROP TABLE IF EXISTS `ha_question_option`;
CREATE TABLE `ha_question_option` (
  `id` varchar(255) NOT NULL,
  `to_question_code` varchar(255) default NULL,
  `question_id` varchar(255) default NULL,
  `score` double NOT NULL,
  `option_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKefr6ags0vnwc6n540f9wx41uu` (`option_id`),
  CONSTRAINT `FKefr6ags0vnwc6n540f9wx41uu` FOREIGN KEY (`option_id`) REFERENCES `ha_option` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ha_question_option
-- ----------------------------

-- ----------------------------
-- Table structure for `ha_usr_answer`
-- ----------------------------
DROP TABLE IF EXISTS `ha_usr_answer`;
CREATE TABLE `ha_usr_answer` (
  `id` varchar(255) NOT NULL,
  `user_assessment_id` varchar(255) default NULL,
  `answer` varchar(255) default NULL,
  `assessment_id` varchar(255) default NULL,
  `option_id` varchar(255) default NULL,
  `profile_id` varchar(255) default NULL,
  `question_code` varchar(255) default NULL,
  `question_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ha_usr_answer
-- ----------------------------

-- ----------------------------
-- Table structure for `ha_usr_answer_history`
-- ----------------------------
DROP TABLE IF EXISTS `ha_usr_answer_history`;
CREATE TABLE `ha_usr_answer_history` (
  `id` varchar(255) NOT NULL,
  `answer` varchar(255) default NULL,
  `assessment_id` varchar(255) default NULL,
  `option_id` varchar(255) default NULL,
  `profile_id` varchar(255) default NULL,
  `question_code` varchar(255) default NULL,
  `question_id` varchar(255) default NULL,
  `usr_assessment_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ha_usr_answer_history
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_blood_glucose_base`
-- ----------------------------
DROP TABLE IF EXISTS `hd_blood_glucose_base`;
CREATE TABLE `hd_blood_glucose_base` (
  `id` bigint(20) NOT NULL,
  `period` int(11) default NULL COMMENT '时间段：1,"早餐前" 2,"早餐后" 3,"午餐前"4,"午餐后"5,"晚餐前"6,"晚餐后"7,"睡前"',
  `glocuse_level` int(11) default NULL COMMENT '血糖等级： -2:"高危",-1:"偏低", 0:"正常",1:"临界值",  2:"轻度",3:"中度",4:"重度",  ',
  `low` decimal(10,1) default NULL COMMENT '低值界点',
  `high` decimal(10,1) default NULL COMMENT '高值界点',
  `level_name` varchar(20) default NULL COMMENT '血糖名称',
  `glocuse_explain` varchar(200) default NULL COMMENT '血糖解读规则',
  `risk_assess` varchar(600) default NULL COMMENT '血糖风险评估',
  `meal_advise` varchar(10000) default NULL COMMENT '饮食规则',
  `sport_step` int(11) default NULL COMMENT '运动步数',
  `sport_tip` varchar(150) default NULL COMMENT '运动提示',
  `duration_times` varchar(20) default NULL COMMENT '测量次数',
  `duration_times_tip` varchar(150) default NULL COMMENT '测量次数相关提示语',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='血糖参考值表';

-- ----------------------------
-- Records of hd_blood_glucose_base
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_blood_glucose_record`
-- ----------------------------
DROP TABLE IF EXISTS `hd_blood_glucose_record`;
CREATE TABLE `hd_blood_glucose_record` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `appid` bigint(20) NOT NULL COMMENT '应用标识',
  `device_sn` varchar(50) default NULL COMMENT '设备SN号',
  `device_no` varchar(50) default NULL COMMENT '设备编号（内部）',
  `profile_id` bigint(20) default NULL COMMENT '用户ID',
  `glucose_value` float default NULL COMMENT '血糖值',
  `level` tinyint(4) default '0' COMMENT '血糖等级(-2 高危  -1 偏低 0 正常 1 临界值 2 轻度 3 中度 4 重度)',
  `measure_time` date NOT NULL COMMENT '测量时间',
  `part_of_day` int(11) default NULL COMMENT '测量时间段',
  `create_time` datetime default NULL COMMENT '数据创建时间',
  `data_source` varchar(50) default NULL COMMENT '数据来源：-2手动上传 -1手机上传 1-37血压 2-康康血压  3-汉优温度计 4-光聚通讯动态体温计 5-E伴行为监测仪 6-糖护士 7-vilidic',
  `display` int(11) default '1' COMMENT '是否显示数据（1-显示 2-不显示）',
  `accountnum` int(11) default NULL,
  PRIMARY KEY  (`id`,`measure_time`),
  UNIQUE KEY `uniq` (`appid`,`device_sn`,`device_no`,`profile_id`,`measure_time`),
  KEY `IDX_device_sn` (`device_sn`),
  KEY `IDX_profile_id` (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='血糖明细记录表';

-- ----------------------------
-- Records of hd_blood_glucose_record
-- ----------------------------
INSERT INTO `hd_blood_glucose_record` VALUES ('1', '1', '1', '1', '1', '1', '1', '2017-08-21', '1', '2017-08-21 20:16:36', '1', '1', null);

-- ----------------------------
-- Table structure for `hd_blood_pressure_guide`
-- ----------------------------
DROP TABLE IF EXISTS `hd_blood_pressure_guide`;
CREATE TABLE `hd_blood_pressure_guide` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `title` varchar(50) default NULL COMMENT '标题',
  `tip` varchar(255) default NULL COMMENT '血压描述',
  `content` varchar(20000) default NULL COMMENT '血压指导详细信息',
  `iconfile` varchar(50) default NULL COMMENT '图标',
  `update_time` bigint(20) default NULL COMMENT '变更时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='血压指导表';

-- ----------------------------
-- Records of hd_blood_pressure_guide
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_blood_pressure_record`
-- ----------------------------
DROP TABLE IF EXISTS `hd_blood_pressure_record`;
CREATE TABLE `hd_blood_pressure_record` (
  `id` varchar(255) NOT NULL,
  `appid` varchar(255) NOT NULL,
  `device_sn` varchar(50) default NULL,
  `device_no` varchar(50) default NULL,
  `profile_id` varchar(255) default NULL,
  `high_press` int(11) default NULL,
  `low_press` int(11) default NULL,
  `avg_press_value` int(11) default NULL,
  `heart_rate` int(11) default NULL,
  `heart_rate_level` int(11) default NULL,
  `blood_press_level` int(11) default NULL,
  `blood_press_trend` int(11) default NULL,
  `create_time` datetime default NULL,
  `data_source` varchar(50) default NULL,
  `part_of_day` varchar(10) default NULL,
  `isdel` int(11) default NULL,
  `display` int(11) default NULL,
  `measure_time` datetime default NULL,
  `accountnum` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_blood_pressure_record
-- ----------------------------
INSERT INTO `hd_blood_pressure_record` VALUES ('1', '1', '11', '1', '1', '1', '1', '1', '1', '2', '2', '2', '2017-08-22 11:33:28', '1', '1', '0', '1', '2017-08-21 00:00:00', null);

-- ----------------------------
-- Table structure for `hd_blood_pressure_report`
-- ----------------------------
DROP TABLE IF EXISTS `hd_blood_pressure_report`;
CREATE TABLE `hd_blood_pressure_report` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `appid` bigint(20) NOT NULL COMMENT '应用标识',
  `device_sn` varchar(50) default NULL COMMENT '设备SN号',
  `device_no` varchar(50) default NULL COMMENT '设备编号（内部）',
  `profile_id` bigint(20) default NULL COMMENT '用户ID',
  `title` varchar(50) default NULL COMMENT '报告名称',
  `report_list_id` bigint(20) default NULL COMMENT '对应的报告列表ID',
  `type` tinyint(4) default '1' COMMENT '报表类型 1 周报 2 月报 3 自定义报表',
  `total_count` int(11) default '0' COMMENT '血压测量总次数',
  `level` varchar(20) default NULL COMMENT '血压等级，值为（低血压，正常，正常高，轻度高血压，中度高血压，重度高血压）',
  `level_count` varchar(20) default NULL COMMENT '每个血压等级的测量次数，"0_2_6_3_0_0"依次为等级1-6的测量次数',
  `level_desc` varchar(500) default NULL COMMENT '当前报告的血压等级综合描述',
  `begin_time` bigint(20) default NULL COMMENT '报告开始时间',
  `end_time` bigint(20) default NULL COMMENT '报告结束时间',
  `blood_press_differ_desc` varchar(500) default NULL COMMENT '脉压差状态描述',
  `part_of_day_avg_high` varchar(20) default NULL COMMENT '各时间段高血压平均值，依次为早上、白天、夜间、整天',
  `part_of_day_avg_low` varchar(20) default NULL COMMENT '各时间段低血压平均值，依次为早上、白天、夜间、整天',
  `part_of_day_count` varchar(20) default NULL COMMENT '各个时间段血压的测量次数，依次为早上、中午、下午、傍晚、晚上、夜间',
  `high_blood_high` varchar(20) default NULL COMMENT '收缩压最高值',
  `high_blood_low` varchar(20) default NULL COMMENT '收缩压最低值',
  `low_blood_high` varchar(20) default NULL COMMENT '舒张压最高值',
  `low_blood_low` varchar(20) default NULL COMMENT '舒张压最低值',
  `avg_high` varchar(20) default NULL COMMENT '收缩压平均值',
  `avg_low` varchar(20) default NULL COMMENT '舒张压平均值',
  `blood_pressure_data` varchar(20000) default NULL,
  `create_time` bigint(20) default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='血压报表';

-- ----------------------------
-- Records of hd_blood_pressure_report
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_blood_pressure_report_list`
-- ----------------------------
DROP TABLE IF EXISTS `hd_blood_pressure_report_list`;
CREATE TABLE `hd_blood_pressure_report_list` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `profile_id` bigint(20) default NULL COMMENT '用户ID',
  `appid` bigint(20) default NULL COMMENT '应用标识',
  `type` tinyint(4) default NULL COMMENT '报表类型 1 周报 2 月报 3 自定义报表',
  `begin_time` bigint(20) default NULL COMMENT '报告开始时间',
  `end_time` bigint(20) default NULL COMMENT '报告结束时间',
  `create_time` bigint(20) default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='血压报表列表';

-- ----------------------------
-- Records of hd_blood_pressure_report_list
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_blood_value_base`
-- ----------------------------
DROP TABLE IF EXISTS `hd_blood_value_base`;
CREATE TABLE `hd_blood_value_base` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT '主键ID',
  `level` int(11) default '0' COMMENT '血压级别程度',
  `low_blood_low` int(11) default NULL COMMENT '低压低值',
  `low_blood_high` int(11) default NULL COMMENT '低压高值',
  `high_blood_low` int(11) default NULL COMMENT '高压低值',
  `high_blood_high` int(11) default NULL COMMENT '高压高值',
  `name` varchar(10) default NULL,
  `weight` int(11) default NULL,
  `step` int(11) default NULL,
  `sleep` int(11) default NULL,
  `measure_times` varchar(20) default NULL,
  `see_doctor_times` varchar(20) default NULL,
  `tip` varchar(200) default NULL COMMENT '提示语',
  `propose_desc` varchar(2000) default NULL COMMENT '建议',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='血压值基础表';

-- ----------------------------
-- Records of hd_blood_value_base
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_device`
-- ----------------------------
DROP TABLE IF EXISTS `hd_device`;
CREATE TABLE `hd_device` (
  `device_sn` varchar(50) NOT NULL COMMENT '主键',
  `device_type` varchar(10) default NULL COMMENT '(1:血压计,2:血糖仪,3:老人,4:智能手环)',
  `device_code` varchar(20) default NULL,
  `connect_type` int(2) default NULL COMMENT '1 蓝牙连接 2 sim卡连接  3auth2',
  `device_name` varchar(50) default NULL COMMENT '设备名称',
  `device_des` varchar(100) default NULL COMMENT '设备描述',
  `appids` varchar(10) default NULL COMMENT ' 支持的app(用“,”分隔)',
  `app_release_no` varchar(50) default NULL COMMENT '支持的版本号',
  `bind_num` tinyint(4) default '0' COMMENT '1 只可以绑定一人  2 可以绑定多人',
  `tag` varchar(100) default NULL COMMENT '设备标签',
  `memo` varchar(40) default NULL COMMENT '{appid:commodity_sn}commodity_sn商品id',
  `type_id` int(11) default NULL COMMENT '所属设备类型ID',
  `logo` varchar(400) default NULL COMMENT '设备logo',
  `functional_type` int(11) default NULL COMMENT '设备功能类型：1-运动 2-睡眠 4-血压 8-血糖 16-温度 32-行为监测仪 64-瘦身',
  `version_code` int(11) default NULL COMMENT '版本号',
  `mplus_version_code` int(11) default NULL COMMENT '设备在妙+的版本号',
  `link_type` int(11) default NULL COMMENT '连接类型 - 1:蓝牙连接,2:扫描二维码,3:auth2授权',
  PRIMARY KEY  (`device_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备表';

-- ----------------------------
-- Records of hd_device
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_device_extend`
-- ----------------------------
DROP TABLE IF EXISTS `hd_device_extend`;
CREATE TABLE `hd_device_extend` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键ID',
  `device_sn` varchar(50) default NULL COMMENT '设备表主键设备号',
  `appid` bigint(20) default NULL COMMENT '应用ID',
  `isbind` int(11) default NULL COMMENT '是否支持绑定：1-支持绑定 2-不支持绑定 3-设备即将上线 4-下线',
  `commodity_sn` varchar(50) default NULL COMMENT '商品编号',
  `bindnum` int(11) default '0' COMMENT '绑定人数',
  `ishot` int(11) default '0' COMMENT '是否推荐，1-不推荐 2-推荐',
  `sort_no` int(11) default NULL COMMENT '排序字段',
  `app_release_no` varchar(50) default NULL COMMENT '支持的版本号',
  `connect_type` int(2) default NULL COMMENT '1-37蓝牙连接 2-糖护士蓝牙连接 3-E伴蓝牙连接 4-汉优温度计蓝牙连接 5-光聚通讯动态温度计 6-康康sim卡连接 7-vilidic auth2',
  `create_time` bigint(20) default NULL COMMENT '创建时间',
  `version_code` int(11) default NULL COMMENT '设备支持的版本号',
  `device_type` varchar(10) default NULL COMMENT '设备类型(1:血压计,2:血糖仪,3:老人,4:智能手环)',
  `device_code` varchar(20) default NULL COMMENT '设备编码，区分获取数据源',
  `device_name` varchar(50) default NULL COMMENT '设备名称',
  `device_des` varchar(100) default NULL COMMENT '设备描述',
  `tag` varchar(100) default NULL COMMENT '设备标签',
  `logo` varchar(200) default NULL COMMENT '设备logo',
  `type_id` int(11) default NULL COMMENT '类型id',
  `functional_type` int(11) default '0' COMMENT '设备功能类型：1-运动 2-睡眠 4-血压 8-血糖 16-温度 32-行为监测仪 64-瘦身',
  `memo` varchar(500) default NULL COMMENT '扩展字段（存放：授权方式- {"auth":"auth"} ）',
  `bind_img` varchar(200) default NULL,
  `mplus_version_code` int(11) default NULL COMMENT '设备在妙+的版本号',
  `link_type` int(11) default NULL COMMENT '连接类型 - 1:蓝牙连接,2:扫描二维码,3:auth2授权',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `hd_device_extend_device_sn_appid_uindex` (`device_sn`,`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备扩展表';

-- ----------------------------
-- Records of hd_device_extend
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_device_profile`
-- ----------------------------
DROP TABLE IF EXISTS `hd_device_profile`;
CREATE TABLE `hd_device_profile` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `profile_id` bigint(20) default NULL COMMENT '用户主键ID',
  `device_sn` varchar(50) default NULL COMMENT '设备SN号',
  `device_no` varchar(50) default NULL COMMENT '设备编号（内部）',
  `appid` bigint(20) default NULL COMMENT '行业版本',
  `device_name` varchar(50) default NULL COMMENT '设备名称',
  `app_release_no` varchar(50) default NULL COMMENT '支持的版本号',
  `token` varchar(300) default NULL COMMENT '设备token(针对misfit,fitbit)',
  `third_user_id` varchar(250) default NULL COMMENT '第三方账号',
  `phone_no` varchar(16) default NULL COMMENT '电话号码',
  `status` tinyint(4) default '1' COMMENT '是否开启 0：关闭 1：开启',
  `validity_date_sim` bigint(20) default NULL COMMENT 'SIM卡到期时间',
  `update_time` bigint(20) default NULL COMMENT '变更时间',
  `functional_type` int(11) default '0' COMMENT '设备功能类型：1-运动 2-睡眠 3-运动与睡眠 4-血压 8-血糖 16-温度 32-行为监测仪 64-瘦身',
  `bind_functional_type` int(11) default '0' COMMENT '绑定设备功能类型：1-运动 2-睡眠 3-运动与睡眠 4-血压 8-血糖 16-温度 32-行为监测仪 64-瘦身',
  `is_del` int(11) default '1' COMMENT '是否删除：1-未删除 2-已删除',
  PRIMARY KEY  (`id`),
  KEY `IDX_PROFILE_ID_UPDATE_TIME` (`profile_id`,`update_time`),
  KEY `IDX_DEVICE_NO` (`device_no`),
  KEY `IDX_device_sn` (`device_sn`),
  KEY `IDX_token` (`token`(6))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备和用户关联表';

-- ----------------------------
-- Records of hd_device_profile
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_device_type`
-- ----------------------------
DROP TABLE IF EXISTS `hd_device_type`;
CREATE TABLE `hd_device_type` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键ID',
  `appid` bigint(20) default NULL COMMENT '应用ID：1妙健康 2-全嘉 3-纳塔丽 4-幸福人寿',
  `type_name` varchar(50) default NULL COMMENT '类型名称',
  `type_desc` varchar(200) default NULL COMMENT '类型描述',
  `type_code` varchar(20) default NULL COMMENT '类型编码',
  `logo` varchar(200) default NULL COMMENT '类型logo',
  `sort_no` int(11) default NULL COMMENT '排序字段',
  `is_del` int(11) default '1' COMMENT '是否删除（1-未删除 2-已删除）',
  `create_time` bigint(20) default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备类型表';

-- ----------------------------
-- Records of hd_device_type
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_heart_rate_record`
-- ----------------------------
DROP TABLE IF EXISTS `hd_heart_rate_record`;
CREATE TABLE `hd_heart_rate_record` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '流水号',
  `appid` bigint(20) default NULL COMMENT '应用ID',
  `profile_id` bigint(20) default NULL COMMENT '用户属性ID',
  `device_sn` varchar(50) default NULL COMMENT '设备编号',
  `device_no` varchar(50) default NULL COMMENT '设备唯一标识码',
  `heart_rate` int(11) default NULL COMMENT '心率值',
  `create_at` bigint(20) default NULL COMMENT '测量时间',
  `data_source` varchar(50) default NULL COMMENT '数据来源',
  `display` tinyint(3) default NULL COMMENT '是否显示',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `HEART_RATE_INDEX` (`appid`,`profile_id`,`device_sn`,`device_no`,`create_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='心率记录表';

-- ----------------------------
-- Records of hd_heart_rate_record
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_profile_mplus_ref`
-- ----------------------------
DROP TABLE IF EXISTS `hd_profile_mplus_ref`;
CREATE TABLE `hd_profile_mplus_ref` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `appid` bigint(20) default NULL COMMENT '应用ID',
  `profile_id` bigint(20) default NULL COMMENT '用户属性ID',
  `open_profile_id` varchar(50) default NULL COMMENT '用户在妙+的ID',
  `token` varchar(50) default NULL COMMENT '用户在妙token',
  `remark_data` varchar(500) default NULL COMMENT '扩展字段：存放第三方返回json串',
  `create_time` bigint(20) default NULL COMMENT '创建时间：时间戳',
  `update_time` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_profile_mplus_ref
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_sleep_data`
-- ----------------------------
DROP TABLE IF EXISTS `hd_sleep_data`;
CREATE TABLE `hd_sleep_data` (
  `id` varchar(255) NOT NULL,
  `appid` varchar(255) NOT NULL,
  `device_sn` varchar(50) default NULL,
  `device_no` varchar(50) default NULL,
  `date_time` datetime default NULL,
  `profile_id` varchar(255) default NULL,
  `duration` int(11) default NULL,
  `effect_duration` int(11) default NULL,
  `quality` varchar(10) default NULL,
  `update_at` datetime default NULL,
  `memo` varchar(2000) default NULL,
  `data_source` varchar(50) default NULL,
  `display` int(11) default NULL,
  `start_at` datetime default NULL,
  `end_at` datetime default NULL,
  `accountnum` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_sleep_data
-- ----------------------------
INSERT INTO `hd_sleep_data` VALUES ('1', '1', '1', '1', '2017-08-21 11:46:56', '1', '1', '1', '1', '2017-08-21 00:00:00', '1', '1', '1', '2017-08-21 11:47:56', '2017-08-29 11:48:00', null);

-- ----------------------------
-- Table structure for `hd_sleep_detail`
-- ----------------------------
DROP TABLE IF EXISTS `hd_sleep_detail`;
CREATE TABLE `hd_sleep_detail` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `appid` bigint(20) NOT NULL COMMENT '应用标识',
  `device_sn` varchar(50) default NULL COMMENT '设备SN号',
  `device_no` varchar(50) default NULL COMMENT '设备编号（内部）',
  `profile_id` bigint(20) default NULL COMMENT '用户主键ID',
  `date_time` varchar(20) default NULL COMMENT '睡眠日期',
  `start_at` bigint(20) default NULL COMMENT '开始时间',
  `end_at` bigint(20) default NULL COMMENT '结束时间',
  `effect_duration` int(11) default '0' COMMENT '有效睡眠时长(单位:秒)',
  `duration` int(11) default '0' COMMENT '睡眠时长(单位:秒)',
  `midday_rest` int(11) default '0' COMMENT '午休时长(单位:秒)',
  `quality` varchar(2) default NULL COMMENT '睡眠质量(1:很好,2:良好,3:差)',
  `update_at` bigint(20) default NULL COMMENT '变更时间',
  `data_source` varchar(50) default NULL COMMENT '数据来源：-2手动上传 -1手机上传 1-37血压 2-康康血压  3-汉优温度计 4-光聚通讯动态体温计 5-E伴行为监测仪 6-糖护士 7-vilidic',
  `display` int(11) default '1' COMMENT '是否显示数据（1-显示 2-不显示）',
  PRIMARY KEY  (`id`),
  KEY `IDX_device_sn` (`device_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='睡眠明细表';

-- ----------------------------
-- Records of hd_sleep_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_sleep_ranking`
-- ----------------------------
DROP TABLE IF EXISTS `hd_sleep_ranking`;
CREATE TABLE `hd_sleep_ranking` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `appid` bigint(20) NOT NULL COMMENT '应用标识',
  `profile_id` bigint(20) default NULL COMMENT '用户主键ID',
  `nickname` varchar(50) default NULL COMMENT '用户昵称：用于在app显示',
  `headpic` varchar(200) default NULL COMMENT '用户头像',
  `duration` int(11) default '0' COMMENT '睡眠时长(单位:秒)',
  `effect_duration` int(11) default '0' COMMENT '有效睡眠时长(单位:秒)',
  `quality` varchar(2) default NULL COMMENT '睡眠质量(1:很好,2:良好,3:差)',
  `type` tinyint(4) default '1' COMMENT '排行榜类别(1:周排行榜,2:月排行榜)',
  `update_at` bigint(20) default NULL COMMENT '变更时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='睡眠排行榜';

-- ----------------------------
-- Records of hd_sleep_ranking
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_sleep_statistic_month`
-- ----------------------------
DROP TABLE IF EXISTS `hd_sleep_statistic_month`;
CREATE TABLE `hd_sleep_statistic_month` (
  `id` varchar(50) NOT NULL COMMENT '主键md5(appid+"_"+profile_id+"_"+period)',
  `appid` bigint(20) default NULL COMMENT '应用标识',
  `profile_id` bigint(20) default NULL COMMENT '用户主键ID',
  `year` int(11) default NULL COMMENT '睡眠统计年份',
  `month` int(11) default NULL COMMENT '睡眠统计月份',
  `start_date` varchar(20) default NULL COMMENT '睡眠统计开始时间',
  `end_date` varchar(20) default NULL COMMENT '睡眠统计结束时间',
  `total_duration` int(11) default NULL COMMENT '月总睡眠时长(单位:秒)',
  `total_effect_duration` int(11) default NULL COMMENT '月总有效睡眠时长(单位:秒)',
  `effect_days` int(11) default NULL COMMENT '当月有效睡眠天数',
  PRIMARY KEY  (`id`),
  KEY `IDX_PROFILE_ID` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='睡眠月统计';

-- ----------------------------
-- Records of hd_sleep_statistic_month
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_sleep_statistic_week`
-- ----------------------------
DROP TABLE IF EXISTS `hd_sleep_statistic_week`;
CREATE TABLE `hd_sleep_statistic_week` (
  `id` varchar(50) NOT NULL COMMENT '主键md5(appid+"_"+profile_id+"_"+period)',
  `appid` bigint(20) default NULL COMMENT '应用标识',
  `profile_id` bigint(20) default NULL COMMENT '用户主键ID',
  `year` int(11) default NULL COMMENT '睡眠统计年份',
  `week` int(11) default NULL COMMENT '睡眠统计周数',
  `start_date` varchar(20) default NULL COMMENT '睡眠统计开始时间',
  `end_date` varchar(20) default NULL COMMENT '睡眠统计结束时间',
  `total_duration` int(11) default NULL COMMENT '周总睡眠时长(单位:秒)',
  `total_effect_duration` int(11) default NULL COMMENT '周总有效睡眠时长(单位:秒)',
  `effect_days` int(11) default NULL COMMENT '当周有效睡眠天数',
  PRIMARY KEY  (`id`),
  KEY `idx_profile_id` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='睡眠周统计';

-- ----------------------------
-- Records of hd_sleep_statistic_week
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_sleep_weekly_report`
-- ----------------------------
DROP TABLE IF EXISTS `hd_sleep_weekly_report`;
CREATE TABLE `hd_sleep_weekly_report` (
  `id` varchar(50) NOT NULL default '' COMMENT '主键md5(appid+"_"+profile_id+"_"+period)',
  `appid` bigint(20) default NULL COMMENT '应用标识',
  `profile_id` bigint(20) default NULL COMMENT '用户主键ID',
  `year` int(11) default NULL COMMENT '睡眠统计年份',
  `week` int(11) default NULL COMMENT '睡眠统计周数',
  `start_date` varchar(20) default NULL COMMENT '睡眠统计开始时间',
  `end_date` varchar(20) default NULL COMMENT '睡眠统计结束时间',
  `total_duration` int(11) default NULL COMMENT '周总睡眠时长(单位:秒)',
  `total_effect_duration` int(11) default NULL COMMENT '周总有效睡眠时长(单位:秒)',
  `earliest_sleep_time` varchar(10) default NULL COMMENT '最早入睡时间（09:58）',
  `latest_sleep_time` varchar(10) default NULL COMMENT '最晚入睡时间（01:58）',
  `avg_duration` int(11) default NULL COMMENT '周平均睡眠时长(单位:秒)',
  `avg_effect_duration` int(11) default NULL COMMENT '周平均有效睡眠时长(单位:秒)',
  `avg_sleep_time` varchar(10) default NULL COMMENT '平均入睡时间（00:08）',
  `total_duration_increase` int(11) default NULL COMMENT '较上周增加的睡眠时长(单位:秒)',
  `total_effect_duration_increase` int(11) default NULL COMMENT '较上周增加的有效睡眠时长(单位:秒)',
  `status` tinyint(4) default NULL COMMENT '周睡眠状态(1:睡多了,2:完美,3:睡眠不足)',
  `suggest` varchar(200) default NULL COMMENT '周睡眠建议',
  `create_at` bigint(20) default NULL COMMENT '报告生成时间',
  `is_read` tinyint(4) default '1' COMMENT '是否阅读（1：未查看，2：已查看）',
  PRIMARY KEY  (`id`),
  KEY `idx_condition` USING BTREE (`appid`,`profile_id`,`year`,`week`,`is_read`,`create_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='睡眠周报告';

-- ----------------------------
-- Records of hd_sleep_weekly_report
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_sport_data`
-- ----------------------------
DROP TABLE IF EXISTS `hd_sport_data`;
CREATE TABLE `hd_sport_data` (
  `id` varchar(255) NOT NULL,
  `appid` varchar(255) NOT NULL,
  `device_sn` varchar(50) default NULL,
  `device_no` varchar(50) default NULL,
  `profile_id` varchar(255) default NULL,
  `date_time` datetime default NULL,
  `calories` double(9,3) default NULL,
  `distance` double(9,2) default NULL,
  `steps` int(11) default NULL,
  `speed` double(9,3) default NULL,
  `sport_item` varchar(10) default NULL,
  `level` varchar(10) default NULL,
  `target` int(11) default NULL,
  `update_at` datetime default NULL,
  `memo` varchar(2000) default NULL,
  `data_source` varchar(50) default NULL,
  `heart_rate` int(11) default NULL,
  `display` int(11) default NULL,
  `accountnum` int(11) default NULL,
  `period` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_sport_data
-- ----------------------------
INSERT INTO `hd_sport_data` VALUES ('1', '1', '1', '1', '2', '2017-08-21 19:20:09', '1.000', '1.00', '1', '1.000', '1', '1', '10000', '2017-08-21 00:00:00', '1', '1', '1', '1', null, null);

-- ----------------------------
-- Table structure for `hd_sport_detail`
-- ----------------------------
DROP TABLE IF EXISTS `hd_sport_detail`;
CREATE TABLE `hd_sport_detail` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `appid` bigint(20) NOT NULL COMMENT '应用标识',
  `device_sn` varchar(50) default NULL COMMENT '设备SN号',
  `device_no` varchar(50) default NULL COMMENT '设备编号（内部）',
  `profile_id` bigint(20) default NULL COMMENT '用户主键ID',
  `date_time` varchar(15) default NULL COMMENT '运动日期',
  `start_at` bigint(20) default NULL COMMENT '开始时间',
  `end_at` bigint(20) default NULL COMMENT '结束时间',
  `calories` double(9,3) default '0.000' COMMENT '卡洛里',
  `duration` int(11) default '0' COMMENT '轻量活动时长(单位:秒)',
  `heat` double(9,3) default '0.000' COMMENT '轻量活动消耗热量',
  `distance` double(9,3) default '0.000' COMMENT '运动距离',
  `step` int(11) default '0' COMMENT '步数',
  `update_at` datetime default NULL COMMENT '变更时间',
  `data_source` varchar(50) default NULL COMMENT '数据来源：-2手动上传 -1手机上传 1-37血压 2-康康血压  3-汉优温度计 4-光聚通讯动态体温计 5-E伴行为监测仪 6-糖护士 7-vilidic',
  `heart_rate` int(11) default NULL COMMENT '心率',
  `display` int(11) default '1' COMMENT '是否显示数据（1-显示 2-不显示）',
  PRIMARY KEY  (`id`),
  KEY `IDX_PROFILE_ID` (`profile_id`),
  KEY `IDX_device_sn` (`device_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_sport_detail
-- ----------------------------
INSERT INTO `hd_sport_detail` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1.000', '1', '1.000', '1.000', '1', '2017-08-22 15:24:38', '1', '1', '1');
INSERT INTO `hd_sport_detail` VALUES ('2', '1', '1', '11', '1', '1', '1', '1', '1.000', '1', '1.000', '11.000', '1', '2017-08-22 15:24:57', '1', '1', '1');

-- ----------------------------
-- Table structure for `hd_sport_items`
-- ----------------------------
DROP TABLE IF EXISTS `hd_sport_items`;
CREATE TABLE `hd_sport_items` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `icon` varchar(80) default NULL COMMENT 'icon图标',
  `name` varchar(20) default NULL COMMENT '项目名称',
  `is_gps` tinyint(3) default '2' COMMENT '是否支持gps追踪：1、是 2、否',
  `appid` bigint(20) default NULL COMMENT '应用ID',
  `sort_no` int(11) default NULL COMMENT '排序字段',
  `mei_degreasing` decimal(9,2) default NULL COMMENT '梅脱脂',
  `is_del` tinyint(3) default '1' COMMENT '删除标识：1-未删除 2-已删除',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_sport_items
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_sport_ranking`
-- ----------------------------
DROP TABLE IF EXISTS `hd_sport_ranking`;
CREATE TABLE `hd_sport_ranking` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `appid` bigint(20) NOT NULL COMMENT '应用标识',
  `profile_id` bigint(20) default NULL COMMENT '用户主键ID',
  `nickname` varchar(50) default NULL COMMENT '用户昵称：用于在app显示',
  `headpic` varchar(200) default NULL COMMENT '用户头像',
  `steps` int(11) default '0' COMMENT '步数',
  `distance` double(9,3) default '0.000' COMMENT '距离',
  `calories` double(9,3) default '0.000' COMMENT '卡洛里',
  `type` int(1) default '1' COMMENT '排行榜类别(1:周排行榜,2:月排行榜)',
  `update_at` bigint(20) default NULL COMMENT '变更时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_sport_ranking
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_temperature`
-- ----------------------------
DROP TABLE IF EXISTS `hd_temperature`;
CREATE TABLE `hd_temperature` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '体温记录流水号',
  `appid` bigint(20) default NULL COMMENT '应用ID',
  `profile_id` bigint(20) default NULL COMMENT '用户属性ID',
  `status` tinyint(4) default NULL COMMENT '温度状态（1-偏低 2-正常 3-偏高）',
  `temperature` varchar(10) default NULL COMMENT '温度值',
  `create_time` bigint(20) default NULL COMMENT '测量时间',
  `device_sn` varchar(200) default NULL,
  `device_no` varchar(200) default NULL,
  `display` int(5) default '1',
  `data_source` varchar(200) default NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_profile_id` (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='体温记录表';

-- ----------------------------
-- Records of hd_temperature
-- ----------------------------
INSERT INTO `hd_temperature` VALUES ('1', '1', '1', '1', '1', null, '1', '1', '1', null);

-- ----------------------------
-- Table structure for `hd_temperature_alarm`
-- ----------------------------
DROP TABLE IF EXISTS `hd_temperature_alarm`;
CREATE TABLE `hd_temperature_alarm` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `profile_id` bigint(20) NOT NULL COMMENT '用户ID',
  `data` varchar(255) character set utf8 collate utf8_bin default '' COMMENT 'JSON格式。存放高温报警线温度。例：{"temp1":38.5,"temp2":37.8}',
  `appid` bigint(20) NOT NULL COMMENT '应用ID',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `profile_id` (`profile_id`,`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='儿童体温报警线表';

-- ----------------------------
-- Records of hd_temperature_alarm
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_temperature_extend`
-- ----------------------------
DROP TABLE IF EXISTS `hd_temperature_extend`;
CREATE TABLE `hd_temperature_extend` (
  `id` bigint(20) NOT NULL auto_increment,
  `appid` bigint(20) NOT NULL default '1',
  `profile_id` bigint(20) NOT NULL,
  `date` date NOT NULL COMMENT '日期\n',
  `starttime` time default NULL,
  `endtime` time default NULL,
  `max_value` decimal(4,2) default NULL,
  `min_value` decimal(4,2) default NULL,
  `max_time` time default NULL,
  `min_time` time default NULL,
  `updatetime` datetime default NULL,
  `accountnum` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_temperature_extend
-- ----------------------------
INSERT INTO `hd_temperature_extend` VALUES ('1', '11', '1', '2017-08-21', '18:46:55', '18:46:57', '1.00', '1.00', '04:00:00', '18:47:06', '2017-08-21 18:47:30', null);

-- ----------------------------
-- Table structure for `hd_user_connect_ref`
-- ----------------------------
DROP TABLE IF EXISTS `hd_user_connect_ref`;
CREATE TABLE `hd_user_connect_ref` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键ID',
  `profile_id` bigint(20) NOT NULL COMMENT '用户属性ID',
  `connect_type` int(11) NOT NULL COMMENT '连接类型：1-37蓝牙连接 2-糖护士蓝牙连接 3-E伴蓝牙连接 4-汉优温度计蓝牙连接 5-光聚通讯动态温度计 6-康康sim卡连接 7-vilidic auth2',
  `token` varchar(300) default NULL COMMENT '用户在第三方token值',
  `third_user_id` varchar(250) default NULL COMMENT '用户在第三方的ID',
  `data` varchar(2000) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `profile_id` (`profile_id`,`connect_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_user_connect_ref
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_usr_sport_data`
-- ----------------------------
DROP TABLE IF EXISTS `hd_usr_sport_data`;
CREATE TABLE `hd_usr_sport_data` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `profile_id` bigint(20) default NULL COMMENT '用户属性ID',
  `appid` bigint(20) default NULL COMMENT '应用ID',
  `basal_metabolism` decimal(9,2) default NULL COMMENT '基础代谢',
  `calories` decimal(9,2) default NULL COMMENT '当天消耗总能量',
  `calories_target` decimal(9,2) default NULL COMMENT '目标千卡',
  `total_time` int(11) default NULL COMMENT '运动总时长：单位秒',
  `distance` int(11) default NULL COMMENT '运动总距离：米',
  `steps` int(11) default NULL COMMENT '运动总步数',
  `date_time` varchar(255) default NULL COMMENT '测量日期：yyyy-MM-dd',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `unique_profile_date` (`profile_id`,`appid`,`date_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_usr_sport_data
-- ----------------------------

-- ----------------------------
-- Table structure for `hd_usr_sport_items`
-- ----------------------------
DROP TABLE IF EXISTS `hd_usr_sport_items`;
CREATE TABLE `hd_usr_sport_items` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `profile_id` bigint(20) default NULL COMMENT '用户属性ID',
  `appid` bigint(20) default NULL COMMENT '应用ID',
  `device_sn` varchar(50) default NULL COMMENT '设备编码',
  `device_no` varchar(50) default NULL COMMENT '设备唯一标识码',
  `items_id` bigint(20) default NULL COMMENT '运动项目ID',
  `items_name` varchar(20) default NULL COMMENT '运动项目名称',
  `calories` decimal(9,2) default NULL COMMENT '卡路里',
  `steps` int(11) default NULL COMMENT '运动总步数',
  `distance` int(11) default NULL COMMENT '距离：米',
  `sport_times` int(11) default NULL COMMENT '运动时长：秒',
  `speed` decimal(9,2) default NULL COMMENT '时速：公里/小时',
  `gps_image` varchar(200) default NULL COMMENT 'GPS图片',
  `image_urls` varchar(400) default NULL COMMENT '运动项目照片url，可存放多张',
  `updateTime` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新时间',
  `measure_time` bigint(20) default NULL COMMENT '测量时间',
  `date_time` varchar(20) default NULL COMMENT '测量日期：yyyy-MM-dd',
  `type` int(11) default '1' COMMENT '记录类型：1-手动 2-运动 3-设备',
  `data_source` varchar(50) default NULL COMMENT '数据源',
  `tracks` longtext COMMENT '运动轨迹：经纬度数组 {经度：纬度：暂停标志}',
  `is_have_device` tinyint(3) default NULL COMMENT '是否包含数据源数据【1-包含  2-不包含】',
  PRIMARY KEY  (`id`),
  KEY `IDX_PROFILE_ID` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_usr_sport_items
-- ----------------------------

-- ----------------------------
-- Table structure for `marital_status`
-- ----------------------------
DROP TABLE IF EXISTS `marital_status`;
CREATE TABLE `marital_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of marital_status
-- ----------------------------

-- ----------------------------
-- Table structure for `medical_insurance`
-- ----------------------------
DROP TABLE IF EXISTS `medical_insurance`;
CREATE TABLE `medical_insurance` (
  `id` int(11) NOT NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medical_insurance
-- ----------------------------

-- ----------------------------
-- Table structure for `prize_accept_details`
-- ----------------------------
DROP TABLE IF EXISTS `prize_accept_details`;
CREATE TABLE `prize_accept_details` (
  `id` varchar(255) NOT NULL,
  `accept_date` datetime default NULL,
  `exchange` datetime default NULL,
  `is_exchange` varchar(255) default NULL,
  `prize_id` int(11) default NULL,
  `user_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prize_accept_details
-- ----------------------------

-- ----------------------------
-- Table structure for `prize_general`
-- ----------------------------
DROP TABLE IF EXISTS `prize_general`;
CREATE TABLE `prize_general` (
  `id` varchar(255) NOT NULL,
  `end_date` datetime default NULL,
  `general_name` varchar(255) default NULL,
  `general_type` varchar(255) default NULL,
  `prize_id` varchar(255) default NULL,
  `start_date` datetime default NULL,
  `update_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prize_general
-- ----------------------------

-- ----------------------------
-- Table structure for `prize_library`
-- ----------------------------
DROP TABLE IF EXISTS `prize_library`;
CREATE TABLE `prize_library` (
  `id` int(11) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `prize_describe` varchar(255) default NULL,
  `prize_explain` varchar(255) default NULL,
  `prize_name` varchar(255) default NULL,
  `prize_type` varchar(255) default NULL,
  `prize_url` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  `prize_content` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prize_library
-- ----------------------------
INSERT INTO `prize_library` VALUES ('1', '2017-09-29 11:46:05', '小米手环', '小米手环', '小米手环', '1', null, '1', null);

-- ----------------------------
-- Table structure for `prize_miao`
-- ----------------------------
DROP TABLE IF EXISTS `prize_miao`;
CREATE TABLE `prize_miao` (
  `id` varchar(255) NOT NULL,
  `experience` float default NULL,
  `limit_num` int(11) default NULL,
  `limit_type` varchar(255) default NULL,
  `miao_num` float default NULL,
  `state` varchar(255) default NULL,
  `task_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prize_miao
-- ----------------------------

-- ----------------------------
-- Table structure for `prize_sign`
-- ----------------------------
DROP TABLE IF EXISTS `prize_sign`;
CREATE TABLE `prize_sign` (
  `id` varchar(255) NOT NULL,
  `pic_url` varchar(255) default NULL,
  `prize_desciption` varchar(255) default NULL,
  `prize_id` int(11) default NULL,
  `sign_name` varchar(255) default NULL,
  `update_date` datetime default NULL,
  `user_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prize_sign
-- ----------------------------

-- ----------------------------
-- Table structure for `profession`
-- ----------------------------
DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession` (
  `id` int(11) NOT NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profession
-- ----------------------------

-- ----------------------------
-- Table structure for `slim_food`
-- ----------------------------
DROP TABLE IF EXISTS `slim_food`;
CREATE TABLE `slim_food` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '瘦身食物id',
  `food_name` varchar(50) default NULL COMMENT '食物名称',
  `food_alias` varchar(50) default NULL COMMENT '食物别名',
  `food_pic` varchar(255) default NULL COMMENT '食物图片路径',
  `food_heat` double(11,0) default NULL COMMENT '食物热量（卡/100克）',
  `cate_name` varchar(255) default NULL COMMENT '食物类别id',
  `cate_id` bigint(11) default NULL COMMENT '食物类别名称',
  `food_level` varchar(255) default NULL COMMENT '食物评级',
  `evaluate` varchar(2000) default NULL COMMENT '食物评价',
  `introduction` varchar(2000) default NULL COMMENT '食物说明',
  `food_effect` varchar(2000) default NULL COMMENT '食物功效',
  `food_value` varchar(2000) default NULL COMMENT '食物营养价值',
  `food_suit` varchar(255) default NULL COMMENT '适用人群',
  `nutri_carbo` double(11,0) default NULL COMMENT '碳水化合物(每100克含量，下同)',
  `nutri_fat` double(11,0) default NULL COMMENT '脂肪',
  `nutri_protein` double(11,0) default NULL COMMENT '蛋白质',
  `nutri_cell` double(11,0) default NULL COMMENT '纤维素',
  `nutri_va` double(11,0) default NULL COMMENT '维生素A',
  `nutri_vc` double(11,0) default NULL COMMENT '维生素c',
  `nutri_ve` double(11,0) default NULL COMMENT '维生素E',
  `nutri_caro` double(11,0) default NULL COMMENT '胡萝卜素',
  `nutri_thia` double(11,0) default NULL COMMENT '硫胺素',
  `nutri_niacin` double(11,0) default NULL COMMENT '烟酸',
  `nutri_chole` double(11,0) default NULL COMMENT '胆固醇',
  `nutri_mg` double(11,0) default NULL COMMENT '镁',
  `nutri_ca` double(11,0) default NULL COMMENT '钙',
  `nutri_fe` double(11,0) default NULL COMMENT '铁',
  `nutri_zn` double(11,0) default NULL COMMENT '锌',
  `nutri_cu` double(11,0) default NULL COMMENT '铜',
  `nutri_mn` double(11,0) default NULL COMMENT '锰',
  `nutri_ga` double(11,0) default NULL COMMENT '镓',
  `nutri_p` double(11,0) default NULL COMMENT '磷',
  `nutri_na` double(11,0) default NULL COMMENT '钠',
  `nutri_se` double(11,0) default NULL COMMENT '硒',
  `nutri_nu` double(11,0) default NULL COMMENT '营养素',
  `update_time` bigint(20) default NULL COMMENT '更新时间',
  `create_time` bigint(20) default NULL COMMENT '创建时间',
  `status` tinyint(4) default NULL COMMENT '状态（1：正常，2：禁用）',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='瘦身食物表';

-- ----------------------------
-- Records of slim_food
-- ----------------------------

-- ----------------------------
-- Table structure for `slim_food_cate`
-- ----------------------------
DROP TABLE IF EXISTS `slim_food_cate`;
CREATE TABLE `slim_food_cate` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '瘦身食物类别id',
  `cate_name` varchar(50) default NULL COMMENT '食物类别名称',
  `cate_pic` varchar(255) default NULL COMMENT '食物类别图片',
  `cate_desc` varchar(255) default NULL COMMENT '食物类别描述',
  `update_time` bigint(20) default NULL COMMENT '更新时间',
  `create_time` bigint(20) default NULL COMMENT '创建时间',
  `status` tinyint(4) default NULL COMMENT '状态（1：正常，2：禁用）',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='瘦身食物类别表';

-- ----------------------------
-- Records of slim_food_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `slim_rank`
-- ----------------------------
DROP TABLE IF EXISTS `slim_rank`;
CREATE TABLE `slim_rank` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '用户瘦身排行id',
  `profile_id` bigint(20) default NULL COMMENT '用户属性id',
  `account_name` varchar(50) default NULL COMMENT '用户账号',
  `nickname` varchar(50) default NULL COMMENT '用户昵称',
  `headpic` varchar(255) default NULL COMMENT '用户头像路径',
  `weight_reduce` double(9,2) default NULL COMMENT '用户减掉的体重',
  `weigh_year` varchar(20) default NULL COMMENT '体重测量日期（年：2016）',
  `weigh_month` varchar(20) default NULL COMMENT '体重测量日期（月：2016-01）',
  `weigh_week` int(11) default NULL COMMENT '体重测量日期（为一年当中的第几周）',
  `type` tinyint(4) default NULL COMMENT '排行类型（1：周排行；2：月排行）',
  `appid` bigint(20) default NULL COMMENT '应用id',
  `update_time` bigint(20) default NULL COMMENT '更新时间',
  `create_time` bigint(20) default NULL COMMENT '创建时间',
  `status` tinyint(4) default NULL COMMENT '状态（1：正常，2：禁用）',
  PRIMARY KEY  (`id`),
  KEY `IDX_profile_id` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户瘦身排行表';

-- ----------------------------
-- Records of slim_rank
-- ----------------------------

-- ----------------------------
-- Table structure for `slim_target`
-- ----------------------------
DROP TABLE IF EXISTS `slim_target`;
CREATE TABLE `slim_target` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键，用户瘦身目标id',
  `begin_weight` double default NULL COMMENT '用户初始体重',
  `target_weight` double default NULL COMMENT '用户瘦身目标体重',
  `target_time` bigint(20) default NULL COMMENT '用户瘦身目标日期',
  `begin_day` varchar(20) default NULL COMMENT '初始日期（天：2016-01-20）',
  `target_day` varchar(20) default NULL COMMENT '瘦身目标日期（天：2016-02-20）',
  `begin_month` varchar(20) default NULL COMMENT '初始日期（月：2016-01）',
  `target_month` varchar(20) default NULL COMMENT '目标日期（月：2016-01）',
  `birth` varchar(20) default NULL COMMENT '用户出生日期',
  `height` double(9,2) default NULL COMMENT '用户身高',
  `profile_id` bigint(20) default NULL COMMENT '当前客户端登录用户属性id',
  `appid` bigint(20) default NULL COMMENT '应用id',
  `update_time` bigint(20) default NULL COMMENT '更新时间',
  `create_time` bigint(20) default NULL COMMENT '创建时间',
  `status` tinyint(4) default NULL COMMENT '状态（1：正常，2：禁用）',
  PRIMARY KEY  (`id`),
  KEY `IDX_PROFILE_ID` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户瘦身目标表';

-- ----------------------------
-- Records of slim_target
-- ----------------------------

-- ----------------------------
-- Table structure for `slim_weight`
-- ----------------------------
DROP TABLE IF EXISTS `slim_weight`;
CREATE TABLE `slim_weight` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '用户体重id',
  `weight` float(5,2) default NULL COMMENT '用户体重',
  `bmi` float(5,2) default NULL COMMENT '用户体重指数',
  `fat_ratio` float(5,2) default NULL COMMENT '体脂率',
  `muscle` float(5,2) default NULL COMMENT '肌肉',
  `bone_mass` float(5,2) default NULL COMMENT '骨量',
  `metabolism` float(7,2) default NULL COMMENT '基础代谢',
  `moisture` float(5,2) default NULL COMMENT '体水分',
  `fat_scale` tinyint(4) default '1' COMMENT '数据来源（1：一般秤，2：体脂称）',
  `weight_type` varchar(20) default NULL COMMENT '体重类型（标准、偏瘦、偏胖、肥胖...）\r\n1.标准\r\n2.偏瘦\r\n3.偏胖\r\n4.肥胖',
  `weigh_time` varchar(20) default NULL COMMENT '体重测量日期（毫秒时间戳）',
  `weigh_year` varchar(20) default NULL COMMENT '体重测量日期（年：2016）',
  `weigh_month` varchar(20) default NULL COMMENT '体重测量日期（月：2016-01）',
  `weigh_day` varchar(20) default NULL COMMENT '体重测量日期（日：2016-01-11）',
  `weigh_week` int(11) default NULL COMMENT '体重测量日期（为一年当中的第几周）',
  `device_sn` varchar(50) default NULL COMMENT '设备编号',
  `device_name` varchar(50) default NULL COMMENT '设备名称',
  `profile_id` bigint(20) default NULL COMMENT '当前客户端登录用户属性id',
  `appid` bigint(20) default NULL COMMENT '应用id',
  `update_time` varchar(20) default NULL COMMENT '更新日期',
  `create_time` varchar(20) default NULL COMMENT '创建日期',
  `status` tinyint(4) default NULL COMMENT '状态（1：正常，2：禁用）',
  `avg_weight_increase` float(5,2) default NULL COMMENT '天均增加体重（正数：增加，负数：减少）',
  `weight_time` datetime default NULL,
  `accountnum` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_weigh_day` (`profile_id`,`weigh_time`),
  KEY `IDX_PROFILE_ID_WEIGH_TIME` (`profile_id`,`weigh_time`),
  KEY `IDX_device_sn` (`device_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户体重表';

-- ----------------------------
-- Records of slim_weight
-- ----------------------------
INSERT INTO `slim_weight` VALUES ('1', '1.00', '1.00', '1.00', '1.00', '1.00', '11.00', '1.00', '1', '1', '2019-09-08 09:08:09', '11', '1', '1', '1', '1', '1', '1', '1', '11', '20190908090809', '1', '1.00', null, null);
INSERT INTO `slim_weight` VALUES ('2', '2.00', '2.00', '2.00', '2.00', '2.00', '2.00', '2.00', '12', '2', '2019-09-09', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2017-09-08 08:09:76', '2', '2.00', null, null);
INSERT INTO `slim_weight` VALUES ('3', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '1', '3', '2017-09-09', '3', '3', '3', '3', '3', '3', '3', '3', '3', '1998-09-09', '1', '2.00', null, null);

-- ----------------------------
-- Table structure for `slim_weight_statistic_day`
-- ----------------------------
DROP TABLE IF EXISTS `slim_weight_statistic_day`;
CREATE TABLE `slim_weight_statistic_day` (
  `id` varchar(50) NOT NULL COMMENT '主键md5(appid+"_"+profile_id+"_"+date_time)',
  `appid` bigint(20) default NULL COMMENT '应用标识',
  `profile_id` bigint(20) default NULL COMMENT '用户主键ID',
  `date_time` varchar(20) default NULL COMMENT '瘦身日期',
  `avg_weight` float(5,2) default NULL COMMENT '日均体重',
  `avg_bmi` double(9,2) default NULL COMMENT '日均体重指数',
  `avg_weight_increase` float(5,2) default NULL COMMENT '日均增加体重（正数：增加，负数：减少）',
  `avg_fat_ratio` float(5,2) default NULL COMMENT '日体脂率',
  `avg_muscle` float(5,2) default NULL COMMENT '日肌肉',
  `avg_bone_mass` float(5,2) default NULL COMMENT '日骨量',
  `avg_metabolism` float(5,2) default NULL COMMENT '日基础代谢',
  `avg_moisture` float(5,2) default NULL COMMENT '日体水分',
  `effect_num` int(11) default NULL COMMENT '当天有效数据条数',
  PRIMARY KEY  (`id`),
  KEY `IDX_PROFILE_ID` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slim_weight_statistic_day
-- ----------------------------

-- ----------------------------
-- Table structure for `slim_weight_statistic_month`
-- ----------------------------
DROP TABLE IF EXISTS `slim_weight_statistic_month`;
CREATE TABLE `slim_weight_statistic_month` (
  `id` varchar(50) NOT NULL COMMENT '主键md5(appid+"_"+profile_id+"_"+year+"_"+month)',
  `appid` bigint(20) default NULL COMMENT '应用标识',
  `profile_id` bigint(20) default NULL COMMENT '用户主键ID',
  `year` int(11) default NULL COMMENT '年份',
  `month` int(11) default NULL COMMENT '月份',
  `start_date` varchar(20) default NULL COMMENT '瘦身开始日期',
  `end_date` varchar(20) default NULL COMMENT '瘦身结束日期',
  `avg_weight` float(5,2) default NULL COMMENT '月均体重',
  `avg_bmi` double(9,2) default NULL COMMENT '月均体重指数',
  `avg_weight_increase` float(5,2) default NULL COMMENT '月均增加体重（正数：增加，负数：减少）',
  `avg_fat_ratio` float(5,2) default NULL COMMENT '月体脂率',
  `avg_muscle` float(5,2) default NULL COMMENT '月肌肉',
  `avg_bone_mass` float(5,2) default NULL COMMENT '月骨量',
  `avg_metabolism` float(5,2) default NULL COMMENT '月基础代谢',
  `avg_moisture` float(5,2) default NULL COMMENT '月体水分',
  `effect_num` int(11) default NULL COMMENT '当月有效数据条数',
  PRIMARY KEY  (`id`),
  KEY `IDX_profile_id` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slim_weight_statistic_month
-- ----------------------------

-- ----------------------------
-- Table structure for `slim_weight_statistic_week`
-- ----------------------------
DROP TABLE IF EXISTS `slim_weight_statistic_week`;
CREATE TABLE `slim_weight_statistic_week` (
  `id` varchar(50) NOT NULL COMMENT '主键md5(appid+"_"+profile_id+"_"+year+"_"+week)',
  `appid` bigint(20) default NULL COMMENT '应用标识',
  `profile_id` bigint(20) default NULL COMMENT '用户主键ID',
  `year` int(11) default NULL COMMENT '年份',
  `week` int(11) default NULL COMMENT '周数',
  `start_date` varchar(20) default NULL COMMENT '瘦身开始日期',
  `end_date` varchar(20) default NULL COMMENT '瘦身结束日期',
  `avg_weight` float(5,2) default NULL COMMENT '周均体重',
  `avg_bmi` double(9,2) default NULL COMMENT '周均体重指数',
  `avg_weight_increase` float(5,2) default NULL COMMENT '周均增加体重（正数：增加，负数：减少）',
  `avg_fat_ratio` float(5,2) default NULL COMMENT '周体脂率',
  `avg_muscle` float(5,2) default NULL COMMENT '周肌肉',
  `avg_bone_mass` float(5,2) default NULL COMMENT '周骨量',
  `avg_metabolism` float(5,2) default NULL COMMENT '周基础代谢',
  `avg_moisture` float(5,2) default NULL COMMENT '周体水分',
  `effect_num` int(11) default NULL COMMENT '当周有效数据条数',
  PRIMARY KEY  (`id`),
  KEY `IDX_PI_YE_WE` (`profile_id`,`year`,`week`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slim_weight_statistic_week
-- ----------------------------

-- ----------------------------
-- Table structure for `slim_weight_weekly_report`
-- ----------------------------
DROP TABLE IF EXISTS `slim_weight_weekly_report`;
CREATE TABLE `slim_weight_weekly_report` (
  `id` varchar(50) NOT NULL default '' COMMENT '主键md5(appid+"_"+profile_id+"_"+year+"_"+week)',
  `appid` bigint(20) default NULL COMMENT '应用标识',
  `profile_id` bigint(20) default NULL COMMENT '用户主键ID',
  `year` int(11) default NULL COMMENT '瘦身统计年份',
  `week` int(11) default NULL COMMENT '瘦身统计周数',
  `start_date` varchar(20) default NULL COMMENT '瘦身统计开始时间',
  `end_date` varchar(20) default NULL COMMENT '瘦身统计结束时间',
  `max_weight` float(5,2) default NULL COMMENT '周最重体重',
  `min_weight` float(5,2) default NULL COMMENT '周最轻体重',
  `avg_weight` float(5,2) default NULL COMMENT '周平均体重',
  `weight_increase` float(5,2) default NULL COMMENT '周平均增加体重（正数：增加，负数：减少）',
  `target` varchar(200) default NULL COMMENT '瘦身目标',
  `suggest` varchar(200) default NULL COMMENT '周瘦身建议',
  `create_at` bigint(20) default NULL COMMENT '报告生成时间',
  `is_read` tinyint(4) default '1' COMMENT '是否阅读（1：未查看，2：已查看）',
  PRIMARY KEY  (`id`),
  KEY `IDX_profile_id` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slim_weight_weekly_report
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_area`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_area`;
CREATE TABLE `tbl_area` (
  `id` int(11) NOT NULL auto_increment COMMENT '区域id（主键）',
  `area_name` varchar(50) default NULL COMMENT '区域名称',
  `area_level` tinyint(4) default '1' COMMENT '1为国家、2为省（直辖市、自治区）、3为地市（直辖市下属的区县）、4为区县、5为乡镇',
  `parent_id` int(11) default '0' COMMENT '上级区域id',
  `area_status` tinyint(4) default '1' COMMENT '状态（1：正常，-1：禁用）',
  `create_time` bigint(20) default NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of tbl_area
-- ----------------------------
INSERT INTO `tbl_area` VALUES ('1', '中国', '1', '0', '1', '1493984067297', '2017-05-05 19:34:27');
INSERT INTO `tbl_area` VALUES ('2', '广东', '2', '1', '1', '1493984067302', '2017-05-05 19:34:27');
INSERT INTO `tbl_area` VALUES ('3', '佛山', '3', '2', '1', '1493984067306', '2017-05-05 19:34:27');
INSERT INTO `tbl_area` VALUES ('4', '贵州', '2', '1', '1', '1493984069071', '2017-05-05 19:34:29');
INSERT INTO `tbl_area` VALUES ('5', '贵阳', '3', '4', '1', '1493984069075', '2017-05-05 19:34:29');
INSERT INTO `tbl_area` VALUES ('6', '北京', '2', '1', '1', '1493984071369', '2017-05-05 19:34:31');
INSERT INTO `tbl_area` VALUES ('7', '北京', '3', '6', '1', '1493984071374', '2017-05-05 19:34:31');
INSERT INTO `tbl_area` VALUES ('8', '江苏', '2', '1', '1', '1493984097125', '2017-05-05 19:34:57');
INSERT INTO `tbl_area` VALUES ('9', '南京', '3', '8', '1', '1493984097128', '2017-05-05 19:34:57');
INSERT INTO `tbl_area` VALUES ('10', '湖南', '2', '1', '1', '1493984109055', '2017-05-05 19:35:09');
INSERT INTO `tbl_area` VALUES ('11', '株洲', '3', '10', '1', '1493984109058', '2017-05-05 19:35:09');
INSERT INTO `tbl_area` VALUES ('12', '遵义', '3', '4', '1', '1493984109134', '2017-05-05 19:35:09');
INSERT INTO `tbl_area` VALUES ('13', '浙江', '2', '1', '1', '1493984127053', '2017-05-05 19:35:27');
INSERT INTO `tbl_area` VALUES ('14', '舟山', '3', '13', '1', '1493984127055', '2017-05-05 19:35:27');
INSERT INTO `tbl_area` VALUES ('15', '宿迁', '3', '8', '1', '1493984137028', '2017-05-05 19:35:37');
INSERT INTO `tbl_area` VALUES ('16', '湖北', '2', '1', '1', '1493984173058', '2017-05-05 19:36:13');
INSERT INTO `tbl_area` VALUES ('17', '武汉', '3', '16', '1', '1493984173062', '2017-05-05 19:36:13');
INSERT INTO `tbl_area` VALUES ('18', '宁波', '3', '13', '1', '1493984197053', '2017-05-05 19:36:37');
INSERT INTO `tbl_area` VALUES ('19', '镇江', '3', '8', '1', '1493984225027', '2017-05-05 19:37:05');
INSERT INTO `tbl_area` VALUES ('20', '广州', '3', '2', '1', '1493984242107', '2017-05-05 19:37:22');
INSERT INTO `tbl_area` VALUES ('21', '江西', '2', '1', '1', '1493984269062', '2017-05-05 19:37:49');
INSERT INTO `tbl_area` VALUES ('22', '九江', '3', '21', '1', '1493984269065', '2017-05-05 19:37:49');
INSERT INTO `tbl_area` VALUES ('23', '辽宁', '2', '1', '1', '1493984285052', '2017-05-05 19:38:05');
INSERT INTO `tbl_area` VALUES ('24', '鞍山', '3', '23', '1', '1493984285055', '2017-05-05 19:38:05');
INSERT INTO `tbl_area` VALUES ('25', '河南', '2', '1', '1', '1493984309037', '2017-05-05 19:38:29');
INSERT INTO `tbl_area` VALUES ('26', '南阳', '3', '25', '1', '1493984309040', '2017-05-05 19:38:29');
INSERT INTO `tbl_area` VALUES ('27', '陕西', '2', '1', '1', '1493984346028', '2017-05-05 19:39:06');
INSERT INTO `tbl_area` VALUES ('28', '广西', '2', '1', '1', '1493984377028', '2017-05-05 19:39:37');
INSERT INTO `tbl_area` VALUES ('29', '来宾', '3', '28', '1', '1493984377031', '2017-05-05 19:39:37');
INSERT INTO `tbl_area` VALUES ('30', '四川', '2', '1', '1', '1493984379060', '2017-05-05 19:39:39');
INSERT INTO `tbl_area` VALUES ('31', '宜宾', '3', '30', '1', '1493984379063', '2017-05-05 19:39:39');
INSERT INTO `tbl_area` VALUES ('32', '肇庆', '3', '2', '1', '1493984385032', '2017-05-05 19:39:45');
INSERT INTO `tbl_area` VALUES ('33', '沈阳', '3', '23', '1', '1493984421054', '2017-05-05 19:40:21');
INSERT INTO `tbl_area` VALUES ('34', '长沙', '3', '10', '1', '1493984446050', '2017-05-05 19:40:46');
INSERT INTO `tbl_area` VALUES ('35', '台州', '3', '13', '1', '1493984501052', '2017-05-05 19:41:41');
INSERT INTO `tbl_area` VALUES ('36', '福建', '2', '1', '1', '1493984557026', '2017-05-05 19:42:37');
INSERT INTO `tbl_area` VALUES ('37', '龙岩', '3', '36', '1', '1493984557029', '2017-05-05 19:42:37');
INSERT INTO `tbl_area` VALUES ('38', '安徽', '2', '1', '1', '1493984587056', '2017-05-05 19:43:07');
INSERT INTO `tbl_area` VALUES ('39', '宣城', '3', '38', '1', '1493984587058', '2017-05-05 19:43:07');
INSERT INTO `tbl_area` VALUES ('40', '恩施', '3', '16', '1', '1493984608236', '2017-05-05 19:43:28');
INSERT INTO `tbl_area` VALUES ('41', '眉山', '3', '30', '1', '1493984616029', '2017-05-05 19:43:36');
INSERT INTO `tbl_area` VALUES ('42', '无锡', '3', '8', '1', '1493984629149', '2017-05-05 19:43:49');
INSERT INTO `tbl_area` VALUES ('43', '成都', '3', '30', '1', '1493984651061', '2017-05-05 19:44:11');
INSERT INTO `tbl_area` VALUES ('44', '连云港', '3', '8', '1', '1493984682029', '2017-05-05 19:44:42');
INSERT INTO `tbl_area` VALUES ('45', '铁岭', '3', '23', '1', '1493984745033', '2017-05-05 19:45:45');
INSERT INTO `tbl_area` VALUES ('46', '内蒙古', '2', '1', '1', '1493984765597', '2017-05-05 19:46:05');
INSERT INTO `tbl_area` VALUES ('47', '赤峰', '3', '46', '1', '1493984765600', '2017-05-05 19:46:05');
INSERT INTO `tbl_area` VALUES ('48', '云南', '2', '1', '1', '1493984800027', '2017-05-05 19:46:40');
INSERT INTO `tbl_area` VALUES ('49', '河北', '2', '1', '1', '1493984834189', '2017-05-05 19:47:14');
INSERT INTO `tbl_area` VALUES ('50', '邢台', '3', '49', '1', '1493984834191', '2017-05-05 19:47:14');
INSERT INTO `tbl_area` VALUES ('51', '乐山', '3', '30', '1', '1493984841057', '2017-05-05 19:47:21');
INSERT INTO `tbl_area` VALUES ('52', '黔南', '3', '4', '1', '1493984855277', '2017-05-05 19:47:35');
INSERT INTO `tbl_area` VALUES ('53', '山东', '2', '1', '1', '1493984892030', '2017-05-05 19:48:12');
INSERT INTO `tbl_area` VALUES ('54', '泰安', '3', '53', '1', '1493984892032', '2017-05-05 19:48:12');
INSERT INTO `tbl_area` VALUES ('55', '杭州', '3', '13', '1', '1493984977028', '2017-05-05 19:49:37');
INSERT INTO `tbl_area` VALUES ('56', '驻马店', '3', '25', '1', '1493984980080', '2017-05-05 19:49:40');
INSERT INTO `tbl_area` VALUES ('57', '聊城', '3', '53', '1', '1493984988183', '2017-05-05 19:49:48');
INSERT INTO `tbl_area` VALUES ('58', '徐州', '3', '8', '1', '1493985026061', '2017-05-05 19:50:26');
INSERT INTO `tbl_area` VALUES ('59', '上海', '2', '1', '1', '1493985063023', '2017-05-05 19:51:03');
INSERT INTO `tbl_area` VALUES ('60', '上海', '3', '59', '1', '1493985063025', '2017-05-05 19:51:03');
INSERT INTO `tbl_area` VALUES ('61', '苏州', '3', '8', '1', '1493985069051', '2017-05-05 19:51:09');
INSERT INTO `tbl_area` VALUES ('62', '贺州', '3', '28', '1', '1493985140024', '2017-05-05 19:52:20');
INSERT INTO `tbl_area` VALUES ('63', '辽阳', '3', '23', '1', '1493985228057', '2017-05-05 19:53:48');
INSERT INTO `tbl_area` VALUES ('64', '毕节', '3', '4', '1', '1493985229053', '2017-05-05 19:53:49');
INSERT INTO `tbl_area` VALUES ('65', '池州', '3', '38', '1', '1493985270030', '2017-05-05 19:54:30');
INSERT INTO `tbl_area` VALUES ('66', '合肥', '3', '38', '1', '1493985379051', '2017-05-05 19:56:19');
INSERT INTO `tbl_area` VALUES ('67', '济南', '3', '53', '1', '1493985418030', '2017-05-05 19:56:58');
INSERT INTO `tbl_area` VALUES ('68', '中山', '3', '2', '1', '1493985420026', '2017-05-05 19:57:00');
INSERT INTO `tbl_area` VALUES ('69', '泉州', '3', '36', '1', '1493985424134', '2017-05-05 19:57:04');
INSERT INTO `tbl_area` VALUES ('70', '黑龙江', '2', '1', '1', '1493985428025', '2017-05-05 19:57:08');
INSERT INTO `tbl_area` VALUES ('71', '哈尔滨', '3', '70', '1', '1493985428028', '2017-05-05 19:57:08');
INSERT INTO `tbl_area` VALUES ('72', '甘肃', '2', '1', '1', '1493985443127', '2017-05-05 19:57:23');
INSERT INTO `tbl_area` VALUES ('73', '兰州', '3', '72', '1', '1493985443129', '2017-05-05 19:57:23');
INSERT INTO `tbl_area` VALUES ('74', '赣州', '3', '21', '1', '1493985524166', '2017-05-05 19:58:44');
INSERT INTO `tbl_area` VALUES ('75', '潍坊', '3', '53', '1', '1493985546080', '2017-05-05 19:59:06');
INSERT INTO `tbl_area` VALUES ('76', '江门', '3', '2', '1', '1493985551074', '2017-05-05 19:59:11');
INSERT INTO `tbl_area` VALUES ('77', '莆田', '3', '36', '1', '1493985671376', '2017-05-05 20:01:11');
INSERT INTO `tbl_area` VALUES ('78', '临沂', '3', '53', '1', '1493985718056', '2017-05-05 20:01:58');
INSERT INTO `tbl_area` VALUES ('79', '内江', '3', '30', '1', '1493985726278', '2017-05-05 20:02:06');
INSERT INTO `tbl_area` VALUES ('80', '山西', '2', '1', '1', '1493985728060', '2017-05-05 20:02:08');
INSERT INTO `tbl_area` VALUES ('81', '临汾', '3', '80', '1', '1493985728063', '2017-05-05 20:02:08');
INSERT INTO `tbl_area` VALUES ('82', '宁夏', '2', '1', '1', '1493985729025', '2017-05-05 20:02:09');
INSERT INTO `tbl_area` VALUES ('83', '银川', '3', '82', '1', '1493985729027', '2017-05-05 20:02:09');
INSERT INTO `tbl_area` VALUES ('84', '深圳', '3', '2', '1', '1493985758086', '2017-05-05 20:02:38');
INSERT INTO `tbl_area` VALUES ('85', '鹤壁', '3', '25', '1', '1493985798594', '2017-05-05 20:03:18');
INSERT INTO `tbl_area` VALUES ('86', '晋中', '3', '80', '1', '1493985832116', '2017-05-05 20:03:52');
INSERT INTO `tbl_area` VALUES ('87', '宜春', '3', '21', '1', '1493985909029', '2017-05-05 20:05:09');
INSERT INTO `tbl_area` VALUES ('88', '鄂尔多斯', '3', '46', '1', '1493985909095', '2017-05-05 20:05:09');
INSERT INTO `tbl_area` VALUES ('89', '黄冈', '3', '16', '1', '1493985919025', '2017-05-05 20:05:19');
INSERT INTO `tbl_area` VALUES ('90', '嘉兴', '3', '13', '1', '1493985919056', '2017-05-05 20:05:19');
INSERT INTO `tbl_area` VALUES ('91', '忻州', '3', '80', '1', '1493985969024', '2017-05-05 20:06:09');
INSERT INTO `tbl_area` VALUES ('92', '郑州', '3', '25', '1', '1493985971051', '2017-05-05 20:06:11');
INSERT INTO `tbl_area` VALUES ('93', '湛江', '3', '2', '1', '1493985974041', '2017-05-05 20:06:14');
INSERT INTO `tbl_area` VALUES ('94', '福州', '3', '36', '1', '1493986013045', '2017-05-05 20:06:53');
INSERT INTO `tbl_area` VALUES ('95', '重庆', '2', '1', '1', '1493986132026', '2017-05-05 20:08:52');
INSERT INTO `tbl_area` VALUES ('96', '重庆', '3', '95', '1', '1493986132029', '2017-05-05 20:08:52');
INSERT INTO `tbl_area` VALUES ('97', '扬州', '3', '8', '1', '1493986147024', '2017-05-05 20:09:07');
INSERT INTO `tbl_area` VALUES ('98', '西安', '3', '27', '1', '1493986162025', '2017-05-05 20:09:22');
INSERT INTO `tbl_area` VALUES ('99', '萍乡', '3', '21', '1', '1493986282031', '2017-05-05 20:11:22');
INSERT INTO `tbl_area` VALUES ('100', '日照', '3', '53', '1', '1493986326028', '2017-05-05 20:12:06');
INSERT INTO `tbl_area` VALUES ('101', '铜仁', '3', '4', '1', '1493986469165', '2017-05-05 20:14:29');
INSERT INTO `tbl_area` VALUES ('102', '濮阳', '3', '25', '1', '1493986475024', '2017-05-05 20:14:35');
INSERT INTO `tbl_area` VALUES ('103', '郴州', '3', '10', '1', '1493986481044', '2017-05-05 20:14:41');
INSERT INTO `tbl_area` VALUES ('104', '东莞', '3', '2', '1', '1493986498042', '2017-05-05 20:14:58');
INSERT INTO `tbl_area` VALUES ('105', '温州', '3', '13', '1', '1493986505026', '2017-05-05 20:15:05');
INSERT INTO `tbl_area` VALUES ('106', '吉安', '3', '21', '1', '1493986554028', '2017-05-05 20:15:54');
INSERT INTO `tbl_area` VALUES ('107', '兴安', '3', '46', '1', '1493986583031', '2017-05-05 20:16:23');
INSERT INTO `tbl_area` VALUES ('108', '盐城', '3', '8', '1', '1493986629032', '2017-05-05 20:17:09');
INSERT INTO `tbl_area` VALUES ('109', '南昌', '3', '21', '1', '1493986634190', '2017-05-05 20:17:14');
INSERT INTO `tbl_area` VALUES ('110', '惠州', '3', '2', '1', '1493986657024', '2017-05-05 20:17:37');
INSERT INTO `tbl_area` VALUES ('111', '红河', '3', '48', '1', '1493986698099', '2017-05-05 20:18:18');
INSERT INTO `tbl_area` VALUES ('112', '青岛', '3', '53', '1', '1493986773057', '2017-05-05 20:19:33');
INSERT INTO `tbl_area` VALUES ('113', '昭通', '3', '48', '1', '1493986798063', '2017-05-05 20:19:58');
INSERT INTO `tbl_area` VALUES ('114', '安阳', '3', '25', '1', '1493986830027', '2017-05-05 20:20:30');
INSERT INTO `tbl_area` VALUES ('115', '焦作', '3', '25', '1', '1493986849057', '2017-05-05 20:20:49');
INSERT INTO `tbl_area` VALUES ('116', '抚顺', '3', '23', '1', '1493987006171', '2017-05-05 20:23:26');
INSERT INTO `tbl_area` VALUES ('117', '新乡', '3', '25', '1', '1493987014026', '2017-05-05 20:23:34');
INSERT INTO `tbl_area` VALUES ('118', '烟台', '3', '53', '1', '1493987016098', '2017-05-05 20:23:36');
INSERT INTO `tbl_area` VALUES ('119', '潮州', '3', '2', '1', '1493987152026', '2017-05-05 20:25:52');
INSERT INTO `tbl_area` VALUES ('120', '茂名', '3', '2', '1', '1493987243065', '2017-05-05 20:27:23');
INSERT INTO `tbl_area` VALUES ('121', '南通', '3', '8', '1', '1493987273042', '2017-05-05 20:27:53');
INSERT INTO `tbl_area` VALUES ('122', '十堰', '3', '16', '1', '1493987317060', '2017-05-05 20:28:37');
INSERT INTO `tbl_area` VALUES ('123', '保定', '3', '49', '1', '1493987334335', '2017-05-05 20:28:54');
INSERT INTO `tbl_area` VALUES ('124', '济宁', '3', '53', '1', '1493987486491', '2017-05-05 20:31:26');
INSERT INTO `tbl_area` VALUES ('125', '黑河', '3', '70', '1', '1493987590026', '2017-05-05 20:33:10');
INSERT INTO `tbl_area` VALUES ('126', '安顺', '3', '4', '1', '1493987641025', '2017-05-05 20:34:01');
INSERT INTO `tbl_area` VALUES ('127', '葫芦岛', '3', '23', '1', '1493987701026', '2017-05-05 20:35:01');
INSERT INTO `tbl_area` VALUES ('128', '常州', '3', '8', '1', '1493987712145', '2017-05-05 20:35:12');
INSERT INTO `tbl_area` VALUES ('129', '昆明', '3', '48', '1', '1493987722024', '2017-05-05 20:35:22');
INSERT INTO `tbl_area` VALUES ('130', '菏泽', '3', '53', '1', '1493987779025', '2017-05-05 20:36:19');
INSERT INTO `tbl_area` VALUES ('131', '邯郸', '3', '49', '1', '1493987858074', '2017-05-05 20:37:38');
INSERT INTO `tbl_area` VALUES ('132', '玉林', '3', '28', '1', '1493988101048', '2017-05-05 20:41:41');
INSERT INTO `tbl_area` VALUES ('133', '漯河', '3', '25', '1', '1493988165040', '2017-05-05 20:42:45');
INSERT INTO `tbl_area` VALUES ('134', '石家庄', '3', '49', '1', '1493988232026', '2017-05-05 20:43:52');
INSERT INTO `tbl_area` VALUES ('135', '南充', '3', '30', '1', '1493988262194', '2017-05-05 20:44:22');
INSERT INTO `tbl_area` VALUES ('136', '汕头', '3', '2', '1', '1493988276107', '2017-05-05 20:44:36');
INSERT INTO `tbl_area` VALUES ('137', '达州', '3', '30', '1', '1493988332064', '2017-05-05 20:45:32');
INSERT INTO `tbl_area` VALUES ('138', '桂林', '3', '28', '1', '1493988445053', '2017-05-05 20:47:25');
INSERT INTO `tbl_area` VALUES ('139', '三门峡', '3', '25', '1', '1493988492029', '2017-05-05 20:48:12');
INSERT INTO `tbl_area` VALUES ('140', '梅州', '3', '2', '1', '1493988743047', '2017-05-05 20:52:23');
INSERT INTO `tbl_area` VALUES ('141', '营口', '3', '23', '1', '1493988782054', '2017-05-05 20:53:02');
INSERT INTO `tbl_area` VALUES ('142', '天津', '2', '1', '1', '1493988803117', '2017-05-05 20:53:23');
INSERT INTO `tbl_area` VALUES ('143', '天津', '3', '142', '1', '1493988803120', '2017-05-05 20:53:23');
INSERT INTO `tbl_area` VALUES ('144', '开封', '3', '25', '1', '1493988838049', '2017-05-05 20:53:58');
INSERT INTO `tbl_area` VALUES ('145', '咸阳', '3', '27', '1', '1493988848051', '2017-05-05 20:54:08');
INSERT INTO `tbl_area` VALUES ('146', '泰州', '3', '8', '1', '1493988882026', '2017-05-05 20:54:42');
INSERT INTO `tbl_area` VALUES ('147', '沧州', '3', '49', '1', '1493988978055', '2017-05-05 20:56:18');
INSERT INTO `tbl_area` VALUES ('148', '衡阳', '3', '10', '1', '1493988990078', '2017-05-05 20:56:30');
INSERT INTO `tbl_area` VALUES ('149', '绵阳', '3', '30', '1', '1493989003048', '2017-05-05 20:56:43');
INSERT INTO `tbl_area` VALUES ('150', '长治', '3', '80', '1', '1493989050086', '2017-05-05 20:57:30');
INSERT INTO `tbl_area` VALUES ('151', '丽江', '3', '48', '1', '1493989151030', '2017-05-05 20:59:11');
INSERT INTO `tbl_area` VALUES ('152', '大连', '3', '23', '1', '1493989216060', '2017-05-05 21:00:16');
INSERT INTO `tbl_area` VALUES ('153', '南宁', '3', '28', '1', '1493989261023', '2017-05-05 21:01:01');
INSERT INTO `tbl_area` VALUES ('154', '渭南', '3', '27', '1', '1493989341023', '2017-05-05 21:02:21');
INSERT INTO `tbl_area` VALUES ('155', '贵港', '3', '28', '1', '1493989388026', '2017-05-05 21:03:08');
INSERT INTO `tbl_area` VALUES ('156', '呼伦贝尔', '3', '46', '1', '1493989408118', '2017-05-05 21:03:28');
INSERT INTO `tbl_area` VALUES ('157', '上饶', '3', '21', '1', '1493989416029', '2017-05-05 21:03:36');
INSERT INTO `tbl_area` VALUES ('158', '安康', '3', '27', '1', '1493989502030', '2017-05-05 21:05:02');
INSERT INTO `tbl_area` VALUES ('159', '自贡', '3', '30', '1', '1493989515025', '2017-05-05 21:05:15');
INSERT INTO `tbl_area` VALUES ('160', '黄石', '3', '16', '1', '1493989560064', '2017-05-05 21:06:00');
INSERT INTO `tbl_area` VALUES ('161', '商丘', '3', '25', '1', '1493990157053', '2017-05-05 21:15:57');
INSERT INTO `tbl_area` VALUES ('162', '滁州', '3', '38', '1', '1493990336086', '2017-05-05 21:18:56');
INSERT INTO `tbl_area` VALUES ('163', '齐齐哈尔', '3', '70', '1', '1493990497021', '2017-05-05 21:21:37');
INSERT INTO `tbl_area` VALUES ('164', '太原', '3', '80', '1', '1493990578051', '2017-05-05 21:22:58');
INSERT INTO `tbl_area` VALUES ('165', '黔西南', '3', '4', '1', '1493990580028', '2017-05-05 21:23:00');
INSERT INTO `tbl_area` VALUES ('166', '延安', '3', '27', '1', '1493990779090', '2017-05-05 21:26:19');
INSERT INTO `tbl_area` VALUES ('167', '益阳', '3', '10', '1', '1493990803027', '2017-05-05 21:26:43');
INSERT INTO `tbl_area` VALUES ('168', '大同', '3', '80', '1', '1493990812023', '2017-05-05 21:26:52');
INSERT INTO `tbl_area` VALUES ('169', '常德', '3', '10', '1', '1493990832135', '2017-05-05 21:27:12');
INSERT INTO `tbl_area` VALUES ('170', '湖州', '3', '13', '1', '1493990862055', '2017-05-05 21:27:42');
INSERT INTO `tbl_area` VALUES ('171', '湘潭', '3', '10', '1', '1493990966052', '2017-05-05 21:29:26');
INSERT INTO `tbl_area` VALUES ('172', '迪庆', '3', '48', '1', '1493991001051', '2017-05-05 21:30:01');
INSERT INTO `tbl_area` VALUES ('173', '锦州', '3', '23', '1', '1493991028026', '2017-05-05 21:30:28');
INSERT INTO `tbl_area` VALUES ('174', '绍兴', '3', '13', '1', '1493991209086', '2017-05-05 21:33:29');
INSERT INTO `tbl_area` VALUES ('175', '枣庄', '3', '53', '1', '1493991329123', '2017-05-05 21:35:29');
INSERT INTO `tbl_area` VALUES ('176', '德阳', '3', '30', '1', '1493991373049', '2017-05-05 21:36:13');
INSERT INTO `tbl_area` VALUES ('177', '洛阳', '3', '25', '1', '1493991404026', '2017-05-05 21:36:44');
INSERT INTO `tbl_area` VALUES ('178', '吉林', '2', '1', '1', '1493991722050', '2017-05-05 21:42:02');
INSERT INTO `tbl_area` VALUES ('179', '四平', '3', '178', '1', '1493991722053', '2017-05-05 21:42:02');
INSERT INTO `tbl_area` VALUES ('180', '滨州', '3', '53', '1', '1493991772053', '2017-05-05 21:42:52');
INSERT INTO `tbl_area` VALUES ('181', '湘西', '3', '10', '1', '1493991859083', '2017-05-05 21:44:19');
INSERT INTO `tbl_area` VALUES ('182', '资阳', '3', '30', '1', '1493991863047', '2017-05-05 21:44:23');
INSERT INTO `tbl_area` VALUES ('183', '淄博', '3', '53', '1', '1493991886088', '2017-05-05 21:44:46');
INSERT INTO `tbl_area` VALUES ('184', '河源', '3', '2', '1', '1493991926049', '2017-05-05 21:45:26');
INSERT INTO `tbl_area` VALUES ('185', '东营', '3', '53', '1', '1493992102050', '2017-05-05 21:48:22');
INSERT INTO `tbl_area` VALUES ('186', '鸡西', '3', '70', '1', '1493992312023', '2017-05-05 21:51:52');
INSERT INTO `tbl_area` VALUES ('187', '岳阳', '3', '10', '1', '1493992356060', '2017-05-05 21:52:36');
INSERT INTO `tbl_area` VALUES ('188', '平顶山', '3', '25', '1', '1493992392050', '2017-05-05 21:53:12');
INSERT INTO `tbl_area` VALUES ('189', '北海', '3', '28', '1', '1493992534025', '2017-05-05 21:55:34');
INSERT INTO `tbl_area` VALUES ('190', '秦皇岛', '3', '49', '1', '1493992616051', '2017-05-05 21:56:56');
INSERT INTO `tbl_area` VALUES ('191', '长春', '3', '178', '1', '1493992709128', '2017-05-05 21:58:29');
INSERT INTO `tbl_area` VALUES ('192', '青海', '2', '1', '1', '1493992930025', '2017-05-05 22:02:10');
INSERT INTO `tbl_area` VALUES ('193', '西宁', '3', '192', '1', '1493992930027', '2017-05-05 22:02:10');
INSERT INTO `tbl_area` VALUES ('194', '衡水', '3', '49', '1', '1493992991026', '2017-05-05 22:03:11');
INSERT INTO `tbl_area` VALUES ('195', '白山', '3', '178', '1', '1493992998026', '2017-05-05 22:03:18');
INSERT INTO `tbl_area` VALUES ('196', '马鞍山', '3', '38', '1', '1493993101027', '2017-05-05 22:05:01');
INSERT INTO `tbl_area` VALUES ('197', '娄底', '3', '10', '1', '1493993244026', '2017-05-05 22:07:24');
INSERT INTO `tbl_area` VALUES ('198', '阳江', '3', '2', '1', '1493993283134', '2017-05-05 22:08:03');
INSERT INTO `tbl_area` VALUES ('199', '雅安', '3', '30', '1', '1493993284057', '2017-05-05 22:08:04');
INSERT INTO `tbl_area` VALUES ('200', '厦门', '3', '36', '1', '1493993338025', '2017-05-05 22:08:58');
INSERT INTO `tbl_area` VALUES ('201', '黄南', '3', '192', '1', '1493993362091', '2017-05-05 22:09:22');
INSERT INTO `tbl_area` VALUES ('202', '廊坊', '3', '49', '1', '1493993503051', '2017-05-05 22:11:43');
INSERT INTO `tbl_area` VALUES ('203', '淮安', '3', '8', '1', '1493993755048', '2017-05-05 22:15:55');
INSERT INTO `tbl_area` VALUES ('204', '凉山', '3', '30', '1', '1493993759025', '2017-05-05 22:15:59');
INSERT INTO `tbl_area` VALUES ('205', '信阳', '3', '25', '1', '1493993759067', '2017-05-05 22:15:59');
INSERT INTO `tbl_area` VALUES ('206', '揭阳', '3', '2', '1', '1493993900259', '2017-05-05 22:18:20');
INSERT INTO `tbl_area` VALUES ('207', '河池', '3', '28', '1', '1493993973084', '2017-05-05 22:19:33');
INSERT INTO `tbl_area` VALUES ('208', '乌兰察布', '3', '46', '1', '1493994041056', '2017-05-05 22:20:41');
INSERT INTO `tbl_area` VALUES ('209', '遂宁', '3', '30', '1', '1493994051025', '2017-05-05 22:20:51');
INSERT INTO `tbl_area` VALUES ('210', '宝鸡', '3', '27', '1', '1493994081053', '2017-05-05 22:21:21');
INSERT INTO `tbl_area` VALUES ('211', '丽水', '3', '13', '1', '1493994271055', '2017-05-05 22:24:31');
INSERT INTO `tbl_area` VALUES ('212', '大庆', '3', '70', '1', '1493994301053', '2017-05-05 22:25:01');
INSERT INTO `tbl_area` VALUES ('213', '丹东', '3', '23', '1', '1493994311028', '2017-05-05 22:25:11');
INSERT INTO `tbl_area` VALUES ('214', '许昌', '3', '25', '1', '1493994496027', '2017-05-05 22:28:16');
INSERT INTO `tbl_area` VALUES ('215', '宜昌', '3', '16', '1', '1493994517053', '2017-05-05 22:28:37');
INSERT INTO `tbl_area` VALUES ('216', '吴忠', '3', '82', '1', '1493994658025', '2017-05-05 22:30:58');
INSERT INTO `tbl_area` VALUES ('217', '朝阳', '3', '23', '1', '1493994809051', '2017-05-05 22:33:29');
INSERT INTO `tbl_area` VALUES ('218', '承德', '3', '49', '1', '1493995043050', '2017-05-05 22:37:23');
INSERT INTO `tbl_area` VALUES ('219', '百色', '3', '28', '1', '1493995115091', '2017-05-05 22:38:35');
INSERT INTO `tbl_area` VALUES ('220', '宿州', '3', '38', '1', '1493995418028', '2017-05-05 22:43:38');
INSERT INTO `tbl_area` VALUES ('221', '吕梁', '3', '80', '1', '1493995456026', '2017-05-05 22:44:16');
INSERT INTO `tbl_area` VALUES ('222', '运城', '3', '80', '1', '1493995535026', '2017-05-05 22:45:35');
INSERT INTO `tbl_area` VALUES ('223', '新疆', '2', '1', '1', '1493995631024', '2017-05-05 22:47:11');
INSERT INTO `tbl_area` VALUES ('224', '石河子', '3', '223', '1', '1493995631026', '2017-05-05 22:47:11');
INSERT INTO `tbl_area` VALUES ('225', '安庆', '3', '38', '1', '1493995789027', '2017-05-05 22:49:49');
INSERT INTO `tbl_area` VALUES ('226', '南平', '3', '36', '1', '1493995918023', '2017-05-05 22:51:58');
INSERT INTO `tbl_area` VALUES ('227', '大理', '3', '48', '1', '1493995960054', '2017-05-05 22:52:40');
INSERT INTO `tbl_area` VALUES ('228', '威海', '3', '53', '1', '1493996030048', '2017-05-05 22:53:50');
INSERT INTO `tbl_area` VALUES ('229', '济源', '4', '115', '1', '1493996312049', '2017-05-05 22:58:32');
INSERT INTO `tbl_area` VALUES ('230', '宁德', '3', '36', '1', '1493996563047', '2017-05-05 23:02:43');
INSERT INTO `tbl_area` VALUES ('231', '庆阳', '3', '72', '1', '1493996645052', '2017-05-05 23:04:05');
INSERT INTO `tbl_area` VALUES ('232', '广安', '3', '30', '1', '1493996689130', '2017-05-05 23:04:49');
INSERT INTO `tbl_area` VALUES ('233', '金华', '3', '13', '1', '1493996834024', '2017-05-05 23:07:14');
INSERT INTO `tbl_area` VALUES ('234', '武威', '3', '72', '1', '1493996891054', '2017-05-05 23:08:11');
INSERT INTO `tbl_area` VALUES ('235', '白银', '3', '72', '1', '1493997499024', '2017-05-05 23:18:19');
INSERT INTO `tbl_area` VALUES ('236', '乌海', '3', '46', '1', '1493997569051', '2017-05-05 23:19:29');
INSERT INTO `tbl_area` VALUES ('237', '榆林', '3', '27', '1', '1493997678088', '2017-05-05 23:21:18');
INSERT INTO `tbl_area` VALUES ('238', '阿坝', '3', '30', '1', '1493997767069', '2017-05-05 23:22:47');
INSERT INTO `tbl_area` VALUES ('239', '柳州', '3', '28', '1', '1493998406101', '2017-05-05 23:33:26');
INSERT INTO `tbl_area` VALUES ('240', '吉林市', '3', '178', '1', '1493998560105', '2017-05-05 23:36:00');
INSERT INTO `tbl_area` VALUES ('241', '巴音郭楞', '3', '223', '1', '1493998668030', '2017-05-05 23:37:48');
INSERT INTO `tbl_area` VALUES ('242', '周口', '3', '25', '1', '1493998875025', '2017-05-05 23:41:15');
INSERT INTO `tbl_area` VALUES ('243', '黔东南', '3', '4', '1', '1493999243048', '2017-05-05 23:47:23');
INSERT INTO `tbl_area` VALUES ('244', '德州', '3', '53', '1', '1493999420025', '2017-05-05 23:50:20');
INSERT INTO `tbl_area` VALUES ('245', '和田', '3', '223', '1', '1493999446053', '2017-05-05 23:50:46');
INSERT INTO `tbl_area` VALUES ('246', '乌鲁木齐', '3', '223', '1', '1493999462026', '2017-05-05 23:51:02');
INSERT INTO `tbl_area` VALUES ('247', '汉中', '3', '27', '1', '1493999511049', '2017-05-05 23:51:51');
INSERT INTO `tbl_area` VALUES ('248', '喀什', '3', '223', '1', '1493999748027', '2017-05-05 23:55:48');
INSERT INTO `tbl_area` VALUES ('249', '怀化', '3', '10', '1', '1493999817024', '2017-05-05 23:56:57');
INSERT INTO `tbl_area` VALUES ('250', '钦州', '3', '28', '1', '1493999996056', '2017-05-05 23:59:56');
INSERT INTO `tbl_area` VALUES ('251', '曲靖', '3', '48', '1', '1494000108024', '2017-05-06 00:01:48');
INSERT INTO `tbl_area` VALUES ('252', '淮北', '3', '38', '1', '1494000505167', '2017-05-06 00:08:25');
INSERT INTO `tbl_area` VALUES ('253', '海南', '2', '1', '1', '1494000515023', '2017-05-06 00:08:35');
INSERT INTO `tbl_area` VALUES ('254', '海口', '3', '253', '1', '1494000515026', '2017-05-06 00:08:35');
INSERT INTO `tbl_area` VALUES ('255', '克拉玛依', '3', '223', '1', '1494001981120', '2017-05-06 00:33:01');
INSERT INTO `tbl_area` VALUES ('256', '博尔塔拉', '3', '223', '1', '1494002346059', '2017-05-06 00:39:06');
INSERT INTO `tbl_area` VALUES ('257', '晋城', '3', '80', '1', '1494003024105', '2017-05-06 00:50:24');
INSERT INTO `tbl_area` VALUES ('258', '德宏', '3', '48', '1', '1494003107029', '2017-05-06 00:51:47');
INSERT INTO `tbl_area` VALUES ('259', '珠海', '3', '2', '1', '1494003227025', '2017-05-06 00:53:47');
INSERT INTO `tbl_area` VALUES ('260', '阳泉', '3', '80', '1', '1494003610053', '2017-05-06 01:00:10');
INSERT INTO `tbl_area` VALUES ('261', '唐山', '3', '49', '1', '1494004477054', '2017-05-06 01:14:37');
INSERT INTO `tbl_area` VALUES ('262', '包头', '3', '46', '1', '1494004624025', '2017-05-06 01:17:04');
INSERT INTO `tbl_area` VALUES ('263', '襄阳', '3', '16', '1', '1494005018052', '2017-05-06 01:23:38');
INSERT INTO `tbl_area` VALUES ('264', '泸州', '3', '30', '1', '1494005177027', '2017-05-06 01:26:17');
INSERT INTO `tbl_area` VALUES ('265', '巴彦淖尔', '3', '46', '1', '1494005279047', '2017-05-06 01:27:59');
INSERT INTO `tbl_area` VALUES ('266', '昌吉', '3', '223', '1', '1494006920023', '2017-05-06 01:55:20');
INSERT INTO `tbl_area` VALUES ('267', '三亚', '3', '253', '1', '1494011054027', '2017-05-06 03:04:14');
INSERT INTO `tbl_area` VALUES ('268', '澄迈', '4', '267', '1', '1494011054036', '2017-05-06 03:04:14');
INSERT INTO `tbl_area` VALUES ('269', '阜阳', '3', '38', '1', '1494012575024', '2017-05-06 03:29:35');
INSERT INTO `tbl_area` VALUES ('270', '佳木斯', '3', '70', '1', '1494015227054', '2017-05-06 04:13:47');
INSERT INTO `tbl_area` VALUES ('271', '云浮', '3', '2', '1', '1494017933052', '2017-05-06 04:58:53');
INSERT INTO `tbl_area` VALUES ('272', '牡丹江', '3', '70', '1', '1494019546022', '2017-05-06 05:25:46');
INSERT INTO `tbl_area` VALUES ('273', '神农架', '3', '16', '1', '1494019745061', '2017-05-06 05:29:05');
INSERT INTO `tbl_area` VALUES ('274', '天门', '4', '273', '1', '1494019745064', '2017-05-06 05:29:05');
INSERT INTO `tbl_area` VALUES ('275', '随州', '3', '16', '1', '1494020025047', '2017-05-06 05:33:45');
INSERT INTO `tbl_area` VALUES ('276', '淮南', '3', '38', '1', '1494020973084', '2017-05-06 05:49:33');
INSERT INTO `tbl_area` VALUES ('277', '松原', '3', '178', '1', '1494021324025', '2017-05-06 05:55:24');
INSERT INTO `tbl_area` VALUES ('278', '邵阳', '3', '10', '1', '1494022609024', '2017-05-06 06:16:49');
INSERT INTO `tbl_area` VALUES ('279', '梧州', '3', '28', '1', '1494022716049', '2017-05-06 06:18:36');
INSERT INTO `tbl_area` VALUES ('280', '陇南', '3', '72', '1', '1494023241054', '2017-05-06 06:27:21');
INSERT INTO `tbl_area` VALUES ('281', '荆州', '3', '16', '1', '1494023693022', '2017-05-06 06:34:53');
INSERT INTO `tbl_area` VALUES ('282', '陵水', '4', '267', '1', '1494024019055', '2017-05-06 06:40:19');
INSERT INTO `tbl_area` VALUES ('283', '咸宁', '3', '16', '1', '1494024220023', '2017-05-06 06:43:40');
INSERT INTO `tbl_area` VALUES ('284', '白城', '3', '178', '1', '1494024336053', '2017-05-06 06:45:36');
INSERT INTO `tbl_area` VALUES ('285', '呼和浩特', '3', '46', '1', '1494024840179', '2017-05-06 06:54:00');
INSERT INTO `tbl_area` VALUES ('286', '塔城', '3', '223', '1', '1494025169105', '2017-05-06 06:59:29');
INSERT INTO `tbl_area` VALUES ('287', '本溪', '3', '23', '1', '1494026204026', '2017-05-06 07:16:44');
INSERT INTO `tbl_area` VALUES ('288', '通辽', '3', '46', '1', '1494026423025', '2017-05-06 07:20:23');
INSERT INTO `tbl_area` VALUES ('289', '亳州', '3', '38', '1', '1494026532182', '2017-05-06 07:22:12');
INSERT INTO `tbl_area` VALUES ('290', '三明', '3', '36', '1', '1494027241099', '2017-05-06 07:34:01');
INSERT INTO `tbl_area` VALUES ('291', '汕尾', '3', '2', '1', '1494027428050', '2017-05-06 07:37:08');
INSERT INTO `tbl_area` VALUES ('292', '永州', '3', '10', '1', '1494027824054', '2017-05-06 07:43:44');
INSERT INTO `tbl_area` VALUES ('293', '思茅', '3', '48', '1', '1494028479024', '2017-05-06 07:54:39');
INSERT INTO `tbl_area` VALUES ('294', '普洱', '4', '293', '1', '1494028479026', '2017-05-06 07:54:39');
INSERT INTO `tbl_area` VALUES ('295', '巴中', '3', '30', '1', '1494029156024', '2017-05-06 08:05:56');
INSERT INTO `tbl_area` VALUES ('296', '伊春', '3', '70', '1', '1494029470025', '2017-05-06 08:11:10');
INSERT INTO `tbl_area` VALUES ('297', '莱芜', '3', '53', '1', '1494029522023', '2017-05-06 08:12:02');
INSERT INTO `tbl_area` VALUES ('298', '阜新', '3', '23', '1', '1494029786190', '2017-05-06 08:16:26');
INSERT INTO `tbl_area` VALUES ('299', '固原', '3', '82', '1', '1494031309053', '2017-05-06 08:41:49');
INSERT INTO `tbl_area` VALUES ('300', '盘锦', '3', '23', '1', '1494031829052', '2017-05-06 08:50:29');
INSERT INTO `tbl_area` VALUES ('301', '锡林郭勒', '3', '46', '1', '1494032237053', '2017-05-06 08:57:17');
INSERT INTO `tbl_area` VALUES ('302', '新余', '3', '21', '1', '1494033379080', '2017-05-06 09:16:19');
INSERT INTO `tbl_area` VALUES ('303', '孝感', '3', '16', '1', '1494033478061', '2017-05-06 09:17:58');
INSERT INTO `tbl_area` VALUES ('304', '蚌埠', '3', '38', '1', '1494033950048', '2017-05-06 09:25:50');
INSERT INTO `tbl_area` VALUES ('305', '崇左', '3', '28', '1', '1494034432066', '2017-05-06 09:33:52');
INSERT INTO `tbl_area` VALUES ('306', '嘉峪关', '3', '72', '1', '1494034534025', '2017-05-06 09:35:34');
INSERT INTO `tbl_area` VALUES ('307', '朔州', '3', '80', '1', '1494034566025', '2017-05-06 09:36:06');
INSERT INTO `tbl_area` VALUES ('308', '阿拉善', '3', '46', '1', '1494034593092', '2017-05-06 09:36:33');
INSERT INTO `tbl_area` VALUES ('309', '双鸭山', '3', '70', '1', '1494034597024', '2017-05-06 09:36:37');
INSERT INTO `tbl_area` VALUES ('310', '石嘴山', '3', '82', '1', '1494034903051', '2017-05-06 09:41:43');
INSERT INTO `tbl_area` VALUES ('311', '鹰潭', '3', '21', '1', '1494035351058', '2017-05-06 09:49:11');
INSERT INTO `tbl_area` VALUES ('312', '西双版纳', '3', '48', '1', '1494035533021', '2017-05-06 09:52:13');
INSERT INTO `tbl_area` VALUES ('313', '绥化', '3', '70', '1', '1494035879026', '2017-05-06 09:57:59');
INSERT INTO `tbl_area` VALUES ('314', '六安', '3', '38', '1', '1494035954072', '2017-05-06 09:59:14');
INSERT INTO `tbl_area` VALUES ('315', '海西', '3', '192', '1', '1494036361083', '2017-05-06 10:06:01');
INSERT INTO `tbl_area` VALUES ('316', '吐鲁番', '3', '223', '1', '1494036934049', '2017-05-06 10:15:34');
INSERT INTO `tbl_area` VALUES ('317', '景德镇', '3', '21', '1', '1494036961059', '2017-05-06 10:16:01');
INSERT INTO `tbl_area` VALUES ('318', '哈密', '3', '223', '1', '1494037785048', '2017-05-06 10:29:45');
INSERT INTO `tbl_area` VALUES ('319', '六盘水', '3', '4', '1', '1494037889052', '2017-05-06 10:31:29');
INSERT INTO `tbl_area` VALUES ('320', '酒泉', '3', '72', '1', '1494038503063', '2017-05-06 10:41:43');
INSERT INTO `tbl_area` VALUES ('321', '仙桃', '4', '273', '1', '1494038774054', '2017-05-06 10:46:14');
INSERT INTO `tbl_area` VALUES ('322', '儋州', '4', '267', '1', '1494042263026', '2017-05-06 11:44:23');
INSERT INTO `tbl_area` VALUES ('323', '衢州', '3', '13', '1', '1494042590022', '2017-05-06 11:49:50');
INSERT INTO `tbl_area` VALUES ('324', '漳州', '3', '36', '1', '1494043453027', '2017-05-06 12:04:13');
INSERT INTO `tbl_area` VALUES ('325', '韩国', '1', '0', '1', '1494045369046', '2017-05-06 12:36:09');
INSERT INTO `tbl_area` VALUES ('326', '临夏', '3', '72', '1', '1494045593024', '2017-05-06 12:39:53');
INSERT INTO `tbl_area` VALUES ('327', '张家界', '3', '10', '1', '1494045658032', '2017-05-06 12:40:58');
INSERT INTO `tbl_area` VALUES ('328', '攀枝花', '3', '30', '1', '1494045718026', '2017-05-06 12:41:58');
INSERT INTO `tbl_area` VALUES ('329', '张家口', '3', '49', '1', '1494047066051', '2017-05-06 13:04:26');
INSERT INTO `tbl_area` VALUES ('330', '抚州', '3', '21', '1', '1494047423025', '2017-05-06 13:10:23');
INSERT INTO `tbl_area` VALUES ('331', '怒江', '3', '48', '1', '1494048171052', '2017-05-06 13:22:51');
INSERT INTO `tbl_area` VALUES ('332', '通化', '3', '178', '1', '1494048779050', '2017-05-06 13:32:59');
INSERT INTO `tbl_area` VALUES ('333', '荆门', '3', '16', '1', '1494048820062', '2017-05-06 13:33:40');
INSERT INTO `tbl_area` VALUES ('334', '东方', '4', '267', '1', '1494049538050', '2017-05-06 13:45:38');
INSERT INTO `tbl_area` VALUES ('335', '商洛', '3', '27', '1', '1494049974026', '2017-05-06 13:52:54');
INSERT INTO `tbl_area` VALUES ('336', '海东', '3', '192', '1', '1494050055029', '2017-05-06 13:54:15');
INSERT INTO `tbl_area` VALUES ('337', '楚雄', '3', '48', '1', '1494052134062', '2017-05-06 14:28:54');
INSERT INTO `tbl_area` VALUES ('338', '韶关', '3', '2', '1', '1494052881024', '2017-05-06 14:41:21');
INSERT INTO `tbl_area` VALUES ('339', '延边', '3', '178', '1', '1494054351065', '2017-05-06 15:05:51');
INSERT INTO `tbl_area` VALUES ('340', '平凉', '3', '72', '1', '1494054987025', '2017-05-06 15:16:27');
INSERT INTO `tbl_area` VALUES ('341', '伊犁', '3', '223', '1', '1494057462116', '2017-05-06 15:57:42');
INSERT INTO `tbl_area` VALUES ('342', '芜湖', '3', '38', '1', '1494057966054', '2017-05-06 16:06:06');
INSERT INTO `tbl_area` VALUES ('343', '广元', '3', '30', '1', '1494058977050', '2017-05-06 16:22:57');
INSERT INTO `tbl_area` VALUES ('344', '大兴安岭', '3', '70', '1', '1494059685027', '2017-05-06 16:34:45');
INSERT INTO `tbl_area` VALUES ('345', '七台河', '3', '70', '1', '1494061023028', '2017-05-06 16:57:03');
INSERT INTO `tbl_area` VALUES ('346', '铜陵', '3', '38', '1', '1494061191027', '2017-05-06 16:59:51');
INSERT INTO `tbl_area` VALUES ('347', '张掖', '3', '72', '1', '1494061346059', '2017-05-06 17:02:26');
INSERT INTO `tbl_area` VALUES ('348', '清远', '3', '2', '1', '1494061471023', '2017-05-06 17:04:31');
INSERT INTO `tbl_area` VALUES ('349', '保山', '3', '48', '1', '1494062516053', '2017-05-06 17:21:56');
INSERT INTO `tbl_area` VALUES ('350', '天水', '3', '72', '1', '1494064967026', '2017-05-06 18:02:47');
INSERT INTO `tbl_area` VALUES ('351', '甘孜', '3', '30', '1', '1494065093053', '2017-05-06 18:04:53');
INSERT INTO `tbl_area` VALUES ('352', '文山', '3', '48', '1', '1494065598032', '2017-05-06 18:13:18');
INSERT INTO `tbl_area` VALUES ('353', '阿勒泰', '3', '223', '1', '1494067274026', '2017-05-06 18:41:14');
INSERT INTO `tbl_area` VALUES ('354', '越南', '1', '0', '1', '1494071888050', '2017-05-06 19:58:08');
INSERT INTO `tbl_area` VALUES ('355', '阿克苏', '3', '223', '1', '1494075395057', '2017-05-06 20:56:35');
INSERT INTO `tbl_area` VALUES ('356', '马来西亚', '1', '0', '1', '1494076375058', '2017-05-06 21:12:55');
INSERT INTO `tbl_area` VALUES ('357', '辽源', '3', '178', '1', '1494078597026', '2017-05-06 21:49:57');
INSERT INTO `tbl_area` VALUES ('358', '西藏', '2', '1', '1', '1494079369028', '2017-05-06 22:02:49');
INSERT INTO `tbl_area` VALUES ('359', '拉萨', '3', '358', '1', '1494079369030', '2017-05-06 22:02:49');
INSERT INTO `tbl_area` VALUES ('360', '乐东', '4', '267', '1', '1494081426156', '2017-05-06 22:37:06');
INSERT INTO `tbl_area` VALUES ('361', '黄山', '3', '38', '1', '1494108885028', '2017-05-07 06:14:45');
INSERT INTO `tbl_area` VALUES ('362', '文昌', '4', '267', '1', '1494110737082', '2017-05-07 06:45:37');
INSERT INTO `tbl_area` VALUES ('363', '鄂州', '3', '16', '1', '1494110790054', '2017-05-07 06:46:30');
INSERT INTO `tbl_area` VALUES ('364', '玉溪', '3', '48', '1', '1494111722030', '2017-05-07 07:02:02');
INSERT INTO `tbl_area` VALUES ('365', '定西', '3', '72', '1', '1494115720050', '2017-05-07 08:08:40');
INSERT INTO `tbl_area` VALUES ('366', '香港', '2', '1', '1', '1494115880054', '2017-05-07 08:11:20');
INSERT INTO `tbl_area` VALUES ('367', '台湾', '2', '1', '1', '1494121693050', '2017-05-07 09:48:13');
INSERT INTO `tbl_area` VALUES ('368', '台中市', '3', '367', '1', '1494121693053', '2017-05-07 09:48:13');
INSERT INTO `tbl_area` VALUES ('369', '金昌', '3', '72', '1', '1494130643054', '2017-05-07 12:17:23');
INSERT INTO `tbl_area` VALUES ('370', '琼中', '4', '267', '1', '1494130725052', '2017-05-07 12:18:45');
INSERT INTO `tbl_area` VALUES ('371', '鹤岗', '3', '70', '1', '1494140985050', '2017-05-07 15:09:45');
INSERT INTO `tbl_area` VALUES ('372', '临沧', '3', '48', '1', '1494151191029', '2017-05-07 17:59:51');
INSERT INTO `tbl_area` VALUES ('373', '中卫', '3', '82', '1', '1494153759058', '2017-05-07 18:42:39');
INSERT INTO `tbl_area` VALUES ('374', '琼海', '4', '267', '1', '1494154351027', '2017-05-07 18:52:31');
INSERT INTO `tbl_area` VALUES ('375', '右江', '4', '219', '1', '1494172181011', '2017-05-07 23:46:40');
INSERT INTO `tbl_area` VALUES ('376', '西昌', '4', '204', '1', '1494172390089', '2017-05-07 23:50:09');
INSERT INTO `tbl_area` VALUES ('377', '潜江', '4', '273', '1', '1494172495478', '2017-05-07 23:51:55');
INSERT INTO `tbl_area` VALUES ('378', '桃源', '4', '169', '1', '1494172865738', '2017-05-07 23:58:05');
INSERT INTO `tbl_area` VALUES ('379', '新加坡', '1', '0', '1', '1494174119941', '2017-05-08 00:18:59');
INSERT INTO `tbl_area` VALUES ('380', '新加坡', '2', '379', '1', '1494174119995', '2017-05-08 00:18:59');
INSERT INTO `tbl_area` VALUES ('381', '临高', '4', '267', '1', '1494174756191', '2017-05-08 00:29:35');
INSERT INTO `tbl_area` VALUES ('382', '甘南', '3', '72', '1', '1494176286148', '2017-05-08 00:55:05');
INSERT INTO `tbl_area` VALUES ('383', '巴基斯坦', '1', '0', '1', '1494178187825', '2017-05-08 01:26:47');
INSERT INTO `tbl_area` VALUES ('384', '新会', '4', '76', '1', '1494179413605', '2017-05-08 01:47:13');
INSERT INTO `tbl_area` VALUES ('385', '铜川', '3', '27', '1', '1494179485846', '2017-05-08 01:48:25');
INSERT INTO `tbl_area` VALUES ('386', '永城', '4', '161', '1', '1494179653475', '2017-05-08 01:51:12');
INSERT INTO `tbl_area` VALUES ('387', '日本', '1', '0', '1', '1494181888892', '2017-05-08 02:28:28');
INSERT INTO `tbl_area` VALUES ('388', '大阪', '2', '387', '1', '1494181888980', '2017-05-08 02:28:28');
INSERT INTO `tbl_area` VALUES ('389', '阿里', '3', '358', '1', '1494181922681', '2017-05-08 02:29:02');
INSERT INTO `tbl_area` VALUES ('390', '防城港', '3', '28', '1', '1494182403751', '2017-05-08 02:37:03');
INSERT INTO `tbl_area` VALUES ('391', '果洛', '3', '192', '1', '1494183844241', '2017-05-08 03:01:03');
INSERT INTO `tbl_area` VALUES ('392', '连云', '4', '44', '1', '1494184432269', '2017-05-08 03:10:51');
INSERT INTO `tbl_area` VALUES ('393', '澧县', '4', '169', '1', '1494184828944', '2017-05-08 03:17:28');
INSERT INTO `tbl_area` VALUES ('394', '日喀则', '3', '358', '1', '1494185584913', '2017-05-08 03:30:04');
INSERT INTO `tbl_area` VALUES ('395', '武昌', '4', '17', '1', '1494185858497', '2017-05-08 03:34:38');
INSERT INTO `tbl_area` VALUES ('396', '英国', '1', '0', '1', '1494186144840', '2017-05-08 03:39:24');
INSERT INTO `tbl_area` VALUES ('397', '伦敦', '2', '396', '1', '1494186144902', '2017-05-08 03:39:24');
INSERT INTO `tbl_area` VALUES ('398', '常熟', '4', '61', '1', '1494188811977', '2017-05-08 04:23:51');
INSERT INTO `tbl_area` VALUES ('399', '林芝', '3', '358', '1', '1494188899270', '2017-05-08 04:25:19');
INSERT INTO `tbl_area` VALUES ('400', '美国', '1', '0', '1', '1494191521294', '2017-05-08 05:09:01');
INSERT INTO `tbl_area` VALUES ('401', '加利福尼亚', '2', '400', '1', '1494191521356', '2017-05-08 05:09:01');
INSERT INTO `tbl_area` VALUES ('402', '孟加拉国', '1', '0', '1', '1494191956283', '2017-05-08 05:16:16');
INSERT INTO `tbl_area` VALUES ('403', '胡志明', '2', '354', '1', '1494193826506', '2017-05-08 05:47:26');
INSERT INTO `tbl_area` VALUES ('404', '河内', '2', '354', '1', '1494193998949', '2017-05-08 05:50:18');
INSERT INTO `tbl_area` VALUES ('405', '井冈山', '4', '106', '1', '1494195265999', '2017-05-08 06:11:25');
INSERT INTO `tbl_area` VALUES ('406', '亚太地区', '1', '0', '1', '1494195976940', '2017-05-08 06:23:16');
INSERT INTO `tbl_area` VALUES ('407', '长安', '4', '98', '1', '1494197673675', '2017-05-08 06:51:33');
INSERT INTO `tbl_area` VALUES ('408', '呼兰', '4', '71', '1', '1494198541617', '2017-05-08 07:06:01');
INSERT INTO `tbl_area` VALUES ('409', '万宁', '4', '267', '1', '1494200520345', '2017-05-08 07:39:00');
INSERT INTO `tbl_area` VALUES ('410', '泰山', '4', '54', '1', '1494200757856', '2017-05-08 07:42:57');
INSERT INTO `tbl_area` VALUES ('411', '老挝', '1', '0', '1', '1494214827896', '2017-05-08 11:40:31');
INSERT INTO `tbl_area` VALUES ('412', '五指山', '4', '267', '1', '1494214829100', '2017-05-08 11:40:32');
INSERT INTO `tbl_area` VALUES ('413', '印度', '1', '0', '1', '1494214831185', '2017-05-08 11:40:34');
INSERT INTO `tbl_area` VALUES ('414', '昌都', '3', '358', '1', '1494214832565', '2017-05-08 11:40:35');
INSERT INTO `tbl_area` VALUES ('415', '加拿大', '1', '0', '1', '1494214837571', '2017-05-08 11:40:40');
INSERT INTO `tbl_area` VALUES ('416', '屯昌', '4', '267', '1', '1494214837573', '2017-05-08 11:40:40');
INSERT INTO `tbl_area` VALUES ('417', '宝安', '4', '84', '1', '1494215989505', '2017-05-08 11:59:52');
INSERT INTO `tbl_area` VALUES ('418', '白沙', '4', '267', '1', '1494216154647', '2017-05-08 11:59:52');
INSERT INTO `tbl_area` VALUES ('419', '昌江', '4', '267', '1', '1494216154672', '2017-05-08 11:59:52');
INSERT INTO `tbl_area` VALUES ('420', '定安', '4', '267', '1', '1494216154696', '2017-05-08 11:59:52');
INSERT INTO `tbl_area` VALUES ('421', '保亭', '4', '267', '1', '1494216154764', '2017-05-08 11:59:53');
INSERT INTO `tbl_area` VALUES ('422', '新竹市', '3', '367', '1', '1494216176835', '2017-05-08 12:00:15');
INSERT INTO `tbl_area` VALUES ('423', '泰国', '1', '0', '1', '1494186515839', '2017-05-08 12:00:17');
INSERT INTO `tbl_area` VALUES ('424', '克孜勒苏', '3', '223', '1', '1494186523952', '2017-05-08 12:00:25');
INSERT INTO `tbl_area` VALUES ('425', '南海', '4', '3', '1', '1494186539017', '2017-05-08 12:00:40');
INSERT INTO `tbl_area` VALUES ('426', '闸北', '4', '60', '1', '1494216065146', '2017-05-08 12:01:08');
INSERT INTO `tbl_area` VALUES ('427', '澳大利亚', '1', '0', '1', '1494216234057', '2017-05-08 12:01:12');
INSERT INTO `tbl_area` VALUES ('428', '山南', '3', '358', '1', '1494216183540', '2017-05-08 12:03:06');
INSERT INTO `tbl_area` VALUES ('429', '那曲', '3', '358', '1', '1494186704684', '2017-05-08 12:03:26');
INSERT INTO `tbl_area` VALUES ('430', '兴义', '4', '165', '1', '1494186781108', '2017-05-08 12:04:42');
INSERT INTO `tbl_area` VALUES ('431', '江汉', '4', '17', '1', '1494216290347', '2017-05-08 12:04:53');
INSERT INTO `tbl_area` VALUES ('432', '琼山', '4', '254', '1', '1494186850146', '2017-05-08 12:05:51');
INSERT INTO `tbl_area` VALUES ('433', '三水', '4', '3', '1', '1494216570947', '2017-05-08 12:06:49');
INSERT INTO `tbl_area` VALUES ('434', '天河', '4', '20', '1', '1494216571436', '2017-05-08 12:06:49');
INSERT INTO `tbl_area` VALUES ('435', '龙岗', '4', '84', '1', '1494216427054', '2017-05-08 12:07:10');
INSERT INTO `tbl_area` VALUES ('436', '盐田', '4', '84', '1', '1494216427410', '2017-05-08 12:07:10');
INSERT INTO `tbl_area` VALUES ('437', '南山', '4', '84', '1', '1494216427553', '2017-05-08 12:07:10');
INSERT INTO `tbl_area` VALUES ('438', '菲律宾', '1', '0', '1', '1494216598763', '2017-05-08 12:07:17');
INSERT INTO `tbl_area` VALUES ('439', '云林', '3', '367', '1', '1494216443720', '2017-05-08 12:07:27');
INSERT INTO `tbl_area` VALUES ('440', '番禺', '4', '20', '1', '1494216699588', '2017-05-08 12:08:57');
INSERT INTO `tbl_area` VALUES ('441', '霞山', '4', '93', '1', '1494216554520', '2017-05-08 12:09:17');
INSERT INTO `tbl_area` VALUES ('442', '顺德', '4', '3', '1', '1494216555245', '2017-05-08 12:09:18');
INSERT INTO `tbl_area` VALUES ('443', '高州', '4', '120', '1', '1494187193427', '2017-05-08 12:11:35');
INSERT INTO `tbl_area` VALUES ('444', '印尼', '1', '0', '1', '1494216936225', '2017-05-08 12:12:54');
INSERT INTO `tbl_area` VALUES ('445', '北马里亚纳群岛', '1', '0', '1', '1494217022966', '2017-05-08 12:14:21');
INSERT INTO `tbl_area` VALUES ('446', '法国', '1', '0', '1', '1494187381291', '2017-05-08 12:14:43');
INSERT INTO `tbl_area` VALUES ('447', '哈萨克斯坦', '1', '0', '1', '1494187381319', '2017-05-08 12:14:43');
INSERT INTO `tbl_area` VALUES ('448', '高雄市', '3', '367', '1', '1494217047603', '2017-05-08 12:14:45');
INSERT INTO `tbl_area` VALUES ('449', '意大利', '1', '0', '1', '1494187387619', '2017-05-08 12:14:49');
INSERT INTO `tbl_area` VALUES ('450', '俄罗斯', '1', '0', '1', '1494187387636', '2017-05-08 12:14:49');
INSERT INTO `tbl_area` VALUES ('451', '瑞典', '1', '0', '1', '1494187387649', '2017-05-08 12:14:49');
INSERT INTO `tbl_area` VALUES ('452', '土耳其', '1', '0', '1', '1494187387660', '2017-05-08 12:14:49');
INSERT INTO `tbl_area` VALUES ('453', '巴西', '1', '0', '1', '1494187387670', '2017-05-08 12:14:49');
INSERT INTO `tbl_area` VALUES ('454', '奥地利', '1', '0', '1', '1494187388168', '2017-05-08 12:14:49');
INSERT INTO `tbl_area` VALUES ('455', '德国', '1', '0', '1', '1494187388188', '2017-05-08 12:14:49');
INSERT INTO `tbl_area` VALUES ('456', '增城', '4', '20', '1', '1494187402729', '2017-05-08 12:15:04');
INSERT INTO `tbl_area` VALUES ('457', '柬埔寨', '1', '0', '1', '1494187403796', '2017-05-08 12:15:05');
INSERT INTO `tbl_area` VALUES ('458', '阿富汗', '1', '0', '1', '1494187429733', '2017-05-08 12:15:31');
INSERT INTO `tbl_area` VALUES ('459', '台北市', '3', '367', '1', '1494217164187', '2017-05-08 12:16:42');
INSERT INTO `tbl_area` VALUES ('460', '台南市', '3', '367', '1', '1494217283147', '2017-05-08 12:18:41');
INSERT INTO `tbl_area` VALUES ('461', '和平', '4', '143', '1', '1494217181620', '2017-05-08 12:19:44');
INSERT INTO `tbl_area` VALUES ('462', '东京', '2', '387', '1', '1494187690167', '2017-05-08 12:19:51');
INSERT INTO `tbl_area` VALUES ('463', '南开', '4', '143', '1', '1494217357350', '2017-05-08 12:19:55');
INSERT INTO `tbl_area` VALUES ('464', '缅甸', '1', '0', '1', '1494217425019', '2017-05-08 12:21:03');
INSERT INTO `tbl_area` VALUES ('465', '阿联酋', '1', '0', '1', '1494187844156', '2017-05-08 12:22:25');
INSERT INTO `tbl_area` VALUES ('466', '吉尔吉斯斯坦', '1', '0', '1', '1494217346398', '2017-05-08 12:22:29');
INSERT INTO `tbl_area` VALUES ('467', '玉树', '3', '192', '1', '1494187854206', '2017-05-08 12:22:35');
INSERT INTO `tbl_area` VALUES ('468', '海北', '3', '192', '1', '1494187866537', '2017-05-08 12:22:48');
INSERT INTO `tbl_area` VALUES ('469', '佛罗里达', '2', '400', '1', '1494187871120', '2017-05-08 12:22:52');
INSERT INTO `tbl_area` VALUES ('470', '新竹县', '3', '367', '1', '1494187896655', '2017-05-08 12:23:18');
INSERT INTO `tbl_area` VALUES ('471', '桃园', '3', '367', '1', '1494187896668', '2017-05-08 12:23:18');
INSERT INTO `tbl_area` VALUES ('472', '宜兰', '3', '367', '1', '1494187896698', '2017-05-08 12:23:18');
INSERT INTO `tbl_area` VALUES ('473', '彰化', '3', '367', '1', '1494187896760', '2017-05-08 12:23:18');
INSERT INTO `tbl_area` VALUES ('474', '台东', '3', '367', '1', '1494187896834', '2017-05-08 12:23:18');
INSERT INTO `tbl_area` VALUES ('475', '文莱', '1', '0', '1', '1494187910386', '2017-05-08 12:23:32');
INSERT INTO `tbl_area` VALUES ('476', '新西兰', '1', '0', '1', '1494187910450', '2017-05-08 12:23:32');
INSERT INTO `tbl_area` VALUES ('477', '奥克兰', '2', '476', '1', '1494187910454', '2017-05-08 12:23:32');
INSERT INTO `tbl_area` VALUES ('478', '东帝汶', '1', '0', '1', '1494217413356', '2017-05-08 12:23:36');
INSERT INTO `tbl_area` VALUES ('479', '伊利诺伊', '2', '400', '1', '1494217414822', '2017-05-08 12:23:38');
INSERT INTO `tbl_area` VALUES ('480', '西澳大利亚', '2', '427', '1', '1494217417887', '2017-05-08 12:23:41');
INSERT INTO `tbl_area` VALUES ('481', '新南威尔士', '2', '427', '1', '1494217587207', '2017-05-08 12:23:45');
INSERT INTO `tbl_area` VALUES ('482', '尼泊尔', '1', '0', '1', '1494217427909', '2017-05-08 12:23:51');
INSERT INTO `tbl_area` VALUES ('483', '澳门', '2', '1', '1', '1494217428332', '2017-05-08 12:23:51');
INSERT INTO `tbl_area` VALUES ('484', '瓦利斯和富图纳', '1', '0', '1', '1494217603541', '2017-05-08 12:24:01');
INSERT INTO `tbl_area` VALUES ('485', '瓦利斯和富图纳', '2', '484', '1', '1494217603546', '2017-05-08 12:24:01');
INSERT INTO `tbl_area` VALUES ('486', '昆士兰', '2', '427', '1', '1494217603607', '2017-05-08 12:24:01');
INSERT INTO `tbl_area` VALUES ('487', '弗吉尼亚州', '2', '400', '1', '1494217608842', '2017-05-08 12:24:07');
INSERT INTO `tbl_area` VALUES ('488', '维多利亚', '2', '427', '1', '1494217628564', '2017-05-08 12:24:26');
INSERT INTO `tbl_area` VALUES ('489', '吉首', '4', '181', '1', '1494188055823', '2017-05-08 12:25:57');
INSERT INTO `tbl_area` VALUES ('490', '章丘', '4', '67', '1', '1494217658107', '2017-05-08 12:27:41');
INSERT INTO `tbl_area` VALUES ('491', '罗庄', '4', '78', '1', '1494217841686', '2017-05-08 12:28:00');
INSERT INTO `tbl_area` VALUES ('492', '宾夕法尼亚州', '2', '400', '1', '1494217733763', '2017-05-08 12:28:57');
INSERT INTO `tbl_area` VALUES ('493', 'CNNIC', '1', '0', '1', '1494217805703', '2017-05-08 12:30:09');
INSERT INTO `tbl_area` VALUES ('494', '曲阜', '4', '124', '1', '1494188326847', '2017-05-08 12:30:28');
INSERT INTO `tbl_area` VALUES ('495', '屯溪', '4', '361', '1', '1494188364868', '2017-05-08 12:31:06');
INSERT INTO `tbl_area` VALUES ('496', '合作', '4', '382', '1', '1494217900462', '2017-05-08 12:31:43');
INSERT INTO `tbl_area` VALUES ('497', '斯里兰卡', '1', '0', '1', '1494217924181', '2017-05-08 12:32:07');
INSERT INTO `tbl_area` VALUES ('498', '华盛顿州', '2', '400', '1', '1494218140629', '2017-05-08 12:35:43');
INSERT INTO `tbl_area` VALUES ('499', '纽约州', '2', '400', '1', '1494218148883', '2017-05-08 12:35:52');
INSERT INTO `tbl_area` VALUES ('500', '荷兰', '1', '0', '1', '1494218149443', '2017-05-08 12:35:52');
INSERT INTO `tbl_area` VALUES ('501', '黑森', '2', '455', '1', '1494218149534', '2017-05-08 12:35:52');
INSERT INTO `tbl_area` VALUES ('502', '塔吉克斯坦', '1', '0', '1', '1494218169276', '2017-05-08 12:36:12');
INSERT INTO `tbl_area` VALUES ('503', '伊拉克', '1', '0', '1', '1494218169489', '2017-05-08 12:36:12');
INSERT INTO `tbl_area` VALUES ('504', '哥伦比亚', '1', '0', '1', '1494218169640', '2017-05-08 12:36:12');
INSERT INTO `tbl_area` VALUES ('505', '多米尼加', '1', '0', '1', '1494218169708', '2017-05-08 12:36:13');
INSERT INTO `tbl_area` VALUES ('506', '阿根廷', '1', '0', '1', '1494218169788', '2017-05-08 12:36:13');
INSERT INTO `tbl_area` VALUES ('507', '苏里南', '1', '0', '1', '1494218169999', '2017-05-08 12:36:13');
INSERT INTO `tbl_area` VALUES ('508', '厄瓜多尔', '1', '0', '1', '1494218171827', '2017-05-08 12:36:15');
INSERT INTO `tbl_area` VALUES ('509', '墨西哥', '1', '0', '1', '1494218172719', '2017-05-08 12:36:16');
INSERT INTO `tbl_area` VALUES ('510', '葡萄牙', '1', '0', '1', '1494218181537', '2017-05-08 12:36:24');
INSERT INTO `tbl_area` VALUES ('511', '沙特阿拉伯', '1', '0', '1', '1494218181677', '2017-05-08 12:36:25');
INSERT INTO `tbl_area` VALUES ('512', '科威特', '1', '0', '1', '1494218181746', '2017-05-08 12:36:25');
INSERT INTO `tbl_area` VALUES ('513', '西班牙', '1', '0', '1', '1494218181826', '2017-05-08 12:36:25');
INSERT INTO `tbl_area` VALUES ('514', '委内瑞拉', '1', '0', '1', '1494218184557', '2017-05-08 12:36:27');
INSERT INTO `tbl_area` VALUES ('515', '智利', '1', '0', '1', '1494218184773', '2017-05-08 12:36:28');
INSERT INTO `tbl_area` VALUES ('516', '特立尼达和多巴哥', '1', '0', '1', '1494218184848', '2017-05-08 12:36:28');
INSERT INTO `tbl_area` VALUES ('517', '圭亚那', '1', '0', '1', '1494218184921', '2017-05-08 12:36:28');
INSERT INTO `tbl_area` VALUES ('518', 'Philips', '3', '469', '1', '1494188693569', '2017-05-08 12:36:35');
INSERT INTO `tbl_area` VALUES ('519', '北卡罗来纳', '2', '400', '1', '1494218385501', '2017-05-08 12:37:03');
INSERT INTO `tbl_area` VALUES ('520', '芬兰', '1', '0', '1', '1494188730482', '2017-05-08 12:37:12');
INSERT INTO `tbl_area` VALUES ('521', '新西伯利亚', '2', '450', '1', '1494188730495', '2017-05-08 12:37:12');
INSERT INTO `tbl_area` VALUES ('522', '苏丹', '1', '0', '1', '1494188730507', '2017-05-08 12:37:12');
INSERT INTO `tbl_area` VALUES ('523', '安哥拉', '1', '0', '1', '1494188730518', '2017-05-08 12:37:12');
INSERT INTO `tbl_area` VALUES ('524', '马达加斯加', '1', '0', '1', '1494188730530', '2017-05-08 12:37:12');
INSERT INTO `tbl_area` VALUES ('525', '尼日利亚', '1', '0', '1', '1494188730544', '2017-05-08 12:37:12');
INSERT INTO `tbl_area` VALUES ('526', '津巴布韦', '1', '0', '1', '1494188730555', '2017-05-08 12:37:12');
INSERT INTO `tbl_area` VALUES ('527', '赞比亚', '1', '0', '1', '1494188730565', '2017-05-08 12:37:12');
INSERT INTO `tbl_area` VALUES ('528', '毛里求斯', '1', '0', '1', '1494188730576', '2017-05-08 12:37:12');
INSERT INTO `tbl_area` VALUES ('529', '肯尼亚', '1', '0', '1', '1494188730587', '2017-05-08 12:37:12');
INSERT INTO `tbl_area` VALUES ('530', '纳米比亚', '1', '0', '1', '1494188730598', '2017-05-08 12:37:12');
INSERT INTO `tbl_area` VALUES ('531', '加纳', '1', '0', '1', '1494188730627', '2017-05-08 12:37:12');
INSERT INTO `tbl_area` VALUES ('532', '南非', '1', '0', '1', '1494188730647', '2017-05-08 12:37:12');
INSERT INTO `tbl_area` VALUES ('533', '瓦努阿图', '1', '0', '1', '1494218336823', '2017-05-08 12:39:00');
INSERT INTO `tbl_area` VALUES ('534', '巴布亚新几内亚', '1', '0', '1', '1494218600956', '2017-05-08 12:40:39');
INSERT INTO `tbl_area` VALUES ('535', '新喀里多尼亚', '1', '0', '1', '1494218601080', '2017-05-08 12:40:39');
INSERT INTO `tbl_area` VALUES ('536', '诺福克岛', '1', '0', '1', '1494218441629', '2017-05-08 12:40:44');
INSERT INTO `tbl_area` VALUES ('537', '嘉义市', '3', '367', '1', '1494218500361', '2017-05-08 12:41:43');
INSERT INTO `tbl_area` VALUES ('538', '瑞士', '1', '0', '1', '1494218703371', '2017-05-08 12:42:21');
INSERT INTO `tbl_area` VALUES ('539', '蒙古', '1', '0', '1', '1494189142350', '2017-05-08 12:44:04');
INSERT INTO `tbl_area` VALUES ('540', '阿尔及利亚', '1', '0', '1', '1494189142542', '2017-05-08 12:44:04');
INSERT INTO `tbl_area` VALUES ('541', '埃及', '1', '0', '1', '1494189142586', '2017-05-08 12:44:04');
INSERT INTO `tbl_area` VALUES ('542', '凯里', '4', '243', '1', '1494189146444', '2017-05-08 12:44:08');
INSERT INTO `tbl_area` VALUES ('543', '松山', '4', '47', '1', '1494189260372', '2017-05-08 12:46:02');
INSERT INTO `tbl_area` VALUES ('544', '南投', '3', '367', '1', '1494218806023', '2017-05-08 12:46:49');
INSERT INTO `tbl_area` VALUES ('545', '屏东', '3', '367', '1', '1494218807273', '2017-05-08 12:46:50');
INSERT INTO `tbl_area` VALUES ('546', '不列颠哥伦比亚', '2', '415', '1', '1494219013987', '2017-05-08 12:47:32');
INSERT INTO `tbl_area` VALUES ('547', '海淀', '4', '7', '1', '1494219072878', '2017-05-08 12:48:31');
INSERT INTO `tbl_area` VALUES ('548', '太仓', '4', '61', '1', '1494189470087', '2017-05-08 12:49:31');
INSERT INTO `tbl_area` VALUES ('549', '密歇根州', '2', '400', '1', '1494189507778', '2017-05-08 12:50:09');
INSERT INTO `tbl_area` VALUES ('550', '朝鲜', '1', '0', '1', '1494189536669', '2017-05-08 12:50:38');
INSERT INTO `tbl_area` VALUES ('551', '白云', '4', '20', '1', '1494219088448', '2017-05-08 12:51:31');
INSERT INTO `tbl_area` VALUES ('552', '越秀', '4', '20', '1', '1494219304401', '2017-05-08 12:52:22');
INSERT INTO `tbl_area` VALUES ('553', '广岛', '2', '387', '1', '1494189661321', '2017-05-08 12:52:43');
INSERT INTO `tbl_area` VALUES ('554', '花都', '4', '20', '1', '1494189665400', '2017-05-08 12:52:47');
INSERT INTO `tbl_area` VALUES ('555', '乌兹别克斯坦', '1', '0', '1', '1494219338281', '2017-05-08 12:52:56');
INSERT INTO `tbl_area` VALUES ('556', '爱尔兰', '1', '0', '1', '1494219338359', '2017-05-08 12:52:56');
INSERT INTO `tbl_area` VALUES ('557', '雁塔', '4', '98', '1', '1494219175524', '2017-05-08 12:52:58');
INSERT INTO `tbl_area` VALUES ('558', '淮阴', '4', '203', '1', '1494189772200', '2017-05-08 12:54:33');
INSERT INTO `tbl_area` VALUES ('559', '蒙大拿', '2', '400', '1', '1494189808288', '2017-05-08 12:55:10');
INSERT INTO `tbl_area` VALUES ('560', 'Amazon', '3', '559', '1', '1494189808294', '2017-05-08 12:55:10');
INSERT INTO `tbl_area` VALUES ('561', '都柏林', '2', '556', '1', '1494189808317', '2017-05-08 12:55:10');
INSERT INTO `tbl_area` VALUES ('562', '花莲', '3', '367', '1', '1494189808420', '2017-05-08 12:55:10');
INSERT INTO `tbl_area` VALUES ('563', '乌干达', '1', '0', '1', '1494219371440', '2017-05-08 12:56:14');
INSERT INTO `tbl_area` VALUES ('564', '坦桑尼亚', '1', '0', '1', '1494219371580', '2017-05-08 12:56:14');
INSERT INTO `tbl_area` VALUES ('565', '中原', '4', '92', '1', '1494219437239', '2017-05-08 12:57:20');
INSERT INTO `tbl_area` VALUES ('566', '巢湖', '3', '38', '1', '1494219605213', '2017-05-08 12:57:23');
INSERT INTO `tbl_area` VALUES ('567', '科罗拉多州', '2', '400', '1', '1494190036099', '2017-05-08 12:58:57');
INSERT INTO `tbl_area` VALUES ('568', '安大略', '2', '415', '1', '1494219832140', '2017-05-08 13:03:55');
INSERT INTO `tbl_area` VALUES ('569', '摩洛哥', '1', '0', '1', '1494219844084', '2017-05-08 13:04:07');
INSERT INTO `tbl_area` VALUES ('570', '罗湖', '4', '84', '1', '1494220082827', '2017-05-08 13:05:21');
INSERT INTO `tbl_area` VALUES ('571', '斐济群岛', '1', '0', '1', '1494219977280', '2017-05-08 13:06:20');
INSERT INTO `tbl_area` VALUES ('572', '利比里亚', '1', '0', '1', '1494220374439', '2017-05-08 13:10:12');
INSERT INTO `tbl_area` VALUES ('573', 'CNNIC', '2', '493', '1', '1494220497570', '2017-05-08 13:15:00');
INSERT INTO `tbl_area` VALUES ('574', '亚利桑那州', '2', '400', '1', '1494220603883', '2017-05-08 13:16:47');
INSERT INTO `tbl_area` VALUES ('575', '费县', '4', '78', '1', '1494220769429', '2017-05-08 13:16:47');
INSERT INTO `tbl_area` VALUES ('576', '从化', '4', '20', '1', '1494220807217', '2017-05-08 13:17:25');
INSERT INTO `tbl_area` VALUES ('577', '昆山', '4', '61', '1', '1494220832705', '2017-05-08 13:17:51');
INSERT INTO `tbl_area` VALUES ('578', '苗栗', '3', '367', '1', '1494220833639', '2017-05-08 13:17:52');
INSERT INTO `tbl_area` VALUES ('579', '沙洋', '4', '333', '1', '1494191401871', '2017-05-08 13:21:43');
INSERT INTO `tbl_area` VALUES ('580', '南岗', '4', '71', '1', '1494221137689', '2017-05-08 13:25:41');
INSERT INTO `tbl_area` VALUES ('581', '克罗地亚', '1', '0', '1', '1494221383677', '2017-05-08 13:27:02');
INSERT INTO `tbl_area` VALUES ('582', '比利时', '1', '0', '1', '1494221383691', '2017-05-08 13:27:02');
INSERT INTO `tbl_area` VALUES ('583', '埃塞俄比亚', '1', '0', '1', '1494221383728', '2017-05-08 13:27:02');
INSERT INTO `tbl_area` VALUES ('584', '哥斯达黎加', '1', '0', '1', '1494221479543', '2017-05-08 13:28:37');
INSERT INTO `tbl_area` VALUES ('585', '胶州', '4', '112', '1', '1494191927698', '2017-05-08 13:30:29');
INSERT INTO `tbl_area` VALUES ('586', '集美', '4', '200', '1', '1494192026730', '2017-05-08 13:32:08');
INSERT INTO `tbl_area` VALUES ('587', '锡山', '4', '42', '1', '1494221726469', '2017-05-08 13:32:44');
INSERT INTO `tbl_area` VALUES ('588', '义乌', '4', '233', '1', '1494221583834', '2017-05-08 13:33:07');
INSERT INTO `tbl_area` VALUES ('589', '库尔勒', '4', '241', '1', '1494221617034', '2017-05-08 13:33:40');
INSERT INTO `tbl_area` VALUES ('590', '耒阳', '4', '148', '1', '1494221684021', '2017-05-08 13:34:47');
INSERT INTO `tbl_area` VALUES ('591', '鹿泉', '4', '134', '1', '1494221722163', '2017-05-08 13:35:25');
INSERT INTO `tbl_area` VALUES ('592', '诸城', '4', '75', '1', '1494221840887', '2017-05-08 13:37:24');
INSERT INTO `tbl_area` VALUES ('593', '武进', '4', '128', '1', '1494192363441', '2017-05-08 13:37:45');
INSERT INTO `tbl_area` VALUES ('594', '历下', '4', '67', '1', '1494222070965', '2017-05-08 13:38:29');
INSERT INTO `tbl_area` VALUES ('595', '丹阳', '4', '19', '1', '1494221916876', '2017-05-08 13:38:40');
INSERT INTO `tbl_area` VALUES ('596', '松江', '4', '60', '1', '1494192449955', '2017-05-08 13:39:11');
INSERT INTO `tbl_area` VALUES ('597', '普陀', '4', '14', '1', '1494222122131', '2017-05-08 13:39:20');
INSERT INTO `tbl_area` VALUES ('598', '东阳', '4', '233', '1', '1494221963830', '2017-05-08 13:39:27');
INSERT INTO `tbl_area` VALUES ('599', '科特迪瓦', '1', '0', '1', '1494221976848', '2017-05-08 13:39:40');
INSERT INTO `tbl_area` VALUES ('600', '尼日尔', '1', '0', '1', '1494221976918', '2017-05-08 13:39:40');
INSERT INTO `tbl_area` VALUES ('601', '刚果民主共和国', '1', '0', '1', '1494221977205', '2017-05-08 13:39:40');
INSERT INTO `tbl_area` VALUES ('602', '塞内加尔', '1', '0', '1', '1494221977277', '2017-05-08 13:39:40');
INSERT INTO `tbl_area` VALUES ('603', '瑞安', '4', '105', '1', '1494221990518', '2017-05-08 13:39:53');
INSERT INTO `tbl_area` VALUES ('604', '乐清', '4', '105', '1', '1494192515822', '2017-05-08 13:40:17');
INSERT INTO `tbl_area` VALUES ('605', '萧山', '4', '55', '1', '1494222193768', '2017-05-08 13:40:32');
INSERT INTO `tbl_area` VALUES ('606', '余姚', '4', '18', '1', '1494222200347', '2017-05-08 13:40:38');
INSERT INTO `tbl_area` VALUES ('607', '余杭', '4', '55', '1', '1494222046030', '2017-05-08 13:40:49');
INSERT INTO `tbl_area` VALUES ('608', '河东', '4', '143', '1', '1494192567397', '2017-05-08 13:41:09');
INSERT INTO `tbl_area` VALUES ('609', '汤加', '1', '0', '1', '1494192607192', '2017-05-08 13:41:48');
INSERT INTO `tbl_area` VALUES ('610', '汾阳', '4', '221', '1', '1494192612541', '2017-05-08 13:41:54');
INSERT INTO `tbl_area` VALUES ('611', '吉隆坡', '2', '356', '1', '1494222284860', '2017-05-08 13:42:03');
INSERT INTO `tbl_area` VALUES ('612', '福田', '4', '84', '1', '1494222140565', '2017-05-08 13:42:24');
INSERT INTO `tbl_area` VALUES ('613', '康涅狄格州', '2', '400', '1', '1494192646380', '2017-05-08 13:42:28');
INSERT INTO `tbl_area` VALUES ('614', '巴哈马', '1', '0', '1', '1494192646392', '2017-05-08 13:42:28');
INSERT INTO `tbl_area` VALUES ('615', '吴江', '4', '61', '1', '1494222351822', '2017-05-08 13:43:10');
INSERT INTO `tbl_area` VALUES ('616', '不丹', '1', '0', '1', '1494192700048', '2017-05-08 13:43:21');
INSERT INTO `tbl_area` VALUES ('617', '黑山', '1', '0', '1', '1494222202016', '2017-05-08 13:43:25');
INSERT INTO `tbl_area` VALUES ('618', '乌克兰', '1', '0', '1', '1494222202434', '2017-05-08 13:43:25');
INSERT INTO `tbl_area` VALUES ('619', '艾伯塔', '2', '415', '1', '1494194202860', '2017-05-08 14:08:24');
INSERT INTO `tbl_area` VALUES ('620', '印第安纳州', '2', '400', '1', '1494194202888', '2017-05-08 14:08:24');
INSERT INTO `tbl_area` VALUES ('621', '牙买加', '1', '0', '1', '1494194202939', '2017-05-08 14:08:24');
INSERT INTO `tbl_area` VALUES ('622', '马里兰州', '2', '400', '1', '1494194202958', '2017-05-08 14:08:24');
INSERT INTO `tbl_area` VALUES ('623', '马萨诸塞', '2', '400', '1', '1494194202980', '2017-05-08 14:08:24');
INSERT INTO `tbl_area` VALUES ('624', '新泽西州', '2', '400', '1', '1494194203002', '2017-05-08 14:08:24');
INSERT INTO `tbl_area` VALUES ('625', '夏威夷', '2', '400', '1', '1494194203037', '2017-05-08 14:08:24');
INSERT INTO `tbl_area` VALUES ('626', '法属圭亚那', '1', '0', '1', '1494223705491', '2017-05-08 14:08:29');
INSERT INTO `tbl_area` VALUES ('627', '匈牙利', '1', '0', '1', '1494223706975', '2017-05-08 14:08:30');
INSERT INTO `tbl_area` VALUES ('628', '罗马尼亚', '1', '0', '1', '1494223707608', '2017-05-08 14:08:31');
INSERT INTO `tbl_area` VALUES ('629', '斯洛伐克', '1', '0', '1', '1494223708087', '2017-05-08 14:08:31');
INSERT INTO `tbl_area` VALUES ('630', '挪威', '1', '0', '1', '1494223708430', '2017-05-08 14:08:31');
INSERT INTO `tbl_area` VALUES ('631', '波兰', '1', '0', '1', '1494223708781', '2017-05-08 14:08:32');
INSERT INTO `tbl_area` VALUES ('632', '黎巴嫩', '1', '0', '1', '1494223709195', '2017-05-08 14:08:32');
INSERT INTO `tbl_area` VALUES ('633', '伊朗', '1', '0', '1', '1494194678246', '2017-05-08 14:16:20');
INSERT INTO `tbl_area` VALUES ('634', '基隆', '3', '367', '1', '1494194713564', '2017-05-08 14:16:55');
INSERT INTO `tbl_area` VALUES ('635', '通州', '4', '7', '1', '1494225656340', '2017-05-08 14:40:59');
INSERT INTO `tbl_area` VALUES ('636', '密云', '4', '7', '1', '1494225656479', '2017-05-08 14:41:00');
INSERT INTO `tbl_area` VALUES ('637', '城关', '4', '73', '1', '1494196476507', '2017-05-08 14:46:18');
INSERT INTO `tbl_area` VALUES ('638', '天山', '4', '246', '1', '1494226018826', '2017-05-08 14:47:02');
INSERT INTO `tbl_area` VALUES ('639', '德化', '4', '69', '1', '1494226188040', '2017-05-08 14:49:51');
INSERT INTO `tbl_area` VALUES ('640', '闵行', '4', '60', '1', '1494226394856', '2017-05-08 14:50:33');
INSERT INTO `tbl_area` VALUES ('641', '北海道', '2', '387', '1', '1494226229722', '2017-05-08 14:50:33');
INSERT INTO `tbl_area` VALUES ('642', 'Kyongsang-bukto', '2', '325', '1', '1494196868326', '2017-05-08 14:52:50');
INSERT INTO `tbl_area` VALUES ('643', 'Silla', '3', '642', '1', '1494196868331', '2017-05-08 14:52:50');

-- ----------------------------
-- Table structure for `tbl_message`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE `tbl_message` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(200) default NULL,
  `create_at` bigint(20) default NULL,
  `profile_id` bigint(20) default NULL,
  `is_read` int(11) default NULL,
  `status` int(11) default NULL,
  `content` text,
  `msgtype` int(11) default NULL,
  `is_sys` int(11) default NULL,
  `appid` bigint(20) default NULL,
  `plat` int(11) default NULL,
  `pn` varchar(100) default NULL,
  `extra` varchar(400) default NULL,
  `is_del` int(1) default '1' COMMENT '删除标识（1未删除，2已删除）',
  PRIMARY KEY  (`id`),
  KEY `IDX_PROFILE_ID` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_message
-- ----------------------------

-- ----------------------------
-- Table structure for `user_miao_detail`
-- ----------------------------
DROP TABLE IF EXISTS `user_miao_detail`;
CREATE TABLE `user_miao_detail` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `user_id` varchar(255) default NULL COMMENT '用户ID',
  `task_name` varchar(500) default NULL COMMENT '任务描述',
  `miao_money` tinyint(255) default NULL COMMENT '妙币数量',
  `operation_date` datetime default NULL COMMENT '操作时间',
  `accountnum` int(11) default NULL,
  `modifytype` int(11) default NULL,
  `operationdatestamp` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户妙币明细表';

-- ----------------------------
-- Records of user_miao_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `user_miao_total`
-- ----------------------------
DROP TABLE IF EXISTS `user_miao_total`;
CREATE TABLE `user_miao_total` (
  `id` varchar(255) NOT NULL,
  `miao_money` int(11) default NULL,
  `operation_date` datetime default NULL,
  `user_id` varchar(255) default NULL,
  `accountnum` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_miao_total
-- ----------------------------

-- ----------------------------
-- Table structure for `user_tag`
-- ----------------------------
DROP TABLE IF EXISTS `user_tag`;
CREATE TABLE `user_tag` (
  `id` varchar(255) NOT NULL,
  `tag` varchar(255) default NULL,
  `tag_id` varchar(255) default NULL,
  `user_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `user_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `user_userinfo`;
CREATE TABLE `user_userinfo` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `user_id` varchar(255) default NULL COMMENT '用户ID',
  `user_name` varchar(500) default NULL COMMENT '昵称',
  `user_phone` varchar(11) default NULL COMMENT '手机号码',
  `registration_date` datetime default NULL COMMENT '注册时间',
  `register_ip` varchar(16) default NULL COMMENT '注册IP',
  `ditch_no` varchar(50) default NULL COMMENT '渠道号',
  `inviter_id` varchar(255) default NULL COMMENT '邀请人ID',
  `inviter_phone` varchar(11) default NULL COMMENT '邀请人手机号',
  `miao_money` tinyint(10) default NULL COMMENT '妙币',
  `state` varchar(2) default NULL COMMENT '状态(0:正常 1:锁定)',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of user_userinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `usr_account`
-- ----------------------------
DROP TABLE IF EXISTS `usr_account`;
CREATE TABLE `usr_account` (
  `id` varchar(255) NOT NULL,
  `account_name` varchar(255) default NULL,
  `account_source` int(11) NOT NULL default '1',
  `account_status` int(11) NOT NULL default '1',
  `account_type` int(11) NOT NULL default '1',
  `create_time` datetime default NULL,
  `email` varchar(255) default NULL,
  `mobile` varchar(255) default NULL,
  `passwd` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `accountnum` int(11) NOT NULL,
  `miao_money` int(11) NOT NULL,
  `invitedaccountnum` varchar(255) default NULL,
  `invitedphone` varchar(255) default NULL,
  `invitedtime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usr_account
-- ----------------------------
INSERT INTO `usr_account` VALUES ('402881ef5ea8c2bd015ea8dfdde80001', '15251816837', '1', '1', '1', null, null, '15251816837', null, '2017-09-22 17:16:37', '1', '0', null, null, null);
INSERT INTO `usr_account` VALUES ('ff8080815e74b3f7015e74b508d70001', '17327730101', '0', '0', '0', null, null, '17327730101', null, '2017-09-12 14:09:35', '2', '0', null, null, null);
INSERT INTO `usr_account` VALUES ('ff8080815e74b3f7015e74b5ffa70006', '15712898241', '0', '0', '0', null, null, '15712898241', null, '2017-09-12 14:10:38', '3', '0', null, null, null);

-- ----------------------------
-- Table structure for `usr_invite_record`
-- ----------------------------
DROP TABLE IF EXISTS `usr_invite_record`;
CREATE TABLE `usr_invite_record` (
  `id` char(32) NOT NULL COMMENT '主键md5(profile_id+invite_profile_id+appid)',
  `profile_id` bigint(20) default NULL COMMENT '被邀请人用户属性id',
  `mobile` varchar(11) default NULL COMMENT '被邀请人注册手机号',
  `account_name` varchar(50) default NULL COMMENT '被邀请人注册用户名',
  `register_time` bigint(20) default NULL COMMENT '被邀请人注册时间',
  `invite_profile_id` bigint(20) default NULL COMMENT '邀请人用户属性id',
  `invite_mobile` varchar(11) default NULL COMMENT '邀请人注册手机号',
  `invite_account_name` varchar(50) default NULL COMMENT '邀请人注册用户名',
  `invite_status` tinyint(4) default '0' COMMENT '邀请状态0-未邀请成功，1-邀请成功(被邀请人首次登录即为成功)',
  `invite_code` varchar(50) default NULL COMMENT '邀请码',
  `create_time` bigint(20) default NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新时间',
  `appid` bigint(20) default NULL COMMENT '应用属性id',
  `create_date` datetime default NULL,
  `update_date` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `IDX_PROFILE_ID` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邀请记录表';

-- ----------------------------
-- Records of usr_invite_record
-- ----------------------------
INSERT INTO `usr_invite_record` VALUES ('1', '1', '18860897890', 'hah1', null, '1', '4436401', 'hhhaa', '0', null, null, '2017-08-18 17:03:19', null, null, null);

-- ----------------------------
-- Table structure for `usr_invite_reward`
-- ----------------------------
DROP TABLE IF EXISTS `usr_invite_reward`;
CREATE TABLE `usr_invite_reward` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `reward_name` varchar(50) default NULL COMMENT '奖励名称',
  `reward_condition` int(11) default NULL COMMENT '奖励条件即邀请多少人',
  `reward_amount` int(11) default NULL COMMENT '奖励值即奖励多少妙币',
  `reward_status` tinyint(4) default NULL COMMENT '奖励状态0停用，1启用，-1删除',
  `appid` bigint(20) default NULL COMMENT '应用属性id',
  `create_time` bigint(20) default NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户邀请奖励表';

-- ----------------------------
-- Records of usr_invite_reward
-- ----------------------------

-- ----------------------------
-- Table structure for `usr_invite_reward_record`
-- ----------------------------
DROP TABLE IF EXISTS `usr_invite_reward_record`;
CREATE TABLE `usr_invite_reward_record` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `invite_profile_id` bigint(20) default NULL COMMENT '邀请人用户属性id',
  `appid` bigint(20) default NULL COMMENT '邀请人应用属性id',
  `invite_mobile` varchar(11) default NULL COMMENT '邀请人手机号',
  `invite_account_name` varchar(50) default NULL COMMENT '邀请人用户名',
  `reward_id` int(11) default NULL COMMENT '邀请人获得奖励id',
  `reard_name` varchar(50) default NULL COMMENT '邀请人获得奖励名称',
  `reward_condition` int(11) default NULL COMMENT '获得奖励条件(邀请多少人)',
  `reward_amount` int(11) default NULL COMMENT '获得奖励数(获得多少妙币)',
  `receive_status` tinyint(4) default '0' COMMENT '奖励领取状态，0未领取，1-已领取',
  `receive_time` bigint(20) default NULL COMMENT '奖励领取时间',
  `create_time` bigint(20) default NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邀请奖励记录表';

-- ----------------------------
-- Records of usr_invite_reward_record
-- ----------------------------

-- ----------------------------
-- Table structure for `usr_invite_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `usr_invite_statistics`;
CREATE TABLE `usr_invite_statistics` (
  `id` char(32) NOT NULL COMMENT '主键Md5(invite_profile_id+appid)',
  `invite_profile_id` bigint(20) default NULL COMMENT '邀请人用户属性id',
  `appid` bigint(20) default NULL COMMENT '应用属性id',
  `invite_mobile` varchar(11) default NULL COMMENT '邀请人手机号',
  `invite_account_name` varchar(50) default NULL COMMENT '邀请人用户名',
  `real_reg_total` int(11) default NULL COMMENT '实际注册数',
  `invite_success_total` int(11) default NULL COMMENT '邀请成功数',
  `reward_sum` int(11) default NULL COMMENT '获得奖励总数',
  `reward_number` int(11) default NULL COMMENT '获得奖励次数',
  `receive_number` int(11) default NULL COMMENT '领取奖励次数',
  `without_receive_number` int(11) default NULL COMMENT '未领取奖励次数',
  `create_time` bigint(20) default NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邀请统计表';

-- ----------------------------
-- Records of usr_invite_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for `usr_login`
-- ----------------------------
DROP TABLE IF EXISTS `usr_login`;
CREATE TABLE `usr_login` (
  `id` varchar(255) NOT NULL,
  `account_id` varchar(255) NOT NULL,
  `be_verified` int(11) NOT NULL,
  `create_time` datetime default NULL,
  `login_name` varchar(255) NOT NULL,
  `login_status` int(11) NOT NULL default '1',
  `login_token` varchar(255) default NULL,
  `login_type` int(11) NOT NULL,
  `password_time` bigint(20) NOT NULL,
  `profile_key` varchar(255) default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP用户登录信息表';

-- ----------------------------
-- Records of usr_login
-- ----------------------------
INSERT INTO `usr_login` VALUES ('402881ef5ea8c2bd015ea8dfddf80002', '402881ef5ea8c2bd015ea8dfdde80001', '0', '2017-09-22 17:16:37', '15251816837', '1', 'e10adc3949ba59abbe56e057f20f883e', '4', '0', null, '2017-09-22 17:16:37');
INSERT INTO `usr_login` VALUES ('ff8080815e74b3f7015e74b5091b0002', 'ff8080815e74b3f7015e74b508d70001', '0', '2017-09-12 14:09:35', '17327730101', '0', 'e10adc3949ba59abbe56e057f20f883e', '4', '0', null, '2017-09-12 14:09:35');
INSERT INTO `usr_login` VALUES ('ff8080815e74b3f7015e74b5ffa80007', 'ff8080815e74b3f7015e74b5ffa70006', '0', '2017-09-12 14:10:38', '15712898241', '0', 'e10adc3949ba59abbe56e057f20f883e', '4', '0', null, '2017-09-12 14:10:38');

-- ----------------------------
-- Table structure for `usr_profile`
-- ----------------------------
DROP TABLE IF EXISTS `usr_profile`;
CREATE TABLE `usr_profile` (
  `id` varchar(255) NOT NULL,
  `account_id` varchar(255) NOT NULL,
  `age` int(11) NOT NULL default '0',
  `archives_score` int(11) NOT NULL default '0',
  `area_id` int(11) NOT NULL,
  `birth` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `education_levels` int(11) NOT NULL,
  `extra` varchar(255) default NULL,
  `headpic` varchar(255) default NULL,
  `health_score` int(11) NOT NULL default '0',
  `height` int(11) NOT NULL default '170',
  `marital_status` int(11) NOT NULL,
  `max_archives_score` int(11) NOT NULL default '0',
  `medical_insurance` int(11) NOT NULL,
  `nick_name` varchar(255) default NULL,
  `pn` varchar(255) default NULL,
  `profession` int(11) NOT NULL,
  `profile_key` varchar(255) default NULL,
  `profile_status` int(11) NOT NULL default '1',
  `real_name` varchar(255) default NULL,
  `reg_ip` varchar(255) default NULL,
  `sex` int(11) NOT NULL default '3',
  `slim_weight_type` int(11) NOT NULL,
  `update_time` datetime default NULL,
  `weight` float(11,1) default '60.0',
  `address` varchar(255) default NULL,
  `address_flag` bit(1) NOT NULL,
  `data_flag` bit(1) NOT NULL,
  `detailed_address` varchar(255) default NULL,
  `ha_assessment_flag` bit(1) NOT NULL,
  `healthy_data_flag` bit(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usr_profile
-- ----------------------------
INSERT INTO `usr_profile` VALUES ('402881ef5ea8c2bd015ea8dfddf80003', '402881ef5ea8c2bd015ea8dfdde80001', '0', '0', '0', '未设置', '2017-09-22 17:16:37', '0', null, '402881ef5ea8c2bd015ea8dfdde80001.jpeg', '0', '170', '0', '0', '0', '15251816837', null, '0', null, '1', '', null, '0', '0', '2017-10-18 19:59:19', '60.0', null, '', '', null, '', '');
INSERT INTO `usr_profile` VALUES ('ff8080815e74b3f7015e74b509200003', 'ff8080815e74b3f7015e74b508d70001', '0', '0', '0', '2017-09-30', '2017-09-12 14:09:35', '0', null, null, '0', '237', '0', '0', '0', '17327730101', null, '0', null, '0', 'dad', null, '2', '0', '2017-10-14 18:07:27', '13.9', '北京市 北京市 崇文区', '', '', '北京市 东城区1', '', '');
INSERT INTO `usr_profile` VALUES ('ff8080815e74b3f7015e74b5ffa80008', 'ff8080815e74b3f7015e74b5ffa70006', '0', '0', '0', null, '2017-09-12 14:10:38', '0', null, null, '0', '0', '0', '0', '0', '15712898241', null, '0', null, '0', null, null, '0', '0', '2017-09-12 14:10:38', '0.0', null, '', '', null, '', '');

-- ----------------------------
-- Table structure for `usr_profile_extension`
-- ----------------------------
DROP TABLE IF EXISTS `usr_profile_extension`;
CREATE TABLE `usr_profile_extension` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime default NULL,
  `exp` int(11) NOT NULL default '0',
  `extension_key` varchar(255) default NULL,
  `level_id` int(11) NOT NULL,
  `profile_id` varchar(255) default NULL,
  `score` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usr_profile_extension
-- ----------------------------
INSERT INTO `usr_profile_extension` VALUES ('402881ef5ea8c2bd015ea8dfddf80004', '2017-09-22 17:16:37', '0', null, '0', '402881ef5ea8c2bd015ea8dfddf80003', '0');
INSERT INTO `usr_profile_extension` VALUES ('ff8080815e74b3f7015e74b509250004', '2017-09-12 14:09:35', '0', null, '0', 'ff8080815e74b3f7015e74b509200003', '0');
INSERT INTO `usr_profile_extension` VALUES ('ff8080815e74b3f7015e74b5ffa90009', '2017-09-12 14:10:38', '0', null, '0', 'ff8080815e74b3f7015e74b5ffa80008', '0');

-- ----------------------------
-- Table structure for `usr_scr_exp_detail`
-- ----------------------------
DROP TABLE IF EXISTS `usr_scr_exp_detail`;
CREATE TABLE `usr_scr_exp_detail` (
  `id` varchar(255) NOT NULL,
  `s` varchar(255) default NULL,
  `addition_value` int(11) NOT NULL,
  `create_time` datetime default NULL,
  `extension_key` varchar(255) default NULL,
  `status` int(11) NOT NULL,
  `task_id` varchar(255) default NULL,
  `type` int(11) NOT NULL,
  `usr_mission_id` varchar(255) default NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usr_scr_exp_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `usr_setting`
-- ----------------------------
DROP TABLE IF EXISTS `usr_setting`;
CREATE TABLE `usr_setting` (
  `id` varchar(255) NOT NULL,
  `account_id` varchar(255) NOT NULL,
  `settingcolumn` varchar(255) default NULL,
  `hidecolumn` varchar(255) default NULL,
  `settingcircle` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usr_setting
-- ----------------------------
INSERT INTO `usr_setting` VALUES ('402882f45f336277015f3378081e0009', '402881ef5ea8c2bd015ea8dfdde80001', '10,2,3,4,5,6,7,8,9,11', '1', '402882e55f331809015f3329a8e3000d,402882e55f331809015f3328ab1f000a,402882e55f331809015f3328664d0008,402882e55f331809015f332887d50009,402882e55f331809015f3328cce6000b,402882e55f331809015f3328ed23000c');
INSERT INTO `usr_setting` VALUES ('402882f45f33f1f7015f3477a9cc0001', 'ff8080815e74b3f7015e74b508d70001', null, null, '402882e55f331809015f3329a8e3000d,402882e55f331809015f332887d50009,402882e55f331809015f3328ab1f000a,402882e55f331809015f3328cce6000b,402882e55f331809015f3328664d0008,402882e55f331809015f3328ed23000c');

-- ----------------------------
-- Table structure for `usr_sign`
-- ----------------------------
DROP TABLE IF EXISTS `usr_sign`;
CREATE TABLE `usr_sign` (
  `id` varchar(255) NOT NULL,
  `last_sing_time` datetime default NULL,
  `appid` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `is_new` int(11) NOT NULL,
  `new_sign_num` int(11) default NULL,
  `profile_id` varchar(255) default NULL,
  `sing_days` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usr_sign
-- ----------------------------
INSERT INTO `usr_sign` VALUES ('402881ef5ea92df9015ea981f10b0000', '2017-09-30 18:38:18', null, '2017-09-22 20:13:39', '0', '1', 'ff8080815e74b3f7015e74b509200003', '1');
INSERT INTO `usr_sign` VALUES ('402882f45f295eb8015f2969740a0000', '2017-10-18 10:07:15', null, '2017-10-17 16:18:18', '0', '1', '402881ef5ea8c2bd015ea8dfddf80003', '1');
INSERT INTO `usr_sign` VALUES ('ff8080815e5fd8b7015e6f8b58a90012', '2017-09-12 12:46:20', null, '2017-09-11 14:05:57', '0', '6', 'ff8080815e5fd8b7015e5fdc47b70006', '1');

-- ----------------------------
-- Table structure for `usr_sign_reward`
-- ----------------------------
DROP TABLE IF EXISTS `usr_sign_reward`;
CREATE TABLE `usr_sign_reward` (
  `id` varchar(255) NOT NULL,
  `appid` varchar(255) default NULL,
  `back_pic` varchar(255) default NULL,
  `reward_desc` varchar(255) default NULL,
  `reward_id` varchar(255) default NULL,
  `reward_name` varchar(255) default NULL,
  `sing_total` int(11) NOT NULL,
  `update_time` datetime default NULL,
  `update_user` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usr_sign_reward
-- ----------------------------

-- ----------------------------
-- Table structure for `usr_sign_reward_record`
-- ----------------------------
DROP TABLE IF EXISTS `usr_sign_reward_record`;
CREATE TABLE `usr_sign_reward_record` (
  `id` varchar(255) NOT NULL,
  `appid` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `data_json` varchar(255) default NULL,
  `profile_id` varchar(255) default NULL,
  `reward_id` varchar(255) default NULL,
  `reward_name` varchar(255) default NULL,
  `reward_status` int(11) NOT NULL default '1',
  `reward_type` int(11) NOT NULL,
  `reward_unit` varchar(255) default NULL,
  `reward_value` varchar(255) default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usr_sign_reward_record
-- ----------------------------

-- ----------------------------
-- Table structure for `usr_task`
-- ----------------------------
DROP TABLE IF EXISTS `usr_task`;
CREATE TABLE `usr_task` (
  `id` int(11) NOT NULL auto_increment,
  `task_name` varchar(100) NOT NULL COMMENT '任务名称',
  `task_description` varchar(2000) default NULL COMMENT '任务描述',
  `limit_type` tinyint(4) NOT NULL default '1' COMMENT '任务限制类型：1为不限制，2为按操作的每天次数限制，3为按操作的总次数限制，4为按操作的每天总积分限制，5按操作的总积分限制，99为特殊情况。',
  `limit_value` int(11) NOT NULL default '0' COMMENT '任务限制数值',
  `exp_value` int(11) NOT NULL default '0' COMMENT '增加或减少的经验值',
  `score_value` int(11) NOT NULL default '0' COMMENT '增加或减少的积分值',
  `task_status` tinyint(4) NOT NULL default '1' COMMENT '任务状态：1为正常，-1为停用',
  `display_status` tinyint(4) NOT NULL default '1' COMMENT '显示状态：1为在APP显示，-1为不显示',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户任务表';

-- ----------------------------
-- Records of usr_task
-- ----------------------------

-- ----------------------------
-- Table structure for `usr_token`
-- ----------------------------
DROP TABLE IF EXISTS `usr_token`;
CREATE TABLE `usr_token` (
  `token` char(32) NOT NULL COMMENT '主键：token值，MD5(gid+本地密钥字符串+create_time)',
  `gid` varchar(100) NOT NULL COMMENT '设备唯一ID',
  `appid` bigint(20) NOT NULL COMMENT '应用标识',
  `plat` int(11) NOT NULL COMMENT '平台号',
  `pn` varchar(50) NOT NULL COMMENT '渠道号',
  `profile_id` bigint(20) NOT NULL COMMENT '用户属性ID（usr_profile表主键）',
  `account_id` char(32) NOT NULL COMMENT '用户账户ID（usr_account表主键）',
  `valide_time` bigint(20) NOT NULL COMMENT '有效日期',
  `create_time` bigint(20) NOT NULL COMMENT '创建日期',
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY  (`token`),
  KEY `IDX_PN_ACCOUNT_ID` (`pn`,`account_id`),
  KEY `IDX_profile_id` (`profile_id`),
  KEY `IDX_UPDATE_TIME_PROFILE_ID` (`update_time`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token信息';

-- ----------------------------
-- Records of usr_token
-- ----------------------------

-- ----------------------------
-- Table structure for `vcode`
-- ----------------------------
DROP TABLE IF EXISTS `vcode`;
CREATE TABLE `vcode` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `expiratio_time` datetime default NULL,
  `phone` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机验证';

-- ----------------------------
-- Records of vcode
-- ----------------------------
INSERT INTO `vcode` VALUES ('402881ef5ea8c2bd015ea8dfb1d60000', '351508', '2017-09-22 17:16:26', '2017-09-22 17:17:26', '15251816837');
INSERT INTO `vcode` VALUES ('ff8080815e74b3f7015e74b4d75b0000', '856885', '2017-10-12 14:11:40', '2017-10-12 14:12:40', '17327730101');
INSERT INTO `vcode` VALUES ('ff8080815e74b3f7015e74b5b00e0005', '322360', '2017-09-12 14:10:18', '2017-09-12 14:11:18', '15712898241');

-- ----------------------------
-- Table structure for `zz_daily_time`
-- ----------------------------
DROP TABLE IF EXISTS `zz_daily_time`;
CREATE TABLE `zz_daily_time` (
  `id` varchar(255) NOT NULL default '',
  `state` int(11) NOT NULL COMMENT '是否打卡',
  `quantum` varchar(255) NOT NULL COMMENT '时间段',
  `staffid` varchar(255) NOT NULL COMMENT '人员id',
  `addtime` datetime NOT NULL COMMENT '创建时间',
  `punchtime` datetime NOT NULL COMMENT '打卡时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zz_daily_time
-- ----------------------------

-- ----------------------------
-- Table structure for `zz_product_children_duties`
-- ----------------------------
DROP TABLE IF EXISTS `zz_product_children_duties`;
CREATE TABLE `zz_product_children_duties` (
  `id` varchar(255) NOT NULL,
  `creator` varchar(255) default NULL,
  `creator_id` varchar(255) default NULL,
  `model_id` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `product_id` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  `duty_id` varchar(255) default NULL,
  `attach_id` varchar(255) default NULL,
  `customer` varchar(255) default NULL,
  `customer_notes` varchar(255) default NULL,
  `design` varchar(255) default NULL,
  `design_notes` varchar(255) default NULL,
  `review` varchar(255) default NULL,
  `risk` varchar(255) default NULL,
  `risk_notes` varchar(255) default NULL,
  `skill` varchar(255) default NULL,
  `skill_notes` varchar(255) default NULL,
  `span` varchar(255) default NULL COMMENT '完成子任务需要的时间',
  `run` varchar(255) default NULL COMMENT '子任务的冲刺周期',
  `remark` varchar(255) default NULL COMMENT '子任务注释',
  `docurl` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zz_product_children_duties
-- ----------------------------
INSERT INTO `zz_product_children_duties` VALUES ('402882e56078c147016078c2a4ce0001', 'zhizhuang', null, '402882e5606e3cb701606e5725000009', 'aaaaaa', '402882e5607880f9016078bcf8f80009', '0', '402882e56078c147016078c2a4ce0001', null, '402882e66053fd83016053ff4c2c0001', '喵喵喵#', '402882e660532af70160535785160009', '呐呐呐#', '402882e6603448670160346f75190002', '402882e660532af70160535718760006', '别别别#', '1,2', 'wwwww#ccc#,wwwww,ccc,擦擦擦,哎哎哎', '1小时', '0', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e56078c147016078c2e3360002', 'test', null, '402882e5606e3cb701606e5725000009', 'bbbbbb', '402882e5607880f9016078bcf8f80009', '1', '402882e56078c147016078c2e3360002', null, '402882e66053fd83016053ff4c2c0001', null, '402882e660532af70160535785160009', null, '402882e660357d29016035a8c7d90009', '402882e660532af70160535718760006', null, '402882e660532af701605356f9450005', null, '1.5小时', '0', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e5607bc3ff01607bc7a5840003', 'zhizhuang', null, '402882e5606e3cb701606e5725000009', 'cccccc', '402882e5607880f9016078bcf8f80009', '0', '402882e5607bc3ff01607bc7a5840003', null, '402882e66053fd83016053ff4c2c0001,402882e6605466890160547a8c070008', null, '4,402882e660532af70160535735180007', null, '402882e660357d29016035a8c7d90009', '402882e660532af70160535718760006,5', null, '1,402882e660532af701605356f9450005,402882e660584f120160594e45720005', null, '1小时', '0', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e5607bc3ff01607bc8a1830006', 'baishui', null, '402882e5606e3cb701606e5707d40008', 'dddddd', '402882e5607880f9016078bcf8f80009', '1', '402882e5607bc3ff01607bc8a1830006', null, '402882e66053fd83016053ff4c2c0001', null, '402882e660532af70160535785160009', null, '402882e6603448670160346fc0f40003', '402882e660532af70160535718760006', null, '402882e660532af701605356f9450005', null, '0.5小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e5607bf60e01607bfa0e260002', 'admin', null, '402882e5606e3cb701606e5707d40008', 'DDDddd', '402882e5607880f9016078bcf8f80009', '2', '402882e5607bf60e01607bfa0e260002', null, '402882e66053fd83016053ff4c2c0001', null, '402882e660532af70160535735180007', null, '1', '402882e660532af70160535718760006', null, '402882e660584f120160594e45720005', null, '0.5小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e5607c455a01607c48d07a0006', 'admin', null, '2', 'zzzz', '402882e5607c455a01607c46a3bd0001', '0', '402882e5607c455a01607c47d1930005', '', '402882e66053fd83016053ff4c2c0001', null, '402882e660532af70160535735180007', null, '1', '402882e660532af70160535718760006', null, '402882e660532af701605356f9450005', null, '1小时', '0', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e5607c455a01607c54a5590007', 'admin', null, '3', '阿打算的', '402882e5607c455a01607c46a3bd0001', '2', '402882e5607c455a01607c47d1930005', '', '402882e66053fd83016053ff4c2c0001', null, '402882e660532af70160535735180007', null, '402882e6603448670160346f75190002', '402882e660532af70160535718760006', null, '402882e660532af701605356f9450005', null, '2小时', '0', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e5607c455a01607c54d1780008', 'admin', null, '2', '撒大声地', '402882e5607c455a01607c46a3bd0001', '', '402882e5607c455a01607c47d1930005', '', '402882e66053fd83016053ff4c2c0001', null, '402882e660532af70160535735180007', null, '402882e6603448670160346f75190002', '402882e660532af70160535718760006', null, '402882e660532af701605356f9450005', null, '2小时', '0', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e5607c455a01607c5a5059000a', 'admin', null, '2', '驱蚊器翁', '402882e5607c455a01607c46a3bd0001', '2', '402882e5607c455a01607c5951200009', '', '402882e66053fd83016053ff4c2c0001', null, '402882e660532af70160535735180007', null, '1', '402882e660532af70160535718760006', null, '402882e660532af701605356f9450005', null, '2小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e5607c455a01607c5a7bb5000b', 'admin', null, '2', '而且', '402882e5607c455a01607c46a3bd0001', '2', '402882e5607c455a01607c5951200009', '', '402882e66053fd83016053ff4c2c0001', null, '402882e660532af70160535735180007', null, '4028b88158e243d20158e244c6fc0002', '402882e660532af70160535718760006', null, '402882e660532af701605356f9450005', null, '2小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e56081c886016081caaac10003', 'admin', null, '2', 'eqweqwe', '402882e56081701a01608193fc140003', '1', '402882e56081c886016081ca74ea0002', '', '402882e66053fd83016053ff4c2c0001', null, '402882e660532af70160535735180007', null, '1', '402882e660532af70160535718760006', null, '402882e660532af701605356f9450005', null, '1小时', '0', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e5608b575c01608b88e68d0008', 'admin', null, '402882e5606e3cb701606e56ced70006', 'a', '402882e56082358a016082387e400001', '1', '402882e5608b575c01608b88e68d0008', null, '402882e66053fd83016053ff4c2c0001', null, '402882e660532af70160535785160009', null, '402882e6603448670160346f75190002', '402882e660532af70160535718760006', null, '402882e660532af701605356f9450005', null, '2小时', '0', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e5608c34fe01608c4846df0001', 'admin', null, '402882e5606e3cb701606e5707d40008', 'eeeeeeeeee', '402882e5607880f9016078bcf8f80009', '1', '402882e5607bc3ff01607bc85a9f0005', '', '402882e66053fd83016053ff4c2c0001', null, '402882e660532af70160535735180007,402882e660532af70160535785160009', null, '1', '402882e660532af70160535718760006', null, '402882e660532af701605356f9450005', null, '1小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e5608c34fe01608c4885650002', 'admin', null, '402882e5606e3cb701606e5707d40008', 'fffffffff', '402882e5607880f9016078bcf8f80009', '0', '402882e5607bc3ff01607bc85a9f0005', '', '402882e66053fd83016053ff4c2c0001', null, '402882e660532af70160535785160009', null, '402882e660357d29016035a8c7d90009', '402882e660532af70160535718760006', null, '402882e660532af701605356f9450005', null, '2小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e5608c34fe01608c48e2600003', 'admin', null, '402882e5606e3cb701606e5707d40008', 'ggggggggg', '402882e5607880f9016078bcf8f80009', '1', '402882e5607bc3ff01607bc85a9f0005', '', '402882e6605466890160547a8c070008', null, '402882e660532af70160535735180007', null, '402882e6603448670160346fc0f40003', '402882e660532af70160535718760006', null, '402882e660532af701605356f9450005', null, '2小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e5608c34fe01608c4a2da20004', 'admin', null, '402882e5606e3cb701606e5725000009', 'hhhhhhhhh', '402882e5607880f9016078bcf8f80009', '1', '402882e5607880f9016078be4fe6000e', '', null, null, null, null, '402882e6603448670160346f75190002', null, null, '402882e660532af701605356f9450005', null, '2小时', '0', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e5608c34fe01608d47ce460009', 'admin', null, '402882e5606e3cb701606e56e04d0007', 'AAA', '402882e56082358a016082387e400001', '1', '402882e5608b575c01608b86935c0005', '', '402882e6605466890160547a8c070008', null, '402882e660532af70160535785160009', null, '402882e6603448670160346fc0f40003', '5', null, '1,2', null, '2小时', '0', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e56097170b0160973b4ca60003', 'admin', null, '402882e5606e3cb701606e5707d40008', '表1', '402882e56096562001609666be070000', '0', '402882e56097170b0160973b4ca60003', null, '6', '是是是111#', '4', '呜呜呜111#', '1', '3,402882e660532af70160535718760006', '呵呵呵111#别别别111#', '1,402882e660584f120160594e45720005', '哈哈哈111#哎哎哎111#', '1小时', '0', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e56097170b0160973d19d30006', 'admin', null, '402882e5606e3cb701606e5707d40008', '页面1', '402882e56096562001609666be070000', '1', '402882e56097170b0160973d19d30006', null, '402882e66053fd83016053ff4c2c0001', '喵喵喵222#', '4', '呜呜呜222#', '402882e660357d29016035a8c7d90009', '3', '呵呵呵222#', '1,2', '哈哈哈222#发发发222#', '2小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e560a0093f0160a011ff100001', 'admin', null, '402882e5606e3cb701606e5707d40008', 'qweqwe', '402882e56096562001609666be070000', '', '402882e560a0093f0160a011ff100001', null, '402882e6605466890160547a8c070008,6', '呀呀qwqe#哎哎哎weqe#', '4', '好啊#', '1', '402882e660532af70160535718760006', '哎呀#', '1,402882e660584f120160594e45720005', '呀呀qwqe#哎哎哎weqe#', '2小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e560a0132f0160a01416180001', 'admin', null, '402882e5606e3cb701606e5707d40008', 'qqqq', '402882e56096562001609666be070000', '', '402882e56097170b0160973cc33a0005', '', '402882e66053fd83016053ff4c2c0001', '嗯呐#', '4', '啦啦#', '402882e6603448670160346f75190002', '3', '哈哈#', '1', '炸弹#', '2小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e560a015780160a01646e10001', 'admin', null, '402882e5606e3cb701606e5707d40008', 'qweqwe', '402882e56096562001609666be070000', '1', '402882e56097170b0160973af7ab0002', '', '402882e66053fd83016053ff4c2c0001', '嗯哼#', '4', '哦哦#', '402882e6603448670160346fc0f40003', '3', '挨骂#', '1', '新球#', '1.5小时', '0', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e560a015780160a01dbc410002', 'admin', null, '402882e5606e3cb701606e5707d40008', 'aaaaaaaaaaaaaa', '402882e56096562001609666be070000', '1', '402882e560a015780160a01dbc410002', null, '402882e66053fd83016053ff4c2c0001,402882e6605466890160547a8c070008', '', '402882e660532af70160535735180007,402882e660532af70160535785160009', '', '402882e660357d29016035a8c7d90009', '402882e660532af70160535718760006,5', '', '1,2,402882e660532af701605356f9450005', '', '2小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e560a015780160a06033fd0004', 'admin', null, '402882e5606e3cb701606e5707d40008', 'bbbbb', '402882e56096562001609666be070000', '1', '402882e56097170b0160973cc33a0005', '', '402882e66053fd83016053ff4c2c0001,402882e6605466890160547a8c070008', '喵喵喵#啊啊啊#', '402882e660532af70160535735180007', '不不不#', '402882e660357d29016035a8c7d90009', '402882e660532af70160535718760006,5', '别别别#嗷嗷嗷#', '1,402882e660532af701605356f9450005', '哈哈哈#擦擦擦#', '2小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e560b4868d0160b4af86840006', 'admin', null, '402882e5606e3cb701606e5707d40008', '112315', '402882e56096562001609666be070000', '1', '402882e56097170b0160973cc33a0005', '', '402882e6605466890160547a8c070008', '啊啊啊#', '4', '呜呜呜#', '402882e6603448670160346f75190002', '402882e660532af70160535718760006', '别别别#', '1,2', '哈哈哈#发发发#', '2小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e560bfa1d60160bfadb13d0007', 'admin', null, '402882e5606e3cb701606e56ced70006', 'rrrrr', '402882e560bfa1d60160bfa4d83e0001', '0', '402882e560bfa1d60160bfadb13d0007', null, '402882e66053fd83016053ff4c2c0001,402882e6605466890160547a8c070008', null, '4,402882e660532af70160535785160009', null, '402882e660357d29016035a8c7d90009', '3,402882e660532af70160535718760006', null, '1,2,402882e660532af701605356f9450005', '111111,发发发,擦擦擦,哎哎哎', '2小时', '0', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e560bfa1d60160bfadfde80008', 'admin', null, '402882e5606e3cb701606e56e04d0007', 'ttttt', '402882e560bfa1d60160bfa4d83e0001', '1', '402882e560bfa1d60160bfadfde80008', null, '402882e6605466890160547a8c070008', null, '4,402882e660532af70160535735180007', null, '402882e660357d29016035a8c7d90009', '3,5', null, '1,2,402882e660584f120160594e45720005', null, '1.5小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e560bfe0fe0160bfee59560001', 'admin', null, '402882e5606e3cb701606e56ced70006', '111111', '402882e560bfa1d60160bfa4d83e0001', '0', '402882e560bfe0fe0160bfee59560001', null, '402882e66053fd83016053ff4c2c0001,402882e6605466890160547a8c070008', null, '4,402882e660532af70160535735180007', null, '1', '402882e660532af70160535718760006', null, '1,2', null, '2小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e560c01a090160c028bf7d0001', 'admin', null, '402882e5606e3cb701606e56ced70006', '987', '402882e560bfa1d60160bfa4d83e0001', '0', '402882e560c01a090160c028bf7d0001', null, '402882e66053fd83016053ff4c2c0001,402882e6605466890160547a8c070008', '123#发发发#', '4,402882e660532af70160535735180007', '333#不不不#', '402882e660357d29016035a8c7d90009', '3', '222#', '1,2', '444#发发发#,444,发发发,擦擦擦,哎哎哎', '2小时', '0', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e560c3e7b30160c3f72d160001', 'admin', null, '402882e5606e3cb701606e56ced70006', '8888888', '402882e560bfa1d60160bfa4d83e0001', '0', '402882e560c3e7b30160c3f72d160001', null, '402882e66053fd83016053ff4c2c0001,402882e6605466890160547a8c070008', '喵喵喵#啊啊啊#', '4', '呜呜呜#', '402882e660357d29016035a8c7d90009', '402882e660532af70160535718760006', '别别别#', '1,2', '777777#发发发#,777777,发发发,擦擦擦,哎哎哎', '2小时', '1', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e560c4388c0160c56dec830008', 'admin', null, '402882e5606e3cb701606e56ced70006', 'qqq', '402882e560bfa1d60160bfa4d83e0001', '1', '402882e560c4388c0160c56dec830008', null, '402882e66053fd83016053ff4c2c0001,402882e6605466890160547a8c070008', '喵喵喵#啊啊啊#', '402882e660532af70160535735180007', '不不不#', '402882e6603448670160346f75190002', '3', '呵呵呵#', '1,2,402882e660532af701605356f9450005', '1111#发发发#擦擦擦#,1111,发发发,擦擦擦,哎哎哎', '2小时', '2', null, null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e560c985e70160c9874d990001', 'admin', null, '402882e5606e3cb701606e56ced70006', 'abc', '402882e560bfa1d60160bfa4d83e0001', '0', '402882e560bfa1d60160bfa6036a0004', '', '402882e6605466890160547a8c070008,6', '啊啊啊#是是是#', '402882e660532af70160535735180007', '不不不#', '402882e6603448670160346fc0f40003', '3,402882e660532af70160535718760006', '呵呵呵#别别别#', '1,2', '哈哈哈#发发发#', '2小时', '0', 'qqqqqqqqqqqqqqq', null);
INSERT INTO `zz_product_children_duties` VALUES ('402882e560d35e4a0160d35f35160001', 'admin', null, '402882e5606e3cb701606e56ced70006', '1', '402882e560bfa1d60160bfa4d83e0001', '0', '402882e560bfa1d60160bfa6036a0004', null, '402882e6605466890160547a8c070008', '啊啊啊#', '4', '呜呜呜#', '1', '402882e660532af70160535718760006', '别别别#', '1', '哈哈哈#', '2小时', '0', '1', null);

-- ----------------------------
-- Table structure for `zz_product_main`
-- ----------------------------
DROP TABLE IF EXISTS `zz_product_main`;
CREATE TABLE `zz_product_main` (
  `id` varchar(255) NOT NULL,
  `end_time` datetime default NULL,
  `pic_url` varchar(255) default NULL,
  `product_actor` varchar(255) default NULL,
  `product_dept` varchar(255) default NULL,
  `product_desc` varchar(255) default NULL,
  `product_location` varchar(255) default NULL,
  `product_manager` varchar(255) default NULL,
  `product_model` varchar(255) default NULL,
  `product_name` varchar(255) default NULL,
  `serial_num` int(11) default NULL,
  `start_time` datetime default NULL,
  `product_status` varchar(255) default NULL,
  `product_dept_name` varchar(255) default NULL,
  `product_manager_name` varchar(255) default NULL,
  `islocked` varchar(255) default NULL,
  `iteration` varchar(255) default NULL COMMENT '迭代周期',
  `workhour` varchar(255) default NULL COMMENT '每天工作时长',
  `addtime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zz_product_main
-- ----------------------------
INSERT INTO `zz_product_main` VALUES ('       ', '2018-01-02 00:00:00', null, '1', '2', '阿萨德', '', '1', '1', '测试', '0', '2017-12-21 00:00:00', '1', null, null, '1', '15工作日/周期', '120小时/周期', '2017-12-06 14:27');
INSERT INTO `zz_product_main` VALUES ('402882e56077d86a016077d983080001', '2017-12-31 09:24:24', null, '1,4028b88158e243d20158e244c6fc0002', '402882e6602e909401602e9254cd0001', '驱蚊器翁', '', '1', '1', '哎哎哎', '0', '2017-12-21 14:53:41', '1', null, null, '1', '10工作日/周期', '80小时/周期', '2017-10-26 14:27');
INSERT INTO `zz_product_main` VALUES ('402882e56077fd57016077fe9ba10001', '2017-12-31 08:21:20', null, '4028b88158e243d20158e244c6fc0002', '2', '213', '', '402882e6603448670160346fc0f40003', '1', '1122333', '0', '2017-12-21 15:34:12', '1', null, null, '1', '10工作日/周期', '100小时/周期', '2017-09-20 14:28');
INSERT INTO `zz_product_main` VALUES ('402882e5607803630160780476470001', '2017-12-31 13:38:38', null, '1,4028b88158e243d20158e244c6fc0002', '402882e660357d29016035a853db0008', '', '', '1', '1', 'wbgdjrgwqhejrklhwio ', '0', '2017-12-21 15:40:38', '-1', null, null, '1', '10工作日/周期', '80小时/周期', '2017-12-21 14:28');
INSERT INTO `zz_product_main` VALUES ('402882e56078140a0160781b6e5a0005', '2017-12-31 00:00:00', null, '1', '2', '王企鹅额', '', '1', '402882e5606e3cb701606e5699520004', '哦了', '0', '2017-12-21 00:00:00', '1', null, null, '0', '10工作日/周期', '80小时/周期', '2017-12-13 14:28');
INSERT INTO `zz_product_main` VALUES ('402882e5607880f9016078824aea0001', '2017-12-31 13:34:34', null, '4028b88158e243d20158e244c6fc0002,1', '2', 'eqweqwe', '', '1', '1', '123456789', '0', '2017-12-21 17:58:03', '1', null, null, '1', '10工作日/周期', '100小时/周期', '2017-12-14 14:28');
INSERT INTO `zz_product_main` VALUES ('402882e5607880f9016078bcf8f80009', '2017-12-31 00:00:00', null, '402882e6603448670160346f75190002,402882e660357d29016035a8c7d90009', '2', '驱蚊器翁', '', '1', '402882e5606e3cb701606e56b5ed0005', '123456789', '0', '2017-12-21 00:00:00', '-1', null, null, '0', '15工作日/周期', '150小时/周期', '2017-12-15 14:28');
INSERT INTO `zz_product_main` VALUES ('402882e5607c455a01607c46a3bd0001', '2017-12-22 18:47:52', null, '1', '402882e65fe15289015fe28c54510005', 'wqewq', '', '1', '1', 'abcdefg', '0', '2017-12-22 11:31:16', '1', null, null, '1', '1工作日/周期', '5小时/周期', '2017-12-22 14:20');
INSERT INTO `zz_product_main` VALUES ('402882e5607cd57d01607ceb586d0001', '2017-12-31 10:40:36', null, '402882e6603448670160346f75190002', '2', 'qwe', '', '1', '1', 'wdvhi', '0', '2017-12-22 14:31:18', '1', null, null, '0', '10工作日/周期', '80小时/周期', '2017-12-21 14:28');
INSERT INTO `zz_product_main` VALUES ('402882e56081701a0160817c59400001', '2017-12-29 00:00:00', null, '1', '2', 'eqwe', '', '1', '402882e5606e3cb701606e5699520004', '哈哈哈', '0', '2017-12-21 00:00:00', '1', null, null, '0', '10工作日/周期', '80小时/周期', '2017-12-20 14:28');
INSERT INTO `zz_product_main` VALUES ('402882e56081701a01608193fc140003', '2017-12-23 13:34:33', null, '4028b88158e243d20158e244c6fc0002', '2', 'wqeqwe', '', '1', '1', '987654321', '0', '2017-12-23 12:13:55', '1', null, null, '0', '5工作日/周期', '40小时/周期', '2017-12-19 14:29');
INSERT INTO `zz_product_main` VALUES ('402882e56082073f0160820884ae0001', '2017-12-31 12:30:30', null, '4028b88158e243d20158e244c6fc0002', '402882e660357d29016035a853db0008', 'qweqweqweqweqweqwe', '', '402882e6603448670160346fc0f40003', '402882e5606e3cb701606e5699520004', 'qqqqqqqqqqqqqq', '0', '2017-12-23 14:21:15', '1', null, null, '1', '10工作日/周期', '80小时/周期', '2017-12-23 14:20');
INSERT INTO `zz_product_main` VALUES ('402882e56082358a016082387e400001', '2017-12-31 12:38:33', null, '402882e6603448670160346f75190002', '2', 'wqeqweq', '', '402882e6603448670160346f75190002', '402882e5606e3cb701606e56b5ed0005', '请问1', '0', '2017-12-23 15:13:38', '1', null, null, '1', '15工作日/周期', '120小时/周期', '2017-12-23 15:13');
INSERT INTO `zz_product_main` VALUES ('402882e5608239060160823a11b50001', '2017-12-31 07:24:22', null, '1,4028b88158e243d20158e244c6fc0002', '2', 'weqweqwe', '', '402882e6603448670160346f75190002', '1,402882e5606e3cb701606e56b5ed0005', 'lalala', '0', '2017-12-23 15:15:24', '1', null, null, '1', '10工作日/周期', '100小时/周期', '2017-12-23 15:15');
INSERT INTO `zz_product_main` VALUES ('402882e560959e84016095a6bfae0002', '2017-12-31 08:20:27', null, '1,402882e6603448670160346fc0f40003', '402882e660357d29016035a853db0008', '恶趣味热', '', '1', '1', '最后第一', '0', '2017-12-27 09:46:47', '1', null, null, '0', '10工作日/周期', '80小时/周期', '2017-12-27 09:47');
INSERT INTO `zz_product_main` VALUES ('402882e56096562001609666be070000', '2017-12-31 13:16:35', null, '1,402882e660357d29016035a8c7d90009,402882e6603448670160346f75190002', '402882e660357d29016035a853db0008', '开始啦', '', '1', '402882e5606e3cb701606e56b5ed0005', '阳光项目', '0', '2017-12-27 13:16:27', '1', null, null, '0', '10工作日/周期', '80小时/周期', '2017-12-27 13:16');
INSERT INTO `zz_product_main` VALUES ('402882e560bfa1d60160bfa4d83e0001', '2018-01-31 00:00:00', null, '402882e6603448670160346fc0f40003', '402882e6602e909401602e9254cd0001', 'wqe', '', '1', '402882e5606e3cb701606e5699520004', 'qqq', '0', '2018-01-04 13:28:47', '1', null, null, '0', '10工作日/周期', '80小时/周期', '2018-01-04 13:28');

-- ----------------------------
-- Table structure for `zz_product_model_main`
-- ----------------------------
DROP TABLE IF EXISTS `zz_product_model_main`;
CREATE TABLE `zz_product_model_main` (
  `id` varchar(255) NOT NULL,
  `product_model_name` varchar(255) default NULL,
  `parent_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zz_product_model_main
-- ----------------------------
INSERT INTO `zz_product_model_main` VALUES ('1', '测试', '0');
INSERT INTO `zz_product_model_main` VALUES ('2', '1111', '1');
INSERT INTO `zz_product_model_main` VALUES ('3', '2222', '1');
INSERT INTO `zz_product_model_main` VALUES ('4', '3333', '1');
INSERT INTO `zz_product_model_main` VALUES ('402882e5606e3cb701606e5699520004', '哈哈哈', '0');
INSERT INTO `zz_product_model_main` VALUES ('402882e5606e3cb701606e56b5ed0005', '啦啦啦', '0');
INSERT INTO `zz_product_model_main` VALUES ('402882e5606e3cb701606e56ced70006', 'aaaa', '402882e5606e3cb701606e5699520004');
INSERT INTO `zz_product_model_main` VALUES ('402882e5606e3cb701606e56e04d0007', 'bbbb', '402882e5606e3cb701606e5699520004');
INSERT INTO `zz_product_model_main` VALUES ('402882e5606e3cb701606e5707d40008', 'AAAA', '402882e5606e3cb701606e56b5ed0005');
INSERT INTO `zz_product_model_main` VALUES ('402882e5606e3cb701606e5725000009', 'BBBB', '402882e5606e3cb701606e56b5ed0005');
INSERT INTO `zz_product_model_main` VALUES ('402882e5608c34fe01608c4b21320005', 'CCCC', '402882e5606e3cb701606e56b5ed0005');
INSERT INTO `zz_product_model_main` VALUES ('402882e5608c34fe01608c4b48f80006', 'cccc', '402882e5606e3cb701606e5699520004');
INSERT INTO `zz_product_model_main` VALUES ('402882e56090787a016090b2c74e0002', 'dddd', '402882e5606e3cb701606e5699520004');
INSERT INTO `zz_product_model_main` VALUES ('402882e56090787a016090b6d3fb0003', 'wt4wet5e5et5', '1');
INSERT INTO `zz_product_model_main` VALUES ('402882e560959c9b0160959d365b0001', 'AAA', '0');
INSERT INTO `zz_product_model_main` VALUES ('402882e560959c9b0160959d4e120002', 'BBB', '0');
INSERT INTO `zz_product_model_main` VALUES ('402882e560959c9b0160959d60bc0003', 'CCC', '0');
INSERT INTO `zz_product_model_main` VALUES ('402882e560959e840160959f16020001', 'DDD', '0');
INSERT INTO `zz_product_model_main` VALUES ('402882e560959e84016095a8cb8d0003', 'XXX', '402882e560959e840160959f16020001');
INSERT INTO `zz_product_model_main` VALUES ('402882e560959e84016095a8e31f0004', 'YYY', '402882e560959e840160959f16020001');
INSERT INTO `zz_product_model_main` VALUES ('402882e560959e84016095a8f8860005', 'ZZZ', '402882e560959e840160959f16020001');
INSERT INTO `zz_product_model_main` VALUES ('402882e560959e84016095aa03ba0006', 'EEE', '0');
INSERT INTO `zz_product_model_main` VALUES ('402882e560b4868d0160b4a576620002', '123', '0');
INSERT INTO `zz_product_model_main` VALUES ('402882e560b4868d0160b4a592c60003', '111', '402882e560b4868d0160b4a576620002');
INSERT INTO `zz_product_model_main` VALUES ('402882e560b4868d0160b4a5a2e30004', '222', '402882e560b4868d0160b4a576620002');
INSERT INTO `zz_product_model_main` VALUES ('402882e560b4868d0160b4a5b26e0005', '333', '402882e560b4868d0160b4a576620002');
INSERT INTO `zz_product_model_main` VALUES ('402882e560c4388c0160c55d53440005', 'qqqqq', '402882e560b4868d0160b4a576620002');

-- ----------------------------
-- Table structure for `zz_product_stories_duties`
-- ----------------------------
DROP TABLE IF EXISTS `zz_product_stories_duties`;
CREATE TABLE `zz_product_stories_duties` (
  `id` varchar(255) NOT NULL,
  `end_time` datetime default NULL,
  `expanded` bit(1) NOT NULL,
  `isleaf` bit(1) NOT NULL,
  `level` int(11) NOT NULL,
  `loaded` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` varchar(255) NOT NULL,
  `start_time` datetime default NULL,
  `creator` varchar(255) default NULL,
  `pro_id` varchar(255) default NULL,
  `run` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zz_product_stories_duties
-- ----------------------------
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56077fd57016078024d110003', '2017-12-21 15:38:24', '', '', '0', '', '哎哎哎', '0', '2017-12-21 15:38:24', 'admin', '402882e56077d86a016077d983080001', '10工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56078036301607804868a0002', '2017-12-21 15:40:50', '', '', '0', '', '11', '0', '2017-12-21 15:40:50', 'admin', '402882e5607803630160780476470001', '10工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56078036301607804b9e30003', '2017-12-23 00:00:00', '', '', '1', '', '111', '402882e56078036301607804868a0002', '2017-12-21 00:00:00', '1', '402882e5607803630160780476470001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56078036301607804fba80004', '2017-12-25 00:00:00', '', '', '1', '', '22', '402882e56078036301607804868a0002', '2017-12-21 00:00:00', '2', '402882e5607803630160780476470001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560780363016078052b720005', '2017-12-23 00:00:00', '', '', '1', '', '33', '402882e56078036301607804868a0002', '2017-12-21 00:00:00', '3', '402882e5607803630160780476470001', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607803630160780560b60006', '2017-12-23 00:00:00', '', '', '1', '', '44', '402882e56078036301607804868a0002', '2017-12-21 00:00:00', '4', '402882e5607803630160780476470001', '2');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56078140a01607814e4520001', '2017-12-23 00:00:00', '', '', '1', '', 'qewe', '402882e56078036301607804868a0002', '2017-12-21 00:00:00', 'q', '402882e5607803630160780476470001', '2');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56078140a0160781513c90002', '2017-12-29 00:00:00', '', '', '1', '', 'qweqwee', '402882e56078036301607804868a0002', '2017-12-21 00:00:00', 'q', '402882e5607803630160780476470001', '3');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56078140a016078157a1a0003', '2017-12-21 00:00:00', '', '', '1', '', 'wqeqw', '402882e56078036301607804868a0002', '2017-12-21 00:00:00', 'qwe', '402882e5607803630160780476470001', '3');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56078140a01607815b1460004', '2017-12-23 00:00:00', '', '', '1', '', 'ewqeqwe', '402882e56078036301607804868a0002', '2017-12-21 00:00:00', 'QQ群', '402882e5607803630160780476470001', '4');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56078140a0160781b796b0006', '2017-12-27 15:30:36', '', '', '0', '', '哦了', '0', '2017-12-27 15:30:36', 'admin', '402882e56078140a0160781b6e5a0005', '10工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56078140a0160781bbeb80007', '2017-12-29 00:00:00', '', '', '1', '', '驱蚊器翁', '402882e56078140a0160781b796b0006', '2017-12-21 00:00:00', '王企鹅', '402882e56078140a0160781b6e5a0005', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56078140a0160781be9430008', '2017-12-23 00:00:00', '', '', '1', '', '驱蚊器翁', '402882e56078140a0160781b796b0006', '2017-12-21 00:00:00', '诶我去', '402882e56078140a0160781b6e5a0005', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56078140a0160781c155c0009', '2017-12-23 00:00:00', '', '', '1', '', '额外企鹅', '402882e56078140a0160781b796b0006', '2017-12-21 00:00:00', '恶趣味', '402882e56078140a0160781b6e5a0005', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56078140a0160781c3e7b000a', '2017-12-29 00:00:00', '', '', '1', '', '恶趣味', '402882e56078140a0160781b796b0006', '2017-12-21 00:00:00', '去', '402882e56078140a0160781b6e5a0005', '2');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56078140a0160781c795a000b', '2017-12-23 00:00:00', '', '', '2', '', '额外企鹅', '402882e56078140a0160781bbeb80007', '2017-12-21 00:00:00', '恶趣味', '402882e56078140a0160781b6e5a0005', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56078140a0160781ca2c5000c', '2017-12-23 00:00:00', '', '', '2', '', '我去恶趣味', '402882e56078140a0160781c3e7b000a', '2017-12-21 00:00:00', '委屈', '402882e56078140a0160781b6e5a0005', '2');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607829710160782a7dd50001', '2017-12-23 00:00:00', '', '', '1', '', 'qwewe', '402882e56078140a0160781b796b0006', '2017-12-21 00:00:00', 'eqweqw', '402882e56078140a0160781b6e5a0005', '3');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560782c090160782cbe620001', '2017-12-23 00:00:00', '', '', '1', '', 'qweqweqwe', '402882e56078140a0160781b796b0006', '2017-12-21 00:00:00', 'qewqe', '402882e56078140a0160781b6e5a0005', '3');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560782d790160782e32080001', '2017-12-23 00:00:00', '', '', '1', '', 'wqeqweqwe', '402882e56078140a0160781b796b0006', '2017-12-21 00:00:00', 'eqweqwe', '402882e56078140a0160781b6e5a0005', '3');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560782d790160784635960002', '2017-12-23 00:00:00', '', '', '1', '', 'ftgf', '402882e56077fd57016078024d110003', '2017-12-21 00:00:00', '14', '402882e56077d86a016077d983080001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560782d790160784690360003', '2017-12-23 18:00:00', '', '', '2', '', '111', '402882e560782d790160784635960002', '2017-12-21 09:00:00', '1', '402882e56077d86a016077d983080001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607880f901607892c2820002', '2017-12-21 18:16:12', '', '', '0', '', '123456789', '0', '2017-12-21 18:16:12', 'admin', '402882e5607880f9016078824aea0001', '10工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607880f9016078933acd0003', '2017-12-23 00:00:00', '', '', '1', '', '火火火火火', '402882e5607880f901607892c2820002', '2017-12-21 00:00:00', '火', '402882e5607880f9016078824aea0001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607880f90160789388df0004', '2017-12-23 00:00:00', '', '', '2', '', '嚯嚯嚯嚯嚯', '402882e5607880f9016078933acd0003', '2017-12-21 00:00:00', '嚯', '402882e5607880f9016078824aea0001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607880f9016078a52d480006', '2017-12-23 00:00:00', '', '', '1', '', '哈哈哈哈哈', '402882e5607880f901607892c2820002', '2017-12-21 00:00:00', '哈', '402882e5607880f9016078824aea0001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607880f9016078a578530007', '2017-12-23 00:00:00', '', '', '2', '', '呵呵呵呵呵', '402882e5607880f9016078a52d480006', '2017-12-21 00:00:00', '呵', '402882e5607880f9016078824aea0001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607880f9016078bd14f3000a', '2017-12-28 14:37:43', '', '', '0', '', '123456789', '0', '2017-12-28 14:37:43', 'admin', '402882e5607880f9016078bcf8f80009', '15工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607880f9016078bd5e9c000b', '2017-12-23 00:00:00', '', '', '1', '', 'AAAAAAAAAA', '402882e5607880f9016078bd14f3000a', '2017-12-21 00:00:00', 'A', '402882e5607880f9016078bcf8f80009', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607880f9016078bd98b3000c', '2017-12-23 00:00:00', '', '', '1', '', 'BBBBBBBBBB', '402882e5607880f9016078bd14f3000a', '2017-12-21 00:00:00', 'B', '402882e5607880f9016078bcf8f80009', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607880f9016078be1d70000d', '2017-12-23 00:00:00', '', '', '2', '', 'aaaaaaaaaa', '402882e5607880f9016078bd5e9c000b', '2017-12-21 00:00:00', 'a', '402882e5607880f9016078bcf8f80009', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607880f9016078be4fe6000e', '2017-12-23 00:00:00', '', '', '2', '', 'bbbbbbbbbb', '402882e5607880f9016078bd98b3000c', '2017-12-21 00:00:00', 'b', '402882e5607880f9016078bcf8f80009', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607bc3ff01607bc71f710001', '2017-12-23 00:00:00', '', '', '1', '', 'CCCCCCCCCC', '402882e5607880f9016078bd14f3000a', '2017-12-21 00:00:00', 'c', '402882e5607880f9016078bcf8f80009', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607bc3ff01607bc74d580002', '2017-12-23 00:00:00', '', '', '2', '', 'cccccccccc', '402882e5607bc3ff01607bc71f710001', '2017-12-21 00:00:00', 'c', '402882e5607880f9016078bcf8f80009', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607bc3ff01607bc80b010004', '2017-12-23 00:00:00', '', '', '1', '', 'DDDDDDDDDD', '402882e5607880f9016078bd14f3000a', '2017-12-21 00:00:00', 'd', '402882e5607880f9016078bcf8f80009', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607bc3ff01607bc85a9f0005', '2017-12-23 00:00:00', '', '', '2', '', 'ddddddddddd', '402882e5607bc3ff01607bc80b010004', '2017-12-21 00:00:00', 'd', '402882e5607880f9016078bcf8f80009', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607bf60e01607bf801fe0001', '2017-12-23 00:00:00', '', '', '2', '', 'qweqweqweqweqw', '402882e560782d790160782e32080001', '2017-12-21 00:00:00', 'wqeqwe', '402882e56078140a0160781b6e5a0005', '3');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607c455a01607c46ad620002', '2017-12-22 11:31:34', '', '', '0', '', 'abcdefg', '0', '2017-12-22 11:31:34', 'admin', '402882e5607c455a01607c46a3bd0001', '1工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607c455a01607c47149f0003', '2017-12-21 00:00:00', '', '', '1', '', 'zzzz', '402882e5607c455a01607c46ad620002', '2017-12-21 00:00:00', 'z', '402882e5607c455a01607c46a3bd0001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607c455a01607c4785ee0004', '2017-12-21 00:00:00', '', '', '1', '', 'yyyy', '402882e5607c455a01607c46ad620002', '2017-12-21 00:00:00', 'y', '402882e5607c455a01607c46a3bd0001', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607c455a01607c47d1930005', '2017-12-21 00:00:00', '', '', '2', '', 'zzzz', '402882e5607c455a01607c47149f0003', '2017-12-21 00:00:00', 'z', '402882e5607c455a01607c46a3bd0001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607c455a01607c5951200009', '2017-12-21 00:00:00', '', '', '2', '', '委屈翁', '402882e5607c455a01607c4785ee0004', '2017-12-21 00:00:00', '我去恶趣味', '402882e5607c455a01607c46a3bd0001', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607d50db01607d5272dd0001', '2017-12-22 16:24:03', '', '', '0', '', '1122333', '0', '2017-12-22 16:24:03', 'admin', '402882e56077fd57016077fe9ba10001', '10工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607d50db01607d529fa50002', '2017-12-23 00:00:00', '', '', '1', '', 'qwewqe', '402882e5607d50db01607d5272dd0001', '2017-12-21 00:00:00', 'qweqweqe', '402882e56077fd57016077fe9ba10001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5607d50db01607d52d2f90003', '2017-12-23 00:00:00', '', '', '2', '', 'wqeqweqwe', '402882e5607d50db01607d529fa50002', '2017-12-21 00:00:00', 'eqweqw', '402882e56077fd57016077fe9ba10001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56081701a0160817cef550002', '2018-01-02 15:51:38', '', '', '0', '', '哈哈哈', '0', '2018-01-02 15:51:38', 'admin', '402882e56081701a0160817c59400001', '10工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56081a790016081aa1a0b0007', '2017-12-23 13:12:16', '', '', '0', '', 'wdvhi', '0', '2017-12-23 13:12:16', 'admin', '402882e5607cd57d01607ceb586d0001', '10工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56081ab08016081abb7b80001', '2017-12-28 11:11:15', '', '', '0', '', '987654321', '0', '2017-12-28 11:11:15', 'admin', '402882e56081701a01608193fc140003', '5工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56081c886016081ca4be90001', '2017-12-23 00:00:00', '', '', '1', '', 'qweqweqweqwe', '402882e56081ab08016081abb7b80001', '2017-12-21 00:00:00', 'qwwqe', '402882e56081701a01608193fc140003', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56081c886016081ca74ea0002', '2017-12-23 00:00:00', '', '', '2', '', 'qweqwewqeq', '402882e56081c886016081ca4be90001', '2017-12-21 00:00:00', 'QQ群', '402882e56081701a01608193fc140003', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56081c886016081cad4cf0004', '2017-12-23 00:00:00', '', '', '1', '', 'qweqweq', '402882e56081ab08016081abb7b80001', '2017-12-21 00:00:00', '1', '402882e56081701a01608193fc140003', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56081c886016081cb02fc0005', '2017-12-23 00:00:00', '', '', '2', '', 'ewrwe', '402882e56081c886016081cad4cf0004', '2017-12-21 00:00:00', 'a', '402882e56081701a01608193fc140003', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5608b575c01608b85d9be0002', '2017-12-26 10:40:34', '', '', '0', '', 'eqweqweqw', '0', '2017-12-26 10:40:34', 'admin', '402882e5608239060160823a11b50001', '10工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5608b575c01608b86403c0003', '2018-01-02 15:50:12', '', '', '0', '', '请问1', '0', '2018-01-02 15:50:12', 'admin', '402882e56082358a016082387e400001', '15工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5608b575c01608b866b830004', '2018-01-02 00:00:00', '', '', '1', '', '智装', '402882e5608b575c01608b86403c0003', '2017-12-21 00:00:00', 'wqeqwe', '402882e56082358a016082387e400001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e5608b575c01608b86935c0005', '2017-12-23 00:00:00', '', '', '2', '', 'weqweq', '402882e5608b575c01608b866b830004', '2017-12-21 00:00:00', 'qweqweq', '402882e56082358a016082387e400001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56090787a016090b0b7c60001', '2017-12-23 00:00:00', '', '', '1', '', 'EEEEEEEE', '402882e5607880f9016078bd14f3000a', '2017-12-21 00:00:00', 'e', '402882e5607880f9016078bcf8f80009', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560959e84016095aa447a0007', '2018-01-02 15:50:10', '', '', '0', '', '最后第一', '0', '2018-01-02 15:50:10', 'admin', '402882e560959e84016095a6bfae0002', '10工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56096562001609667055b0001', '2018-01-03 15:54:33', '', '', '0', '', '阳光项目', '0', '2018-01-03 15:54:33', 'admin', '402882e56096562001609666be070000', '10工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56097170b0160973a6f570001', '2017-10-05 00:00:00', '', '', '1', '', '786', '402882e56096562001609667055b0001', '2017-09-23 00:00:00', 'rrrr12112', '402882e56096562001609666be070000', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56097170b0160973af7ab0002', '2017-09-24 07:24:22', '', '', '2', '', '数据库', '402882e56097170b0160973a6f570001', '2017-09-23 15:15:24', 'a', '402882e56096562001609666be070000', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56097170b0160973c46fa0004', '2017-10-15 00:00:00', '', '', '1', '', '页面we', '402882e56096562001609667055b0001', '2017-10-08 00:00:00', 'fw', '402882e56096562001609666be070000', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e56097170b0160973cc33a0005', '2017-10-15 00:00:00', '', '', '2', '', '页面1', '402882e56097170b0160973c46fa0004', '2017-10-08 00:00:00', 'ff', '402882e56096562001609666be070000', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560a1cba70160a1ce4d4c0001', '2017-10-05 00:00:00', '', '', '2', '', 'drg', '402882e56097170b0160973a6f570001', '2017-09-23 00:00:00', 'dg', '402882e56096562001609666be070000', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560b4868d0160b537eb640008', '2017-10-05 00:00:00', '', '', '2', '', 'bbbb', '402882e5608b575c01608b866b830004', '2017-09-23 00:00:00', 'bb', '402882e56082358a016082387e400001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560b4868d0160b5d6b4a8000b', '2018-01-10 00:00:00', '', '', '1', '', '阿里巴巴', '402882e56081701a0160817cef550002', '2018-01-02 00:00:00', '马云', '402882e56081701a0160817c59400001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560b4868d0160b5da58e3000d', '2018-01-10 00:00:00', '', '', '2', '', '腾讯', '402882e560b4868d0160b5d6b4a8000b', '2018-01-02 00:00:00', '马化腾', '402882e56081701a0160817c59400001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560b4868d0160b5daba71000e', '2018-01-10 00:00:00', '', '', '1', '', '京东', '402882e56081701a0160817cef550002', '2018-01-02 00:00:00', '刘强东', '402882e56081701a0160817c59400001', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560bfa1d60160bfa533280002', '2018-01-08 09:25:20', '', '', '0', '', 'qqq', '0', '2018-01-08 09:25:20', 'admin', '402882e560bfa1d60160bfa4d83e0001', '10工作日/周期');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560bfa1d60160bfa5a3050003', '2018-01-11 00:00:00', '', '', '1', '', 'www', '402882e560bfa1d60160bfa533280002', '2018-01-04 00:00:00', 'w', '402882e560bfa1d60160bfa4d83e0001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560bfa1d60160bfa6036a0004', '2018-01-05 00:00:00', '', '', '2', '', 'www', '402882e560bfa1d60160bfa5a3050003', '2018-01-04 00:00:00', 'ww', '402882e560bfa1d60160bfa4d83e0001', '0');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560bfa1d60160bfa66c760005', '2018-01-12 00:00:00', '', '', '1', '', 'EEE', '402882e560bfa1d60160bfa533280002', '2018-01-05 00:00:00', 'E', '402882e560bfa1d60160bfa4d83e0001', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560bfa1d60160bfa6dc4b0006', '2018-01-08 00:00:00', '', '', '2', '', 'EEEE', '402882e560bfa1d60160bfa66c760005', '2018-01-05 00:00:00', 'EE', '402882e560bfa1d60160bfa4d83e0001', '1');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560c4388c0160c567c1cc0006', '2018-01-12 00:00:00', '', '', '1', '', 'qqqqq', '402882e560bfa1d60160bfa533280002', '2018-01-05 00:00:00', 'q', '402882e560bfa1d60160bfa4d83e0001', '2');
INSERT INTO `zz_product_stories_duties` VALUES ('402882e560c4388c0160c56a57e00007', '2018-01-12 00:00:00', '', '', '2', '', 'wwww', '402882e560c4388c0160c567c1cc0006', '2018-01-05 00:00:00', 'w', '402882e560bfa1d60160bfa4d83e0001', '2');

-- ----------------------------
-- Table structure for `zz_project_source_edit`
-- ----------------------------
DROP TABLE IF EXISTS `zz_project_source_edit`;
CREATE TABLE `zz_project_source_edit` (
  `id` varchar(255) NOT NULL,
  `banner_position_enum` varchar(255) default NULL,
  `end_time` datetime default NULL,
  `name` varchar(255) default NULL,
  `pic_url` varchar(255) default NULL,
  `serial_num` int(11) default NULL,
  `start_time` datetime default NULL,
  `target_url` varchar(255) default NULL,
  `notes` varchar(255) default NULL COMMENT '内容',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zz_project_source_edit
-- ----------------------------
INSERT INTO `zz_project_source_edit` VALUES ('1', 'SKILL', null, 'erewrwe', null, '1', null, null, '哈哈哈');
INSERT INTO `zz_project_source_edit` VALUES ('2', 'SKILL', null, 'ewdwe', null, '1', null, null, '发发发');
INSERT INTO `zz_project_source_edit` VALUES ('3', 'RISK', null, '哈哈哈', null, '1', null, null, '呵呵呵');
INSERT INTO `zz_project_source_edit` VALUES ('4', 'DESIGN', null, '呵呵呵', null, '1', null, null, '呜呜呜');
INSERT INTO `zz_project_source_edit` VALUES ('402881f85e57866f015e57878da10001', 'SKILL', null, 'rtrddff', null, '0', null, null, '哇哇哇');
INSERT INTO `zz_project_source_edit` VALUES ('402882e65fd733c4015fd73fcaeb0001', 'SKILL', '2017-11-20 10:26:39', '123', '', '0', '2017-11-21 00:00:00', null, '啧啧啧');
INSERT INTO `zz_project_source_edit` VALUES ('402882e660532af7016053436b3e0003', 'RISK', null, '得到发', null, '0', null, null, '嘻嘻嘻');
INSERT INTO `zz_project_source_edit` VALUES ('402882e660532af701605356f9450005', 'SKILL', null, '挖饿额', null, '1', null, null, '擦擦擦');
INSERT INTO `zz_project_source_edit` VALUES ('402882e660532af70160535718760006', 'RISK', null, '对方答', null, '1', null, null, '别别别');
INSERT INTO `zz_project_source_edit` VALUES ('402882e660532af70160535735180007', 'DESIGN', null, '方芳芳', null, '1', null, null, '不不不');
INSERT INTO `zz_project_source_edit` VALUES ('402882e660532af70160535785160009', 'DESIGN', null, '的地方', null, '1', null, null, '呐呐呐');
INSERT INTO `zz_project_source_edit` VALUES ('402882e66053fd83016053ff4c2c0001', 'CUSTOMER', null, '俄方岁', null, '1', null, null, '喵喵喵');
INSERT INTO `zz_project_source_edit` VALUES ('402882e6605466890160547a8c070008', 'CUSTOMER', null, '啊爸爸', null, '1', null, null, '啊啊啊');
INSERT INTO `zz_project_source_edit` VALUES ('402882e660584f120160594e45720005', 'SKILL', null, '额外温', null, '1', null, null, '哎哎哎');
INSERT INTO `zz_project_source_edit` VALUES ('5', 'RISK', null, '哦哦哦', null, '1', null, null, '嗷嗷嗷');
INSERT INTO `zz_project_source_edit` VALUES ('6', 'CUSTOMER', null, '哎哎哎', null, '1', null, null, '是是是');

-- ----------------------------
-- Table structure for `zz_skills`
-- ----------------------------
DROP TABLE IF EXISTS `zz_skills`;
CREATE TABLE `zz_skills` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) default NULL,
  `addtime` datetime default NULL,
  `creator` varchar(255) default NULL,
  `edittime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zz_skills
-- ----------------------------

-- ----------------------------
-- Table structure for `zz_staff_login`
-- ----------------------------
DROP TABLE IF EXISTS `zz_staff_login`;
CREATE TABLE `zz_staff_login` (
  `id` varchar(255) NOT NULL,
  `loginname` varchar(255) default NULL,
  `loginpwd` varchar(255) default NULL,
  `addtime` datetime default NULL,
  `edittime` datetime default NULL,
  `state` bit(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zz_staff_login
-- ----------------------------

-- ----------------------------
-- Table structure for `zz_staff_main`
-- ----------------------------
DROP TABLE IF EXISTS `zz_staff_main`;
CREATE TABLE `zz_staff_main` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `birthdate` datetime default NULL,
  `birthplace` varchar(255) default NULL,
  `age` varchar(11) default NULL,
  `address` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `pic` varchar(255) default NULL,
  `hiredate` datetime default NULL COMMENT '入职时间',
  `hightedu` varchar(255) default NULL COMMENT '最高学历',
  `gradute_school` varchar(255) default NULL COMMENT '毕业学校',
  `professional` varchar(255) default NULL COMMENT '专业',
  `addtime` datetime default NULL,
  `edittime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zz_staff_main
-- ----------------------------
INSERT INTO `zz_staff_main` VALUES ('1', '万瑞', '1', '1994-01-04 13:48:22', '河南', '23', '南京', '15037968103', null, '2017-12-12 13:49:18', '本科', '河南科技大学', '软件工程', '2018-01-03 13:49:56', null);
INSERT INTO `zz_staff_main` VALUES ('2', '哈哈', '2', '2010-01-03 16:09:48', '江苏', '8', '南京', '1233211234', null, '2018-01-03 16:10:31', '硕士', '南京理工大学', '土木工程', '2018-01-03 16:11:24', null);
INSERT INTO `zz_staff_main` VALUES ('3', '123', '1', null, '123', '19', '123', '123', '123', '2018-01-04 10:34:29', '硕士', '123', '213', null, '2018-01-04 11:35:38');
INSERT INTO `zz_staff_main` VALUES ('402882e560bf34450160bf34d4df0001', '345435345', '1', null, 'weqqweqwe', '19', 'eqweqwe', 'sadasd', '12323', '2018-01-04 10:34:29', '硕士', 'qweqwe', 'wqeqwe', null, '2018-01-04 11:35:17');
INSERT INTO `zz_staff_main` VALUES ('402882e560bf34450160bf355abc0002', '123', '1', null, 'weqqweqwe', '19', 'eqweqwe', 'sadasd', '12323', '2018-01-04 10:34:29', '硕士', 'qweqwe', 'wqeqwe', null, '2018-01-04 11:27:13');

-- ----------------------------
-- Table structure for `zz_staff_skills`
-- ----------------------------
DROP TABLE IF EXISTS `zz_staff_skills`;
CREATE TABLE `zz_staff_skills` (
  `id` varchar(255) NOT NULL,
  `staff_id` varchar(255) default NULL,
  `skills_id` varchar(255) default NULL,
  `level` varchar(255) default NULL,
  `addtime` datetime default NULL,
  `edittime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zz_staff_skills
-- ----------------------------

-- ----------------------------
-- Table structure for `zz_staff_skill_level`
-- ----------------------------
DROP TABLE IF EXISTS `zz_staff_skill_level`;
CREATE TABLE `zz_staff_skill_level` (
  `id` varchar(255) NOT NULL,
  `level` varchar(255) default NULL,
  `staff_id` varchar(255) default NULL,
  `creator` varchar(255) default NULL,
  `addtime` datetime default NULL,
  `edittime` datetime default NULL,
  `serial_num` int(11) default NULL COMMENT '排序',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zz_staff_skill_level
-- ----------------------------
