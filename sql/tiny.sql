-- --------------------------------------------------------
-- 主机:                           123.7.182.34
-- 服务器版本:                        5.7.31-0ubuntu0.18.04.1 - (Ubuntu)
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 tiny 的数据库结构
DROP DATABASE IF EXISTS `tiny`;
CREATE DATABASE IF NOT EXISTS `tiny` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tiny`;

-- 导出  表 tiny.ums_admin 结构
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE IF NOT EXISTS `ums_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` int(1) DEFAULT '1' COMMENT '帐号启用状态：0->禁用；1->启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- 正在导出表  tiny.ums_admin 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `ums_admin` DISABLE KEYS */;
INSERT INTO `ums_admin` (`id`, `username`, `password`, `icon`, `email`, `nick_name`, `note`, `create_time`, `login_time`, `status`) VALUES
	(1, 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', 'test@qq.com', '测试账号', NULL, '2018-09-29 13:55:30', '2018-09-29 13:55:39', 1),
	(3, 'admin', '$2a$10$WtitVo8mHoBPPlF6W6Vf5.Z14gBzed0/os6jXkZ8yLbwZu6iDl8YG', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', 'admin@163.com', '系统管理员', '系统管理员', '2018-10-08 13:32:47', '2019-04-20 12:45:16', 1);
/*!40000 ALTER TABLE `ums_admin` ENABLE KEYS */;

-- 导出  表 tiny.ums_admin_login_log 结构
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE IF NOT EXISTS `ums_admin_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `user_agent` varchar(100) DEFAULT NULL COMMENT '浏览器登录类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8 COMMENT='后台用户登录日志表';

-- 正在导出表  tiny.ums_admin_login_log 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `ums_admin_login_log` DISABLE KEYS */;
INSERT INTO `ums_admin_login_log` (`id`, `admin_id`, `create_time`, `ip`, `address`, `user_agent`) VALUES
	(285, 3, '2020-08-24 14:05:21', '0:0:0:0:0:0:0:1', NULL, NULL),
	(286, 10, '2020-08-24 14:05:39', '0:0:0:0:0:0:0:1', NULL, NULL),
	(287, 3, '2020-10-14 12:06:36', '0:0:0:0:0:0:0:1', NULL, NULL),
	(288, 3, '2020-10-14 12:06:59', '0:0:0:0:0:0:0:1', NULL, NULL),
	(289, 3, '2020-10-14 12:38:03', '0:0:0:0:0:0:0:1', NULL, NULL);
/*!40000 ALTER TABLE `ums_admin_login_log` ENABLE KEYS */;

-- 导出  表 tiny.ums_admin_role_relation 结构
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE IF NOT EXISTS `ums_admin_role_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='后台用户和角色关系表';

-- 正在导出表  tiny.ums_admin_role_relation 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `ums_admin_role_relation` DISABLE KEYS */;
INSERT INTO `ums_admin_role_relation` (`id`, `admin_id`, `role_id`) VALUES
	(26, 3, 5),
	(27, 6, 1),
	(28, 7, 2),
	(29, 1, 5),
	(30, 4, 5),
	(31, 8, 5),
	(34, 12, 6),
	(38, 13, 5),
	(39, 10, 8);
/*!40000 ALTER TABLE `ums_admin_role_relation` ENABLE KEYS */;

-- 导出  表 tiny.ums_menu 结构
DROP TABLE IF EXISTS `ums_menu`;
CREATE TABLE IF NOT EXISTS `ums_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `title` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `level` int(4) DEFAULT NULL COMMENT '菜单级数',
  `sort` int(4) DEFAULT NULL COMMENT '菜单排序',
  `name` varchar(100) DEFAULT NULL COMMENT '前端名称',
  `icon` varchar(200) DEFAULT NULL COMMENT '前端图标',
  `hidden` int(1) DEFAULT NULL COMMENT '前端隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- 正在导出表  tiny.ums_menu 的数据：~24 rows (大约)
