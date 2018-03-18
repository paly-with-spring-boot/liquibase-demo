--liquibase formatted SQL

--changeset cj:1
-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `f_id` varchar(64) NOT NULL,
  `f_create_by` varchar(255) NOT NULL,
  `f_created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `f_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `f_name` varchar(255) NOT NULL,
  PRIMARY KEY (`f_id`),
  UNIQUE KEY `role_name_unidex` (`f_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('8f2a9f6e-e245-4274-8477-cbb033aad5f0', 'SYSTEM', '2018-03-15 15:04:19', '2018-03-15 15:04:19', '普通用户');
INSERT INTO `t_role` VALUES ('adfdbf7e-13a5-4d34-939a-2dd44dca16d8', 'SYSTEM', '2018-03-15 15:05:46', '2018-03-15 15:05:46', '管理员');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `f_id` char(64) NOT NULL,
  `f_login_name` varchar(64) NOT NULL,
  `f_password` varchar(100) NOT NULL,
  `f_display_name` varchar(45) NOT NULL,
  `f_email` varchar(128) DEFAULT NULL,
  `f_cell_phone_number` varchar(45) DEFAULT NULL,
  `f_status` varchar(20) NOT NULL,
  `f_version` bigint(20) DEFAULT NULL,
  `f_created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `f_modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`f_id`),
  UNIQUE KEY `user_id_uindex` (`f_id`),
  UNIQUE KEY `user_login_name_uindex` (`f_login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('7691860a-cfb4-4c4a-a8bd-01347c3286be', 'shufork', '$2a$10$rc70Qb.rkeCvmNIs5yHfg.ZWwk7ELma0hBBwe9trWQHmN4p5krH2O', 'my password is \"shufork\"', 'shufork@outlook.com', '18012345678', 'REGULAR', null, '2018-03-15 15:11:10', '2018-03-15 15:11:10');

-- ----------------------------
-- Table structure for t_user_authority
-- ----------------------------
DROP TABLE IF EXISTS `t_user_authority`;
CREATE TABLE `t_user_authority` (
  `f_id` varchar(64) NOT NULL,
  `f_role_id` varchar(64) DEFAULT NULL,
  `f_user_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  UNIQUE KEY `user_authority_id_uindex` (`f_id`),
  KEY `user_authority_role_id_fk` (`f_role_id`),
  KEY `user_authority_user_id_fk` (`f_user_id`),
  CONSTRAINT `user_authority_role_id_fk` FOREIGN KEY (`f_role_id`) REFERENCES `t_role` (`f_id`),
  CONSTRAINT `user_authority_user_id_fk` FOREIGN KEY (`f_user_id`) REFERENCES `t_user` (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user_authority
-- ----------------------------
INSERT INTO `t_user_authority` VALUES ('0b6dccd7-9b10-4765-8db7-c6c1af452d04', 'adfdbf7e-13a5-4d34-939a-2dd44dca16d8', '7691860a-cfb4-4c4a-a8bd-01347c3286be');