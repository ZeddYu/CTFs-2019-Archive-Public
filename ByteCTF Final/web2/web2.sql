-- MySQL dump 10.15  Distrib 10.0.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: douchat
-- ------------------------------------------------------
-- Server version	10.0.38-MariaDB-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `douchat`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `douchat` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `douchat`;

--
-- Table structure for table `dc_access_key`
--

DROP TABLE IF EXISTS `dc_access_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_access_key` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) NOT NULL DEFAULT '0' COMMENT '账号id',
  `ak` varchar(255) NOT NULL DEFAULT '' COMMENT 'api请求ak',
  `sk` varchar(255) NOT NULL DEFAULT '' COMMENT 'api请求sk',
  `created_at` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态。0：停用，1：使用中',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口授权key表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_access_key`
--

LOCK TABLES `dc_access_key` WRITE;
/*!40000 ALTER TABLE `dc_access_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_access_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_addon_entry`
--

DROP TABLE IF EXISTS `dc_addon_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_addon_entry` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `addon` varchar(50) NOT NULL COMMENT '插件名称',
  `name` varchar(255) DEFAULT NULL COMMENT '入口名称',
  `act` varchar(50) NOT NULL COMMENT '操作',
  `title` varchar(255) NOT NULL COMMENT '封面标题',
  `desc` text COMMENT '封面描述',
  `cover` varchar(255) NOT NULL DEFAULT '0' COMMENT '封面图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件功能入口表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_addon_entry`
--

LOCK TABLES `dc_addon_entry` WRITE;
/*!40000 ALTER TABLE `dc_addon_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_addon_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_addon_setting`
--

DROP TABLE IF EXISTS `dc_addon_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_addon_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `addon` varchar(50) NOT NULL COMMENT '插件标识',
  `name` varchar(50) NOT NULL COMMENT '配置项',
  `value` text NOT NULL COMMENT '配置值',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT '主题',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件配置参数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_addon_setting`
--

LOCK TABLES `dc_addon_setting` WRITE;
/*!40000 ALTER TABLE `dc_addon_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_addon_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_addons`
--

DROP TABLE IF EXISTS `dc_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_addons` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(255) NOT NULL COMMENT '插件名称',
  `bzname` varchar(50) NOT NULL COMMENT '标识名',
  `desc` text COMMENT '描述',
  `version` varchar(10) NOT NULL COMMENT '版本号',
  `author` varchar(50) NOT NULL COMMENT '作者姓名',
  `logo` varchar(255) NOT NULL COMMENT 'LOGO',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '插件配置',
  `type` varchar(50) DEFAULT NULL COMMENT '插件分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_addons`
--

LOCK TABLES `dc_addons` WRITE;
/*!40000 ALTER TABLE `dc_addons` DISABLE KEYS */;
INSERT INTO `dc_addons` VALUES (1,'示例插件','Demo','豆信核心功能示例，包含小程序接口请求逻辑','0.4.0','艾逗笔','http://39.105.136.196:30023/douchat-4.0.4/Addons/Demo/logo.png',0,'{\"respond_rule\":1,\"setting\":1,\"entry\":1,\"menu\":1,\"menu_list\":{\"diaryList\":\"\\u65e5\\u8bb0\\u7ba1\\u7406\"},\"setting_list_group\":{\"basic\":{\"title\":\"\\u57fa\\u672c\\u8bbe\\u7f6e\",\"is_show\":1}},\"setting_list\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"tip\":\"\\u5728\\u5fae\\u4fe1\\u6d4f\\u89c8\\u5668\\u6216\\u5c0f\\u7a0b\\u5e8f\\u9876\\u680f\\u663e\\u793a\\u7684\\u6807\\u9898\",\"type\":\"text\",\"placeholder\":\"\\u8c46\\u4fe1\\u793a\\u4f8b\",\"group\":\"basic\"},\"copyright\":{\"title\":\"\\u7248\\u6743\\u4fe1\\u606f\",\"type\":\"text\",\"value\":\"Copyright \\u00a9 2015-2018 \\u8c46\\u4fe1\",\"group\":\"basic\"},\"about\":{\"title\":\"\\u5173\\u4e8e\",\"tip\":\"\\u5173\\u4e8e\\u7a0b\\u5e8f\\u7684\\u4ecb\\u7ecd\",\"type\":\"textarea\",\"placeholder\":\"\\u8c46\\u4fe1\\u662f\\u4e00\\u4e2a\\u7b80\\u6d01\\u3001\\u9ad8\\u6548\\u3001\\u4f18\\u96c5\\u7684\\u5fae\\u4fe1\\u5f00\\u53d1\\u6846\\u67b6\\uff0c\\u5b66\\u4e60\\u4ea4\\u6d41\\u8bf7\\u52a0QQ\\u7fa4\\uff1a473027882\",\"group\":\"basic\"}}}','1,2'),(2,'smity','smity','smity','1.0.1','smity','/douchat-4.0.4/Public/Admin/img/nopic.jpg',0,'{\"respond_rule\":1,\"setting\":1,\"entry\":1,\"menu\":1}','1,2');
/*!40000 ALTER TABLE `dc_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_addons_access`
--

DROP TABLE IF EXISTS `dc_addons_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_addons_access` (
  `user_id` int(10) NOT NULL,
  `addon` varchar(50) NOT NULL,
  `mpid` int(10) NOT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_addons_access`
--

LOCK TABLES `dc_addons_access` WRITE;
/*!40000 ALTER TABLE `dc_addons_access` DISABLE KEYS */;
INSERT INTO `dc_addons_access` VALUES (1,'Demo',0,2),(1,'smity',0,2);
/*!40000 ALTER TABLE `dc_addons_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_attach`
--

DROP TABLE IF EXISTS `dc_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_attach` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) DEFAULT NULL COMMENT '公众号ID',
  `user_id` int(10) DEFAULT NULL COMMENT '上传者的用户ID',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_extension` varchar(10) DEFAULT NULL COMMENT '附件后缀名',
  `file_size` int(10) DEFAULT NULL COMMENT '附件大小',
  `file_path` varchar(255) DEFAULT NULL COMMENT '附件存储位置',
  `hash` varchar(50) DEFAULT NULL COMMENT '哈希',
  `create_time` int(10) DEFAULT NULL COMMENT '附件创建时间',
  `item_type` varchar(50) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_attach`
--

LOCK TABLES `dc_attach` WRITE;
/*!40000 ALTER TABLE `dc_attach` DISABLE KEYS */;
INSERT INTO `dc_attach` VALUES (1,0,2,'test.png','png',7618,'./Uploads/Pictures/20191008/5d9bcf13f1c59.png','da3cce261b740533d8a66746b25710f0',1570492179,'image');
/*!40000 ALTER TABLE `dc_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_demo_diary`
--

DROP TABLE IF EXISTS `dc_demo_diary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_demo_diary` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `mpid` int(10) NOT NULL DEFAULT '0' COMMENT '账号ID',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户标识',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '日记标题',
  `content` text NOT NULL COMMENT '建议内容',
  `created_at` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `deleted_at` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `updated_at` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_demo_diary`
--

LOCK TABLES `dc_demo_diary` WRITE;
/*!40000 ALTER TABLE `dc_demo_diary` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_demo_diary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_mp`
--

DROP TABLE IF EXISTS `dc_mp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_mp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `group_id` varchar(50) DEFAULT NULL COMMENT '可用套餐ID',
  `name` varchar(50) NOT NULL COMMENT '公众号名称',
  `origin_id` varchar(50) NOT NULL COMMENT '公众号原始ID',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '公众号类型（1：普通订阅号；2：认证订阅号；3：普通服务号；4：认证服务号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常，2：审核中）',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `valid_token` varchar(40) DEFAULT NULL COMMENT '接口验证Token',
  `token` varchar(50) DEFAULT NULL COMMENT '公众号标识',
  `encodingaeskey` varchar(50) DEFAULT NULL COMMENT '消息加解密秘钥',
  `appid` varchar(50) DEFAULT NULL COMMENT 'AppId',
  `appsecret` varchar(50) DEFAULT NULL COMMENT 'AppSecret',
  `mp_number` varchar(50) DEFAULT NULL COMMENT '微信号',
  `desc` text COMMENT '描述',
  `headimg` varchar(255) DEFAULT NULL COMMENT '头像',
  `qrcode` varchar(255) DEFAULT NULL COMMENT '二维码',
  `login_name` varchar(50) DEFAULT NULL COMMENT '公众号登录名',
  `join_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '接入类型。0：手动接入，1：授权接入',
  `mp_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账号类型。1：公众号，2：小程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='公众号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_mp`
--

LOCK TABLES `dc_mp` WRITE;
/*!40000 ALTER TABLE `dc_mp` DISABLE KEYS */;
INSERT INTO `dc_mp` VALUES (1,2,NULL,'rAnDbJBkBS8h8un4','gh_600286062679',1,1,1570492180,'qwroSRxIeVTrVeaF16ixh4BgrZsJzn9l','5iWQo25yWnHl4sFjvtVwaUagEPsDMFCG','v1S2ncwV0iw4aPsT0zC7dMGOhvPrEwKrOYmG1839t4o','p4G8QYomQX','checker','checker',NULL,'http://39.105.136.196:30023/douchat-4.0.4/Uploads/Pictures/20191008/5d9bcf13f1c59.png',NULL,NULL,0,1);
/*!40000 ALTER TABLE `dc_mp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_mp_auto_reply`
--

DROP TABLE IF EXISTS `dc_mp_auto_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_mp_auto_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `type` varchar(50) DEFAULT NULL COMMENT '回复场景',
  `reply_type` varchar(50) DEFAULT NULL COMMENT '回复类型',
  `material_id` int(10) DEFAULT NULL COMMENT '回复素材ID',
  `keyword` varchar(50) DEFAULT NULL COMMENT '绑定的关键词',
  `addon` varchar(50) DEFAULT NULL COMMENT '处理消息的插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号自动回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_mp_auto_reply`
--

LOCK TABLES `dc_mp_auto_reply` WRITE;
/*!40000 ALTER TABLE `dc_mp_auto_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_mp_auto_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_mp_fans`
--

DROP TABLE IF EXISTS `dc_mp_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_mp_fans` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `openid` varchar(255) NOT NULL COMMENT '粉丝标识',
  `is_subscribe` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关注',
  `subscribe_time` int(10) DEFAULT NULL COMMENT '关注时间',
  `unsubscribe_time` int(10) DEFAULT NULL COMMENT '取消关注时间',
  `nickname` varchar(50) DEFAULT NULL COMMENT '粉丝昵称',
  `sex` tinyint(1) DEFAULT NULL COMMENT '粉丝性别',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '粉丝头像',
  `relname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `signature` text COMMENT '个性签名',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机号',
  `is_bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否绑定',
  `language` varchar(50) DEFAULT NULL COMMENT '使用语言',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `province` varchar(50) DEFAULT NULL COMMENT '身份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `groupid` int(10) DEFAULT NULL COMMENT '分组ID',
  `tagid_list` varchar(255) DEFAULT NULL COMMENT '标签',
  `score` int(10) DEFAULT '0' COMMENT '积分',
  `money` int(10) DEFAULT '0' COMMENT '金钱',
  `latitude` varchar(50) DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(50) DEFAULT NULL COMMENT '经度',
  `location_precision` varchar(50) DEFAULT NULL COMMENT '精度',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号粉丝表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_mp_fans`
--

LOCK TABLES `dc_mp_fans` WRITE;
/*!40000 ALTER TABLE `dc_mp_fans` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_mp_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_mp_group`
--

DROP TABLE IF EXISTS `dc_mp_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_mp_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(255) NOT NULL COMMENT '套餐名称',
  `addons` text COMMENT '可管理的插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_mp_group`
--

LOCK TABLES `dc_mp_group` WRITE;
/*!40000 ALTER TABLE `dc_mp_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_mp_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_mp_material`
--

DROP TABLE IF EXISTS `dc_mp_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_mp_material` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `type` varchar(50) DEFAULT NULL COMMENT '素材类型',
  `content` text COMMENT '文本素材内容',
  `image` varchar(255) DEFAULT NULL COMMENT '图片素材路径',
  `title` varchar(255) DEFAULT NULL COMMENT '图文素材标题',
  `picurl` varchar(255) DEFAULT NULL COMMENT '图文素材封面',
  `url` varchar(255) DEFAULT NULL COMMENT '图文链接',
  `description` text COMMENT '图文素材描述',
  `detail` text COMMENT '图文素材详情',
  `create_time` int(10) DEFAULT NULL COMMENT '素材创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号素材表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_mp_material`
--

LOCK TABLES `dc_mp_material` WRITE;
/*!40000 ALTER TABLE `dc_mp_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_mp_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_mp_message`
--

DROP TABLE IF EXISTS `dc_mp_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_mp_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `openid` varchar(50) NOT NULL COMMENT '用户标识',
  `msgid` varchar(50) DEFAULT NULL COMMENT '消息ID',
  `msgtype` varchar(10) NOT NULL COMMENT '消息类型',
  `content` text COMMENT '消息内容',
  `create_time` int(10) NOT NULL COMMENT '消息发送时间',
  `picurl` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `mediaid` varchar(255) DEFAULT NULL COMMENT '媒体ID',
  `format` varchar(50) DEFAULT NULL COMMENT '语音格式',
  `recognition` text COMMENT '语音识别结果',
  `thumb_mediaid` varchar(255) DEFAULT NULL COMMENT '视频消息缩略图ID',
  `location_x` float DEFAULT NULL COMMENT '地理位置纬度',
  `location_y` float DEFAULT NULL COMMENT '地理位置精度',
  `scale` int(5) DEFAULT NULL COMMENT '地图缩放大小',
  `label` varchar(50) DEFAULT NULL COMMENT '地理位置信息',
  `title` varchar(255) DEFAULT NULL COMMENT '链接消息标题',
  `description` varchar(255) DEFAULT NULL COMMENT '链接消息描述',
  `url` varchar(255) DEFAULT NULL COMMENT '链接消息地址',
  `reply_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '回复状态',
  `save_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '保存为素材状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_mp_message`
--

LOCK TABLES `dc_mp_message` WRITE;
/*!40000 ALTER TABLE `dc_mp_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_mp_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_mp_payment`
--

DROP TABLE IF EXISTS `dc_mp_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_mp_payment` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `openid` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `orderid` varchar(255) DEFAULT NULL COMMENT '订单号',
  `create_time` int(10) DEFAULT NULL COMMENT '支付时间',
  `detail` text COMMENT '支付详情',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `notify` varchar(255) NOT NULL DEFAULT '' COMMENT '支付结果处理方法',
  `prepay_id` varchar(50) NOT NULL DEFAULT '' COMMENT '预支付ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `mchid` varchar(50) NOT NULL DEFAULT '' COMMENT '商户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号支付配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_mp_payment`
--

LOCK TABLES `dc_mp_payment` WRITE;
/*!40000 ALTER TABLE `dc_mp_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_mp_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_mp_rule`
--

DROP TABLE IF EXISTS `dc_mp_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_mp_rule` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号ID',
  `addon` varchar(50) DEFAULT NULL COMMENT '插件标识',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键词内容',
  `type` varchar(50) DEFAULT NULL COMMENT '触发类型',
  `entry_id` int(10) DEFAULT NULL COMMENT '功能入口ID',
  `reply_id` int(10) DEFAULT NULL COMMENT '自动回复ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号响应规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_mp_rule`
--

LOCK TABLES `dc_mp_rule` WRITE;
/*!40000 ALTER TABLE `dc_mp_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_mp_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_mp_score_record`
--

DROP TABLE IF EXISTS `dc_mp_score_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_mp_score_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `openid` varchar(255) NOT NULL COMMENT '粉丝openid',
  `type` varchar(50) DEFAULT 'score' COMMENT '积分类型，socre、money等',
  `source` varchar(50) DEFAULT 'system' COMMENT '积分来源，system，addon',
  `value` int(10) NOT NULL COMMENT '积分值',
  `flag` varchar(50) DEFAULT NULL COMMENT '标识，fans_bind，IdouChat',
  `remark` text COMMENT '积分说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_mp_score_record`
--

LOCK TABLES `dc_mp_score_record` WRITE;
/*!40000 ALTER TABLE `dc_mp_score_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_mp_score_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_mp_setting`
--

DROP TABLE IF EXISTS `dc_mp_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_mp_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号ID',
  `name` varchar(255) NOT NULL COMMENT '配置项',
  `value` text COMMENT '配置值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_mp_setting`
--

LOCK TABLES `dc_mp_setting` WRITE;
/*!40000 ALTER TABLE `dc_mp_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_mp_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_mp_tempmsg`
--

DROP TABLE IF EXISTS `dc_mp_tempmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_mp_tempmsg` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `mpid` int(10) NOT NULL DEFAULT '0' COMMENT '账号ID',
  `openid` varchar(50) NOT NULL DEFAULT '' COMMENT '用户标识',
  `formid` varchar(255) NOT NULL DEFAULT '' COMMENT 'FormId',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型',
  `created_at` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_mp_tempmsg`
--

LOCK TABLES `dc_mp_tempmsg` WRITE;
/*!40000 ALTER TABLE `dc_mp_tempmsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_mp_tempmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_rbac_access`
--

DROP TABLE IF EXISTS `dc_rbac_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_rbac_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_rbac_access`
--

LOCK TABLES `dc_rbac_access` WRITE;
/*!40000 ALTER TABLE `dc_rbac_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_rbac_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_rbac_mp_access`
--

DROP TABLE IF EXISTS `dc_rbac_mp_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_rbac_mp_access` (
  `role_id` int(10) NOT NULL COMMENT '角色ID',
  `mp_groups` varchar(255) DEFAULT NULL COMMENT '可使用的公众号套餐',
  `mp_count` int(5) DEFAULT NULL COMMENT '可创建公众号数',
  `register_invite_count` int(10) DEFAULT NULL COMMENT '注册邀请数',
  `addons` varchar(255) DEFAULT NULL COMMENT '插件权限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_rbac_mp_access`
--

LOCK TABLES `dc_rbac_mp_access` WRITE;
/*!40000 ALTER TABLE `dc_rbac_mp_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_rbac_mp_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_rbac_node`
--

DROP TABLE IF EXISTS `dc_rbac_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_rbac_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_rbac_node`
--

LOCK TABLES `dc_rbac_node` WRITE;
/*!40000 ALTER TABLE `dc_rbac_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_rbac_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_rbac_role`
--

DROP TABLE IF EXISTS `dc_rbac_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_rbac_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_rbac_role`
--

LOCK TABLES `dc_rbac_role` WRITE;
/*!40000 ALTER TABLE `dc_rbac_role` DISABLE KEYS */;
INSERT INTO `dc_rbac_role` VALUES (1,'超级管理员',0,1,'拥有系统管理和公众号管理权限','system_manager'),(2,'系统管理员',0,1,'拥有系统后台管理权限','admin_manager'),(3,'公众号管理员',0,1,'拥有公众号管理权限','mp_manager');
/*!40000 ALTER TABLE `dc_rbac_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_rbac_role_user`
--

DROP TABLE IF EXISTS `dc_rbac_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_rbac_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  UNIQUE KEY `role_user_key` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_rbac_role_user`
--

LOCK TABLES `dc_rbac_role_user` WRITE;
/*!40000 ALTER TABLE `dc_rbac_role_user` DISABLE KEYS */;
INSERT INTO `dc_rbac_role_user` VALUES (1,'1'),(3,'2');
/*!40000 ALTER TABLE `dc_rbac_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_scene_qrcode`
--

DROP TABLE IF EXISTS `dc_scene_qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_scene_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mpid` int(10) DEFAULT NULL COMMENT '公众号标识',
  `scene_name` varchar(255) DEFAULT NULL COMMENT '场景名称',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关联关键词',
  `scene_type` char(10) DEFAULT '0' COMMENT '二维码类型',
  `scene_id` int(32) DEFAULT NULL COMMENT '场景值ID',
  `scene_str` varchar(255) DEFAULT NULL COMMENT '场景值字符串',
  `expire` int(10) DEFAULT NULL COMMENT '过期时间',
  `ticket` varchar(255) DEFAULT NULL COMMENT '二维码Ticket',
  `url` varchar(255) DEFAULT NULL COMMENT '二维码图片解析后的地址',
  `ctime` int(10) DEFAULT NULL COMMENT '二维码创建时间',
  `short_url` varchar(255) DEFAULT NULL COMMENT '二维码短地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_scene_qrcode`
--

LOCK TABLES `dc_scene_qrcode` WRITE;
/*!40000 ALTER TABLE `dc_scene_qrcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_scene_qrcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_scene_qrcode_statistics`
--

DROP TABLE IF EXISTS `dc_scene_qrcode_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_scene_qrcode_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mpid` int(10) DEFAULT NULL COMMENT '公众号标识',
  `openid` varchar(255) DEFAULT NULL COMMENT '扫码者openid',
  `scene_name` varchar(255) DEFAULT NULL COMMENT '场景名称',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关联关键词',
  `scene_id` varchar(255) DEFAULT NULL COMMENT '场景ID/场景字符串',
  `scan_type` varchar(255) DEFAULT NULL COMMENT '扫描类型',
  `ctime` int(10) DEFAULT NULL COMMENT '扫描时间',
  `qrcode_id` int(10) DEFAULT NULL COMMENT '二维码ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_scene_qrcode_statistics`
--

LOCK TABLES `dc_scene_qrcode_statistics` WRITE;
/*!40000 ALTER TABLE `dc_scene_qrcode_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_scene_qrcode_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_system_setting`
--

DROP TABLE IF EXISTS `dc_system_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_system_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(255) NOT NULL COMMENT '配置项',
  `value` text COMMENT '配置值',
  `type` varchar(50) DEFAULT NULL COMMENT '配置类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='全局配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_system_setting`
--

LOCK TABLES `dc_system_setting` WRITE;
/*!40000 ALTER TABLE `dc_system_setting` DISABLE KEYS */;
INSERT INTO `dc_system_setting` VALUES (1,'site_name','',NULL),(2,'site_intro','',NULL),(3,'site_keywords','',NULL),(4,'site_copyright','',NULL),(5,'site_icp_beian','',NULL),(6,'user_home_url','','register'),(7,'fields','[{&quot;name&quot;:&quot;register_on&quot;,&quot;title&quot;:&quot;\\u662f\\u5426\\u5f00\\u653e\\u6ce8\\u518c&quot;,&quot;type&quot;:&quot;radio&quot;,&quot;options&quot;:[&quot;\\u4e0d\\u5f00\\u653e&quot;,&quot;\\u5f00\\u653e&quot;],&quot;value&quot;:0},{&quot;name&quot;:&quot;register_default_role_id&quot;,&quot;title&quot;:&quot;\\u7528\\u6237\\u6ce8\\u518c\\u6210\\u529f\\u540e\\u9ed8\\u8ba4\\u6240\\u5c5e\\u7684\\u89d2\\u8272&quot;,&quot;type&quot;:&quot;select&quot;,&quot;options&quot;:[&quot;\\u8bf7\\u9009\\u62e9\\u89d2\\u8272&quot;,&quot;\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458&quot;,&quot;\\u7cfb\\u7edf\\u7ba1\\u7406\\u5458&quot;,&quot;\\u516c\\u4f17\\u53f7\\u7ba1\\u7406\\u5458&quot;],&quot;callback_name&quot;:&quot;get_role_list&quot;},{&quot;name&quot;:&quot;user_home_url&quot;,&quot;title&quot;:&quot;\\u7528\\u6237\\u4e3b\\u9875&quot;,&quot;type&quot;:&quot;text&quot;,&quot;placeholder&quot;:&quot;Mp\\/Index\\/index&quot;,&quot;tip&quot;:&quot;\\u7528\\u6237\\u6ce8\\u518c\\u6216\\u767b\\u5f55\\u6210\\u529f\\u540e\\u8fdb\\u5165\\u7684\\u9875\\u9762\\uff0c\\u586b\\u5199U\\u65b9\\u6cd5\\u652f\\u6301\\u7684\\u8def\\u5f84\\u53c2\\u6570&quot;}]','register'),(8,'register_on','1','register'),(9,'register_default_role_id','3','register');
/*!40000 ALTER TABLE `dc_system_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_user`
--

DROP TABLE IF EXISTS `dc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `headimg` varchar(255) DEFAULT NULL COMMENT '头像',
  `default_mpid` int(10) DEFAULT NULL COMMENT '默认管理的公众号ID',
  `email` varchar(255) DEFAULT NULL COMMENT '用户邮箱',
  `group_id` int(11) DEFAULT NULL COMMENT '用户组',
  `register_time` int(10) NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_user`
--

LOCK TABLES `dc_user` WRITE;
/*!40000 ALTER TABLE `dc_user` DISABLE KEYS */;
INSERT INTO `dc_user` VALUES (1,'Administrator','21232f297a57a5a743894a0e4a801fc3','Administrator','',0,'admin@qq.com',0,1570299535),(2,'CheckBot','bd3c159be844e97c9b6c0034c80a3caa','CheckBot',NULL,NULL,'790236835@qq.com',NULL,1570441833);
/*!40000 ALTER TABLE `dc_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-19  4:17:05