/*!40000 ALTER TABLE `ums_menu` DISABLE KEYS */;
INSERT INTO `ums_menu` (`id`, `parent_id`, `create_time`, `title`, `level`, `sort`, `name`, `icon`, `hidden`) VALUES
	(2, 1, '2020-02-02 14:51:50', '商品列表', 1, 0, 'product', 'product-list', 0),
	(3, 1, '2020-02-02 14:52:44', '添加商品', 1, 0, 'addProduct', 'product-add', 0),
	(4, 1, '2020-02-02 14:53:51', '商品分类', 1, 0, 'productCate', 'product-cate', 0),
	(5, 1, '2020-02-02 14:54:51', '商品类型', 1, 0, 'productAttr', 'product-attr', 0),
	(6, 1, '2020-02-02 14:56:29', '品牌管理', 1, 0, 'brand', 'product-brand', 0),
	(8, 7, '2020-02-02 16:55:18', '订单列表', 1, 0, 'order', 'product-list', 0),
	(9, 7, '2020-02-02 16:56:46', '订单设置', 1, 0, 'orderSetting', 'order-setting', 0),
	(10, 7, '2020-02-02 16:57:39', '退货申请处理', 1, 0, 'returnApply', 'order-return', 0),
	(11, 7, '2020-02-02 16:59:40', '退货原因设置', 1, 0, 'returnReason', 'order-return-reason', 0),
	(13, 12, '2020-02-04 16:19:22', '秒杀活动列表', 1, 0, 'flash', 'sms-flash', 0),
	(14, 12, '2020-02-04 16:20:16', '优惠券列表', 1, 0, 'coupon', 'sms-coupon', 0),
	(16, 12, '2020-02-07 16:22:38', '品牌推荐', 1, 0, 'homeBrand', 'product-brand', 0),
	(17, 12, '2020-02-07 16:23:14', '新品推荐', 1, 0, 'homeNew', 'sms-new', 0),
	(18, 12, '2020-02-07 16:26:38', '人气推荐', 1, 0, 'homeHot', 'sms-hot', 0),
	(19, 12, '2020-02-07 16:28:16', '专题推荐', 1, 0, 'homeSubject', 'sms-subject', 0),
	(20, 12, '2020-02-07 16:28:42', '广告列表', 1, 0, 'homeAdvertise', 'sms-ad', 0),
	(21, 0, '2020-02-07 16:29:13', '权限', 0, 0, 'ums', 'ums', 0),
	(22, 21, '2020-02-07 16:29:51', '用户列表', 1, 0, 'admin', 'ums-admin', 0),
	(23, 21, '2020-02-07 16:30:13', '角色列表', 1, 0, 'role', 'ums-role', 0),
	(24, 21, '2020-02-07 16:30:53', '菜单列表', 1, 0, 'menu', 'ums-menu', 0),
	(25, 21, '2020-02-07 16:31:13', '资源列表', 1, 0, 'resource', 'ums-resource', 0);
/*!40000 ALTER TABLE `ums_menu` ENABLE KEYS */;

-- 导出  表 tiny.ums_resource 结构
DROP TABLE IF EXISTS `ums_resource`;
CREATE TABLE IF NOT EXISTS `ums_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) DEFAULT NULL COMMENT '资源URL',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `category_id` bigint(20) DEFAULT NULL COMMENT '资源分类ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='后台资源表';

-- 正在导出表  tiny.ums_resource 的数据：~28 rows (大约)
/*!40000 ALTER TABLE `ums_resource` DISABLE KEYS */;
INSERT INTO `ums_resource` (`id`, `create_time`, `name`, `url`, `description`, `category_id`) VALUES
	(25, '2020-02-07 16:47:34', '后台用户管理', '/admin/**', '', 4),
	(26, '2020-02-07 16:48:24', '后台用户角色管理', '/role/**', '', 4),
	(27, '2020-02-07 16:48:48', '后台菜单管理', '/menu/**', '', 4),
	(28, '2020-02-07 16:49:18', '后台资源分类管理', '/resourceCategory/**', '', 4),
	(29, '2020-02-07 16:49:45', '后台资源管理', '/resource/**', '', 4);
/*!40000 ALTER TABLE `ums_resource` ENABLE KEYS */;

-- 导出  表 tiny.ums_resource_category 结构
DROP TABLE IF EXISTS `ums_resource_category`;
CREATE TABLE IF NOT EXISTS `ums_resource_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `sort` int(4) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='资源分类表';

-- 正在导出表  tiny.ums_resource_category 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `ums_resource_category` DISABLE KEYS */;
INSERT INTO `ums_resource_category` (`id`, `create_time`, `name`, `sort`) VALUES
	(4, '2020-02-05 10:23:04', '权限模块', 0);
/*!40000 ALTER TABLE `ums_resource_category` ENABLE KEYS */;

-- 导出  表 tiny.ums_role 结构
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE IF NOT EXISTS `ums_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `admin_count` int(11) DEFAULT NULL COMMENT '后台用户数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(1) DEFAULT '1' COMMENT '启用状态：0->禁用；1->启用',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='后台用户角色表';

-- 正在导出表  tiny.ums_role 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `ums_role` DISABLE KEYS */;
INSERT INTO `ums_role` (`id`, `name`, `description`, `admin_count`, `create_time`, `status`, `sort`) VALUES
	(5, '超级管理员', '拥有所有查看和操作功能', 0, '2020-02-02 15:11:05', 1, 0),
	(8, '权限管理员', '用于权限模块所有操作功能', 0, '2020-08-24 10:57:35', 1, 0);
/*!40000 ALTER TABLE `ums_role` ENABLE KEYS */;

-- 导出  表 tiny.ums_role_menu_relation 结构
DROP TABLE IF EXISTS `ums_role_menu_relation`;
CREATE TABLE IF NOT EXISTS `ums_role_menu_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='后台角色菜单关系表';

-- 正在导出表  tiny.ums_role_menu_relation 的数据：~50 rows (大约)
/*!40000 ALTER TABLE `ums_role_menu_relation` DISABLE KEYS */;
INSERT INTO `ums_role_menu_relation` (`id`, `role_id`, `menu_id`) VALUES
	(33, 1, 1),
	(34, 1, 2),
	(35, 1, 3),
	(36, 1, 4),
	(37, 1, 5),
	(38, 1, 6),
	(53, 2, 7),
	(54, 2, 8),
	(55, 2, 9),
	(56, 2, 10),
	(57, 2, 11),
	(72, 5, 1),
	(73, 5, 2),
	(74, 5, 3),
	(75, 5, 4),
	(76, 5, 5),
	(77, 5, 6),
	(78, 5, 7),
	(79, 5, 8),
	(80, 5, 9),
	(81, 5, 10),
	(82, 5, 11),
	(83, 5, 12),
	(84, 5, 13),
	(85, 5, 14),
	(86, 5, 16),
	(87, 5, 17),
	(88, 5, 18),
	(89, 5, 19),
	(90, 5, 20),
	(91, 5, 21),
	(92, 5, 22),
	(93, 5, 23),
	(94, 5, 24),
	(95, 5, 25),
	(96, 6, 21),
	(97, 6, 22),
	(98, 6, 23),
	(99, 6, 24),
	(100, 6, 25),
	(101, 7, 21),
	(102, 7, 22),
	(103, 7, 23),
	(104, 7, 24),
	(105, 7, 25),
	(106, 8, 21),
	(107, 8, 22),
	(108, 8, 23),
	(109, 8, 24),
	(110, 8, 25);
/*!40000 ALTER TABLE `ums_role_menu_relation` ENABLE KEYS */;

-- 导出  表 tiny.ums_role_resource_relation 结构
DROP TABLE IF EXISTS `ums_role_resource_relation`;
CREATE TABLE IF NOT EXISTS `ums_role_resource_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `resource_id` bigint(20) DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COMMENT='后台角色资源关系表';

-- 正在导出表  tiny.ums_role_resource_relation 的数据：~57 rows (大约)
/*!40000 ALTER TABLE `ums_role_resource_relation` DISABLE KEYS */;
INSERT INTO `ums_role_resource_relation` (`id`, `role_id`, `resource_id`) VALUES
	(103, 2, 8),
	(104, 2, 9),
	(105, 2, 10),
	(106, 2, 11),
	(107, 2, 12),
	(142, 5, 1),
	(143, 5, 2),
	(144, 5, 3),
	(145, 5, 4),
	(146, 5, 5),
	(147, 5, 6),
	(148, 5, 8),
	(149, 5, 9),
	(150, 5, 10),
	(151, 5, 11),
	(152, 5, 12),
	(153, 5, 13),
	(154, 5, 14),
	(155, 5, 15),
	(156, 5, 16),
	(157, 5, 17),
	(158, 5, 18),
	(159, 5, 19),
	(160, 5, 20),
	(161, 5, 21),
	(162, 5, 22),
	(163, 5, 23),
	(164, 5, 24),
	(165, 5, 25),
	(166, 5, 26),
	(167, 5, 27),
	(168, 5, 28),
	(169, 5, 29),
	(170, 1, 1),
	(171, 1, 2),
	(172, 1, 3),
	(173, 1, 4),
	(174, 1, 5),
	(175, 1, 6),
	(176, 1, 23),
	(177, 1, 24),
	(178, 6, 25),
	(179, 6, 26),
	(180, 6, 27),
	(181, 6, 28),
	(182, 6, 29),
	(205, 7, 25),
	(206, 7, 26),
	(207, 7, 27),
	(208, 7, 28),
	(209, 7, 29),
	(210, 7, 31),
	(211, 8, 25),
	(212, 8, 26),
	(213, 8, 27),
	(214, 8, 28),
	(215, 8, 29);
/*!40000 ALTER TABLE `ums_role_resource_relation` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
