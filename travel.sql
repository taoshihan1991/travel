/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : travel

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2015-06-04 17:29:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tr_activity`
-- ----------------------------
DROP TABLE IF EXISTS `tr_activity`;
CREATE TABLE `tr_activity` (
  `activity_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `activity_title` varchar(255) NOT NULL COMMENT '标题',
  `activity_type` enum('1','2') DEFAULT NULL COMMENT '活动类型 1:商品 2:团购',
  `activity_banner` varchar(255) NOT NULL COMMENT '活动横幅大图片',
  `activity_style` varchar(255) NOT NULL COMMENT '活动页面模板样式标识码',
  `activity_desc` varchar(1000) NOT NULL COMMENT '描述',
  `activity_start_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `activity_end_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `activity_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `activity_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '活动状态 0为关闭 1为开启',
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动表';

-- ----------------------------
-- Records of tr_activity
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_activity_detail`
-- ----------------------------
DROP TABLE IF EXISTS `tr_activity_detail`;
CREATE TABLE `tr_activity_detail` (
  `activity_detail_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `activity_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '活动编号',
  `item_id` int(11) NOT NULL COMMENT '商品或团购的编号',
  `item_name` varchar(255) NOT NULL COMMENT '商品或团购名称',
  `store_id` int(11) NOT NULL COMMENT '店铺编号',
  `store_name` varchar(255) NOT NULL COMMENT '店铺名称',
  `activity_detail_state` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '审核状态 0:(默认)待审核 1:通过 2:未通过 3:再次申请',
  `activity_detail_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`activity_detail_id`),
  KEY `activity_id` (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动细节表';

-- ----------------------------
-- Records of tr_activity_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_address`
-- ----------------------------
DROP TABLE IF EXISTS `tr_address`;
CREATE TABLE `tr_address` (
  `address_id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `member_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `true_name` varchar(50) NOT NULL COMMENT '会员姓名',
  `area_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '地区ID',
  `city_id` mediumint(9) DEFAULT NULL COMMENT '市级ID',
  `area_info` varchar(255) NOT NULL DEFAULT '' COMMENT '地区内容',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `tel_phone` varchar(20) DEFAULT NULL COMMENT '座机电话',
  `mob_phone` varchar(15) DEFAULT NULL COMMENT '手机电话',
  `is_default` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1默认收货地址',
  PRIMARY KEY (`address_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='买家地址信息表';

-- ----------------------------
-- Records of tr_address
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tr_admin`;
CREATE TABLE `tr_admin` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `admin_name` varchar(20) NOT NULL COMMENT '管理员名称',
  `admin_password` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `admin_login_time` int(10) NOT NULL DEFAULT '0' COMMENT '登录时间',
  `admin_login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `admin_is_super` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否超级管理员',
  `admin_gid` smallint(6) DEFAULT '0' COMMENT '权限组ID',
  PRIMARY KEY (`admin_id`),
  KEY `member_id` (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of tr_admin
-- ----------------------------
INSERT INTO `tr_admin` VALUES ('1', 'admin', '0192023a7bbd73250516f069df18b500', '1433401289', '14', '1', '0');

-- ----------------------------
-- Table structure for `tr_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `tr_admin_log`;
CREATE TABLE `tr_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(50) NOT NULL COMMENT '操作内容',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '发生时间',
  `admin_name` char(20) NOT NULL COMMENT '管理员',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `ip` char(15) NOT NULL COMMENT 'IP',
  `url` varchar(50) NOT NULL DEFAULT '' COMMENT 'act&op',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员操作日志';

-- ----------------------------
-- Records of tr_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_adv`
-- ----------------------------
DROP TABLE IF EXISTS `tr_adv`;
CREATE TABLE `tr_adv` (
  `adv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告自增标识编号',
  `ap_id` mediumint(8) unsigned NOT NULL COMMENT '广告位id',
  `adv_title` varchar(255) NOT NULL COMMENT '广告内容描述',
  `adv_content` varchar(1000) NOT NULL COMMENT '广告内容',
  `adv_start_date` int(10) DEFAULT NULL COMMENT '广告开始时间',
  `adv_end_date` int(10) DEFAULT NULL COMMENT '广告结束时间',
  `slide_sort` int(10) unsigned NOT NULL COMMENT '幻灯片排序',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员用户名',
  `click_num` int(10) unsigned NOT NULL COMMENT '广告点击率',
  `is_allow` smallint(1) unsigned NOT NULL COMMENT '会员购买的广告是否通过审核0未审核1审核已通过2审核未通过',
  `buy_style` varchar(10) NOT NULL COMMENT '购买方式',
  `goldpay` int(10) unsigned NOT NULL COMMENT '购买所支付的金币',
  PRIMARY KEY (`adv_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of tr_adv
-- ----------------------------
INSERT INTO `tr_adv` VALUES ('15', '9', '首页通栏', 'a:2:{s:7:\"adv_pic\";s:21:\"04418235791378401.jpg\";s:11:\"adv_pic_url\";s:14:\"www.shopnc.net\";}', '1388505600', '1577721600', '0', '0', '', '0', '1', '', '0');

-- ----------------------------
-- Table structure for `tr_adv_click`
-- ----------------------------
DROP TABLE IF EXISTS `tr_adv_click`;
CREATE TABLE `tr_adv_click` (
  `adv_id` mediumint(8) unsigned NOT NULL COMMENT '广告id',
  `ap_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属广告位id',
  `click_year` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '点击年份',
  `click_month` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '点击月份',
  `click_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点击率',
  `adv_name` varchar(100) NOT NULL COMMENT '广告名称',
  `ap_name` varchar(100) NOT NULL COMMENT '广告位名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告点击率表';

-- ----------------------------
-- Records of tr_adv_click
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_adv_position`
-- ----------------------------
DROP TABLE IF EXISTS `tr_adv_position`;
CREATE TABLE `tr_adv_position` (
  `ap_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告位置id',
  `ap_name` varchar(100) NOT NULL COMMENT '广告位置名',
  `ap_intro` varchar(255) NOT NULL COMMENT '广告位简介',
  `ap_class` smallint(1) unsigned NOT NULL COMMENT '广告类别：0图片1文字2幻灯3Flash',
  `ap_display` smallint(1) unsigned NOT NULL COMMENT '广告展示方式：0幻灯片1多广告展示2单广告展示',
  `is_use` smallint(1) unsigned NOT NULL COMMENT '广告位是否启用：0不启用1启用',
  `ap_width` int(10) NOT NULL COMMENT '广告位宽度',
  `ap_height` int(10) NOT NULL COMMENT '广告位高度',
  `ap_price` int(10) unsigned NOT NULL COMMENT '广告位单价',
  `adv_num` int(10) unsigned NOT NULL COMMENT '拥有的广告数',
  `click_num` int(10) unsigned NOT NULL COMMENT '广告位点击率',
  `default_content` varchar(100) NOT NULL COMMENT '广告位默认内容',
  PRIMARY KEY (`ap_id`)
) ENGINE=MyISAM AUTO_INCREMENT=373 DEFAULT CHARSET=utf8 COMMENT='广告位表';

-- ----------------------------
-- Records of tr_adv_position
-- ----------------------------
INSERT INTO `tr_adv_position` VALUES ('9', '首页底部通栏图片广告', '位于首页底部的通栏型图片广告', '0', '2', '1', '1200', '80', '100', '1', '0', '04418235791378401.jpg');
INSERT INTO `tr_adv_position` VALUES ('35', '积分列表页中部广告位', '积分列表页中部广告位', '0', '1', '1', '780', '254', '30', '0', '0', 'f448e48ee0deb06707480d46a2a360ae.gif');
INSERT INTO `tr_adv_position` VALUES ('37', '商品列表页左侧广告位', '商品列表页左侧广告位', '0', '1', '1', '200', '350', '100', '0', '0', '7a4832d109ee46fe7677c1d3c30e067f.gif');
INSERT INTO `tr_adv_position` VALUES ('372', '买家中心页右侧广告位', '买家中心页右侧广告位', '0', '1', '1', '200', '350', '100', '0', '0', 'adv200-300.gif');

-- ----------------------------
-- Table structure for `tr_album_class`
-- ----------------------------
DROP TABLE IF EXISTS `tr_album_class`;
CREATE TABLE `tr_album_class` (
  `aclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `aclass_name` varchar(100) NOT NULL COMMENT '相册名称',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `aclass_des` varchar(255) NOT NULL COMMENT '相册描述',
  `aclass_sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `aclass_cover` varchar(255) NOT NULL COMMENT '相册封面',
  `upload_time` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为默认相册,1代表默认',
  PRIMARY KEY (`aclass_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='相册表';

-- ----------------------------
-- Records of tr_album_class
-- ----------------------------
INSERT INTO `tr_album_class` VALUES ('1', '默认相册', '1', '', '255', '', '1387942806', '1');
INSERT INTO `tr_album_class` VALUES ('2', '默认相册', '2', '', '255', '', '1432885445', '1');

-- ----------------------------
-- Table structure for `tr_album_pic`
-- ----------------------------
DROP TABLE IF EXISTS `tr_album_pic`;
CREATE TABLE `tr_album_pic` (
  `apic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片表id',
  `apic_name` varchar(100) NOT NULL COMMENT '图片名称',
  `apic_tag` varchar(255) NOT NULL COMMENT '图片标签',
  `aclass_id` int(10) unsigned NOT NULL COMMENT '相册id',
  `apic_cover` varchar(255) NOT NULL COMMENT '图片路径',
  `apic_size` int(10) unsigned NOT NULL COMMENT '图片大小',
  `apic_spec` varchar(100) NOT NULL COMMENT '图片规格',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `upload_time` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  PRIMARY KEY (`apic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=919 DEFAULT CHARSET=utf8 COMMENT='相册图片表';

-- ----------------------------
-- Records of tr_album_pic
-- ----------------------------
INSERT INTO `tr_album_pic` VALUES ('388', '11', '', '1', '1_04418206625430066.jpg', '174541', '1x1', '1', '1388476662');
INSERT INTO `tr_album_pic` VALUES ('389', '12', '', '1', '1_04418207021778349.jpg', '336218', '1x1', '1', '1388476702');
INSERT INTO `tr_album_pic` VALUES ('390', '13', '', '1', '1_04418207062633139.jpg', '457837', '1x1', '1', '1388476706');
INSERT INTO `tr_album_pic` VALUES ('391', '14', '', '1', '1_04418207107006930.jpg', '314892', '1x1', '1', '1388476710');
INSERT INTO `tr_album_pic` VALUES ('392', '31', '', '1', '1_04418207207476705.jpg', '282850', '1x1', '1', '1388476720');
INSERT INTO `tr_album_pic` VALUES ('393', '32', '', '1', '1_04418207237197915.jpg', '521077', '1x1', '1', '1388476723');
INSERT INTO `tr_album_pic` VALUES ('394', '33', '', '1', '1_04418207258840120.jpg', '502581', '1x1', '1', '1388476725');
INSERT INTO `tr_album_pic` VALUES ('395', '34', '', '1', '1_04418207283569084.jpg', '383670', '1x1', '1', '1388476728');
INSERT INTO `tr_album_pic` VALUES ('396', '12', '', '1', '1_04418207321967915.jpg', '336218', '1x1', '1', '1388476732');
INSERT INTO `tr_album_pic` VALUES ('397', '13', '', '1', '1_04418207350682444.jpg', '457837', '1x1', '1', '1388476735');
INSERT INTO `tr_album_pic` VALUES ('398', '14', '', '1', '1_04418207374719006.jpg', '314892', '1x1', '1', '1388476737');
INSERT INTO `tr_album_pic` VALUES ('399', '21', '', '1', '1_04418207428759462.jpg', '161981', '1x1', '1', '1388476742');
INSERT INTO `tr_album_pic` VALUES ('400', '21', '', '1', '1_04418207471410641.jpg', '161981', '1x1', '1', '1388476747');
INSERT INTO `tr_album_pic` VALUES ('401', '22', '', '1', '1_04418207575073862.jpg', '384532', '1x1', '1', '1388476757');
INSERT INTO `tr_album_pic` VALUES ('402', '23', '', '1', '1_04418207617911287.jpg', '427267', '1x1', '1', '1388476761');
INSERT INTO `tr_album_pic` VALUES ('403', '24', '', '1', '1_04418207651522662.jpg', '491681', '1x1', '1', '1388476765');
INSERT INTO `tr_album_pic` VALUES ('404', '41', '', '1', '1_04418207748921454.jpg', '239524', '1x1', '1', '1388476774');
INSERT INTO `tr_album_pic` VALUES ('405', '42', '', '1', '1_04418207775017390.jpg', '129511', '1x1', '1', '1388476777');
INSERT INTO `tr_album_pic` VALUES ('406', '43', '', '1', '1_04418207803169795.jpg', '356141', '1x1', '1', '1388476780');
INSERT INTO `tr_album_pic` VALUES ('407', '44', '', '1', '1_04418207830061660.jpg', '146314', '1x1', '1', '1388476782');
INSERT INTO `tr_album_pic` VALUES ('408', '11', '', '1', '1_04418211211965600.jpg', '131570', '1x1', '1', '1388477121');
INSERT INTO `tr_album_pic` VALUES ('409', '22', '', '1', '1_04418211624146737.jpg', '251896', '1x1', '1', '1388477162');
INSERT INTO `tr_album_pic` VALUES ('410', '21', '', '1', '1_04418211646104580.jpg', '234534', '1x1', '1', '1388477164');
INSERT INTO `tr_album_pic` VALUES ('411', '23', '', '1', '1_04418211670177204.jpg', '311451', '1x1', '1', '1388477166');
INSERT INTO `tr_album_pic` VALUES ('412', '24', '', '1', '1_04418211696227370.jpg', '287928', '1x1', '1', '1388477169');
INSERT INTO `tr_album_pic` VALUES ('413', '12', '', '1', '1_04418211725315624.jpg', '239674', '1x1', '1', '1388477172');
INSERT INTO `tr_album_pic` VALUES ('414', '13', '', '1', '1_04418211757384304.jpg', '465717', '1x1', '1', '1388477175');
INSERT INTO `tr_album_pic` VALUES ('415', '14', '', '1', '1_04418211785719847.jpg', '425344', '1x1', '1', '1388477178');
INSERT INTO `tr_album_pic` VALUES ('416', '32', '', '1', '1_04418211827276143.jpg', '239282', '1x1', '1', '1388477182');
INSERT INTO `tr_album_pic` VALUES ('417', '31', '', '1', '1_04418211855225368.jpg', '233100', '1x1', '1', '1388477185');
INSERT INTO `tr_album_pic` VALUES ('418', '33', '', '1', '1_04418211883385668.jpg', '239952', '1x1', '1', '1388477188');
INSERT INTO `tr_album_pic` VALUES ('419', '34', '', '1', '1_04418211907013907.jpg', '241641', '1x1', '1', '1388477190');
INSERT INTO `tr_album_pic` VALUES ('420', '11', '', '1', '1_04418239521122578.jpg', '263011', '1x1', '1', '1388479952');
INSERT INTO `tr_album_pic` VALUES ('421', '21', '', '1', '1_04418240378724556.jpg', '227648', '1x1', '1', '1388480037');
INSERT INTO `tr_album_pic` VALUES ('422', '22', '', '1', '1_04418240412383742.jpg', '177558', '1x1', '1', '1388480041');
INSERT INTO `tr_album_pic` VALUES ('423', '23', '', '1', '1_04418240440076521.jpg', '365455', '1x1', '1', '1388480043');
INSERT INTO `tr_album_pic` VALUES ('424', '24', '', '1', '1_04418240469700467.jpg', '324199', '1x1', '1', '1388480046');
INSERT INTO `tr_album_pic` VALUES ('425', '51', '', '1', '1_04418240514917358.jpg', '151339', '1x1', '1', '1388480051');
INSERT INTO `tr_album_pic` VALUES ('426', '52', '', '1', '1_04418240547037748.jpg', '190841', '1x1', '1', '1388480054');
INSERT INTO `tr_album_pic` VALUES ('427', '53', '', '1', '1_04418240569316654.jpg', '148740', '1x1', '1', '1388480056');
INSERT INTO `tr_album_pic` VALUES ('428', '54', '', '1', '1_04418240593223779.jpg', '187276', '1x1', '1', '1388480059');
INSERT INTO `tr_album_pic` VALUES ('429', '31', '', '1', '1_04418240641767556.jpg', '359584', '1x1', '1', '1388480064');
INSERT INTO `tr_album_pic` VALUES ('430', '32', '', '1', '1_04418240666885368.jpg', '283091', '1x1', '1', '1388480066');
INSERT INTO `tr_album_pic` VALUES ('431', '33', '', '1', '1_04418240697199699.jpg', '332601', '1x1', '1', '1388480069');
INSERT INTO `tr_album_pic` VALUES ('432', '34', '', '1', '1_04418240726658802.jpg', '281580', '1x1', '1', '1388480072');
INSERT INTO `tr_album_pic` VALUES ('433', '41', '', '1', '1_04418240795665638.jpg', '142770', '1x1', '1', '1388480079');
INSERT INTO `tr_album_pic` VALUES ('434', '42', '', '1', '1_04418240827143666.jpg', '131160', '1x1', '1', '1388480082');
INSERT INTO `tr_album_pic` VALUES ('435', '43', '', '1', '1_04418240859146562.jpg', '374630', '1x1', '1', '1388480085');
INSERT INTO `tr_album_pic` VALUES ('436', '44', '', '1', '1_04418240886330482.jpg', '346866', '1x1', '1', '1388480088');
INSERT INTO `tr_album_pic` VALUES ('437', '51', '', '1', '1_04418240955916042.jpg', '151339', '1x1', '1', '1388480095');
INSERT INTO `tr_album_pic` VALUES ('438', '52', '', '1', '1_04418240987274775.jpg', '190841', '1x1', '1', '1388480098');
INSERT INTO `tr_album_pic` VALUES ('439', '53', '', '1', '1_04418241012342707.jpg', '148740', '1x1', '1', '1388480101');
INSERT INTO `tr_album_pic` VALUES ('440', '54', '', '1', '1_04418241035889286.jpg', '187276', '1x1', '1', '1388480103');
INSERT INTO `tr_album_pic` VALUES ('441', '1', '', '1', '1_04418241398474746.jpg', '208231', '1x1', '1', '1388480139');
INSERT INTO `tr_album_pic` VALUES ('442', '11', '', '1', '1_04418242684128103.jpg', '263011', '1x1', '1', '1388480268');
INSERT INTO `tr_album_pic` VALUES ('443', '12', '', '1', '1_04418242714323222.jpg', '189817', '1x1', '1', '1388480271');
INSERT INTO `tr_album_pic` VALUES ('444', '13', '', '1', '1_04418242742004222.jpg', '65729', '1x1', '1', '1388480274');
INSERT INTO `tr_album_pic` VALUES ('445', '14', '', '1', '1_04418242771276943.jpg', '334143', '1x1', '1', '1388480277');
INSERT INTO `tr_album_pic` VALUES ('446', '1', '', '1', '1_04418242839438481.jpg', '208231', '1x1', '1', '1388480283');
INSERT INTO `tr_album_pic` VALUES ('447', '1', '', '1', '1_04418242873386601.jpg', '208231', '1x1', '1', '1388480287');
INSERT INTO `tr_album_pic` VALUES ('448', '1', '', '1', '1_04418242912771108.jpg', '208231', '1x1', '1', '1388480291');
INSERT INTO `tr_album_pic` VALUES ('449', '12', '', '1', '1_04418253211770278.jpg', '165391', '1x1', '1', '1388481321');
INSERT INTO `tr_album_pic` VALUES ('450', '11', '', '1', '1_04418253240878850.jpg', '171643', '1x1', '1', '1388481324');
INSERT INTO `tr_album_pic` VALUES ('451', '12', '', '1', '1_04418253965368434.jpg', '165391', '1x1', '1', '1388481396');
INSERT INTO `tr_album_pic` VALUES ('452', '13', '', '1', '1_04418253993341194.jpg', '128894', '1x1', '1', '1388481399');
INSERT INTO `tr_album_pic` VALUES ('453', '14', '', '1', '1_04418254020459178.jpg', '111305', '1x1', '1', '1388481402');
INSERT INTO `tr_album_pic` VALUES ('454', '22', '', '1', '1_04418254088878407.jpg', '198054', '1x1', '1', '1388481408');
INSERT INTO `tr_album_pic` VALUES ('455', '21', '', '1', '1_04418254118588220.jpg', '277621', '1x1', '1', '1388481411');
INSERT INTO `tr_album_pic` VALUES ('456', '23', '', '1', '1_04418254147327427.jpg', '261169', '1x1', '1', '1388481414');
INSERT INTO `tr_album_pic` VALUES ('457', '24', '', '1', '1_04418254171863431.jpg', '258254', '1x1', '1', '1388481417');
INSERT INTO `tr_album_pic` VALUES ('458', '31', '', '1', '1_04418254218437108.jpg', '177831', '1x1', '1', '1388481421');
INSERT INTO `tr_album_pic` VALUES ('459', '32', '', '1', '1_04418254243309723.jpg', '192984', '1x1', '1', '1388481424');
INSERT INTO `tr_album_pic` VALUES ('460', '33', '', '1', '1_04418254270788167.jpg', '299184', '1x1', '1', '1388481427');
INSERT INTO `tr_album_pic` VALUES ('461', '34', '', '1', '1_04418254463390448.jpg', '244684', '1x1', '1', '1388481446');
INSERT INTO `tr_album_pic` VALUES ('912', '5', '', '1', '1_04423392298369303.jpg', '175464', '1x1', '1', '1388995229');
INSERT INTO `tr_album_pic` VALUES ('913', '副本', '', '1', '1_04423392645620711.jpg', '449848', '1x1', '1', '1388995264');
INSERT INTO `tr_album_pic` VALUES ('914', '1', '', '1', '1_04423411880302392.png', '638634', '1x1', '1', '1388997188');
INSERT INTO `tr_album_pic` VALUES ('915', '副本', '', '1', '1_04423412221350722.jpg', '868721', '1x1', '1', '1388997222');
INSERT INTO `tr_album_pic` VALUES ('916', '2', '', '1', '1_04423412434387147.png', '346293', '1x1', '1', '1388997243');
INSERT INTO `tr_album_pic` VALUES ('917', '3', '', '1', '1_04423412474341466.png', '446748', '1x1', '1', '1388997247');
INSERT INTO `tr_album_pic` VALUES ('918', '7e91_m', '', '2', '2_04862301256087475.jpg', '53524', '550x331', '2', '1432886124');

-- ----------------------------
-- Table structure for `tr_area`
-- ----------------------------
DROP TABLE IF EXISTS `tr_area`;
CREATE TABLE `tr_area` (
  `area_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `area_name` varchar(50) NOT NULL COMMENT '地区名称',
  `area_parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区父ID',
  `area_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `area_deep` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '地区深度，从1开始',
  PRIMARY KEY (`area_id`),
  KEY `area_parent_id` (`area_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45056 DEFAULT CHARSET=utf8 COMMENT='地区表';

-- ----------------------------
-- Records of tr_area
-- ----------------------------
INSERT INTO `tr_area` VALUES ('1', '北京', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('2', '天津', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('3', '河北省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('4', '山西省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('5', '内蒙古自治区', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('6', '辽宁省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('7', '吉林省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('8', '黑龙江省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('9', '上海', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('10', '江苏省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('11', '浙江省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('12', '安徽省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('13', '福建省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('14', '江西省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('15', '山东省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('16', '河南省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('17', '湖北省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('18', '湖南省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('19', '广东省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('20', '广西壮族自治区', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('21', '海南省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('22', '重庆', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('23', '四川省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('24', '贵州省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('25', '云南省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('26', '西藏自治区', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('27', '陕西省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('28', '甘肃省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('29', '青海省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('30', '宁夏回族自治区', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('31', '新疆维吾尔自治区', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('32', '台湾省', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('33', '香港特别行政区', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('34', '澳门特别行政区', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('35', '海外', '0', '0', '1');
INSERT INTO `tr_area` VALUES ('36', '北京市', '1', '0', '2');
INSERT INTO `tr_area` VALUES ('37', '东城区', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('38', '西城区', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('41', '朝阳区', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('42', '丰台区', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('43', '石景山区', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('44', '海淀区', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('45', '门头沟区', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('46', '房山区', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('47', '通州区', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('48', '顺义区', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('49', '昌平区', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('50', '大兴区', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('51', '怀柔区', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('52', '平谷区', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('53', '密云县', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('54', '延庆县', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('39', '上海市', '9', '0', '2');
INSERT INTO `tr_area` VALUES ('40', '天津市', '2', '0', '2');
INSERT INTO `tr_area` VALUES ('62', '重庆市', '22', '0', '2');
INSERT INTO `tr_area` VALUES ('55', '和平区', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('56', '河东区', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('57', '河西区', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('58', '南开区', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('59', '河北区', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('60', '红桥区', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('61', '塘沽区', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('64', '东丽区', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('65', '西青区', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('66', '津南区', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('67', '北辰区', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('68', '武清区', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('69', '宝坻区', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('70', '宁河县', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('71', '静海县', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('72', '蓟县', '40', '0', '3');
INSERT INTO `tr_area` VALUES ('73', '石家庄市', '3', '0', '2');
INSERT INTO `tr_area` VALUES ('74', '唐山市', '3', '0', '2');
INSERT INTO `tr_area` VALUES ('75', '秦皇岛市', '3', '0', '2');
INSERT INTO `tr_area` VALUES ('76', '邯郸市', '3', '0', '2');
INSERT INTO `tr_area` VALUES ('77', '邢台市', '3', '0', '2');
INSERT INTO `tr_area` VALUES ('78', '保定市', '3', '0', '2');
INSERT INTO `tr_area` VALUES ('79', '张家口市', '3', '0', '2');
INSERT INTO `tr_area` VALUES ('80', '承德市', '3', '0', '2');
INSERT INTO `tr_area` VALUES ('81', '衡水市', '3', '0', '2');
INSERT INTO `tr_area` VALUES ('82', '廊坊市', '3', '0', '2');
INSERT INTO `tr_area` VALUES ('83', '沧州市', '3', '0', '2');
INSERT INTO `tr_area` VALUES ('84', '太原市', '4', '0', '2');
INSERT INTO `tr_area` VALUES ('85', '大同市', '4', '0', '2');
INSERT INTO `tr_area` VALUES ('86', '阳泉市', '4', '0', '2');
INSERT INTO `tr_area` VALUES ('87', '长治市', '4', '0', '2');
INSERT INTO `tr_area` VALUES ('88', '晋城市', '4', '0', '2');
INSERT INTO `tr_area` VALUES ('89', '朔州市', '4', '0', '2');
INSERT INTO `tr_area` VALUES ('90', '晋中市', '4', '0', '2');
INSERT INTO `tr_area` VALUES ('91', '运城市', '4', '0', '2');
INSERT INTO `tr_area` VALUES ('92', '忻州市', '4', '0', '2');
INSERT INTO `tr_area` VALUES ('93', '临汾市', '4', '0', '2');
INSERT INTO `tr_area` VALUES ('94', '吕梁市', '4', '0', '2');
INSERT INTO `tr_area` VALUES ('95', '呼和浩特市', '5', '0', '2');
INSERT INTO `tr_area` VALUES ('96', '包头市', '5', '0', '2');
INSERT INTO `tr_area` VALUES ('97', '乌海市', '5', '0', '2');
INSERT INTO `tr_area` VALUES ('98', '赤峰市', '5', '0', '2');
INSERT INTO `tr_area` VALUES ('99', '通辽市', '5', '0', '2');
INSERT INTO `tr_area` VALUES ('100', '鄂尔多斯市', '5', '0', '2');
INSERT INTO `tr_area` VALUES ('101', '呼伦贝尔市', '5', '0', '2');
INSERT INTO `tr_area` VALUES ('102', '巴彦淖尔市', '5', '0', '2');
INSERT INTO `tr_area` VALUES ('103', '乌兰察布市', '5', '0', '2');
INSERT INTO `tr_area` VALUES ('104', '兴安盟', '5', '0', '2');
INSERT INTO `tr_area` VALUES ('105', '锡林郭勒盟', '5', '0', '2');
INSERT INTO `tr_area` VALUES ('106', '阿拉善盟', '5', '0', '2');
INSERT INTO `tr_area` VALUES ('107', '沈阳市', '6', '0', '2');
INSERT INTO `tr_area` VALUES ('108', '大连市', '6', '0', '2');
INSERT INTO `tr_area` VALUES ('109', '鞍山市', '6', '0', '2');
INSERT INTO `tr_area` VALUES ('110', '抚顺市', '6', '0', '2');
INSERT INTO `tr_area` VALUES ('111', '本溪市', '6', '0', '2');
INSERT INTO `tr_area` VALUES ('112', '丹东市', '6', '0', '2');
INSERT INTO `tr_area` VALUES ('113', '锦州市', '6', '0', '2');
INSERT INTO `tr_area` VALUES ('114', '营口市', '6', '0', '2');
INSERT INTO `tr_area` VALUES ('115', '阜新市', '6', '0', '2');
INSERT INTO `tr_area` VALUES ('116', '辽阳市', '6', '0', '2');
INSERT INTO `tr_area` VALUES ('117', '盘锦市', '6', '0', '2');
INSERT INTO `tr_area` VALUES ('118', '铁岭市', '6', '0', '2');
INSERT INTO `tr_area` VALUES ('119', '朝阳市', '6', '0', '2');
INSERT INTO `tr_area` VALUES ('120', '葫芦岛市', '6', '0', '2');
INSERT INTO `tr_area` VALUES ('121', '长春市', '7', '0', '2');
INSERT INTO `tr_area` VALUES ('122', '吉林市', '7', '0', '2');
INSERT INTO `tr_area` VALUES ('123', '四平市', '7', '0', '2');
INSERT INTO `tr_area` VALUES ('124', '辽源市', '7', '0', '2');
INSERT INTO `tr_area` VALUES ('125', '通化市', '7', '0', '2');
INSERT INTO `tr_area` VALUES ('126', '白山市', '7', '0', '2');
INSERT INTO `tr_area` VALUES ('127', '松原市', '7', '0', '2');
INSERT INTO `tr_area` VALUES ('128', '白城市', '7', '0', '2');
INSERT INTO `tr_area` VALUES ('129', '延边朝鲜族自治州', '7', '0', '2');
INSERT INTO `tr_area` VALUES ('130', '哈尔滨市', '8', '0', '2');
INSERT INTO `tr_area` VALUES ('131', '齐齐哈尔市', '8', '0', '2');
INSERT INTO `tr_area` VALUES ('132', '鸡西市', '8', '0', '2');
INSERT INTO `tr_area` VALUES ('133', '鹤岗市', '8', '0', '2');
INSERT INTO `tr_area` VALUES ('134', '双鸭山市', '8', '0', '2');
INSERT INTO `tr_area` VALUES ('135', '大庆市', '8', '0', '2');
INSERT INTO `tr_area` VALUES ('136', '伊春市', '8', '0', '2');
INSERT INTO `tr_area` VALUES ('137', '佳木斯市', '8', '0', '2');
INSERT INTO `tr_area` VALUES ('138', '七台河市', '8', '0', '2');
INSERT INTO `tr_area` VALUES ('139', '牡丹江市', '8', '0', '2');
INSERT INTO `tr_area` VALUES ('140', '黑河市', '8', '0', '2');
INSERT INTO `tr_area` VALUES ('141', '绥化市', '8', '0', '2');
INSERT INTO `tr_area` VALUES ('142', '大兴安岭地区', '8', '0', '2');
INSERT INTO `tr_area` VALUES ('143', '黄浦区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('144', '卢湾区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('145', '徐汇区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('146', '长宁区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('147', '静安区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('148', '普陀区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('149', '闸北区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('150', '虹口区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('151', '杨浦区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('152', '闵行区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('153', '宝山区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('154', '嘉定区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('155', '浦东新区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('156', '金山区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('157', '松江区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('158', '青浦区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('159', '南汇区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('160', '奉贤区', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('161', '崇明县', '39', '0', '3');
INSERT INTO `tr_area` VALUES ('162', '南京市', '10', '0', '2');
INSERT INTO `tr_area` VALUES ('163', '无锡市', '10', '0', '2');
INSERT INTO `tr_area` VALUES ('164', '徐州市', '10', '0', '2');
INSERT INTO `tr_area` VALUES ('165', '常州市', '10', '0', '2');
INSERT INTO `tr_area` VALUES ('166', '苏州市', '10', '0', '2');
INSERT INTO `tr_area` VALUES ('167', '南通市', '10', '0', '2');
INSERT INTO `tr_area` VALUES ('168', '连云港市', '10', '0', '2');
INSERT INTO `tr_area` VALUES ('169', '淮安市', '10', '0', '2');
INSERT INTO `tr_area` VALUES ('170', '盐城市', '10', '0', '2');
INSERT INTO `tr_area` VALUES ('171', '扬州市', '10', '0', '2');
INSERT INTO `tr_area` VALUES ('172', '镇江市', '10', '0', '2');
INSERT INTO `tr_area` VALUES ('173', '泰州市', '10', '0', '2');
INSERT INTO `tr_area` VALUES ('174', '宿迁市', '10', '0', '2');
INSERT INTO `tr_area` VALUES ('175', '杭州市', '11', '0', '2');
INSERT INTO `tr_area` VALUES ('176', '宁波市', '11', '0', '2');
INSERT INTO `tr_area` VALUES ('177', '温州市', '11', '0', '2');
INSERT INTO `tr_area` VALUES ('178', '嘉兴市', '11', '0', '2');
INSERT INTO `tr_area` VALUES ('179', '湖州市', '11', '0', '2');
INSERT INTO `tr_area` VALUES ('180', '绍兴市', '11', '0', '2');
INSERT INTO `tr_area` VALUES ('181', '舟山市', '11', '0', '2');
INSERT INTO `tr_area` VALUES ('182', '衢州市', '11', '0', '2');
INSERT INTO `tr_area` VALUES ('183', '金华市', '11', '0', '2');
INSERT INTO `tr_area` VALUES ('184', '台州市', '11', '0', '2');
INSERT INTO `tr_area` VALUES ('185', '丽水市', '11', '0', '2');
INSERT INTO `tr_area` VALUES ('186', '合肥市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('187', '芜湖市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('188', '蚌埠市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('189', '淮南市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('190', '马鞍山市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('191', '淮北市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('192', '铜陵市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('193', '安庆市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('194', '黄山市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('195', '滁州市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('196', '阜阳市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('197', '宿州市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('198', '巢湖市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('199', '六安市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('200', '亳州市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('201', '池州市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('202', '宣城市', '12', '0', '2');
INSERT INTO `tr_area` VALUES ('203', '福州市', '13', '0', '2');
INSERT INTO `tr_area` VALUES ('204', '厦门市', '13', '0', '2');
INSERT INTO `tr_area` VALUES ('205', '莆田市', '13', '0', '2');
INSERT INTO `tr_area` VALUES ('206', '三明市', '13', '0', '2');
INSERT INTO `tr_area` VALUES ('207', '泉州市', '13', '0', '2');
INSERT INTO `tr_area` VALUES ('208', '漳州市', '13', '0', '2');
INSERT INTO `tr_area` VALUES ('209', '南平市', '13', '0', '2');
INSERT INTO `tr_area` VALUES ('210', '龙岩市', '13', '0', '2');
INSERT INTO `tr_area` VALUES ('211', '宁德市', '13', '0', '2');
INSERT INTO `tr_area` VALUES ('212', '南昌市', '14', '0', '2');
INSERT INTO `tr_area` VALUES ('213', '景德镇市', '14', '0', '2');
INSERT INTO `tr_area` VALUES ('214', '萍乡市', '14', '0', '2');
INSERT INTO `tr_area` VALUES ('215', '九江市', '14', '0', '2');
INSERT INTO `tr_area` VALUES ('216', '新余市', '14', '0', '2');
INSERT INTO `tr_area` VALUES ('217', '鹰潭市', '14', '0', '2');
INSERT INTO `tr_area` VALUES ('218', '赣州市', '14', '0', '2');
INSERT INTO `tr_area` VALUES ('219', '吉安市', '14', '0', '2');
INSERT INTO `tr_area` VALUES ('220', '宜春市', '14', '0', '2');
INSERT INTO `tr_area` VALUES ('221', '抚州市', '14', '0', '2');
INSERT INTO `tr_area` VALUES ('222', '上饶市', '14', '0', '2');
INSERT INTO `tr_area` VALUES ('223', '济南市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('224', '青岛市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('225', '淄博市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('226', '枣庄市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('227', '东营市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('228', '烟台市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('229', '潍坊市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('230', '济宁市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('231', '泰安市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('232', '威海市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('233', '日照市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('234', '莱芜市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('235', '临沂市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('236', '德州市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('237', '聊城市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('238', '滨州市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('239', '菏泽市', '15', '0', '2');
INSERT INTO `tr_area` VALUES ('240', '郑州市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('241', '开封市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('242', '洛阳市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('243', '平顶山市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('244', '安阳市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('245', '鹤壁市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('246', '新乡市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('247', '焦作市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('248', '濮阳市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('249', '许昌市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('250', '漯河市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('251', '三门峡市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('252', '南阳市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('253', '商丘市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('254', '信阳市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('255', '周口市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('256', '驻马店市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('257', '济源市', '16', '0', '2');
INSERT INTO `tr_area` VALUES ('258', '武汉市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('259', '黄石市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('260', '十堰市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('261', '宜昌市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('262', '襄樊市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('263', '鄂州市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('264', '荆门市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('265', '孝感市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('266', '荆州市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('267', '黄冈市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('268', '咸宁市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('269', '随州市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('270', '恩施土家族苗族自治州', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('271', '仙桃市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('272', '潜江市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('273', '天门市', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('274', '神农架林区', '17', '0', '2');
INSERT INTO `tr_area` VALUES ('275', '长沙市', '18', '0', '2');
INSERT INTO `tr_area` VALUES ('276', '株洲市', '18', '0', '2');
INSERT INTO `tr_area` VALUES ('277', '湘潭市', '18', '0', '2');
INSERT INTO `tr_area` VALUES ('278', '衡阳市', '18', '0', '2');
INSERT INTO `tr_area` VALUES ('279', '邵阳市', '18', '0', '2');
INSERT INTO `tr_area` VALUES ('280', '岳阳市', '18', '0', '2');
INSERT INTO `tr_area` VALUES ('281', '常德市', '18', '0', '2');
INSERT INTO `tr_area` VALUES ('282', '张家界市', '18', '0', '2');
INSERT INTO `tr_area` VALUES ('283', '益阳市', '18', '0', '2');
INSERT INTO `tr_area` VALUES ('284', '郴州市', '18', '0', '2');
INSERT INTO `tr_area` VALUES ('285', '永州市', '18', '0', '2');
INSERT INTO `tr_area` VALUES ('286', '怀化市', '18', '0', '2');
INSERT INTO `tr_area` VALUES ('287', '娄底市', '18', '0', '2');
INSERT INTO `tr_area` VALUES ('288', '湘西土家族苗族自治州', '18', '0', '2');
INSERT INTO `tr_area` VALUES ('289', '广州市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('290', '韶关市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('291', '深圳市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('292', '珠海市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('293', '汕头市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('294', '佛山市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('295', '江门市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('296', '湛江市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('297', '茂名市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('298', '肇庆市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('299', '惠州市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('300', '梅州市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('301', '汕尾市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('302', '河源市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('303', '阳江市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('304', '清远市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('305', '东莞市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('306', '中山市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('307', '潮州市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('308', '揭阳市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('309', '云浮市', '19', '0', '2');
INSERT INTO `tr_area` VALUES ('310', '南宁市', '20', '0', '2');
INSERT INTO `tr_area` VALUES ('311', '柳州市', '20', '0', '2');
INSERT INTO `tr_area` VALUES ('312', '桂林市', '20', '0', '2');
INSERT INTO `tr_area` VALUES ('313', '梧州市', '20', '0', '2');
INSERT INTO `tr_area` VALUES ('314', '北海市', '20', '0', '2');
INSERT INTO `tr_area` VALUES ('315', '防城港市', '20', '0', '2');
INSERT INTO `tr_area` VALUES ('316', '钦州市', '20', '0', '2');
INSERT INTO `tr_area` VALUES ('317', '贵港市', '20', '0', '2');
INSERT INTO `tr_area` VALUES ('318', '玉林市', '20', '0', '2');
INSERT INTO `tr_area` VALUES ('319', '百色市', '20', '0', '2');
INSERT INTO `tr_area` VALUES ('320', '贺州市', '20', '0', '2');
INSERT INTO `tr_area` VALUES ('321', '河池市', '20', '0', '2');
INSERT INTO `tr_area` VALUES ('322', '来宾市', '20', '0', '2');
INSERT INTO `tr_area` VALUES ('323', '崇左市', '20', '0', '2');
INSERT INTO `tr_area` VALUES ('324', '海口市', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('325', '三亚市', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('326', '五指山市', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('327', '琼海市', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('328', '儋州市', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('329', '文昌市', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('330', '万宁市', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('331', '东方市', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('332', '定安县', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('333', '屯昌县', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('334', '澄迈县', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('335', '临高县', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('336', '白沙黎族自治县', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('337', '昌江黎族自治县', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('338', '乐东黎族自治县', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('339', '陵水黎族自治县', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('340', '保亭黎族苗族自治县', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('341', '琼中黎族苗族自治县', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('342', '西沙群岛', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('343', '南沙群岛', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('344', '中沙群岛的岛礁及其海域', '21', '0', '2');
INSERT INTO `tr_area` VALUES ('345', '万州区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('346', '涪陵区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('347', '渝中区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('348', '大渡口区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('349', '江北区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('350', '沙坪坝区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('351', '九龙坡区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('352', '南岸区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('353', '北碚区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('354', '双桥区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('355', '万盛区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('356', '渝北区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('357', '巴南区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('358', '黔江区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('359', '长寿区', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('360', '綦江县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('361', '潼南县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('362', '铜梁县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('363', '大足县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('364', '荣昌县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('365', '璧山县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('366', '梁平县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('367', '城口县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('368', '丰都县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('369', '垫江县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('370', '武隆县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('371', '忠县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('372', '开县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('373', '云阳县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('374', '奉节县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('375', '巫山县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('376', '巫溪县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('377', '石柱土家族自治县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('378', '秀山土家族苗族自治县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('379', '酉阳土家族苗族自治县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('380', '彭水苗族土家族自治县', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('381', '江津市', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('382', '合川市', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('383', '永川市', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('384', '南川市', '62', '0', '3');
INSERT INTO `tr_area` VALUES ('385', '成都市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('386', '自贡市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('387', '攀枝花市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('388', '泸州市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('389', '德阳市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('390', '绵阳市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('391', '广元市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('392', '遂宁市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('393', '内江市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('394', '乐山市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('395', '南充市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('396', '眉山市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('397', '宜宾市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('398', '广安市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('399', '达州市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('400', '雅安市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('401', '巴中市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('402', '资阳市', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('403', '阿坝藏族羌族自治州', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('404', '甘孜藏族自治州', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('405', '凉山彝族自治州', '23', '0', '2');
INSERT INTO `tr_area` VALUES ('406', '贵阳市', '24', '0', '2');
INSERT INTO `tr_area` VALUES ('407', '六盘水市', '24', '0', '2');
INSERT INTO `tr_area` VALUES ('408', '遵义市', '24', '0', '2');
INSERT INTO `tr_area` VALUES ('409', '安顺市', '24', '0', '2');
INSERT INTO `tr_area` VALUES ('410', '铜仁地区', '24', '0', '2');
INSERT INTO `tr_area` VALUES ('411', '黔西南布依族苗族自治州', '24', '0', '2');
INSERT INTO `tr_area` VALUES ('412', '毕节地区', '24', '0', '2');
INSERT INTO `tr_area` VALUES ('413', '黔东南苗族侗族自治州', '24', '0', '2');
INSERT INTO `tr_area` VALUES ('414', '黔南布依族苗族自治州', '24', '0', '2');
INSERT INTO `tr_area` VALUES ('415', '昆明市', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('416', '曲靖市', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('417', '玉溪市', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('418', '保山市', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('419', '昭通市', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('420', '丽江市', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('421', '思茅市', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('422', '临沧市', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('423', '楚雄彝族自治州', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('424', '红河哈尼族彝族自治州', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('425', '文山壮族苗族自治州', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('426', '西双版纳傣族自治州', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('427', '大理白族自治州', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('428', '德宏傣族景颇族自治州', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('429', '怒江傈僳族自治州', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('430', '迪庆藏族自治州', '25', '0', '2');
INSERT INTO `tr_area` VALUES ('431', '拉萨市', '26', '0', '2');
INSERT INTO `tr_area` VALUES ('432', '昌都地区', '26', '0', '2');
INSERT INTO `tr_area` VALUES ('433', '山南地区', '26', '0', '2');
INSERT INTO `tr_area` VALUES ('434', '日喀则地区', '26', '0', '2');
INSERT INTO `tr_area` VALUES ('435', '那曲地区', '26', '0', '2');
INSERT INTO `tr_area` VALUES ('436', '阿里地区', '26', '0', '2');
INSERT INTO `tr_area` VALUES ('437', '林芝地区', '26', '0', '2');
INSERT INTO `tr_area` VALUES ('438', '西安市', '27', '0', '2');
INSERT INTO `tr_area` VALUES ('439', '铜川市', '27', '0', '2');
INSERT INTO `tr_area` VALUES ('440', '宝鸡市', '27', '0', '2');
INSERT INTO `tr_area` VALUES ('441', '咸阳市', '27', '0', '2');
INSERT INTO `tr_area` VALUES ('442', '渭南市', '27', '0', '2');
INSERT INTO `tr_area` VALUES ('443', '延安市', '27', '0', '2');
INSERT INTO `tr_area` VALUES ('444', '汉中市', '27', '0', '2');
INSERT INTO `tr_area` VALUES ('445', '榆林市', '27', '0', '2');
INSERT INTO `tr_area` VALUES ('446', '安康市', '27', '0', '2');
INSERT INTO `tr_area` VALUES ('447', '商洛市', '27', '0', '2');
INSERT INTO `tr_area` VALUES ('448', '兰州市', '28', '0', '2');
INSERT INTO `tr_area` VALUES ('449', '嘉峪关市', '28', '0', '2');
INSERT INTO `tr_area` VALUES ('450', '金昌市', '28', '0', '2');
INSERT INTO `tr_area` VALUES ('451', '白银市', '28', '0', '2');
INSERT INTO `tr_area` VALUES ('452', '天水市', '28', '0', '2');
INSERT INTO `tr_area` VALUES ('453', '武威市', '28', '0', '2');
INSERT INTO `tr_area` VALUES ('454', '张掖市', '28', '0', '2');
INSERT INTO `tr_area` VALUES ('455', '平凉市', '28', '0', '2');
INSERT INTO `tr_area` VALUES ('456', '酒泉市', '28', '0', '2');
INSERT INTO `tr_area` VALUES ('457', '庆阳市', '28', '0', '2');
INSERT INTO `tr_area` VALUES ('458', '定西市', '28', '0', '2');
INSERT INTO `tr_area` VALUES ('459', '陇南市', '28', '0', '2');
INSERT INTO `tr_area` VALUES ('460', '临夏回族自治州', '28', '0', '2');
INSERT INTO `tr_area` VALUES ('461', '甘南藏族自治州', '28', '0', '2');
INSERT INTO `tr_area` VALUES ('462', '西宁市', '29', '0', '2');
INSERT INTO `tr_area` VALUES ('463', '海东地区', '29', '0', '2');
INSERT INTO `tr_area` VALUES ('464', '海北藏族自治州', '29', '0', '2');
INSERT INTO `tr_area` VALUES ('465', '黄南藏族自治州', '29', '0', '2');
INSERT INTO `tr_area` VALUES ('466', '海南藏族自治州', '29', '0', '2');
INSERT INTO `tr_area` VALUES ('467', '果洛藏族自治州', '29', '0', '2');
INSERT INTO `tr_area` VALUES ('468', '玉树藏族自治州', '29', '0', '2');
INSERT INTO `tr_area` VALUES ('469', '海西蒙古族藏族自治州', '29', '0', '2');
INSERT INTO `tr_area` VALUES ('470', '银川市', '30', '0', '2');
INSERT INTO `tr_area` VALUES ('471', '石嘴山市', '30', '0', '2');
INSERT INTO `tr_area` VALUES ('472', '吴忠市', '30', '0', '2');
INSERT INTO `tr_area` VALUES ('473', '固原市', '30', '0', '2');
INSERT INTO `tr_area` VALUES ('474', '中卫市', '30', '0', '2');
INSERT INTO `tr_area` VALUES ('475', '乌鲁木齐市', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('476', '克拉玛依市', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('477', '吐鲁番地区', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('478', '哈密地区', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('479', '昌吉回族自治州', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('480', '博尔塔拉蒙古自治州', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('481', '巴音郭楞蒙古自治州', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('482', '阿克苏地区', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('483', '克孜勒苏柯尔克孜自治州', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('484', '喀什地区', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('485', '和田地区', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('486', '伊犁哈萨克自治州', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('487', '塔城地区', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('488', '阿勒泰地区', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('489', '石河子市', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('490', '阿拉尔市', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('491', '图木舒克市', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('492', '五家渠市', '31', '0', '2');
INSERT INTO `tr_area` VALUES ('493', '台北市', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('494', '高雄市', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('495', '基隆市', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('496', '台中市', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('497', '台南市', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('498', '新竹市', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('499', '嘉义市', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('500', '台北县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('501', '宜兰县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('502', '桃园县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('503', '新竹县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('504', '苗栗县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('505', '台中县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('506', '彰化县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('507', '南投县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('508', '云林县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('509', '嘉义县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('510', '台南县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('511', '高雄县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('512', '屏东县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('513', '澎湖县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('514', '台东县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('515', '花莲县', '32', '0', '2');
INSERT INTO `tr_area` VALUES ('516', '中西区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('517', '东区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('518', '九龙城区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('519', '观塘区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('520', '南区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('521', '深水埗区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('522', '黄大仙区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('523', '湾仔区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('524', '油尖旺区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('525', '离岛区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('526', '葵青区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('527', '北区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('528', '西贡区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('529', '沙田区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('530', '屯门区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('531', '大埔区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('532', '荃湾区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('533', '元朗区', '33', '0', '2');
INSERT INTO `tr_area` VALUES ('534', '澳门特别行政区', '34', '0', '2');
INSERT INTO `tr_area` VALUES ('535', '美国', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('536', '加拿大', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('537', '澳大利亚', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('538', '新西兰', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('539', '英国', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('540', '法国', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('541', '德国', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('542', '捷克', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('543', '荷兰', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('544', '瑞士', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('545', '希腊', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('546', '挪威', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('547', '瑞典', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('548', '丹麦', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('549', '芬兰', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('550', '爱尔兰', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('551', '奥地利', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('552', '意大利', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('553', '乌克兰', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('554', '俄罗斯', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('555', '西班牙', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('556', '韩国', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('557', '新加坡', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('558', '马来西亚', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('559', '印度', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('560', '泰国', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('561', '日本', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('562', '巴西', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('563', '阿根廷', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('564', '南非', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('565', '埃及', '45055', '0', '3');
INSERT INTO `tr_area` VALUES ('566', '其他', '36', '0', '3');
INSERT INTO `tr_area` VALUES ('45055', '海外', '35', '0', '2');
INSERT INTO `tr_area` VALUES ('1126', '井陉县', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1127', '井陉矿区', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1128', '元氏县', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1129', '平山县', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1130', '新乐市', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1131', '新华区', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1132', '无极县', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1133', '晋州市', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1134', '栾城县', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1135', '桥东区', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1136', '桥西区', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1137', '正定县', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1138', '深泽县', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1139', '灵寿县', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1140', '藁城市', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1141', '行唐县', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1142', '裕华区', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1143', '赞皇县', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1144', '赵县', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1145', '辛集市', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1146', '长安区', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1147', '高邑县', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1148', '鹿泉市', '73', '0', '3');
INSERT INTO `tr_area` VALUES ('1149', '丰南区', '74', '0', '3');
INSERT INTO `tr_area` VALUES ('1150', '丰润区', '74', '0', '3');
INSERT INTO `tr_area` VALUES ('1151', '乐亭县', '74', '0', '3');
INSERT INTO `tr_area` VALUES ('1152', '古冶区', '74', '0', '3');
INSERT INTO `tr_area` VALUES ('1153', '唐海县', '74', '0', '3');
INSERT INTO `tr_area` VALUES ('1154', '开平区', '74', '0', '3');
INSERT INTO `tr_area` VALUES ('1155', '滦南县', '74', '0', '3');
INSERT INTO `tr_area` VALUES ('1156', '滦县', '74', '0', '3');
INSERT INTO `tr_area` VALUES ('1157', '玉田县', '74', '0', '3');
INSERT INTO `tr_area` VALUES ('1158', '路北区', '74', '0', '3');
INSERT INTO `tr_area` VALUES ('1159', '路南区', '74', '0', '3');
INSERT INTO `tr_area` VALUES ('1160', '迁安市', '74', '0', '3');
INSERT INTO `tr_area` VALUES ('1161', '迁西县', '74', '0', '3');
INSERT INTO `tr_area` VALUES ('1162', '遵化市', '74', '0', '3');
INSERT INTO `tr_area` VALUES ('1163', '北戴河区', '75', '0', '3');
INSERT INTO `tr_area` VALUES ('1164', '卢龙县', '75', '0', '3');
INSERT INTO `tr_area` VALUES ('1165', '山海关区', '75', '0', '3');
INSERT INTO `tr_area` VALUES ('1166', '抚宁县', '75', '0', '3');
INSERT INTO `tr_area` VALUES ('1167', '昌黎县', '75', '0', '3');
INSERT INTO `tr_area` VALUES ('1168', '海港区', '75', '0', '3');
INSERT INTO `tr_area` VALUES ('1169', '青龙满族自治县', '75', '0', '3');
INSERT INTO `tr_area` VALUES ('1170', '丛台区', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1171', '临漳县', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1172', '复兴区', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1173', '大名县', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1174', '峰峰矿区', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1175', '广平县', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1176', '成安县', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1177', '曲周县', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1178', '武安市', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1179', '永年县', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1180', '涉县', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1181', '磁县', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1182', '肥乡县', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1183', '邯山区', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1184', '邯郸县', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1185', '邱县', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1186', '馆陶县', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1187', '魏县', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1188', '鸡泽县', '76', '0', '3');
INSERT INTO `tr_area` VALUES ('1189', '临城县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1190', '临西县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1191', '任县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1192', '内丘县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1193', '南和县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1194', '南宫市', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1195', '威县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1196', '宁晋县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1197', '巨鹿县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1198', '平乡县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1199', '广宗县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1200', '新河县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1201', '柏乡县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1202', '桥东区', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1203', '桥西区', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1204', '沙河市', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1205', '清河县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1206', '邢台县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1207', '隆尧县', '77', '0', '3');
INSERT INTO `tr_area` VALUES ('1208', '北市区', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1209', '南市区', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1210', '博野县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1211', '唐县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1212', '安国市', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1213', '安新县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1214', '定兴县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1215', '定州市', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1216', '容城县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1217', '徐水县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1218', '新市区', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1219', '易县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1220', '曲阳县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1221', '望都县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1222', '涞水县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1223', '涞源县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1224', '涿州市', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1225', '清苑县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1226', '满城县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1227', '蠡县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1228', '阜平县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1229', '雄县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1230', '顺平县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1231', '高碑店市', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1232', '高阳县', '78', '0', '3');
INSERT INTO `tr_area` VALUES ('1233', '万全县', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1234', '下花园区', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1235', '宣化区', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1236', '宣化县', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1237', '尚义县', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1238', '崇礼县', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1239', '康保县', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1240', '张北县', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1241', '怀安县', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1242', '怀来县', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1243', '桥东区', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1244', '桥西区', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1245', '沽源县', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1246', '涿鹿县', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1247', '蔚县', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1248', '赤城县', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1249', '阳原县', '79', '0', '3');
INSERT INTO `tr_area` VALUES ('1250', '丰宁满族自治县', '80', '0', '3');
INSERT INTO `tr_area` VALUES ('1251', '兴隆县', '80', '0', '3');
INSERT INTO `tr_area` VALUES ('1252', '双桥区', '80', '0', '3');
INSERT INTO `tr_area` VALUES ('1253', '双滦区', '80', '0', '3');
INSERT INTO `tr_area` VALUES ('1254', '围场满族蒙古族自治县', '80', '0', '3');
INSERT INTO `tr_area` VALUES ('1255', '宽城满族自治县', '80', '0', '3');
INSERT INTO `tr_area` VALUES ('1256', '平泉县', '80', '0', '3');
INSERT INTO `tr_area` VALUES ('1257', '承德县', '80', '0', '3');
INSERT INTO `tr_area` VALUES ('1258', '滦平县', '80', '0', '3');
INSERT INTO `tr_area` VALUES ('1259', '隆化县', '80', '0', '3');
INSERT INTO `tr_area` VALUES ('1260', '鹰手营子矿区', '80', '0', '3');
INSERT INTO `tr_area` VALUES ('1261', '冀州市', '81', '0', '3');
INSERT INTO `tr_area` VALUES ('1262', '安平县', '81', '0', '3');
INSERT INTO `tr_area` VALUES ('1263', '故城县', '81', '0', '3');
INSERT INTO `tr_area` VALUES ('1264', '景县', '81', '0', '3');
INSERT INTO `tr_area` VALUES ('1265', '枣强县', '81', '0', '3');
INSERT INTO `tr_area` VALUES ('1266', '桃城区', '81', '0', '3');
INSERT INTO `tr_area` VALUES ('1267', '武强县', '81', '0', '3');
INSERT INTO `tr_area` VALUES ('1268', '武邑县', '81', '0', '3');
INSERT INTO `tr_area` VALUES ('1269', '深州市', '81', '0', '3');
INSERT INTO `tr_area` VALUES ('1270', '阜城县', '81', '0', '3');
INSERT INTO `tr_area` VALUES ('1271', '饶阳县', '81', '0', '3');
INSERT INTO `tr_area` VALUES ('1272', '三河市', '82', '0', '3');
INSERT INTO `tr_area` VALUES ('1273', '固安县', '82', '0', '3');
INSERT INTO `tr_area` VALUES ('1274', '大厂回族自治县', '82', '0', '3');
INSERT INTO `tr_area` VALUES ('1275', '大城县', '82', '0', '3');
INSERT INTO `tr_area` VALUES ('1276', '安次区', '82', '0', '3');
INSERT INTO `tr_area` VALUES ('1277', '广阳区', '82', '0', '3');
INSERT INTO `tr_area` VALUES ('1278', '文安县', '82', '0', '3');
INSERT INTO `tr_area` VALUES ('1279', '永清县', '82', '0', '3');
INSERT INTO `tr_area` VALUES ('1280', '霸州市', '82', '0', '3');
INSERT INTO `tr_area` VALUES ('1281', '香河县', '82', '0', '3');
INSERT INTO `tr_area` VALUES ('1282', '东光县', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1283', '任丘市', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1284', '南皮县', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1285', '吴桥县', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1286', '孟村回族自治县', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1287', '新华区', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1288', '沧县', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1289', '河间市', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1290', '泊头市', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1291', '海兴县', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1292', '献县', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1293', '盐山县', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1294', '肃宁县', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1295', '运河区', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1296', '青县', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1297', '黄骅市', '83', '0', '3');
INSERT INTO `tr_area` VALUES ('1298', '万柏林区', '84', '0', '3');
INSERT INTO `tr_area` VALUES ('1299', '古交市', '84', '0', '3');
INSERT INTO `tr_area` VALUES ('1300', '娄烦县', '84', '0', '3');
INSERT INTO `tr_area` VALUES ('1301', '小店区', '84', '0', '3');
INSERT INTO `tr_area` VALUES ('1302', '尖草坪区', '84', '0', '3');
INSERT INTO `tr_area` VALUES ('1303', '晋源区', '84', '0', '3');
INSERT INTO `tr_area` VALUES ('1304', '杏花岭区', '84', '0', '3');
INSERT INTO `tr_area` VALUES ('1305', '清徐县', '84', '0', '3');
INSERT INTO `tr_area` VALUES ('1306', '迎泽区', '84', '0', '3');
INSERT INTO `tr_area` VALUES ('1307', '阳曲县', '84', '0', '3');
INSERT INTO `tr_area` VALUES ('1308', '南郊区', '85', '0', '3');
INSERT INTO `tr_area` VALUES ('1309', '城区', '85', '0', '3');
INSERT INTO `tr_area` VALUES ('1310', '大同县', '85', '0', '3');
INSERT INTO `tr_area` VALUES ('1311', '天镇县', '85', '0', '3');
INSERT INTO `tr_area` VALUES ('1312', '左云县', '85', '0', '3');
INSERT INTO `tr_area` VALUES ('1313', '广灵县', '85', '0', '3');
INSERT INTO `tr_area` VALUES ('1314', '新荣区', '85', '0', '3');
INSERT INTO `tr_area` VALUES ('1315', '浑源县', '85', '0', '3');
INSERT INTO `tr_area` VALUES ('1316', '灵丘县', '85', '0', '3');
INSERT INTO `tr_area` VALUES ('1317', '矿区', '85', '0', '3');
INSERT INTO `tr_area` VALUES ('1318', '阳高县', '85', '0', '3');
INSERT INTO `tr_area` VALUES ('1319', '城区', '86', '0', '3');
INSERT INTO `tr_area` VALUES ('1320', '平定县', '86', '0', '3');
INSERT INTO `tr_area` VALUES ('1321', '盂县', '86', '0', '3');
INSERT INTO `tr_area` VALUES ('1322', '矿区', '86', '0', '3');
INSERT INTO `tr_area` VALUES ('1323', '郊区', '86', '0', '3');
INSERT INTO `tr_area` VALUES ('1324', '城区', '87', '0', '3');
INSERT INTO `tr_area` VALUES ('1325', '壶关县', '87', '0', '3');
INSERT INTO `tr_area` VALUES ('1326', '屯留县', '87', '0', '3');
INSERT INTO `tr_area` VALUES ('1327', '平顺县', '87', '0', '3');
INSERT INTO `tr_area` VALUES ('1328', '武乡县', '87', '0', '3');
INSERT INTO `tr_area` VALUES ('1329', '沁县', '87', '0', '3');
INSERT INTO `tr_area` VALUES ('1330', '沁源县', '87', '0', '3');
INSERT INTO `tr_area` VALUES ('1331', '潞城市', '87', '0', '3');
INSERT INTO `tr_area` VALUES ('1332', '襄垣县', '87', '0', '3');
INSERT INTO `tr_area` VALUES ('1333', '郊区', '87', '0', '3');
INSERT INTO `tr_area` VALUES ('1334', '长子县', '87', '0', '3');
INSERT INTO `tr_area` VALUES ('1335', '长治县', '87', '0', '3');
INSERT INTO `tr_area` VALUES ('1336', '黎城县', '87', '0', '3');
INSERT INTO `tr_area` VALUES ('1337', '城区', '88', '0', '3');
INSERT INTO `tr_area` VALUES ('1338', '沁水县', '88', '0', '3');
INSERT INTO `tr_area` VALUES ('1339', '泽州县', '88', '0', '3');
INSERT INTO `tr_area` VALUES ('1340', '阳城县', '88', '0', '3');
INSERT INTO `tr_area` VALUES ('1341', '陵川县', '88', '0', '3');
INSERT INTO `tr_area` VALUES ('1342', '高平市', '88', '0', '3');
INSERT INTO `tr_area` VALUES ('1343', '右玉县', '89', '0', '3');
INSERT INTO `tr_area` VALUES ('1344', '山阴县', '89', '0', '3');
INSERT INTO `tr_area` VALUES ('1345', '平鲁区', '89', '0', '3');
INSERT INTO `tr_area` VALUES ('1346', '应县', '89', '0', '3');
INSERT INTO `tr_area` VALUES ('1347', '怀仁县', '89', '0', '3');
INSERT INTO `tr_area` VALUES ('1348', '朔城区', '89', '0', '3');
INSERT INTO `tr_area` VALUES ('1349', '介休市', '90', '0', '3');
INSERT INTO `tr_area` VALUES ('1350', '和顺县', '90', '0', '3');
INSERT INTO `tr_area` VALUES ('1351', '太谷县', '90', '0', '3');
INSERT INTO `tr_area` VALUES ('1352', '寿阳县', '90', '0', '3');
INSERT INTO `tr_area` VALUES ('1353', '左权县', '90', '0', '3');
INSERT INTO `tr_area` VALUES ('1354', '平遥县', '90', '0', '3');
INSERT INTO `tr_area` VALUES ('1355', '昔阳县', '90', '0', '3');
INSERT INTO `tr_area` VALUES ('1356', '榆次区', '90', '0', '3');
INSERT INTO `tr_area` VALUES ('1357', '榆社县', '90', '0', '3');
INSERT INTO `tr_area` VALUES ('1358', '灵石县', '90', '0', '3');
INSERT INTO `tr_area` VALUES ('1359', '祁县', '90', '0', '3');
INSERT INTO `tr_area` VALUES ('1360', '万荣县', '91', '0', '3');
INSERT INTO `tr_area` VALUES ('1361', '临猗县', '91', '0', '3');
INSERT INTO `tr_area` VALUES ('1362', '垣曲县', '91', '0', '3');
INSERT INTO `tr_area` VALUES ('1363', '夏县', '91', '0', '3');
INSERT INTO `tr_area` VALUES ('1364', '平陆县', '91', '0', '3');
INSERT INTO `tr_area` VALUES ('1365', '新绛县', '91', '0', '3');
INSERT INTO `tr_area` VALUES ('1366', '永济市', '91', '0', '3');
INSERT INTO `tr_area` VALUES ('1367', '河津市', '91', '0', '3');
INSERT INTO `tr_area` VALUES ('1368', '盐湖区', '91', '0', '3');
INSERT INTO `tr_area` VALUES ('1369', '稷山县', '91', '0', '3');
INSERT INTO `tr_area` VALUES ('1370', '绛县', '91', '0', '3');
INSERT INTO `tr_area` VALUES ('1371', '芮城县', '91', '0', '3');
INSERT INTO `tr_area` VALUES ('1372', '闻喜县', '91', '0', '3');
INSERT INTO `tr_area` VALUES ('1373', '五台县', '92', '0', '3');
INSERT INTO `tr_area` VALUES ('1374', '五寨县', '92', '0', '3');
INSERT INTO `tr_area` VALUES ('1375', '代县', '92', '0', '3');
INSERT INTO `tr_area` VALUES ('1376', '保德县', '92', '0', '3');
INSERT INTO `tr_area` VALUES ('1377', '偏关县', '92', '0', '3');
INSERT INTO `tr_area` VALUES ('1378', '原平市', '92', '0', '3');
INSERT INTO `tr_area` VALUES ('1379', '宁武县', '92', '0', '3');
INSERT INTO `tr_area` VALUES ('1380', '定襄县', '92', '0', '3');
INSERT INTO `tr_area` VALUES ('1381', '岢岚县', '92', '0', '3');
INSERT INTO `tr_area` VALUES ('1382', '忻府区', '92', '0', '3');
INSERT INTO `tr_area` VALUES ('1383', '河曲县', '92', '0', '3');
INSERT INTO `tr_area` VALUES ('1384', '神池县', '92', '0', '3');
INSERT INTO `tr_area` VALUES ('1385', '繁峙县', '92', '0', '3');
INSERT INTO `tr_area` VALUES ('1386', '静乐县', '92', '0', '3');
INSERT INTO `tr_area` VALUES ('1387', '乡宁县', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1388', '侯马市', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1389', '古县', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1390', '吉县', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1391', '大宁县', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1392', '安泽县', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1393', '尧都区', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1394', '曲沃县', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1395', '永和县', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1396', '汾西县', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1397', '洪洞县', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1398', '浮山县', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1399', '翼城县', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1400', '蒲县', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1401', '襄汾县', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1402', '隰县', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1403', '霍州市', '93', '0', '3');
INSERT INTO `tr_area` VALUES ('1404', '中阳县', '94', '0', '3');
INSERT INTO `tr_area` VALUES ('1405', '临县', '94', '0', '3');
INSERT INTO `tr_area` VALUES ('1406', '交口县', '94', '0', '3');
INSERT INTO `tr_area` VALUES ('1407', '交城县', '94', '0', '3');
INSERT INTO `tr_area` VALUES ('1408', '兴县', '94', '0', '3');
INSERT INTO `tr_area` VALUES ('1409', '孝义市', '94', '0', '3');
INSERT INTO `tr_area` VALUES ('1410', '岚县', '94', '0', '3');
INSERT INTO `tr_area` VALUES ('1411', '文水县', '94', '0', '3');
INSERT INTO `tr_area` VALUES ('1412', '方山县', '94', '0', '3');
INSERT INTO `tr_area` VALUES ('1413', '柳林县', '94', '0', '3');
INSERT INTO `tr_area` VALUES ('1414', '汾阳市', '94', '0', '3');
INSERT INTO `tr_area` VALUES ('1415', '石楼县', '94', '0', '3');
INSERT INTO `tr_area` VALUES ('1416', '离石区', '94', '0', '3');
INSERT INTO `tr_area` VALUES ('1417', '和林格尔县', '95', '0', '3');
INSERT INTO `tr_area` VALUES ('1418', '回民区', '95', '0', '3');
INSERT INTO `tr_area` VALUES ('1419', '土默特左旗', '95', '0', '3');
INSERT INTO `tr_area` VALUES ('1420', '托克托县', '95', '0', '3');
INSERT INTO `tr_area` VALUES ('1421', '新城区', '95', '0', '3');
INSERT INTO `tr_area` VALUES ('1422', '武川县', '95', '0', '3');
INSERT INTO `tr_area` VALUES ('1423', '清水河县', '95', '0', '3');
INSERT INTO `tr_area` VALUES ('1424', '玉泉区', '95', '0', '3');
INSERT INTO `tr_area` VALUES ('1425', '赛罕区', '95', '0', '3');
INSERT INTO `tr_area` VALUES ('1426', '东河区', '96', '0', '3');
INSERT INTO `tr_area` VALUES ('1427', '九原区', '96', '0', '3');
INSERT INTO `tr_area` VALUES ('1428', '固阳县', '96', '0', '3');
INSERT INTO `tr_area` VALUES ('1429', '土默特右旗', '96', '0', '3');
INSERT INTO `tr_area` VALUES ('1430', '昆都仑区', '96', '0', '3');
INSERT INTO `tr_area` VALUES ('1431', '白云矿区', '96', '0', '3');
INSERT INTO `tr_area` VALUES ('1432', '石拐区', '96', '0', '3');
INSERT INTO `tr_area` VALUES ('1433', '达尔罕茂明安联合旗', '96', '0', '3');
INSERT INTO `tr_area` VALUES ('1434', '青山区', '96', '0', '3');
INSERT INTO `tr_area` VALUES ('1435', '乌达区', '97', '0', '3');
INSERT INTO `tr_area` VALUES ('1436', '海勃湾区', '97', '0', '3');
INSERT INTO `tr_area` VALUES ('1437', '海南区', '97', '0', '3');
INSERT INTO `tr_area` VALUES ('1438', '元宝山区', '98', '0', '3');
INSERT INTO `tr_area` VALUES ('1439', '克什克腾旗', '98', '0', '3');
INSERT INTO `tr_area` VALUES ('1440', '喀喇沁旗', '98', '0', '3');
INSERT INTO `tr_area` VALUES ('1441', '宁城县', '98', '0', '3');
INSERT INTO `tr_area` VALUES ('1442', '巴林右旗', '98', '0', '3');
INSERT INTO `tr_area` VALUES ('1443', '巴林左旗', '98', '0', '3');
INSERT INTO `tr_area` VALUES ('1444', '敖汉旗', '98', '0', '3');
INSERT INTO `tr_area` VALUES ('1445', '松山区', '98', '0', '3');
INSERT INTO `tr_area` VALUES ('1446', '林西县', '98', '0', '3');
INSERT INTO `tr_area` VALUES ('1447', '红山区', '98', '0', '3');
INSERT INTO `tr_area` VALUES ('1448', '翁牛特旗', '98', '0', '3');
INSERT INTO `tr_area` VALUES ('1449', '阿鲁科尔沁旗', '98', '0', '3');
INSERT INTO `tr_area` VALUES ('1450', '奈曼旗', '99', '0', '3');
INSERT INTO `tr_area` VALUES ('1451', '库伦旗', '99', '0', '3');
INSERT INTO `tr_area` VALUES ('1452', '开鲁县', '99', '0', '3');
INSERT INTO `tr_area` VALUES ('1453', '扎鲁特旗', '99', '0', '3');
INSERT INTO `tr_area` VALUES ('1454', '科尔沁区', '99', '0', '3');
INSERT INTO `tr_area` VALUES ('1455', '科尔沁左翼中旗', '99', '0', '3');
INSERT INTO `tr_area` VALUES ('1456', '科尔沁左翼后旗', '99', '0', '3');
INSERT INTO `tr_area` VALUES ('1457', '霍林郭勒市', '99', '0', '3');
INSERT INTO `tr_area` VALUES ('1458', '东胜区', '100', '0', '3');
INSERT INTO `tr_area` VALUES ('1459', '乌审旗', '100', '0', '3');
INSERT INTO `tr_area` VALUES ('1460', '伊金霍洛旗', '100', '0', '3');
INSERT INTO `tr_area` VALUES ('1461', '准格尔旗', '100', '0', '3');
INSERT INTO `tr_area` VALUES ('1462', '杭锦旗', '100', '0', '3');
INSERT INTO `tr_area` VALUES ('1463', '达拉特旗', '100', '0', '3');
INSERT INTO `tr_area` VALUES ('1464', '鄂东胜区', '100', '0', '3');
INSERT INTO `tr_area` VALUES ('1465', '鄂托克前旗', '100', '0', '3');
INSERT INTO `tr_area` VALUES ('1466', '鄂托克旗', '100', '0', '3');
INSERT INTO `tr_area` VALUES ('1467', '扎兰屯市', '101', '0', '3');
INSERT INTO `tr_area` VALUES ('1468', '新巴尔虎右旗', '101', '0', '3');
INSERT INTO `tr_area` VALUES ('1469', '新巴尔虎左旗', '101', '0', '3');
INSERT INTO `tr_area` VALUES ('1470', '根河市', '101', '0', '3');
INSERT INTO `tr_area` VALUES ('1471', '海拉尔区', '101', '0', '3');
INSERT INTO `tr_area` VALUES ('1472', '满洲里市', '101', '0', '3');
INSERT INTO `tr_area` VALUES ('1473', '牙克石市', '101', '0', '3');
INSERT INTO `tr_area` VALUES ('1474', '莫力达瓦达斡尔族自治旗', '101', '0', '3');
INSERT INTO `tr_area` VALUES ('1475', '鄂伦春自治旗', '101', '0', '3');
INSERT INTO `tr_area` VALUES ('1476', '鄂温克族自治旗', '101', '0', '3');
INSERT INTO `tr_area` VALUES ('1477', '阿荣旗', '101', '0', '3');
INSERT INTO `tr_area` VALUES ('1478', '陈巴尔虎旗', '101', '0', '3');
INSERT INTO `tr_area` VALUES ('1479', '额尔古纳市', '101', '0', '3');
INSERT INTO `tr_area` VALUES ('1480', '临河区', '102', '0', '3');
INSERT INTO `tr_area` VALUES ('1481', '乌拉特中旗', '102', '0', '3');
INSERT INTO `tr_area` VALUES ('1482', '乌拉特前旗', '102', '0', '3');
INSERT INTO `tr_area` VALUES ('1483', '乌拉特后旗', '102', '0', '3');
INSERT INTO `tr_area` VALUES ('1484', '五原县', '102', '0', '3');
INSERT INTO `tr_area` VALUES ('1485', '杭锦后旗', '102', '0', '3');
INSERT INTO `tr_area` VALUES ('1486', '磴口县', '102', '0', '3');
INSERT INTO `tr_area` VALUES ('1487', '丰镇市', '103', '0', '3');
INSERT INTO `tr_area` VALUES ('1488', '兴和县', '103', '0', '3');
INSERT INTO `tr_area` VALUES ('1489', '凉城县', '103', '0', '3');
INSERT INTO `tr_area` VALUES ('1490', '化德县', '103', '0', '3');
INSERT INTO `tr_area` VALUES ('1491', '卓资县', '103', '0', '3');
INSERT INTO `tr_area` VALUES ('1492', '商都县', '103', '0', '3');
INSERT INTO `tr_area` VALUES ('1493', '四子王旗', '103', '0', '3');
INSERT INTO `tr_area` VALUES ('1494', '察哈尔右翼中旗', '103', '0', '3');
INSERT INTO `tr_area` VALUES ('1495', '察哈尔右翼前旗', '103', '0', '3');
INSERT INTO `tr_area` VALUES ('1496', '察哈尔右翼后旗', '103', '0', '3');
INSERT INTO `tr_area` VALUES ('1497', '集宁区', '103', '0', '3');
INSERT INTO `tr_area` VALUES ('1498', '乌兰浩特市', '104', '0', '3');
INSERT INTO `tr_area` VALUES ('1499', '扎赉特旗', '104', '0', '3');
INSERT INTO `tr_area` VALUES ('1500', '科尔沁右翼中旗', '104', '0', '3');
INSERT INTO `tr_area` VALUES ('1501', '科尔沁右翼前旗', '104', '0', '3');
INSERT INTO `tr_area` VALUES ('1502', '突泉县', '104', '0', '3');
INSERT INTO `tr_area` VALUES ('1503', '阿尔山市', '104', '0', '3');
INSERT INTO `tr_area` VALUES ('1504', '东乌珠穆沁旗', '105', '0', '3');
INSERT INTO `tr_area` VALUES ('1505', '二连浩特市', '105', '0', '3');
INSERT INTO `tr_area` VALUES ('1506', '多伦县', '105', '0', '3');
INSERT INTO `tr_area` VALUES ('1507', '太仆寺旗', '105', '0', '3');
INSERT INTO `tr_area` VALUES ('1508', '正蓝旗', '105', '0', '3');
INSERT INTO `tr_area` VALUES ('1509', '正镶白旗', '105', '0', '3');
INSERT INTO `tr_area` VALUES ('1510', '苏尼特右旗', '105', '0', '3');
INSERT INTO `tr_area` VALUES ('1511', '苏尼特左旗', '105', '0', '3');
INSERT INTO `tr_area` VALUES ('1512', '西乌珠穆沁旗', '105', '0', '3');
INSERT INTO `tr_area` VALUES ('1513', '锡林浩特市', '105', '0', '3');
INSERT INTO `tr_area` VALUES ('1514', '镶黄旗', '105', '0', '3');
INSERT INTO `tr_area` VALUES ('1515', '阿巴嘎旗', '105', '0', '3');
INSERT INTO `tr_area` VALUES ('1516', '阿拉善右旗', '106', '0', '3');
INSERT INTO `tr_area` VALUES ('1517', '阿拉善左旗', '106', '0', '3');
INSERT INTO `tr_area` VALUES ('1518', '额济纳旗', '106', '0', '3');
INSERT INTO `tr_area` VALUES ('1519', '东陵区', '107', '0', '3');
INSERT INTO `tr_area` VALUES ('1520', '于洪区', '107', '0', '3');
INSERT INTO `tr_area` VALUES ('1521', '和平区', '107', '0', '3');
INSERT INTO `tr_area` VALUES ('1522', '大东区', '107', '0', '3');
INSERT INTO `tr_area` VALUES ('1523', '康平县', '107', '0', '3');
INSERT INTO `tr_area` VALUES ('1524', '新民市', '107', '0', '3');
INSERT INTO `tr_area` VALUES ('1525', '沈北新区', '107', '0', '3');
INSERT INTO `tr_area` VALUES ('1526', '沈河区', '107', '0', '3');
INSERT INTO `tr_area` VALUES ('1527', '法库县', '107', '0', '3');
INSERT INTO `tr_area` VALUES ('1528', '皇姑区', '107', '0', '3');
INSERT INTO `tr_area` VALUES ('1529', '苏家屯区', '107', '0', '3');
INSERT INTO `tr_area` VALUES ('1530', '辽中县', '107', '0', '3');
INSERT INTO `tr_area` VALUES ('1531', '铁西区', '107', '0', '3');
INSERT INTO `tr_area` VALUES ('1532', '中山区', '108', '0', '3');
INSERT INTO `tr_area` VALUES ('1533', '庄河市', '108', '0', '3');
INSERT INTO `tr_area` VALUES ('1534', '旅顺口区', '108', '0', '3');
INSERT INTO `tr_area` VALUES ('1535', '普兰店市', '108', '0', '3');
INSERT INTO `tr_area` VALUES ('1536', '沙河口区', '108', '0', '3');
INSERT INTO `tr_area` VALUES ('1537', '瓦房店市', '108', '0', '3');
INSERT INTO `tr_area` VALUES ('1538', '甘井子区', '108', '0', '3');
INSERT INTO `tr_area` VALUES ('1539', '西岗区', '108', '0', '3');
INSERT INTO `tr_area` VALUES ('1540', '金州区', '108', '0', '3');
INSERT INTO `tr_area` VALUES ('1541', '长海县', '108', '0', '3');
INSERT INTO `tr_area` VALUES ('1542', '千山区', '109', '0', '3');
INSERT INTO `tr_area` VALUES ('1543', '台安县', '109', '0', '3');
INSERT INTO `tr_area` VALUES ('1544', '岫岩满族自治县', '109', '0', '3');
INSERT INTO `tr_area` VALUES ('1545', '海城市', '109', '0', '3');
INSERT INTO `tr_area` VALUES ('1546', '立山区', '109', '0', '3');
INSERT INTO `tr_area` VALUES ('1547', '铁东区', '109', '0', '3');
INSERT INTO `tr_area` VALUES ('1548', '铁西区', '109', '0', '3');
INSERT INTO `tr_area` VALUES ('1549', '东洲区', '110', '0', '3');
INSERT INTO `tr_area` VALUES ('1550', '抚顺县', '110', '0', '3');
INSERT INTO `tr_area` VALUES ('1551', '新宾满族自治县', '110', '0', '3');
INSERT INTO `tr_area` VALUES ('1552', '新抚区', '110', '0', '3');
INSERT INTO `tr_area` VALUES ('1553', '望花区', '110', '0', '3');
INSERT INTO `tr_area` VALUES ('1554', '清原满族自治县', '110', '0', '3');
INSERT INTO `tr_area` VALUES ('1555', '顺城区', '110', '0', '3');
INSERT INTO `tr_area` VALUES ('1556', '南芬区', '111', '0', '3');
INSERT INTO `tr_area` VALUES ('1557', '平山区', '111', '0', '3');
INSERT INTO `tr_area` VALUES ('1558', '明山区', '111', '0', '3');
INSERT INTO `tr_area` VALUES ('1559', '本溪满族自治县', '111', '0', '3');
INSERT INTO `tr_area` VALUES ('1560', '桓仁满族自治县', '111', '0', '3');
INSERT INTO `tr_area` VALUES ('1561', '溪湖区', '111', '0', '3');
INSERT INTO `tr_area` VALUES ('1562', '东港市', '112', '0', '3');
INSERT INTO `tr_area` VALUES ('1563', '元宝区', '112', '0', '3');
INSERT INTO `tr_area` VALUES ('1564', '凤城市', '112', '0', '3');
INSERT INTO `tr_area` VALUES ('1565', '宽甸满族自治县', '112', '0', '3');
INSERT INTO `tr_area` VALUES ('1566', '振兴区', '112', '0', '3');
INSERT INTO `tr_area` VALUES ('1567', '振安区', '112', '0', '3');
INSERT INTO `tr_area` VALUES ('1568', '义县', '113', '0', '3');
INSERT INTO `tr_area` VALUES ('1569', '凌河区', '113', '0', '3');
INSERT INTO `tr_area` VALUES ('1570', '凌海市', '113', '0', '3');
INSERT INTO `tr_area` VALUES ('1571', '北镇市', '113', '0', '3');
INSERT INTO `tr_area` VALUES ('1572', '古塔区', '113', '0', '3');
INSERT INTO `tr_area` VALUES ('1573', '太和区', '113', '0', '3');
INSERT INTO `tr_area` VALUES ('1574', '黑山县', '113', '0', '3');
INSERT INTO `tr_area` VALUES ('1575', '大石桥市', '114', '0', '3');
INSERT INTO `tr_area` VALUES ('1576', '盖州市', '114', '0', '3');
INSERT INTO `tr_area` VALUES ('1577', '站前区', '114', '0', '3');
INSERT INTO `tr_area` VALUES ('1578', '老边区', '114', '0', '3');
INSERT INTO `tr_area` VALUES ('1579', '西市区', '114', '0', '3');
INSERT INTO `tr_area` VALUES ('1580', '鲅鱼圈区', '114', '0', '3');
INSERT INTO `tr_area` VALUES ('1581', '太平区', '115', '0', '3');
INSERT INTO `tr_area` VALUES ('1582', '彰武县', '115', '0', '3');
INSERT INTO `tr_area` VALUES ('1583', '新邱区', '115', '0', '3');
INSERT INTO `tr_area` VALUES ('1584', '海州区', '115', '0', '3');
INSERT INTO `tr_area` VALUES ('1585', '清河门区', '115', '0', '3');
INSERT INTO `tr_area` VALUES ('1586', '细河区', '115', '0', '3');
INSERT INTO `tr_area` VALUES ('1587', '蒙古族自治县', '115', '0', '3');
INSERT INTO `tr_area` VALUES ('1588', '太子河区', '116', '0', '3');
INSERT INTO `tr_area` VALUES ('1589', '宏伟区', '116', '0', '3');
INSERT INTO `tr_area` VALUES ('1590', '弓长岭区', '116', '0', '3');
INSERT INTO `tr_area` VALUES ('1591', '文圣区', '116', '0', '3');
INSERT INTO `tr_area` VALUES ('1592', '灯塔市', '116', '0', '3');
INSERT INTO `tr_area` VALUES ('1593', '白塔区', '116', '0', '3');
INSERT INTO `tr_area` VALUES ('1594', '辽阳县', '116', '0', '3');
INSERT INTO `tr_area` VALUES ('1595', '兴隆台区', '117', '0', '3');
INSERT INTO `tr_area` VALUES ('1596', '双台子区', '117', '0', '3');
INSERT INTO `tr_area` VALUES ('1597', '大洼县', '117', '0', '3');
INSERT INTO `tr_area` VALUES ('1598', '盘山县', '117', '0', '3');
INSERT INTO `tr_area` VALUES ('1599', '开原市', '118', '0', '3');
INSERT INTO `tr_area` VALUES ('1600', '昌图县', '118', '0', '3');
INSERT INTO `tr_area` VALUES ('1601', '清河区', '118', '0', '3');
INSERT INTO `tr_area` VALUES ('1602', '西丰县', '118', '0', '3');
INSERT INTO `tr_area` VALUES ('1603', '调兵山市', '118', '0', '3');
INSERT INTO `tr_area` VALUES ('1604', '铁岭县', '118', '0', '3');
INSERT INTO `tr_area` VALUES ('1605', '银州区', '118', '0', '3');
INSERT INTO `tr_area` VALUES ('1606', '凌源市', '119', '0', '3');
INSERT INTO `tr_area` VALUES ('1607', '北票市', '119', '0', '3');
INSERT INTO `tr_area` VALUES ('1608', '双塔区', '119', '0', '3');
INSERT INTO `tr_area` VALUES ('1609', '喀喇沁左翼蒙古族自治县', '119', '0', '3');
INSERT INTO `tr_area` VALUES ('1610', '建平县', '119', '0', '3');
INSERT INTO `tr_area` VALUES ('1611', '朝阳县', '119', '0', '3');
INSERT INTO `tr_area` VALUES ('1612', '龙城区', '119', '0', '3');
INSERT INTO `tr_area` VALUES ('1613', '兴城市', '120', '0', '3');
INSERT INTO `tr_area` VALUES ('1614', '南票区', '120', '0', '3');
INSERT INTO `tr_area` VALUES ('1615', '建昌县', '120', '0', '3');
INSERT INTO `tr_area` VALUES ('1616', '绥中县', '120', '0', '3');
INSERT INTO `tr_area` VALUES ('1617', '连山区', '120', '0', '3');
INSERT INTO `tr_area` VALUES ('1618', '龙港区', '120', '0', '3');
INSERT INTO `tr_area` VALUES ('1619', '九台市', '121', '0', '3');
INSERT INTO `tr_area` VALUES ('1620', '二道区', '121', '0', '3');
INSERT INTO `tr_area` VALUES ('1621', '农安县', '121', '0', '3');
INSERT INTO `tr_area` VALUES ('1622', '南关区', '121', '0', '3');
INSERT INTO `tr_area` VALUES ('1623', '双阳区', '121', '0', '3');
INSERT INTO `tr_area` VALUES ('1624', '宽城区', '121', '0', '3');
INSERT INTO `tr_area` VALUES ('1625', '德惠市', '121', '0', '3');
INSERT INTO `tr_area` VALUES ('1626', '朝阳区', '121', '0', '3');
INSERT INTO `tr_area` VALUES ('1627', '榆树市', '121', '0', '3');
INSERT INTO `tr_area` VALUES ('1628', '绿园区', '121', '0', '3');
INSERT INTO `tr_area` VALUES ('1629', '丰满区', '122', '0', '3');
INSERT INTO `tr_area` VALUES ('1630', '昌邑区', '122', '0', '3');
INSERT INTO `tr_area` VALUES ('1631', '桦甸市', '122', '0', '3');
INSERT INTO `tr_area` VALUES ('1632', '永吉县', '122', '0', '3');
INSERT INTO `tr_area` VALUES ('1633', '磐石市', '122', '0', '3');
INSERT INTO `tr_area` VALUES ('1634', '舒兰市', '122', '0', '3');
INSERT INTO `tr_area` VALUES ('1635', '船营区', '122', '0', '3');
INSERT INTO `tr_area` VALUES ('1636', '蛟河市', '122', '0', '3');
INSERT INTO `tr_area` VALUES ('1637', '龙潭区', '122', '0', '3');
INSERT INTO `tr_area` VALUES ('1638', '伊通满族自治县', '123', '0', '3');
INSERT INTO `tr_area` VALUES ('1639', '公主岭市', '123', '0', '3');
INSERT INTO `tr_area` VALUES ('1640', '双辽市', '123', '0', '3');
INSERT INTO `tr_area` VALUES ('1641', '梨树县', '123', '0', '3');
INSERT INTO `tr_area` VALUES ('1642', '铁东区', '123', '0', '3');
INSERT INTO `tr_area` VALUES ('1643', '铁西区', '123', '0', '3');
INSERT INTO `tr_area` VALUES ('1644', '东丰县', '124', '0', '3');
INSERT INTO `tr_area` VALUES ('1645', '东辽县', '124', '0', '3');
INSERT INTO `tr_area` VALUES ('1646', '西安区', '124', '0', '3');
INSERT INTO `tr_area` VALUES ('1647', '龙山区', '124', '0', '3');
INSERT INTO `tr_area` VALUES ('1648', '东昌区', '125', '0', '3');
INSERT INTO `tr_area` VALUES ('1649', '二道江区', '125', '0', '3');
INSERT INTO `tr_area` VALUES ('1650', '柳河县', '125', '0', '3');
INSERT INTO `tr_area` VALUES ('1651', '梅河口市', '125', '0', '3');
INSERT INTO `tr_area` VALUES ('1652', '辉南县', '125', '0', '3');
INSERT INTO `tr_area` VALUES ('1653', '通化县', '125', '0', '3');
INSERT INTO `tr_area` VALUES ('1654', '集安市', '125', '0', '3');
INSERT INTO `tr_area` VALUES ('1655', '临江市', '126', '0', '3');
INSERT INTO `tr_area` VALUES ('1656', '八道江区', '126', '0', '3');
INSERT INTO `tr_area` VALUES ('1657', '抚松县', '126', '0', '3');
INSERT INTO `tr_area` VALUES ('1658', '江源区', '126', '0', '3');
INSERT INTO `tr_area` VALUES ('1659', '长白朝鲜族自治县', '126', '0', '3');
INSERT INTO `tr_area` VALUES ('1660', '靖宇县', '126', '0', '3');
INSERT INTO `tr_area` VALUES ('1661', '干安县', '127', '0', '3');
INSERT INTO `tr_area` VALUES ('1662', '前郭尔罗斯蒙古族自治县', '127', '0', '3');
INSERT INTO `tr_area` VALUES ('1663', '宁江区', '127', '0', '3');
INSERT INTO `tr_area` VALUES ('1664', '扶余县', '127', '0', '3');
INSERT INTO `tr_area` VALUES ('1665', '长岭县', '127', '0', '3');
INSERT INTO `tr_area` VALUES ('1666', '大安市', '128', '0', '3');
INSERT INTO `tr_area` VALUES ('1667', '洮北区', '128', '0', '3');
INSERT INTO `tr_area` VALUES ('1668', '洮南市', '128', '0', '3');
INSERT INTO `tr_area` VALUES ('1669', '通榆县', '128', '0', '3');
INSERT INTO `tr_area` VALUES ('1670', '镇赉县', '128', '0', '3');
INSERT INTO `tr_area` VALUES ('1671', '和龙市', '129', '0', '3');
INSERT INTO `tr_area` VALUES ('1672', '图们市', '129', '0', '3');
INSERT INTO `tr_area` VALUES ('1673', '安图县', '129', '0', '3');
INSERT INTO `tr_area` VALUES ('1674', '延吉市', '129', '0', '3');
INSERT INTO `tr_area` VALUES ('1675', '敦化市', '129', '0', '3');
INSERT INTO `tr_area` VALUES ('1676', '汪清县', '129', '0', '3');
INSERT INTO `tr_area` VALUES ('1677', '珲春市', '129', '0', '3');
INSERT INTO `tr_area` VALUES ('1678', '龙井市', '129', '0', '3');
INSERT INTO `tr_area` VALUES ('1679', '五常市', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1680', '依兰县', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1681', '南岗区', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1682', '双城市', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1683', '呼兰区', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1684', '哈尔滨市道里区', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1685', '宾县', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1686', '尚志市', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1687', '巴彦县', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1688', '平房区', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1689', '延寿县', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1690', '方正县', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1691', '木兰县', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1692', '松北区', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1693', '通河县', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1694', '道外区', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1695', '阿城区', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1696', '香坊区', '130', '0', '3');
INSERT INTO `tr_area` VALUES ('1697', '依安县', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1698', '克东县', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1699', '克山县', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1700', '富拉尔基区', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1701', '富裕县', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1702', '建华区', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1703', '拜泉县', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1704', '昂昂溪区', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1705', '梅里斯达斡尔族区', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1706', '泰来县', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1707', '甘南县', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1708', '碾子山区', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1709', '讷河市', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1710', '铁锋区', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1711', '龙江县', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1712', '龙沙区', '131', '0', '3');
INSERT INTO `tr_area` VALUES ('1713', '城子河区', '132', '0', '3');
INSERT INTO `tr_area` VALUES ('1714', '密山市', '132', '0', '3');
INSERT INTO `tr_area` VALUES ('1715', '恒山区', '132', '0', '3');
INSERT INTO `tr_area` VALUES ('1716', '梨树区', '132', '0', '3');
INSERT INTO `tr_area` VALUES ('1717', '滴道区', '132', '0', '3');
INSERT INTO `tr_area` VALUES ('1718', '虎林市', '132', '0', '3');
INSERT INTO `tr_area` VALUES ('1719', '鸡东县', '132', '0', '3');
INSERT INTO `tr_area` VALUES ('1720', '鸡冠区', '132', '0', '3');
INSERT INTO `tr_area` VALUES ('1721', '麻山区', '132', '0', '3');
INSERT INTO `tr_area` VALUES ('1722', '东山区', '133', '0', '3');
INSERT INTO `tr_area` VALUES ('1723', '兴安区', '133', '0', '3');
INSERT INTO `tr_area` VALUES ('1724', '兴山区', '133', '0', '3');
INSERT INTO `tr_area` VALUES ('1725', '南山区', '133', '0', '3');
INSERT INTO `tr_area` VALUES ('1726', '向阳区', '133', '0', '3');
INSERT INTO `tr_area` VALUES ('1727', '工农区', '133', '0', '3');
INSERT INTO `tr_area` VALUES ('1728', '绥滨县', '133', '0', '3');
INSERT INTO `tr_area` VALUES ('1729', '萝北县', '133', '0', '3');
INSERT INTO `tr_area` VALUES ('1730', '友谊县', '134', '0', '3');
INSERT INTO `tr_area` VALUES ('1731', '四方台区', '134', '0', '3');
INSERT INTO `tr_area` VALUES ('1732', '宝山区', '134', '0', '3');
INSERT INTO `tr_area` VALUES ('1733', '宝清县', '134', '0', '3');
INSERT INTO `tr_area` VALUES ('1734', '尖山区', '134', '0', '3');
INSERT INTO `tr_area` VALUES ('1735', '岭东区', '134', '0', '3');
INSERT INTO `tr_area` VALUES ('1736', '集贤县', '134', '0', '3');
INSERT INTO `tr_area` VALUES ('1737', '饶河县', '134', '0', '3');
INSERT INTO `tr_area` VALUES ('1738', '大同区', '135', '0', '3');
INSERT INTO `tr_area` VALUES ('1739', '杜尔伯特蒙古族自治县', '135', '0', '3');
INSERT INTO `tr_area` VALUES ('1740', '林甸县', '135', '0', '3');
INSERT INTO `tr_area` VALUES ('1741', '红岗区', '135', '0', '3');
INSERT INTO `tr_area` VALUES ('1742', '肇州县', '135', '0', '3');
INSERT INTO `tr_area` VALUES ('1743', '肇源县', '135', '0', '3');
INSERT INTO `tr_area` VALUES ('1744', '胡路区', '135', '0', '3');
INSERT INTO `tr_area` VALUES ('1745', '萨尔图区', '135', '0', '3');
INSERT INTO `tr_area` VALUES ('1746', '龙凤区', '135', '0', '3');
INSERT INTO `tr_area` VALUES ('1747', '上甘岭区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1748', '乌伊岭区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1749', '乌马河区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1750', '五营区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1751', '伊春区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1752', '南岔区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1753', '友好区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1754', '嘉荫县', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1755', '带岭区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1756', '新青区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1757', '汤旺河区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1758', '红星区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1759', '美溪区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1760', '翠峦区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1761', '西林区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1762', '金山屯区', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1763', '铁力市', '136', '0', '3');
INSERT INTO `tr_area` VALUES ('1764', '东风区', '137', '0', '3');
INSERT INTO `tr_area` VALUES ('1765', '前进区', '137', '0', '3');
INSERT INTO `tr_area` VALUES ('1766', '同江市', '137', '0', '3');
INSERT INTO `tr_area` VALUES ('1767', '向阳区', '137', '0', '3');
INSERT INTO `tr_area` VALUES ('1768', '富锦市', '137', '0', '3');
INSERT INTO `tr_area` VALUES ('1769', '抚远县', '137', '0', '3');
INSERT INTO `tr_area` VALUES ('1770', '桦南县', '137', '0', '3');
INSERT INTO `tr_area` VALUES ('1771', '桦川县', '137', '0', '3');
INSERT INTO `tr_area` VALUES ('1772', '汤原县', '137', '0', '3');
INSERT INTO `tr_area` VALUES ('1773', '郊区', '137', '0', '3');
INSERT INTO `tr_area` VALUES ('1774', '勃利县', '138', '0', '3');
INSERT INTO `tr_area` VALUES ('1775', '新兴区', '138', '0', '3');
INSERT INTO `tr_area` VALUES ('1776', '桃山区', '138', '0', '3');
INSERT INTO `tr_area` VALUES ('1777', '茄子河区', '138', '0', '3');
INSERT INTO `tr_area` VALUES ('1778', '东宁县', '139', '0', '3');
INSERT INTO `tr_area` VALUES ('1779', '东安区', '139', '0', '3');
INSERT INTO `tr_area` VALUES ('1780', '宁安市', '139', '0', '3');
INSERT INTO `tr_area` VALUES ('1781', '林口县', '139', '0', '3');
INSERT INTO `tr_area` VALUES ('1782', '海林市', '139', '0', '3');
INSERT INTO `tr_area` VALUES ('1783', '爱民区', '139', '0', '3');
INSERT INTO `tr_area` VALUES ('1784', '穆棱市', '139', '0', '3');
INSERT INTO `tr_area` VALUES ('1785', '绥芬河市', '139', '0', '3');
INSERT INTO `tr_area` VALUES ('1786', '西安区', '139', '0', '3');
INSERT INTO `tr_area` VALUES ('1787', '阳明区', '139', '0', '3');
INSERT INTO `tr_area` VALUES ('1788', '五大连池市', '140', '0', '3');
INSERT INTO `tr_area` VALUES ('1789', '北安市', '140', '0', '3');
INSERT INTO `tr_area` VALUES ('1790', '嫩江县', '140', '0', '3');
INSERT INTO `tr_area` VALUES ('1791', '孙吴县', '140', '0', '3');
INSERT INTO `tr_area` VALUES ('1792', '爱辉区', '140', '0', '3');
INSERT INTO `tr_area` VALUES ('1793', '车逊克县', '140', '0', '3');
INSERT INTO `tr_area` VALUES ('1794', '逊克县', '140', '0', '3');
INSERT INTO `tr_area` VALUES ('1795', '兰西县', '141', '0', '3');
INSERT INTO `tr_area` VALUES ('1796', '安达市', '141', '0', '3');
INSERT INTO `tr_area` VALUES ('1797', '庆安县', '141', '0', '3');
INSERT INTO `tr_area` VALUES ('1798', '明水县', '141', '0', '3');
INSERT INTO `tr_area` VALUES ('1799', '望奎县', '141', '0', '3');
INSERT INTO `tr_area` VALUES ('1800', '海伦市', '141', '0', '3');
INSERT INTO `tr_area` VALUES ('1801', '绥化市北林区', '141', '0', '3');
INSERT INTO `tr_area` VALUES ('1802', '绥棱县', '141', '0', '3');
INSERT INTO `tr_area` VALUES ('1803', '肇东市', '141', '0', '3');
INSERT INTO `tr_area` VALUES ('1804', '青冈县', '141', '0', '3');
INSERT INTO `tr_area` VALUES ('1805', '呼玛县', '142', '0', '3');
INSERT INTO `tr_area` VALUES ('1806', '塔河县', '142', '0', '3');
INSERT INTO `tr_area` VALUES ('1807', '大兴安岭地区加格达奇区', '142', '0', '3');
INSERT INTO `tr_area` VALUES ('1808', '大兴安岭地区呼中区', '142', '0', '3');
INSERT INTO `tr_area` VALUES ('1809', '大兴安岭地区新林区', '142', '0', '3');
INSERT INTO `tr_area` VALUES ('1810', '大兴安岭地区松岭区', '142', '0', '3');
INSERT INTO `tr_area` VALUES ('1811', '漠河县', '142', '0', '3');
INSERT INTO `tr_area` VALUES ('2027', '下关区', '162', '0', '3');
INSERT INTO `tr_area` VALUES ('2028', '六合区', '162', '0', '3');
INSERT INTO `tr_area` VALUES ('2029', '建邺区', '162', '0', '3');
INSERT INTO `tr_area` VALUES ('2030', '栖霞区', '162', '0', '3');
INSERT INTO `tr_area` VALUES ('2031', '江宁区', '162', '0', '3');
INSERT INTO `tr_area` VALUES ('2032', '浦口区', '162', '0', '3');
INSERT INTO `tr_area` VALUES ('2033', '溧水县', '162', '0', '3');
INSERT INTO `tr_area` VALUES ('2034', '玄武区', '162', '0', '3');
INSERT INTO `tr_area` VALUES ('2035', '白下区', '162', '0', '3');
INSERT INTO `tr_area` VALUES ('2036', '秦淮区', '162', '0', '3');
INSERT INTO `tr_area` VALUES ('2037', '雨花台区', '162', '0', '3');
INSERT INTO `tr_area` VALUES ('2038', '高淳县', '162', '0', '3');
INSERT INTO `tr_area` VALUES ('2039', '鼓楼区', '162', '0', '3');
INSERT INTO `tr_area` VALUES ('2040', '北塘区', '163', '0', '3');
INSERT INTO `tr_area` VALUES ('2041', '南长区', '163', '0', '3');
INSERT INTO `tr_area` VALUES ('2042', '宜兴市', '163', '0', '3');
INSERT INTO `tr_area` VALUES ('2043', '崇安区', '163', '0', '3');
INSERT INTO `tr_area` VALUES ('2044', '惠山区', '163', '0', '3');
INSERT INTO `tr_area` VALUES ('2045', '江阴市', '163', '0', '3');
INSERT INTO `tr_area` VALUES ('2046', '滨湖区', '163', '0', '3');
INSERT INTO `tr_area` VALUES ('2047', '锡山区', '163', '0', '3');
INSERT INTO `tr_area` VALUES ('2048', '丰县', '164', '0', '3');
INSERT INTO `tr_area` VALUES ('2049', '九里区', '164', '0', '3');
INSERT INTO `tr_area` VALUES ('2050', '云龙区', '164', '0', '3');
INSERT INTO `tr_area` VALUES ('2051', '新沂市', '164', '0', '3');
INSERT INTO `tr_area` VALUES ('2052', '沛县', '164', '0', '3');
INSERT INTO `tr_area` VALUES ('2053', '泉山区', '164', '0', '3');
INSERT INTO `tr_area` VALUES ('2054', '睢宁县', '164', '0', '3');
INSERT INTO `tr_area` VALUES ('2055', '贾汪区', '164', '0', '3');
INSERT INTO `tr_area` VALUES ('2056', '邳州市', '164', '0', '3');
INSERT INTO `tr_area` VALUES ('2057', '铜山县', '164', '0', '3');
INSERT INTO `tr_area` VALUES ('2058', '鼓楼区', '164', '0', '3');
INSERT INTO `tr_area` VALUES ('2059', '天宁区', '165', '0', '3');
INSERT INTO `tr_area` VALUES ('2060', '戚墅堰区', '165', '0', '3');
INSERT INTO `tr_area` VALUES ('2061', '新北区', '165', '0', '3');
INSERT INTO `tr_area` VALUES ('2062', '武进区', '165', '0', '3');
INSERT INTO `tr_area` VALUES ('2063', '溧阳市', '165', '0', '3');
INSERT INTO `tr_area` VALUES ('2064', '金坛市', '165', '0', '3');
INSERT INTO `tr_area` VALUES ('2065', '钟楼区', '165', '0', '3');
INSERT INTO `tr_area` VALUES ('2066', '吴中区', '166', '0', '3');
INSERT INTO `tr_area` VALUES ('2067', '吴江市', '166', '0', '3');
INSERT INTO `tr_area` VALUES ('2068', '太仓市', '166', '0', '3');
INSERT INTO `tr_area` VALUES ('2069', '常熟市', '166', '0', '3');
INSERT INTO `tr_area` VALUES ('2070', '平江区', '166', '0', '3');
INSERT INTO `tr_area` VALUES ('2071', '张家港市', '166', '0', '3');
INSERT INTO `tr_area` VALUES ('2072', '昆山市', '166', '0', '3');
INSERT INTO `tr_area` VALUES ('2073', '沧浪区', '166', '0', '3');
INSERT INTO `tr_area` VALUES ('2074', '相城区', '166', '0', '3');
INSERT INTO `tr_area` VALUES ('2075', '苏州工业园区', '166', '0', '3');
INSERT INTO `tr_area` VALUES ('2076', '虎丘区', '166', '0', '3');
INSERT INTO `tr_area` VALUES ('2077', '金阊区', '166', '0', '3');
INSERT INTO `tr_area` VALUES ('2078', '启东市', '167', '0', '3');
INSERT INTO `tr_area` VALUES ('2079', '如东县', '167', '0', '3');
INSERT INTO `tr_area` VALUES ('2080', '如皋市', '167', '0', '3');
INSERT INTO `tr_area` VALUES ('2081', '崇川区', '167', '0', '3');
INSERT INTO `tr_area` VALUES ('2082', '海安县', '167', '0', '3');
INSERT INTO `tr_area` VALUES ('2083', '海门市', '167', '0', '3');
INSERT INTO `tr_area` VALUES ('2084', '港闸区', '167', '0', '3');
INSERT INTO `tr_area` VALUES ('2085', '通州市', '167', '0', '3');
INSERT INTO `tr_area` VALUES ('2086', '东海县', '168', '0', '3');
INSERT INTO `tr_area` VALUES ('2087', '新浦区', '168', '0', '3');
INSERT INTO `tr_area` VALUES ('2088', '海州区', '168', '0', '3');
INSERT INTO `tr_area` VALUES ('2089', '灌云县', '168', '0', '3');
INSERT INTO `tr_area` VALUES ('2090', '灌南县', '168', '0', '3');
INSERT INTO `tr_area` VALUES ('2091', '赣榆县', '168', '0', '3');
INSERT INTO `tr_area` VALUES ('2092', '连云区', '168', '0', '3');
INSERT INTO `tr_area` VALUES ('2093', '楚州区', '169', '0', '3');
INSERT INTO `tr_area` VALUES ('2094', '洪泽县', '169', '0', '3');
INSERT INTO `tr_area` VALUES ('2095', '涟水县', '169', '0', '3');
INSERT INTO `tr_area` VALUES ('2096', '淮阴区', '169', '0', '3');
INSERT INTO `tr_area` VALUES ('2097', '清河区', '169', '0', '3');
INSERT INTO `tr_area` VALUES ('2098', '清浦区', '169', '0', '3');
INSERT INTO `tr_area` VALUES ('2099', '盱眙县', '169', '0', '3');
INSERT INTO `tr_area` VALUES ('2100', '金湖县', '169', '0', '3');
INSERT INTO `tr_area` VALUES ('2101', '东台市', '170', '0', '3');
INSERT INTO `tr_area` VALUES ('2102', '亭湖区', '170', '0', '3');
INSERT INTO `tr_area` VALUES ('2103', '响水县', '170', '0', '3');
INSERT INTO `tr_area` VALUES ('2104', '大丰市', '170', '0', '3');
INSERT INTO `tr_area` VALUES ('2105', '射阳县', '170', '0', '3');
INSERT INTO `tr_area` VALUES ('2106', '建湖县', '170', '0', '3');
INSERT INTO `tr_area` VALUES ('2107', '滨海县', '170', '0', '3');
INSERT INTO `tr_area` VALUES ('2108', '盐都区', '170', '0', '3');
INSERT INTO `tr_area` VALUES ('2109', '阜宁县', '170', '0', '3');
INSERT INTO `tr_area` VALUES ('2110', '仪征市', '171', '0', '3');
INSERT INTO `tr_area` VALUES ('2111', '宝应县', '171', '0', '3');
INSERT INTO `tr_area` VALUES ('2112', '广陵区', '171', '0', '3');
INSERT INTO `tr_area` VALUES ('2113', '江都市', '171', '0', '3');
INSERT INTO `tr_area` VALUES ('2114', '维扬区', '171', '0', '3');
INSERT INTO `tr_area` VALUES ('2115', '邗江区', '171', '0', '3');
INSERT INTO `tr_area` VALUES ('2116', '高邮市', '171', '0', '3');
INSERT INTO `tr_area` VALUES ('2117', '丹徒区', '172', '0', '3');
INSERT INTO `tr_area` VALUES ('2118', '丹阳市', '172', '0', '3');
INSERT INTO `tr_area` VALUES ('2119', '京口区', '172', '0', '3');
INSERT INTO `tr_area` VALUES ('2120', '句容市', '172', '0', '3');
INSERT INTO `tr_area` VALUES ('2121', '扬中市', '172', '0', '3');
INSERT INTO `tr_area` VALUES ('2122', '润州区', '172', '0', '3');
INSERT INTO `tr_area` VALUES ('2123', '兴化市', '173', '0', '3');
INSERT INTO `tr_area` VALUES ('2124', '姜堰市', '173', '0', '3');
INSERT INTO `tr_area` VALUES ('2125', '泰兴市', '173', '0', '3');
INSERT INTO `tr_area` VALUES ('2126', '海陵区', '173', '0', '3');
INSERT INTO `tr_area` VALUES ('2127', '靖江市', '173', '0', '3');
INSERT INTO `tr_area` VALUES ('2128', '高港区', '173', '0', '3');
INSERT INTO `tr_area` VALUES ('2129', '宿城区', '174', '0', '3');
INSERT INTO `tr_area` VALUES ('2130', '宿豫区', '174', '0', '3');
INSERT INTO `tr_area` VALUES ('2131', '沭阳县', '174', '0', '3');
INSERT INTO `tr_area` VALUES ('2132', '泗洪县', '174', '0', '3');
INSERT INTO `tr_area` VALUES ('2133', '泗阳县', '174', '0', '3');
INSERT INTO `tr_area` VALUES ('2134', '上城区', '175', '0', '3');
INSERT INTO `tr_area` VALUES ('2135', '下城区', '175', '0', '3');
INSERT INTO `tr_area` VALUES ('2136', '临安市', '175', '0', '3');
INSERT INTO `tr_area` VALUES ('2137', '余杭区', '175', '0', '3');
INSERT INTO `tr_area` VALUES ('2138', '富阳市', '175', '0', '3');
INSERT INTO `tr_area` VALUES ('2139', '建德市', '175', '0', '3');
INSERT INTO `tr_area` VALUES ('2140', '拱墅区', '175', '0', '3');
INSERT INTO `tr_area` VALUES ('2141', '桐庐县', '175', '0', '3');
INSERT INTO `tr_area` VALUES ('2142', '江干区', '175', '0', '3');
INSERT INTO `tr_area` VALUES ('2143', '淳安县', '175', '0', '3');
INSERT INTO `tr_area` VALUES ('2144', '滨江区', '175', '0', '3');
INSERT INTO `tr_area` VALUES ('2145', '萧山区', '175', '0', '3');
INSERT INTO `tr_area` VALUES ('2146', '西湖区', '175', '0', '3');
INSERT INTO `tr_area` VALUES ('2147', '余姚市', '176', '0', '3');
INSERT INTO `tr_area` VALUES ('2148', '北仑区', '176', '0', '3');
INSERT INTO `tr_area` VALUES ('2149', '奉化市', '176', '0', '3');
INSERT INTO `tr_area` VALUES ('2150', '宁海县', '176', '0', '3');
INSERT INTO `tr_area` VALUES ('2151', '慈溪市', '176', '0', '3');
INSERT INTO `tr_area` VALUES ('2152', '江东区', '176', '0', '3');
INSERT INTO `tr_area` VALUES ('2153', '江北区', '176', '0', '3');
INSERT INTO `tr_area` VALUES ('2154', '海曙区', '176', '0', '3');
INSERT INTO `tr_area` VALUES ('2155', '象山县', '176', '0', '3');
INSERT INTO `tr_area` VALUES ('2156', '鄞州区', '176', '0', '3');
INSERT INTO `tr_area` VALUES ('2157', '镇海区', '176', '0', '3');
INSERT INTO `tr_area` VALUES ('2158', '乐清市', '177', '0', '3');
INSERT INTO `tr_area` VALUES ('2159', '平阳县', '177', '0', '3');
INSERT INTO `tr_area` VALUES ('2160', '文成县', '177', '0', '3');
INSERT INTO `tr_area` VALUES ('2161', '永嘉县', '177', '0', '3');
INSERT INTO `tr_area` VALUES ('2162', '泰顺县', '177', '0', '3');
INSERT INTO `tr_area` VALUES ('2163', '洞头县', '177', '0', '3');
INSERT INTO `tr_area` VALUES ('2164', '瑞安市', '177', '0', '3');
INSERT INTO `tr_area` VALUES ('2165', '瓯海区', '177', '0', '3');
INSERT INTO `tr_area` VALUES ('2166', '苍南县', '177', '0', '3');
INSERT INTO `tr_area` VALUES ('2167', '鹿城区', '177', '0', '3');
INSERT INTO `tr_area` VALUES ('2168', '龙湾区', '177', '0', '3');
INSERT INTO `tr_area` VALUES ('2169', '南湖区', '178', '0', '3');
INSERT INTO `tr_area` VALUES ('2170', '嘉善县', '178', '0', '3');
INSERT INTO `tr_area` VALUES ('2171', '平湖市', '178', '0', '3');
INSERT INTO `tr_area` VALUES ('2172', '桐乡市', '178', '0', '3');
INSERT INTO `tr_area` VALUES ('2173', '海宁市', '178', '0', '3');
INSERT INTO `tr_area` VALUES ('2174', '海盐县', '178', '0', '3');
INSERT INTO `tr_area` VALUES ('2175', '秀洲区', '178', '0', '3');
INSERT INTO `tr_area` VALUES ('2176', '南浔区', '179', '0', '3');
INSERT INTO `tr_area` VALUES ('2177', '吴兴区', '179', '0', '3');
INSERT INTO `tr_area` VALUES ('2178', '安吉县', '179', '0', '3');
INSERT INTO `tr_area` VALUES ('2179', '德清县', '179', '0', '3');
INSERT INTO `tr_area` VALUES ('2180', '长兴县', '179', '0', '3');
INSERT INTO `tr_area` VALUES ('2181', '上虞市', '180', '0', '3');
INSERT INTO `tr_area` VALUES ('2182', '嵊州市', '180', '0', '3');
INSERT INTO `tr_area` VALUES ('2183', '新昌县', '180', '0', '3');
INSERT INTO `tr_area` VALUES ('2184', '绍兴县', '180', '0', '3');
INSERT INTO `tr_area` VALUES ('2185', '诸暨市', '180', '0', '3');
INSERT INTO `tr_area` VALUES ('2186', '越城区', '180', '0', '3');
INSERT INTO `tr_area` VALUES ('2187', '定海区', '181', '0', '3');
INSERT INTO `tr_area` VALUES ('2188', '岱山县', '181', '0', '3');
INSERT INTO `tr_area` VALUES ('2189', '嵊泗县', '181', '0', '3');
INSERT INTO `tr_area` VALUES ('2190', '普陀区', '181', '0', '3');
INSERT INTO `tr_area` VALUES ('2191', '常山县', '182', '0', '3');
INSERT INTO `tr_area` VALUES ('2192', '开化县', '182', '0', '3');
INSERT INTO `tr_area` VALUES ('2193', '柯城区', '182', '0', '3');
INSERT INTO `tr_area` VALUES ('2194', '江山市', '182', '0', '3');
INSERT INTO `tr_area` VALUES ('2195', '衢江区', '182', '0', '3');
INSERT INTO `tr_area` VALUES ('2196', '龙游县', '182', '0', '3');
INSERT INTO `tr_area` VALUES ('2197', '东阳市', '183', '0', '3');
INSERT INTO `tr_area` VALUES ('2198', '义乌市', '183', '0', '3');
INSERT INTO `tr_area` VALUES ('2199', '兰溪市', '183', '0', '3');
INSERT INTO `tr_area` VALUES ('2200', '婺城区', '183', '0', '3');
INSERT INTO `tr_area` VALUES ('2201', '武义县', '183', '0', '3');
INSERT INTO `tr_area` VALUES ('2202', '永康市', '183', '0', '3');
INSERT INTO `tr_area` VALUES ('2203', '浦江县', '183', '0', '3');
INSERT INTO `tr_area` VALUES ('2204', '磐安县', '183', '0', '3');
INSERT INTO `tr_area` VALUES ('2205', '金东区', '183', '0', '3');
INSERT INTO `tr_area` VALUES ('2206', '三门县', '184', '0', '3');
INSERT INTO `tr_area` VALUES ('2207', '临海市', '184', '0', '3');
INSERT INTO `tr_area` VALUES ('2208', '仙居县', '184', '0', '3');
INSERT INTO `tr_area` VALUES ('2209', '天台县', '184', '0', '3');
INSERT INTO `tr_area` VALUES ('2210', '椒江区', '184', '0', '3');
INSERT INTO `tr_area` VALUES ('2211', '温岭市', '184', '0', '3');
INSERT INTO `tr_area` VALUES ('2212', '玉环县', '184', '0', '3');
INSERT INTO `tr_area` VALUES ('2213', '路桥区', '184', '0', '3');
INSERT INTO `tr_area` VALUES ('2214', '黄岩区', '184', '0', '3');
INSERT INTO `tr_area` VALUES ('2215', '云和县', '185', '0', '3');
INSERT INTO `tr_area` VALUES ('2216', '庆元县', '185', '0', '3');
INSERT INTO `tr_area` VALUES ('2217', '景宁畲族自治县', '185', '0', '3');
INSERT INTO `tr_area` VALUES ('2218', '松阳县', '185', '0', '3');
INSERT INTO `tr_area` VALUES ('2219', '缙云县', '185', '0', '3');
INSERT INTO `tr_area` VALUES ('2220', '莲都区', '185', '0', '3');
INSERT INTO `tr_area` VALUES ('2221', '遂昌县', '185', '0', '3');
INSERT INTO `tr_area` VALUES ('2222', '青田县', '185', '0', '3');
INSERT INTO `tr_area` VALUES ('2223', '龙泉市', '185', '0', '3');
INSERT INTO `tr_area` VALUES ('2224', '包河区', '186', '0', '3');
INSERT INTO `tr_area` VALUES ('2225', '庐阳区', '186', '0', '3');
INSERT INTO `tr_area` VALUES ('2226', '瑶海区', '186', '0', '3');
INSERT INTO `tr_area` VALUES ('2227', '肥东县', '186', '0', '3');
INSERT INTO `tr_area` VALUES ('2228', '肥西县', '186', '0', '3');
INSERT INTO `tr_area` VALUES ('2229', '蜀山区', '186', '0', '3');
INSERT INTO `tr_area` VALUES ('2230', '长丰县', '186', '0', '3');
INSERT INTO `tr_area` VALUES ('2231', '三山区', '187', '0', '3');
INSERT INTO `tr_area` VALUES ('2232', '南陵县', '187', '0', '3');
INSERT INTO `tr_area` VALUES ('2233', '弋江区', '187', '0', '3');
INSERT INTO `tr_area` VALUES ('2234', '繁昌县', '187', '0', '3');
INSERT INTO `tr_area` VALUES ('2235', '芜湖县', '187', '0', '3');
INSERT INTO `tr_area` VALUES ('2236', '镜湖区', '187', '0', '3');
INSERT INTO `tr_area` VALUES ('2237', '鸠江区', '187', '0', '3');
INSERT INTO `tr_area` VALUES ('2238', '五河县', '188', '0', '3');
INSERT INTO `tr_area` VALUES ('2239', '固镇县', '188', '0', '3');
INSERT INTO `tr_area` VALUES ('2240', '怀远县', '188', '0', '3');
INSERT INTO `tr_area` VALUES ('2241', '淮上区', '188', '0', '3');
INSERT INTO `tr_area` VALUES ('2242', '禹会区', '188', '0', '3');
INSERT INTO `tr_area` VALUES ('2243', '蚌山区', '188', '0', '3');
INSERT INTO `tr_area` VALUES ('2244', '龙子湖区', '188', '0', '3');
INSERT INTO `tr_area` VALUES ('2245', '八公山区', '189', '0', '3');
INSERT INTO `tr_area` VALUES ('2246', '凤台县', '189', '0', '3');
INSERT INTO `tr_area` VALUES ('2247', '大通区', '189', '0', '3');
INSERT INTO `tr_area` VALUES ('2248', '潘集区', '189', '0', '3');
INSERT INTO `tr_area` VALUES ('2249', '田家庵区', '189', '0', '3');
INSERT INTO `tr_area` VALUES ('2250', '谢家集区', '189', '0', '3');
INSERT INTO `tr_area` VALUES ('2251', '当涂县', '190', '0', '3');
INSERT INTO `tr_area` VALUES ('2252', '花山区', '190', '0', '3');
INSERT INTO `tr_area` VALUES ('2253', '金家庄区', '190', '0', '3');
INSERT INTO `tr_area` VALUES ('2254', '雨山区', '190', '0', '3');
INSERT INTO `tr_area` VALUES ('2255', '杜集区', '191', '0', '3');
INSERT INTO `tr_area` VALUES ('2256', '濉溪县', '191', '0', '3');
INSERT INTO `tr_area` VALUES ('2257', '烈山区', '191', '0', '3');
INSERT INTO `tr_area` VALUES ('2258', '相山区', '191', '0', '3');
INSERT INTO `tr_area` VALUES ('2259', '狮子山区', '192', '0', '3');
INSERT INTO `tr_area` VALUES ('2260', '郊区', '192', '0', '3');
INSERT INTO `tr_area` VALUES ('2261', '铜官山区', '192', '0', '3');
INSERT INTO `tr_area` VALUES ('2262', '铜陵县', '192', '0', '3');
INSERT INTO `tr_area` VALUES ('2263', '大观区', '193', '0', '3');
INSERT INTO `tr_area` VALUES ('2264', '太湖县', '193', '0', '3');
INSERT INTO `tr_area` VALUES ('2265', '宜秀区', '193', '0', '3');
INSERT INTO `tr_area` VALUES ('2266', '宿松县', '193', '0', '3');
INSERT INTO `tr_area` VALUES ('2267', '岳西县', '193', '0', '3');
INSERT INTO `tr_area` VALUES ('2268', '怀宁县', '193', '0', '3');
INSERT INTO `tr_area` VALUES ('2269', '望江县', '193', '0', '3');
INSERT INTO `tr_area` VALUES ('2270', '枞阳县', '193', '0', '3');
INSERT INTO `tr_area` VALUES ('2271', '桐城市', '193', '0', '3');
INSERT INTO `tr_area` VALUES ('2272', '潜山县', '193', '0', '3');
INSERT INTO `tr_area` VALUES ('2273', '迎江区', '193', '0', '3');
INSERT INTO `tr_area` VALUES ('2274', '休宁县', '194', '0', '3');
INSERT INTO `tr_area` VALUES ('2275', '屯溪区', '194', '0', '3');
INSERT INTO `tr_area` VALUES ('2276', '徽州区', '194', '0', '3');
INSERT INTO `tr_area` VALUES ('2277', '歙县', '194', '0', '3');
INSERT INTO `tr_area` VALUES ('2278', '祁门县', '194', '0', '3');
INSERT INTO `tr_area` VALUES ('2279', '黄山区', '194', '0', '3');
INSERT INTO `tr_area` VALUES ('2280', '黟县', '194', '0', '3');
INSERT INTO `tr_area` VALUES ('2281', '全椒县', '195', '0', '3');
INSERT INTO `tr_area` VALUES ('2282', '凤阳县', '195', '0', '3');
INSERT INTO `tr_area` VALUES ('2283', '南谯区', '195', '0', '3');
INSERT INTO `tr_area` VALUES ('2284', '天长市', '195', '0', '3');
INSERT INTO `tr_area` VALUES ('2285', '定远县', '195', '0', '3');
INSERT INTO `tr_area` VALUES ('2286', '明光市', '195', '0', '3');
INSERT INTO `tr_area` VALUES ('2287', '来安县', '195', '0', '3');
INSERT INTO `tr_area` VALUES ('2288', '琅玡区', '195', '0', '3');
INSERT INTO `tr_area` VALUES ('2289', '临泉县', '196', '0', '3');
INSERT INTO `tr_area` VALUES ('2290', '太和县', '196', '0', '3');
INSERT INTO `tr_area` VALUES ('2291', '界首市', '196', '0', '3');
INSERT INTO `tr_area` VALUES ('2292', '阜南县', '196', '0', '3');
INSERT INTO `tr_area` VALUES ('2293', '颍东区', '196', '0', '3');
INSERT INTO `tr_area` VALUES ('2294', '颍州区', '196', '0', '3');
INSERT INTO `tr_area` VALUES ('2295', '颍泉区', '196', '0', '3');
INSERT INTO `tr_area` VALUES ('2296', '颖上县', '196', '0', '3');
INSERT INTO `tr_area` VALUES ('2297', '埇桥区', '197', '0', '3');
INSERT INTO `tr_area` VALUES ('2298', '泗县辖', '197', '0', '3');
INSERT INTO `tr_area` VALUES ('2299', '灵璧县', '197', '0', '3');
INSERT INTO `tr_area` VALUES ('2300', '砀山县', '197', '0', '3');
INSERT INTO `tr_area` VALUES ('2301', '萧县', '197', '0', '3');
INSERT INTO `tr_area` VALUES ('2302', '含山县', '198', '0', '3');
INSERT INTO `tr_area` VALUES ('2303', '和县', '198', '0', '3');
INSERT INTO `tr_area` VALUES ('2304', '居巢区', '198', '0', '3');
INSERT INTO `tr_area` VALUES ('2305', '庐江县', '198', '0', '3');
INSERT INTO `tr_area` VALUES ('2306', '无为县', '198', '0', '3');
INSERT INTO `tr_area` VALUES ('2307', '寿县', '199', '0', '3');
INSERT INTO `tr_area` VALUES ('2308', '舒城县', '199', '0', '3');
INSERT INTO `tr_area` VALUES ('2309', '裕安区', '199', '0', '3');
INSERT INTO `tr_area` VALUES ('2310', '金安区', '199', '0', '3');
INSERT INTO `tr_area` VALUES ('2311', '金寨县', '199', '0', '3');
INSERT INTO `tr_area` VALUES ('2312', '霍山县', '199', '0', '3');
INSERT INTO `tr_area` VALUES ('2313', '霍邱县', '199', '0', '3');
INSERT INTO `tr_area` VALUES ('2314', '利辛县', '200', '0', '3');
INSERT INTO `tr_area` VALUES ('2315', '涡阳县', '200', '0', '3');
INSERT INTO `tr_area` VALUES ('2316', '蒙城县', '200', '0', '3');
INSERT INTO `tr_area` VALUES ('2317', '谯城区', '200', '0', '3');
INSERT INTO `tr_area` VALUES ('2318', '东至县', '201', '0', '3');
INSERT INTO `tr_area` VALUES ('2319', '石台县', '201', '0', '3');
INSERT INTO `tr_area` VALUES ('2320', '贵池区', '201', '0', '3');
INSERT INTO `tr_area` VALUES ('2321', '青阳县', '201', '0', '3');
INSERT INTO `tr_area` VALUES ('2322', '宁国市', '202', '0', '3');
INSERT INTO `tr_area` VALUES ('2323', '宣州区', '202', '0', '3');
INSERT INTO `tr_area` VALUES ('2324', '广德县', '202', '0', '3');
INSERT INTO `tr_area` VALUES ('2325', '旌德县', '202', '0', '3');
INSERT INTO `tr_area` VALUES ('2326', '泾县', '202', '0', '3');
INSERT INTO `tr_area` VALUES ('2327', '绩溪县', '202', '0', '3');
INSERT INTO `tr_area` VALUES ('2328', '郎溪县', '202', '0', '3');
INSERT INTO `tr_area` VALUES ('2329', '仓山区', '203', '0', '3');
INSERT INTO `tr_area` VALUES ('2330', '台江区', '203', '0', '3');
INSERT INTO `tr_area` VALUES ('2331', '平潭县', '203', '0', '3');
INSERT INTO `tr_area` VALUES ('2332', '晋安区', '203', '0', '3');
INSERT INTO `tr_area` VALUES ('2333', '永泰县', '203', '0', '3');
INSERT INTO `tr_area` VALUES ('2334', '福清市', '203', '0', '3');
INSERT INTO `tr_area` VALUES ('2335', '罗源县', '203', '0', '3');
INSERT INTO `tr_area` VALUES ('2336', '连江县', '203', '0', '3');
INSERT INTO `tr_area` VALUES ('2337', '长乐市', '203', '0', '3');
INSERT INTO `tr_area` VALUES ('2338', '闽侯县', '203', '0', '3');
INSERT INTO `tr_area` VALUES ('2339', '闽清县', '203', '0', '3');
INSERT INTO `tr_area` VALUES ('2340', '马尾区', '203', '0', '3');
INSERT INTO `tr_area` VALUES ('2341', '鼓楼区', '203', '0', '3');
INSERT INTO `tr_area` VALUES ('2342', '同安区', '204', '0', '3');
INSERT INTO `tr_area` VALUES ('2343', '思明区', '204', '0', '3');
INSERT INTO `tr_area` VALUES ('2344', '海沧区', '204', '0', '3');
INSERT INTO `tr_area` VALUES ('2345', '湖里区', '204', '0', '3');
INSERT INTO `tr_area` VALUES ('2346', '翔安区', '204', '0', '3');
INSERT INTO `tr_area` VALUES ('2347', '集美区', '204', '0', '3');
INSERT INTO `tr_area` VALUES ('2348', '仙游县', '205', '0', '3');
INSERT INTO `tr_area` VALUES ('2349', '城厢区', '205', '0', '3');
INSERT INTO `tr_area` VALUES ('2350', '涵江区', '205', '0', '3');
INSERT INTO `tr_area` VALUES ('2351', '秀屿区', '205', '0', '3');
INSERT INTO `tr_area` VALUES ('2352', '荔城区', '205', '0', '3');
INSERT INTO `tr_area` VALUES ('2353', '三元区', '206', '0', '3');
INSERT INTO `tr_area` VALUES ('2354', '大田县', '206', '0', '3');
INSERT INTO `tr_area` VALUES ('2355', '宁化县', '206', '0', '3');
INSERT INTO `tr_area` VALUES ('2356', '将乐县', '206', '0', '3');
INSERT INTO `tr_area` VALUES ('2357', '尤溪县', '206', '0', '3');
INSERT INTO `tr_area` VALUES ('2358', '建宁县', '206', '0', '3');
INSERT INTO `tr_area` VALUES ('2359', '明溪县', '206', '0', '3');
INSERT INTO `tr_area` VALUES ('2360', '梅列区', '206', '0', '3');
INSERT INTO `tr_area` VALUES ('2361', '永安市', '206', '0', '3');
INSERT INTO `tr_area` VALUES ('2362', '沙县', '206', '0', '3');
INSERT INTO `tr_area` VALUES ('2363', '泰宁县', '206', '0', '3');
INSERT INTO `tr_area` VALUES ('2364', '清流县', '206', '0', '3');
INSERT INTO `tr_area` VALUES ('2365', '丰泽区', '207', '0', '3');
INSERT INTO `tr_area` VALUES ('2366', '南安市', '207', '0', '3');
INSERT INTO `tr_area` VALUES ('2367', '安溪县', '207', '0', '3');
INSERT INTO `tr_area` VALUES ('2368', '德化县', '207', '0', '3');
INSERT INTO `tr_area` VALUES ('2369', '惠安县', '207', '0', '3');
INSERT INTO `tr_area` VALUES ('2370', '晋江市', '207', '0', '3');
INSERT INTO `tr_area` VALUES ('2371', '永春县', '207', '0', '3');
INSERT INTO `tr_area` VALUES ('2372', '泉港区', '207', '0', '3');
INSERT INTO `tr_area` VALUES ('2373', '洛江区', '207', '0', '3');
INSERT INTO `tr_area` VALUES ('2374', '石狮市', '207', '0', '3');
INSERT INTO `tr_area` VALUES ('2375', '金门县', '207', '0', '3');
INSERT INTO `tr_area` VALUES ('2376', '鲤城区', '207', '0', '3');
INSERT INTO `tr_area` VALUES ('2377', '东山县', '208', '0', '3');
INSERT INTO `tr_area` VALUES ('2378', '云霄县', '208', '0', '3');
INSERT INTO `tr_area` VALUES ('2379', '华安县', '208', '0', '3');
INSERT INTO `tr_area` VALUES ('2380', '南靖县', '208', '0', '3');
INSERT INTO `tr_area` VALUES ('2381', '平和县', '208', '0', '3');
INSERT INTO `tr_area` VALUES ('2382', '漳浦县', '208', '0', '3');
INSERT INTO `tr_area` VALUES ('2383', '芗城区', '208', '0', '3');
INSERT INTO `tr_area` VALUES ('2384', '诏安县', '208', '0', '3');
INSERT INTO `tr_area` VALUES ('2385', '长泰县', '208', '0', '3');
INSERT INTO `tr_area` VALUES ('2386', '龙文区', '208', '0', '3');
INSERT INTO `tr_area` VALUES ('2387', '龙海市', '208', '0', '3');
INSERT INTO `tr_area` VALUES ('2388', '光泽县', '209', '0', '3');
INSERT INTO `tr_area` VALUES ('2389', '延平区', '209', '0', '3');
INSERT INTO `tr_area` VALUES ('2390', '建瓯市', '209', '0', '3');
INSERT INTO `tr_area` VALUES ('2391', '建阳市', '209', '0', '3');
INSERT INTO `tr_area` VALUES ('2392', '政和县', '209', '0', '3');
INSERT INTO `tr_area` VALUES ('2393', '松溪县', '209', '0', '3');
INSERT INTO `tr_area` VALUES ('2394', '武夷山市', '209', '0', '3');
INSERT INTO `tr_area` VALUES ('2395', '浦城县', '209', '0', '3');
INSERT INTO `tr_area` VALUES ('2396', '邵武市', '209', '0', '3');
INSERT INTO `tr_area` VALUES ('2397', '顺昌县', '209', '0', '3');
INSERT INTO `tr_area` VALUES ('2398', '上杭县', '210', '0', '3');
INSERT INTO `tr_area` VALUES ('2399', '新罗区', '210', '0', '3');
INSERT INTO `tr_area` VALUES ('2400', '武平县', '210', '0', '3');
INSERT INTO `tr_area` VALUES ('2401', '永定县', '210', '0', '3');
INSERT INTO `tr_area` VALUES ('2402', '漳平市', '210', '0', '3');
INSERT INTO `tr_area` VALUES ('2403', '连城县', '210', '0', '3');
INSERT INTO `tr_area` VALUES ('2404', '长汀县', '210', '0', '3');
INSERT INTO `tr_area` VALUES ('2405', '古田县', '211', '0', '3');
INSERT INTO `tr_area` VALUES ('2406', '周宁县', '211', '0', '3');
INSERT INTO `tr_area` VALUES ('2407', '寿宁县', '211', '0', '3');
INSERT INTO `tr_area` VALUES ('2408', '屏南县', '211', '0', '3');
INSERT INTO `tr_area` VALUES ('2409', '柘荣县', '211', '0', '3');
INSERT INTO `tr_area` VALUES ('2410', '福安市', '211', '0', '3');
INSERT INTO `tr_area` VALUES ('2411', '福鼎市', '211', '0', '3');
INSERT INTO `tr_area` VALUES ('2412', '蕉城区', '211', '0', '3');
INSERT INTO `tr_area` VALUES ('2413', '霞浦县', '211', '0', '3');
INSERT INTO `tr_area` VALUES ('2414', '东湖区', '212', '0', '3');
INSERT INTO `tr_area` VALUES ('2415', '南昌县', '212', '0', '3');
INSERT INTO `tr_area` VALUES ('2416', '安义县', '212', '0', '3');
INSERT INTO `tr_area` VALUES ('2417', '新建县', '212', '0', '3');
INSERT INTO `tr_area` VALUES ('2418', '湾里区', '212', '0', '3');
INSERT INTO `tr_area` VALUES ('2419', '西湖区', '212', '0', '3');
INSERT INTO `tr_area` VALUES ('2420', '进贤县', '212', '0', '3');
INSERT INTO `tr_area` VALUES ('2421', '青云谱区', '212', '0', '3');
INSERT INTO `tr_area` VALUES ('2422', '青山湖区', '212', '0', '3');
INSERT INTO `tr_area` VALUES ('2423', '乐平市', '213', '0', '3');
INSERT INTO `tr_area` VALUES ('2424', '昌江区', '213', '0', '3');
INSERT INTO `tr_area` VALUES ('2425', '浮梁县', '213', '0', '3');
INSERT INTO `tr_area` VALUES ('2426', '珠山区', '213', '0', '3');
INSERT INTO `tr_area` VALUES ('2427', '上栗县', '214', '0', '3');
INSERT INTO `tr_area` VALUES ('2428', '安源区', '214', '0', '3');
INSERT INTO `tr_area` VALUES ('2429', '湘东区', '214', '0', '3');
INSERT INTO `tr_area` VALUES ('2430', '芦溪县', '214', '0', '3');
INSERT INTO `tr_area` VALUES ('2431', '莲花县', '214', '0', '3');
INSERT INTO `tr_area` VALUES ('2432', '九江县', '215', '0', '3');
INSERT INTO `tr_area` VALUES ('2433', '修水县', '215', '0', '3');
INSERT INTO `tr_area` VALUES ('2434', '庐山区', '215', '0', '3');
INSERT INTO `tr_area` VALUES ('2435', '彭泽县', '215', '0', '3');
INSERT INTO `tr_area` VALUES ('2436', '德安县', '215', '0', '3');
INSERT INTO `tr_area` VALUES ('2437', '星子县', '215', '0', '3');
INSERT INTO `tr_area` VALUES ('2438', '武宁县', '215', '0', '3');
INSERT INTO `tr_area` VALUES ('2439', '永修县', '215', '0', '3');
INSERT INTO `tr_area` VALUES ('2440', '浔阳区', '215', '0', '3');
INSERT INTO `tr_area` VALUES ('2441', '湖口县', '215', '0', '3');
INSERT INTO `tr_area` VALUES ('2442', '瑞昌市', '215', '0', '3');
INSERT INTO `tr_area` VALUES ('2443', '都昌县', '215', '0', '3');
INSERT INTO `tr_area` VALUES ('2444', '分宜县', '216', '0', '3');
INSERT INTO `tr_area` VALUES ('2445', '渝水区', '216', '0', '3');
INSERT INTO `tr_area` VALUES ('2446', '余江县', '217', '0', '3');
INSERT INTO `tr_area` VALUES ('2447', '月湖区', '217', '0', '3');
INSERT INTO `tr_area` VALUES ('2448', '贵溪市', '217', '0', '3');
INSERT INTO `tr_area` VALUES ('2449', '上犹县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2450', '于都县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2451', '会昌县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2452', '信丰县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2453', '全南县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2454', '兴国县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2455', '南康市', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2456', '大余县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2457', '宁都县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2458', '安远县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2459', '定南县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2460', '寻乌县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2461', '崇义县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2462', '瑞金市', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2463', '石城县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2464', '章贡区', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2465', '赣县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2466', '龙南县', '218', '0', '3');
INSERT INTO `tr_area` VALUES ('2467', '万安县', '219', '0', '3');
INSERT INTO `tr_area` VALUES ('2468', '井冈山市', '219', '0', '3');
INSERT INTO `tr_area` VALUES ('2469', '吉安县', '219', '0', '3');
INSERT INTO `tr_area` VALUES ('2470', '吉州区', '219', '0', '3');
INSERT INTO `tr_area` VALUES ('2471', '吉水县', '219', '0', '3');
INSERT INTO `tr_area` VALUES ('2472', '安福县', '219', '0', '3');
INSERT INTO `tr_area` VALUES ('2473', '峡江县', '219', '0', '3');
INSERT INTO `tr_area` VALUES ('2474', '新干县', '219', '0', '3');
INSERT INTO `tr_area` VALUES ('2475', '永丰县', '219', '0', '3');
INSERT INTO `tr_area` VALUES ('2476', '永新县', '219', '0', '3');
INSERT INTO `tr_area` VALUES ('2477', '泰和县', '219', '0', '3');
INSERT INTO `tr_area` VALUES ('2478', '遂川县', '219', '0', '3');
INSERT INTO `tr_area` VALUES ('2479', '青原区', '219', '0', '3');
INSERT INTO `tr_area` VALUES ('2480', '万载县', '220', '0', '3');
INSERT INTO `tr_area` VALUES ('2481', '上高县', '220', '0', '3');
INSERT INTO `tr_area` VALUES ('2482', '丰城市', '220', '0', '3');
INSERT INTO `tr_area` VALUES ('2483', '奉新县', '220', '0', '3');
INSERT INTO `tr_area` VALUES ('2484', '宜丰县', '220', '0', '3');
INSERT INTO `tr_area` VALUES ('2485', '樟树市', '220', '0', '3');
INSERT INTO `tr_area` VALUES ('2486', '袁州区', '220', '0', '3');
INSERT INTO `tr_area` VALUES ('2487', '铜鼓县', '220', '0', '3');
INSERT INTO `tr_area` VALUES ('2488', '靖安县', '220', '0', '3');
INSERT INTO `tr_area` VALUES ('2489', '高安市', '220', '0', '3');
INSERT INTO `tr_area` VALUES ('2490', '东乡县', '221', '0', '3');
INSERT INTO `tr_area` VALUES ('2491', '临川区', '221', '0', '3');
INSERT INTO `tr_area` VALUES ('2492', '乐安县', '221', '0', '3');
INSERT INTO `tr_area` VALUES ('2493', '南丰县', '221', '0', '3');
INSERT INTO `tr_area` VALUES ('2494', '南城县', '221', '0', '3');
INSERT INTO `tr_area` VALUES ('2495', '宜黄县', '221', '0', '3');
INSERT INTO `tr_area` VALUES ('2496', '崇仁县', '221', '0', '3');
INSERT INTO `tr_area` VALUES ('2497', '广昌县', '221', '0', '3');
INSERT INTO `tr_area` VALUES ('2498', '资溪县', '221', '0', '3');
INSERT INTO `tr_area` VALUES ('2499', '金溪县', '221', '0', '3');
INSERT INTO `tr_area` VALUES ('2500', '黎川县', '221', '0', '3');
INSERT INTO `tr_area` VALUES ('2501', '万年县', '222', '0', '3');
INSERT INTO `tr_area` VALUES ('2502', '上饶县', '222', '0', '3');
INSERT INTO `tr_area` VALUES ('2503', '余干县', '222', '0', '3');
INSERT INTO `tr_area` VALUES ('2504', '信州区', '222', '0', '3');
INSERT INTO `tr_area` VALUES ('2505', '婺源县', '222', '0', '3');
INSERT INTO `tr_area` VALUES ('2506', '广丰县', '222', '0', '3');
INSERT INTO `tr_area` VALUES ('2507', '弋阳县', '222', '0', '3');
INSERT INTO `tr_area` VALUES ('2508', '德兴市', '222', '0', '3');
INSERT INTO `tr_area` VALUES ('2509', '横峰县', '222', '0', '3');
INSERT INTO `tr_area` VALUES ('2510', '玉山县', '222', '0', '3');
INSERT INTO `tr_area` VALUES ('2511', '鄱阳县', '222', '0', '3');
INSERT INTO `tr_area` VALUES ('2512', '铅山县', '222', '0', '3');
INSERT INTO `tr_area` VALUES ('2513', '历下区', '223', '0', '3');
INSERT INTO `tr_area` VALUES ('2514', '历城区', '223', '0', '3');
INSERT INTO `tr_area` VALUES ('2515', '商河县', '223', '0', '3');
INSERT INTO `tr_area` VALUES ('2516', '天桥区', '223', '0', '3');
INSERT INTO `tr_area` VALUES ('2517', '市中区', '223', '0', '3');
INSERT INTO `tr_area` VALUES ('2518', '平阴县', '223', '0', '3');
INSERT INTO `tr_area` VALUES ('2519', '槐荫区', '223', '0', '3');
INSERT INTO `tr_area` VALUES ('2520', '济阳县', '223', '0', '3');
INSERT INTO `tr_area` VALUES ('2521', '章丘市', '223', '0', '3');
INSERT INTO `tr_area` VALUES ('2522', '长清区', '223', '0', '3');
INSERT INTO `tr_area` VALUES ('2523', '即墨市', '224', '0', '3');
INSERT INTO `tr_area` VALUES ('2524', '四方区', '224', '0', '3');
INSERT INTO `tr_area` VALUES ('2525', '城阳区', '224', '0', '3');
INSERT INTO `tr_area` VALUES ('2526', '崂山区', '224', '0', '3');
INSERT INTO `tr_area` VALUES ('2527', '市北区', '224', '0', '3');
INSERT INTO `tr_area` VALUES ('2528', '市南区', '224', '0', '3');
INSERT INTO `tr_area` VALUES ('2529', '平度市', '224', '0', '3');
INSERT INTO `tr_area` VALUES ('2530', '李沧区', '224', '0', '3');
INSERT INTO `tr_area` VALUES ('2531', '胶南市', '224', '0', '3');
INSERT INTO `tr_area` VALUES ('2532', '胶州市', '224', '0', '3');
INSERT INTO `tr_area` VALUES ('2533', '莱西市', '224', '0', '3');
INSERT INTO `tr_area` VALUES ('2534', '黄岛区', '224', '0', '3');
INSERT INTO `tr_area` VALUES ('2535', '临淄区', '225', '0', '3');
INSERT INTO `tr_area` VALUES ('2536', '博山区', '225', '0', '3');
INSERT INTO `tr_area` VALUES ('2537', '周村区', '225', '0', '3');
INSERT INTO `tr_area` VALUES ('2538', '张店区', '225', '0', '3');
INSERT INTO `tr_area` VALUES ('2539', '桓台县', '225', '0', '3');
INSERT INTO `tr_area` VALUES ('2540', '沂源县', '225', '0', '3');
INSERT INTO `tr_area` VALUES ('2541', '淄川区', '225', '0', '3');
INSERT INTO `tr_area` VALUES ('2542', '高青县', '225', '0', '3');
INSERT INTO `tr_area` VALUES ('2543', '台儿庄区', '226', '0', '3');
INSERT INTO `tr_area` VALUES ('2544', '山亭区', '226', '0', '3');
INSERT INTO `tr_area` VALUES ('2545', '峄城区', '226', '0', '3');
INSERT INTO `tr_area` VALUES ('2546', '市中区', '226', '0', '3');
INSERT INTO `tr_area` VALUES ('2547', '滕州市', '226', '0', '3');
INSERT INTO `tr_area` VALUES ('2548', '薛城区', '226', '0', '3');
INSERT INTO `tr_area` VALUES ('2549', '东营区', '227', '0', '3');
INSERT INTO `tr_area` VALUES ('2550', '利津县', '227', '0', '3');
INSERT INTO `tr_area` VALUES ('2551', '垦利县', '227', '0', '3');
INSERT INTO `tr_area` VALUES ('2552', '广饶县', '227', '0', '3');
INSERT INTO `tr_area` VALUES ('2553', '河口区', '227', '0', '3');
INSERT INTO `tr_area` VALUES ('2554', '招远市', '228', '0', '3');
INSERT INTO `tr_area` VALUES ('2555', '栖霞市', '228', '0', '3');
INSERT INTO `tr_area` VALUES ('2556', '海阳市', '228', '0', '3');
INSERT INTO `tr_area` VALUES ('2557', '牟平区', '228', '0', '3');
INSERT INTO `tr_area` VALUES ('2558', '福山区', '228', '0', '3');
INSERT INTO `tr_area` VALUES ('2559', '芝罘区', '228', '0', '3');
INSERT INTO `tr_area` VALUES ('2560', '莱山区', '228', '0', '3');
INSERT INTO `tr_area` VALUES ('2561', '莱州市', '228', '0', '3');
INSERT INTO `tr_area` VALUES ('2562', '莱阳市', '228', '0', '3');
INSERT INTO `tr_area` VALUES ('2563', '蓬莱市', '228', '0', '3');
INSERT INTO `tr_area` VALUES ('2564', '长岛县', '228', '0', '3');
INSERT INTO `tr_area` VALUES ('2565', '龙口市', '228', '0', '3');
INSERT INTO `tr_area` VALUES ('2566', '临朐县', '229', '0', '3');
INSERT INTO `tr_area` VALUES ('2567', '坊子区', '229', '0', '3');
INSERT INTO `tr_area` VALUES ('2568', '奎文区', '229', '0', '3');
INSERT INTO `tr_area` VALUES ('2569', '安丘市', '229', '0', '3');
INSERT INTO `tr_area` VALUES ('2570', '寒亭区', '229', '0', '3');
INSERT INTO `tr_area` VALUES ('2571', '寿光市', '229', '0', '3');
INSERT INTO `tr_area` VALUES ('2572', '昌乐县', '229', '0', '3');
INSERT INTO `tr_area` VALUES ('2573', '昌邑市', '229', '0', '3');
INSERT INTO `tr_area` VALUES ('2574', '潍城区', '229', '0', '3');
INSERT INTO `tr_area` VALUES ('2575', '诸城市', '229', '0', '3');
INSERT INTO `tr_area` VALUES ('2576', '青州市', '229', '0', '3');
INSERT INTO `tr_area` VALUES ('2577', '高密市', '229', '0', '3');
INSERT INTO `tr_area` VALUES ('2578', '任城区', '230', '0', '3');
INSERT INTO `tr_area` VALUES ('2579', '兖州市', '230', '0', '3');
INSERT INTO `tr_area` VALUES ('2580', '嘉祥县', '230', '0', '3');
INSERT INTO `tr_area` VALUES ('2581', '市中区', '230', '0', '3');
INSERT INTO `tr_area` VALUES ('2582', '微山县', '230', '0', '3');
INSERT INTO `tr_area` VALUES ('2583', '曲阜市', '230', '0', '3');
INSERT INTO `tr_area` VALUES ('2584', '梁山县', '230', '0', '3');
INSERT INTO `tr_area` VALUES ('2585', '汶上县', '230', '0', '3');
INSERT INTO `tr_area` VALUES ('2586', '泗水县', '230', '0', '3');
INSERT INTO `tr_area` VALUES ('2587', '邹城市', '230', '0', '3');
INSERT INTO `tr_area` VALUES ('2588', '金乡县', '230', '0', '3');
INSERT INTO `tr_area` VALUES ('2589', '鱼台县', '230', '0', '3');
INSERT INTO `tr_area` VALUES ('2590', '东平县', '231', '0', '3');
INSERT INTO `tr_area` VALUES ('2591', '宁阳县', '231', '0', '3');
INSERT INTO `tr_area` VALUES ('2592', '岱岳区', '231', '0', '3');
INSERT INTO `tr_area` VALUES ('2593', '新泰市', '231', '0', '3');
INSERT INTO `tr_area` VALUES ('2594', '泰山区', '231', '0', '3');
INSERT INTO `tr_area` VALUES ('2595', '肥城市', '231', '0', '3');
INSERT INTO `tr_area` VALUES ('2596', '乳山市', '232', '0', '3');
INSERT INTO `tr_area` VALUES ('2597', '文登市', '232', '0', '3');
INSERT INTO `tr_area` VALUES ('2598', '环翠区', '232', '0', '3');
INSERT INTO `tr_area` VALUES ('2599', '荣成市', '232', '0', '3');
INSERT INTO `tr_area` VALUES ('2600', '东港区', '233', '0', '3');
INSERT INTO `tr_area` VALUES ('2601', '五莲县', '233', '0', '3');
INSERT INTO `tr_area` VALUES ('2602', '岚山区', '233', '0', '3');
INSERT INTO `tr_area` VALUES ('2603', '莒县', '233', '0', '3');
INSERT INTO `tr_area` VALUES ('2604', '莱城区', '234', '0', '3');
INSERT INTO `tr_area` VALUES ('2605', '钢城区', '234', '0', '3');
INSERT INTO `tr_area` VALUES ('2606', '临沭县', '235', '0', '3');
INSERT INTO `tr_area` VALUES ('2607', '兰山区', '235', '0', '3');
INSERT INTO `tr_area` VALUES ('2608', '平邑县', '235', '0', '3');
INSERT INTO `tr_area` VALUES ('2609', '沂南县', '235', '0', '3');
INSERT INTO `tr_area` VALUES ('2610', '沂水县', '235', '0', '3');
INSERT INTO `tr_area` VALUES ('2611', '河东区', '235', '0', '3');
INSERT INTO `tr_area` VALUES ('2612', '罗庄区', '235', '0', '3');
INSERT INTO `tr_area` VALUES ('2613', '苍山县', '235', '0', '3');
INSERT INTO `tr_area` VALUES ('2614', '莒南县', '235', '0', '3');
INSERT INTO `tr_area` VALUES ('2615', '蒙阴县', '235', '0', '3');
INSERT INTO `tr_area` VALUES ('2616', '费县', '235', '0', '3');
INSERT INTO `tr_area` VALUES ('2617', '郯城县', '235', '0', '3');
INSERT INTO `tr_area` VALUES ('2618', '临邑县', '236', '0', '3');
INSERT INTO `tr_area` VALUES ('2619', '乐陵市', '236', '0', '3');
INSERT INTO `tr_area` VALUES ('2620', '夏津县', '236', '0', '3');
INSERT INTO `tr_area` VALUES ('2621', '宁津县', '236', '0', '3');
INSERT INTO `tr_area` VALUES ('2622', '平原县', '236', '0', '3');
INSERT INTO `tr_area` VALUES ('2623', '庆云县', '236', '0', '3');
INSERT INTO `tr_area` VALUES ('2624', '德城区', '236', '0', '3');
INSERT INTO `tr_area` VALUES ('2625', '武城县', '236', '0', '3');
INSERT INTO `tr_area` VALUES ('2626', '禹城市', '236', '0', '3');
INSERT INTO `tr_area` VALUES ('2627', '陵县', '236', '0', '3');
INSERT INTO `tr_area` VALUES ('2628', '齐河县', '236', '0', '3');
INSERT INTO `tr_area` VALUES ('2629', '东昌府区', '237', '0', '3');
INSERT INTO `tr_area` VALUES ('2630', '东阿县', '237', '0', '3');
INSERT INTO `tr_area` VALUES ('2631', '临清市', '237', '0', '3');
INSERT INTO `tr_area` VALUES ('2632', '冠县', '237', '0', '3');
INSERT INTO `tr_area` VALUES ('2633', '茌平县', '237', '0', '3');
INSERT INTO `tr_area` VALUES ('2634', '莘县', '237', '0', '3');
INSERT INTO `tr_area` VALUES ('2635', '阳谷县', '237', '0', '3');
INSERT INTO `tr_area` VALUES ('2636', '高唐县', '237', '0', '3');
INSERT INTO `tr_area` VALUES ('2637', '博兴县', '238', '0', '3');
INSERT INTO `tr_area` VALUES ('2638', '惠民县', '238', '0', '3');
INSERT INTO `tr_area` VALUES ('2639', '无棣县', '238', '0', '3');
INSERT INTO `tr_area` VALUES ('2640', '沾化县', '238', '0', '3');
INSERT INTO `tr_area` VALUES ('2641', '滨城区', '238', '0', '3');
INSERT INTO `tr_area` VALUES ('2642', '邹平县', '238', '0', '3');
INSERT INTO `tr_area` VALUES ('2643', '阳信县', '238', '0', '3');
INSERT INTO `tr_area` VALUES ('2644', '东明县', '239', '0', '3');
INSERT INTO `tr_area` VALUES ('2645', '单县', '239', '0', '3');
INSERT INTO `tr_area` VALUES ('2646', '定陶县', '239', '0', '3');
INSERT INTO `tr_area` VALUES ('2647', '巨野县', '239', '0', '3');
INSERT INTO `tr_area` VALUES ('2648', '成武县', '239', '0', '3');
INSERT INTO `tr_area` VALUES ('2649', '曹县', '239', '0', '3');
INSERT INTO `tr_area` VALUES ('2650', '牡丹区', '239', '0', '3');
INSERT INTO `tr_area` VALUES ('2651', '郓城县', '239', '0', '3');
INSERT INTO `tr_area` VALUES ('2652', '鄄城县', '239', '0', '3');
INSERT INTO `tr_area` VALUES ('2653', '上街区', '240', '0', '3');
INSERT INTO `tr_area` VALUES ('2654', '中原区', '240', '0', '3');
INSERT INTO `tr_area` VALUES ('2655', '中牟县', '240', '0', '3');
INSERT INTO `tr_area` VALUES ('2656', '二七区', '240', '0', '3');
INSERT INTO `tr_area` VALUES ('2657', '巩义市', '240', '0', '3');
INSERT INTO `tr_area` VALUES ('2658', '惠济区', '240', '0', '3');
INSERT INTO `tr_area` VALUES ('2659', '新密市', '240', '0', '3');
INSERT INTO `tr_area` VALUES ('2660', '新郑市', '240', '0', '3');
INSERT INTO `tr_area` VALUES ('2661', '登封市', '240', '0', '3');
INSERT INTO `tr_area` VALUES ('2662', '管城回族区', '240', '0', '3');
INSERT INTO `tr_area` VALUES ('2663', '荥阳市', '240', '0', '3');
INSERT INTO `tr_area` VALUES ('2664', '金水区', '240', '0', '3');
INSERT INTO `tr_area` VALUES ('2665', '兰考县', '241', '0', '3');
INSERT INTO `tr_area` VALUES ('2666', '尉氏县', '241', '0', '3');
INSERT INTO `tr_area` VALUES ('2667', '开封县', '241', '0', '3');
INSERT INTO `tr_area` VALUES ('2668', '杞县', '241', '0', '3');
INSERT INTO `tr_area` VALUES ('2669', '禹王台区', '241', '0', '3');
INSERT INTO `tr_area` VALUES ('2670', '通许县', '241', '0', '3');
INSERT INTO `tr_area` VALUES ('2671', '金明区', '241', '0', '3');
INSERT INTO `tr_area` VALUES ('2672', '顺河回族区', '241', '0', '3');
INSERT INTO `tr_area` VALUES ('2673', '鼓楼区', '241', '0', '3');
INSERT INTO `tr_area` VALUES ('2674', '龙亭区', '241', '0', '3');
INSERT INTO `tr_area` VALUES ('2675', '伊川县', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2676', '偃师市', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2677', '吉利区', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2678', '孟津县', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2679', '宜阳县', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2680', '嵩县', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2681', '新安县', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2682', '栾川县', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2683', '汝阳县', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2684', '洛宁县', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2685', '洛龙区', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2686', '涧西区', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2687', '瀍河回族区', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2688', '老城区', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2689', '西工区', '242', '0', '3');
INSERT INTO `tr_area` VALUES ('2690', '卫东区', '243', '0', '3');
INSERT INTO `tr_area` VALUES ('2691', '叶县', '243', '0', '3');
INSERT INTO `tr_area` VALUES ('2692', '宝丰县', '243', '0', '3');
INSERT INTO `tr_area` VALUES ('2693', '新华区', '243', '0', '3');
INSERT INTO `tr_area` VALUES ('2694', '汝州市', '243', '0', '3');
INSERT INTO `tr_area` VALUES ('2695', '湛河区', '243', '0', '3');
INSERT INTO `tr_area` VALUES ('2696', '石龙区', '243', '0', '3');
INSERT INTO `tr_area` VALUES ('2697', '舞钢市', '243', '0', '3');
INSERT INTO `tr_area` VALUES ('2698', '郏县', '243', '0', '3');
INSERT INTO `tr_area` VALUES ('2699', '鲁山县', '243', '0', '3');
INSERT INTO `tr_area` VALUES ('2700', '内黄县', '244', '0', '3');
INSERT INTO `tr_area` VALUES ('2701', '北关区', '244', '0', '3');
INSERT INTO `tr_area` VALUES ('2702', '安阳县', '244', '0', '3');
INSERT INTO `tr_area` VALUES ('2703', '文峰区', '244', '0', '3');
INSERT INTO `tr_area` VALUES ('2704', '林州市', '244', '0', '3');
INSERT INTO `tr_area` VALUES ('2705', '殷都区', '244', '0', '3');
INSERT INTO `tr_area` VALUES ('2706', '汤阴县', '244', '0', '3');
INSERT INTO `tr_area` VALUES ('2707', '滑县', '244', '0', '3');
INSERT INTO `tr_area` VALUES ('2708', '龙安区', '244', '0', '3');
INSERT INTO `tr_area` VALUES ('2709', '山城区', '245', '0', '3');
INSERT INTO `tr_area` VALUES ('2710', '浚县', '245', '0', '3');
INSERT INTO `tr_area` VALUES ('2711', '淇县', '245', '0', '3');
INSERT INTO `tr_area` VALUES ('2712', '淇滨区', '245', '0', '3');
INSERT INTO `tr_area` VALUES ('2713', '鹤山区', '245', '0', '3');
INSERT INTO `tr_area` VALUES ('2714', '凤泉区', '246', '0', '3');
INSERT INTO `tr_area` VALUES ('2715', '卫滨区', '246', '0', '3');
INSERT INTO `tr_area` VALUES ('2716', '卫辉市', '246', '0', '3');
INSERT INTO `tr_area` VALUES ('2717', '原阳县', '246', '0', '3');
INSERT INTO `tr_area` VALUES ('2718', '封丘县', '246', '0', '3');
INSERT INTO `tr_area` VALUES ('2719', '延津县', '246', '0', '3');
INSERT INTO `tr_area` VALUES ('2720', '新乡县', '246', '0', '3');
INSERT INTO `tr_area` VALUES ('2721', '牧野区', '246', '0', '3');
INSERT INTO `tr_area` VALUES ('2722', '红旗区', '246', '0', '3');
INSERT INTO `tr_area` VALUES ('2723', '获嘉县', '246', '0', '3');
INSERT INTO `tr_area` VALUES ('2724', '辉县市', '246', '0', '3');
INSERT INTO `tr_area` VALUES ('2725', '长垣县', '246', '0', '3');
INSERT INTO `tr_area` VALUES ('2726', '中站区', '247', '0', '3');
INSERT INTO `tr_area` VALUES ('2727', '修武县', '247', '0', '3');
INSERT INTO `tr_area` VALUES ('2728', '博爱县', '247', '0', '3');
INSERT INTO `tr_area` VALUES ('2729', '孟州市', '247', '0', '3');
INSERT INTO `tr_area` VALUES ('2730', '山阳区', '247', '0', '3');
INSERT INTO `tr_area` VALUES ('2731', '武陟县', '247', '0', '3');
INSERT INTO `tr_area` VALUES ('2732', '沁阳市', '247', '0', '3');
INSERT INTO `tr_area` VALUES ('2733', '温县', '247', '0', '3');
INSERT INTO `tr_area` VALUES ('2734', '解放区', '247', '0', '3');
INSERT INTO `tr_area` VALUES ('2735', '马村区', '247', '0', '3');
INSERT INTO `tr_area` VALUES ('2736', '华龙区', '248', '0', '3');
INSERT INTO `tr_area` VALUES ('2737', '南乐县', '248', '0', '3');
INSERT INTO `tr_area` VALUES ('2738', '台前县', '248', '0', '3');
INSERT INTO `tr_area` VALUES ('2739', '清丰县', '248', '0', '3');
INSERT INTO `tr_area` VALUES ('2740', '濮阳县', '248', '0', '3');
INSERT INTO `tr_area` VALUES ('2741', '范县', '248', '0', '3');
INSERT INTO `tr_area` VALUES ('2742', '禹州市', '249', '0', '3');
INSERT INTO `tr_area` VALUES ('2743', '襄城县', '249', '0', '3');
INSERT INTO `tr_area` VALUES ('2744', '许昌县', '249', '0', '3');
INSERT INTO `tr_area` VALUES ('2745', '鄢陵县', '249', '0', '3');
INSERT INTO `tr_area` VALUES ('2746', '长葛市', '249', '0', '3');
INSERT INTO `tr_area` VALUES ('2747', '魏都区', '249', '0', '3');
INSERT INTO `tr_area` VALUES ('2748', '临颍县', '250', '0', '3');
INSERT INTO `tr_area` VALUES ('2749', '召陵区', '250', '0', '3');
INSERT INTO `tr_area` VALUES ('2750', '源汇区', '250', '0', '3');
INSERT INTO `tr_area` VALUES ('2751', '舞阳县', '250', '0', '3');
INSERT INTO `tr_area` VALUES ('2752', '郾城区', '250', '0', '3');
INSERT INTO `tr_area` VALUES ('2753', '义马市', '251', '0', '3');
INSERT INTO `tr_area` VALUES ('2754', '卢氏县', '251', '0', '3');
INSERT INTO `tr_area` VALUES ('2755', '渑池县', '251', '0', '3');
INSERT INTO `tr_area` VALUES ('2756', '湖滨区', '251', '0', '3');
INSERT INTO `tr_area` VALUES ('2757', '灵宝市', '251', '0', '3');
INSERT INTO `tr_area` VALUES ('2758', '陕县', '251', '0', '3');
INSERT INTO `tr_area` VALUES ('2759', '内乡县', '252', '0', '3');
INSERT INTO `tr_area` VALUES ('2760', '南召县', '252', '0', '3');
INSERT INTO `tr_area` VALUES ('2761', '卧龙区', '252', '0', '3');
INSERT INTO `tr_area` VALUES ('2762', '唐河县', '252', '0', '3');
INSERT INTO `tr_area` VALUES ('2763', '宛城区', '252', '0', '3');
INSERT INTO `tr_area` VALUES ('2764', '新野县', '252', '0', '3');
INSERT INTO `tr_area` VALUES ('2765', '方城县', '252', '0', '3');
INSERT INTO `tr_area` VALUES ('2766', '桐柏县', '252', '0', '3');
INSERT INTO `tr_area` VALUES ('2767', '淅川县', '252', '0', '3');
INSERT INTO `tr_area` VALUES ('2768', '社旗县', '252', '0', '3');
INSERT INTO `tr_area` VALUES ('2769', '西峡县', '252', '0', '3');
INSERT INTO `tr_area` VALUES ('2770', '邓州市', '252', '0', '3');
INSERT INTO `tr_area` VALUES ('2771', '镇平县', '252', '0', '3');
INSERT INTO `tr_area` VALUES ('2772', '夏邑县', '253', '0', '3');
INSERT INTO `tr_area` VALUES ('2773', '宁陵县', '253', '0', '3');
INSERT INTO `tr_area` VALUES ('2774', '柘城县', '253', '0', '3');
INSERT INTO `tr_area` VALUES ('2775', '民权县', '253', '0', '3');
INSERT INTO `tr_area` VALUES ('2776', '永城市', '253', '0', '3');
INSERT INTO `tr_area` VALUES ('2777', '睢县', '253', '0', '3');
INSERT INTO `tr_area` VALUES ('2778', '睢阳区', '253', '0', '3');
INSERT INTO `tr_area` VALUES ('2779', '粱园区', '253', '0', '3');
INSERT INTO `tr_area` VALUES ('2780', '虞城县', '253', '0', '3');
INSERT INTO `tr_area` VALUES ('2781', '光山县', '254', '0', '3');
INSERT INTO `tr_area` VALUES ('2782', '商城县', '254', '0', '3');
INSERT INTO `tr_area` VALUES ('2783', '固始县', '254', '0', '3');
INSERT INTO `tr_area` VALUES ('2784', '平桥区', '254', '0', '3');
INSERT INTO `tr_area` VALUES ('2785', '息县', '254', '0', '3');
INSERT INTO `tr_area` VALUES ('2786', '新县', '254', '0', '3');
INSERT INTO `tr_area` VALUES ('2787', '浉河区', '254', '0', '3');
INSERT INTO `tr_area` VALUES ('2788', '淮滨县', '254', '0', '3');
INSERT INTO `tr_area` VALUES ('2789', '潢川县', '254', '0', '3');
INSERT INTO `tr_area` VALUES ('2790', '罗山县', '254', '0', '3');
INSERT INTO `tr_area` VALUES ('2791', '商水县', '255', '0', '3');
INSERT INTO `tr_area` VALUES ('2792', '太康县', '255', '0', '3');
INSERT INTO `tr_area` VALUES ('2793', '川汇区', '255', '0', '3');
INSERT INTO `tr_area` VALUES ('2794', '扶沟县', '255', '0', '3');
INSERT INTO `tr_area` VALUES ('2795', '沈丘县', '255', '0', '3');
INSERT INTO `tr_area` VALUES ('2796', '淮阳县', '255', '0', '3');
INSERT INTO `tr_area` VALUES ('2797', '西华县', '255', '0', '3');
INSERT INTO `tr_area` VALUES ('2798', '郸城县', '255', '0', '3');
INSERT INTO `tr_area` VALUES ('2799', '项城市', '255', '0', '3');
INSERT INTO `tr_area` VALUES ('2800', '鹿邑县', '255', '0', '3');
INSERT INTO `tr_area` VALUES ('2801', '上蔡县', '256', '0', '3');
INSERT INTO `tr_area` VALUES ('2802', '平舆县', '256', '0', '3');
INSERT INTO `tr_area` VALUES ('2803', '新蔡县', '256', '0', '3');
INSERT INTO `tr_area` VALUES ('2804', '正阳县', '256', '0', '3');
INSERT INTO `tr_area` VALUES ('2805', '汝南县', '256', '0', '3');
INSERT INTO `tr_area` VALUES ('2806', '泌阳县', '256', '0', '3');
INSERT INTO `tr_area` VALUES ('2807', '确山县', '256', '0', '3');
INSERT INTO `tr_area` VALUES ('2808', '西平县', '256', '0', '3');
INSERT INTO `tr_area` VALUES ('2809', '遂平县', '256', '0', '3');
INSERT INTO `tr_area` VALUES ('2810', '驿城区', '256', '0', '3');
INSERT INTO `tr_area` VALUES ('2811', '济源市', '257', '0', '3');
INSERT INTO `tr_area` VALUES ('2812', '东西湖区', '258', '0', '3');
INSERT INTO `tr_area` VALUES ('2813', '新洲区', '258', '0', '3');
INSERT INTO `tr_area` VALUES ('2814', '武昌区', '258', '0', '3');
INSERT INTO `tr_area` VALUES ('2815', '汉南区', '258', '0', '3');
INSERT INTO `tr_area` VALUES ('2816', '汉阳区', '258', '0', '3');
INSERT INTO `tr_area` VALUES ('2817', '江夏区', '258', '0', '3');
INSERT INTO `tr_area` VALUES ('2818', '江岸区', '258', '0', '3');
INSERT INTO `tr_area` VALUES ('2819', '江汉区', '258', '0', '3');
INSERT INTO `tr_area` VALUES ('2820', '洪山区', '258', '0', '3');
INSERT INTO `tr_area` VALUES ('2821', '硚口区', '258', '0', '3');
INSERT INTO `tr_area` VALUES ('2822', '蔡甸区', '258', '0', '3');
INSERT INTO `tr_area` VALUES ('2823', '青山区', '258', '0', '3');
INSERT INTO `tr_area` VALUES ('2824', '黄陂区', '258', '0', '3');
INSERT INTO `tr_area` VALUES ('2825', '下陆区', '259', '0', '3');
INSERT INTO `tr_area` VALUES ('2826', '大冶市', '259', '0', '3');
INSERT INTO `tr_area` VALUES ('2827', '西塞山区', '259', '0', '3');
INSERT INTO `tr_area` VALUES ('2828', '铁山区', '259', '0', '3');
INSERT INTO `tr_area` VALUES ('2829', '阳新县', '259', '0', '3');
INSERT INTO `tr_area` VALUES ('2830', '黄石港区', '259', '0', '3');
INSERT INTO `tr_area` VALUES ('2831', '丹江口市', '260', '0', '3');
INSERT INTO `tr_area` VALUES ('2832', '张湾区', '260', '0', '3');
INSERT INTO `tr_area` VALUES ('2833', '房县', '260', '0', '3');
INSERT INTO `tr_area` VALUES ('2834', '竹山县', '260', '0', '3');
INSERT INTO `tr_area` VALUES ('2835', '竹溪县', '260', '0', '3');
INSERT INTO `tr_area` VALUES ('2836', '茅箭区', '260', '0', '3');
INSERT INTO `tr_area` VALUES ('2837', '郧县', '260', '0', '3');
INSERT INTO `tr_area` VALUES ('2838', '郧西县', '260', '0', '3');
INSERT INTO `tr_area` VALUES ('2839', '五峰土家族自治县', '261', '0', '3');
INSERT INTO `tr_area` VALUES ('2840', '伍家岗区', '261', '0', '3');
INSERT INTO `tr_area` VALUES ('2841', '兴山县', '261', '0', '3');
INSERT INTO `tr_area` VALUES ('2842', '夷陵区', '261', '0', '3');
INSERT INTO `tr_area` VALUES ('2843', '宜都市', '261', '0', '3');
INSERT INTO `tr_area` VALUES ('2844', '当阳市', '261', '0', '3');
INSERT INTO `tr_area` VALUES ('2845', '枝江市', '261', '0', '3');
INSERT INTO `tr_area` VALUES ('2846', '点军区', '261', '0', '3');
INSERT INTO `tr_area` VALUES ('2847', '秭归县', '261', '0', '3');
INSERT INTO `tr_area` VALUES ('2848', '虢亭区', '261', '0', '3');
INSERT INTO `tr_area` VALUES ('2849', '西陵区', '261', '0', '3');
INSERT INTO `tr_area` VALUES ('2850', '远安县', '261', '0', '3');
INSERT INTO `tr_area` VALUES ('2851', '长阳土家族自治县', '261', '0', '3');
INSERT INTO `tr_area` VALUES ('2852', '保康县', '262', '0', '3');
INSERT INTO `tr_area` VALUES ('2853', '南漳县', '262', '0', '3');
INSERT INTO `tr_area` VALUES ('2854', '宜城市', '262', '0', '3');
INSERT INTO `tr_area` VALUES ('2855', '枣阳市', '262', '0', '3');
INSERT INTO `tr_area` VALUES ('2856', '樊城区', '262', '0', '3');
INSERT INTO `tr_area` VALUES ('2857', '老河口市', '262', '0', '3');
INSERT INTO `tr_area` VALUES ('2858', '襄城区', '262', '0', '3');
INSERT INTO `tr_area` VALUES ('2859', '襄阳区', '262', '0', '3');
INSERT INTO `tr_area` VALUES ('2860', '谷城县', '262', '0', '3');
INSERT INTO `tr_area` VALUES ('2861', '华容区', '263', '0', '3');
INSERT INTO `tr_area` VALUES ('2862', '粱子湖', '263', '0', '3');
INSERT INTO `tr_area` VALUES ('2863', '鄂城区', '263', '0', '3');
INSERT INTO `tr_area` VALUES ('2864', '东宝区', '264', '0', '3');
INSERT INTO `tr_area` VALUES ('2865', '京山县', '264', '0', '3');
INSERT INTO `tr_area` VALUES ('2866', '掇刀区', '264', '0', '3');
INSERT INTO `tr_area` VALUES ('2867', '沙洋县', '264', '0', '3');
INSERT INTO `tr_area` VALUES ('2868', '钟祥市', '264', '0', '3');
INSERT INTO `tr_area` VALUES ('2869', '云梦县', '265', '0', '3');
INSERT INTO `tr_area` VALUES ('2870', '大悟县', '265', '0', '3');
INSERT INTO `tr_area` VALUES ('2871', '孝南区', '265', '0', '3');
INSERT INTO `tr_area` VALUES ('2872', '孝昌县', '265', '0', '3');
INSERT INTO `tr_area` VALUES ('2873', '安陆市', '265', '0', '3');
INSERT INTO `tr_area` VALUES ('2874', '应城市', '265', '0', '3');
INSERT INTO `tr_area` VALUES ('2875', '汉川市', '265', '0', '3');
INSERT INTO `tr_area` VALUES ('2876', '公安县', '266', '0', '3');
INSERT INTO `tr_area` VALUES ('2877', '松滋市', '266', '0', '3');
INSERT INTO `tr_area` VALUES ('2878', '江陵县', '266', '0', '3');
INSERT INTO `tr_area` VALUES ('2879', '沙市区', '266', '0', '3');
INSERT INTO `tr_area` VALUES ('2880', '洪湖市', '266', '0', '3');
INSERT INTO `tr_area` VALUES ('2881', '监利县', '266', '0', '3');
INSERT INTO `tr_area` VALUES ('2882', '石首市', '266', '0', '3');
INSERT INTO `tr_area` VALUES ('2883', '荆州区', '266', '0', '3');
INSERT INTO `tr_area` VALUES ('2884', '团风县', '267', '0', '3');
INSERT INTO `tr_area` VALUES ('2885', '武穴市', '267', '0', '3');
INSERT INTO `tr_area` VALUES ('2886', '浠水县', '267', '0', '3');
INSERT INTO `tr_area` VALUES ('2887', '红安县', '267', '0', '3');
INSERT INTO `tr_area` VALUES ('2888', '罗田县', '267', '0', '3');
INSERT INTO `tr_area` VALUES ('2889', '英山县', '267', '0', '3');
INSERT INTO `tr_area` VALUES ('2890', '蕲春县', '267', '0', '3');
INSERT INTO `tr_area` VALUES ('2891', '麻城市', '267', '0', '3');
INSERT INTO `tr_area` VALUES ('2892', '黄州区', '267', '0', '3');
INSERT INTO `tr_area` VALUES ('2893', '黄梅县', '267', '0', '3');
INSERT INTO `tr_area` VALUES ('2894', '咸安区', '268', '0', '3');
INSERT INTO `tr_area` VALUES ('2895', '嘉鱼县', '268', '0', '3');
INSERT INTO `tr_area` VALUES ('2896', '崇阳县', '268', '0', '3');
INSERT INTO `tr_area` VALUES ('2897', '赤壁市', '268', '0', '3');
INSERT INTO `tr_area` VALUES ('2898', '通城县', '268', '0', '3');
INSERT INTO `tr_area` VALUES ('2899', '通山县', '268', '0', '3');
INSERT INTO `tr_area` VALUES ('2900', '广水市', '269', '0', '3');
INSERT INTO `tr_area` VALUES ('2901', '曾都区', '269', '0', '3');
INSERT INTO `tr_area` VALUES ('2902', '利川市', '270', '0', '3');
INSERT INTO `tr_area` VALUES ('2903', '咸丰县', '270', '0', '3');
INSERT INTO `tr_area` VALUES ('2904', '宣恩县', '270', '0', '3');
INSERT INTO `tr_area` VALUES ('2905', '巴东县', '270', '0', '3');
INSERT INTO `tr_area` VALUES ('2906', '建始县', '270', '0', '3');
INSERT INTO `tr_area` VALUES ('2907', '恩施市', '270', '0', '3');
INSERT INTO `tr_area` VALUES ('2908', '来凤县', '270', '0', '3');
INSERT INTO `tr_area` VALUES ('2909', '鹤峰县', '270', '0', '3');
INSERT INTO `tr_area` VALUES ('2910', '仙桃市', '271', '0', '3');
INSERT INTO `tr_area` VALUES ('2911', '潜江市', '272', '0', '3');
INSERT INTO `tr_area` VALUES ('2912', '天门市', '273', '0', '3');
INSERT INTO `tr_area` VALUES ('2913', '神农架林区', '274', '0', '3');
INSERT INTO `tr_area` VALUES ('2914', '天心区', '275', '0', '3');
INSERT INTO `tr_area` VALUES ('2915', '宁乡县', '275', '0', '3');
INSERT INTO `tr_area` VALUES ('2916', '岳麓区', '275', '0', '3');
INSERT INTO `tr_area` VALUES ('2917', '开福区', '275', '0', '3');
INSERT INTO `tr_area` VALUES ('2918', '望城县', '275', '0', '3');
INSERT INTO `tr_area` VALUES ('2919', '浏阳市', '275', '0', '3');
INSERT INTO `tr_area` VALUES ('2920', '芙蓉区', '275', '0', '3');
INSERT INTO `tr_area` VALUES ('2921', '长沙县', '275', '0', '3');
INSERT INTO `tr_area` VALUES ('2922', '雨花区', '275', '0', '3');
INSERT INTO `tr_area` VALUES ('2923', '天元区', '276', '0', '3');
INSERT INTO `tr_area` VALUES ('2924', '攸县', '276', '0', '3');
INSERT INTO `tr_area` VALUES ('2925', '株洲县', '276', '0', '3');
INSERT INTO `tr_area` VALUES ('2926', '炎陵县', '276', '0', '3');
INSERT INTO `tr_area` VALUES ('2927', '石峰区', '276', '0', '3');
INSERT INTO `tr_area` VALUES ('2928', '芦淞区', '276', '0', '3');
INSERT INTO `tr_area` VALUES ('2929', '茶陵县', '276', '0', '3');
INSERT INTO `tr_area` VALUES ('2930', '荷塘区', '276', '0', '3');
INSERT INTO `tr_area` VALUES ('2931', '醴陵市', '276', '0', '3');
INSERT INTO `tr_area` VALUES ('2932', '岳塘区', '277', '0', '3');
INSERT INTO `tr_area` VALUES ('2933', '湘乡市', '277', '0', '3');
INSERT INTO `tr_area` VALUES ('2934', '湘潭县', '277', '0', '3');
INSERT INTO `tr_area` VALUES ('2935', '雨湖区', '277', '0', '3');
INSERT INTO `tr_area` VALUES ('2936', '韶山市', '277', '0', '3');
INSERT INTO `tr_area` VALUES ('2937', '南岳区', '278', '0', '3');
INSERT INTO `tr_area` VALUES ('2938', '常宁市', '278', '0', '3');
INSERT INTO `tr_area` VALUES ('2939', '珠晖区', '278', '0', '3');
INSERT INTO `tr_area` VALUES ('2940', '石鼓区', '278', '0', '3');
INSERT INTO `tr_area` VALUES ('2941', '祁东县', '278', '0', '3');
INSERT INTO `tr_area` VALUES ('2942', '耒阳市', '278', '0', '3');
INSERT INTO `tr_area` VALUES ('2943', '蒸湘区', '278', '0', '3');
INSERT INTO `tr_area` VALUES ('2944', '衡东县', '278', '0', '3');
INSERT INTO `tr_area` VALUES ('2945', '衡南县', '278', '0', '3');
INSERT INTO `tr_area` VALUES ('2946', '衡山县', '278', '0', '3');
INSERT INTO `tr_area` VALUES ('2947', '衡阳县', '278', '0', '3');
INSERT INTO `tr_area` VALUES ('2948', '雁峰区', '278', '0', '3');
INSERT INTO `tr_area` VALUES ('2949', '北塔区', '279', '0', '3');
INSERT INTO `tr_area` VALUES ('2950', '双清区', '279', '0', '3');
INSERT INTO `tr_area` VALUES ('2951', '城步苗族自治县', '279', '0', '3');
INSERT INTO `tr_area` VALUES ('2952', '大祥区', '279', '0', '3');
INSERT INTO `tr_area` VALUES ('2953', '新宁县', '279', '0', '3');
INSERT INTO `tr_area` VALUES ('2954', '新邵县', '279', '0', '3');
INSERT INTO `tr_area` VALUES ('2955', '武冈市', '279', '0', '3');
INSERT INTO `tr_area` VALUES ('2956', '洞口县', '279', '0', '3');
INSERT INTO `tr_area` VALUES ('2957', '绥宁县', '279', '0', '3');
INSERT INTO `tr_area` VALUES ('2958', '邵东县', '279', '0', '3');
INSERT INTO `tr_area` VALUES ('2959', '邵阳县', '279', '0', '3');
INSERT INTO `tr_area` VALUES ('2960', '隆回县', '279', '0', '3');
INSERT INTO `tr_area` VALUES ('2961', '临湘市', '280', '0', '3');
INSERT INTO `tr_area` VALUES ('2962', '云溪区', '280', '0', '3');
INSERT INTO `tr_area` VALUES ('2963', '华容县', '280', '0', '3');
INSERT INTO `tr_area` VALUES ('2964', '君山区', '280', '0', '3');
INSERT INTO `tr_area` VALUES ('2965', '岳阳县', '280', '0', '3');
INSERT INTO `tr_area` VALUES ('2966', '岳阳楼区', '280', '0', '3');
INSERT INTO `tr_area` VALUES ('2967', '平江县', '280', '0', '3');
INSERT INTO `tr_area` VALUES ('2968', '汨罗市', '280', '0', '3');
INSERT INTO `tr_area` VALUES ('2969', '湘阴县', '280', '0', '3');
INSERT INTO `tr_area` VALUES ('2970', '临澧县', '281', '0', '3');
INSERT INTO `tr_area` VALUES ('2971', '安乡县', '281', '0', '3');
INSERT INTO `tr_area` VALUES ('2972', '桃源县', '281', '0', '3');
INSERT INTO `tr_area` VALUES ('2973', '武陵区', '281', '0', '3');
INSERT INTO `tr_area` VALUES ('2974', '汉寿县', '281', '0', '3');
INSERT INTO `tr_area` VALUES ('2975', '津市市', '281', '0', '3');
INSERT INTO `tr_area` VALUES ('2976', '澧县', '281', '0', '3');
INSERT INTO `tr_area` VALUES ('2977', '石门县', '281', '0', '3');
INSERT INTO `tr_area` VALUES ('2978', '鼎城区', '281', '0', '3');
INSERT INTO `tr_area` VALUES ('2979', '慈利县', '282', '0', '3');
INSERT INTO `tr_area` VALUES ('2980', '桑植县', '282', '0', '3');
INSERT INTO `tr_area` VALUES ('2981', '武陵源区', '282', '0', '3');
INSERT INTO `tr_area` VALUES ('2982', '永定区', '282', '0', '3');
INSERT INTO `tr_area` VALUES ('2983', '南县', '283', '0', '3');
INSERT INTO `tr_area` VALUES ('2984', '安化县', '283', '0', '3');
INSERT INTO `tr_area` VALUES ('2985', '桃江县', '283', '0', '3');
INSERT INTO `tr_area` VALUES ('2986', '沅江市', '283', '0', '3');
INSERT INTO `tr_area` VALUES ('2987', '资阳区', '283', '0', '3');
INSERT INTO `tr_area` VALUES ('2988', '赫山区', '283', '0', '3');
INSERT INTO `tr_area` VALUES ('2989', '临武县', '284', '0', '3');
INSERT INTO `tr_area` VALUES ('2990', '北湖区', '284', '0', '3');
INSERT INTO `tr_area` VALUES ('2991', '嘉禾县', '284', '0', '3');
INSERT INTO `tr_area` VALUES ('2992', '安仁县', '284', '0', '3');
INSERT INTO `tr_area` VALUES ('2993', '宜章县', '284', '0', '3');
INSERT INTO `tr_area` VALUES ('2994', '桂东县', '284', '0', '3');
INSERT INTO `tr_area` VALUES ('2995', '桂阳县', '284', '0', '3');
INSERT INTO `tr_area` VALUES ('2996', '永兴县', '284', '0', '3');
INSERT INTO `tr_area` VALUES ('2997', '汝城县', '284', '0', '3');
INSERT INTO `tr_area` VALUES ('2998', '苏仙区', '284', '0', '3');
INSERT INTO `tr_area` VALUES ('2999', '资兴市', '284', '0', '3');
INSERT INTO `tr_area` VALUES ('3000', '东安县', '285', '0', '3');
INSERT INTO `tr_area` VALUES ('3001', '冷水滩区', '285', '0', '3');
INSERT INTO `tr_area` VALUES ('3002', '双牌县', '285', '0', '3');
INSERT INTO `tr_area` VALUES ('3003', '宁远县', '285', '0', '3');
INSERT INTO `tr_area` VALUES ('3004', '新田县', '285', '0', '3');
INSERT INTO `tr_area` VALUES ('3005', '江华瑶族自治县', '285', '0', '3');
INSERT INTO `tr_area` VALUES ('3006', '江永县', '285', '0', '3');
INSERT INTO `tr_area` VALUES ('3007', '祁阳县', '285', '0', '3');
INSERT INTO `tr_area` VALUES ('3008', '蓝山县', '285', '0', '3');
INSERT INTO `tr_area` VALUES ('3009', '道县', '285', '0', '3');
INSERT INTO `tr_area` VALUES ('3010', '零陵区', '285', '0', '3');
INSERT INTO `tr_area` VALUES ('3011', '中方县', '286', '0', '3');
INSERT INTO `tr_area` VALUES ('3012', '会同县', '286', '0', '3');
INSERT INTO `tr_area` VALUES ('3013', '新晃侗族自治县', '286', '0', '3');
INSERT INTO `tr_area` VALUES ('3014', '沅陵县', '286', '0', '3');
INSERT INTO `tr_area` VALUES ('3015', '洪江市/洪江区', '286', '0', '3');
INSERT INTO `tr_area` VALUES ('3016', '溆浦县', '286', '0', '3');
INSERT INTO `tr_area` VALUES ('3017', '芷江侗族自治县', '286', '0', '3');
INSERT INTO `tr_area` VALUES ('3018', '辰溪县', '286', '0', '3');
INSERT INTO `tr_area` VALUES ('3019', '通道侗族自治县', '286', '0', '3');
INSERT INTO `tr_area` VALUES ('3020', '靖州苗族侗族自治县', '286', '0', '3');
INSERT INTO `tr_area` VALUES ('3021', '鹤城区', '286', '0', '3');
INSERT INTO `tr_area` VALUES ('3022', '麻阳苗族自治县', '286', '0', '3');
INSERT INTO `tr_area` VALUES ('3023', '冷水江市', '287', '0', '3');
INSERT INTO `tr_area` VALUES ('3024', '双峰县', '287', '0', '3');
INSERT INTO `tr_area` VALUES ('3025', '娄星区', '287', '0', '3');
INSERT INTO `tr_area` VALUES ('3026', '新化县', '287', '0', '3');
INSERT INTO `tr_area` VALUES ('3027', '涟源市', '287', '0', '3');
INSERT INTO `tr_area` VALUES ('3028', '保靖县', '288', '0', '3');
INSERT INTO `tr_area` VALUES ('3029', '凤凰县', '288', '0', '3');
INSERT INTO `tr_area` VALUES ('3030', '古丈县', '288', '0', '3');
INSERT INTO `tr_area` VALUES ('3031', '吉首市', '288', '0', '3');
INSERT INTO `tr_area` VALUES ('3032', '永顺县', '288', '0', '3');
INSERT INTO `tr_area` VALUES ('3033', '泸溪县', '288', '0', '3');
INSERT INTO `tr_area` VALUES ('3034', '花垣县', '288', '0', '3');
INSERT INTO `tr_area` VALUES ('3035', '龙山县', '288', '0', '3');
INSERT INTO `tr_area` VALUES ('3036', '萝岗区', '289', '0', '3');
INSERT INTO `tr_area` VALUES ('3037', '南沙区', '289', '0', '3');
INSERT INTO `tr_area` VALUES ('3038', '从化市', '289', '0', '3');
INSERT INTO `tr_area` VALUES ('3039', '增城市', '289', '0', '3');
INSERT INTO `tr_area` VALUES ('3040', '天河区', '289', '0', '3');
INSERT INTO `tr_area` VALUES ('3041', '海珠区', '289', '0', '3');
INSERT INTO `tr_area` VALUES ('3042', '番禺区', '289', '0', '3');
INSERT INTO `tr_area` VALUES ('3043', '白云区', '289', '0', '3');
INSERT INTO `tr_area` VALUES ('3044', '花都区', '289', '0', '3');
INSERT INTO `tr_area` VALUES ('3045', '荔湾区', '289', '0', '3');
INSERT INTO `tr_area` VALUES ('3046', '越秀区', '289', '0', '3');
INSERT INTO `tr_area` VALUES ('3047', '黄埔区', '289', '0', '3');
INSERT INTO `tr_area` VALUES ('3048', '乐昌市', '290', '0', '3');
INSERT INTO `tr_area` VALUES ('3049', '乳源瑶族自治县', '290', '0', '3');
INSERT INTO `tr_area` VALUES ('3050', '仁化县', '290', '0', '3');
INSERT INTO `tr_area` VALUES ('3051', '南雄市', '290', '0', '3');
INSERT INTO `tr_area` VALUES ('3052', '始兴县', '290', '0', '3');
INSERT INTO `tr_area` VALUES ('3053', '新丰县', '290', '0', '3');
INSERT INTO `tr_area` VALUES ('3054', '曲江区', '290', '0', '3');
INSERT INTO `tr_area` VALUES ('3055', '武江区', '290', '0', '3');
INSERT INTO `tr_area` VALUES ('3056', '浈江区', '290', '0', '3');
INSERT INTO `tr_area` VALUES ('3057', '翁源县', '290', '0', '3');
INSERT INTO `tr_area` VALUES ('3058', '南山区', '291', '0', '3');
INSERT INTO `tr_area` VALUES ('3059', '宝安区', '291', '0', '3');
INSERT INTO `tr_area` VALUES ('3060', '盐田区', '291', '0', '3');
INSERT INTO `tr_area` VALUES ('3061', '福田区', '291', '0', '3');
INSERT INTO `tr_area` VALUES ('3062', '罗湖区', '291', '0', '3');
INSERT INTO `tr_area` VALUES ('3063', '龙岗区', '291', '0', '3');
INSERT INTO `tr_area` VALUES ('3064', '斗门区', '292', '0', '3');
INSERT INTO `tr_area` VALUES ('3065', '金湾区', '292', '0', '3');
INSERT INTO `tr_area` VALUES ('3066', '香洲区', '292', '0', '3');
INSERT INTO `tr_area` VALUES ('3067', '南澳县', '293', '0', '3');
INSERT INTO `tr_area` VALUES ('3068', '潮南区', '293', '0', '3');
INSERT INTO `tr_area` VALUES ('3069', '潮阳区', '293', '0', '3');
INSERT INTO `tr_area` VALUES ('3070', '澄海区', '293', '0', '3');
INSERT INTO `tr_area` VALUES ('3071', '濠江区', '293', '0', '3');
INSERT INTO `tr_area` VALUES ('3072', '金平区', '293', '0', '3');
INSERT INTO `tr_area` VALUES ('3073', '龙湖区', '293', '0', '3');
INSERT INTO `tr_area` VALUES ('3074', '三水区', '294', '0', '3');
INSERT INTO `tr_area` VALUES ('3075', '南海区', '294', '0', '3');
INSERT INTO `tr_area` VALUES ('3076', '禅城区', '294', '0', '3');
INSERT INTO `tr_area` VALUES ('3077', '顺德区', '294', '0', '3');
INSERT INTO `tr_area` VALUES ('3078', '高明区', '294', '0', '3');
INSERT INTO `tr_area` VALUES ('3079', '台山市', '295', '0', '3');
INSERT INTO `tr_area` VALUES ('3080', '开平市', '295', '0', '3');
INSERT INTO `tr_area` VALUES ('3081', '恩平市', '295', '0', '3');
INSERT INTO `tr_area` VALUES ('3082', '新会区', '295', '0', '3');
INSERT INTO `tr_area` VALUES ('3083', '江海区', '295', '0', '3');
INSERT INTO `tr_area` VALUES ('3084', '蓬江区', '295', '0', '3');
INSERT INTO `tr_area` VALUES ('3085', '鹤山市', '295', '0', '3');
INSERT INTO `tr_area` VALUES ('3086', '吴川市', '296', '0', '3');
INSERT INTO `tr_area` VALUES ('3087', '坡头区', '296', '0', '3');
INSERT INTO `tr_area` VALUES ('3088', '廉江市', '296', '0', '3');
INSERT INTO `tr_area` VALUES ('3089', '徐闻县', '296', '0', '3');
INSERT INTO `tr_area` VALUES ('3090', '赤坎区', '296', '0', '3');
INSERT INTO `tr_area` VALUES ('3091', '遂溪县', '296', '0', '3');
INSERT INTO `tr_area` VALUES ('3092', '雷州市', '296', '0', '3');
INSERT INTO `tr_area` VALUES ('3093', '霞山区', '296', '0', '3');
INSERT INTO `tr_area` VALUES ('3094', '麻章区', '296', '0', '3');
INSERT INTO `tr_area` VALUES ('3095', '信宜市', '297', '0', '3');
INSERT INTO `tr_area` VALUES ('3096', '化州市', '297', '0', '3');
INSERT INTO `tr_area` VALUES ('3097', '电白县', '297', '0', '3');
INSERT INTO `tr_area` VALUES ('3098', '茂南区', '297', '0', '3');
INSERT INTO `tr_area` VALUES ('3099', '茂港区', '297', '0', '3');
INSERT INTO `tr_area` VALUES ('3100', '高州市', '297', '0', '3');
INSERT INTO `tr_area` VALUES ('3101', '四会市', '298', '0', '3');
INSERT INTO `tr_area` VALUES ('3102', '封开县', '298', '0', '3');
INSERT INTO `tr_area` VALUES ('3103', '广宁县', '298', '0', '3');
INSERT INTO `tr_area` VALUES ('3104', '德庆县', '298', '0', '3');
INSERT INTO `tr_area` VALUES ('3105', '怀集县', '298', '0', '3');
INSERT INTO `tr_area` VALUES ('3106', '端州区', '298', '0', '3');
INSERT INTO `tr_area` VALUES ('3107', '高要市', '298', '0', '3');
INSERT INTO `tr_area` VALUES ('3108', '鼎湖区', '298', '0', '3');
INSERT INTO `tr_area` VALUES ('3109', '博罗县', '299', '0', '3');
INSERT INTO `tr_area` VALUES ('3110', '惠东县', '299', '0', '3');
INSERT INTO `tr_area` VALUES ('3111', '惠城区', '299', '0', '3');
INSERT INTO `tr_area` VALUES ('3112', '惠阳区', '299', '0', '3');
INSERT INTO `tr_area` VALUES ('3113', '龙门县', '299', '0', '3');
INSERT INTO `tr_area` VALUES ('3114', '丰顺县', '300', '0', '3');
INSERT INTO `tr_area` VALUES ('3115', '五华县', '300', '0', '3');
INSERT INTO `tr_area` VALUES ('3116', '兴宁市', '300', '0', '3');
INSERT INTO `tr_area` VALUES ('3117', '大埔县', '300', '0', '3');
INSERT INTO `tr_area` VALUES ('3118', '平远县', '300', '0', '3');
INSERT INTO `tr_area` VALUES ('3119', '梅县', '300', '0', '3');
INSERT INTO `tr_area` VALUES ('3120', '梅江区', '300', '0', '3');
INSERT INTO `tr_area` VALUES ('3121', '蕉岭县', '300', '0', '3');
INSERT INTO `tr_area` VALUES ('3122', '城区', '301', '0', '3');
INSERT INTO `tr_area` VALUES ('3123', '海丰县', '301', '0', '3');
INSERT INTO `tr_area` VALUES ('3124', '陆丰市', '301', '0', '3');
INSERT INTO `tr_area` VALUES ('3125', '陆河县', '301', '0', '3');
INSERT INTO `tr_area` VALUES ('3126', '东源县', '302', '0', '3');
INSERT INTO `tr_area` VALUES ('3127', '和平县', '302', '0', '3');
INSERT INTO `tr_area` VALUES ('3128', '源城区', '302', '0', '3');
INSERT INTO `tr_area` VALUES ('3129', '紫金县', '302', '0', '3');
INSERT INTO `tr_area` VALUES ('3130', '连平县', '302', '0', '3');
INSERT INTO `tr_area` VALUES ('3131', '龙川县', '302', '0', '3');
INSERT INTO `tr_area` VALUES ('3132', '江城区', '303', '0', '3');
INSERT INTO `tr_area` VALUES ('3133', '阳东县', '303', '0', '3');
INSERT INTO `tr_area` VALUES ('3134', '阳春市', '303', '0', '3');
INSERT INTO `tr_area` VALUES ('3135', '阳西县', '303', '0', '3');
INSERT INTO `tr_area` VALUES ('3136', '佛冈县', '304', '0', '3');
INSERT INTO `tr_area` VALUES ('3137', '清城区', '304', '0', '3');
INSERT INTO `tr_area` VALUES ('3138', '清新县', '304', '0', '3');
INSERT INTO `tr_area` VALUES ('3139', '英德市', '304', '0', '3');
INSERT INTO `tr_area` VALUES ('3140', '连南瑶族自治县', '304', '0', '3');
INSERT INTO `tr_area` VALUES ('3141', '连山壮族瑶族自治县', '304', '0', '3');
INSERT INTO `tr_area` VALUES ('3142', '连州市', '304', '0', '3');
INSERT INTO `tr_area` VALUES ('3143', '阳山县', '304', '0', '3');
INSERT INTO `tr_area` VALUES ('3144', '东莞市', '305', '0', '3');
INSERT INTO `tr_area` VALUES ('3145', '中山市', '306', '0', '3');
INSERT INTO `tr_area` VALUES ('3146', '湘桥区', '307', '0', '3');
INSERT INTO `tr_area` VALUES ('3147', '潮安县', '307', '0', '3');
INSERT INTO `tr_area` VALUES ('3148', '饶平县', '307', '0', '3');
INSERT INTO `tr_area` VALUES ('3149', '惠来县', '308', '0', '3');
INSERT INTO `tr_area` VALUES ('3150', '揭东县', '308', '0', '3');
INSERT INTO `tr_area` VALUES ('3151', '揭西县', '308', '0', '3');
INSERT INTO `tr_area` VALUES ('3152', '普宁市', '308', '0', '3');
INSERT INTO `tr_area` VALUES ('3153', '榕城区', '308', '0', '3');
INSERT INTO `tr_area` VALUES ('3154', '云城区', '309', '0', '3');
INSERT INTO `tr_area` VALUES ('3155', '云安县', '309', '0', '3');
INSERT INTO `tr_area` VALUES ('3156', '新兴县', '309', '0', '3');
INSERT INTO `tr_area` VALUES ('3157', '罗定市', '309', '0', '3');
INSERT INTO `tr_area` VALUES ('3158', '郁南县', '309', '0', '3');
INSERT INTO `tr_area` VALUES ('3159', '上林县', '310', '0', '3');
INSERT INTO `tr_area` VALUES ('3160', '兴宁区', '310', '0', '3');
INSERT INTO `tr_area` VALUES ('3161', '宾阳县', '310', '0', '3');
INSERT INTO `tr_area` VALUES ('3162', '横县', '310', '0', '3');
INSERT INTO `tr_area` VALUES ('3163', '武鸣县', '310', '0', '3');
INSERT INTO `tr_area` VALUES ('3164', '江南区', '310', '0', '3');
INSERT INTO `tr_area` VALUES ('3165', '良庆区', '310', '0', '3');
INSERT INTO `tr_area` VALUES ('3166', '西乡塘区', '310', '0', '3');
INSERT INTO `tr_area` VALUES ('3167', '邕宁区', '310', '0', '3');
INSERT INTO `tr_area` VALUES ('3168', '隆安县', '310', '0', '3');
INSERT INTO `tr_area` VALUES ('3169', '青秀区', '310', '0', '3');
INSERT INTO `tr_area` VALUES ('3170', '马山县', '310', '0', '3');
INSERT INTO `tr_area` VALUES ('3171', '三江侗族自治县', '311', '0', '3');
INSERT INTO `tr_area` VALUES ('3172', '城中区', '311', '0', '3');
INSERT INTO `tr_area` VALUES ('3173', '柳北区', '311', '0', '3');
INSERT INTO `tr_area` VALUES ('3174', '柳南区', '311', '0', '3');
INSERT INTO `tr_area` VALUES ('3175', '柳城县', '311', '0', '3');
INSERT INTO `tr_area` VALUES ('3176', '柳江县', '311', '0', '3');
INSERT INTO `tr_area` VALUES ('3177', '融安县', '311', '0', '3');
INSERT INTO `tr_area` VALUES ('3178', '融水苗族自治县', '311', '0', '3');
INSERT INTO `tr_area` VALUES ('3179', '鱼峰区', '311', '0', '3');
INSERT INTO `tr_area` VALUES ('3180', '鹿寨县', '311', '0', '3');
INSERT INTO `tr_area` VALUES ('3181', '七星区', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3182', '临桂县', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3183', '全州县', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3184', '兴安县', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3185', '叠彩区', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3186', '平乐县', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3187', '恭城瑶族自治县', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3188', '永福县', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3189', '灌阳县', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3190', '灵川县', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3191', '秀峰区', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3192', '荔浦县', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3193', '象山区', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3194', '资源县', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3195', '阳朔县', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3196', '雁山区', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3197', '龙胜各族自治县', '312', '0', '3');
INSERT INTO `tr_area` VALUES ('3198', '万秀区', '313', '0', '3');
INSERT INTO `tr_area` VALUES ('3199', '岑溪市', '313', '0', '3');
INSERT INTO `tr_area` VALUES ('3200', '苍梧县', '313', '0', '3');
INSERT INTO `tr_area` VALUES ('3201', '蒙山县', '313', '0', '3');
INSERT INTO `tr_area` VALUES ('3202', '藤县', '313', '0', '3');
INSERT INTO `tr_area` VALUES ('3203', '蝶山区', '313', '0', '3');
INSERT INTO `tr_area` VALUES ('3204', '长洲区', '313', '0', '3');
INSERT INTO `tr_area` VALUES ('3205', '合浦县', '314', '0', '3');
INSERT INTO `tr_area` VALUES ('3206', '海城区', '314', '0', '3');
INSERT INTO `tr_area` VALUES ('3207', '铁山港区', '314', '0', '3');
INSERT INTO `tr_area` VALUES ('3208', '银海区', '314', '0', '3');
INSERT INTO `tr_area` VALUES ('3209', '上思县', '315', '0', '3');
INSERT INTO `tr_area` VALUES ('3210', '东兴市', '315', '0', '3');
INSERT INTO `tr_area` VALUES ('3211', '港口区', '315', '0', '3');
INSERT INTO `tr_area` VALUES ('3212', '防城区', '315', '0', '3');
INSERT INTO `tr_area` VALUES ('3213', '浦北县', '316', '0', '3');
INSERT INTO `tr_area` VALUES ('3214', '灵山县', '316', '0', '3');
INSERT INTO `tr_area` VALUES ('3215', '钦北区', '316', '0', '3');
INSERT INTO `tr_area` VALUES ('3216', '钦南区', '316', '0', '3');
INSERT INTO `tr_area` VALUES ('3217', '平南县', '317', '0', '3');
INSERT INTO `tr_area` VALUES ('3218', '桂平市', '317', '0', '3');
INSERT INTO `tr_area` VALUES ('3219', '港北区', '317', '0', '3');
INSERT INTO `tr_area` VALUES ('3220', '港南区', '317', '0', '3');
INSERT INTO `tr_area` VALUES ('3221', '覃塘区', '317', '0', '3');
INSERT INTO `tr_area` VALUES ('3222', '兴业县', '318', '0', '3');
INSERT INTO `tr_area` VALUES ('3223', '北流市', '318', '0', '3');
INSERT INTO `tr_area` VALUES ('3224', '博白县', '318', '0', '3');
INSERT INTO `tr_area` VALUES ('3225', '容县', '318', '0', '3');
INSERT INTO `tr_area` VALUES ('3226', '玉州区', '318', '0', '3');
INSERT INTO `tr_area` VALUES ('3227', '陆川县', '318', '0', '3');
INSERT INTO `tr_area` VALUES ('3228', '乐业县', '319', '0', '3');
INSERT INTO `tr_area` VALUES ('3229', '凌云县', '319', '0', '3');
INSERT INTO `tr_area` VALUES ('3230', '右江区', '319', '0', '3');
INSERT INTO `tr_area` VALUES ('3231', '平果县', '319', '0', '3');
INSERT INTO `tr_area` VALUES ('3232', '德保县', '319', '0', '3');
INSERT INTO `tr_area` VALUES ('3233', '田东县', '319', '0', '3');
INSERT INTO `tr_area` VALUES ('3234', '田林县', '319', '0', '3');
INSERT INTO `tr_area` VALUES ('3235', '田阳县', '319', '0', '3');
INSERT INTO `tr_area` VALUES ('3236', '西林县', '319', '0', '3');
INSERT INTO `tr_area` VALUES ('3237', '那坡县', '319', '0', '3');
INSERT INTO `tr_area` VALUES ('3238', '隆林各族自治县', '319', '0', '3');
INSERT INTO `tr_area` VALUES ('3239', '靖西县', '319', '0', '3');
INSERT INTO `tr_area` VALUES ('3240', '八步区', '320', '0', '3');
INSERT INTO `tr_area` VALUES ('3241', '富川瑶族自治县', '320', '0', '3');
INSERT INTO `tr_area` VALUES ('3242', '昭平县', '320', '0', '3');
INSERT INTO `tr_area` VALUES ('3243', '钟山县', '320', '0', '3');
INSERT INTO `tr_area` VALUES ('3244', '东兰县', '321', '0', '3');
INSERT INTO `tr_area` VALUES ('3245', '凤山县', '321', '0', '3');
INSERT INTO `tr_area` VALUES ('3246', '南丹县', '321', '0', '3');
INSERT INTO `tr_area` VALUES ('3247', '大化瑶族自治县', '321', '0', '3');
INSERT INTO `tr_area` VALUES ('3248', '天峨县', '321', '0', '3');
INSERT INTO `tr_area` VALUES ('3249', '宜州市', '321', '0', '3');
INSERT INTO `tr_area` VALUES ('3250', '巴马瑶族自治县', '321', '0', '3');
INSERT INTO `tr_area` VALUES ('3251', '环江毛南族自治县', '321', '0', '3');
INSERT INTO `tr_area` VALUES ('3252', '罗城仫佬族自治县', '321', '0', '3');
INSERT INTO `tr_area` VALUES ('3253', '都安瑶族自治县', '321', '0', '3');
INSERT INTO `tr_area` VALUES ('3254', '金城江区', '321', '0', '3');
INSERT INTO `tr_area` VALUES ('3255', '兴宾区', '322', '0', '3');
INSERT INTO `tr_area` VALUES ('3256', '合山市', '322', '0', '3');
INSERT INTO `tr_area` VALUES ('3257', '忻城县', '322', '0', '3');
INSERT INTO `tr_area` VALUES ('3258', '武宣县', '322', '0', '3');
INSERT INTO `tr_area` VALUES ('3259', '象州县', '322', '0', '3');
INSERT INTO `tr_area` VALUES ('3260', '金秀瑶族自治县', '322', '0', '3');
INSERT INTO `tr_area` VALUES ('3261', '凭祥市', '323', '0', '3');
INSERT INTO `tr_area` VALUES ('3262', '大新县', '323', '0', '3');
INSERT INTO `tr_area` VALUES ('3263', '天等县', '323', '0', '3');
INSERT INTO `tr_area` VALUES ('3264', '宁明县', '323', '0', '3');
INSERT INTO `tr_area` VALUES ('3265', '扶绥县', '323', '0', '3');
INSERT INTO `tr_area` VALUES ('3266', '江州区', '323', '0', '3');
INSERT INTO `tr_area` VALUES ('3267', '龙州县', '323', '0', '3');
INSERT INTO `tr_area` VALUES ('3268', '琼山区', '324', '0', '3');
INSERT INTO `tr_area` VALUES ('3269', '秀英区', '324', '0', '3');
INSERT INTO `tr_area` VALUES ('3270', '美兰区', '324', '0', '3');
INSERT INTO `tr_area` VALUES ('3271', '龙华区', '324', '0', '3');
INSERT INTO `tr_area` VALUES ('3272', '三亚市', '325', '0', '3');
INSERT INTO `tr_area` VALUES ('3273', '五指山市', '326', '0', '3');
INSERT INTO `tr_area` VALUES ('3274', '琼海市', '327', '0', '3');
INSERT INTO `tr_area` VALUES ('3275', '儋州市', '328', '0', '3');
INSERT INTO `tr_area` VALUES ('3276', '文昌市', '329', '0', '3');
INSERT INTO `tr_area` VALUES ('3277', '万宁市', '330', '0', '3');
INSERT INTO `tr_area` VALUES ('3278', '东方市', '331', '0', '3');
INSERT INTO `tr_area` VALUES ('3279', '定安县', '332', '0', '3');
INSERT INTO `tr_area` VALUES ('3280', '屯昌县', '333', '0', '3');
INSERT INTO `tr_area` VALUES ('3281', '澄迈县', '334', '0', '3');
INSERT INTO `tr_area` VALUES ('3282', '临高县', '335', '0', '3');
INSERT INTO `tr_area` VALUES ('3283', '白沙黎族自治县', '336', '0', '3');
INSERT INTO `tr_area` VALUES ('3284', '昌江黎族自治县', '337', '0', '3');
INSERT INTO `tr_area` VALUES ('3285', '乐东黎族自治县', '338', '0', '3');
INSERT INTO `tr_area` VALUES ('3286', '陵水黎族自治县', '339', '0', '3');
INSERT INTO `tr_area` VALUES ('3287', '保亭黎族苗族自治县', '340', '0', '3');
INSERT INTO `tr_area` VALUES ('3288', '琼中黎族苗族自治县', '341', '0', '3');
INSERT INTO `tr_area` VALUES ('4209', '双流县', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4210', '大邑县', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4211', '崇州市', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4212', '彭州市', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4213', '成华区', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4214', '新津县', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4215', '新都区', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4216', '武侯区', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4217', '温江区', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4218', '蒲江县', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4219', '邛崃市', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4220', '郫县', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4221', '都江堰市', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4222', '金堂县', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4223', '金牛区', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4224', '锦江区', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4225', '青白江区', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4226', '青羊区', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4227', '龙泉驿区', '385', '0', '3');
INSERT INTO `tr_area` VALUES ('4228', '大安区', '386', '0', '3');
INSERT INTO `tr_area` VALUES ('4229', '富顺县', '386', '0', '3');
INSERT INTO `tr_area` VALUES ('4230', '沿滩区', '386', '0', '3');
INSERT INTO `tr_area` VALUES ('4231', '自流井区', '386', '0', '3');
INSERT INTO `tr_area` VALUES ('4232', '荣县', '386', '0', '3');
INSERT INTO `tr_area` VALUES ('4233', '贡井区', '386', '0', '3');
INSERT INTO `tr_area` VALUES ('4234', '东区', '387', '0', '3');
INSERT INTO `tr_area` VALUES ('4235', '仁和区', '387', '0', '3');
INSERT INTO `tr_area` VALUES ('4236', '盐边县', '387', '0', '3');
INSERT INTO `tr_area` VALUES ('4237', '米易县', '387', '0', '3');
INSERT INTO `tr_area` VALUES ('4238', '西区', '387', '0', '3');
INSERT INTO `tr_area` VALUES ('4239', '叙永县', '388', '0', '3');
INSERT INTO `tr_area` VALUES ('4240', '古蔺县', '388', '0', '3');
INSERT INTO `tr_area` VALUES ('4241', '合江县', '388', '0', '3');
INSERT INTO `tr_area` VALUES ('4242', '江阳区', '388', '0', '3');
INSERT INTO `tr_area` VALUES ('4243', '泸县', '388', '0', '3');
INSERT INTO `tr_area` VALUES ('4244', '纳溪区', '388', '0', '3');
INSERT INTO `tr_area` VALUES ('4245', '龙马潭区', '388', '0', '3');
INSERT INTO `tr_area` VALUES ('4246', '中江县', '389', '0', '3');
INSERT INTO `tr_area` VALUES ('4247', '什邡市', '389', '0', '3');
INSERT INTO `tr_area` VALUES ('4248', '广汉市', '389', '0', '3');
INSERT INTO `tr_area` VALUES ('4249', '旌阳区', '389', '0', '3');
INSERT INTO `tr_area` VALUES ('4250', '绵竹市', '389', '0', '3');
INSERT INTO `tr_area` VALUES ('4251', '罗江县', '389', '0', '3');
INSERT INTO `tr_area` VALUES ('4252', '三台县', '390', '0', '3');
INSERT INTO `tr_area` VALUES ('4253', '北川羌族自治县', '390', '0', '3');
INSERT INTO `tr_area` VALUES ('4254', '安县', '390', '0', '3');
INSERT INTO `tr_area` VALUES ('4255', '平武县', '390', '0', '3');
INSERT INTO `tr_area` VALUES ('4256', '梓潼县', '390', '0', '3');
INSERT INTO `tr_area` VALUES ('4257', '江油市', '390', '0', '3');
INSERT INTO `tr_area` VALUES ('4258', '涪城区', '390', '0', '3');
INSERT INTO `tr_area` VALUES ('4259', '游仙区', '390', '0', '3');
INSERT INTO `tr_area` VALUES ('4260', '盐亭县', '390', '0', '3');
INSERT INTO `tr_area` VALUES ('4261', '元坝区', '391', '0', '3');
INSERT INTO `tr_area` VALUES ('4262', '利州区', '391', '0', '3');
INSERT INTO `tr_area` VALUES ('4263', '剑阁县', '391', '0', '3');
INSERT INTO `tr_area` VALUES ('4264', '旺苍县', '391', '0', '3');
INSERT INTO `tr_area` VALUES ('4265', '朝天区', '391', '0', '3');
INSERT INTO `tr_area` VALUES ('4266', '苍溪县', '391', '0', '3');
INSERT INTO `tr_area` VALUES ('4267', '青川县', '391', '0', '3');
INSERT INTO `tr_area` VALUES ('4268', '大英县', '392', '0', '3');
INSERT INTO `tr_area` VALUES ('4269', '安居区', '392', '0', '3');
INSERT INTO `tr_area` VALUES ('4270', '射洪县', '392', '0', '3');
INSERT INTO `tr_area` VALUES ('4271', '船山区', '392', '0', '3');
INSERT INTO `tr_area` VALUES ('4272', '蓬溪县', '392', '0', '3');
INSERT INTO `tr_area` VALUES ('4273', '东兴区', '393', '0', '3');
INSERT INTO `tr_area` VALUES ('4274', '威远县', '393', '0', '3');
INSERT INTO `tr_area` VALUES ('4275', '市中区', '393', '0', '3');
INSERT INTO `tr_area` VALUES ('4276', '资中县', '393', '0', '3');
INSERT INTO `tr_area` VALUES ('4277', '隆昌县', '393', '0', '3');
INSERT INTO `tr_area` VALUES ('4278', '五通桥区', '394', '0', '3');
INSERT INTO `tr_area` VALUES ('4279', '井研县', '394', '0', '3');
INSERT INTO `tr_area` VALUES ('4280', '夹江县', '394', '0', '3');
INSERT INTO `tr_area` VALUES ('4281', '峨眉山市', '394', '0', '3');
INSERT INTO `tr_area` VALUES ('4282', '峨边彝族自治县', '394', '0', '3');
INSERT INTO `tr_area` VALUES ('4283', '市中区', '394', '0', '3');
INSERT INTO `tr_area` VALUES ('4284', '沐川县', '394', '0', '3');
INSERT INTO `tr_area` VALUES ('4285', '沙湾区', '394', '0', '3');
INSERT INTO `tr_area` VALUES ('4286', '犍为县', '394', '0', '3');
INSERT INTO `tr_area` VALUES ('4287', '金口河区', '394', '0', '3');
INSERT INTO `tr_area` VALUES ('4288', '马边彝族自治县', '394', '0', '3');
INSERT INTO `tr_area` VALUES ('4289', '仪陇县', '395', '0', '3');
INSERT INTO `tr_area` VALUES ('4290', '南充市嘉陵区', '395', '0', '3');
INSERT INTO `tr_area` VALUES ('4291', '南部县', '395', '0', '3');
INSERT INTO `tr_area` VALUES ('4292', '嘉陵区', '395', '0', '3');
INSERT INTO `tr_area` VALUES ('4293', '营山县', '395', '0', '3');
INSERT INTO `tr_area` VALUES ('4294', '蓬安县', '395', '0', '3');
INSERT INTO `tr_area` VALUES ('4295', '西充县', '395', '0', '3');
INSERT INTO `tr_area` VALUES ('4296', '阆中市', '395', '0', '3');
INSERT INTO `tr_area` VALUES ('4297', '顺庆区', '395', '0', '3');
INSERT INTO `tr_area` VALUES ('4298', '高坪区', '395', '0', '3');
INSERT INTO `tr_area` VALUES ('4299', '东坡区', '396', '0', '3');
INSERT INTO `tr_area` VALUES ('4300', '丹棱县', '396', '0', '3');
INSERT INTO `tr_area` VALUES ('4301', '仁寿县', '396', '0', '3');
INSERT INTO `tr_area` VALUES ('4302', '彭山县', '396', '0', '3');
INSERT INTO `tr_area` VALUES ('4303', '洪雅县', '396', '0', '3');
INSERT INTO `tr_area` VALUES ('4304', '青神县', '396', '0', '3');
INSERT INTO `tr_area` VALUES ('4305', '兴文县', '397', '0', '3');
INSERT INTO `tr_area` VALUES ('4306', '南溪县', '397', '0', '3');
INSERT INTO `tr_area` VALUES ('4307', '宜宾县', '397', '0', '3');
INSERT INTO `tr_area` VALUES ('4308', '屏山县', '397', '0', '3');
INSERT INTO `tr_area` VALUES ('4309', '江安县', '397', '0', '3');
INSERT INTO `tr_area` VALUES ('4310', '珙县', '397', '0', '3');
INSERT INTO `tr_area` VALUES ('4311', '筠连县', '397', '0', '3');
INSERT INTO `tr_area` VALUES ('4312', '翠屏区', '397', '0', '3');
INSERT INTO `tr_area` VALUES ('4313', '长宁县', '397', '0', '3');
INSERT INTO `tr_area` VALUES ('4314', '高县', '397', '0', '3');
INSERT INTO `tr_area` VALUES ('4315', '华蓥市', '398', '0', '3');
INSERT INTO `tr_area` VALUES ('4316', '岳池县', '398', '0', '3');
INSERT INTO `tr_area` VALUES ('4317', '广安区', '398', '0', '3');
INSERT INTO `tr_area` VALUES ('4318', '武胜县', '398', '0', '3');
INSERT INTO `tr_area` VALUES ('4319', '邻水县', '398', '0', '3');
INSERT INTO `tr_area` VALUES ('4320', '万源市', '399', '0', '3');
INSERT INTO `tr_area` VALUES ('4321', '大竹县', '399', '0', '3');
INSERT INTO `tr_area` VALUES ('4322', '宣汉县', '399', '0', '3');
INSERT INTO `tr_area` VALUES ('4323', '开江县', '399', '0', '3');
INSERT INTO `tr_area` VALUES ('4324', '渠县', '399', '0', '3');
INSERT INTO `tr_area` VALUES ('4325', '达县', '399', '0', '3');
INSERT INTO `tr_area` VALUES ('4326', '通川区', '399', '0', '3');
INSERT INTO `tr_area` VALUES ('4327', '名山县', '400', '0', '3');
INSERT INTO `tr_area` VALUES ('4328', '天全县', '400', '0', '3');
INSERT INTO `tr_area` VALUES ('4329', '宝兴县', '400', '0', '3');
INSERT INTO `tr_area` VALUES ('4330', '汉源县', '400', '0', '3');
INSERT INTO `tr_area` VALUES ('4331', '石棉县', '400', '0', '3');
INSERT INTO `tr_area` VALUES ('4332', '芦山县', '400', '0', '3');
INSERT INTO `tr_area` VALUES ('4333', '荥经县', '400', '0', '3');
INSERT INTO `tr_area` VALUES ('4334', '雨城区', '400', '0', '3');
INSERT INTO `tr_area` VALUES ('4335', '南江县', '401', '0', '3');
INSERT INTO `tr_area` VALUES ('4336', '巴州区', '401', '0', '3');
INSERT INTO `tr_area` VALUES ('4337', '平昌县', '401', '0', '3');
INSERT INTO `tr_area` VALUES ('4338', '通江县', '401', '0', '3');
INSERT INTO `tr_area` VALUES ('4339', '乐至县', '402', '0', '3');
INSERT INTO `tr_area` VALUES ('4340', '安岳县', '402', '0', '3');
INSERT INTO `tr_area` VALUES ('4341', '简阳市', '402', '0', '3');
INSERT INTO `tr_area` VALUES ('4342', '雁江区', '402', '0', '3');
INSERT INTO `tr_area` VALUES ('4343', '九寨沟县', '403', '0', '3');
INSERT INTO `tr_area` VALUES ('4344', '壤塘县', '403', '0', '3');
INSERT INTO `tr_area` VALUES ('4345', '小金县', '403', '0', '3');
INSERT INTO `tr_area` VALUES ('4346', '松潘县', '403', '0', '3');
INSERT INTO `tr_area` VALUES ('4347', '汶川县', '403', '0', '3');
INSERT INTO `tr_area` VALUES ('4348', '理县', '403', '0', '3');
INSERT INTO `tr_area` VALUES ('4349', '红原县', '403', '0', '3');
INSERT INTO `tr_area` VALUES ('4350', '若尔盖县', '403', '0', '3');
INSERT INTO `tr_area` VALUES ('4351', '茂县', '403', '0', '3');
INSERT INTO `tr_area` VALUES ('4352', '金川县', '403', '0', '3');
INSERT INTO `tr_area` VALUES ('4353', '阿坝县', '403', '0', '3');
INSERT INTO `tr_area` VALUES ('4354', '马尔康县', '403', '0', '3');
INSERT INTO `tr_area` VALUES ('4355', '黑水县', '403', '0', '3');
INSERT INTO `tr_area` VALUES ('4356', '丹巴县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4357', '乡城县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4358', '巴塘县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4359', '康定县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4360', '得荣县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4361', '德格县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4362', '新龙县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4363', '泸定县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4364', '炉霍县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4365', '理塘县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4366', '甘孜县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4367', '白玉县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4368', '石渠县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4369', '稻城县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4370', '色达县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4371', '道孚县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4372', '雅江县', '404', '0', '3');
INSERT INTO `tr_area` VALUES ('4373', '会东县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4374', '会理县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4375', '冕宁县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4376', '喜德县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4377', '宁南县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4378', '布拖县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4379', '德昌县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4380', '昭觉县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4381', '普格县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4382', '木里藏族自治县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4383', '甘洛县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4384', '盐源县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4385', '美姑县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4386', '西昌', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4387', '越西县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4388', '金阳县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4389', '雷波县', '405', '0', '3');
INSERT INTO `tr_area` VALUES ('4390', '乌当区', '406', '0', '3');
INSERT INTO `tr_area` VALUES ('4391', '云岩区', '406', '0', '3');
INSERT INTO `tr_area` VALUES ('4392', '修文县', '406', '0', '3');
INSERT INTO `tr_area` VALUES ('4393', '南明区', '406', '0', '3');
INSERT INTO `tr_area` VALUES ('4394', '小河区', '406', '0', '3');
INSERT INTO `tr_area` VALUES ('4395', '开阳县', '406', '0', '3');
INSERT INTO `tr_area` VALUES ('4396', '息烽县', '406', '0', '3');
INSERT INTO `tr_area` VALUES ('4397', '清镇市', '406', '0', '3');
INSERT INTO `tr_area` VALUES ('4398', '白云区', '406', '0', '3');
INSERT INTO `tr_area` VALUES ('4399', '花溪区', '406', '0', '3');
INSERT INTO `tr_area` VALUES ('4400', '六枝特区', '407', '0', '3');
INSERT INTO `tr_area` VALUES ('4401', '水城县', '407', '0', '3');
INSERT INTO `tr_area` VALUES ('4402', '盘县', '407', '0', '3');
INSERT INTO `tr_area` VALUES ('4403', '钟山区', '407', '0', '3');
INSERT INTO `tr_area` VALUES ('4404', '习水县', '408', '0', '3');
INSERT INTO `tr_area` VALUES ('4405', '仁怀市', '408', '0', '3');
INSERT INTO `tr_area` VALUES ('4406', '余庆县', '408', '0', '3');
INSERT INTO `tr_area` VALUES ('4407', '凤冈县', '408', '0', '3');
INSERT INTO `tr_area` VALUES ('4408', '务川仡佬族苗族自治县', '408', '0', '3');
INSERT INTO `tr_area` VALUES ('4409', '桐梓县', '408', '0', '3');
INSERT INTO `tr_area` VALUES ('4410', '正安县', '408', '0', '3');
INSERT INTO `tr_area` VALUES ('4411', '汇川区', '408', '0', '3');
INSERT INTO `tr_area` VALUES ('4412', '湄潭县', '408', '0', '3');
INSERT INTO `tr_area` VALUES ('4413', '红花岗区', '408', '0', '3');
INSERT INTO `tr_area` VALUES ('4414', '绥阳县', '408', '0', '3');
INSERT INTO `tr_area` VALUES ('4415', '赤水市', '408', '0', '3');
INSERT INTO `tr_area` VALUES ('4416', '道真仡佬族苗族自治县', '408', '0', '3');
INSERT INTO `tr_area` VALUES ('4417', '遵义县', '408', '0', '3');
INSERT INTO `tr_area` VALUES ('4418', '关岭布依族苗族自治县', '409', '0', '3');
INSERT INTO `tr_area` VALUES ('4419', '平坝县', '409', '0', '3');
INSERT INTO `tr_area` VALUES ('4420', '普定县', '409', '0', '3');
INSERT INTO `tr_area` VALUES ('4421', '紫云苗族布依族自治县', '409', '0', '3');
INSERT INTO `tr_area` VALUES ('4422', '西秀区', '409', '0', '3');
INSERT INTO `tr_area` VALUES ('4423', '镇宁布依族苗族自治县', '409', '0', '3');
INSERT INTO `tr_area` VALUES ('4424', '万山特区', '410', '0', '3');
INSERT INTO `tr_area` VALUES ('4425', '印江土家族苗族自治县', '410', '0', '3');
INSERT INTO `tr_area` VALUES ('4426', '德江县', '410', '0', '3');
INSERT INTO `tr_area` VALUES ('4427', '思南县', '410', '0', '3');
INSERT INTO `tr_area` VALUES ('4428', '松桃苗族自治县', '410', '0', '3');
INSERT INTO `tr_area` VALUES ('4429', '江口县', '410', '0', '3');
INSERT INTO `tr_area` VALUES ('4430', '沿河土家族自治县', '410', '0', '3');
INSERT INTO `tr_area` VALUES ('4431', '玉屏侗族自治县', '410', '0', '3');
INSERT INTO `tr_area` VALUES ('4432', '石阡县', '410', '0', '3');
INSERT INTO `tr_area` VALUES ('4433', '铜仁市', '410', '0', '3');
INSERT INTO `tr_area` VALUES ('4434', '兴义市', '411', '0', '3');
INSERT INTO `tr_area` VALUES ('4435', '兴仁县', '411', '0', '3');
INSERT INTO `tr_area` VALUES ('4436', '册亨县', '411', '0', '3');
INSERT INTO `tr_area` VALUES ('4437', '安龙县', '411', '0', '3');
INSERT INTO `tr_area` VALUES ('4438', '普安县', '411', '0', '3');
INSERT INTO `tr_area` VALUES ('4439', '晴隆县', '411', '0', '3');
INSERT INTO `tr_area` VALUES ('4440', '望谟县', '411', '0', '3');
INSERT INTO `tr_area` VALUES ('4441', '贞丰县', '411', '0', '3');
INSERT INTO `tr_area` VALUES ('4442', '大方县', '412', '0', '3');
INSERT INTO `tr_area` VALUES ('4443', '威宁彝族回族苗族自治县', '412', '0', '3');
INSERT INTO `tr_area` VALUES ('4444', '毕节市', '412', '0', '3');
INSERT INTO `tr_area` VALUES ('4445', '纳雍县', '412', '0', '3');
INSERT INTO `tr_area` VALUES ('4446', '织金县', '412', '0', '3');
INSERT INTO `tr_area` VALUES ('4447', '赫章县', '412', '0', '3');
INSERT INTO `tr_area` VALUES ('4448', '金沙县', '412', '0', '3');
INSERT INTO `tr_area` VALUES ('4449', '黔西县', '412', '0', '3');
INSERT INTO `tr_area` VALUES ('4450', '三穗县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4451', '丹寨县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4452', '从江县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4453', '凯里市', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4454', '剑河县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4455', '台江县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4456', '天柱县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4457', '岑巩县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4458', '施秉县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4459', '榕江县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4460', '锦屏县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4461', '镇远县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4462', '雷山县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4463', '麻江县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4464', '黄平县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4465', '黎平县', '413', '0', '3');
INSERT INTO `tr_area` VALUES ('4466', '三都水族自治县', '414', '0', '3');
INSERT INTO `tr_area` VALUES ('4467', '平塘县', '414', '0', '3');
INSERT INTO `tr_area` VALUES ('4468', '惠水县', '414', '0', '3');
INSERT INTO `tr_area` VALUES ('4469', '独山县', '414', '0', '3');
INSERT INTO `tr_area` VALUES ('4470', '瓮安县', '414', '0', '3');
INSERT INTO `tr_area` VALUES ('4471', '福泉市', '414', '0', '3');
INSERT INTO `tr_area` VALUES ('4472', '罗甸县', '414', '0', '3');
INSERT INTO `tr_area` VALUES ('4473', '荔波县', '414', '0', '3');
INSERT INTO `tr_area` VALUES ('4474', '贵定县', '414', '0', '3');
INSERT INTO `tr_area` VALUES ('4475', '都匀市', '414', '0', '3');
INSERT INTO `tr_area` VALUES ('4476', '长顺县', '414', '0', '3');
INSERT INTO `tr_area` VALUES ('4477', '龙里县', '414', '0', '3');
INSERT INTO `tr_area` VALUES ('4478', '东川区', '415', '0', '3');
INSERT INTO `tr_area` VALUES ('4479', '五华区', '415', '0', '3');
INSERT INTO `tr_area` VALUES ('4480', '呈贡县', '415', '0', '3');
INSERT INTO `tr_area` VALUES ('4481', '安宁市', '415', '0', '3');
INSERT INTO `tr_area` VALUES ('4482', '官渡区', '415', '0', '3');
INSERT INTO `tr_area` VALUES ('4483', '宜良县', '415', '0', '3');
INSERT INTO `tr_area` VALUES ('4484', '富民县', '415', '0', '3');
INSERT INTO `tr_area` VALUES ('4485', '寻甸回族彝族自治县', '415', '0', '3');
INSERT INTO `tr_area` VALUES ('4486', '嵩明县', '415', '0', '3');
INSERT INTO `tr_area` VALUES ('4487', '晋宁县', '415', '0', '3');
INSERT INTO `tr_area` VALUES ('4488', '盘龙区', '415', '0', '3');
INSERT INTO `tr_area` VALUES ('4489', '石林彝族自治县', '415', '0', '3');
INSERT INTO `tr_area` VALUES ('4490', '禄劝彝族苗族自治县', '415', '0', '3');
INSERT INTO `tr_area` VALUES ('4491', '西山区', '415', '0', '3');
INSERT INTO `tr_area` VALUES ('4492', '会泽县', '416', '0', '3');
INSERT INTO `tr_area` VALUES ('4493', '宣威市', '416', '0', '3');
INSERT INTO `tr_area` VALUES ('4494', '富源县', '416', '0', '3');
INSERT INTO `tr_area` VALUES ('4495', '师宗县', '416', '0', '3');
INSERT INTO `tr_area` VALUES ('4496', '沾益县', '416', '0', '3');
INSERT INTO `tr_area` VALUES ('4497', '罗平县', '416', '0', '3');
INSERT INTO `tr_area` VALUES ('4498', '陆良县', '416', '0', '3');
INSERT INTO `tr_area` VALUES ('4499', '马龙县', '416', '0', '3');
INSERT INTO `tr_area` VALUES ('4500', '麒麟区', '416', '0', '3');
INSERT INTO `tr_area` VALUES ('4501', '元江哈尼族彝族傣族自治县', '417', '0', '3');
INSERT INTO `tr_area` VALUES ('4502', '华宁县', '417', '0', '3');
INSERT INTO `tr_area` VALUES ('4503', '峨山彝族自治县', '417', '0', '3');
INSERT INTO `tr_area` VALUES ('4504', '新平彝族傣族自治县', '417', '0', '3');
INSERT INTO `tr_area` VALUES ('4505', '易门县', '417', '0', '3');
INSERT INTO `tr_area` VALUES ('4506', '江川县', '417', '0', '3');
INSERT INTO `tr_area` VALUES ('4507', '澄江县', '417', '0', '3');
INSERT INTO `tr_area` VALUES ('4508', '红塔区', '417', '0', '3');
INSERT INTO `tr_area` VALUES ('4509', '通海县', '417', '0', '3');
INSERT INTO `tr_area` VALUES ('4510', '施甸县', '418', '0', '3');
INSERT INTO `tr_area` VALUES ('4511', '昌宁县', '418', '0', '3');
INSERT INTO `tr_area` VALUES ('4512', '腾冲县', '418', '0', '3');
INSERT INTO `tr_area` VALUES ('4513', '隆阳区', '418', '0', '3');
INSERT INTO `tr_area` VALUES ('4514', '龙陵县', '418', '0', '3');
INSERT INTO `tr_area` VALUES ('4515', '大关县', '419', '0', '3');
INSERT INTO `tr_area` VALUES ('4516', '威信县', '419', '0', '3');
INSERT INTO `tr_area` VALUES ('4517', '巧家县', '419', '0', '3');
INSERT INTO `tr_area` VALUES ('4518', '彝良县', '419', '0', '3');
INSERT INTO `tr_area` VALUES ('4519', '昭阳区', '419', '0', '3');
INSERT INTO `tr_area` VALUES ('4520', '水富县', '419', '0', '3');
INSERT INTO `tr_area` VALUES ('4521', '永善县', '419', '0', '3');
INSERT INTO `tr_area` VALUES ('4522', '盐津县', '419', '0', '3');
INSERT INTO `tr_area` VALUES ('4523', '绥江县', '419', '0', '3');
INSERT INTO `tr_area` VALUES ('4524', '镇雄县', '419', '0', '3');
INSERT INTO `tr_area` VALUES ('4525', '鲁甸县', '419', '0', '3');
INSERT INTO `tr_area` VALUES ('4526', '华坪县', '420', '0', '3');
INSERT INTO `tr_area` VALUES ('4527', '古城区', '420', '0', '3');
INSERT INTO `tr_area` VALUES ('4528', '宁蒗彝族自治县', '420', '0', '3');
INSERT INTO `tr_area` VALUES ('4529', '永胜县', '420', '0', '3');
INSERT INTO `tr_area` VALUES ('4530', '玉龙纳西族自治县', '420', '0', '3');
INSERT INTO `tr_area` VALUES ('4531', '临翔区', '422', '0', '3');
INSERT INTO `tr_area` VALUES ('4532', '云县', '422', '0', '3');
INSERT INTO `tr_area` VALUES ('4533', '凤庆县', '422', '0', '3');
INSERT INTO `tr_area` VALUES ('4534', '双江拉祜族佤族布朗族傣族自治县', '422', '0', '3');
INSERT INTO `tr_area` VALUES ('4535', '永德县', '422', '0', '3');
INSERT INTO `tr_area` VALUES ('4536', '沧源佤族自治县', '422', '0', '3');
INSERT INTO `tr_area` VALUES ('4537', '耿马傣族佤族自治县', '422', '0', '3');
INSERT INTO `tr_area` VALUES ('4538', '镇康县', '422', '0', '3');
INSERT INTO `tr_area` VALUES ('4539', '元谋县', '423', '0', '3');
INSERT INTO `tr_area` VALUES ('4540', '南华县', '423', '0', '3');
INSERT INTO `tr_area` VALUES ('4541', '双柏县', '423', '0', '3');
INSERT INTO `tr_area` VALUES ('4542', '大姚县', '423', '0', '3');
INSERT INTO `tr_area` VALUES ('4543', '姚安县', '423', '0', '3');
INSERT INTO `tr_area` VALUES ('4544', '楚雄市', '423', '0', '3');
INSERT INTO `tr_area` VALUES ('4545', '武定县', '423', '0', '3');
INSERT INTO `tr_area` VALUES ('4546', '永仁县', '423', '0', '3');
INSERT INTO `tr_area` VALUES ('4547', '牟定县', '423', '0', '3');
INSERT INTO `tr_area` VALUES ('4548', '禄丰县', '423', '0', '3');
INSERT INTO `tr_area` VALUES ('4549', '个旧市', '424', '0', '3');
INSERT INTO `tr_area` VALUES ('4550', '元阳县', '424', '0', '3');
INSERT INTO `tr_area` VALUES ('4551', '屏边苗族自治县', '424', '0', '3');
INSERT INTO `tr_area` VALUES ('4552', '建水县', '424', '0', '3');
INSERT INTO `tr_area` VALUES ('4553', '开远市', '424', '0', '3');
INSERT INTO `tr_area` VALUES ('4554', '弥勒县', '424', '0', '3');
INSERT INTO `tr_area` VALUES ('4555', '河口瑶族自治县', '424', '0', '3');
INSERT INTO `tr_area` VALUES ('4556', '泸西县', '424', '0', '3');
INSERT INTO `tr_area` VALUES ('4557', '石屏县', '424', '0', '3');
INSERT INTO `tr_area` VALUES ('4558', '红河县', '424', '0', '3');
INSERT INTO `tr_area` VALUES ('4559', '绿春县', '424', '0', '3');
INSERT INTO `tr_area` VALUES ('4560', '蒙自县', '424', '0', '3');
INSERT INTO `tr_area` VALUES ('4561', '金平苗族瑶族傣族自治县', '424', '0', '3');
INSERT INTO `tr_area` VALUES ('4562', '丘北县', '425', '0', '3');
INSERT INTO `tr_area` VALUES ('4563', '富宁县', '425', '0', '3');
INSERT INTO `tr_area` VALUES ('4564', '广南县', '425', '0', '3');
INSERT INTO `tr_area` VALUES ('4565', '文山县', '425', '0', '3');
INSERT INTO `tr_area` VALUES ('4566', '砚山县', '425', '0', '3');
INSERT INTO `tr_area` VALUES ('4567', '西畴县', '425', '0', '3');
INSERT INTO `tr_area` VALUES ('4568', '马关县', '425', '0', '3');
INSERT INTO `tr_area` VALUES ('4569', '麻栗坡县', '425', '0', '3');
INSERT INTO `tr_area` VALUES ('4570', '勐海县', '426', '0', '3');
INSERT INTO `tr_area` VALUES ('4571', '勐腊县', '426', '0', '3');
INSERT INTO `tr_area` VALUES ('4572', '景洪市', '426', '0', '3');
INSERT INTO `tr_area` VALUES ('4573', '云龙县', '427', '0', '3');
INSERT INTO `tr_area` VALUES ('4574', '剑川县', '427', '0', '3');
INSERT INTO `tr_area` VALUES ('4575', '南涧彝族自治县', '427', '0', '3');
INSERT INTO `tr_area` VALUES ('4576', '大理市', '427', '0', '3');
INSERT INTO `tr_area` VALUES ('4577', '宾川县', '427', '0', '3');
INSERT INTO `tr_area` VALUES ('4578', '巍山彝族回族自治县', '427', '0', '3');
INSERT INTO `tr_area` VALUES ('4579', '弥渡县', '427', '0', '3');
INSERT INTO `tr_area` VALUES ('4580', '永平县', '427', '0', '3');
INSERT INTO `tr_area` VALUES ('4581', '洱源县', '427', '0', '3');
INSERT INTO `tr_area` VALUES ('4582', '漾濞彝族自治县', '427', '0', '3');
INSERT INTO `tr_area` VALUES ('4583', '祥云县', '427', '0', '3');
INSERT INTO `tr_area` VALUES ('4584', '鹤庆县', '427', '0', '3');
INSERT INTO `tr_area` VALUES ('4585', '梁河县', '428', '0', '3');
INSERT INTO `tr_area` VALUES ('4586', '潞西市', '428', '0', '3');
INSERT INTO `tr_area` VALUES ('4587', '瑞丽市', '428', '0', '3');
INSERT INTO `tr_area` VALUES ('4588', '盈江县', '428', '0', '3');
INSERT INTO `tr_area` VALUES ('4589', '陇川县', '428', '0', '3');
INSERT INTO `tr_area` VALUES ('4590', '德钦县', '430', '0', '3');
INSERT INTO `tr_area` VALUES ('4591', '维西傈僳族自治县', '430', '0', '3');
INSERT INTO `tr_area` VALUES ('4592', '香格里拉县', '430', '0', '3');
INSERT INTO `tr_area` VALUES ('4593', '城关区', '431', '0', '3');
INSERT INTO `tr_area` VALUES ('4594', '堆龙德庆县', '431', '0', '3');
INSERT INTO `tr_area` VALUES ('4595', '墨竹工卡县', '431', '0', '3');
INSERT INTO `tr_area` VALUES ('4596', '尼木县', '431', '0', '3');
INSERT INTO `tr_area` VALUES ('4597', '当雄县', '431', '0', '3');
INSERT INTO `tr_area` VALUES ('4598', '曲水县', '431', '0', '3');
INSERT INTO `tr_area` VALUES ('4599', '林周县', '431', '0', '3');
INSERT INTO `tr_area` VALUES ('4600', '达孜县', '431', '0', '3');
INSERT INTO `tr_area` VALUES ('4601', '丁青县', '432', '0', '3');
INSERT INTO `tr_area` VALUES ('4602', '八宿县', '432', '0', '3');
INSERT INTO `tr_area` VALUES ('4603', '察雅县', '432', '0', '3');
INSERT INTO `tr_area` VALUES ('4604', '左贡县', '432', '0', '3');
INSERT INTO `tr_area` VALUES ('4605', '昌都县', '432', '0', '3');
INSERT INTO `tr_area` VALUES ('4606', '江达县', '432', '0', '3');
INSERT INTO `tr_area` VALUES ('4607', '洛隆县', '432', '0', '3');
INSERT INTO `tr_area` VALUES ('4608', '类乌齐县', '432', '0', '3');
INSERT INTO `tr_area` VALUES ('4609', '芒康县', '432', '0', '3');
INSERT INTO `tr_area` VALUES ('4610', '贡觉县', '432', '0', '3');
INSERT INTO `tr_area` VALUES ('4611', '边坝县', '432', '0', '3');
INSERT INTO `tr_area` VALUES ('4612', '乃东县', '433', '0', '3');
INSERT INTO `tr_area` VALUES ('4613', '加查县', '433', '0', '3');
INSERT INTO `tr_area` VALUES ('4614', '扎囊县', '433', '0', '3');
INSERT INTO `tr_area` VALUES ('4615', '措美县', '433', '0', '3');
INSERT INTO `tr_area` VALUES ('4616', '曲松县', '433', '0', '3');
INSERT INTO `tr_area` VALUES ('4617', '桑日县', '433', '0', '3');
INSERT INTO `tr_area` VALUES ('4618', '洛扎县', '433', '0', '3');
INSERT INTO `tr_area` VALUES ('4619', '浪卡子县', '433', '0', '3');
INSERT INTO `tr_area` VALUES ('4620', '琼结县', '433', '0', '3');
INSERT INTO `tr_area` VALUES ('4621', '贡嘎县', '433', '0', '3');
INSERT INTO `tr_area` VALUES ('4622', '错那县', '433', '0', '3');
INSERT INTO `tr_area` VALUES ('4623', '隆子县', '433', '0', '3');
INSERT INTO `tr_area` VALUES ('4624', '亚东县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4625', '仁布县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4626', '仲巴县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4627', '南木林县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4628', '吉隆县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4629', '定日县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4630', '定结县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4631', '岗巴县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4632', '康马县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4633', '拉孜县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4634', '日喀则市', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4635', '昂仁县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4636', '江孜县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4637', '白朗县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4638', '聂拉木县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4639', '萨嘎县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4640', '萨迦县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4641', '谢通门县', '434', '0', '3');
INSERT INTO `tr_area` VALUES ('4642', '嘉黎县', '435', '0', '3');
INSERT INTO `tr_area` VALUES ('4643', '安多县', '435', '0', '3');
INSERT INTO `tr_area` VALUES ('4644', '尼玛县', '435', '0', '3');
INSERT INTO `tr_area` VALUES ('4645', '巴青县', '435', '0', '3');
INSERT INTO `tr_area` VALUES ('4646', '比如县', '435', '0', '3');
INSERT INTO `tr_area` VALUES ('4647', '班戈县', '435', '0', '3');
INSERT INTO `tr_area` VALUES ('4648', '申扎县', '435', '0', '3');
INSERT INTO `tr_area` VALUES ('4649', '索县', '435', '0', '3');
INSERT INTO `tr_area` VALUES ('4650', '聂荣县', '435', '0', '3');
INSERT INTO `tr_area` VALUES ('4651', '那曲县', '435', '0', '3');
INSERT INTO `tr_area` VALUES ('4652', '噶尔县', '436', '0', '3');
INSERT INTO `tr_area` VALUES ('4653', '措勤县', '436', '0', '3');
INSERT INTO `tr_area` VALUES ('4654', '改则县', '436', '0', '3');
INSERT INTO `tr_area` VALUES ('4655', '日土县', '436', '0', '3');
INSERT INTO `tr_area` VALUES ('4656', '普兰县', '436', '0', '3');
INSERT INTO `tr_area` VALUES ('4657', '札达县', '436', '0', '3');
INSERT INTO `tr_area` VALUES ('4658', '革吉县', '436', '0', '3');
INSERT INTO `tr_area` VALUES ('4659', '墨脱县', '437', '0', '3');
INSERT INTO `tr_area` VALUES ('4660', '察隅县', '437', '0', '3');
INSERT INTO `tr_area` VALUES ('4661', '工布江达县', '437', '0', '3');
INSERT INTO `tr_area` VALUES ('4662', '朗县', '437', '0', '3');
INSERT INTO `tr_area` VALUES ('4663', '林芝县', '437', '0', '3');
INSERT INTO `tr_area` VALUES ('4664', '波密县', '437', '0', '3');
INSERT INTO `tr_area` VALUES ('4665', '米林县', '437', '0', '3');
INSERT INTO `tr_area` VALUES ('4666', '临潼区', '438', '0', '3');
INSERT INTO `tr_area` VALUES ('4667', '周至县', '438', '0', '3');
INSERT INTO `tr_area` VALUES ('4668', '户县', '438', '0', '3');
INSERT INTO `tr_area` VALUES ('4669', '新城区', '438', '0', '3');
INSERT INTO `tr_area` VALUES ('4670', '未央区', '438', '0', '3');
INSERT INTO `tr_area` VALUES ('4671', '灞桥区', '438', '0', '3');
INSERT INTO `tr_area` VALUES ('4672', '碑林区', '438', '0', '3');
INSERT INTO `tr_area` VALUES ('4673', '莲湖区', '438', '0', '3');
INSERT INTO `tr_area` VALUES ('4674', '蓝田县', '438', '0', '3');
INSERT INTO `tr_area` VALUES ('4675', '长安区', '438', '0', '3');
INSERT INTO `tr_area` VALUES ('4676', '阎良区', '438', '0', '3');
INSERT INTO `tr_area` VALUES ('4677', '雁塔区', '438', '0', '3');
INSERT INTO `tr_area` VALUES ('4678', '高陵县', '438', '0', '3');
INSERT INTO `tr_area` VALUES ('4679', '印台区', '439', '0', '3');
INSERT INTO `tr_area` VALUES ('4680', '宜君县', '439', '0', '3');
INSERT INTO `tr_area` VALUES ('4681', '王益区', '439', '0', '3');
INSERT INTO `tr_area` VALUES ('4682', '耀州区', '439', '0', '3');
INSERT INTO `tr_area` VALUES ('4683', '凤县', '440', '0', '3');
INSERT INTO `tr_area` VALUES ('4684', '凤翔县', '440', '0', '3');
INSERT INTO `tr_area` VALUES ('4685', '千阳县', '440', '0', '3');
INSERT INTO `tr_area` VALUES ('4686', '太白县', '440', '0', '3');
INSERT INTO `tr_area` VALUES ('4687', '岐山县', '440', '0', '3');
INSERT INTO `tr_area` VALUES ('4688', '扶风县', '440', '0', '3');
INSERT INTO `tr_area` VALUES ('4689', '渭滨区', '440', '0', '3');
INSERT INTO `tr_area` VALUES ('4690', '眉县', '440', '0', '3');
INSERT INTO `tr_area` VALUES ('4691', '金台区', '440', '0', '3');
INSERT INTO `tr_area` VALUES ('4692', '陇县', '440', '0', '3');
INSERT INTO `tr_area` VALUES ('4693', '陈仓区', '440', '0', '3');
INSERT INTO `tr_area` VALUES ('4694', '麟游县', '440', '0', '3');
INSERT INTO `tr_area` VALUES ('4695', '三原县', '441', '0', '3');
INSERT INTO `tr_area` VALUES ('4696', '干县', '441', '0', '3');
INSERT INTO `tr_area` VALUES ('4697', '兴平市', '441', '0', '3');
INSERT INTO `tr_area` VALUES ('4698', '彬县', '441', '0', '3');
INSERT INTO `tr_area` VALUES ('4699', '旬邑县', '441', '0', '3');
INSERT INTO `tr_area` VALUES ('4700', '杨陵区', '441', '0', '3');
INSERT INTO `tr_area` VALUES ('4701', '武功县', '441', '0', '3');
INSERT INTO `tr_area` VALUES ('4702', '永寿县', '441', '0', '3');
INSERT INTO `tr_area` VALUES ('4703', '泾阳县', '441', '0', '3');
INSERT INTO `tr_area` VALUES ('4704', '淳化县', '441', '0', '3');
INSERT INTO `tr_area` VALUES ('4705', '渭城区', '441', '0', '3');
INSERT INTO `tr_area` VALUES ('4706', '礼泉县', '441', '0', '3');
INSERT INTO `tr_area` VALUES ('4707', '秦都区', '441', '0', '3');
INSERT INTO `tr_area` VALUES ('4708', '长武县', '441', '0', '3');
INSERT INTO `tr_area` VALUES ('4709', '临渭区', '442', '0', '3');
INSERT INTO `tr_area` VALUES ('4710', '华县', '442', '0', '3');
INSERT INTO `tr_area` VALUES ('4711', '华阴市', '442', '0', '3');
INSERT INTO `tr_area` VALUES ('4712', '合阳县', '442', '0', '3');
INSERT INTO `tr_area` VALUES ('4713', '大荔县', '442', '0', '3');
INSERT INTO `tr_area` VALUES ('4714', '富平县', '442', '0', '3');
INSERT INTO `tr_area` VALUES ('4715', '潼关县', '442', '0', '3');
INSERT INTO `tr_area` VALUES ('4716', '澄城县', '442', '0', '3');
INSERT INTO `tr_area` VALUES ('4717', '白水县', '442', '0', '3');
INSERT INTO `tr_area` VALUES ('4718', '蒲城县', '442', '0', '3');
INSERT INTO `tr_area` VALUES ('4719', '韩城市', '442', '0', '3');
INSERT INTO `tr_area` VALUES ('4720', '吴起县', '443', '0', '3');
INSERT INTO `tr_area` VALUES ('4721', '子长县', '443', '0', '3');
INSERT INTO `tr_area` VALUES ('4722', '安塞县', '443', '0', '3');
INSERT INTO `tr_area` VALUES ('4723', '宜川县', '443', '0', '3');
INSERT INTO `tr_area` VALUES ('4724', '宝塔区', '443', '0', '3');
INSERT INTO `tr_area` VALUES ('4725', '富县', '443', '0', '3');
INSERT INTO `tr_area` VALUES ('4726', '延川县', '443', '0', '3');
INSERT INTO `tr_area` VALUES ('4727', '延长县', '443', '0', '3');
INSERT INTO `tr_area` VALUES ('4728', '志丹县', '443', '0', '3');
INSERT INTO `tr_area` VALUES ('4729', '洛川县', '443', '0', '3');
INSERT INTO `tr_area` VALUES ('4730', '甘泉县', '443', '0', '3');
INSERT INTO `tr_area` VALUES ('4731', '黄陵县', '443', '0', '3');
INSERT INTO `tr_area` VALUES ('4732', '黄龙县', '443', '0', '3');
INSERT INTO `tr_area` VALUES ('4733', '佛坪县', '444', '0', '3');
INSERT INTO `tr_area` VALUES ('4734', '勉县', '444', '0', '3');
INSERT INTO `tr_area` VALUES ('4735', '南郑县', '444', '0', '3');
INSERT INTO `tr_area` VALUES ('4736', '城固县', '444', '0', '3');
INSERT INTO `tr_area` VALUES ('4737', '宁强县', '444', '0', '3');
INSERT INTO `tr_area` VALUES ('4738', '汉台区', '444', '0', '3');
INSERT INTO `tr_area` VALUES ('4739', '洋县', '444', '0', '3');
INSERT INTO `tr_area` VALUES ('4740', '留坝县', '444', '0', '3');
INSERT INTO `tr_area` VALUES ('4741', '略阳县', '444', '0', '3');
INSERT INTO `tr_area` VALUES ('4742', '西乡县', '444', '0', '3');
INSERT INTO `tr_area` VALUES ('4743', '镇巴县', '444', '0', '3');
INSERT INTO `tr_area` VALUES ('4744', '佳县', '445', '0', '3');
INSERT INTO `tr_area` VALUES ('4745', '吴堡县', '445', '0', '3');
INSERT INTO `tr_area` VALUES ('4746', '子洲县', '445', '0', '3');
INSERT INTO `tr_area` VALUES ('4747', '定边县', '445', '0', '3');
INSERT INTO `tr_area` VALUES ('4748', '府谷县', '445', '0', '3');
INSERT INTO `tr_area` VALUES ('4749', '榆林市榆阳区', '445', '0', '3');
INSERT INTO `tr_area` VALUES ('4750', '横山县', '445', '0', '3');
INSERT INTO `tr_area` VALUES ('4751', '清涧县', '445', '0', '3');
INSERT INTO `tr_area` VALUES ('4752', '神木县', '445', '0', '3');
INSERT INTO `tr_area` VALUES ('4753', '米脂县', '445', '0', '3');
INSERT INTO `tr_area` VALUES ('4754', '绥德县', '445', '0', '3');
INSERT INTO `tr_area` VALUES ('4755', '靖边县', '445', '0', '3');
INSERT INTO `tr_area` VALUES ('4756', '宁陕县', '446', '0', '3');
INSERT INTO `tr_area` VALUES ('4757', '岚皋县', '446', '0', '3');
INSERT INTO `tr_area` VALUES ('4758', '平利县', '446', '0', '3');
INSERT INTO `tr_area` VALUES ('4759', '旬阳县', '446', '0', '3');
INSERT INTO `tr_area` VALUES ('4760', '汉滨区', '446', '0', '3');
INSERT INTO `tr_area` VALUES ('4761', '汉阴县', '446', '0', '3');
INSERT INTO `tr_area` VALUES ('4762', '白河县', '446', '0', '3');
INSERT INTO `tr_area` VALUES ('4763', '石泉县', '446', '0', '3');
INSERT INTO `tr_area` VALUES ('4764', '紫阳县', '446', '0', '3');
INSERT INTO `tr_area` VALUES ('4765', '镇坪县', '446', '0', '3');
INSERT INTO `tr_area` VALUES ('4766', '丹凤县', '447', '0', '3');
INSERT INTO `tr_area` VALUES ('4767', '商南县', '447', '0', '3');
INSERT INTO `tr_area` VALUES ('4768', '商州区', '447', '0', '3');
INSERT INTO `tr_area` VALUES ('4769', '山阳县', '447', '0', '3');
INSERT INTO `tr_area` VALUES ('4770', '柞水县', '447', '0', '3');
INSERT INTO `tr_area` VALUES ('4771', '洛南县', '447', '0', '3');
INSERT INTO `tr_area` VALUES ('4772', '镇安县', '447', '0', '3');
INSERT INTO `tr_area` VALUES ('4773', '七里河区', '448', '0', '3');
INSERT INTO `tr_area` VALUES ('4774', '城关区', '448', '0', '3');
INSERT INTO `tr_area` VALUES ('4775', '安宁区', '448', '0', '3');
INSERT INTO `tr_area` VALUES ('4776', '榆中县', '448', '0', '3');
INSERT INTO `tr_area` VALUES ('4777', '永登县', '448', '0', '3');
INSERT INTO `tr_area` VALUES ('4778', '皋兰县', '448', '0', '3');
INSERT INTO `tr_area` VALUES ('4779', '红古区', '448', '0', '3');
INSERT INTO `tr_area` VALUES ('4780', '西固区', '448', '0', '3');
INSERT INTO `tr_area` VALUES ('4781', '嘉峪关市', '449', '0', '3');
INSERT INTO `tr_area` VALUES ('4782', '永昌县', '450', '0', '3');
INSERT INTO `tr_area` VALUES ('4783', '金川区', '450', '0', '3');
INSERT INTO `tr_area` VALUES ('4784', '会宁县', '451', '0', '3');
INSERT INTO `tr_area` VALUES ('4785', '平川区', '451', '0', '3');
INSERT INTO `tr_area` VALUES ('4786', '景泰县', '451', '0', '3');
INSERT INTO `tr_area` VALUES ('4787', '白银区', '451', '0', '3');
INSERT INTO `tr_area` VALUES ('4788', '靖远县', '451', '0', '3');
INSERT INTO `tr_area` VALUES ('4789', '张家川回族自治县', '452', '0', '3');
INSERT INTO `tr_area` VALUES ('4790', '武山县', '452', '0', '3');
INSERT INTO `tr_area` VALUES ('4791', '清水县', '452', '0', '3');
INSERT INTO `tr_area` VALUES ('4792', '甘谷县', '452', '0', '3');
INSERT INTO `tr_area` VALUES ('4793', '秦安县', '452', '0', '3');
INSERT INTO `tr_area` VALUES ('4794', '秦州区', '452', '0', '3');
INSERT INTO `tr_area` VALUES ('4795', '麦积区', '452', '0', '3');
INSERT INTO `tr_area` VALUES ('4796', '凉州区', '453', '0', '3');
INSERT INTO `tr_area` VALUES ('4797', '古浪县', '453', '0', '3');
INSERT INTO `tr_area` VALUES ('4798', '天祝藏族自治县', '453', '0', '3');
INSERT INTO `tr_area` VALUES ('4799', '民勤县', '453', '0', '3');
INSERT INTO `tr_area` VALUES ('4800', '临泽县', '454', '0', '3');
INSERT INTO `tr_area` VALUES ('4801', '山丹县', '454', '0', '3');
INSERT INTO `tr_area` VALUES ('4802', '民乐县', '454', '0', '3');
INSERT INTO `tr_area` VALUES ('4803', '甘州区', '454', '0', '3');
INSERT INTO `tr_area` VALUES ('4804', '肃南裕固族自治县', '454', '0', '3');
INSERT INTO `tr_area` VALUES ('4805', '高台县', '454', '0', '3');
INSERT INTO `tr_area` VALUES ('4806', '华亭县', '455', '0', '3');
INSERT INTO `tr_area` VALUES ('4807', '崆峒区', '455', '0', '3');
INSERT INTO `tr_area` VALUES ('4808', '崇信县', '455', '0', '3');
INSERT INTO `tr_area` VALUES ('4809', '庄浪县', '455', '0', '3');
INSERT INTO `tr_area` VALUES ('4810', '泾川县', '455', '0', '3');
INSERT INTO `tr_area` VALUES ('4811', '灵台县', '455', '0', '3');
INSERT INTO `tr_area` VALUES ('4812', '静宁县', '455', '0', '3');
INSERT INTO `tr_area` VALUES ('4813', '敦煌市', '456', '0', '3');
INSERT INTO `tr_area` VALUES ('4814', '玉门市', '456', '0', '3');
INSERT INTO `tr_area` VALUES ('4815', '瓜州县（原安西县）', '456', '0', '3');
INSERT INTO `tr_area` VALUES ('4816', '肃北蒙古族自治县', '456', '0', '3');
INSERT INTO `tr_area` VALUES ('4817', '肃州区', '456', '0', '3');
INSERT INTO `tr_area` VALUES ('4818', '金塔县', '456', '0', '3');
INSERT INTO `tr_area` VALUES ('4819', '阿克塞哈萨克族自治县', '456', '0', '3');
INSERT INTO `tr_area` VALUES ('4820', '华池县', '457', '0', '3');
INSERT INTO `tr_area` VALUES ('4821', '合水县', '457', '0', '3');
INSERT INTO `tr_area` VALUES ('4822', '宁县', '457', '0', '3');
INSERT INTO `tr_area` VALUES ('4823', '庆城县', '457', '0', '3');
INSERT INTO `tr_area` VALUES ('4824', '正宁县', '457', '0', '3');
INSERT INTO `tr_area` VALUES ('4825', '环县', '457', '0', '3');
INSERT INTO `tr_area` VALUES ('4826', '西峰区', '457', '0', '3');
INSERT INTO `tr_area` VALUES ('4827', '镇原县', '457', '0', '3');
INSERT INTO `tr_area` VALUES ('4828', '临洮县', '458', '0', '3');
INSERT INTO `tr_area` VALUES ('4829', '安定区', '458', '0', '3');
INSERT INTO `tr_area` VALUES ('4830', '岷县', '458', '0', '3');
INSERT INTO `tr_area` VALUES ('4831', '渭源县', '458', '0', '3');
INSERT INTO `tr_area` VALUES ('4832', '漳县', '458', '0', '3');
INSERT INTO `tr_area` VALUES ('4833', '通渭县', '458', '0', '3');
INSERT INTO `tr_area` VALUES ('4834', '陇西县', '458', '0', '3');
INSERT INTO `tr_area` VALUES ('4835', '两当县', '459', '0', '3');
INSERT INTO `tr_area` VALUES ('4836', '宕昌县', '459', '0', '3');
INSERT INTO `tr_area` VALUES ('4837', '康县', '459', '0', '3');
INSERT INTO `tr_area` VALUES ('4838', '徽县', '459', '0', '3');
INSERT INTO `tr_area` VALUES ('4839', '成县', '459', '0', '3');
INSERT INTO `tr_area` VALUES ('4840', '文县', '459', '0', '3');
INSERT INTO `tr_area` VALUES ('4841', '武都区', '459', '0', '3');
INSERT INTO `tr_area` VALUES ('4842', '礼县', '459', '0', '3');
INSERT INTO `tr_area` VALUES ('4843', '西和县', '459', '0', '3');
INSERT INTO `tr_area` VALUES ('4844', '东乡族自治县', '460', '0', '3');
INSERT INTO `tr_area` VALUES ('4845', '临夏县', '460', '0', '3');
INSERT INTO `tr_area` VALUES ('4846', '临夏市', '460', '0', '3');
INSERT INTO `tr_area` VALUES ('4847', '和政县', '460', '0', '3');
INSERT INTO `tr_area` VALUES ('4848', '广河县', '460', '0', '3');
INSERT INTO `tr_area` VALUES ('4849', '康乐县', '460', '0', '3');
INSERT INTO `tr_area` VALUES ('4850', '永靖县', '460', '0', '3');
INSERT INTO `tr_area` VALUES ('4851', '积石山保安族东乡族撒拉族自治县', '460', '0', '3');
INSERT INTO `tr_area` VALUES ('4852', '临潭县', '461', '0', '3');
INSERT INTO `tr_area` VALUES ('4853', '卓尼县', '461', '0', '3');
INSERT INTO `tr_area` VALUES ('4854', '合作市', '461', '0', '3');
INSERT INTO `tr_area` VALUES ('4855', '夏河县', '461', '0', '3');
INSERT INTO `tr_area` VALUES ('4856', '玛曲县', '461', '0', '3');
INSERT INTO `tr_area` VALUES ('4857', '碌曲县', '461', '0', '3');
INSERT INTO `tr_area` VALUES ('4858', '舟曲县', '461', '0', '3');
INSERT INTO `tr_area` VALUES ('4859', '迭部县', '461', '0', '3');
INSERT INTO `tr_area` VALUES ('4860', '城东区', '462', '0', '3');
INSERT INTO `tr_area` VALUES ('4861', '城中区', '462', '0', '3');
INSERT INTO `tr_area` VALUES ('4862', '城北区', '462', '0', '3');
INSERT INTO `tr_area` VALUES ('4863', '城西区', '462', '0', '3');
INSERT INTO `tr_area` VALUES ('4864', '大通回族土族自治县', '462', '0', '3');
INSERT INTO `tr_area` VALUES ('4865', '湟中县', '462', '0', '3');
INSERT INTO `tr_area` VALUES ('4866', '湟源县', '462', '0', '3');
INSERT INTO `tr_area` VALUES ('4867', '乐都县', '463', '0', '3');
INSERT INTO `tr_area` VALUES ('4868', '互助土族自治县', '463', '0', '3');
INSERT INTO `tr_area` VALUES ('4869', '化隆回族自治县', '463', '0', '3');
INSERT INTO `tr_area` VALUES ('4870', '平安县', '463', '0', '3');
INSERT INTO `tr_area` VALUES ('4871', '循化撒拉族自治县', '463', '0', '3');
INSERT INTO `tr_area` VALUES ('4872', '民和回族土族自治县', '463', '0', '3');
INSERT INTO `tr_area` VALUES ('4873', '刚察县', '464', '0', '3');
INSERT INTO `tr_area` VALUES ('4874', '海晏县', '464', '0', '3');
INSERT INTO `tr_area` VALUES ('4875', '祁连县', '464', '0', '3');
INSERT INTO `tr_area` VALUES ('4876', '门源回族自治县', '464', '0', '3');
INSERT INTO `tr_area` VALUES ('4877', '同仁县', '465', '0', '3');
INSERT INTO `tr_area` VALUES ('4878', '尖扎县', '465', '0', '3');
INSERT INTO `tr_area` VALUES ('4879', '河南蒙古族自治县', '465', '0', '3');
INSERT INTO `tr_area` VALUES ('4880', '泽库县', '465', '0', '3');
INSERT INTO `tr_area` VALUES ('4881', '共和县', '466', '0', '3');
INSERT INTO `tr_area` VALUES ('4882', '兴海县', '466', '0', '3');
INSERT INTO `tr_area` VALUES ('4883', '同德县', '466', '0', '3');
INSERT INTO `tr_area` VALUES ('4884', '贵南县', '466', '0', '3');
INSERT INTO `tr_area` VALUES ('4885', '贵德县', '466', '0', '3');
INSERT INTO `tr_area` VALUES ('4886', '久治县', '467', '0', '3');
INSERT INTO `tr_area` VALUES ('4887', '玛多县', '467', '0', '3');
INSERT INTO `tr_area` VALUES ('4888', '玛沁县', '467', '0', '3');
INSERT INTO `tr_area` VALUES ('4889', '班玛县', '467', '0', '3');
INSERT INTO `tr_area` VALUES ('4890', '甘德县', '467', '0', '3');
INSERT INTO `tr_area` VALUES ('4891', '达日县', '467', '0', '3');
INSERT INTO `tr_area` VALUES ('4892', '囊谦县', '468', '0', '3');
INSERT INTO `tr_area` VALUES ('4893', '曲麻莱县', '468', '0', '3');
INSERT INTO `tr_area` VALUES ('4894', '杂多县', '468', '0', '3');
INSERT INTO `tr_area` VALUES ('4895', '治多县', '468', '0', '3');
INSERT INTO `tr_area` VALUES ('4896', '玉树县', '468', '0', '3');
INSERT INTO `tr_area` VALUES ('4897', '称多县', '468', '0', '3');
INSERT INTO `tr_area` VALUES ('4898', '乌兰县', '469', '0', '3');
INSERT INTO `tr_area` VALUES ('4899', '冷湖行委', '469', '0', '3');
INSERT INTO `tr_area` VALUES ('4900', '大柴旦行委', '469', '0', '3');
INSERT INTO `tr_area` VALUES ('4901', '天峻县', '469', '0', '3');
INSERT INTO `tr_area` VALUES ('4902', '德令哈市', '469', '0', '3');
INSERT INTO `tr_area` VALUES ('4903', '格尔木市', '469', '0', '3');
INSERT INTO `tr_area` VALUES ('4904', '茫崖行委', '469', '0', '3');
INSERT INTO `tr_area` VALUES ('4905', '都兰县', '469', '0', '3');
INSERT INTO `tr_area` VALUES ('4906', '兴庆区', '470', '0', '3');
INSERT INTO `tr_area` VALUES ('4907', '永宁县', '470', '0', '3');
INSERT INTO `tr_area` VALUES ('4908', '灵武市', '470', '0', '3');
INSERT INTO `tr_area` VALUES ('4909', '西夏区', '470', '0', '3');
INSERT INTO `tr_area` VALUES ('4910', '贺兰县', '470', '0', '3');
INSERT INTO `tr_area` VALUES ('4911', '金凤区', '470', '0', '3');
INSERT INTO `tr_area` VALUES ('4912', '大武口区', '471', '0', '3');
INSERT INTO `tr_area` VALUES ('4913', '平罗县', '471', '0', '3');
INSERT INTO `tr_area` VALUES ('4914', '惠农区', '471', '0', '3');
INSERT INTO `tr_area` VALUES ('4915', '利通区', '472', '0', '3');
INSERT INTO `tr_area` VALUES ('4916', '同心县', '472', '0', '3');
INSERT INTO `tr_area` VALUES ('4917', '盐池县', '472', '0', '3');
INSERT INTO `tr_area` VALUES ('4918', '青铜峡市', '472', '0', '3');
INSERT INTO `tr_area` VALUES ('4919', '原州区', '473', '0', '3');
INSERT INTO `tr_area` VALUES ('4920', '彭阳县', '473', '0', '3');
INSERT INTO `tr_area` VALUES ('4921', '泾源县', '473', '0', '3');
INSERT INTO `tr_area` VALUES ('4922', '西吉县', '473', '0', '3');
INSERT INTO `tr_area` VALUES ('4923', '隆德县', '473', '0', '3');
INSERT INTO `tr_area` VALUES ('4924', '中宁县', '474', '0', '3');
INSERT INTO `tr_area` VALUES ('4925', '沙坡头区', '474', '0', '3');
INSERT INTO `tr_area` VALUES ('4926', '海原县', '474', '0', '3');
INSERT INTO `tr_area` VALUES ('4927', '东山区', '475', '0', '3');
INSERT INTO `tr_area` VALUES ('4928', '乌鲁木齐县', '475', '0', '3');
INSERT INTO `tr_area` VALUES ('4929', '天山区', '475', '0', '3');
INSERT INTO `tr_area` VALUES ('4930', '头屯河区', '475', '0', '3');
INSERT INTO `tr_area` VALUES ('4931', '新市区', '475', '0', '3');
INSERT INTO `tr_area` VALUES ('4932', '水磨沟区', '475', '0', '3');
INSERT INTO `tr_area` VALUES ('4933', '沙依巴克区', '475', '0', '3');
INSERT INTO `tr_area` VALUES ('4934', '达坂城区', '475', '0', '3');
INSERT INTO `tr_area` VALUES ('4935', '乌尔禾区', '476', '0', '3');
INSERT INTO `tr_area` VALUES ('4936', '克拉玛依区', '476', '0', '3');
INSERT INTO `tr_area` VALUES ('4937', '独山子区', '476', '0', '3');
INSERT INTO `tr_area` VALUES ('4938', '白碱滩区', '476', '0', '3');
INSERT INTO `tr_area` VALUES ('4939', '吐鲁番市', '477', '0', '3');
INSERT INTO `tr_area` VALUES ('4940', '托克逊县', '477', '0', '3');
INSERT INTO `tr_area` VALUES ('4941', '鄯善县', '477', '0', '3');
INSERT INTO `tr_area` VALUES ('4942', '伊吾县', '478', '0', '3');
INSERT INTO `tr_area` VALUES ('4943', '哈密市', '478', '0', '3');
INSERT INTO `tr_area` VALUES ('4944', '巴里坤哈萨克自治县', '478', '0', '3');
INSERT INTO `tr_area` VALUES ('4945', '吉木萨尔县', '479', '0', '3');
INSERT INTO `tr_area` VALUES ('4946', '呼图壁县', '479', '0', '3');
INSERT INTO `tr_area` VALUES ('4947', '奇台县', '479', '0', '3');
INSERT INTO `tr_area` VALUES ('4948', '昌吉市', '479', '0', '3');
INSERT INTO `tr_area` VALUES ('4949', '木垒哈萨克自治县', '479', '0', '3');
INSERT INTO `tr_area` VALUES ('4950', '玛纳斯县', '479', '0', '3');
INSERT INTO `tr_area` VALUES ('4951', '米泉市', '479', '0', '3');
INSERT INTO `tr_area` VALUES ('4952', '阜康市', '479', '0', '3');
INSERT INTO `tr_area` VALUES ('4953', '博乐市', '480', '0', '3');
INSERT INTO `tr_area` VALUES ('4954', '温泉县', '480', '0', '3');
INSERT INTO `tr_area` VALUES ('4955', '精河县', '480', '0', '3');
INSERT INTO `tr_area` VALUES ('4956', '博湖县', '481', '0', '3');
INSERT INTO `tr_area` VALUES ('4957', '和硕县', '481', '0', '3');
INSERT INTO `tr_area` VALUES ('4958', '和静县', '481', '0', '3');
INSERT INTO `tr_area` VALUES ('4959', '尉犁县', '481', '0', '3');
INSERT INTO `tr_area` VALUES ('4960', '库尔勒市', '481', '0', '3');
INSERT INTO `tr_area` VALUES ('4961', '焉耆回族自治县', '481', '0', '3');
INSERT INTO `tr_area` VALUES ('4962', '若羌县', '481', '0', '3');
INSERT INTO `tr_area` VALUES ('4963', '轮台县', '481', '0', '3');
INSERT INTO `tr_area` VALUES ('4964', '乌什县', '482', '0', '3');
INSERT INTO `tr_area` VALUES ('4965', '库车县', '482', '0', '3');
INSERT INTO `tr_area` VALUES ('4966', '拜城县', '482', '0', '3');
INSERT INTO `tr_area` VALUES ('4967', '新和县', '482', '0', '3');
INSERT INTO `tr_area` VALUES ('4968', '柯坪县', '482', '0', '3');
INSERT INTO `tr_area` VALUES ('4969', '沙雅县', '482', '0', '3');
INSERT INTO `tr_area` VALUES ('4970', '温宿县', '482', '0', '3');
INSERT INTO `tr_area` VALUES ('4971', '阿克苏市', '482', '0', '3');
INSERT INTO `tr_area` VALUES ('4972', '阿瓦提县', '482', '0', '3');
INSERT INTO `tr_area` VALUES ('4973', '乌恰县', '483', '0', '3');
INSERT INTO `tr_area` VALUES ('4974', '阿克陶县', '483', '0', '3');
INSERT INTO `tr_area` VALUES ('4975', '阿合奇县', '483', '0', '3');
INSERT INTO `tr_area` VALUES ('4976', '阿图什市', '483', '0', '3');
INSERT INTO `tr_area` VALUES ('4977', '伽师县', '484', '0', '3');
INSERT INTO `tr_area` VALUES ('4978', '叶城县', '484', '0', '3');
INSERT INTO `tr_area` VALUES ('4979', '喀什市', '484', '0', '3');
INSERT INTO `tr_area` VALUES ('4980', '塔什库尔干塔吉克自治县', '484', '0', '3');
INSERT INTO `tr_area` VALUES ('4981', '岳普湖县', '484', '0', '3');
INSERT INTO `tr_area` VALUES ('4982', '巴楚县', '484', '0', '3');
INSERT INTO `tr_area` VALUES ('4983', '泽普县', '484', '0', '3');
INSERT INTO `tr_area` VALUES ('4984', '疏勒县', '484', '0', '3');
INSERT INTO `tr_area` VALUES ('4985', '疏附县', '484', '0', '3');
INSERT INTO `tr_area` VALUES ('4986', '英吉沙县', '484', '0', '3');
INSERT INTO `tr_area` VALUES ('4987', '莎车县', '484', '0', '3');
INSERT INTO `tr_area` VALUES ('4988', '麦盖提县', '484', '0', '3');
INSERT INTO `tr_area` VALUES ('4989', '于田县', '485', '0', '3');
INSERT INTO `tr_area` VALUES ('4990', '和田县', '485', '0', '3');
INSERT INTO `tr_area` VALUES ('4991', '和田市', '485', '0', '3');
INSERT INTO `tr_area` VALUES ('4992', '墨玉县', '485', '0', '3');
INSERT INTO `tr_area` VALUES ('4993', '民丰县', '485', '0', '3');
INSERT INTO `tr_area` VALUES ('4994', '洛浦县', '485', '0', '3');
INSERT INTO `tr_area` VALUES ('4995', '皮山县', '485', '0', '3');
INSERT INTO `tr_area` VALUES ('4996', '策勒县', '485', '0', '3');
INSERT INTO `tr_area` VALUES ('4997', '伊宁县', '486', '0', '3');
INSERT INTO `tr_area` VALUES ('4998', '伊宁市', '486', '0', '3');
INSERT INTO `tr_area` VALUES ('4999', '奎屯市', '486', '0', '3');
INSERT INTO `tr_area` VALUES ('5000', '察布查尔锡伯自治县', '486', '0', '3');
INSERT INTO `tr_area` VALUES ('5001', '尼勒克县', '486', '0', '3');
INSERT INTO `tr_area` VALUES ('5002', '巩留县', '486', '0', '3');
INSERT INTO `tr_area` VALUES ('5003', '新源县', '486', '0', '3');
INSERT INTO `tr_area` VALUES ('5004', '昭苏县', '486', '0', '3');
INSERT INTO `tr_area` VALUES ('5005', '特克斯县', '486', '0', '3');
INSERT INTO `tr_area` VALUES ('5006', '霍城县', '486', '0', '3');
INSERT INTO `tr_area` VALUES ('5007', '乌苏市', '487', '0', '3');
INSERT INTO `tr_area` VALUES ('5008', '和布克赛尔蒙古自治县', '487', '0', '3');
INSERT INTO `tr_area` VALUES ('5009', '塔城市', '487', '0', '3');
INSERT INTO `tr_area` VALUES ('5010', '托里县', '487', '0', '3');
INSERT INTO `tr_area` VALUES ('5011', '沙湾县', '487', '0', '3');
INSERT INTO `tr_area` VALUES ('5012', '裕民县', '487', '0', '3');
INSERT INTO `tr_area` VALUES ('5013', '额敏县', '487', '0', '3');
INSERT INTO `tr_area` VALUES ('5014', '吉木乃县', '488', '0', '3');
INSERT INTO `tr_area` VALUES ('5015', '哈巴河县', '488', '0', '3');
INSERT INTO `tr_area` VALUES ('5016', '富蕴县', '488', '0', '3');
INSERT INTO `tr_area` VALUES ('5017', '布尔津县', '488', '0', '3');
INSERT INTO `tr_area` VALUES ('5018', '福海县', '488', '0', '3');
INSERT INTO `tr_area` VALUES ('5019', '阿勒泰市', '488', '0', '3');
INSERT INTO `tr_area` VALUES ('5020', '青河县', '488', '0', '3');
INSERT INTO `tr_area` VALUES ('5021', '石河子市', '489', '0', '3');
INSERT INTO `tr_area` VALUES ('5022', '阿拉尔市', '490', '0', '3');
INSERT INTO `tr_area` VALUES ('5023', '图木舒克市', '491', '0', '3');
INSERT INTO `tr_area` VALUES ('5024', '五家渠市', '492', '0', '3');

-- ----------------------------
-- Table structure for `tr_article`
-- ----------------------------
DROP TABLE IF EXISTS `tr_article`;
CREATE TABLE `tr_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `ac_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `article_url` varchar(100) DEFAULT NULL COMMENT '跳转链接',
  `article_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示，0为否，1为是，默认为1',
  `article_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `article_title` varchar(100) DEFAULT NULL COMMENT '标题',
  `article_content` text COMMENT '内容',
  `article_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  PRIMARY KEY (`article_id`),
  KEY `ac_id` (`ac_id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of tr_article
-- ----------------------------
INSERT INTO `tr_article` VALUES ('6', '2', '', '1', '255', '如何注册成为会员', '如何注册成为会员', '1389864697');
INSERT INTO `tr_article` VALUES ('7', '2', '', '1', '255', '如何搜索', '如何搜索', '1389864697');
INSERT INTO `tr_article` VALUES ('8', '2', '', '1', '255', '忘记密码', '忘记密码', '1389864697');
INSERT INTO `tr_article` VALUES ('9', '2', '', '1', '255', '我要买', '我要买', '1389864697');
INSERT INTO `tr_article` VALUES ('10', '2', '', '1', '255', '查看已购买商品', '查看已购买商品', '1389864697');
INSERT INTO `tr_article` VALUES ('11', '3', '', '1', '255', '如何管理店铺', '如何管理店铺', '1389864697');
INSERT INTO `tr_article` VALUES ('12', '3', '', '1', '255', '查看售出商品', '查看售出商品', '1389864697');
INSERT INTO `tr_article` VALUES ('13', '3', '', '1', '255', '如何发货', '如何发货', '1389864697');
INSERT INTO `tr_article` VALUES ('14', '3', '', '1', '255', '商城商品推荐', '商城商品推荐', '1389864697');
INSERT INTO `tr_article` VALUES ('15', '3', '', '1', '255', '如何申请开店', '如何申请开店', '1389864697');
INSERT INTO `tr_article` VALUES ('16', '4', '', '1', '255', '如何注册支付宝', '如何注册支付宝', '1389864697');
INSERT INTO `tr_article` VALUES ('17', '4', '', '1', '255', '在线支付', '在线支付', '1389864697');
INSERT INTO `tr_article` VALUES ('18', '6', '', '1', '255', '会员修改密码', '会员修改密码', '1389864697');
INSERT INTO `tr_article` VALUES ('19', '6', '', '1', '255', '会员修改个人资料', '会员修改个人资料', '1389864697');
INSERT INTO `tr_article` VALUES ('20', '6', '', '1', '255', '商品发布', '商品发布', '1389864697');
INSERT INTO `tr_article` VALUES ('21', '6', '', '1', '255', '修改收货地址', '修改收货地址', '1389864697');
INSERT INTO `tr_article` VALUES ('22', '7', '', '1', '255', '关于ShopNC', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 天津市网城天创科技有限责任公司位于天津市红桥区，是专业从事生产管理信息化领域技术咨询和软件开发的高新技术企业。公司拥有多名技术人才和资深的行业解决方案专家。</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 公司拥有一支勇于开拓、具有战略眼光和敏锐市场判断力的市场营销队伍，一批求实敬业，追求卓越的行政管理人才，一个能征善战，技术优秀，经验丰富的开发团队。公司坚持按现代企业制度和市场规律办事，在扩大经营规模的同时，注重企业经济运行质量，在自主产品研发及承接软件项目方面获得了很强的竞争力。 我公司也积极参与国内传统企业的信息化改造，引进国际化产品开发的标准，规范软件开发流程，通过提升各层面的软件开发人才的技术素质，打造国产软件精品，目前已经开发出具有自主知识产权的网络商城软件，还在积极开发基于电子商务平台高效能、高效益的管理系统。为今后进一步开拓国内市场打下坚实的基础。公司致力于构造一个开放、发展的人才平台，积极营造追求卓越、积极奉献的工作氛围，把“以人为本”的理念落实到每一项具体工作中，为那些锋芒内敛，激情无限的业界精英提供充分的发展空间，优雅自信、从容自得的工作环境，事业雄心与生活情趣两相兼顾的生活方式。并通过每个员工不断提升自我，以自己的独特价值观对工作与生活作最准确的判断，使我们每一个员工彰显出他们出色的自我品位，独有的工作个性和卓越的创新风格，让他们时刻保持振奋、不断鼓舞内心深处的梦想，永远走在时代潮流前端。公司发展趋势 励精图治，展望未来。公司把发展产业策略与发掘人才策略紧密结合，广纳社会精英，挖掘创新潜能，以人为本，凝聚人气，努力营造和谐宽松的工作氛围，为优秀人才的脱颖而出提供机遇。公司将在深入发展软件产业的同时，通过不懈的努力，来塑造大型软件公司的辉煌形象。 </p>', '1389864697');
INSERT INTO `tr_article` VALUES ('23', '7', '', '1', '255', '联系我们', '<p>欢迎您对我们的站点、工作、产品和服务提出自己宝贵的意见或建议。我们将给予您及时答复。同时也欢迎您到我们公司来洽商业务。</p>\r\n<p><br />\r\n<strong>公司名称</strong>： 天津市网城天创科技有限责任公司 <br />\r\n<strong>通信地址</strong>： 天津市红桥区大丰路(水游城)冠錡大厦8层 <br />\r\n<strong>邮政编码</strong>： 300121 <br />\r\n<strong>电话</strong>： 400-880-1509 <br />\r\n<strong>商务洽谈</strong>： 86-022-58306929 <br />\r\n<strong>软件著作权登记号</strong>： 软著登字第0650314号 <br />\r\n<strong>ICP备案号</strong>： 津ICP备10001600号 </p>', '1389864697');
INSERT INTO `tr_article` VALUES ('24', '7', '', '1', '255', '招聘英才', '<dl> <h3>PHP程序员</h3>\r\n<dt>职位要求： <dd>熟悉PHP5开发语言；<br />\r\n熟悉MySQL5数据库，同时熟悉sqlserver，oracle者优先；<br />\r\n熟悉面向对象思想，MVC三层体系，至少使用过目前已知PHP框架其中一种；<br />\r\n熟悉SERVER2003/Linux操作系统，熟悉常用Linux操作命令；<br />\r\n熟悉Mysql数据库应用开发，了解Mysql的数据库配置管理、性能优化等基本操作技能；<br />\r\n熟悉jquery，smarty等常用开源软件；<br />\r\n具备良好的代码编程习惯及较强的文档编写能力；<br />\r\n具备良好的团队合作能力；<br />\r\n熟悉设计模式者优先；<br />\r\n熟悉java，c++,c#,python其中一种者优先； </dd> <dt>学历要求： <dd>大本 </dd> <dt>工作经验： <dd>一年以上 </dd> <dt>工作地点： <dd>天津 </dd></dl> <dl> <h3>网页设计（2名）</h3>\r\n<dt>岗位职责： <dd>网站UI设计、 切片以及HTML制作。 </dd> <dt>职位要求： <dd>有大型网站设计经验；有网站改版、频道建设经验者优先考虑； <br />\r\n熟练掌握photoshop,fireworks,dreamwaver等设计软件； <br />\r\n熟练运用Div+Css制作网页，符合CSS2.0-W3C标准，并掌握不同浏览器下，不同版本下CSS元素的区别；<br />\r\n熟悉网站制作流程，能运用并修改简单JavaScript类程序； <br />\r\n积极向上，有良好的人际沟通能力，良好的工作协调能力，踏实肯干的工作精神；具有良好的沟通表达能力，<br />\r\n需求判断力，团队协作能力； <br />\r\n请应聘者在简历中提供个人近期作品连接。 </dd> <dt>学历要求： <dd>专科 </dd> <dt>工作经验： <dd>一年以上 </dd> <dt>工作地点： <dd>天津 </dd></dl> <dl> <h3>方案策划（1名）</h3>\r\n<dt>职位要求： <dd>2年以上的文案编辑类相关工作经验，具备一定的文字功底，有极强的语言表达和逻辑思维能力， 能独立完成项目方案的编写，拟草各种协议。熟悉使用办公软件。 </dd> <dt>学历要求： <dd>大专以上 </dd> <dt>工作经验： <dd>一年以上 </dd> <dt>工作地点： <dd>天津 </dd></dl>', '1389864697');
INSERT INTO `tr_article` VALUES ('25', '7', '', '1', '255', '合作及洽谈', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ShopNC希望与服务代理商、合作伙伴并肩合作，携手开拓日益广阔的网络购物软件市场。如果您拥有好的建议，拥有丰富渠道资源、拥有众多目标客户、拥有相应的市场资源，并希望与ShopNC进行深度业务合作， 欢迎成为ShopNC业务合作伙伴，请联系。</p>\r\n<p>&nbsp;</p>\r\n<p><strong>公司名称</strong>： 天津市网城天创科技有限责任公司 <br />\r\n<strong>通信地址</strong>： 天津市红桥区大丰路(水游城)冠錡大厦8层 <br />\r\n<strong>邮政编码</strong>： 300121 <br />\r\n<strong>电话</strong>： 400-880-1509 <br />\r\n<strong>商务洽谈</strong>： 86-022-58306929 <br />\r\n</p>', '1389864697');
INSERT INTO `tr_article` VALUES ('26', '5', '', '1', '255', '联系卖家', '联系卖家', '1389864697');
INSERT INTO `tr_article` VALUES ('28', '4', '', '1', '255', '分期付款', '分期付款<br />', '1389864697');
INSERT INTO `tr_article` VALUES ('29', '4', '', '1', '255', '邮局汇款', '邮局汇款<br />', '1389864697');
INSERT INTO `tr_article` VALUES ('30', '4', '', '1', '255', '公司转账', '公司转账<br />', '1389864697');
INSERT INTO `tr_article` VALUES ('31', '5', '', '1', '255', '退换货政策', '退换货政策', '1389864697');
INSERT INTO `tr_article` VALUES ('32', '5', '', '1', '255', '退换货流程', '退换货流程', '1389864697');
INSERT INTO `tr_article` VALUES ('33', '5', '', '1', '255', '返修/退换货', '返修/退换货', '1389864697');
INSERT INTO `tr_article` VALUES ('34', '5', '', '1', '255', '退款申请', '退款申请', '1389864697');
INSERT INTO `tr_article` VALUES ('35', '1', 'http://www.shopnc.net/', '1', '1', '火爆销售中', '火爆销售中<br />', '1389864697');
INSERT INTO `tr_article` VALUES ('36', '1', '', '1', '255', '管理功能说明', '管理功能说明', '1389864697');
INSERT INTO `tr_article` VALUES ('37', '1', '', '1', '255', '如何扩充水印字体库', '如何扩充水印字体库', '1389864697');
INSERT INTO `tr_article` VALUES ('38', '1', '', '1', '255', '提示信息', '提示信息', '1389864697');
INSERT INTO `tr_article` VALUES ('39', '2', '', '1', '255', '积分细则', '积分细则积分细则', '1389864697');
INSERT INTO `tr_article` VALUES ('40', '2', '', '1', '255', '积分兑换说明', '积分兑换说明', '1389864697');
INSERT INTO `tr_article` VALUES ('41', '1', '', '1', '255', '功能使用说明', '功能使用说明', '1389864697');

-- ----------------------------
-- Table structure for `tr_article_class`
-- ----------------------------
DROP TABLE IF EXISTS `tr_article_class`;
CREATE TABLE `tr_article_class` (
  `ac_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `ac_code` varchar(20) DEFAULT NULL COMMENT '分类标识码',
  `ac_name` varchar(100) NOT NULL COMMENT '分类名称',
  `ac_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `ac_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`ac_id`),
  KEY `ac_parent_id` (`ac_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Records of tr_article_class
-- ----------------------------
INSERT INTO `tr_article_class` VALUES ('1', 'notice', '商城公告', '0', '255');
INSERT INTO `tr_article_class` VALUES ('2', 'member', '帮助中心', '0', '255');
INSERT INTO `tr_article_class` VALUES ('3', 'store', '店主之家', '0', '255');
INSERT INTO `tr_article_class` VALUES ('4', 'payment', '支付方式', '0', '255');
INSERT INTO `tr_article_class` VALUES ('5', 'sold', '售后服务', '0', '255');
INSERT INTO `tr_article_class` VALUES ('6', 'service', '客服中心', '0', '255');
INSERT INTO `tr_article_class` VALUES ('7', 'about', '关于我们', '0', '255');

-- ----------------------------
-- Table structure for `tr_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `tr_attribute`;
CREATE TABLE `tr_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(100) NOT NULL COMMENT '属性名称',
  `type_id` int(10) unsigned NOT NULL COMMENT '所属类型id',
  `attr_value` text NOT NULL COMMENT '属性值列',
  `attr_show` tinyint(1) unsigned NOT NULL COMMENT '是否显示。0为不显示、1为显示',
  `attr_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`attr_id`),
  KEY `attr_id` (`attr_id`,`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=223 DEFAULT CHARSET=utf8 COMMENT='商品属性表';

-- ----------------------------
-- Records of tr_attribute
-- ----------------------------
INSERT INTO `tr_attribute` VALUES ('206', '款式', '34', '毛衣,开衫,套头衫,打底衫,长款,高领,蝙蝠衫,吊带/背心,其它', '1', '1');
INSERT INTO `tr_attribute` VALUES ('207', '材质', '34', '棉,涤纶,真丝,亚麻,丝光棉,羊毛/羊绒,腈纶/化纤,棉混纺,其它', '1', '2');
INSERT INTO `tr_attribute` VALUES ('208', '价格', '34', '0-99,100-199,200-299,300-399,400-499,500-599,600-999,1000以上', '1', '3');
INSERT INTO `tr_attribute` VALUES ('209', '袖长', '34', '长袖,短袖,七分袖,无袖,五分袖/中袖,九分袖,其它', '1', '4');
INSERT INTO `tr_attribute` VALUES ('210', '风格', '34', '欧美,日韩,OL通勤,休闲,原创设计,百搭,其它', '1', '5');
INSERT INTO `tr_attribute` VALUES ('211', '袖长', '35', '长袖,短袖,七分袖,无袖,九分袖,五分袖/中袖,其它', '1', '1');
INSERT INTO `tr_attribute` VALUES ('212', '花型', '35', '纯色,条纹,格子,千鸟格,波点,拼接,撞色,小碎花,印花/绣花,渐变,豹纹,骷髅,手绘,几何,卡通,字母,脸谱,头像,动物,植物,建筑,其它', '1', '2');
INSERT INTO `tr_attribute` VALUES ('213', '版式', '35', '修身,宽松,直筒,斗篷,其他', '1', '3');
INSERT INTO `tr_attribute` VALUES ('214', '衣长', '35', '短款(35-50CM),常规款(51-65CM),中长款(66-80CM),长款(衣长大于80CM)', '1', '4');
INSERT INTO `tr_attribute` VALUES ('215', '领型', '35', '圆领,V领,立领,翻领/polo领,方领,西装领,荷叶领,娃娃领,连帽/帽领,其它领型,高领', '1', '5');
INSERT INTO `tr_attribute` VALUES ('216', '款式', '36', '套头,开衫,套装', '1', '1');
INSERT INTO `tr_attribute` VALUES ('217', '袖长', '36', '长袖,短袖,七分袖,无袖,九分袖,五分袖/中袖,其它', '1', '2');
INSERT INTO `tr_attribute` VALUES ('218', '花型', '36', '纯色,条纹,格子,千鸟格,波点,拼接,撞色,小碎花,印花/绣花,渐变,豹纹,骷髅,手绘,几何,卡通,字母,脸谱,头像,动物,植物,建筑,其它', '1', '3');
INSERT INTO `tr_attribute` VALUES ('219', '版式', '36', '修身,宽松,直筒,其他', '1', '4');
INSERT INTO `tr_attribute` VALUES ('220', '薄厚', '36', '薄款,普通,加厚,抓绒,棉内胆,毛内胆', '1', '5');
INSERT INTO `tr_attribute` VALUES ('221', '目的地', '37', '红叶谷,灵岩寺,泰山', '1', '0');
INSERT INTO `tr_attribute` VALUES ('222', '行程天数', '37', '1日游,2日游,3日游,4日游,5日游及以上', '1', '0');

-- ----------------------------
-- Table structure for `tr_attribute_value`
-- ----------------------------
DROP TABLE IF EXISTS `tr_attribute_value`;
CREATE TABLE `tr_attribute_value` (
  `attr_value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值id',
  `attr_value_name` varchar(100) NOT NULL COMMENT '属性值名称',
  `attr_id` int(10) unsigned NOT NULL COMMENT '所属属性id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `attr_value_sort` tinyint(1) unsigned NOT NULL COMMENT '属性值排序',
  PRIMARY KEY (`attr_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3189 DEFAULT CHARSET=utf8 COMMENT='商品属性值表';

-- ----------------------------
-- Records of tr_attribute_value
-- ----------------------------
INSERT INTO `tr_attribute_value` VALUES ('3050', '毛衣', '206', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3051', '开衫', '206', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3052', '套头衫', '206', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3053', '打底衫', '206', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3054', '长款', '206', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3055', '高领', '206', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3056', '蝙蝠衫', '206', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3057', '吊带/背心', '206', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3058', '其它', '206', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3059', '棉', '207', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3060', '涤纶', '207', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3061', '真丝', '207', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3062', '亚麻', '207', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3063', '丝光棉', '207', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3064', '羊毛/羊绒', '207', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3065', '腈纶/化纤', '207', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3066', '棉混纺', '207', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3067', '其它', '207', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3068', '0-99', '208', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3069', '100-199', '208', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3070', '200-299', '208', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3071', '300-399', '208', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3072', '400-499', '208', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3073', '500-599', '208', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3074', '600-999', '208', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3075', '1000以上', '208', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3076', '长袖', '209', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3077', '短袖', '209', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3078', '七分袖', '209', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3079', '无袖', '209', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3080', '五分袖/中袖', '209', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3081', '九分袖', '209', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3082', '其它', '209', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3083', '欧美', '210', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3084', '日韩', '210', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3085', 'OL通勤', '210', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3086', '休闲', '210', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3087', '原创设计', '210', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3088', '百搭', '210', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3089', '其它', '210', '34', '0');
INSERT INTO `tr_attribute_value` VALUES ('3090', '长袖', '211', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3091', '短袖', '211', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3092', '七分袖', '211', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3093', '无袖', '211', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3094', '九分袖', '211', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3095', '五分袖/中袖', '211', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3096', '其它', '211', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3097', '纯色', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3098', '条纹', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3099', '格子', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3100', '千鸟格', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3101', '波点', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3102', '拼接', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3103', '撞色', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3104', '小碎花', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3105', '印花/绣花', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3106', '渐变', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3107', '豹纹', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3108', '骷髅', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3109', '手绘', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3110', '几何', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3111', '卡通', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3112', '字母', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3113', '脸谱', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3114', '头像', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3115', '动物', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3116', '植物', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3117', '建筑', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3118', '其它', '212', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3119', '修身', '213', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3120', '宽松', '213', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3121', '直筒', '213', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3122', '斗篷', '213', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3123', '其他', '213', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3124', '短款(35-50CM)', '214', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3125', '常规款(51-65CM)', '214', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3126', '中长款(66-80CM)', '214', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3127', '长款(衣长大于80CM)', '214', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3128', '圆领', '215', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3129', 'V领', '215', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3130', '立领', '215', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3131', '翻领/polo领', '215', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3132', '方领', '215', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3133', '西装领', '215', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3134', '荷叶领', '215', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3135', '娃娃领', '215', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3136', '连帽/帽领', '215', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3137', '其它领型', '215', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3138', '高领', '215', '35', '0');
INSERT INTO `tr_attribute_value` VALUES ('3139', '套头', '216', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3140', '开衫', '216', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3141', '套装', '216', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3142', '长袖', '217', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3143', '短袖', '217', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3144', '七分袖', '217', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3145', '无袖', '217', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3146', '九分袖', '217', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3147', '五分袖/中袖', '217', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3148', '其它', '217', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3149', '纯色', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3150', '条纹', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3151', '格子', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3152', '千鸟格', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3153', '波点', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3154', '拼接', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3155', '撞色', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3156', '小碎花', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3157', '印花/绣花', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3158', '渐变', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3159', '豹纹', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3160', '骷髅', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3161', '手绘', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3162', '几何', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3163', '卡通', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3164', '字母', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3165', '脸谱', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3166', '头像', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3167', '动物', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3168', '植物', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3169', '建筑', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3170', '其它', '218', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3171', '修身', '219', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3172', '宽松', '219', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3173', '直筒', '219', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3174', '其他', '219', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3175', '薄款', '220', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3176', '普通', '220', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3177', '加厚', '220', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3178', '抓绒', '220', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3179', '棉内胆', '220', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3180', '毛内胆', '220', '36', '0');
INSERT INTO `tr_attribute_value` VALUES ('3181', '红叶谷', '221', '37', '0');
INSERT INTO `tr_attribute_value` VALUES ('3182', '灵岩寺', '221', '37', '0');
INSERT INTO `tr_attribute_value` VALUES ('3183', '泰山', '221', '37', '0');
INSERT INTO `tr_attribute_value` VALUES ('3184', '1日游', '222', '37', '0');
INSERT INTO `tr_attribute_value` VALUES ('3185', '2日游', '222', '37', '0');
INSERT INTO `tr_attribute_value` VALUES ('3186', '3日游', '222', '37', '0');
INSERT INTO `tr_attribute_value` VALUES ('3187', '4日游', '222', '37', '0');
INSERT INTO `tr_attribute_value` VALUES ('3188', '5日游及以上', '222', '37', '0');

-- ----------------------------
-- Table structure for `tr_brand`
-- ----------------------------
DROP TABLE IF EXISTS `tr_brand`;
CREATE TABLE `tr_brand` (
  `brand_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `brand_name` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `brand_class` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `brand_pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `brand_sort` tinyint(3) unsigned DEFAULT '0' COMMENT '排序',
  `brand_recommend` tinyint(1) DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `brand_apply` tinyint(1) NOT NULL DEFAULT '1' COMMENT '品牌申请，0为申请中，1为通过，默认为1，申请功能是会员使用，系统后台默认为1',
  `class_id` int(10) unsigned DEFAULT '0' COMMENT '所属分类id',
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=365 DEFAULT CHARSET=utf8 COMMENT='品牌表';

-- ----------------------------
-- Records of tr_brand
-- ----------------------------
INSERT INTO `tr_brand` VALUES ('79', 'justyle', '服饰鞋帽', '04397468710494742_sm.jpg', '0', '0', '0', '1', '1');
INSERT INTO `tr_brand` VALUES ('80', '享爱.', '服饰鞋帽', '04397468934349942_sm.jpg', '0', '0', '0', '1', '1');
INSERT INTO `tr_brand` VALUES ('81', '派丽蒙', '女装', '04397469152627878_sm.jpg', '0', '0', '0', '1', '4');
INSERT INTO `tr_brand` VALUES ('82', '康妮雅', '女装', '04397471448679692_sm.jpg', '0', '0', '0', '1', '4');
INSERT INTO `tr_brand` VALUES ('83', '秀秀美', '女装', '04397471716977022_sm.jpg', '0', '0', '0', '1', '4');
INSERT INTO `tr_brand` VALUES ('84', '阿迪达斯', '服饰鞋帽', '04397471910652190_sm.jpg', '0', '1', '0', '1', '1');
INSERT INTO `tr_brand` VALUES ('85', '猫人', '内衣', '04397472152849925_sm.jpg', '0', '0', '0', '1', '6');
INSERT INTO `tr_brand` VALUES ('86', '茵曼（INMAN）', 'T恤', '04397472336312422_sm.jpg', '0', '0', '0', '1', '12');
INSERT INTO `tr_brand` VALUES ('87', 'Hanes恒适', '服饰鞋帽', '04397472577467506_sm.jpg', '0', '0', '0', '1', '1');
INSERT INTO `tr_brand` VALUES ('88', '缪诗', '休闲鞋', '04397472716852803_sm.jpg', '0', '0', '0', '1', '74');
INSERT INTO `tr_brand` VALUES ('89', '真维斯', '服饰鞋帽', '04397472838086984_sm.jpg', '0', '1', '0', '1', '1');
INSERT INTO `tr_brand` VALUES ('90', '金利来', '西服', '04397473042647991_sm.jpg', '0', '0', '0', '1', '47');
INSERT INTO `tr_brand` VALUES ('91', '其乐', '休闲鞋', '04397473331842699_sm.jpg', '0', '1', '0', '1', '109');
INSERT INTO `tr_brand` VALUES ('92', 'Newbalance', '功能鞋', '04397473633585549_sm.jpg', '0', '1', '0', '1', '112');
INSERT INTO `tr_brand` VALUES ('93', '百丽', '女鞋', '04398088925179484_sm.png', '0', '1', '0', '1', '8');
INSERT INTO `tr_brand` VALUES ('94', '七匹狼', '服饰鞋帽', '04398089136939537_sm.jpg', '0', '1', '0', '1', '1');
INSERT INTO `tr_brand` VALUES ('95', '李宁', '运动', '04398089270610035_sm.jpg', '0', '0', '0', '1', '7');
INSERT INTO `tr_brand` VALUES ('96', '佐丹奴', '服饰鞋帽', '04398089412399747_sm.jpg', '0', '1', '0', '1', '1');
INSERT INTO `tr_brand` VALUES ('97', '百思图', '休闲鞋', '04398089574801901_sm.jpg', '0', '0', '0', '1', '93');
INSERT INTO `tr_brand` VALUES ('98', '斯波帝卡', '男装', '04398089726299223_sm.jpg', '0', '0', '0', '1', '5');
INSERT INTO `tr_brand` VALUES ('99', '梦特娇', '男装', '04398089942879365_sm.jpg', '0', '1', '0', '1', '5');
INSERT INTO `tr_brand` VALUES ('100', '宝姿', '服饰鞋帽', '04398090061006740_sm.jpg', '0', '1', '0', '1', '1');
INSERT INTO `tr_brand` VALUES ('101', '爱帝', '服饰鞋帽', '04398090218578648_sm.jpg', '0', '0', '0', '1', '1');
INSERT INTO `tr_brand` VALUES ('102', '她他/tata', '高跟鞋', '04398090459092275_sm.jpg', '0', '0', '0', '1', '91');
INSERT INTO `tr_brand` VALUES ('103', 'ELLE HOME', '服饰鞋帽', '04398090611386532_sm.jpg', '0', '1', '0', '1', '1');
INSERT INTO `tr_brand` VALUES ('104', 'esprit', '女装', '04398090828687339_sm.jpg', '0', '1', '0', '1', '4');
INSERT INTO `tr_brand` VALUES ('105', 'westside', '服饰鞋帽', '04398090975832253_sm.jpg', '0', '0', '0', '1', '1');
INSERT INTO `tr_brand` VALUES ('106', 'RDK', '睡衣', '04398091763582415_sm.jpg', '0', '0', '0', '1', '62');
INSERT INTO `tr_brand` VALUES ('107', '皮尔卡丹', '风衣', '04398091877500105_sm.jpg', '0', '0', '0', '1', '43');
INSERT INTO `tr_brand` VALUES ('108', '挪巍', '服饰鞋帽', '04398091973797599_sm.jpg', '0', '0', '0', '1', '1');
INSERT INTO `tr_brand` VALUES ('113', '波斯顿', '个护化妆', '04398099293923325_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('114', '薇姿', '个护化妆', '04398099463167230_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('115', '相宜本草', '个护化妆', '04398099611242673_sm.jpg', '0', '1', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('116', 'Dior', '个护化妆', '04398099738566948_sm.jpg', '0', '1', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('117', '苏菲', '个护化妆', '04398099870651075_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('118', 'faceshop', '个护化妆', '04398100051941493_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('119', '芙丽芳丝', '个护化妆', '04398100178308363_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('120', '娇爽', '个护化妆', '04398100362129645_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('121', '卡尼尔', '个护化妆', '04398100483927289_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('122', '纪梵希', '个护化妆', '04398100614445814_sm.jpg', '0', '1', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('123', '护舒宝', '个护化妆', '04398100738554064_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('124', '兰蔻', '个护化妆', '04398100899214207_sm.jpg', '0', '1', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('125', '娇兰', '个护化妆', '04398101035858820_sm.jpg', '0', '1', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('126', '高丝洁', '个护化妆', '04398101363358081_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('127', '妮维雅', '个护化妆', '04398101539246004_sm.jpg', '0', '1', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('128', '高丝', '个护化妆', '04398101708424765_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('129', '狮王', '个护化妆', '04398101929845854_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('130', '雅顿', '个护化妆', '04398102086535787_sm.jpg', '0', '1', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('131', 'M.A.C', '个护化妆', '04398102231196519_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('132', '李施德林', '个护化妆', '04398102411008632_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('133', '雅诗兰黛', '个护化妆', '04398102581821577_sm.jpg', '0', '1', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('134', 'MISS FACE', '个护化妆', '04398102756025036_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('135', '佳洁士', '个护化妆', '04398102918746492_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('136', '资生堂', '个护化妆', '04398103163925153_sm.jpg', '0', '1', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('137', '倩碧', '个护化妆', '04398103335196758_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('138', 'benefit', '个护化妆', '04398103525876196_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('139', 'SISLEY', '个护化妆', '04398103731155516_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('140', '爱丽', '个护化妆', '04398103883736888_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('141', 'BOBBI BROWN', '个护化妆', '04398104034802420_sm.jpg', '0', '0', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('142', 'SK-ll', '个护化妆', '04398104206717960_sm.jpg', '0', '1', '0', '1', '470');
INSERT INTO `tr_brand` VALUES ('143', '施华洛世奇', '珠宝手表', '04398116735872287_sm.jpg', '0', '1', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('144', '万宝龙', '珠宝手表', '04398116855649611_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('145', 'CK', '珠宝手表', '04398116986166995_sm.jpg', '0', '1', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('146', 'Disney', '珠宝手表', '04398117134560677_sm.jpg', '0', '1', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('147', '佐卡伊', '珠宝手表', '04398117259027285_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('148', 'ZIPPO', '', '04398117390207814_sm.gif', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('149', '梅花', '珠宝手表', '04398117504203345_sm.jpg', '0', '1', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('150', '高仕', '珠宝手表', '04398117735732690_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('151', '宝玑', '珠宝手表', '04398117910949174_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('152', '一生一石', '珠宝手表', '04398118118206423_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('153', 'IDee', '珠宝手表', '04398118344918440_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('154', 'elle', '珠宝手表', '04398118494505137_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('155', '卡西欧', '珠宝手表', '04398118617326698_sm.jpg', '0', '1', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('156', '爱卡', '珠宝手表', '04398118792328978_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('157', '帝舵', '珠宝手表', '04398118894311290_sm.jpg', '0', '1', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('158', '新秀', '珠宝手表', '04398119032319322_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('159', '九钻', '珠宝手表', '04398119151718735_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('160', '卡地亚', '珠宝手表', '04398119311706852_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('161', '蓝色多瑙河', '珠宝手表', '04398119501897486_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('162', '浪琴', '珠宝手表', '04398119677440904_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('163', '百利恒', '珠宝手表', '04398119859319840_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('164', '欧米茄', '珠宝手表', '04398119996858692_sm.jpg', '0', '1', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('165', 'tissot', '珠宝手表', '04398120131178815_sm.jpg', '0', '1', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('166', '新光饰品', '珠宝手表', '04398120247306694_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('167', '英雄', '珠宝手表', '04398120419590838_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('168', '瑞士军刀', '珠宝手表', '04398120584040229_sm.gif', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('169', '斯沃琪', '珠宝手表', '04398121090096799_sm.jpg', '0', '1', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('170', '阿玛尼', '珠宝手表', '04398121209932680_sm.jpg', '0', '1', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('171', '亨得利', '珠宝手表', '04398125089603514_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('172', 'lux-women', '珠宝手表', '04398125296052150_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('173', 'ooh Dear', '珠宝手表', '04398125473712411_sm.jpg', '0', '0', '0', '1', '530');
INSERT INTO `tr_brand` VALUES ('174', 'acer', '数码办公', '04398155389308089_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('175', '清华同方', '数码办公', '04398155613517981_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('176', '富士通', '数码办公', '04398155751072786_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('177', '微软', '数码办公', '04398155862912765_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('178', '得力', '数码办公', '04398156045665837_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('179', 'DELL', '数码办公', '04398156232757027_sm.jpg', '0', '1', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('180', 'ThinkPad', '数码办公', '04398156358858442_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('181', '联想打印机', '数码办公', '04398156503421310_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('182', '金士顿', '数码办公', '04398156705753579_sm.jpg', '0', '1', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('183', 'TP-LINK', '数码办公', '04398156873572761_sm.jpg', '0', '1', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('184', '华硕', '数码办公', '04398157012150899_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('185', '罗技', '数码办公', '04398157235673753_sm.jpg', '0', '1', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('186', 'D-Link', '数码办公', '04398157356404105_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('187', '雷蛇', '数码办公', '04398157472174891_sm.jpg', '0', '1', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('188', 'IT-CEO', '数码办公', '04398157595321784_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('189', 'hyundri', '数码办公', '04398157712394024_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('190', '惠普', '数码办公', '04398157881561725_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('191', '迈乐', '数码办公', '04398158065769057_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('192', '爱普生', '数码办公', '04398158266047493_sm.jpg', '0', '1', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('193', '三木', '数码办公', '04398158379932048_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('194', '忆捷', '数码办公', '04398158508475720_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('195', '佰科', '数码办公', '04398158666713881_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('196', '飞利浦', '数码办公', '04398158808225051_sm.jpg', '0', '1', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('197', '雷柏', '数码办公', '04398158987559915_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('198', '双飞燕', '数码办公', '04398159147857437_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('199', '网件', '数码办公', '04398159314915358_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('200', '山泽', '数码办公', '04398159479959395_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('201', '松下', '数码办公', '04398159595550035_sm.jpg', '0', '1', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('202', 'TPOS', '数码办公', '04398159795526441_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('203', '富勒', '数码办公', '04398159927301628_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('204', '北通', '数码办公', '04398160061664664_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('205', 'romoss', '数码办公', '04398160187629402_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('206', '索爱', '数码办公', '04398160348310562_sm.gif', '0', '1', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('207', '台电', '数码办公', '04398160575221477_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('208', '三星', '数码办公', '04398160720944823_sm.jpg', '0', '1', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('209', '理光', '数码办公', '04398160857676307_sm.gif', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('210', '飞毛腿', '数码办公', '04398161023292593_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('211', '阿尔卡特', '数码办公', '04398161143888870_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('212', '诺基亚', '数码办公', '04398161259006857_sm.gif', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('213', '摩托罗拉', '数码办公', '04398161410885588_sm.gif', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('214', '苹果', '数码办公', '04398168923750202_sm.png', '0', '1', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('215', 'HTC', '数码办公', '04398169850955399_sm.jpg', '0', '0', '0', '1', '256');
INSERT INTO `tr_brand` VALUES ('216', '九阳', '家用电器', '04399844516657174_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('217', '索尼', '家用电器', '04399833099806870_sm.gif', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('218', '格力', '家用电器', '04399833262328490_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('219', '夏普', '家用电器', '04399833425234004_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('220', '美的', '家用电器', '04399833601121412_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('221', '博朗', '家用电器', '04399833768343488_sm.gif', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('222', 'TCL', '家用电器', '04399833953558287_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('223', '欧姆龙', '家用电器', '04399834117653152_sm.gif', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('224', '苏泊尔', '家用电器', '04399834427362760_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('225', '伊莱克斯', '家用电器', '04399834676870929_sm.gif', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('226', '艾力斯特', '家用电器', '04399835435836906_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('227', '西门子', '家用电器', '04399835594337307_sm.gif', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('228', '三菱电机', '家用电器', '04399835807315767_sm.gif', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('229', '奔腾', '家用电器', '04399836030618924_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('230', '三洋', '家用电器', '04399836185660687_sm.gif', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('231', '大金', '家用电器', '04399836403301996_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('232', '三星电器', '家用电器', '04399836619819860_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('233', '海尔', '家用电器', '04399837024444210_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('234', '格兰仕', '家用电器', '04399837873721609_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('235', '海信', '家用电器', '04399838032416433_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('236', '博世', '家用电器', '04399838243363042_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('237', '老板', '家用电器', '04399838473427197_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('238', '奥克斯', '家用电器', '04399838633002147_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('239', 'LG', '家用电器', '04399838782976323_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('240', '创维', '家用电器', '04399839110204841_sm.jpg', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('241', '松下电器', '家用电器', '04399839604098052_sm.gif', '0', '0', '0', '1', '308');
INSERT INTO `tr_brand` VALUES ('242', '中国联通', '虚拟充值', '04399847297781057_sm.jpg', '0', '0', '0', '1', '1037');
INSERT INTO `tr_brand` VALUES ('243', '中国电信', '虚拟充值', '04399847472066981_sm.jpg', '0', '0', '0', '1', '1037');
INSERT INTO `tr_brand` VALUES ('244', '中国移动', '虚拟充值', '04399847612667714_sm.jpg', '0', '0', '0', '1', '1037');
INSERT INTO `tr_brand` VALUES ('245', '一品玉', '食品饮料', '04399854316938195_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('246', '金奥力', '食品饮料', '04399854503149255_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('247', '北大荒', '食品饮料', '04399854638913791_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('248', '健安喜', '食品饮料', '04399854806939714_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('249', '屯河', '食品饮料', '04399854945115195_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('250', '养生堂', '食品饮料', '04399855140966866_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('251', '同庆和堂', '食品饮料', '04399855332734276_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('252', '黄飞红', '食品饮料', '04399855513686549_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('253', '乐力', '食品饮料', '04399855699218750_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('254', '汤臣倍健', '食品饮料', '04399855941379731_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('255', '康比特', '食品饮料', '04399856135110739_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('256', '喜瑞', '食品饮料', '04399856323294870_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('257', '同仁堂', '食品饮料', '04399856454919811_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('258', '白兰氏', '食品饮料', '04399856638765013_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('259', 'Lumi', '食品饮料', '04399856804968818_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('260', '新西兰十一坊', '食品饮料', '04399856948519746_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('261', '自然之宝', '食品饮料', '04399857092677752_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('262', '善存', '食品饮料', '04399857246559825_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('263', '长城葡萄酒', '食品饮料', '04399857399887704_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('264', '凯镛', '食品饮料', '04399857579422195_sm.jpg', '0', '0', '0', '1', '593');
INSERT INTO `tr_brand` VALUES ('267', '惠氏', '母婴用品', '04399878077210018_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('268', 'lala布书', '母婴用品', '04399878481448839_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('269', '美赞臣', '母婴用品', '04399878617014779_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('270', '好奇', '母婴用品', '04399878791943342_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('271', '多美', '母婴用品', '04399878980307860_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('272', '嘉宝', '母婴用品', '04399879383821119_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('273', '孩之宝', '母婴用品', '04399879573077116_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('274', '嗳呵', '母婴用品', '04399879712252398_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('275', '美斯特伦', '母婴用品', '04399879861821747_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('276', '乐高', '母婴用品', '04399880083330972_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('277', '芭比', '母婴用品', '04399880244694286_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('278', 'NUK', '母婴用品', '04399880420786755_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('279', '魔法玉米', '母婴用品', '04399880604749242_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('280', '宝贝第一', '母婴用品', '04399880757446523_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('281', '强生', '母婴用品', '04399880892528550_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('282', '澳优', '母婴用品', '04399881087936122_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('283', '木马智慧', '母婴用品', '04399881246572965_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('284', '百立乐', '母婴用品', '04399881709264364_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('285', '雀巢', '母婴用品', '04399881950170970_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('286', '帮宝适', '母婴用品', '04399882134949479_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('287', '万代', '母婴用品', '04399882291234767_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('288', '亲贝', '母婴用品', '04399882442124015_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('289', '十月天使', '母婴用品', '04399882581513663_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('290', '多美滋', '母婴用品', '04399882826616164_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('291', '星辉', '母婴用品', '04399882966084988_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('292', '布朗博士', '母婴用品', '04399883157641690_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('293', '新安怡', '母婴用品', '04399883297614786_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('294', '费雪', '母婴用品', '04399883534332035_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('295', 'Hipp', '母婴用品', '04399883690219411_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('296', '新大王', '母婴用品', '04399883855598553_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('297', '雅培', '母婴用品', '04399884035362889_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('298', '亨氏', '母婴用品', '04399884182772511_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('299', '十月妈咪', '母婴用品', '04399884360526483_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('300', '好孩子', '母婴用品', '04399884512865285_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('301', '婴姿坊', '母婴用品', '04399884644632532_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('302', '妈咪宝贝', '母婴用品', '04399884799920935_sm.jpg', '0', '0', '0', '1', '959');
INSERT INTO `tr_brand` VALUES ('303', '直觉', '运动健康', '04399889262024650_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('304', '世达球', '运动健康', '04399889410183423_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('305', '悠度', '运动健康', '04399889744222357_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('306', '威尔胜', '运动健康', '04399889941968796_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('307', '远洋瑜伽', '运动健康', '04399890266352034_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('308', '信乐', '运动健康', '04399890429362085_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('309', '诺可文', '运动健康', '04399890643925803_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('310', '艾威', '运动健康', '04399890796771131_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('311', 'LELO', '运动健康', '04399890952734102_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('312', '乔山', '运动健康', '04399891122713199_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('313', '皮克朋', '运动健康', '04399891285897466_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('314', '捷安特', '运动健康', '04399891438458842_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('315', '开普特', '运动健康', '04399891598799644_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('316', '火枫', '运动健康', '04399891771381530_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('317', 'INDEED', '运动健康', '04399891911058029_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('318', '欧亚马', '运动健康', '04399892067310657_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('319', '李斯特', '运动健康', '04399892199751417_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('320', '乐美福', '运动健康', '04399892359082323_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('321', '以比赞', '运动健康', '04399892526357198_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('322', '皮尔瑜伽', '运动健康', '04399893307910546_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('323', '以诗萜', '运动健康', '04399893452531024_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('324', '斯伯丁', '运动健康', '04399893596931049_sm.jpg', '0', '0', '0', '1', '662');
INSERT INTO `tr_brand` VALUES ('326', '玛克', '', '04399902137097199_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('327', '美好家', '', '04399902244747580_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('328', '溢彩年华', '', '04399902391635130_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('329', '欧司朗', '', '04399902537418591_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('330', '世家洁具', '', '04399902668760247_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('331', '天堂伞', '', '04399902780394855_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('332', '慧乐家', '', '04399902896835151_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('333', '希格', '', '04399903024936544_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('334', '生活诚品', '', '04399903153847612_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('335', '爱仕达', '', '04399903259361371_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('336', '罗莱', '', '04399903404912119_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('337', '索客', '', '04399903541756673_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('338', '好事达', '', '04399903715622158_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('339', '安睡宝', '', '04399903832203331_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('340', '博洋家纺', '', '04399903956723469_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('341', '空间大师', '', '04399904058344749_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('342', '富安娜', '', '04399904168163421_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('343', '三光云彩', '', '04399904279499345_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('344', '乔曼帝', '', '04399904423386126_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('345', '乐扣乐扣', '', '04399904614221217_sm.jpg', '0', '0', '0', '1', '0');
INSERT INTO `tr_brand` VALUES ('348', '奥唯嘉（Ovega）', '文胸', '04431812331259168_sm.jpg', '0', '0', '0', '1', '58');
INSERT INTO `tr_brand` VALUES ('351', '曼妮芬（ManniForm）', '内衣', '04431810033957836_sm.jpg', '0', '0', '0', '1', '6');
INSERT INTO `tr_brand` VALUES ('352', '婷美（TINGMEI）', '内衣', '04431809546541815_sm.png', '0', '0', '0', '1', '6');
INSERT INTO `tr_brand` VALUES ('353', '古今', '内衣', '04431807497959652_sm.jpg', '0', '0', '0', '1', '6');
INSERT INTO `tr_brand` VALUES ('358', '金史密斯（KINGSMITH）', '健身器械', '04420592440315393_small.gif', '0', '1', '4', '1', '691');
INSERT INTO `tr_brand` VALUES ('359', '周大福', '纯金K金饰品', '04420650490304114_sm.jpg', '0', '0', '0', '1', '532');
INSERT INTO `tr_brand` VALUES ('360', '周生生', '纯金K金饰品', '04420650201635924_sm.jpg', '0', '0', '0', '1', '532');
INSERT INTO `tr_brand` VALUES ('364', 'BH (必艾奇)', '运动器械', '04420633630909218_small.jpg', '0', '1', '4', '1', '665');

-- ----------------------------
-- Table structure for `tr_cart`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cart`;
CREATE TABLE `tr_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `buyer_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '买家id',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '购买商品数量',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  `bl_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '组合套装ID',
  PRIMARY KEY (`cart_id`),
  KEY `member_id` (`buyer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车数据表';

-- ----------------------------
-- Records of tr_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_chat_log`
-- ----------------------------
DROP TABLE IF EXISTS `tr_chat_log`;
CREATE TABLE `tr_chat_log` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `f_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `f_name` varchar(50) NOT NULL COMMENT '会员名',
  `f_ip` varchar(15) NOT NULL COMMENT '发自IP',
  `t_id` int(10) unsigned NOT NULL COMMENT '接收会员ID',
  `t_name` varchar(50) NOT NULL COMMENT '接收会员名',
  `t_msg` varchar(300) DEFAULT NULL COMMENT '消息内容',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`m_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息记录表';

-- ----------------------------
-- Records of tr_chat_log
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_chat_msg`
-- ----------------------------
DROP TABLE IF EXISTS `tr_chat_msg`;
CREATE TABLE `tr_chat_msg` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `f_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `f_name` varchar(50) NOT NULL COMMENT '会员名',
  `f_ip` varchar(15) NOT NULL COMMENT '发自IP',
  `t_id` int(10) unsigned NOT NULL COMMENT '接收会员ID',
  `t_name` varchar(50) NOT NULL COMMENT '接收会员名',
  `t_msg` varchar(300) DEFAULT NULL COMMENT '消息内容',
  `r_state` tinyint(1) unsigned DEFAULT '2' COMMENT '状态:1为已读,2为未读,默认为2',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`m_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Records of tr_chat_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle`;
CREATE TABLE `tr_circle` (
  `circle_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '圈子id',
  `circle_name` varchar(12) NOT NULL COMMENT '圈子名称',
  `circle_desc` varchar(255) DEFAULT NULL COMMENT '圈子描述',
  `circle_masterid` int(11) unsigned NOT NULL COMMENT '圈主id',
  `circle_mastername` varchar(50) NOT NULL COMMENT '圈主名称',
  `circle_img` varchar(50) DEFAULT NULL COMMENT '圈子图片',
  `class_id` int(11) unsigned NOT NULL COMMENT '圈子分类',
  `circle_mcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '圈子成员数',
  `circle_thcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '圈子主题数',
  `circle_gcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '圈子商品数',
  `circle_pursuereason` varchar(255) DEFAULT NULL COMMENT '圈子申请理由',
  `circle_notice` varchar(255) DEFAULT NULL COMMENT '圈子公告',
  `circle_status` tinyint(3) unsigned NOT NULL COMMENT '圈子状态，0关闭，1开启，2审核中，3审核失败',
  `circle_statusinfo` varchar(255) DEFAULT NULL COMMENT '关闭或审核失败原因',
  `circle_joinaudit` tinyint(3) unsigned NOT NULL COMMENT '加入圈子时候需要审核，0不需要，1需要',
  `circle_addtime` varchar(10) NOT NULL COMMENT '圈子创建时间',
  `circle_noticetime` varchar(10) DEFAULT NULL COMMENT '圈子公告更新时间',
  `is_recommend` tinyint(3) unsigned NOT NULL COMMENT '是否推荐 0未推荐，1已推荐',
  `is_hot` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为热门圈子 1是 0否',
  `circle_tag` varchar(60) DEFAULT NULL COMMENT '圈子标签',
  `new_verifycount` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '等待审核成员数',
  `new_informcount` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '等待处理举报数',
  `mapply_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '申请管理是否开启 0关闭，1开启',
  `mapply_ml` tinyint(4) NOT NULL DEFAULT '0' COMMENT '成员级别',
  `new_mapplycount` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理申请数量',
  PRIMARY KEY (`circle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='圈子表';

-- ----------------------------
-- Records of tr_circle
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_affix`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_affix`;
CREATE TABLE `tr_circle_affix` (
  `affix_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件id',
  `affix_filename` varchar(100) NOT NULL COMMENT '文件名称',
  `affix_filethumb` varchar(100) NOT NULL COMMENT '缩略图名称',
  `affix_filesize` int(10) unsigned NOT NULL COMMENT '文件大小，单位字节',
  `affix_addtime` varchar(10) NOT NULL COMMENT '上传时间',
  `affix_type` tinyint(3) unsigned NOT NULL COMMENT '文件类型 0无 1主题 2评论',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `theme_id` int(11) unsigned NOT NULL COMMENT '主题id',
  `reply_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  PRIMARY KEY (`affix_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of tr_circle_affix
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_class`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_class`;
CREATE TABLE `tr_circle_class` (
  `class_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '圈子分类id',
  `class_name` varchar(50) NOT NULL COMMENT '圈子分类名称',
  `class_addtime` varchar(10) NOT NULL COMMENT '圈子分类创建时间',
  `class_sort` tinyint(3) unsigned NOT NULL COMMENT '圈子分类排序',
  `class_status` tinyint(3) unsigned NOT NULL COMMENT '圈子分类状态 0不显示，1显示',
  `is_recommend` tinyint(3) unsigned NOT NULL COMMENT '是否推荐 0未推荐，1已推荐',
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='圈子分类表';

-- ----------------------------
-- Records of tr_circle_class
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_explog`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_explog`;
CREATE TABLE `tr_circle_explog` (
  `el_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '经验日志id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `member_id` int(11) unsigned NOT NULL COMMENT '成员id',
  `member_name` varchar(50) NOT NULL COMMENT '成员名称',
  `el_exp` int(10) NOT NULL COMMENT '获得经验',
  `el_time` varchar(10) NOT NULL COMMENT '获得时间',
  `el_type` tinyint(3) unsigned NOT NULL COMMENT '类型 1管理员操作 2发表话题 3发表回复 4话题被回复 5话题被删除 6回复被删除',
  `el_itemid` varchar(100) NOT NULL COMMENT '信息id',
  `el_desc` varchar(255) NOT NULL COMMENT '描述',
  PRIMARY KEY (`el_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='经验日志表';

-- ----------------------------
-- Records of tr_circle_explog
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_expmember`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_expmember`;
CREATE TABLE `tr_circle_expmember` (
  `member_id` int(11) NOT NULL COMMENT '成员id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `em_exp` int(10) NOT NULL COMMENT '获得经验',
  `em_time` varchar(10) NOT NULL COMMENT '获得时间',
  PRIMARY KEY (`member_id`,`circle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='成员每天获得经验表';

-- ----------------------------
-- Records of tr_circle_expmember
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_exptheme`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_exptheme`;
CREATE TABLE `tr_circle_exptheme` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '主题id',
  `et_exp` int(10) NOT NULL COMMENT '获得经验',
  `et_time` varchar(10) NOT NULL COMMENT '获得时间',
  PRIMARY KEY (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题每天获得经验表';

-- ----------------------------
-- Records of tr_circle_exptheme
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_fs`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_fs`;
CREATE TABLE `tr_circle_fs` (
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `friendship_id` int(11) unsigned NOT NULL COMMENT '友情圈子id',
  `friendship_name` varchar(11) NOT NULL COMMENT '友情圈子名称',
  `friendship_sort` tinyint(4) unsigned NOT NULL COMMENT '友情圈子排序',
  `friendship_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '友情圈子名称 1显示 0隐藏',
  PRIMARY KEY (`circle_id`,`friendship_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情圈子表';

-- ----------------------------
-- Records of tr_circle_fs
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_inform`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_inform`;
CREATE TABLE `tr_circle_inform` (
  `inform_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '举报id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `circle_name` varchar(12) NOT NULL COMMENT '圈子名称',
  `theme_id` int(11) unsigned NOT NULL COMMENT '话题id',
  `theme_name` varchar(50) NOT NULL COMMENT '主题名称',
  `reply_id` int(11) unsigned NOT NULL COMMENT '回复id',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `inform_content` varchar(255) NOT NULL COMMENT '举报内容',
  `inform_time` varchar(10) NOT NULL COMMENT '举报时间',
  `inform_type` tinyint(4) NOT NULL COMMENT '类型 0话题、1回复',
  `inform_state` tinyint(4) NOT NULL COMMENT '状态 0未处理、1已处理',
  `inform_opid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `inform_opname` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `inform_opexp` tinyint(4) NOT NULL COMMENT '操作经验',
  `inform_opresult` varchar(255) NOT NULL DEFAULT '' COMMENT '处理结果',
  PRIMARY KEY (`inform_id`),
  KEY `circle_id` (`circle_id`,`theme_id`,`reply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='圈子举报表';

-- ----------------------------
-- Records of tr_circle_inform
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_like`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_like`;
CREATE TABLE `tr_circle_like` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '主题id',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题赞表';

-- ----------------------------
-- Records of tr_circle_like
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_mapply`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_mapply`;
CREATE TABLE `tr_circle_mapply` (
  `mapply_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `member_id` int(11) unsigned NOT NULL COMMENT '成员id',
  `mapply_reason` varchar(255) NOT NULL COMMENT '申请理由',
  `mapply_time` varchar(10) NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`mapply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='申请管理表';

-- ----------------------------
-- Records of tr_circle_mapply
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_member`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_member`;
CREATE TABLE `tr_circle_member` (
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `circle_name` varchar(12) NOT NULL COMMENT '圈子名称',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `cm_applycontent` varchar(255) DEFAULT '' COMMENT '申请内容',
  `cm_applytime` varchar(10) NOT NULL COMMENT '申请时间',
  `cm_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0申请中 1通过 2未通过',
  `cm_intro` varchar(255) DEFAULT '' COMMENT '自我介绍',
  `cm_jointime` varchar(10) NOT NULL COMMENT '加入时间',
  `cm_level` int(11) NOT NULL DEFAULT '1' COMMENT '成员级别',
  `cm_levelname` varchar(10) NOT NULL DEFAULT '初级粉丝' COMMENT '成员头衔',
  `cm_exp` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '会员经验',
  `cm_nextexp` int(10) NOT NULL DEFAULT '5' COMMENT '下一级所需经验',
  `is_identity` tinyint(3) unsigned NOT NULL COMMENT '1圈主 2管理 3成员',
  `is_allowspeak` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许发言 1允许 0禁止',
  `is_star` tinyint(4) NOT NULL DEFAULT '0' COMMENT '明星成员 1是 0否',
  `cm_thcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '主题数',
  `cm_comcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复数',
  `cm_lastspeaktime` varchar(10) DEFAULT '' COMMENT '最后发言时间',
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐 1是 0否',
  PRIMARY KEY (`member_id`,`circle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='圈子会员表';

-- ----------------------------
-- Records of tr_circle_member
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_ml`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_ml`;
CREATE TABLE `tr_circle_ml` (
  `circle_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '圈子id',
  `mlref_id` int(10) DEFAULT NULL COMMENT '参考头衔id 0为默认 null为自定义',
  `ml_1` varchar(10) NOT NULL COMMENT '1级头衔名称',
  `ml_2` varchar(10) NOT NULL COMMENT '2级头衔名称',
  `ml_3` varchar(10) NOT NULL COMMENT '3级头衔名称',
  `ml_4` varchar(10) NOT NULL COMMENT '4级头衔名称',
  `ml_5` varchar(10) NOT NULL COMMENT '5级头衔名称',
  `ml_6` varchar(10) NOT NULL COMMENT '6级头衔名称',
  `ml_7` varchar(10) NOT NULL COMMENT '7级头衔名称',
  `ml_8` varchar(10) NOT NULL COMMENT '8级头衔名称',
  `ml_9` varchar(10) NOT NULL COMMENT '9级头衔名称',
  `ml_10` varchar(10) NOT NULL COMMENT '10级头衔名称',
  `ml_11` varchar(10) NOT NULL COMMENT '11级头衔名称',
  `ml_12` varchar(10) NOT NULL COMMENT '12级头衔名称',
  `ml_13` varchar(10) NOT NULL COMMENT '13级头衔名称',
  `ml_14` varchar(10) NOT NULL COMMENT '14级头衔名称',
  `ml_15` varchar(10) NOT NULL COMMENT '15级头衔名称',
  `ml_16` varchar(10) NOT NULL COMMENT '16级头衔名称',
  PRIMARY KEY (`circle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员头衔表';

-- ----------------------------
-- Records of tr_circle_ml
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_mldefault`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_mldefault`;
CREATE TABLE `tr_circle_mldefault` (
  `mld_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '头衔等级',
  `mld_name` varchar(10) NOT NULL COMMENT '头衔名称',
  `mld_exp` int(10) NOT NULL COMMENT '所需经验值',
  PRIMARY KEY (`mld_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='成员头衔默认设置表';

-- ----------------------------
-- Records of tr_circle_mldefault
-- ----------------------------
INSERT INTO `tr_circle_mldefault` VALUES ('1', '初级粉丝', '1');
INSERT INTO `tr_circle_mldefault` VALUES ('2', '中级粉丝', '5');
INSERT INTO `tr_circle_mldefault` VALUES ('3', '高级粉丝', '15');
INSERT INTO `tr_circle_mldefault` VALUES ('4', '正式会员', '30');
INSERT INTO `tr_circle_mldefault` VALUES ('5', '正式会员', '50');
INSERT INTO `tr_circle_mldefault` VALUES ('6', '核心会员', '100');
INSERT INTO `tr_circle_mldefault` VALUES ('7', '核心会员', '200');
INSERT INTO `tr_circle_mldefault` VALUES ('8', '铁杆会员', '500');
INSERT INTO `tr_circle_mldefault` VALUES ('9', '铁杆会员', '1000');
INSERT INTO `tr_circle_mldefault` VALUES ('10', '知名人士', '2000');
INSERT INTO `tr_circle_mldefault` VALUES ('11', '知名人士', '3000');
INSERT INTO `tr_circle_mldefault` VALUES ('12', '人气楷模', '6000');
INSERT INTO `tr_circle_mldefault` VALUES ('13', '人气楷模', '10000');
INSERT INTO `tr_circle_mldefault` VALUES ('14', '意见领袖', '18000');
INSERT INTO `tr_circle_mldefault` VALUES ('15', '资深元老', '30000');
INSERT INTO `tr_circle_mldefault` VALUES ('16', '荣耀元老', '60000');

-- ----------------------------
-- Table structure for `tr_circle_mlref`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_mlref`;
CREATE TABLE `tr_circle_mlref` (
  `mlref_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '参考头衔id',
  `mlref_name` varchar(10) NOT NULL COMMENT '参考头衔名称',
  `mlref_addtime` varchar(10) NOT NULL COMMENT '创建时间',
  `mlref_status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `mlref_1` varchar(10) NOT NULL COMMENT '1级头衔名称',
  `mlref_2` varchar(10) NOT NULL COMMENT '2级头衔名称',
  `mlref_3` varchar(10) NOT NULL COMMENT '3级头衔名称',
  `mlref_4` varchar(10) NOT NULL COMMENT '4级头衔名称',
  `mlref_5` varchar(10) NOT NULL COMMENT '5级头衔名称',
  `mlref_6` varchar(10) NOT NULL COMMENT '6级头衔名称',
  `mlref_7` varchar(10) NOT NULL COMMENT '7级头衔名称',
  `mlref_8` varchar(10) NOT NULL COMMENT '8级头衔名称',
  `mlref_9` varchar(10) NOT NULL COMMENT '9级头衔名称',
  `mlref_10` varchar(10) NOT NULL COMMENT '10级头衔名称',
  `mlref_11` varchar(10) NOT NULL COMMENT '11级头衔名称',
  `mlref_12` varchar(10) NOT NULL COMMENT '12级头衔名称',
  `mlref_13` varchar(10) NOT NULL COMMENT '13级头衔名称',
  `mlref_14` varchar(10) NOT NULL COMMENT '14级头衔名称',
  `mlref_15` varchar(10) NOT NULL COMMENT '15级头衔名称',
  `mlref_16` varchar(10) NOT NULL COMMENT '16级头衔名称',
  PRIMARY KEY (`mlref_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员参考头衔表';

-- ----------------------------
-- Records of tr_circle_mlref
-- ----------------------------
INSERT INTO `tr_circle_mlref` VALUES ('1', '校园系列', '1371784037', '1', '托儿所', '幼儿园', '学前班', '一年级', '二年级', '三年级', '四年级', '五年级', '六年级', '初一', '初二', '初三', '高一', '高二', '高三', '大学');
INSERT INTO `tr_circle_mlref` VALUES ('2', '名气系列', '1371797598', '1', '默默无闻', '崭露头角', '锋芒毕露', '小有名气', '小有美名', '颇具名气', '颇具盛名', '富有名气', '富有美誉', '远近闻名', '崭露头角', '声名远扬', '赫赫有名', '大名鼎鼎', '如雷贯耳', '名扬四海');
INSERT INTO `tr_circle_mlref` VALUES ('3', '内涵系列', '1371884423', '1', '1L喂熊', '抢个沙发', '自带板凳', '路人甲君', '打酱油的', '华丽飘过', '前来围观', '我勒个去', '亮了瞎了', '兰州烧饼', '鸭梨山大', '笑而不语', '内牛满面', '虎躯一震', '霸气外露', '此贴必火');
INSERT INTO `tr_circle_mlref` VALUES ('4', '军衔系列', '1371884788', '1', '下士', '中士', '上士', '少尉', '中尉', '上尉', '大尉', '少校', '中校', '上校', '大校', '少将', '中将', '上将', '大将', '元帅');
INSERT INTO `tr_circle_mlref` VALUES ('5', '书生系列', '1371884953', '1', '白丁', '童生', '秀才', '举人', '举人', '贡士', '进士', '进士', '进士', '探花', '探花', '榜眼', '榜眼', '状元', '状元', '圣贤');
INSERT INTO `tr_circle_mlref` VALUES ('6', '武侠系列', '1371885047', '1', '初涉江湖', '无名之辈', '仗剑天涯', '人海孤鸿', '四方游侠', '江湖少侠', '后起之秀', '武林新贵', '武林高手', '英雄豪杰', '人中龙凤', '自成一派', '名震江湖', '武林盟主', '一代宗师', '笑傲江湖');

-- ----------------------------
-- Table structure for `tr_circle_recycle`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_recycle`;
CREATE TABLE `tr_circle_recycle` (
  `recycle_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '回收站id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `circle_name` varchar(12) NOT NULL COMMENT '圈子名称',
  `theme_name` varchar(50) NOT NULL COMMENT '主题名称',
  `recycle_content` text NOT NULL COMMENT '内容',
  `recycle_opid` int(11) unsigned NOT NULL COMMENT '操作人id',
  `recycle_opname` varchar(50) NOT NULL COMMENT '操作人名称',
  `recycle_type` tinyint(3) unsigned NOT NULL COMMENT '类型 1话题，2回复',
  `recycle_time` varchar(10) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`recycle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='圈子回收站表';

-- ----------------------------
-- Records of tr_circle_recycle
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_thclass`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_thclass`;
CREATE TABLE `tr_circle_thclass` (
  `thclass_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主题分类id',
  `thclass_name` varchar(20) NOT NULL COMMENT '主题名称',
  `thclass_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '主题状态 1开启，0关闭',
  `is_moderator` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理专属 1是，0否',
  `thclass_sort` tinyint(3) unsigned NOT NULL COMMENT '分类排序',
  `circle_id` int(11) unsigned NOT NULL COMMENT '所属圈子id',
  PRIMARY KEY (`thclass_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='圈子主题分类表';

-- ----------------------------
-- Records of tr_circle_thclass
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_theme`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_theme`;
CREATE TABLE `tr_circle_theme` (
  `theme_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主题id',
  `theme_name` varchar(50) NOT NULL COMMENT '主题名称',
  `theme_content` text NOT NULL COMMENT '主题内容',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `circle_name` varchar(12) NOT NULL COMMENT '圈子名称',
  `thclass_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '主题分类id',
  `thclass_name` varchar(20) NOT NULL COMMENT '主题分类名称',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `is_identity` tinyint(3) unsigned NOT NULL COMMENT '1圈主 2管理 3成员',
  `theme_addtime` varchar(10) NOT NULL COMMENT '主题发表时间',
  `theme_editname` varchar(50) DEFAULT NULL COMMENT '编辑人名称',
  `theme_edittime` varchar(10) DEFAULT NULL COMMENT '主题编辑时间',
  `theme_likecount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数量',
  `theme_commentcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  `theme_browsecount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `theme_sharecount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分享数量',
  `is_stick` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶 1是  0否',
  `is_digest` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否加精 1是 0否',
  `lastspeak_id` int(11) unsigned DEFAULT NULL COMMENT '最后发言人id',
  `lastspeak_name` varchar(50) DEFAULT NULL COMMENT '最后发言人名称',
  `lastspeak_time` varchar(10) DEFAULT NULL COMMENT '最后发言时间',
  `has_goods` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品标记 1是 0否',
  `has_affix` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件标记 1是 0 否',
  `is_closed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '屏蔽 1是 0否',
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐 1是 0否',
  `is_shut` tinyint(4) NOT NULL DEFAULT '0' COMMENT '主题是否关闭 1是 0否',
  `theme_exp` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '获得经验',
  `theme_readperm` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  `theme_special` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '特殊话题 0普通 1投票',
  PRIMARY KEY (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='圈子主题表';

-- ----------------------------
-- Records of tr_circle_theme
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_thg`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_thg`;
CREATE TABLE `tr_circle_thg` (
  `themegoods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主题商品id',
  `theme_id` int(11) NOT NULL COMMENT '主题id',
  `reply_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_image` varchar(1000) NOT NULL COMMENT '商品图片',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `thg_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '商品类型 0为本商城、1为淘宝 默认为0',
  `thg_url` varchar(1000) DEFAULT NULL COMMENT '商品链接',
  PRIMARY KEY (`themegoods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题商品表';

-- ----------------------------
-- Records of tr_circle_thg
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_thpoll`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_thpoll`;
CREATE TABLE `tr_circle_thpoll` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '话题id',
  `poll_multiple` tinyint(3) unsigned NOT NULL COMMENT '单/多选 0单选、1多选',
  `poll_startime` varchar(10) NOT NULL COMMENT '开始时间',
  `poll_endtime` varchar(10) NOT NULL COMMENT '结束时间',
  `poll_days` tinyint(3) unsigned NOT NULL COMMENT '投票天数',
  `poll_voters` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '投票参与人数',
  PRIMARY KEY (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投票表';

-- ----------------------------
-- Records of tr_circle_thpoll
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_thpolloption`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_thpolloption`;
CREATE TABLE `tr_circle_thpolloption` (
  `pollop_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '投票选项id',
  `theme_id` int(11) unsigned NOT NULL COMMENT '话题id',
  `pollop_option` varchar(80) NOT NULL COMMENT '投票选项',
  `pollop_votes` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '得票数',
  `pollop_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pollop_votername` mediumtext COMMENT '投票者名称',
  PRIMARY KEY (`pollop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投票选项表';

-- ----------------------------
-- Records of tr_circle_thpolloption
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_thpollvoter`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_thpollvoter`;
CREATE TABLE `tr_circle_thpollvoter` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '话题id',
  `member_id` int(11) unsigned NOT NULL COMMENT '成员id',
  `member_name` varchar(50) NOT NULL COMMENT '成员名称',
  `pollvo_options` mediumtext NOT NULL COMMENT '投票选项',
  `pollvo_time` varchar(10) NOT NULL COMMENT '投票选项',
  KEY `theme_id` (`theme_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='成员投票信息表';

-- ----------------------------
-- Records of tr_circle_thpollvoter
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_circle_threply`
-- ----------------------------
DROP TABLE IF EXISTS `tr_circle_threply`;
CREATE TABLE `tr_circle_threply` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '主题id',
  `reply_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `reply_content` text NOT NULL COMMENT '评论内容',
  `reply_addtime` varchar(10) NOT NULL COMMENT '发表时间',
  `reply_replyid` int(11) unsigned DEFAULT NULL COMMENT '回复楼层id',
  `reply_replyname` varchar(50) DEFAULT NULL COMMENT '回复楼层会员名称',
  `is_closed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '屏蔽 1是 0否',
  `reply_exp` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '获得经验',
  PRIMARY KEY (`theme_id`,`reply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题评论表';

-- ----------------------------
-- Records of tr_circle_threply
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_cms_article`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_article`;
CREATE TABLE `tr_cms_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `article_title` varchar(50) NOT NULL COMMENT '文章标题',
  `article_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类编号',
  `article_origin` varchar(50) DEFAULT NULL COMMENT '文章来源',
  `article_origin_address` varchar(255) DEFAULT NULL COMMENT '文章来源链接',
  `article_author` varchar(50) NOT NULL COMMENT '文章作者',
  `article_abstract` varchar(140) DEFAULT NULL COMMENT '文章摘要',
  `article_content` text COMMENT '文章正文',
  `article_image` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `article_keyword` varchar(255) DEFAULT NULL COMMENT '文章关键字',
  `article_link` varchar(255) DEFAULT NULL COMMENT '相关文章',
  `article_goods` text COMMENT '相关商品',
  `article_start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章有效期开始时间',
  `article_end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章有效期结束时间',
  `article_publish_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章发布时间',
  `article_click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章点击量',
  `article_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章排序0-255',
  `article_commend_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章推荐标志0-未推荐，1-已推荐',
  `article_comment_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否允许评论1-允许，0-不允许',
  `article_verify_admin` varchar(50) DEFAULT NULL COMMENT '文章审核管理员',
  `article_verify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章审核时间',
  `article_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1-草稿、2-待审核、3-已发布、4-回收站',
  `article_publisher_name` varchar(50) NOT NULL COMMENT '发布者用户名 ',
  `article_publisher_id` int(10) unsigned NOT NULL COMMENT '发布者编号',
  `article_type` tinyint(1) unsigned NOT NULL COMMENT '文章类型1-管理员发布，2-用户投稿',
  `article_attachment_path` varchar(50) NOT NULL COMMENT '文章附件路径',
  `article_image_all` text COMMENT '文章全部图片',
  `article_modify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章修改时间',
  `article_tag` varchar(255) DEFAULT NULL COMMENT '文章标签',
  `article_comment_count` int(10) unsigned NOT NULL COMMENT '文章评论数',
  `article_attitude_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情1',
  `article_attitude_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情2',
  `article_attitude_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情3',
  `article_attitude_4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情4',
  `article_attitude_5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情5',
  `article_attitude_6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情6',
  `article_title_short` varchar(50) NOT NULL DEFAULT '' COMMENT '文章短标题',
  `article_attitude_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章态度开关1-允许，0-不允许',
  `article_commend_image_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章推荐标志(图文)',
  `article_share_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分享数',
  `article_verify_reason` varchar(255) DEFAULT NULL COMMENT '审核失败原因',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CMS文章表';

-- ----------------------------
-- Records of tr_cms_article
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_cms_article_attitude`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_article_attitude`;
CREATE TABLE `tr_cms_article_attitude` (
  `attitude_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '心情编号',
  `attitude_article_id` int(10) unsigned NOT NULL COMMENT '文章编号',
  `attitude_member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `attitude_time` int(10) unsigned NOT NULL COMMENT '发布心情时间',
  PRIMARY KEY (`attitude_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CMS文章心情表';

-- ----------------------------
-- Records of tr_cms_article_attitude
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_cms_article_class`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_article_class`;
CREATE TABLE `tr_cms_article_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `class_name` varchar(50) NOT NULL COMMENT '分类名称',
  `class_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='cms文章分类表';

-- ----------------------------
-- Records of tr_cms_article_class
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_cms_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_comment`;
CREATE TABLE `tr_cms_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `comment_type` tinyint(1) NOT NULL COMMENT '评论类型编号',
  `comment_object_id` int(10) unsigned NOT NULL COMMENT '推荐商品编号',
  `comment_message` varchar(2000) NOT NULL COMMENT '评论内容',
  `comment_member_id` int(10) unsigned NOT NULL COMMENT '评论人编号',
  `comment_time` int(10) unsigned NOT NULL COMMENT '评论时间',
  `comment_quote` varchar(255) DEFAULT NULL COMMENT '评论引用',
  `comment_up` int(10) unsigned NOT NULL COMMENT '顶数量',
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CMS评论表';

-- ----------------------------
-- Records of tr_cms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_cms_comment_up`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_comment_up`;
CREATE TABLE `tr_cms_comment_up` (
  `up_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '顶编号',
  `comment_id` int(10) unsigned NOT NULL COMMENT '评论编号',
  `up_member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `up_time` int(10) unsigned NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`up_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CMS评论顶表';

-- ----------------------------
-- Records of tr_cms_comment_up
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_cms_index_module`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_index_module`;
CREATE TABLE `tr_cms_index_module` (
  `module_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块编号',
  `module_title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `module_name` varchar(50) NOT NULL COMMENT '模板名称',
  `module_type` varchar(50) DEFAULT '' COMMENT '模块类型，index-固定内容、article1-文章模块1、article2-文章模块2、micro-微商城、adv-通栏广告',
  `module_sort` tinyint(1) unsigned DEFAULT '255' COMMENT '排序',
  `module_state` tinyint(1) unsigned DEFAULT '1' COMMENT '状态1-显示、0-不显示',
  `module_content` text COMMENT '模块内容',
  `module_style` varchar(50) NOT NULL DEFAULT 'style1' COMMENT '模块主题',
  `module_view` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '后台列表显示样式 1-展开 2-折叠',
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CMS首页模块表';

-- ----------------------------
-- Records of tr_cms_index_module
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_cms_module`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_module`;
CREATE TABLE `tr_cms_module` (
  `module_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模板模块编号',
  `module_title` varchar(50) NOT NULL DEFAULT '' COMMENT '模板模块标题',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `module_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板模块类型，index-固定内容、article1-文章模块1、article2-文章模块2、micro-微商城、adv-通栏广告',
  `module_class` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '模板模块种类1-系统自带 2-用户自定义',
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS模板模块表';

-- ----------------------------
-- Records of tr_cms_module
-- ----------------------------
INSERT INTO `tr_cms_module` VALUES ('1', '综合模块', 'index', 'index', '1');
INSERT INTO `tr_cms_module` VALUES ('2', '微商城模块', 'micro', 'micro', '1');
INSERT INTO `tr_cms_module` VALUES ('3', '文章模块1', 'article1', 'article1', '1');
INSERT INTO `tr_cms_module` VALUES ('4', '文章模块2', 'article2', 'article2', '1');
INSERT INTO `tr_cms_module` VALUES ('5', '通栏广告模块', 'adv', 'adv', '1');

-- ----------------------------
-- Table structure for `tr_cms_module_assembly`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_module_assembly`;
CREATE TABLE `tr_cms_module_assembly` (
  `assembly_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '组件编号',
  `assembly_title` varchar(50) NOT NULL COMMENT '组件标题',
  `assembly_name` varchar(50) NOT NULL COMMENT '组件名称',
  `assembly_explain` varchar(255) NOT NULL COMMENT '组件说明',
  PRIMARY KEY (`assembly_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='cms模块组件表';

-- ----------------------------
-- Records of tr_cms_module_assembly
-- ----------------------------
INSERT INTO `tr_cms_module_assembly` VALUES ('1', '文章', 'article', '文章组件');
INSERT INTO `tr_cms_module_assembly` VALUES ('2', '图片', 'picture', '图片组件');
INSERT INTO `tr_cms_module_assembly` VALUES ('3', '商品', 'goods', '商品组件');
INSERT INTO `tr_cms_module_assembly` VALUES ('4', '品牌', 'brand', '品牌组件');
INSERT INTO `tr_cms_module_assembly` VALUES ('5', '图文', 'article_image', '图文');
INSERT INTO `tr_cms_module_assembly` VALUES ('6', '店铺', 'store', '店铺');
INSERT INTO `tr_cms_module_assembly` VALUES ('7', '会员', 'member', '会员');
INSERT INTO `tr_cms_module_assembly` VALUES ('8', 'FLASH', 'flash', 'FLASH');
INSERT INTO `tr_cms_module_assembly` VALUES ('9', '自定义', 'html', '自定义');

-- ----------------------------
-- Table structure for `tr_cms_module_frame`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_module_frame`;
CREATE TABLE `tr_cms_module_frame` (
  `frame_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '框架编号',
  `frame_title` varchar(50) NOT NULL COMMENT '框架标题',
  `frame_name` varchar(50) NOT NULL COMMENT '框架名称',
  `frame_explain` varchar(255) NOT NULL COMMENT '框架说明',
  `frame_structure` varchar(255) NOT NULL COMMENT '框架结构',
  PRIMARY KEY (`frame_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='cms模块框架表';

-- ----------------------------
-- Records of tr_cms_module_frame
-- ----------------------------
INSERT INTO `tr_cms_module_frame` VALUES ('1', '右边栏三列结构', '2_2_1', '右边栏三列结构', '{\"block1\":{\"type\":\"block\",\"name\":\"w2\"},\"block2\":{\"type\":\"block\",\"name\":\"w2\"},\"block3\":{\"type\":\"block\",\"name\":\"w1\"}}');
INSERT INTO `tr_cms_module_frame` VALUES ('2', '左边栏三列结构', '1_2_2', '左边栏三列结构', '{\"block1\":{\"type\":\"block\",\"name\":\"w1\"},\"block2\":{\"type\":\"block\",\"name\":\"w2\"},\"block3\":{\"type\":\"block\",\"name\":\"w2\"}}');
INSERT INTO `tr_cms_module_frame` VALUES ('3', '左右宽边栏结构', '2_1_2', '左右宽边栏结构', '{\"block1\":{\"type\":\"block\",\"name\":\"w2\"},\"block2\":{\"type\":\"block\",\"name\":\"w1\"},\"block3\":{\"type\":\"block\",\"name\":\"w2\"}}');
INSERT INTO `tr_cms_module_frame` VALUES ('4', '左边栏两列结构', '1_4', '左边栏两列结构', '{\"block1\":{\"type\":\"block\",\"name\":\"w1\"},\"block2\":{\"type\":\"block\",\"name\":\"w4\"}} ');
INSERT INTO `tr_cms_module_frame` VALUES ('5', '右边栏两列结构', '4_1', '右边栏两列结构', '{\"block1\":{\"type\":\"block\",\"name\":\"w4\"},\"block2\":{\"type\":\"block\",\"name\":\"w1\"}} ');
INSERT INTO `tr_cms_module_frame` VALUES ('6', '右边栏混合结构', '2x2_2_1', '右边栏混合结构', '{\"block1\":{\"type\":\"content\",\"name\":\"w2\",\"child\":{\"block2\":{\"type\":\"block\",\"name\":\"w22\"},\"block3\":{\"type\":\"block\",\"name\":\"w22\"}}},\"block4\":{\"type\":\"block\",\"name\":\"w2\"},\"block5\":{\"type\":\"block\",\"name\":\"w1\"}} ');
INSERT INTO `tr_cms_module_frame` VALUES ('7', '左边栏混合结构', '1_2_2x2', '左边栏混合结构', '{\"block1\":{\"type\":\"block\",\"name\":\"w1\"},\"block2\":{\"type\":\"block\",\"name\":\"w2\"},\"block3\":{\"type\":\"content\",\"name\":\"w2\",\"child\":{\"block4\":{\"type\":\"block\",\"name\":\"w22\"},\"block5\":{\"type\":\"block\",\"name\":\"w22\"}}}}');
INSERT INTO `tr_cms_module_frame` VALUES ('8', '一体化结构', '1', '一体化结构', '{\"block1\":{\"type\":\"block\",\"name\":\"w5\"}}');

-- ----------------------------
-- Table structure for `tr_cms_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_navigation`;
CREATE TABLE `tr_cms_navigation` (
  `navigation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航编号',
  `navigation_title` varchar(50) NOT NULL COMMENT '导航标题',
  `navigation_link` varchar(255) NOT NULL COMMENT '导航链接',
  `navigation_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `navigation_open_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '导航打开方式1-本页打开，2-新页打开',
  PRIMARY KEY (`navigation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS导航表';

-- ----------------------------
-- Records of tr_cms_navigation
-- ----------------------------
INSERT INTO `tr_cms_navigation` VALUES ('1', '商城', 'http://localhost/travel/', '255', '1');
INSERT INTO `tr_cms_navigation` VALUES ('2', '圈子', 'http://localhost/travel/circle', '255', '1');
INSERT INTO `tr_cms_navigation` VALUES ('3', '微商城', 'http://localhost/travel/microshop', '255', '1');
INSERT INTO `tr_cms_navigation` VALUES ('4', '品牌', 'http://localhost/travel/shop/index.php?act=brand', '255', '1');

-- ----------------------------
-- Table structure for `tr_cms_picture`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_picture`;
CREATE TABLE `tr_cms_picture` (
  `picture_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '画报编号',
  `picture_title` varchar(50) NOT NULL COMMENT '画报标题',
  `picture_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画报分类编号',
  `picture_author` varchar(50) NOT NULL COMMENT '画报作者',
  `picture_abstract` varchar(140) DEFAULT NULL COMMENT '画报摘要',
  `picture_image` varchar(255) DEFAULT NULL COMMENT '画报图片',
  `picture_keyword` varchar(255) DEFAULT NULL COMMENT '画报关键字',
  `picture_publish_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画报发布时间',
  `picture_click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画报点击量',
  `picture_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '画报排序0-255',
  `picture_commend_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '画报推荐标志1-未推荐，2-已推荐',
  `picture_comment_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '画报是否允许评论1-允许，2-不允许',
  `picture_verify_admin` varchar(50) DEFAULT NULL COMMENT '画报审核管理员',
  `picture_verify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画报审核时间',
  `picture_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1-草稿、2-待审核、3-已发布、4-回收站、5-已关闭',
  `picture_publisher_name` varchar(50) NOT NULL COMMENT '发布人用户名',
  `picture_publisher_id` int(10) unsigned NOT NULL COMMENT '发布人编号',
  `picture_type` tinyint(1) unsigned NOT NULL COMMENT '画报类型1-管理员发布，2-用户投稿',
  `picture_attachment_path` varchar(50) NOT NULL DEFAULT '',
  `picture_modify_time` int(10) unsigned NOT NULL COMMENT '画报修改时间',
  `picture_tag` varchar(255) DEFAULT NULL COMMENT '画报标签',
  `picture_comment_count` int(10) unsigned NOT NULL COMMENT '画报评论数',
  `picture_title_short` varchar(50) NOT NULL DEFAULT '' COMMENT '画报短标题',
  `picture_image_count` tinyint(1) unsigned NOT NULL COMMENT '画报图片总数',
  `picture_share_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画报分享数',
  `picture_verify_reason` varchar(255) DEFAULT NULL COMMENT '审核失败原因',
  PRIMARY KEY (`picture_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CMS画报表';

-- ----------------------------
-- Records of tr_cms_picture
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_cms_picture_class`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_picture_class`;
CREATE TABLE `tr_cms_picture_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `class_name` varchar(50) NOT NULL COMMENT '分类名称',
  `class_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='cms画报分类表';

-- ----------------------------
-- Records of tr_cms_picture_class
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_cms_picture_image`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_picture_image`;
CREATE TABLE `tr_cms_picture_image` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `image_name` varchar(255) NOT NULL COMMENT '图片地址',
  `image_abstract` varchar(200) DEFAULT NULL COMMENT '图片摘要',
  `image_goods` text COMMENT '相关商品',
  `image_store` varchar(255) DEFAULT NULL COMMENT '相关店铺',
  `image_width` int(10) unsigned DEFAULT NULL COMMENT '图片宽度',
  `image_height` int(10) unsigned DEFAULT NULL COMMENT '图片高度',
  `image_picture_id` int(10) unsigned NOT NULL COMMENT '画报编号',
  `image_path` varchar(50) DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CMS画报图片表';

-- ----------------------------
-- Records of tr_cms_picture_image
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_cms_special`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_special`;
CREATE TABLE `tr_cms_special` (
  `special_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专题编号',
  `special_title` varchar(50) NOT NULL COMMENT '专题标题',
  `special_margin_top` int(10) DEFAULT '0' COMMENT '正文距顶部距离',
  `special_background` varchar(255) DEFAULT NULL COMMENT '专题背景',
  `special_image` varchar(255) DEFAULT NULL COMMENT '专题封面图',
  `special_image_all` text COMMENT '专题图片',
  `special_content` text COMMENT '专题内容',
  `special_modify_time` int(10) unsigned NOT NULL COMMENT '专题修改时间',
  `special_publish_id` int(10) unsigned NOT NULL COMMENT '专题发布者编号',
  `special_state` tinyint(1) unsigned NOT NULL COMMENT '专题状态1-草稿、2-已发布',
  `special_background_color` varchar(10) NOT NULL DEFAULT '#FFFFFF' COMMENT '专题背景色',
  `special_repeat` varchar(10) NOT NULL DEFAULT 'no-repeat' COMMENT '背景重复方式',
  PRIMARY KEY (`special_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CMS专题表';

-- ----------------------------
-- Records of tr_cms_special
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_cms_tag`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_tag`;
CREATE TABLE `tr_cms_tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签编号',
  `tag_name` varchar(50) NOT NULL COMMENT '标签名称',
  `tag_sort` tinyint(1) unsigned NOT NULL COMMENT '标签排序',
  `tag_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签使用计数',
  PRIMARY KEY (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CMS标签表';

-- ----------------------------
-- Records of tr_cms_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_cms_tag_relation`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cms_tag_relation`;
CREATE TABLE `tr_cms_tag_relation` (
  `relation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关系编号',
  `relation_type` tinyint(1) unsigned NOT NULL COMMENT '关系类型1-文章，2-画报',
  `relation_tag_id` int(10) unsigned NOT NULL COMMENT '标签编号',
  `relation_object_id` int(10) unsigned NOT NULL COMMENT '对象编号',
  PRIMARY KEY (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CMS标签关系表';

-- ----------------------------
-- Records of tr_cms_tag_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_complain`
-- ----------------------------
DROP TABLE IF EXISTS `tr_complain`;
CREATE TABLE `tr_complain` (
  `complain_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `accuser_id` int(11) NOT NULL COMMENT '原告id',
  `accuser_name` varchar(50) NOT NULL COMMENT '原告名称',
  `accused_id` int(11) NOT NULL COMMENT '被告id',
  `accused_name` varchar(50) NOT NULL COMMENT '被告名称',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_id` int(11) NOT NULL COMMENT '投诉主题id',
  `complain_content` varchar(255) NOT NULL COMMENT '投诉内容',
  `complain_pic1` varchar(100) NOT NULL COMMENT '投诉图片1',
  `complain_pic2` varchar(100) NOT NULL COMMENT '投诉图片2',
  `complain_pic3` varchar(100) NOT NULL COMMENT '投诉图片3',
  `complain_datetime` int(11) NOT NULL COMMENT '投诉时间',
  `complain_handle_datetime` int(11) NOT NULL COMMENT '投诉处理时间',
  `complain_handle_member_id` int(11) NOT NULL COMMENT '投诉处理人id',
  `appeal_message` varchar(255) NOT NULL COMMENT '申诉内容',
  `appeal_datetime` int(11) NOT NULL COMMENT '申诉时间',
  `appeal_pic1` varchar(100) NOT NULL COMMENT '申诉图片1',
  `appeal_pic2` varchar(100) NOT NULL COMMENT '申诉图片2',
  `appeal_pic3` varchar(100) NOT NULL COMMENT '申诉图片3',
  `final_handle_message` varchar(255) NOT NULL COMMENT '最终处理意见',
  `final_handle_datetime` int(11) NOT NULL COMMENT '最终处理时间',
  `final_handle_member_id` int(11) NOT NULL COMMENT '最终处理人id',
  `complain_state` tinyint(4) NOT NULL COMMENT '投诉状态(10-新投诉/20-投诉通过转给被投诉人/30-被投诉人已申诉/40-提交仲裁/99-已关闭)',
  `complain_active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '投诉是否通过平台审批(1未通过/2通过)',
  PRIMARY KEY (`complain_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投诉表';

-- ----------------------------
-- Records of tr_complain
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_complain_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tr_complain_goods`;
CREATE TABLE `tr_complain_goods` (
  `complain_goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉商品序列id',
  `complain_id` int(11) NOT NULL COMMENT '投诉id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` int(11) NOT NULL COMMENT '商品数量',
  `goods_image` varchar(100) NOT NULL DEFAULT '' COMMENT '商品图片',
  `complain_message` varchar(100) NOT NULL COMMENT '被投诉商品的问题描述',
  `order_goods_id` int(10) unsigned DEFAULT '0' COMMENT '订单商品ID',
  `order_goods_type` tinyint(1) unsigned DEFAULT '1' COMMENT '订单商品类型:1默认2团购商品3限时折扣商品4组合套装',
  PRIMARY KEY (`complain_goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投诉商品表';

-- ----------------------------
-- Records of tr_complain_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_complain_subject`
-- ----------------------------
DROP TABLE IF EXISTS `tr_complain_subject`;
CREATE TABLE `tr_complain_subject` (
  `complain_subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉主题id',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_desc` varchar(100) NOT NULL COMMENT '投诉主题描述',
  `complain_subject_state` tinyint(4) NOT NULL COMMENT '投诉主题状态(1-有效/2-失效)',
  PRIMARY KEY (`complain_subject_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='投诉主题表';

-- ----------------------------
-- Records of tr_complain_subject
-- ----------------------------
INSERT INTO `tr_complain_subject` VALUES ('1', '商家不同意退款', '买家申请退款被拒绝。', '2');
INSERT INTO `tr_complain_subject` VALUES ('2', '未收到货', '交易成功，未收到货，钱已经付给商家，可进行维权。', '1');
INSERT INTO `tr_complain_subject` VALUES ('3', '售后保障服务', '交易完成后30天内，在使用商品过程中，发现商品有质量问题或无法正常使用，可进行维权。', '1');

-- ----------------------------
-- Table structure for `tr_complain_talk`
-- ----------------------------
DROP TABLE IF EXISTS `tr_complain_talk`;
CREATE TABLE `tr_complain_talk` (
  `talk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉对话id',
  `complain_id` int(11) NOT NULL COMMENT '投诉id',
  `talk_member_id` int(11) NOT NULL COMMENT '发言人id',
  `talk_member_name` varchar(50) NOT NULL COMMENT '发言人名称',
  `talk_member_type` varchar(10) NOT NULL COMMENT '发言人类型(1-投诉人/2-被投诉人/3-平台)',
  `talk_content` varchar(255) NOT NULL COMMENT '发言内容',
  `talk_state` tinyint(4) NOT NULL COMMENT '发言状态(1-显示/2-不显示)',
  `talk_admin` int(11) NOT NULL DEFAULT '0' COMMENT '对话管理员，屏蔽对话人的id',
  `talk_datetime` int(11) NOT NULL COMMENT '对话发表时间',
  PRIMARY KEY (`talk_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投诉对话表';

-- ----------------------------
-- Records of tr_complain_talk
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_consult`
-- ----------------------------
DROP TABLE IF EXISTS `tr_consult`;
CREATE TABLE `tr_consult` (
  `consult_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询编号',
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '商品编号',
  `cgoods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '咨询发布者会员编号(0：游客)',
  `cmember_name` varchar(100) DEFAULT NULL COMMENT '会员名称',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺编号',
  `email` varchar(255) DEFAULT NULL COMMENT '咨询发布者邮箱',
  `consult_content` varchar(255) DEFAULT NULL COMMENT '咨询内容',
  `consult_addtime` int(10) DEFAULT NULL COMMENT '咨询发布时间',
  `consult_reply` varchar(255) DEFAULT NULL COMMENT '咨询回复内容',
  `consult_reply_time` int(10) DEFAULT NULL COMMENT '咨询回复时间',
  `isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不匿名 1表示匿名',
  PRIMARY KEY (`consult_id`),
  KEY `goods_id` (`goods_id`),
  KEY `seller_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品咨询表';

-- ----------------------------
-- Records of tr_consult
-- ----------------------------
INSERT INTO `tr_consult` VALUES ('1', '100001', '巴黎 Paris 红叶谷', '0', '', '2', '630892807@qq.com', '不会用', '1433315177', null, null, '0');

-- ----------------------------
-- Table structure for `tr_cron`
-- ----------------------------
DROP TABLE IF EXISTS `tr_cron`;
CREATE TABLE `tr_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned DEFAULT NULL COMMENT '任务类型 1商品上架 2发送邮件 3优惠套装过期 4推荐展位过期',
  `exeid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联任务的ID[如商品ID,会员ID]',
  `exetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
  `code` char(50) DEFAULT NULL COMMENT '邮件模板CODE',
  `content` text COMMENT '内容',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='任务队列表';

-- ----------------------------
-- Records of tr_cron
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_daddress`
-- ----------------------------
DROP TABLE IF EXISTS `tr_daddress`;
CREATE TABLE `tr_daddress` (
  `address_id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `store_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `seller_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人',
  `area_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '地区ID',
  `city_id` mediumint(9) DEFAULT NULL COMMENT '市级ID',
  `area_info` varchar(100) DEFAULT NULL COMMENT '省市县',
  `address` varchar(100) NOT NULL COMMENT '地址',
  `telphone` varchar(40) DEFAULT NULL COMMENT '电话',
  `company` varchar(50) NOT NULL COMMENT '公司',
  `is_default` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否默认1是',
  PRIMARY KEY (`address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='卖家发货地址信息表';

-- ----------------------------
-- Records of tr_daddress
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_document`
-- ----------------------------
DROP TABLE IF EXISTS `tr_document`;
CREATE TABLE `tr_document` (
  `doc_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `doc_code` varchar(255) NOT NULL COMMENT '调用标识码',
  `doc_title` varchar(255) NOT NULL COMMENT '标题',
  `doc_content` text NOT NULL COMMENT '内容',
  `doc_time` int(10) unsigned NOT NULL COMMENT '添加时间/修改时间',
  PRIMARY KEY (`doc_id`),
  UNIQUE KEY `doc_code` (`doc_code`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统文章表';

-- ----------------------------
-- Records of tr_document
-- ----------------------------
INSERT INTO `tr_document` VALUES ('1', 'agreement', '用户服务协议', '<p>特别提醒用户认真阅读本《用户服务协议》(下称《协议》) 中各条款。除非您接受本《协议》条款，否则您无权使用本网站提供的相关服务。您的使用行为将视为对本《协议》的接受，并同意接受本《协议》各项条款的约束。 <br /> <br /> <strong>一、定义</strong><br /></p>\r\n<ol>\r\n<li>\"用户\"指符合本协议所规定的条件，同意遵守本网站各种规则、条款（包括但不限于本协议），并使用本网站的个人或机构。</li>\r\n<li>\"卖家\"是指在本网站上出售物品的用户。\"买家\"是指在本网站购买物品的用户。</li>\r\n<li>\"成交\"指买家根据卖家所刊登的交易要求，在特定时间内提出最优的交易条件，因而取得依其提出的条件购买该交易物品的权利。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>二、用户资格</strong><br /> <br /> 只有符合下列条件之一的人员或实体才能申请成为本网站用户，可以使用本网站的服务。</p>\r\n<ol>\r\n<li>年满十八岁，并具有民事权利能力和民事行为能力的自然人；</li>\r\n<li>未满十八岁，但监护人（包括但不仅限于父母）予以书面同意的自然人；</li>\r\n<li>根据中国法律或设立地法律、法规和/或规章成立并合法存在的公司、企事业单位、社团组织和其他组织。</li>\r\n</ol>\r\n<p><br /> 无民事行为能力人、限制民事行为能力人以及无经营或特定经营资格的组织不当注册为本网站用户或超过其民事权利或行为能力范围从事交易的，其与本网站之间的协议自始无效，本网站一经发现，有权立即注销该用户，并追究其使用本网站\"服务\"的一切法律责任。<br /> <br /> <strong>三.用户的权利和义务</strong><br /></p>\r\n<ol>\r\n<li>用户有权根据本协议的规定及本网站发布的相关规则，利用本网站网上交易平台登录物品、发布交易信息、查询物品信息、购买物品、与其他用户订立物品买卖合同、在本网站社区发帖、参加本网站的有关活动及有权享受本网站提供的其他的有关资讯及信息服务。</li>\r\n<li>用户有权根据需要更改密码和交易密码。用户应对以该用户名进行的所有活动和事件负全部责任。</li>\r\n<li>用户有义务确保向本网站提供的任何资料、注册信息真实准确，包括但不限于真实姓名、身份证号、联系电话、地址、邮政编码等。保证本网站及其他用户可以通过上述联系方式与自己进行联系。同时，用户也有义务在相关资料实际变更时及时更新有关注册资料。</li>\r\n<li>用户不得以任何形式擅自转让或授权他人使用自己在本网站的用户帐号。</li>\r\n<li>用户有义务确保在本网站网上交易平台上登录物品、发布的交易信息真实、准确，无误导性。</li>\r\n<li>用户不得在本网站网上交易平台买卖国家禁止销售的或限制销售的物品、不得买卖侵犯他人知识产权或其他合法权益的物品，也不得买卖违背社会公共利益或公共道德的物品。</li>\r\n<li>用户不得在本网站发布各类违法或违规信息。包括但不限于物品信息、交易信息、社区帖子、物品留言，店铺留言，评价内容等。</li>\r\n<li>用户在本网站交易中应当遵守诚实信用原则，不得以干预或操纵物品价格等不正当竞争方式扰乱网上交易秩序，不得从事与网上交易无关的不当行为，不得在交易平台上发布任何违法信息。</li>\r\n<li>用户不应采取不正当手段（包括但不限于虚假交易、互换好评等方式）提高自身或他人信用度，或采用不正当手段恶意评价其他用户，降低其他用户信用度。</li>\r\n<li>用户承诺自己在使用本网站网上交易平台实施的所有行为遵守国家法律、法规和本网站的相关规定以及各种社会公共利益或公共道德。对于任何法律后果的发生，用户将以自己的名义独立承担所有相应的法律责任。</li>\r\n<li>用户在本网站网上交易过程中如与其他用户因交易产生纠纷，可以请求本网站从中予以协调。用户如发现其他用户有违法或违反本协议的行为，可以向本网站举报。如用户因网上交易与其他用户产生诉讼的，用户有权通过司法部门要求本网站提供相关资料。</li>\r\n<li>用户应自行承担因交易产生的相关费用，并依法纳税。</li>\r\n<li>未经本网站书面允许，用户不得将本网站资料以及在交易平台上所展示的任何信息以复制、修改、翻译等形式制作衍生作品、分发或公开展示。</li>\r\n<li>用户同意接收来自本网站的信息，包括但不限于活动信息、交易信息、促销信息等。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>四、 本网站的权利和义务</strong><br /></p>\r\n<ol>\r\n<li>本网站不是传统意义上的\"拍卖商\"，仅为用户提供一个信息交流、进行物品买卖的平台，充当买卖双方之间的交流媒介，而非买主或卖主的代理商、合伙  人、雇员或雇主等经营关系人。公布在本网站上的交易物品是用户自行上传进行交易的物品，并非本网站所有。对于用户刊登物品、提供的信息或参与竞标的过程，  本网站均不加以监视或控制，亦不介入物品的交易过程，包括运送、付款、退款、瑕疵担保及其它交易事项，且不承担因交易物品存在品质、权利上的瑕疵以及交易  方履行交易协议的能力而产生的任何责任，对于出现在拍卖上的物品品质、安全性或合法性，本网站均不予保证。</li>\r\n<li>本网站有义务在现有技术水平的基础上努力确保整个网上交易平台的正常运行，尽力避免服务中断或将中断时间限制在最短时间内，保证用户网上交易活动的顺利进行。</li>\r\n<li>本网站有义务对用户在注册使用本网站网上交易平台中所遇到的问题及反映的情况及时作出回复。 </li>\r\n<li>本网站有权对用户的注册资料进行查阅，对存在任何问题或怀疑的注册资料，本网站有权发出通知询问用户并要求用户做出解释、改正，或直接做出处罚、删除等处理。</li>\r\n<li>用  户因在本网站网上交易与其他用户产生纠纷的，用户通过司法部门或行政部门依照法定程序要求本网站提供相关资料，本网站将积极配合并提供有关资料；用户将纠  纷告知本网站，或本网站知悉纠纷情况的，经审核后，本网站有权通过电子邮件及电话联系向纠纷双方了解纠纷情况，并将所了解的情况通过电子邮件互相通知对  方。 </li>\r\n<li>因网上交易平台的特殊性，本网站没有义务对所有用户的注册资料、所有的交易行为以及与交易有关的其他事项进行事先审查，但如发生以下情形，本网站有权限制用户的活动、向用户核实有关资料、发出警告通知、暂时中止、无限期地中止及拒绝向该用户提供服务：         \r\n<ul>\r\n<li>用户违反本协议或因被提及而纳入本协议的文件；</li>\r\n<li>存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据，而本网站无法联系到该用户核证或验证该用户向本网站提供的任何资料；</li>\r\n<li>存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据。本网站以普通非专业交易者的知识水平标准对相关内容进行判别，可以明显认为这些内容或行为可能对本网站用户或本网站造成财务损失或法律责任。 </li>\r\n</ul>\r\n</li>\r\n<li>在反网络欺诈行动中，本着保护广大用户利益的原则，当用户举报自己交易可能存在欺诈而产生交易争议时，本网站有权通过表面判断暂时冻结相关用户账号，并有权核对当事人身份资料及要求提供交易相关证明材料。</li>\r\n<li>根据国家法律法规、本协议的内容和本网站所掌握的事实依据，可以认定用户存在违法或违反本协议行为以及在本网站交易平台上的其他不当行为，本网站有权在本网站交易平台及所在网站上以网络发布形式公布用户的违法行为，并有权随时作出删除相关信息，而无须征得用户的同意。</li>\r\n<li>本  网站有权在不通知用户的前提下删除或采取其他限制性措施处理下列信息：包括但不限于以规避费用为目的；以炒作信用为目的；存在欺诈等恶意或虚假内容；与网  上交易无关或不是以交易为目的；存在恶意竞价或其他试图扰乱正常交易秩序因素；该信息违反公共利益或可能严重损害本网站和其他用户合法利益的。</li>\r\n<li>用  户授予本网站独家的、全球通用的、永久的、免费的信息许可使用权利，本网站有权对该权利进行再授权，依此授权本网站有权(全部或部份地)  使用、复制、修订、改写、发布、翻译、分发、执行和展示用户公示于网站的各类信息或制作其派生作品，以现在已知或日后开发的任何形式、媒体或技术，将上述  信息纳入其他作品内。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>五、服务的中断和终止</strong><br /></p>\r\n<ol>\r\n<li>在  本网站未向用户收取相关服务费用的情况下，本网站可自行全权决定以任何理由  (包括但不限于本网站认为用户已违反本协议的字面意义和精神，或用户在超过180天内未登录本网站等)  终止对用户的服务，并不再保存用户在本网站的全部资料（包括但不限于用户信息、商品信息、交易信息等）。同时本网站可自行全权决定，在发出通知或不发出通  知的情况下，随时停止提供全部或部分服务。服务终止后，本网站没有义务为用户保留原用户资料或与之相关的任何信息，或转发任何未曾阅读或发送的信息给用户  或第三方。此外，本网站不就终止对用户的服务而对用户或任何第三方承担任何责任。 </li>\r\n<li>如用户向本网站提出注销本网站注册用户身份，需经本网站审核同意，由本网站注销该注册用户，用户即解除与本网站的协议关系，但本网站仍保留下列权利：         \r\n<ul>\r\n<li>用户注销后，本网站有权保留该用户的资料,包括但不限于以前的用户资料、店铺资料、商品资料和交易记录等。 </li>\r\n<li>用户注销后，如用户在注销前在本网站交易平台上存在违法行为或违反本协议的行为，本网站仍可行使本协议所规定的权利。 </li>\r\n</ul>\r\n</li>\r\n<li>如存在下列情况，本网站可以通过注销用户的方式终止服务：         \r\n<ul>\r\n<li>在用户违反本协议相关规定时，本网站有权终止向该用户提供服务。本网站将在中断服务时通知用户。但如该用户在被本网站终止提供服务后，再一次直接或间接或以他人名义注册为本网站用户的，本网站有权再次单方面终止为该用户提供服务；</li>\r\n<li>一旦本网站发现用户注册资料中主要内容是虚假的，本网站有权随时终止为该用户提供服务； </li>\r\n<li>本协议终止或更新时，用户未确认新的协议的。 </li>\r\n<li>其它本网站认为需终止服务的情况。 </li>\r\n</ul>\r\n</li>\r\n<li>因用户违反相关法律法规或者违反本协议规定等原因而致使本网站中断、终止对用户服务的，对于服务中断、终止之前用户交易行为依下列原则处理：         \r\n<ul>\r\n<li>本网站有权决定是否在中断、终止对用户服务前将用户被中断或终止服务的情况和原因通知用户交易关系方，包括但不限于对该交易有意向但尚未达成交易的用户,参与该交易竞价的用户，已达成交易要约用户。</li>\r\n<li>服务中断、终止之前，用户已经上传至本网站的物品尚未交易或交易尚未完成的，本网站有权在中断、终止服务的同时删除此项物品的相关信息。 </li>\r\n<li>服务中断、终止之前，用户已经就其他用户出售的具体物品作出要约，但交易尚未结束，本网站有权在中断或终止服务的同时删除该用户的相关要约和信息。</li>\r\n</ul>\r\n</li>\r\n<li>本网站若因用户的行为（包括但不限于刊登的商品、在本网站社区发帖等）侵害了第三方的权利或违反了相关规定，而受到第三方的追偿或受到主管机关的处分时，用户应赔偿本网站因此所产生的一切损失及费用。</li>\r\n<li>对违反相关法律法规或者违反本协议规定，且情节严重的用户，本网站有权终止该用户的其它服务。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>六、协议的修订</strong><br /> <br /> 本协议可由本网站随时修订，并将修订后的协议公告于本网站之上，修订后的条款内容自公告时起生效，并成为本协议的一部分。用户若在本协议修改之后，仍继续使用本网站，则视为用户接受和自愿遵守修订后的协议。本网站行使修改或中断服务时，不需对任何第三方负责。<br /> <br /> <strong>七、 本网站的责任范围 </strong><br /> <br /> 当用户接受该协议时，用户应明确了解并同意∶</p>\r\n<ol>\r\n<li>是否经由本网站下载或取得任何资料，由用户自行考虑、衡量并且自负风险，因下载任何资料而导致用户电脑系统的任何损坏或资料流失，用户应负完全责任。</li>\r\n<li>用户经由本网站取得的建议和资讯，无论其形式或表现，绝不构成本协议未明示规定的任何保证。</li>\r\n<li>基于以下原因而造成的利润、商誉、使用、资料损失或其它无形损失，本网站不承担任何直接、间接、附带、特别、衍生性或惩罚性赔偿（即使本网站已被告知前款赔偿的可能性）：         \r\n<ul>\r\n<li>本网站的使用或无法使用。</li>\r\n<li>经由或通过本网站购买或取得的任何物品，或接收之信息，或进行交易所随之产生的替代物品及服务的购买成本。</li>\r\n<li>用户的传输或资料遭到未获授权的存取或变更。</li>\r\n<li>本网站中任何第三方之声明或行为。</li>\r\n<li>本网站其它相关事宜。</li>\r\n</ul>\r\n</li>\r\n<li>本网站只是为用户提供一个交易的平台，对于用户所刊登的交易物品的合法性、真实性及其品质，以及用户履行交易的能力等，本网站一律不负任何担保责任。用户如果因使用本网站，或因购买刊登于本网站的任何物品，而受有损害时，本网站不负任何补偿或赔偿责任。</li>\r\n<li>本  网站提供与其它互联网上的网站或资源的链接，用户可能会因此连结至其它运营商经营的网站，但不表示本网站与这些运营商有任何关系。其它运营商经营的网站均  由各经营者自行负责，不属于本网站控制及负责范围之内。对于存在或来源于此类网站或资源的任何内容、广告、产品或其它资料，本网站亦不予保证或负责。因使  用或依赖任何此类网站或资源发布的或经由此类网站或资源获得的任何内容、物品或服务所产生的任何损害或损失，本网站不负任何直接或间接的责任。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>八.、不可抗力</strong><br /> <br /> 因不可抗力或者其他意外事件，使得本协议的履行不可能、不必要或者无意义的，双方均不承担责任。本合同所称之不可抗力意指不能预见、不能避免并不能克服的  客观情况，包括但不限于战争、台风、水灾、火灾、雷击或地震、罢工、暴动、法定疾病、黑客攻击、网络病毒、电信部门技术管制、政府行为或任何其它自然或人  为造成的灾难等客观情况。<br /> <br /> <strong>九、争议解决方式</strong><br /></p>\r\n<ol>\r\n<li>本协议及其修订本的有效性、履行和与本协议及其修订本效力有关的所有事宜，将受中华人民共和国法律管辖，任何争议仅适用中华人民共和国法律。</li>\r\n<li>因  使用本网站服务所引起与本网站的任何争议，均应提交深圳仲裁委员会按照该会届时有效的仲裁规则进行仲裁。相关争议应单独仲裁，不得与任何其它方的争议在任  何仲裁中合并处理，该仲裁裁决是终局，对各方均有约束力。如果所涉及的争议不适于仲裁解决，用户同意一切争议由人民法院管辖。</li>\r\n</ol>', '1389864697');
INSERT INTO `tr_document` VALUES ('4', 'open_store', '开店协议', '<p>使用本公司服务所须遵守的条款和条件。<br /><br />1.用户资格<br />本公司的服务仅向适用法律下能够签订具有法律约束力的合同的个人提供并仅由其使用。在不限制前述规定的前提下，本公司的服务不向18周岁以下或被临时或无限期中止的用户提供。如您不合资格，请勿使用本公司的服务。此外，您的帐户（包括信用评价）和用户名不得向其他方转让或出售。另外，本公司保留根据其意愿中止或终止您的帐户的权利。<br /><br />2.您的资料（包括但不限于所添加的任何商品）不得：<br />*具有欺诈性、虚假、不准确或具误导性；<br />*侵犯任何第三方著作权、专利权、商标权、商业秘密或其他专有权利或发表权或隐私权；<br />*违反任何适用的法律或法规（包括但不限于有关出口管制、消费者保护、不正当竞争、刑法、反歧视或贸易惯例/公平贸易法律的法律或法规）；<br />*有侮辱或者诽谤他人，侵害他人合法权益的内容；<br />*有淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的内容；<br />*包含可能破坏、改变、删除、不利影响、秘密截取、未经授权而接触或征用任何系统、数据或个人资料的任何病毒、特洛依木马、蠕虫、定时炸弹、删除蝇、复活节彩蛋、间谍软件或其他电脑程序；<br /><br />3.违约<br />如发生以下情形，本公司可能限制您的活动、立即删除您的商品、向本公司社区发出有关您的行为的警告、发出警告通知、暂时中止、无限期地中止或终止您的用户资格及拒绝向您提供服务：<br />(a)您违反本协议或纳入本协议的文件；<br />(b)本公司无法核证或验证您向本公司提供的任何资料；<br />(c)本公司相信您的行为可能对您、本公司用户或本公司造成损失或法律责任。<br /><br />4.责任限制<br />本公司、本公司的关联公司和相关实体或本公司的供应商在任何情况下均不就因本公司的网站、本公司的服务或本协议而产生或与之有关的利润损失或任何特别、间接或后果性的损害（无论以何种方式产生，包括疏忽）承担任何责任。您同意您就您自身行为之合法性单独承担责任。您同意，本公司和本公司的所有关联公司和相关实体对本公司用户的行为的合法性及产生的任何结果不承担责任。<br /><br />5.无代理关系<br />用户和本公司是独立的合同方，本协议无意建立也没有创立任何代理、合伙、合营、雇员与雇主或特许经营关系。本公司也不对任何用户及其网上交易行为做出明示或默许的推荐、承诺或担保。<br /><br />6.一般规定<br />本协议在所有方面均受中华人民共和国法律管辖。本协议的规定是可分割的，如本协议任何规定被裁定为无效或不可执行，该规定可被删除而其余条款应予以执行。</p>', '1389864697');
INSERT INTO `tr_document` VALUES ('5', 'groupbuy', '团购活动协议', '<p>\r\n	一、团购的所有权和运作权归本公司。\r\n</p>\r\n<p>\r\n	二、本公司有权在必要时修改本协议，本协议一旦发生变更，将会在相关页面上公布。如果您不同意所改动的内容，您应主动停止使用团购服务。如果您继续使用服务，则视为接受本协议的变更。\r\n</p>\r\n<p>\r\n	三、如发生下列任何一种情形，本公司有权中断或终止向您提供的服务而无需通知您：\r\n</p>\r\n1、 您提供的个人资料不真实；<br />\r\n2、您违反本协议的规定；<br />\r\n3、 按照政府主管部门的监管要求；<br />\r\n4、本公司认为您的行为违反团购服务性质或需求的特殊情形。\r\n<p>\r\n	四、尽管本协议可能另有其他规定，本公司仍然可以随时终止本协议。\r\n</p>\r\n<p>\r\n	五、本公司终止本协议的权利不会妨害本公司可能拥有的在本协议终止前因您违反本协议或本公司本应享有的任何其他权利。\r\n</p>\r\n<p>\r\n	六、您理解并完全接受，本公司有权自行对团购资源作下线处理。\r\n</p>', '1389864697');
INSERT INTO `tr_document` VALUES ('6', 'create_circle', '圈子使用须知', '&nbsp;&nbsp; 请您仔细阅读本须知的全部内容（特别是以<strong><span style=\"text-decoration:underline;\">粗体下划线</span></strong>标注的内容）。如果您不同意本须知的任意内容，您应当停止使用本产品。\r\n<p>\r\n	1、“圈子”是本公司开设的一个供商城用户（以下简称“用户”或“您”）交流购物体验等信息的网络社区。<strong><span style=\"text-decoration:underline;\">您使用“圈子”产品需遵守本须知，并遵守本公司公布的操作流程和规则。</span></strong>\r\n</p>\r\n<p>\r\n	2、“圈子”产品的功能和产品提供方式由本公司自行决定，后续本公司可能调整产品名称和产品运行的域名等。<strong><span style=\"text-decoration:underline;\">本须知适用于“圈子”产品的调整、改进版本和附加功能。</span></strong>\r\n</p>\r\n<p>\r\n	3、您可以通过本产品创建网络关系圈子，其他感兴趣的用户可以加入您创建的圈子。您应当遵守任何适用的法律之规定，并自觉尊重和维护其他参与者的合法权利。您不得以任何形式开展违法活动、侵犯他人合法权益、损害本公司或其他公司的合法利益，否则您需为此自行承担法律责任。<strong><span style=\"text-decoration:underline;\">您同意本公司无需为产品使用者的违法或侵权等行为承担任何责任。</span></strong>\r\n</p>\r\n<p>\r\n	4、您同意并保证通过本产品上传、发布的文字、图片等全部信息素材符合相关法律的规定。您保证素材内容以及素材所含链接指向的内容的合法性和正当性，不侵犯他人的肖像权、名誉权、知识产权、隐私权等合法权益，也不会侵犯法人或其他团体的商业秘密等合法权益。\r\n</p>\r\n<p>\r\n	5、<strong><span style=\"text-decoration:underline;\">您使用本产品可能需要提供关于您的个人资料、肖像、联系方式等个人信息。您了解并同意，在使用本产品过程中关于您的个人信息可能会通过网络等渠道进行传播。</span></strong>\r\n</p>\r\n<p>\r\n	6、您通过本产品上传、发布素材，即意味着<strong><span style=\"text-decoration:underline;\">您同意向本公司提供免费的、永久性的、不可撤销的权利和许可，使本公司可以在全球范围内复制、发行、展示、演绎和通过信息网络等渠道使用您上传的素材和信息</span></strong>，例如将您提供的图片发布于活动页面或平面媒体中。\r\n</p>\r\n<p>\r\n	7、本公司无法事先了解您上传素材的真实性和合法性。如您上传的素材被发现不适宜展示或遭受他人举报或投诉的，本公司有权立即删除或进行屏蔽从而停止该素材的继续传播。<strong><span style=\"text-decoration:underline;\">如果您违反本须知的内容、有关协议或规则等的，本公司有权删除相关素材并有权拒绝您继续使用产品，届时您无权要求本公司进行补偿或赔偿。</span></strong>\r\n</p>\r\n<p>\r\n	8、您使用本产品应同时遵守《用户服务协议》、本公司公布的各项规则以及本公司发布的关于本产品的特别规则和制度。\r\n</p>\r\n<p>\r\n	9、第三方可能通过分公司其他产品或本产品知悉并使用您上传的素材、个人信息或进而侵犯您的合法权利。<strong><span style=\"text-decoration:underline;\">本公司提醒您注意和谨防网络诈骗以及其他可能对您不利的行动和信息，但本公司对第三方的侵权、违法等行为不承担赔偿等法律责任。</span></strong>您承诺合法使用并善待其他用户上传的素材和信息。\r\n</p>\r\n<p>\r\n	10、您应自行对上传的素材进行备份。本公司可能按照本须知删除或屏蔽素材，相关系统亦可能遭受网络攻击或网络故障，类似或其他情况均可能使您上传的素材丢失或故障，对此本公司将尽力避免但不做任何保证。\r\n</p>\r\n<p>\r\n	11、<strong><span style=\"text-decoration:underline;\">如您因使用本产品与本公司发生纠纷的，您同意由本公司住所地人民法院管辖审理。</span></strong> \r\n</p>\r\n<p>\r\n	12、<strong><span style=\"text-decoration:underline;\">本公司有权更新、修改本须知以及有关规则、流程等相关文件的内容，本公司在法律允许的范围内负责对本须知进行说明和解释</span></strong>。如您对修改存有异议，您有权选择不再继续使用本产品，但您在此前的行为仍受本须知以及相关文件最新的修改版本的约束。\r\n</p>', '1389864697');

-- ----------------------------
-- Table structure for `tr_evaluate_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tr_evaluate_goods`;
CREATE TABLE `tr_evaluate_goods` (
  `geval_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `geval_orderid` int(11) NOT NULL COMMENT '订单表自增ID',
  `geval_orderno` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `geval_ordergoodsid` int(11) NOT NULL COMMENT '订单商品表编号',
  `geval_goodsid` int(11) NOT NULL COMMENT '商品表编号',
  `geval_goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `geval_goodsprice` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `geval_scores` tinyint(1) NOT NULL COMMENT '1-5分',
  `geval_content` varchar(255) DEFAULT NULL COMMENT '信誉评价内容',
  `geval_isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不是 1表示是匿名评价',
  `geval_addtime` int(11) NOT NULL COMMENT '评价时间',
  `geval_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `geval_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `geval_frommemberid` int(11) NOT NULL COMMENT '评价人编号',
  `geval_frommembername` varchar(100) NOT NULL COMMENT '评价人名称',
  `geval_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评价信息的状态 0为正常 1为禁止显示',
  `geval_remark` varchar(255) DEFAULT NULL COMMENT '管理员对评价的处理备注',
  `geval_explain` varchar(255) DEFAULT NULL COMMENT '解释内容',
  `geval_image` varchar(255) DEFAULT NULL COMMENT '晒单图片',
  PRIMARY KEY (`geval_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信誉评价表';

-- ----------------------------
-- Records of tr_evaluate_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_evaluate_store`
-- ----------------------------
DROP TABLE IF EXISTS `tr_evaluate_store`;
CREATE TABLE `tr_evaluate_store` (
  `seval_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `seval_orderid` int(11) unsigned NOT NULL COMMENT '订单ID',
  `seval_orderno` varchar(100) NOT NULL COMMENT '订单编号',
  `seval_addtime` int(11) unsigned NOT NULL COMMENT '评价时间',
  `seval_storeid` int(11) unsigned NOT NULL COMMENT '店铺编号',
  `seval_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `seval_memberid` int(11) unsigned NOT NULL COMMENT '买家编号',
  `seval_membername` varchar(100) NOT NULL COMMENT '买家名称',
  `seval_desccredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '描述相符评分',
  `seval_servicecredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '服务态度评分',
  `seval_deliverycredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '发货速度评分',
  PRIMARY KEY (`seval_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺评分表';

-- ----------------------------
-- Records of tr_evaluate_store
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_express`
-- ----------------------------
DROP TABLE IF EXISTS `tr_express`;
CREATE TABLE `tr_express` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `e_name` varchar(50) NOT NULL COMMENT '公司名称',
  `e_state` enum('0','1') NOT NULL DEFAULT '1' COMMENT '状态',
  `e_code` varchar(50) NOT NULL COMMENT '编号',
  `e_letter` char(1) NOT NULL COMMENT '首字母',
  `e_order` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1常用2不常用',
  `e_url` varchar(100) NOT NULL COMMENT '公司网址',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='快递公司';

-- ----------------------------
-- Records of tr_express
-- ----------------------------
INSERT INTO `tr_express` VALUES ('1', '安信达', '0', 'anxindakuaixi', 'A', '2', 'http://www.anxinda.com');
INSERT INTO `tr_express` VALUES ('2', '包裹平邮', '1', 'youzhengguonei', 'B', '2', 'http://yjcx.chinapost.com.cn');
INSERT INTO `tr_express` VALUES ('3', 'CCES', '1', 'cces', 'C', '2', 'http://www.cces.com.cn');
INSERT INTO `tr_express` VALUES ('4', '传喜物流', '1', 'chuanxiwuliu', 'C', '2', 'http://www.cxcod.com');
INSERT INTO `tr_express` VALUES ('5', 'DHL快递', '1', 'dhl', 'D', '2', 'http://www.cn.dhl.com');
INSERT INTO `tr_express` VALUES ('6', '大田物流', '1', 'datianwuliu', 'D', '2', 'http://www.dtw.com.cn');
INSERT INTO `tr_express` VALUES ('7', '德邦物流', '1', 'debangwuliu', 'D', '2', 'http://www.deppon.com');
INSERT INTO `tr_express` VALUES ('8', 'EMS', '1', 'ems', 'E', '2', 'http://www.ems.com.cn');
INSERT INTO `tr_express` VALUES ('9', 'EMS国际', '1', 'emsguoji', 'E', '2', '###');
INSERT INTO `tr_express` VALUES ('10', '飞康达', '1', 'feikangda', 'F', '2', 'http://www.fkd.com.cn');
INSERT INTO `tr_express` VALUES ('11', 'FedEx(国际)', '1', 'fedex', 'F', '2', 'http://fedex.com/cn');
INSERT INTO `tr_express` VALUES ('12', '凡客如风达', '1', 'rufengda', 'F', '2', 'http://www.rufengda.com');
INSERT INTO `tr_express` VALUES ('13', '港中能达', '1', 'ganzhongnengda', 'G', '2', 'http://www.nd56.com');
INSERT INTO `tr_express` VALUES ('14', '挂号信', '1', 'youzhengguonei', 'G', '2', 'http://yjcx.chinapost.com.cn');
INSERT INTO `tr_express` VALUES ('15', '共速达', '1', 'gongsuda', 'G', '2', 'http://www.gongsuda.com/mall/Search.aspx');
INSERT INTO `tr_express` VALUES ('16', '汇通快递', '1', 'huitongkuaidi', 'H', '2', 'http://www.htky365.com');
INSERT INTO `tr_express` VALUES ('17', '华宇物流', '1', 'tiandihuayu', 'H', '2', 'http://www.hoau.net');
INSERT INTO `tr_express` VALUES ('18', '佳吉快运', '1', 'jiajiwuliu', 'J', '2', 'http://www.jiaji.com');
INSERT INTO `tr_express` VALUES ('19', '佳怡物流', '1', 'jiayiwuliu', 'J', '2', 'http://www.jiayi56.com');
INSERT INTO `tr_express` VALUES ('20', '急先达', '1', 'jixianda', 'J', '2', 'http://www.joust.cn');
INSERT INTO `tr_express` VALUES ('21', '快捷速递', '1', 'kuaijiesudi', 'K', '2', 'http://www.fastexpress.com.cn');
INSERT INTO `tr_express` VALUES ('22', '龙邦快递', '1', 'longbanwuliu', 'L', '2', 'http://www.lbex.com.cn');
INSERT INTO `tr_express` VALUES ('23', '联邦快递', '1', 'lianbangkuaidi', 'L', '2', 'http://cndxp.apac.fedex.com/dxp.html');
INSERT INTO `tr_express` VALUES ('24', '联昊通', '1', 'lianhaowuliu', 'L', '2', 'http://www.lhtex.com.cn');
INSERT INTO `tr_express` VALUES ('25', '全一快递', '1', 'quanyikuaidi', 'Q', '2', 'http://www.apex100.com');
INSERT INTO `tr_express` VALUES ('26', '全峰快递', '1', 'quanfengkuaidi', 'Q', '2', 'http://www.qfkd.com.cn');
INSERT INTO `tr_express` VALUES ('27', '全日通', '1', 'quanritongkuaidi', 'Q', '2', 'http://www.at-express.com');
INSERT INTO `tr_express` VALUES ('28', '申通快递', '1', 'shentong', 'S', '2', 'http://www.sto.cn');
INSERT INTO `tr_express` VALUES ('29', '顺丰快递', '1', 'shunfeng', 'S', '1', 'http://www.sf-express.com');
INSERT INTO `tr_express` VALUES ('30', '速尔快递', '1', 'suer', 'S', '2', 'http://www.sure56.com');
INSERT INTO `tr_express` VALUES ('31', 'TNT快递', '1', 'tnt', 'T', '2', 'http://www.tnt.com.cn');
INSERT INTO `tr_express` VALUES ('32', '天天快递', '1', 'tiantian', 'T', '2', 'http://www.ttkdex.com');
INSERT INTO `tr_express` VALUES ('33', '天地华宇', '1', 'tiandihuayu', 'T', '2', 'http://www.hoau.net');
INSERT INTO `tr_express` VALUES ('34', 'UPS快递', '1', 'ups', 'U', '2', 'http://www.ups.com/cn');
INSERT INTO `tr_express` VALUES ('35', 'USPS', '1', 'usps', 'U', '2', 'http://www.kuaidi100.com/all/usps.shtml');
INSERT INTO `tr_express` VALUES ('36', '新邦物流', '1', 'xinbangwuliu', 'X', '2', 'http://www.xbwl.cn');
INSERT INTO `tr_express` VALUES ('37', '信丰物流', '1', 'xinfengwuliu', 'X', '2', 'http://www.xf-express.com.cn');
INSERT INTO `tr_express` VALUES ('38', '希伊艾斯', '1', 'cces', 'X', '2', 'http://www.cces.com.cn');
INSERT INTO `tr_express` VALUES ('39', '新蛋物流', '1', 'neweggozzo', 'X', '2', 'http://www.ozzo.com.cn');
INSERT INTO `tr_express` VALUES ('40', '圆通快递', '1', 'yuantong', 'Y', '1', 'http://www.yto.net.cn');
INSERT INTO `tr_express` VALUES ('41', '韵达快递', '1', 'yunda', 'Y', '1', 'http://www.yundaex.com');
INSERT INTO `tr_express` VALUES ('42', '邮政包裹', '1', 'youzhengguonei', 'Y', '2', 'http://yjcx.chinapost.com.cn');
INSERT INTO `tr_express` VALUES ('43', '优速快递', '1', 'youshuwuliu', 'Y', '2', 'http://www.uc56.com');
INSERT INTO `tr_express` VALUES ('44', '中通快递', '1', 'zhongtong', 'Z', '1', 'http://www.zto.cn');
INSERT INTO `tr_express` VALUES ('45', '中铁快运', '1', 'zhongtiewuliu', 'Z', '2', 'http://www.cre.cn');
INSERT INTO `tr_express` VALUES ('46', '宅急送', '1', 'zhaijisong', 'Z', '2', 'http://www.zjs.com.cn');
INSERT INTO `tr_express` VALUES ('47', '中邮物流', '1', 'zhongyouwuliu', 'Z', '2', 'http://www.cnpl.com.cn');

-- ----------------------------
-- Table structure for `tr_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `tr_favorites`;
CREATE TABLE `tr_favorites` (
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `fav_id` int(10) unsigned NOT NULL COMMENT '收藏ID',
  `fav_type` varchar(20) NOT NULL COMMENT '收藏类型',
  `fav_time` int(10) unsigned NOT NULL COMMENT '收藏时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='买家收藏表';

-- ----------------------------
-- Records of tr_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_flowstat_1`
-- ----------------------------
DROP TABLE IF EXISTS `tr_flowstat_1`;
CREATE TABLE `tr_flowstat_1` (
  `date` int(8) unsigned NOT NULL COMMENT '访问日期',
  `clicknum` int(11) unsigned NOT NULL COMMENT '访问量',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问量统计表';

-- ----------------------------
-- Records of tr_flowstat_1
-- ----------------------------
INSERT INTO `tr_flowstat_1` VALUES ('20150527', '9', '1', 'sum', '0');
INSERT INTO `tr_flowstat_1` VALUES ('20150527', '3', '1', 'goods', '232');
INSERT INTO `tr_flowstat_1` VALUES ('20150527', '2', '1', 'goods', '231');
INSERT INTO `tr_flowstat_1` VALUES ('20150527', '1', '1', 'goods', '52');
INSERT INTO `tr_flowstat_1` VALUES ('20150527', '2', '1', 'goods', '54');
INSERT INTO `tr_flowstat_1` VALUES ('20150527', '1', '1', 'goods', '53');
INSERT INTO `tr_flowstat_1` VALUES ('20150528', '5', '1', 'sum', '0');
INSERT INTO `tr_flowstat_1` VALUES ('20150528', '4', '1', 'goods', '53');
INSERT INTO `tr_flowstat_1` VALUES ('20150528', '1', '1', 'goods', '52');
INSERT INTO `tr_flowstat_1` VALUES ('20150529', '8', '1', 'sum', '0');
INSERT INTO `tr_flowstat_1` VALUES ('20150529', '2', '1', 'goods', '54');
INSERT INTO `tr_flowstat_1` VALUES ('20150529', '2', '1', 'goods', '53');
INSERT INTO `tr_flowstat_1` VALUES ('20150529', '1', '1', 'goods', '38');
INSERT INTO `tr_flowstat_1` VALUES ('20150529', '1', '1', 'goods', '47');
INSERT INTO `tr_flowstat_1` VALUES ('20150601', '9', '1', 'sum', '0');
INSERT INTO `tr_flowstat_1` VALUES ('20150601', '1', '1', 'goods', '51');
INSERT INTO `tr_flowstat_1` VALUES ('20150601', '13', '2', 'sum', '0');
INSERT INTO `tr_flowstat_1` VALUES ('20150601', '12', '2', 'goods', '100001');
INSERT INTO `tr_flowstat_1` VALUES ('20150601', '1', '1', 'goods', '41');
INSERT INTO `tr_flowstat_1` VALUES ('20150601', '3', '1', 'goods', '52');
INSERT INTO `tr_flowstat_1` VALUES ('20150601', '1', '1', 'goods', '46');
INSERT INTO `tr_flowstat_1` VALUES ('20150601', '1', '1', 'goods', '42');
INSERT INTO `tr_flowstat_1` VALUES ('20150601', '1', '1', 'goods', '43');
INSERT INTO `tr_flowstat_1` VALUES ('20150601', '1', '1', 'goods', '54');
INSERT INTO `tr_flowstat_1` VALUES ('20150602', '18', '1', 'sum', '0');
INSERT INTO `tr_flowstat_1` VALUES ('20150602', '3', '1', 'goods', '54');
INSERT INTO `tr_flowstat_1` VALUES ('20150602', '5', '2', 'sum', '0');
INSERT INTO `tr_flowstat_1` VALUES ('20150602', '3', '2', 'goods', '100001');
INSERT INTO `tr_flowstat_1` VALUES ('20150602', '1', '1', 'goods', '53');
INSERT INTO `tr_flowstat_1` VALUES ('20150602', '1', '1', 'goods', '38');
INSERT INTO `tr_flowstat_1` VALUES ('20150602', '5', '1', 'goods', '232');
INSERT INTO `tr_flowstat_1` VALUES ('20150602', '1', '1', 'goods', '50');
INSERT INTO `tr_flowstat_1` VALUES ('20150603', '17', '1', 'sum', '0');
INSERT INTO `tr_flowstat_1` VALUES ('20150603', '3', '1', 'goods', '53');
INSERT INTO `tr_flowstat_1` VALUES ('20150603', '2', '1', 'goods', '54');
INSERT INTO `tr_flowstat_1` VALUES ('20150603', '1', '1', 'goods', '51');
INSERT INTO `tr_flowstat_1` VALUES ('20150603', '4', '1', 'goods', '232');
INSERT INTO `tr_flowstat_1` VALUES ('20150603', '31', '2', 'sum', '0');
INSERT INTO `tr_flowstat_1` VALUES ('20150603', '31', '2', 'goods', '100001');
INSERT INTO `tr_flowstat_1` VALUES ('20150603', '1', '1', 'goods', '41');
INSERT INTO `tr_flowstat_1` VALUES ('20150603', '1', '1', 'goods', '46');
INSERT INTO `tr_flowstat_1` VALUES ('20150603', '1', '1', 'goods', '52');
INSERT INTO `tr_flowstat_1` VALUES ('20150603', '4', '1', 'goods', '38');

-- ----------------------------
-- Table structure for `tr_flowstat_2`
-- ----------------------------
DROP TABLE IF EXISTS `tr_flowstat_2`;
CREATE TABLE `tr_flowstat_2` (
  `date` int(8) unsigned NOT NULL COMMENT '访问日期',
  `clicknum` int(11) unsigned NOT NULL COMMENT '访问量',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问量统计表';

-- ----------------------------
-- Records of tr_flowstat_2
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_flowstat_3`
-- ----------------------------
DROP TABLE IF EXISTS `tr_flowstat_3`;
CREATE TABLE `tr_flowstat_3` (
  `date` int(8) unsigned NOT NULL COMMENT '访问日期',
  `clicknum` int(11) unsigned NOT NULL COMMENT '访问量',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问量统计表';

-- ----------------------------
-- Records of tr_flowstat_3
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_flowstat_4`
-- ----------------------------
DROP TABLE IF EXISTS `tr_flowstat_4`;
CREATE TABLE `tr_flowstat_4` (
  `date` int(8) unsigned NOT NULL COMMENT '访问日期',
  `clicknum` int(11) unsigned NOT NULL COMMENT '访问量',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问量统计表';

-- ----------------------------
-- Records of tr_flowstat_4
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_flowstat_5`
-- ----------------------------
DROP TABLE IF EXISTS `tr_flowstat_5`;
CREATE TABLE `tr_flowstat_5` (
  `date` int(8) unsigned NOT NULL COMMENT '访问日期',
  `clicknum` int(11) unsigned NOT NULL COMMENT '访问量',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问量统计表';

-- ----------------------------
-- Records of tr_flowstat_5
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_gadmin`
-- ----------------------------
DROP TABLE IF EXISTS `tr_gadmin`;
CREATE TABLE `tr_gadmin` (
  `gid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gname` varchar(50) DEFAULT NULL COMMENT '组名',
  `limits` text COMMENT '权限内容',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组';

-- ----------------------------
-- Records of tr_gadmin
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tr_goods`;
CREATE TABLE `tr_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id(SKU)',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称（+规格名称）',
  `goods_jingle` varchar(50) NOT NULL COMMENT '商品广告词',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌id',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_marketprice` decimal(10,2) NOT NULL COMMENT '市场价',
  `goods_serial` varchar(50) NOT NULL COMMENT '商家编号',
  `goods_click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `goods_salenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `goods_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `goods_spec` text NOT NULL COMMENT '商品规格序列化',
  `goods_storage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存',
  `goods_image` varchar(100) NOT NULL DEFAULT '' COMMENT '商品主图',
  `goods_state` tinyint(3) unsigned NOT NULL COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `goods_verify` tinyint(3) unsigned NOT NULL COMMENT '商品审核 1通过，0未通过，10审核中',
  `goods_addtime` int(10) unsigned NOT NULL COMMENT '商品添加时间',
  `goods_edittime` int(10) unsigned NOT NULL COMMENT '商品编辑时间',
  `areaid_1` int(10) unsigned NOT NULL COMMENT '一级地区id',
  `areaid_2` int(10) unsigned NOT NULL COMMENT '二级地区id',
  `color_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '颜色规格id',
  `transport_id` mediumint(8) unsigned NOT NULL COMMENT '运费模板id',
  `goods_freight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `goods_vat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `goods_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品推荐 1是，0否 默认0',
  `goods_stcids` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `evaluation_good_star` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '好评星级',
  `evaluation_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价数',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100002 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of tr_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_goods_attr_index`
-- ----------------------------
DROP TABLE IF EXISTS `tr_goods_attr_index`;
CREATE TABLE `tr_goods_attr_index` (
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `attr_id` int(10) unsigned NOT NULL COMMENT '属性id',
  `attr_value_id` int(10) unsigned NOT NULL COMMENT '属性值id',
  PRIMARY KEY (`goods_id`,`gc_id`,`attr_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品与属性对应表';

-- ----------------------------
-- Records of tr_goods_attr_index
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_goods_class`
-- ----------------------------
DROP TABLE IF EXISTS `tr_goods_class`;
CREATE TABLE `tr_goods_class` (
  `gc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `gc_name` varchar(100) NOT NULL COMMENT '分类名称',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `type_name` varchar(100) NOT NULL COMMENT '类型名称',
  `gc_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `gc_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `gc_title` varchar(200) NOT NULL COMMENT '名称',
  `gc_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `gc_description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`gc_id`),
  KEY `store_id` (`gc_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1064 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of tr_goods_class
-- ----------------------------
INSERT INTO `tr_goods_class` VALUES ('1', '旅游超市', '37', '旅游', '0', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('2', '购物超市', '0', '', '0', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('3', '保险超市', '0', '', '0', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('4', '超值旅游', '37', '旅游', '1', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('5', '特价游', '37', '旅游', '1', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('6', '存话费送旅游', '37', '旅游', '1', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('7', '自由行', '37', '旅游', '1', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('8', '汽车租赁', '37', '旅游', '1', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('9', '高端商旅', '37', '旅游', '1', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('74', '机票+酒店', '37', '旅游', '7', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('75', '机票+景区', '37', '旅游', '7', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('76', '酒店+景区', '37', '旅游', '7', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('77', '机票+酒店', '37', '旅游', '7', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('151', '顺道天下', '0', '', '2', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('155', '春芝堂', '0', '', '2', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('200', '会员旅游人身意外险', '0', '', '3', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('201', '财险', '0', '', '3', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('202', '寿险', '0', '', '3', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('218', '中国人寿', '0', '', '201', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('219', '中国平安', '0', '', '201', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('220', '阳光财险', '0', '', '201', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1057', '中国人寿', '0', '', '202', '0', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1058', '中国平安', '0', '', '202', '0', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1059', '太平洋保险', '0', '', '202', '0', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('256', '金融超市', '0', '', '0', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('258', '信用卡产品', '0', '', '256', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('259', '金融理财', '0', '', '256', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('260', '信誉贷款', '0', '', '256', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('262', '手机', '0', '', '257', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('263', '对讲机', '0', '', '257', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('294', 'MP3/MP4', '0', '', '261', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('295', '智能设备', '0', '', '261', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('296', '耳机/耳麦', '0', '', '261', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('297', '音箱', '0', '', '261', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('298', '高清播放器', '0', '', '261', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('299', '电子书', '0', '', '261', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('300', '电子词典', '0', '', '261', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('301', 'MP3/MP4配件', '0', '', '261', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('302', '录音笔', '0', '', '261', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('303', '麦克风', '0', '', '261', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('304', '专业音频', '0', '', '261', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('305', '电子教育', '0', '', '261', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('306', '数码相框', '0', '', '261', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('307', '苹果配件', '0', '', '261', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('308', '文化中心', '0', '', '0', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('309', '婚庆庆典', '0', '', '308', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('310', '动漫游戏', '0', '', '308', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('311', '书画交流', '0', '', '308', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('358', '剃须刀', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('359', '剃/脱毛器', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('360', '口腔护理', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('361', '电吹风', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('362', '美容器', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('363', '美发器', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('364', '按摩椅', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('365', '按摩器', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('366', '足浴盆', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('367', '血压计', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('368', '健康秤/厨房秤', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('369', '血糖仪', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('370', '体温计', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('371', '计步器/脂肪检测仪', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('372', '其它健康电器', '0', '', '312', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('373', '电动工具', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('374', '手动工具', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('375', '仪器仪表', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('376', '浴霸/排气扇', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('377', '灯具', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('378', 'LED灯', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('379', '洁身器', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('380', '水槽', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('381', '龙头', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('382', '淋浴花洒', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('383', '厨卫五金', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('384', '家具五金', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('385', '门铃', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('386', '电气开关', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('387', '插座', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('388', '电工电料', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('389', '监控安防', '0', '', '313', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('398', '笔记本', '0', '', '390', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('399', '超极本', '0', '', '390', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('400', '游戏本', '0', '', '390', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('401', '平板电脑', '0', '', '390', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('402', '平板电脑配件', '0', '', '390', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('403', '台式机', '0', '', '390', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('404', '服务器', '0', '', '390', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('405', '笔记本配件', '0', '', '390', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('406', 'CPU', '0', '', '391', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('407', '主板', '0', '', '391', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('408', '显卡', '0', '', '391', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('409', '硬盘', '0', '', '391', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('410', 'SSD固态硬盘', '0', '', '391', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('411', '内存', '0', '', '391', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('412', '机箱', '0', '', '391', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('413', '电源', '0', '', '391', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('414', '显示器', '0', '', '391', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('415', '刻录机/光驱', '0', '', '391', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('416', '散热器', '0', '', '391', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('417', '声卡/扩展卡', '0', '', '391', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('418', '装机配件', '0', '', '391', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('419', '鼠标', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('420', '键盘', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('421', '移动硬盘', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('422', 'U盘', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('423', '摄像头', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('424', '外置盒', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('425', '游戏设备', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('426', '电视盒', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('427', '手写板', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('428', '鼠标垫', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('429', '插座', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('430', 'UPS电源', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('431', '线缆', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('432', '电脑工具', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('433', '电脑清洁', '0', '', '392', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('434', '路由器', '0', '', '393', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('435', '网卡', '0', '', '393', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('436', '交换机', '0', '', '393', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('437', '网络存储', '0', '', '393', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('438', '3G上网', '0', '', '393', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('439', '网络盒子', '0', '', '393', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('440', '打印机', '0', '', '394', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('441', '一体机', '0', '', '394', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('442', '投影机', '0', '', '394', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('443', '投影配件', '0', '', '394', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('444', '传真机', '0', '', '394', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('445', '复合机', '0', '', '394', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('446', '碎纸机', '0', '', '394', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('447', '扫描仪', '0', '', '394', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('448', '墨盒', '0', '', '394', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('449', '硒鼓', '0', '', '394', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('450', '墨粉', '0', '', '394', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('451', '色带', '0', '', '394', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('452', '办公文具', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('453', '文件管理', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('454', '笔类', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('455', '纸类', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('456', '本册/便签', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('457', '学生文具', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('458', '财务用品', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('459', '计算器', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('460', '激光笔', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('461', '白板/封装', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('462', '考勤机', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('463', '刻录碟片/附件', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('464', '点钞机', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('465', '支付设备/POS机', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('466', '安防监控', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('467', '呼叫/会议设备', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('468', '保险柜', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('469', '办公家具', '0', '', '395', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('470', '游轮中心', '0', '', '0', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('502', '卫生巾', '0', '', '474', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('503', '卫生护垫', '0', '', '474', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('504', '洗液', '0', '', '474', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('505', '美容食品', '0', '', '474', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('506', '其他', '0', '', '474', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('507', '脸部护理', '0', '', '475', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('508', '眼部护理', '0', '', '475', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('509', '身体护理', '0', '', '475', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('510', '男士香水', '0', '', '475', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('511', '剃须护理', '0', '', '475', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('512', '防脱洗护', '0', '', '475', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('513', '男士唇膏', '0', '', '475', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('514', '粉底/遮瑕', '0', '', '476', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('515', '腮红', '0', '', '476', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('516', '眼影/眼线', '0', '', '476', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('517', '眉笔', '0', '', '476', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('518', '睫毛膏', '0', '', '476', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('519', '唇膏唇彩', '0', '', '476', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('520', '彩妆组合', '0', '', '476', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('521', '卸妆', '0', '', '476', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('522', '美甲', '0', '', '476', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('523', '彩妆工具', '0', '', '476', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('524', '假发', '0', '', '476', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('525', '女士香水', '0', '', '477', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('526', '男士香水', '0', '', '477', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('527', '组合套装', '0', '', '477', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('528', '迷你香水', '0', '', '477', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('529', '香体走珠', '0', '', '477', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('530', '春芝堂商场', '0', '', '0', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1063', '高尔夫', '0', '', '9', '0', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1062', '私人海钓', '0', '', '9', '0', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1061', '旅游套票', '0', '', '9', '0', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1060', '私人飞机', '0', '', '9', '0', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('593', '商学院', '50', '食品通用', '0', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('662', '汽车租赁', '0', '', '0', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('663', '汽车租赁', '0', '', '662', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('664', '户外装备', '0', '', '662', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('665', '运动器械', '0', '', '662', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('666', '纤体瑜伽', '0', '', '662', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('667', '体育娱乐', '0', '', '662', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('668', '成人用品', '0', '', '662', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('669', '保健器械', '0', '', '662', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('670', '急救卫生', '0', '', '662', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('671', '户外服装', '0', '', '663', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('672', '户外鞋袜', '0', '', '663', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('673', '户外配饰', '0', '', '663', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('674', '帐篷', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('675', '睡袋', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('676', '登山攀岩', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('677', '户外背包', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('678', '户外照明', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('679', '户外垫子', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('680', '户外仪表', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('681', '户外工具', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('682', '望远镜', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('683', '垂钓用品', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('684', '旅游用品', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('685', '便携桌椅床', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('686', '烧烤用品', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('687', '野餐炊具', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('688', '军迷用品', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('689', '游泳用具', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('690', '泳衣', '0', '', '664', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('691', '健身器械', '0', '', '665', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('692', '运动器材', '0', '', '665', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('693', '极限轮滑', '0', '', '665', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('694', '骑行运动', '0', '', '665', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('695', '运动护具', '0', '', '665', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('696', '武术搏击', '0', '', '665', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('697', '瑜伽垫', '0', '', '666', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('698', '瑜伽服', '0', '', '666', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('699', '瑜伽配件', '0', '', '666', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('700', '瑜伽套装', '0', '', '666', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('701', '舞蹈鞋服', '0', '', '666', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('702', '羽毛球', '0', '', '667', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('703', '乒乓球', '0', '', '667', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('704', '篮球', '0', '', '667', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('705', '足球', '0', '', '667', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('706', '网球', '0', '', '667', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('707', '排球', '0', '', '667', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('708', '高尔夫球', '0', '', '667', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('709', '棋牌麻将', '0', '', '667', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('710', '其他', '0', '', '667', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('711', '安全避孕', '0', '', '668', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('712', '验孕测孕', '0', '', '668', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('713', '人体润滑', '0', '', '668', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('714', '情爱玩具', '0', '', '668', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('715', '情趣内衣', '0', '', '668', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('716', '组合套装', '0', '', '668', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('717', '养生器械', '0', '', '669', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('718', '保健用品', '0', '', '669', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('719', '康复辅助', '0', '', '669', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('720', '家庭护理', '0', '', '669', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('721', '跌打损伤', '0', '', '670', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('722', '烫伤止痒', '0', '', '670', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('723', '防裂抗冻', '0', '', '670', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('724', '口腔咽部', '0', '', '670', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('725', '眼部保健', '0', '', '670', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('726', '鼻炎健康', '0', '', '670', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('727', '风湿骨痛', '0', '', '670', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('728', '生殖泌尿', '0', '', '670', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('729', '美体塑身', '0', '', '670', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('730', '好客专车', '0', '', '0', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('731', '私家车', '0', '', '730', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('732', '系统养护', '0', '', '730', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('733', '改装配件', '0', '', '730', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('734', '汽车美容', '0', '', '730', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('735', '座垫脚垫', '0', '', '730', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('736', '内饰精品', '0', '', '730', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('737', '安全自驾', '0', '', '730', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('738', '便携GPS导航', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('739', '嵌入式导航', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('740', '安全预警仪', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('741', '行车记录仪', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('742', '跟踪防盗器', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('743', '倒车雷达', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('744', '车载电源', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('745', '车载蓝牙', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('746', '车载影音', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('747', '车载净化器', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('748', '车载冰箱', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('749', '车载吸尘器', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('750', '充气泵', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('751', '胎压监测', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('752', '车载生活电器', '0', '', '731', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('753', '机油', '0', '', '732', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('754', '添加剂', '0', '', '732', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('755', '防冻冷却液', '0', '', '732', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('756', '附属油', '0', '', '732', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('757', '底盘装甲', '0', '', '732', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('758', '空调清洗剂', '0', '', '732', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('759', '金属养护', '0', '', '732', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('760', '雨刷', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('761', '车灯', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('762', '轮胎', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('763', '贴膜', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('764', '装饰贴', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('765', '后视镜', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('766', '机油滤', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('767', '空气滤', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('768', '空调滤', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('769', '燃油滤', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('770', '火花塞', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('771', '喇叭', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('772', '刹车片', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('773', '刹车盘', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('774', '减震器', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('775', '车身装饰', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('776', '尾喉/排气管', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('777', '踏板', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('778', '蓄电池', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('779', '其他配件', '0', '', '733', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('780', '漆面美容', '0', '', '734', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('781', '漆面修复', '0', '', '734', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('782', '内饰清洁', '0', '', '734', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('783', '玻璃美容', '0', '', '734', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('784', '补漆笔', '0', '', '734', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('785', '轮胎轮毂清洗', '0', '', '734', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('786', '洗车器', '0', '', '734', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('787', '洗车水枪', '0', '', '734', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('788', '洗车配件', '0', '', '734', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('789', '洗车液', '0', '', '734', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('790', '车掸', '0', '', '734', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('791', '擦车巾/海绵', '0', '', '734', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('792', '凉垫', '0', '', '735', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('793', '四季垫', '0', '', '735', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('794', '毛垫', '0', '', '735', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('795', '专车专用座垫', '0', '', '735', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('796', '专车专用座套', '0', '', '735', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('797', '通用座套', '0', '', '735', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('798', '多功能垫', '0', '', '735', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('799', '专车专用脚垫', '0', '', '735', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('800', '通用脚垫', '0', '', '735', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('801', '后备箱垫', '0', '', '735', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('802', '车用香水', '0', '', '736', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('803', '车用炭包', '0', '', '736', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('804', '空气净化', '0', '', '736', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('805', '颈枕/头枕', '0', '', '736', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('806', '抱枕/腰靠', '0', '', '736', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('807', '方向盘套', '0', '', '736', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('808', '挂件', '0', '', '736', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('809', '摆件', '0', '', '736', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('810', '布艺软饰', '0', '', '736', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('811', '功能用品', '0', '', '736', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('812', '整理收纳', '0', '', '736', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('813', 'CD夹', '0', '', '736', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('814', '儿童安全座椅', '0', '', '737', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('815', '应急救援', '0', '', '737', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('816', '汽修工具', '0', '', '737', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('817', '自驾野营', '0', '', '737', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('818', '自驾照明', '0', '', '737', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('819', '保温箱', '0', '', '737', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('820', '置物箱', '0', '', '737', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('821', '车衣', '0', '', '737', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('822', '遮阳挡雪挡', '0', '', '737', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('823', '车锁地锁', '0', '', '737', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('824', '摩托车装备', '0', '', '737', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('826', '适用年龄', '0', '', '825', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('827', '遥控/电动', '0', '', '825', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('828', '毛绒布艺', '0', '', '825', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('829', '娃娃玩具', '0', '', '825', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('830', '模型玩具', '0', '', '825', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('831', '健身玩具', '0', '', '825', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('832', '动漫玩具', '0', '', '825', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('833', '益智玩具', '0', '', '825', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('834', '积木拼插', '0', '', '825', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('835', 'DIY玩具', '0', '', '825', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('836', '创意减压', '0', '', '825', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('837', '乐器相关', '0', '', '825', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('838', '0-6个月', '0', '', '826', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('839', '6-12个月', '0', '', '826', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('840', '1-3岁', '0', '', '826', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('841', '3-6岁', '0', '', '826', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('842', '6-14岁', '0', '', '826', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('843', '14岁以上', '0', '', '826', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('844', '遥控车', '0', '', '827', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('845', '遥控飞机', '0', '', '827', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('846', '遥控船', '0', '', '827', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('847', '机器人/电动', '0', '', '827', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('848', '轨道/助力', '0', '', '827', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('849', '毛绒/布艺', '0', '', '828', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('850', '靠垫/抱枕', '0', '', '828', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('851', '芭比娃娃', '0', '', '829', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('852', '卡通娃娃', '0', '', '829', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('853', '智能娃娃', '0', '', '829', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('854', '仿真模型', '0', '', '830', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('855', '拼插模型', '0', '', '830', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('856', '收藏爱好', '0', '', '830', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('857', '炫舞毯', '0', '', '831', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('858', '爬行垫/毯', '0', '', '831', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('859', '户外玩具', '0', '', '831', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('860', '戏水玩具', '0', '', '831', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('861', '电影周边', '0', '', '832', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('862', '卡通周边', '0', '', '832', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('863', '网游周边', '0', '', '832', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('864', '摇铃/床铃', '0', '', '833', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('865', '健身架', '0', '', '833', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('866', '早教启智', '0', '', '833', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('867', '拖拉玩具', '0', '', '833', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('868', '积木', '0', '', '834', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('869', '拼图', '0', '', '834', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('870', '磁力棒', '0', '', '834', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('871', '立体拼插', '0', '', '834', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('872', '手工彩泥', '0', '', '835', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('873', '绘画工具', '0', '', '835', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('874', '情景玩具', '0', '', '835', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('875', '减压玩具', '0', '', '836', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('876', '创意玩具', '0', '', '836', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('877', '钢琴', '0', '', '837', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('878', '电子琴', '0', '', '837', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('879', '手风琴', '0', '', '837', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('880', '吉他/贝斯', '0', '', '837', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('881', '民族管弦乐器', '0', '', '837', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('882', '西洋管弦乐', '0', '', '837', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('883', '口琴/口风琴/竖笛', '0', '', '837', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('884', '西洋打击乐器', '0', '', '837', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('885', '各式乐器配件', '0', '', '837', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('886', '电脑音乐', '0', '', '837', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('887', '工艺礼品乐器', '0', '', '837', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('889', '烹饪锅具', '0', '', '888', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('890', '刀剪菜板', '0', '', '888', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('891', '收纳保鲜', '0', '', '888', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('892', '水具酒具', '0', '', '888', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('893', '餐具', '0', '', '888', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('895', '炒锅', '0', '', '889', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('896', '煎锅', '0', '', '889', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('897', '压力锅', '0', '', '889', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('898', '蒸锅', '0', '', '889', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('899', '汤锅', '0', '', '889', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('900', '奶锅', '0', '', '889', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('901', '套锅', '0', '', '889', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('902', '煲类', '0', '', '889', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('903', '水壶', '0', '', '889', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('904', '厨用杂件', '0', '', '889', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('905', '单刀', '0', '', '890', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('906', '剪刀', '0', '', '890', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('907', '套刀', '0', '', '890', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('908', '砧板', '0', '', '890', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('909', '刀具配件', '0', '', '890', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('910', '保鲜盒', '0', '', '891', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('911', '保鲜膜/袋', '0', '', '891', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('912', '调料器皿', '0', '', '891', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('913', '饭盒/提锅', '0', '', '891', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('914', '塑料杯', '0', '', '892', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('915', '运动水壶', '0', '', '892', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('916', '玻璃杯', '0', '', '892', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('917', '陶瓷杯', '0', '', '892', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('918', '保温杯', '0', '', '892', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('919', '保温壶', '0', '', '892', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('920', '酒杯/套装', '0', '', '892', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('921', '酒具配件', '0', '', '892', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('922', '餐具套装', '0', '', '893', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('923', '碗/碟/盘', '0', '', '893', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('924', '筷勺/刀叉', '0', '', '893', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('925', '一次性餐具', '0', '', '893', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('935', '茶具/咖啡具', '0', '', '888', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('936', '整套茶具', '0', '', '935', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('937', '茶杯', '0', '', '935', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('938', '茶壶', '0', '', '935', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('939', '茶盘茶托', '0', '', '935', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('940', '茶叶罐', '0', '', '935', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('941', '茶具配件', '0', '', '935', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('942', '茶宠摆件', '0', '', '935', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('943', '咖啡具', '0', '', '935', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('944', '其他', '0', '', '935', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('960', '奶粉', '0', '', '959', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('961', '营养辅食', '0', '', '959', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('962', '尿裤湿巾', '0', '', '959', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('963', '喂养用品', '0', '', '959', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('964', '洗护用品', '0', '', '959', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('965', '童车童床', '0', '', '959', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('966', '服饰寝居', '0', '', '959', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('967', '妈妈专区', '0', '', '959', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('968', '品牌奶粉', '0', '', '960', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('969', '妈妈奶粉', '0', '', '960', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('970', '1段奶粉', '0', '', '960', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('971', '2段奶粉', '0', '', '960', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('972', '3段奶粉', '0', '', '960', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('973', '4段奶粉', '0', '', '960', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('974', '羊奶粉', '0', '', '960', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('975', '特殊配方', '0', '', '960', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('976', '成人奶粉', '0', '', '960', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('977', '婴幼营养', '0', '', '961', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('978', '初乳', '0', '', '961', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('979', '米粉/菜粉', '0', '', '961', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('980', '果泥/果汁', '0', '', '961', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('981', '肉松/饼干', '0', '', '961', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('982', '辅食', '0', '', '961', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('983', '孕期营养', '0', '', '961', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('984', '清火/开胃', '0', '', '961', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('985', '面条/粥', '0', '', '961', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('986', '品牌尿裤', '0', '', '962', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('987', '新生儿', '0', '', '962', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('988', 'S号', '0', '', '962', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('989', 'M号', '0', '', '962', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('990', 'L号', '0', '', '962', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('991', 'XL/XXL号', '0', '', '962', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('992', '裤型尿裤', '0', '', '962', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('993', '湿巾', '0', '', '962', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('994', '尿布/尿垫', '0', '', '962', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('995', '成人尿裤', '0', '', '962', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('996', '奶瓶', '0', '', '963', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('997', '奶嘴', '0', '', '963', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('998', '吸奶器', '0', '', '963', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('999', '暖奶/消毒', '0', '', '963', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1000', '餐具', '0', '', '963', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1001', '水具', '0', '', '963', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1002', '牙胶/安抚', '0', '', '963', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1003', '辅助用品', '0', '', '963', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1004', '宝宝护肤', '0', '', '964', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1005', '洗浴用品', '0', '', '964', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1006', '洗发沐浴', '0', '', '964', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1007', '清洁用品', '0', '', '964', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1008', '护理用品', '0', '', '964', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1009', '妈妈护肤', '0', '', '964', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1010', '婴儿推车', '0', '', '965', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1011', '餐椅摇椅', '0', '', '965', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1012', '婴儿床', '0', '', '965', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1013', '学步车', '0', '', '965', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1014', '三轮车', '0', '', '965', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1015', '自行车', '0', '', '965', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1016', '电动车', '0', '', '965', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1017', '健身车', '0', '', '965', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1018', '安全座椅', '0', '', '965', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1019', '婴儿外出服', '0', '', '966', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1020', '婴儿内衣', '0', '', '966', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1021', '婴儿礼盒', '0', '', '966', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1022', '婴儿鞋帽袜', '0', '', '966', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1023', '安全防护', '0', '', '966', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1024', '家居床品', '0', '', '966', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1025', '其他', '0', '', '966', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1026', '包/背婴带', '0', '', '967', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1027', '妈妈护理', '0', '', '967', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1028', '产后塑身', '0', '', '967', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1029', '孕妇内衣', '0', '', '967', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1030', '防辐射服', '0', '', '967', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1031', '孕妇装', '0', '', '967', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1032', '孕妇食品', '0', '', '967', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1033', '妈妈美容', '0', '', '967', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1035', '手机', '0', '', '1034', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1036', '对讲机', '0', '', '1034', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1041', '充值', '0', '', '1037', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1042', '游戏', '0', '', '1037', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1043', '票务', '0', '', '1037', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1044', '手机充值', '0', '', '1041', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1045', '游戏点卡', '0', '', '1042', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1046', 'QQ充值', '0', '', '1042', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1047', '电影票', '0', '', '1043', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1048', '演唱会', '0', '', '1043', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1049', '话剧/歌剧/音乐剧', '0', '', '1043', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1050', '体育赛事', '0', '', '1043', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1051', '舞蹈芭蕾', '0', '', '1043', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1052', '戏曲综艺', '0', '', '1043', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1054', '整车', '0', '', '730', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1055', '新车', '52', '汽车', '1054', '255', '', '', '');
INSERT INTO `tr_goods_class` VALUES ('1056', '二手车', '52', '汽车', '1054', '255', '', '', '');

-- ----------------------------
-- Table structure for `tr_goods_class_staple`
-- ----------------------------
DROP TABLE IF EXISTS `tr_goods_class_staple`;
CREATE TABLE `tr_goods_class_staple` (
  `staple_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '常用分类id',
  `staple_name` varchar(255) NOT NULL COMMENT '常用分类名称',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级商品分类',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级商品分类',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `counter` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '计数器',
  PRIMARY KEY (`staple_id`),
  KEY `store_id` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺常用分类表';

-- ----------------------------
-- Records of tr_goods_class_staple
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_goods_class_tag`
-- ----------------------------
DROP TABLE IF EXISTS `tr_goods_class_tag`;
CREATE TABLE `tr_goods_class_tag` (
  `gc_tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'TAGid',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级分类id',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级分类id',
  `gc_tag_name` varchar(255) NOT NULL COMMENT '分类TAG名称',
  `gc_tag_value` text NOT NULL COMMENT '分类TAG值',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  PRIMARY KEY (`gc_tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=900 DEFAULT CHARSET=utf8 COMMENT='商品分类TAG表';

-- ----------------------------
-- Records of tr_goods_class_tag
-- ----------------------------
INSERT INTO `tr_goods_class_tag` VALUES ('64', '1', '7', '74', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;休闲鞋', '服饰鞋帽,运动,休闲鞋', '74', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('65', '1', '7', '75', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;帆布鞋', '服饰鞋帽,运动,帆布鞋', '75', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('66', '1', '7', '76', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;跑步鞋', '服饰鞋帽,运动,跑步鞋', '76', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('67', '1', '7', '77', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;篮球鞋', '服饰鞋帽,运动,篮球鞋', '77', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('68', '1', '7', '78', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;足球鞋', '服饰鞋帽,运动,足球鞋', '78', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('69', '1', '7', '79', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;训练鞋', '服饰鞋帽,运动,训练鞋', '79', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('70', '1', '7', '80', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;乒羽鞋', '服饰鞋帽,运动,乒羽鞋', '80', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('71', '1', '7', '81', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;拖鞋', '服饰鞋帽,运动,拖鞋', '81', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('72', '1', '7', '82', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;卫衣', '服饰鞋帽,运动,卫衣', '82', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('73', '1', '7', '83', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;夹克', '服饰鞋帽,运动,夹克', '83', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('74', '1', '7', '84', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;T恤', '服饰鞋帽,运动,T恤', '84', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('75', '1', '7', '85', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;棉服／羽绒服', '服饰鞋帽,运动,棉服／羽绒服', '85', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('76', '1', '7', '86', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;运动裤', '服饰鞋帽,运动,运动裤', '86', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('77', '1', '7', '87', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;套装', '服饰鞋帽,运动,套装', '87', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('78', '1', '7', '88', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;运动包', '服饰鞋帽,运动,运动包', '88', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('79', '1', '7', '89', '服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;运动配件', '服饰鞋帽,运动,运动配件', '89', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('109', '1', '10', '119', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;太阳镜', '服饰鞋帽,配饰,太阳镜', '119', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('110', '1', '10', '120', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;框镜', '服饰鞋帽,配饰,框镜', '120', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('111', '1', '10', '121', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;皮带', '服饰鞋帽,配饰,皮带', '121', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('112', '1', '10', '122', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;围巾', '服饰鞋帽,配饰,围巾', '122', '34');
INSERT INTO `tr_goods_class_tag` VALUES ('113', '1', '10', '123', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;手套', '服饰鞋帽,配饰,手套', '123', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('114', '1', '10', '124', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;帽子', '服饰鞋帽,配饰,帽子', '124', '48');
INSERT INTO `tr_goods_class_tag` VALUES ('115', '1', '10', '125', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;领带', '服饰鞋帽,配饰,领带', '125', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('116', '1', '10', '126', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;袖扣', '服饰鞋帽,配饰,袖扣', '126', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('117', '1', '10', '127', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;其他配件', '服饰鞋帽,配饰,其他配件', '127', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('118', '1', '10', '128', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;丝巾', '服饰鞋帽,配饰,丝巾', '128', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('119', '1', '10', '129', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;披肩', '服饰鞋帽,配饰,披肩', '129', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('120', '1', '10', '130', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;腰带', '服饰鞋帽,配饰,腰带', '130', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('121', '1', '10', '131', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;腰链／腰封', '服饰鞋帽,配饰,腰链／腰封', '131', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('122', '1', '10', '132', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;棒球帽', '服饰鞋帽,配饰,棒球帽', '132', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('123', '1', '10', '133', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;毛线', '服饰鞋帽,配饰,毛线', '133', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('124', '1', '10', '134', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;遮阳帽', '服饰鞋帽,配饰,遮阳帽', '134', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('125', '1', '10', '135', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;防紫外线手套', '服饰鞋帽,配饰,防紫外线手套', '135', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('126', '1', '10', '136', '服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;草帽', '服饰鞋帽,配饰,草帽', '136', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('127', '1', '11', '137', '服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;套装', '服饰鞋帽,童装,套装', '137', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('128', '1', '11', '138', '服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;上衣', '服饰鞋帽,童装,上衣', '138', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('129', '1', '11', '139', '服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;裤子', '服饰鞋帽,童装,裤子', '139', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('130', '1', '11', '140', '服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;裙子', '服饰鞋帽,童装,裙子', '140', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('131', '1', '11', '141', '服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;内衣／家居服', '服饰鞋帽,童装,内衣／家居服', '141', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('132', '1', '11', '142', '服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;羽绒服／棉服', '服饰鞋帽,童装,羽绒服／棉服', '142', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('133', '1', '11', '143', '服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;亲子装', '服饰鞋帽,童装,亲子装', '143', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('134', '1', '11', '144', '服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;儿童配饰', '服饰鞋帽,童装,儿童配饰', '144', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('135', '1', '11', '145', '服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;礼服／演出服', '服饰鞋帽,童装,礼服／演出服', '145', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('136', '1', '11', '146', '服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;运动鞋', '服饰鞋帽,童装,运动鞋', '146', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('137', '1', '11', '147', '服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;单鞋', '服饰鞋帽,童装,单鞋', '147', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('138', '1', '11', '148', '服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;靴子', '服饰鞋帽,童装,靴子', '148', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('139', '1', '11', '149', '服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;凉鞋', '服饰鞋帽,童装,凉鞋', '149', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('140', '1', '11', '150', '服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;功能鞋', '服饰鞋帽,童装,功能鞋', '150', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('219', '2', '155', '184', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;奢侈品箱包', '礼品箱包,奢侈品,奢侈品箱包', '184', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('220', '2', '155', '185', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;钱包', '礼品箱包,奢侈品,钱包', '185', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('221', '2', '155', '186', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;服饰', '礼品箱包,奢侈品,服饰', '186', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('222', '2', '155', '187', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;腰带', '礼品箱包,奢侈品,腰带', '187', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('223', '2', '155', '188', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;太阳镜眼镜', '礼品箱包,奢侈品,太阳镜眼镜', '188', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('224', '2', '155', '189', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;配件', '礼品箱包,奢侈品,配件', '189', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('225', '2', '155', '190', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;GUCCI', '礼品箱包,奢侈品,GUCCI', '190', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('226', '2', '155', '191', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;PRADA', '礼品箱包,奢侈品,PRADA', '191', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('227', '2', '155', '192', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;FENDI', '礼品箱包,奢侈品,FENDI', '192', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('228', '2', '155', '193', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;BURBERRY', '礼品箱包,奢侈品,BURBERRY', '193', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('229', '2', '155', '194', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;MONTBLANC', '礼品箱包,奢侈品,MONTBLANC', '194', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('230', '2', '155', '195', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;ARMANI', '礼品箱包,奢侈品,ARMANI', '195', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('231', '2', '155', '196', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;RIMOWA', '礼品箱包,奢侈品,RIMOWA', '196', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('232', '2', '155', '197', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;RAY-BAN', '礼品箱包,奢侈品,RAY-BAN', '197', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('233', '2', '155', '198', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;COACH', '礼品箱包,奢侈品,COACH', '198', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('234', '2', '155', '199', '礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;更多品牌', '礼品箱包,奢侈品,更多品牌', '199', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('235', '256', '1034', '1035', '数码办公&nbsp;&gt;&nbsp;手机通讯&nbsp;&gt;&nbsp;手机', '数码办公,手机通讯,手机', '1035', '41');
INSERT INTO `tr_goods_class_tag` VALUES ('236', '256', '1034', '1036', '数码办公&nbsp;&gt;&nbsp;手机通讯&nbsp;&gt;&nbsp;对讲机', '数码办公,手机通讯,对讲机', '1036', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('267', '256', '261', '294', '数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;MP3/MP4', '数码办公,时尚影音,MP3/MP4', '294', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('268', '256', '261', '295', '数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;智能设备', '数码办公,时尚影音,智能设备', '295', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('269', '256', '261', '296', '数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;耳机/耳麦', '数码办公,时尚影音,耳机/耳麦', '296', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('270', '256', '261', '297', '数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;音箱', '数码办公,时尚影音,音箱', '297', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('271', '256', '261', '298', '数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;高清播放器', '数码办公,时尚影音,高清播放器', '298', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('272', '256', '261', '299', '数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;电子书', '数码办公,时尚影音,电子书', '299', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('273', '256', '261', '300', '数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;电子词典', '数码办公,时尚影音,电子词典', '300', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('274', '256', '261', '301', '数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;MP3/MP4配件', '数码办公,时尚影音,MP3/MP4配件', '301', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('275', '256', '261', '302', '数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;录音笔', '数码办公,时尚影音,录音笔', '302', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('276', '256', '261', '303', '数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;麦克风', '数码办公,时尚影音,麦克风', '303', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('277', '256', '261', '304', '数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;专业音频', '数码办公,时尚影音,专业音频', '304', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('278', '256', '261', '305', '数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;电子教育', '数码办公,时尚影音,电子教育', '305', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('279', '256', '261', '306', '数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;数码相框', '数码办公,时尚影音,数码相框', '306', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('280', '256', '261', '307', '数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;苹果配件', '数码办公,时尚影音,苹果配件', '307', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('281', '256', '390', '398', '数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;笔记本', '数码办公,电脑整机,笔记本', '398', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('282', '256', '390', '399', '数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;超极本', '数码办公,电脑整机,超极本', '399', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('283', '256', '390', '400', '数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;游戏本', '数码办公,电脑整机,游戏本', '400', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('284', '256', '390', '401', '数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;平板电脑', '数码办公,电脑整机,平板电脑', '401', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('285', '256', '390', '402', '数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;平板电脑配件', '数码办公,电脑整机,平板电脑配件', '402', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('286', '256', '390', '403', '数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;台式机', '数码办公,电脑整机,台式机', '403', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('287', '256', '390', '404', '数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;服务器', '数码办公,电脑整机,服务器', '404', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('288', '256', '390', '405', '数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;笔记本配件', '数码办公,电脑整机,笔记本配件', '405', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('289', '256', '391', '406', '数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;CPU', '数码办公,电脑配件,CPU', '406', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('290', '256', '391', '407', '数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;主板', '数码办公,电脑配件,主板', '407', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('291', '256', '391', '408', '数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;显卡', '数码办公,电脑配件,显卡', '408', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('292', '256', '391', '409', '数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;硬盘', '数码办公,电脑配件,硬盘', '409', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('293', '256', '391', '410', '数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;SSD固态硬盘', '数码办公,电脑配件,SSD固态硬盘', '410', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('294', '256', '391', '411', '数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;内存', '数码办公,电脑配件,内存', '411', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('295', '256', '391', '412', '数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;机箱', '数码办公,电脑配件,机箱', '412', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('296', '256', '391', '413', '数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;电源', '数码办公,电脑配件,电源', '413', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('297', '256', '391', '414', '数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;显示器', '数码办公,电脑配件,显示器', '414', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('298', '256', '391', '415', '数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;刻录机/光驱', '数码办公,电脑配件,刻录机/光驱', '415', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('299', '256', '391', '416', '数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;散热器', '数码办公,电脑配件,散热器', '416', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('300', '256', '391', '417', '数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;声卡/扩展卡', '数码办公,电脑配件,声卡/扩展卡', '417', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('301', '256', '391', '418', '数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;装机配件', '数码办公,电脑配件,装机配件', '418', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('302', '256', '392', '419', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;鼠标', '数码办公,外设产品,鼠标', '419', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('303', '256', '392', '420', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;键盘', '数码办公,外设产品,键盘', '420', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('304', '256', '392', '421', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;移动硬盘', '数码办公,外设产品,移动硬盘', '421', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('305', '256', '392', '422', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;U盘', '数码办公,外设产品,U盘', '422', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('306', '256', '392', '423', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;摄像头', '数码办公,外设产品,摄像头', '423', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('307', '256', '392', '424', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;外置盒', '数码办公,外设产品,外置盒', '424', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('308', '256', '392', '425', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;游戏设备', '数码办公,外设产品,游戏设备', '425', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('309', '256', '392', '426', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;电视盒', '数码办公,外设产品,电视盒', '426', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('310', '256', '392', '427', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;手写板', '数码办公,外设产品,手写板', '427', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('311', '256', '392', '428', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;鼠标垫', '数码办公,外设产品,鼠标垫', '428', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('312', '256', '392', '429', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;插座', '数码办公,外设产品,插座', '429', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('313', '256', '392', '430', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;UPS电源', '数码办公,外设产品,UPS电源', '430', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('314', '256', '392', '431', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;线缆', '数码办公,外设产品,线缆', '431', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('315', '256', '392', '432', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;电脑工具', '数码办公,外设产品,电脑工具', '432', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('316', '256', '392', '433', '数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;电脑清洁', '数码办公,外设产品,电脑清洁', '433', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('317', '256', '393', '434', '数码办公&nbsp;&gt;&nbsp;网络产品&nbsp;&gt;&nbsp;路由器', '数码办公,网络产品,路由器', '434', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('318', '256', '393', '435', '数码办公&nbsp;&gt;&nbsp;网络产品&nbsp;&gt;&nbsp;网卡', '数码办公,网络产品,网卡', '435', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('319', '256', '393', '436', '数码办公&nbsp;&gt;&nbsp;网络产品&nbsp;&gt;&nbsp;交换机', '数码办公,网络产品,交换机', '436', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('320', '256', '393', '437', '数码办公&nbsp;&gt;&nbsp;网络产品&nbsp;&gt;&nbsp;网络存储', '数码办公,网络产品,网络存储', '437', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('321', '256', '393', '438', '数码办公&nbsp;&gt;&nbsp;网络产品&nbsp;&gt;&nbsp;3G上网', '数码办公,网络产品,3G上网', '438', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('322', '256', '393', '439', '数码办公&nbsp;&gt;&nbsp;网络产品&nbsp;&gt;&nbsp;网络盒子', '数码办公,网络产品,网络盒子', '439', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('323', '256', '394', '440', '数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;打印机', '数码办公,办公打印,打印机', '440', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('324', '256', '394', '441', '数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;一体机', '数码办公,办公打印,一体机', '441', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('325', '256', '394', '442', '数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;投影机', '数码办公,办公打印,投影机', '442', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('326', '256', '394', '443', '数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;投影配件', '数码办公,办公打印,投影配件', '443', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('327', '256', '394', '444', '数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;传真机', '数码办公,办公打印,传真机', '444', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('328', '256', '394', '445', '数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;复合机', '数码办公,办公打印,复合机', '445', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('329', '256', '394', '446', '数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;碎纸机', '数码办公,办公打印,碎纸机', '446', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('330', '256', '394', '447', '数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;扫描仪', '数码办公,办公打印,扫描仪', '447', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('331', '256', '394', '448', '数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;墨盒', '数码办公,办公打印,墨盒', '448', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('332', '256', '394', '449', '数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;硒鼓', '数码办公,办公打印,硒鼓', '449', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('333', '256', '394', '450', '数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;墨粉', '数码办公,办公打印,墨粉', '450', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('334', '256', '394', '451', '数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;色带', '数码办公,办公打印,色带', '451', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('335', '256', '395', '452', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;办公文具', '数码办公,办公文仪,办公文具', '452', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('336', '256', '395', '453', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;文件管理', '数码办公,办公文仪,文件管理', '453', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('337', '256', '395', '454', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;笔类', '数码办公,办公文仪,笔类', '454', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('338', '256', '395', '455', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;纸类', '数码办公,办公文仪,纸类', '455', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('339', '256', '395', '456', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;本册/便签', '数码办公,办公文仪,本册/便签', '456', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('340', '256', '395', '457', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;学生文具', '数码办公,办公文仪,学生文具', '457', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('341', '256', '395', '458', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;财务用品', '数码办公,办公文仪,财务用品', '458', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('342', '256', '395', '459', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;计算器', '数码办公,办公文仪,计算器', '459', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('343', '256', '395', '460', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;激光笔', '数码办公,办公文仪,激光笔', '460', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('344', '256', '395', '461', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;白板/封装', '数码办公,办公文仪,白板/封装', '461', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('345', '256', '395', '462', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;考勤机', '数码办公,办公文仪,考勤机', '462', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('346', '256', '395', '463', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;刻录碟片/附件', '数码办公,办公文仪,刻录碟片/附件', '463', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('347', '256', '395', '464', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;点钞机', '数码办公,办公文仪,点钞机', '464', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('348', '256', '395', '465', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;支付设备/POS机', '数码办公,办公文仪,支付设备/POS机', '465', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('349', '256', '395', '466', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;安防监控', '数码办公,办公文仪,安防监控', '466', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('350', '256', '395', '467', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;呼叫/会议设备', '数码办公,办公文仪,呼叫/会议设备', '467', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('351', '256', '395', '468', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;保险柜', '数码办公,办公文仪,保险柜', '468', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('352', '256', '395', '469', '数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;办公家具', '数码办公,办公文仪,办公家具', '469', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('397', '308', '312', '358', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;剃须刀', '家用电器,个护健康,剃须刀', '358', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('398', '308', '312', '359', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;剃/脱毛器', '家用电器,个护健康,剃/脱毛器', '359', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('399', '308', '312', '360', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;口腔护理', '家用电器,个护健康,口腔护理', '360', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('400', '308', '312', '361', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;电吹风', '家用电器,个护健康,电吹风', '361', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('401', '308', '312', '362', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;美容器', '家用电器,个护健康,美容器', '362', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('402', '308', '312', '363', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;美发器', '家用电器,个护健康,美发器', '363', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('403', '308', '312', '364', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;按摩椅', '家用电器,个护健康,按摩椅', '364', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('404', '308', '312', '365', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;按摩器', '家用电器,个护健康,按摩器', '365', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('405', '308', '312', '366', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;足浴盆', '家用电器,个护健康,足浴盆', '366', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('406', '308', '312', '367', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;血压计', '家用电器,个护健康,血压计', '367', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('407', '308', '312', '368', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;健康秤/厨房秤', '家用电器,个护健康,健康秤/厨房秤', '368', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('408', '308', '312', '369', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;血糖仪', '家用电器,个护健康,血糖仪', '369', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('409', '308', '312', '370', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;体温计', '家用电器,个护健康,体温计', '370', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('410', '308', '312', '371', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;计步器/脂肪检测仪', '家用电器,个护健康,计步器/脂肪检测仪', '371', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('411', '308', '312', '372', '家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;其它健康电器', '家用电器,个护健康,其它健康电器', '372', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('412', '308', '313', '373', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;电动工具', '家用电器,五金家装,电动工具', '373', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('413', '308', '313', '374', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;手动工具', '家用电器,五金家装,手动工具', '374', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('414', '308', '313', '375', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;仪器仪表', '家用电器,五金家装,仪器仪表', '375', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('415', '308', '313', '376', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;浴霸/排气扇', '家用电器,五金家装,浴霸/排气扇', '376', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('416', '308', '313', '377', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;灯具', '家用电器,五金家装,灯具', '377', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('417', '308', '313', '378', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;LED灯', '家用电器,五金家装,LED灯', '378', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('418', '308', '313', '379', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;洁身器', '家用电器,五金家装,洁身器', '379', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('419', '308', '313', '380', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;水槽', '家用电器,五金家装,水槽', '380', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('420', '308', '313', '381', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;龙头', '家用电器,五金家装,龙头', '381', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('421', '308', '313', '382', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;淋浴花洒', '家用电器,五金家装,淋浴花洒', '382', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('422', '308', '313', '383', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;厨卫五金', '家用电器,五金家装,厨卫五金', '383', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('423', '308', '313', '384', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;家具五金', '家用电器,五金家装,家具五金', '384', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('424', '308', '313', '385', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;门铃', '家用电器,五金家装,门铃', '385', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('425', '308', '313', '386', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;电气开关', '家用电器,五金家装,电气开关', '386', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('426', '308', '313', '387', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;插座', '家用电器,五金家装,插座', '387', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('427', '308', '313', '388', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;电工电料', '家用电器,五金家装,电工电料', '388', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('428', '308', '313', '389', '家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;监控安防', '家用电器,五金家装,监控安防', '389', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('453', '470', '474', '502', '个护化妆&nbsp;&gt;&nbsp;女性护理&nbsp;&gt;&nbsp;卫生巾', '个护化妆,女性护理,卫生巾', '502', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('454', '470', '474', '503', '个护化妆&nbsp;&gt;&nbsp;女性护理&nbsp;&gt;&nbsp;卫生护垫', '个护化妆,女性护理,卫生护垫', '503', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('455', '470', '474', '504', '个护化妆&nbsp;&gt;&nbsp;女性护理&nbsp;&gt;&nbsp;洗液', '个护化妆,女性护理,洗液', '504', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('456', '470', '474', '505', '个护化妆&nbsp;&gt;&nbsp;女性护理&nbsp;&gt;&nbsp;美容食品', '个护化妆,女性护理,美容食品', '505', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('457', '470', '474', '506', '个护化妆&nbsp;&gt;&nbsp;女性护理&nbsp;&gt;&nbsp;其他', '个护化妆,女性护理,其他', '506', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('458', '470', '475', '507', '个护化妆&nbsp;&gt;&nbsp;男士护理&nbsp;&gt;&nbsp;脸部护理', '个护化妆,男士护理,脸部护理', '507', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('459', '470', '475', '508', '个护化妆&nbsp;&gt;&nbsp;男士护理&nbsp;&gt;&nbsp;眼部护理', '个护化妆,男士护理,眼部护理', '508', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('460', '470', '475', '509', '个护化妆&nbsp;&gt;&nbsp;男士护理&nbsp;&gt;&nbsp;身体护理', '个护化妆,男士护理,身体护理', '509', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('461', '470', '475', '510', '个护化妆&nbsp;&gt;&nbsp;男士护理&nbsp;&gt;&nbsp;男士香水', '个护化妆,男士护理,男士香水', '510', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('462', '470', '475', '511', '个护化妆&nbsp;&gt;&nbsp;男士护理&nbsp;&gt;&nbsp;剃须护理', '个护化妆,男士护理,剃须护理', '511', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('463', '470', '475', '512', '个护化妆&nbsp;&gt;&nbsp;男士护理&nbsp;&gt;&nbsp;防脱洗护', '个护化妆,男士护理,防脱洗护', '512', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('464', '470', '475', '513', '个护化妆&nbsp;&gt;&nbsp;男士护理&nbsp;&gt;&nbsp;男士唇膏', '个护化妆,男士护理,男士唇膏', '513', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('465', '470', '476', '514', '个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;粉底/遮瑕', '个护化妆,魅力彩妆,粉底/遮瑕', '514', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('466', '470', '476', '515', '个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;腮红', '个护化妆,魅力彩妆,腮红', '515', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('467', '470', '476', '516', '个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;眼影/眼线', '个护化妆,魅力彩妆,眼影/眼线', '516', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('468', '470', '476', '517', '个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;眉笔', '个护化妆,魅力彩妆,眉笔', '517', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('469', '470', '476', '518', '个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;睫毛膏', '个护化妆,魅力彩妆,睫毛膏', '518', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('470', '470', '476', '519', '个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;唇膏唇彩', '个护化妆,魅力彩妆,唇膏唇彩', '519', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('471', '470', '476', '520', '个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;彩妆组合', '个护化妆,魅力彩妆,彩妆组合', '520', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('472', '470', '476', '521', '个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;卸妆', '个护化妆,魅力彩妆,卸妆', '521', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('473', '470', '476', '522', '个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;美甲', '个护化妆,魅力彩妆,美甲', '522', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('474', '470', '476', '523', '个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;彩妆工具', '个护化妆,魅力彩妆,彩妆工具', '523', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('475', '470', '476', '524', '个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;假发', '个护化妆,魅力彩妆,假发', '524', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('476', '470', '477', '525', '个护化妆&nbsp;&gt;&nbsp;香水SPA&nbsp;&gt;&nbsp;女士香水', '个护化妆,香水SPA,女士香水', '525', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('477', '470', '477', '526', '个护化妆&nbsp;&gt;&nbsp;香水SPA&nbsp;&gt;&nbsp;男士香水', '个护化妆,香水SPA,男士香水', '526', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('478', '470', '477', '527', '个护化妆&nbsp;&gt;&nbsp;香水SPA&nbsp;&gt;&nbsp;组合套装', '个护化妆,香水SPA,组合套装', '527', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('479', '470', '477', '528', '个护化妆&nbsp;&gt;&nbsp;香水SPA&nbsp;&gt;&nbsp;迷你香水', '个护化妆,香水SPA,迷你香水', '528', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('480', '470', '477', '529', '个护化妆&nbsp;&gt;&nbsp;香水SPA&nbsp;&gt;&nbsp;香体走珠', '个护化妆,香水SPA,香体走珠', '529', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('481', '662', '663', '671', '运动健康&nbsp;&gt;&nbsp;户外鞋服&nbsp;&gt;&nbsp;户外服装', '运动健康,户外鞋服,户外服装', '671', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('482', '662', '663', '672', '运动健康&nbsp;&gt;&nbsp;户外鞋服&nbsp;&gt;&nbsp;户外鞋袜', '运动健康,户外鞋服,户外鞋袜', '672', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('483', '662', '663', '673', '运动健康&nbsp;&gt;&nbsp;户外鞋服&nbsp;&gt;&nbsp;户外配饰', '运动健康,户外鞋服,户外配饰', '673', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('484', '662', '664', '674', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;帐篷', '运动健康,户外装备,帐篷', '674', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('485', '662', '664', '675', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;睡袋', '运动健康,户外装备,睡袋', '675', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('486', '662', '664', '676', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;登山攀岩', '运动健康,户外装备,登山攀岩', '676', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('487', '662', '664', '677', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外背包', '运动健康,户外装备,户外背包', '677', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('488', '662', '664', '678', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外照明', '运动健康,户外装备,户外照明', '678', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('489', '662', '664', '679', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外垫子', '运动健康,户外装备,户外垫子', '679', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('490', '662', '664', '680', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外仪表', '运动健康,户外装备,户外仪表', '680', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('491', '662', '664', '681', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外工具', '运动健康,户外装备,户外工具', '681', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('492', '662', '664', '682', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;望远镜', '运动健康,户外装备,望远镜', '682', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('493', '662', '664', '683', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;垂钓用品', '运动健康,户外装备,垂钓用品', '683', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('494', '662', '664', '684', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;旅游用品', '运动健康,户外装备,旅游用品', '684', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('495', '662', '664', '685', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;便携桌椅床', '运动健康,户外装备,便携桌椅床', '685', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('496', '662', '664', '686', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;烧烤用品', '运动健康,户外装备,烧烤用品', '686', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('497', '662', '664', '687', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;野餐炊具', '运动健康,户外装备,野餐炊具', '687', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('498', '662', '664', '688', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;军迷用品', '运动健康,户外装备,军迷用品', '688', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('499', '662', '664', '689', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;游泳用具', '运动健康,户外装备,游泳用具', '689', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('500', '662', '664', '690', '运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;泳衣', '运动健康,户外装备,泳衣', '690', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('501', '662', '665', '691', '运动健康&nbsp;&gt;&nbsp;运动器械&nbsp;&gt;&nbsp;健身器械', '运动健康,运动器械,健身器械', '691', '40');
INSERT INTO `tr_goods_class_tag` VALUES ('502', '662', '665', '692', '运动健康&nbsp;&gt;&nbsp;运动器械&nbsp;&gt;&nbsp;运动器材', '运动健康,运动器械,运动器材', '692', '43');
INSERT INTO `tr_goods_class_tag` VALUES ('503', '662', '665', '693', '运动健康&nbsp;&gt;&nbsp;运动器械&nbsp;&gt;&nbsp;极限轮滑', '运动健康,运动器械,极限轮滑', '693', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('504', '662', '665', '694', '运动健康&nbsp;&gt;&nbsp;运动器械&nbsp;&gt;&nbsp;骑行运动', '运动健康,运动器械,骑行运动', '694', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('505', '662', '665', '695', '运动健康&nbsp;&gt;&nbsp;运动器械&nbsp;&gt;&nbsp;运动护具', '运动健康,运动器械,运动护具', '695', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('506', '662', '665', '696', '运动健康&nbsp;&gt;&nbsp;运动器械&nbsp;&gt;&nbsp;武术搏击', '运动健康,运动器械,武术搏击', '696', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('507', '662', '666', '697', '运动健康&nbsp;&gt;&nbsp;纤体瑜伽&nbsp;&gt;&nbsp;瑜伽垫', '运动健康,纤体瑜伽,瑜伽垫', '697', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('508', '662', '666', '698', '运动健康&nbsp;&gt;&nbsp;纤体瑜伽&nbsp;&gt;&nbsp;瑜伽服', '运动健康,纤体瑜伽,瑜伽服', '698', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('509', '662', '666', '699', '运动健康&nbsp;&gt;&nbsp;纤体瑜伽&nbsp;&gt;&nbsp;瑜伽配件', '运动健康,纤体瑜伽,瑜伽配件', '699', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('510', '662', '666', '700', '运动健康&nbsp;&gt;&nbsp;纤体瑜伽&nbsp;&gt;&nbsp;瑜伽套装', '运动健康,纤体瑜伽,瑜伽套装', '700', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('511', '662', '666', '701', '运动健康&nbsp;&gt;&nbsp;纤体瑜伽&nbsp;&gt;&nbsp;舞蹈鞋服', '运动健康,纤体瑜伽,舞蹈鞋服', '701', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('512', '662', '667', '702', '运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;羽毛球', '运动健康,体育娱乐,羽毛球', '702', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('513', '662', '667', '703', '运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;乒乓球', '运动健康,体育娱乐,乒乓球', '703', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('514', '662', '667', '704', '运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;篮球', '运动健康,体育娱乐,篮球', '704', '45');
INSERT INTO `tr_goods_class_tag` VALUES ('515', '662', '667', '705', '运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;足球', '运动健康,体育娱乐,足球', '705', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('516', '662', '667', '706', '运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;网球', '运动健康,体育娱乐,网球', '706', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('517', '662', '667', '707', '运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;排球', '运动健康,体育娱乐,排球', '707', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('518', '662', '667', '708', '运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;高尔夫球', '运动健康,体育娱乐,高尔夫球', '708', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('519', '662', '667', '709', '运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;棋牌麻将', '运动健康,体育娱乐,棋牌麻将', '709', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('520', '662', '667', '710', '运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;其他', '运动健康,体育娱乐,其他', '710', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('521', '662', '668', '711', '运动健康&nbsp;&gt;&nbsp;成人用品&nbsp;&gt;&nbsp;安全避孕', '运动健康,成人用品,安全避孕', '711', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('522', '662', '668', '712', '运动健康&nbsp;&gt;&nbsp;成人用品&nbsp;&gt;&nbsp;验孕测孕', '运动健康,成人用品,验孕测孕', '712', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('523', '662', '668', '713', '运动健康&nbsp;&gt;&nbsp;成人用品&nbsp;&gt;&nbsp;人体润滑', '运动健康,成人用品,人体润滑', '713', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('524', '662', '668', '714', '运动健康&nbsp;&gt;&nbsp;成人用品&nbsp;&gt;&nbsp;情爱玩具', '运动健康,成人用品,情爱玩具', '714', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('525', '662', '668', '715', '运动健康&nbsp;&gt;&nbsp;成人用品&nbsp;&gt;&nbsp;情趣内衣', '运动健康,成人用品,情趣内衣', '715', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('526', '662', '668', '716', '运动健康&nbsp;&gt;&nbsp;成人用品&nbsp;&gt;&nbsp;组合套装', '运动健康,成人用品,组合套装', '716', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('527', '662', '669', '717', '运动健康&nbsp;&gt;&nbsp;保健器械&nbsp;&gt;&nbsp;养生器械', '运动健康,保健器械,养生器械', '717', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('528', '662', '669', '718', '运动健康&nbsp;&gt;&nbsp;保健器械&nbsp;&gt;&nbsp;保健用品', '运动健康,保健器械,保健用品', '718', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('529', '662', '669', '719', '运动健康&nbsp;&gt;&nbsp;保健器械&nbsp;&gt;&nbsp;康复辅助', '运动健康,保健器械,康复辅助', '719', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('530', '662', '669', '720', '运动健康&nbsp;&gt;&nbsp;保健器械&nbsp;&gt;&nbsp;家庭护理', '运动健康,保健器械,家庭护理', '720', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('531', '662', '670', '721', '运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;跌打损伤', '运动健康,急救卫生,跌打损伤', '721', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('532', '662', '670', '722', '运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;烫伤止痒', '运动健康,急救卫生,烫伤止痒', '722', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('533', '662', '670', '723', '运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;防裂抗冻', '运动健康,急救卫生,防裂抗冻', '723', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('534', '662', '670', '724', '运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;口腔咽部', '运动健康,急救卫生,口腔咽部', '724', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('535', '662', '670', '725', '运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;眼部保健', '运动健康,急救卫生,眼部保健', '725', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('536', '662', '670', '726', '运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;鼻炎健康', '运动健康,急救卫生,鼻炎健康', '726', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('537', '662', '670', '727', '运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;风湿骨痛', '运动健康,急救卫生,风湿骨痛', '727', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('538', '662', '670', '728', '运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;生殖泌尿', '运动健康,急救卫生,生殖泌尿', '728', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('539', '662', '670', '729', '运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;美体塑身', '运动健康,急救卫生,美体塑身', '729', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('598', '3', '200', '206', '家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;床品件套', '家居家装,家纺,床品件套', '206', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('599', '3', '200', '207', '家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;被子', '家居家装,家纺,被子', '207', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('600', '3', '200', '208', '家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;枕芯枕套', '家居家装,家纺,枕芯枕套', '208', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('601', '3', '200', '209', '家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;床单被罩', '家居家装,家纺,床单被罩', '209', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('602', '3', '200', '210', '家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;毛巾被/毯', '家居家装,家纺,毛巾被/毯', '210', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('603', '3', '200', '211', '家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;床垫/床褥', '家居家装,家纺,床垫/床褥', '211', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('604', '3', '200', '212', '家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;蚊帐/凉席', '家居家装,家纺,蚊帐/凉席', '212', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('605', '3', '200', '213', '家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;抱枕坐垫', '家居家装,家纺,抱枕坐垫', '213', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('606', '3', '200', '214', '家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;毛巾家纺', '家居家装,家纺,毛巾家纺', '214', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('607', '3', '200', '215', '家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;电热毯', '家居家装,家纺,电热毯', '215', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('608', '3', '200', '216', '家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;窗帘/窗纱', '家居家装,家纺,窗帘/窗纱', '216', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('609', '3', '200', '217', '家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;酒店用品', '家居家装,家纺,酒店用品', '217', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('610', '3', '201', '218', '家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;台灯', '家居家装,灯具,台灯', '218', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('611', '3', '201', '219', '家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;节能灯', '家居家装,灯具,节能灯', '219', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('612', '3', '201', '220', '家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;装饰灯', '家居家装,灯具,装饰灯', '220', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('613', '3', '201', '221', '家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;落地灯', '家居家装,灯具,落地灯', '221', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('614', '3', '201', '222', '家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;应急灯/手电', '家居家装,灯具,应急灯/手电', '222', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('615', '3', '201', '223', '家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;LED灯', '家居家装,灯具,LED灯', '223', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('616', '3', '201', '224', '家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;吸顶灯', '家居家装,灯具,吸顶灯', '224', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('617', '3', '201', '225', '家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;五金电器', '家居家装,灯具,五金电器', '225', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('618', '3', '201', '226', '家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;吊灯', '家居家装,灯具,吊灯', '226', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('619', '3', '201', '227', '家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;氛围照明', '家居家装,灯具,氛围照明', '227', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('620', '3', '202', '228', '家居家装&nbsp;&gt;&nbsp;生活日用&nbsp;&gt;&nbsp;收纳用品', '家居家装,生活日用,收纳用品', '228', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('621', '3', '202', '229', '家居家装&nbsp;&gt;&nbsp;生活日用&nbsp;&gt;&nbsp;雨伞雨具', '家居家装,生活日用,雨伞雨具', '229', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('622', '3', '202', '230', '家居家装&nbsp;&gt;&nbsp;生活日用&nbsp;&gt;&nbsp;浴室用品', '家居家装,生活日用,浴室用品', '230', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('623', '3', '202', '231', '家居家装&nbsp;&gt;&nbsp;生活日用&nbsp;&gt;&nbsp;缝纫用品', '家居家装,生活日用,缝纫用品', '231', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('624', '3', '202', '232', '家居家装&nbsp;&gt;&nbsp;生活日用&nbsp;&gt;&nbsp;洗晒用品', '家居家装,生活日用,洗晒用品', '232', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('625', '3', '202', '233', '家居家装&nbsp;&gt;&nbsp;生活日用&nbsp;&gt;&nbsp;净化除味', '家居家装,生活日用,净化除味', '233', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('626', '3', '203', '234', '家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;桌布/罩件', '家居家装,家装软饰,桌布/罩件', '234', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('627', '3', '203', '235', '家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;地毯地垫', '家居家装,家装软饰,地毯地垫', '235', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('628', '3', '203', '236', '家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;沙发垫套', '家居家装,家装软饰,沙发垫套', '236', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('629', '3', '203', '237', '家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;相框/相片墙', '家居家装,家装软饰,相框/相片墙', '237', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('630', '3', '203', '238', '家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;墙画墙贴', '家居家装,家装软饰,墙画墙贴', '238', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('631', '3', '203', '239', '家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;节庆饰品', '家居家装,家装软饰,节庆饰品', '239', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('632', '3', '203', '240', '家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;手工/十字绣', '家居家装,家装软饰,手工/十字绣', '240', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('633', '3', '203', '241', '家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;工艺摆件', '家居家装,家装软饰,工艺摆件', '241', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('634', '3', '203', '242', '家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;其他', '家居家装,家装软饰,其他', '242', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('635', '3', '204', '243', '家居家装&nbsp;&gt;&nbsp;清洁日用&nbsp;&gt;&nbsp;纸品湿巾', '家居家装,清洁日用,纸品湿巾', '243', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('636', '3', '204', '244', '家居家装&nbsp;&gt;&nbsp;清洁日用&nbsp;&gt;&nbsp;衣物清洁', '家居家装,清洁日用,衣物清洁', '244', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('637', '3', '204', '245', '家居家装&nbsp;&gt;&nbsp;清洁日用&nbsp;&gt;&nbsp;清洁工具', '家居家装,清洁日用,清洁工具', '245', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('638', '3', '204', '246', '家居家装&nbsp;&gt;&nbsp;清洁日用&nbsp;&gt;&nbsp;驱虫用品', '家居家装,清洁日用,驱虫用品', '246', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('639', '3', '204', '247', '家居家装&nbsp;&gt;&nbsp;清洁日用&nbsp;&gt;&nbsp;居室清洁', '家居家装,清洁日用,居室清洁', '247', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('640', '3', '204', '248', '家居家装&nbsp;&gt;&nbsp;清洁日用&nbsp;&gt;&nbsp;皮具护理', '家居家装,清洁日用,皮具护理', '248', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('641', '3', '205', '249', '家居家装&nbsp;&gt;&nbsp;宠物生活&nbsp;&gt;&nbsp;宠物主粮', '家居家装,宠物生活,宠物主粮', '249', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('642', '3', '205', '250', '家居家装&nbsp;&gt;&nbsp;宠物生活&nbsp;&gt;&nbsp;宠物零食', '家居家装,宠物生活,宠物零食', '250', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('643', '3', '205', '251', '家居家装&nbsp;&gt;&nbsp;宠物生活&nbsp;&gt;&nbsp;营养品', '家居家装,宠物生活,营养品', '251', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('644', '3', '205', '252', '家居家装&nbsp;&gt;&nbsp;宠物生活&nbsp;&gt;&nbsp;家居日用', '家居家装,宠物生活,家居日用', '252', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('645', '3', '205', '253', '家居家装&nbsp;&gt;&nbsp;宠物生活&nbsp;&gt;&nbsp;玩具服饰', '家居家装,宠物生活,玩具服饰', '253', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('646', '3', '205', '254', '家居家装&nbsp;&gt;&nbsp;宠物生活&nbsp;&gt;&nbsp;出行装备', '家居家装,宠物生活,出行装备', '254', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('647', '3', '205', '255', '家居家装&nbsp;&gt;&nbsp;宠物生活&nbsp;&gt;&nbsp;医护美容', '家居家装,宠物生活,医护美容', '255', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('648', '730', '731', '738', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;便携GPS导航', '汽车用品,电子电器,便携GPS导航', '738', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('649', '730', '731', '739', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;嵌入式导航', '汽车用品,电子电器,嵌入式导航', '739', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('650', '730', '731', '740', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;安全预警仪', '汽车用品,电子电器,安全预警仪', '740', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('651', '730', '731', '741', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;行车记录仪', '汽车用品,电子电器,行车记录仪', '741', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('652', '730', '731', '742', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;跟踪防盗器', '汽车用品,电子电器,跟踪防盗器', '742', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('653', '730', '731', '743', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;倒车雷达', '汽车用品,电子电器,倒车雷达', '743', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('654', '730', '731', '744', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;车载电源', '汽车用品,电子电器,车载电源', '744', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('655', '730', '731', '745', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;车载蓝牙', '汽车用品,电子电器,车载蓝牙', '745', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('656', '730', '731', '746', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;车载影音', '汽车用品,电子电器,车载影音', '746', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('657', '730', '731', '747', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;车载净化器', '汽车用品,电子电器,车载净化器', '747', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('658', '730', '731', '748', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;车载冰箱', '汽车用品,电子电器,车载冰箱', '748', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('659', '730', '731', '749', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;车载吸尘器', '汽车用品,电子电器,车载吸尘器', '749', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('660', '730', '731', '750', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;充气泵', '汽车用品,电子电器,充气泵', '750', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('661', '730', '731', '751', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;胎压监测', '汽车用品,电子电器,胎压监测', '751', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('662', '730', '731', '752', '汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;车载生活电器', '汽车用品,电子电器,车载生活电器', '752', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('663', '730', '732', '753', '汽车用品&nbsp;&gt;&nbsp;系统养护&nbsp;&gt;&nbsp;机油', '汽车用品,系统养护,机油', '753', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('664', '730', '732', '754', '汽车用品&nbsp;&gt;&nbsp;系统养护&nbsp;&gt;&nbsp;添加剂', '汽车用品,系统养护,添加剂', '754', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('665', '730', '732', '755', '汽车用品&nbsp;&gt;&nbsp;系统养护&nbsp;&gt;&nbsp;防冻冷却液', '汽车用品,系统养护,防冻冷却液', '755', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('666', '730', '732', '756', '汽车用品&nbsp;&gt;&nbsp;系统养护&nbsp;&gt;&nbsp;附属油', '汽车用品,系统养护,附属油', '756', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('667', '730', '732', '757', '汽车用品&nbsp;&gt;&nbsp;系统养护&nbsp;&gt;&nbsp;底盘装甲', '汽车用品,系统养护,底盘装甲', '757', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('668', '730', '732', '758', '汽车用品&nbsp;&gt;&nbsp;系统养护&nbsp;&gt;&nbsp;空调清洗剂', '汽车用品,系统养护,空调清洗剂', '758', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('669', '730', '732', '759', '汽车用品&nbsp;&gt;&nbsp;系统养护&nbsp;&gt;&nbsp;金属养护', '汽车用品,系统养护,金属养护', '759', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('670', '730', '733', '760', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;雨刷', '汽车用品,改装配件,雨刷', '760', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('671', '730', '733', '761', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;车灯', '汽车用品,改装配件,车灯', '761', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('672', '730', '733', '762', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;轮胎', '汽车用品,改装配件,轮胎', '762', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('673', '730', '733', '763', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;贴膜', '汽车用品,改装配件,贴膜', '763', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('674', '730', '733', '764', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;装饰贴', '汽车用品,改装配件,装饰贴', '764', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('675', '730', '733', '765', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;后视镜', '汽车用品,改装配件,后视镜', '765', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('676', '730', '733', '766', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;机油滤', '汽车用品,改装配件,机油滤', '766', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('677', '730', '733', '767', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;空气滤', '汽车用品,改装配件,空气滤', '767', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('678', '730', '733', '768', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;空调滤', '汽车用品,改装配件,空调滤', '768', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('679', '730', '733', '769', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;燃油滤', '汽车用品,改装配件,燃油滤', '769', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('680', '730', '733', '770', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;火花塞', '汽车用品,改装配件,火花塞', '770', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('681', '730', '733', '771', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;喇叭', '汽车用品,改装配件,喇叭', '771', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('682', '730', '733', '772', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;刹车片', '汽车用品,改装配件,刹车片', '772', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('683', '730', '733', '773', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;刹车盘', '汽车用品,改装配件,刹车盘', '773', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('684', '730', '733', '774', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;减震器', '汽车用品,改装配件,减震器', '774', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('685', '730', '733', '775', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;车身装饰', '汽车用品,改装配件,车身装饰', '775', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('686', '730', '733', '776', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;尾喉/排气管', '汽车用品,改装配件,尾喉/排气管', '776', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('687', '730', '733', '777', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;踏板', '汽车用品,改装配件,踏板', '777', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('688', '730', '733', '778', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;蓄电池', '汽车用品,改装配件,蓄电池', '778', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('689', '730', '733', '779', '汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;其他配件', '汽车用品,改装配件,其他配件', '779', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('690', '730', '734', '780', '汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;漆面美容', '汽车用品,汽车美容,漆面美容', '780', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('691', '730', '734', '781', '汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;漆面修复', '汽车用品,汽车美容,漆面修复', '781', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('692', '730', '734', '782', '汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;内饰清洁', '汽车用品,汽车美容,内饰清洁', '782', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('693', '730', '734', '783', '汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;玻璃美容', '汽车用品,汽车美容,玻璃美容', '783', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('694', '730', '734', '784', '汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;补漆笔', '汽车用品,汽车美容,补漆笔', '784', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('695', '730', '734', '785', '汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;轮胎轮毂清洗', '汽车用品,汽车美容,轮胎轮毂清洗', '785', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('696', '730', '734', '786', '汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;洗车器', '汽车用品,汽车美容,洗车器', '786', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('697', '730', '734', '787', '汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;洗车水枪', '汽车用品,汽车美容,洗车水枪', '787', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('698', '730', '734', '788', '汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;洗车配件', '汽车用品,汽车美容,洗车配件', '788', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('699', '730', '734', '789', '汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;洗车液', '汽车用品,汽车美容,洗车液', '789', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('700', '730', '734', '790', '汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;车掸', '汽车用品,汽车美容,车掸', '790', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('701', '730', '734', '791', '汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;擦车巾/海绵', '汽车用品,汽车美容,擦车巾/海绵', '791', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('702', '730', '735', '792', '汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;凉垫', '汽车用品,座垫脚垫,凉垫', '792', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('703', '730', '735', '793', '汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;四季垫', '汽车用品,座垫脚垫,四季垫', '793', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('704', '730', '735', '794', '汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;毛垫', '汽车用品,座垫脚垫,毛垫', '794', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('705', '730', '735', '795', '汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;专车专用座垫', '汽车用品,座垫脚垫,专车专用座垫', '795', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('706', '730', '735', '796', '汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;专车专用座套', '汽车用品,座垫脚垫,专车专用座套', '796', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('707', '730', '735', '797', '汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;通用座套', '汽车用品,座垫脚垫,通用座套', '797', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('708', '730', '735', '798', '汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;多功能垫', '汽车用品,座垫脚垫,多功能垫', '798', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('709', '730', '735', '799', '汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;专车专用脚垫', '汽车用品,座垫脚垫,专车专用脚垫', '799', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('710', '730', '735', '800', '汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;通用脚垫', '汽车用品,座垫脚垫,通用脚垫', '800', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('711', '730', '735', '801', '汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;后备箱垫', '汽车用品,座垫脚垫,后备箱垫', '801', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('712', '730', '736', '802', '汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;车用香水', '汽车用品,内饰精品,车用香水', '802', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('713', '730', '736', '803', '汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;车用炭包', '汽车用品,内饰精品,车用炭包', '803', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('714', '730', '736', '804', '汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;空气净化', '汽车用品,内饰精品,空气净化', '804', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('715', '730', '736', '805', '汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;颈枕/头枕', '汽车用品,内饰精品,颈枕/头枕', '805', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('716', '730', '736', '806', '汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;抱枕/腰靠', '汽车用品,内饰精品,抱枕/腰靠', '806', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('717', '730', '736', '807', '汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;方向盘套', '汽车用品,内饰精品,方向盘套', '807', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('718', '730', '736', '808', '汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;挂件', '汽车用品,内饰精品,挂件', '808', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('719', '730', '736', '809', '汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;摆件', '汽车用品,内饰精品,摆件', '809', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('720', '730', '736', '810', '汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;布艺软饰', '汽车用品,内饰精品,布艺软饰', '810', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('721', '730', '736', '811', '汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;功能用品', '汽车用品,内饰精品,功能用品', '811', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('722', '730', '736', '812', '汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;整理收纳', '汽车用品,内饰精品,整理收纳', '812', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('723', '730', '736', '813', '汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;CD夹', '汽车用品,内饰精品,CD夹', '813', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('724', '730', '737', '814', '汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;儿童安全座椅', '汽车用品,安全自驾,儿童安全座椅', '814', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('725', '730', '737', '815', '汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;应急救援', '汽车用品,安全自驾,应急救援', '815', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('726', '730', '737', '816', '汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;汽修工具', '汽车用品,安全自驾,汽修工具', '816', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('727', '730', '737', '817', '汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;自驾野营', '汽车用品,安全自驾,自驾野营', '817', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('728', '730', '737', '818', '汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;自驾照明', '汽车用品,安全自驾,自驾照明', '818', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('729', '730', '737', '819', '汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;保温箱', '汽车用品,安全自驾,保温箱', '819', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('730', '730', '737', '820', '汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;置物箱', '汽车用品,安全自驾,置物箱', '820', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('731', '730', '737', '821', '汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;车衣', '汽车用品,安全自驾,车衣', '821', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('732', '730', '737', '822', '汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;遮阳挡雪挡', '汽车用品,安全自驾,遮阳挡雪挡', '822', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('733', '730', '737', '823', '汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;车锁地锁', '汽车用品,安全自驾,车锁地锁', '823', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('734', '730', '737', '824', '汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;摩托车装备', '汽车用品,安全自驾,摩托车装备', '824', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('735', '825', '826', '838', '玩具乐器&nbsp;&gt;&nbsp;适用年龄&nbsp;&gt;&nbsp;0-6个月', '玩具乐器,适用年龄,0-6个月', '838', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('736', '825', '826', '839', '玩具乐器&nbsp;&gt;&nbsp;适用年龄&nbsp;&gt;&nbsp;6-12个月', '玩具乐器,适用年龄,6-12个月', '839', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('737', '825', '826', '840', '玩具乐器&nbsp;&gt;&nbsp;适用年龄&nbsp;&gt;&nbsp;1-3岁', '玩具乐器,适用年龄,1-3岁', '840', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('738', '825', '826', '841', '玩具乐器&nbsp;&gt;&nbsp;适用年龄&nbsp;&gt;&nbsp;3-6岁', '玩具乐器,适用年龄,3-6岁', '841', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('739', '825', '826', '842', '玩具乐器&nbsp;&gt;&nbsp;适用年龄&nbsp;&gt;&nbsp;6-14岁', '玩具乐器,适用年龄,6-14岁', '842', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('740', '825', '826', '843', '玩具乐器&nbsp;&gt;&nbsp;适用年龄&nbsp;&gt;&nbsp;14岁以上', '玩具乐器,适用年龄,14岁以上', '843', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('741', '825', '827', '844', '玩具乐器&nbsp;&gt;&nbsp;遥控/电动&nbsp;&gt;&nbsp;遥控车', '玩具乐器,遥控/电动,遥控车', '844', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('742', '825', '827', '845', '玩具乐器&nbsp;&gt;&nbsp;遥控/电动&nbsp;&gt;&nbsp;遥控飞机', '玩具乐器,遥控/电动,遥控飞机', '845', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('743', '825', '827', '846', '玩具乐器&nbsp;&gt;&nbsp;遥控/电动&nbsp;&gt;&nbsp;遥控船', '玩具乐器,遥控/电动,遥控船', '846', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('744', '825', '827', '847', '玩具乐器&nbsp;&gt;&nbsp;遥控/电动&nbsp;&gt;&nbsp;机器人/电动', '玩具乐器,遥控/电动,机器人/电动', '847', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('745', '825', '827', '848', '玩具乐器&nbsp;&gt;&nbsp;遥控/电动&nbsp;&gt;&nbsp;轨道/助力', '玩具乐器,遥控/电动,轨道/助力', '848', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('746', '825', '828', '849', '玩具乐器&nbsp;&gt;&nbsp;毛绒布艺&nbsp;&gt;&nbsp;毛绒/布艺', '玩具乐器,毛绒布艺,毛绒/布艺', '849', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('747', '825', '828', '850', '玩具乐器&nbsp;&gt;&nbsp;毛绒布艺&nbsp;&gt;&nbsp;靠垫/抱枕', '玩具乐器,毛绒布艺,靠垫/抱枕', '850', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('748', '825', '829', '851', '玩具乐器&nbsp;&gt;&nbsp;娃娃玩具&nbsp;&gt;&nbsp;芭比娃娃', '玩具乐器,娃娃玩具,芭比娃娃', '851', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('749', '825', '829', '852', '玩具乐器&nbsp;&gt;&nbsp;娃娃玩具&nbsp;&gt;&nbsp;卡通娃娃', '玩具乐器,娃娃玩具,卡通娃娃', '852', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('750', '825', '829', '853', '玩具乐器&nbsp;&gt;&nbsp;娃娃玩具&nbsp;&gt;&nbsp;智能娃娃', '玩具乐器,娃娃玩具,智能娃娃', '853', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('751', '825', '830', '854', '玩具乐器&nbsp;&gt;&nbsp;模型玩具&nbsp;&gt;&nbsp;仿真模型', '玩具乐器,模型玩具,仿真模型', '854', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('752', '825', '830', '855', '玩具乐器&nbsp;&gt;&nbsp;模型玩具&nbsp;&gt;&nbsp;拼插模型', '玩具乐器,模型玩具,拼插模型', '855', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('753', '825', '830', '856', '玩具乐器&nbsp;&gt;&nbsp;模型玩具&nbsp;&gt;&nbsp;收藏爱好', '玩具乐器,模型玩具,收藏爱好', '856', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('754', '825', '831', '857', '玩具乐器&nbsp;&gt;&nbsp;健身玩具&nbsp;&gt;&nbsp;炫舞毯', '玩具乐器,健身玩具,炫舞毯', '857', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('755', '825', '831', '858', '玩具乐器&nbsp;&gt;&nbsp;健身玩具&nbsp;&gt;&nbsp;爬行垫/毯', '玩具乐器,健身玩具,爬行垫/毯', '858', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('756', '825', '831', '859', '玩具乐器&nbsp;&gt;&nbsp;健身玩具&nbsp;&gt;&nbsp;户外玩具', '玩具乐器,健身玩具,户外玩具', '859', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('757', '825', '831', '860', '玩具乐器&nbsp;&gt;&nbsp;健身玩具&nbsp;&gt;&nbsp;戏水玩具', '玩具乐器,健身玩具,戏水玩具', '860', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('758', '825', '832', '861', '玩具乐器&nbsp;&gt;&nbsp;动漫玩具&nbsp;&gt;&nbsp;电影周边', '玩具乐器,动漫玩具,电影周边', '861', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('759', '825', '832', '862', '玩具乐器&nbsp;&gt;&nbsp;动漫玩具&nbsp;&gt;&nbsp;卡通周边', '玩具乐器,动漫玩具,卡通周边', '862', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('760', '825', '832', '863', '玩具乐器&nbsp;&gt;&nbsp;动漫玩具&nbsp;&gt;&nbsp;网游周边', '玩具乐器,动漫玩具,网游周边', '863', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('761', '825', '833', '864', '玩具乐器&nbsp;&gt;&nbsp;益智玩具&nbsp;&gt;&nbsp;摇铃/床铃', '玩具乐器,益智玩具,摇铃/床铃', '864', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('762', '825', '833', '865', '玩具乐器&nbsp;&gt;&nbsp;益智玩具&nbsp;&gt;&nbsp;健身架', '玩具乐器,益智玩具,健身架', '865', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('763', '825', '833', '866', '玩具乐器&nbsp;&gt;&nbsp;益智玩具&nbsp;&gt;&nbsp;早教启智', '玩具乐器,益智玩具,早教启智', '866', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('764', '825', '833', '867', '玩具乐器&nbsp;&gt;&nbsp;益智玩具&nbsp;&gt;&nbsp;拖拉玩具', '玩具乐器,益智玩具,拖拉玩具', '867', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('765', '825', '834', '868', '玩具乐器&nbsp;&gt;&nbsp;积木拼插&nbsp;&gt;&nbsp;积木', '玩具乐器,积木拼插,积木', '868', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('766', '825', '834', '869', '玩具乐器&nbsp;&gt;&nbsp;积木拼插&nbsp;&gt;&nbsp;拼图', '玩具乐器,积木拼插,拼图', '869', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('767', '825', '834', '870', '玩具乐器&nbsp;&gt;&nbsp;积木拼插&nbsp;&gt;&nbsp;磁力棒', '玩具乐器,积木拼插,磁力棒', '870', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('768', '825', '834', '871', '玩具乐器&nbsp;&gt;&nbsp;积木拼插&nbsp;&gt;&nbsp;立体拼插', '玩具乐器,积木拼插,立体拼插', '871', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('769', '825', '835', '872', '玩具乐器&nbsp;&gt;&nbsp;DIY玩具&nbsp;&gt;&nbsp;手工彩泥', '玩具乐器,DIY玩具,手工彩泥', '872', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('770', '825', '835', '873', '玩具乐器&nbsp;&gt;&nbsp;DIY玩具&nbsp;&gt;&nbsp;绘画工具', '玩具乐器,DIY玩具,绘画工具', '873', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('771', '825', '835', '874', '玩具乐器&nbsp;&gt;&nbsp;DIY玩具&nbsp;&gt;&nbsp;情景玩具', '玩具乐器,DIY玩具,情景玩具', '874', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('772', '825', '836', '875', '玩具乐器&nbsp;&gt;&nbsp;创意减压&nbsp;&gt;&nbsp;减压玩具', '玩具乐器,创意减压,减压玩具', '875', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('773', '825', '836', '876', '玩具乐器&nbsp;&gt;&nbsp;创意减压&nbsp;&gt;&nbsp;创意玩具', '玩具乐器,创意减压,创意玩具', '876', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('774', '825', '837', '877', '玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;钢琴', '玩具乐器,乐器相关,钢琴', '877', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('775', '825', '837', '878', '玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;电子琴', '玩具乐器,乐器相关,电子琴', '878', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('776', '825', '837', '879', '玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;手风琴', '玩具乐器,乐器相关,手风琴', '879', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('777', '825', '837', '880', '玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;吉他/贝斯', '玩具乐器,乐器相关,吉他/贝斯', '880', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('778', '825', '837', '881', '玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;民族管弦乐器', '玩具乐器,乐器相关,民族管弦乐器', '881', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('779', '825', '837', '882', '玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;西洋管弦乐', '玩具乐器,乐器相关,西洋管弦乐', '882', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('780', '825', '837', '883', '玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;口琴/口风琴/竖笛', '玩具乐器,乐器相关,口琴/口风琴/竖笛', '883', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('781', '825', '837', '884', '玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;西洋打击乐器', '玩具乐器,乐器相关,西洋打击乐器', '884', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('782', '825', '837', '885', '玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;各式乐器配件', '玩具乐器,乐器相关,各式乐器配件', '885', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('783', '825', '837', '886', '玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;电脑音乐', '玩具乐器,乐器相关,电脑音乐', '886', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('784', '825', '837', '887', '玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;工艺礼品乐器', '玩具乐器,乐器相关,工艺礼品乐器', '887', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('785', '888', '889', '895', '厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;炒锅', '厨具,烹饪锅具,炒锅', '895', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('786', '888', '889', '896', '厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;煎锅', '厨具,烹饪锅具,煎锅', '896', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('787', '888', '889', '897', '厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;压力锅', '厨具,烹饪锅具,压力锅', '897', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('788', '888', '889', '898', '厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;蒸锅', '厨具,烹饪锅具,蒸锅', '898', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('789', '888', '889', '899', '厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;汤锅', '厨具,烹饪锅具,汤锅', '899', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('790', '888', '889', '900', '厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;奶锅', '厨具,烹饪锅具,奶锅', '900', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('791', '888', '889', '901', '厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;套锅', '厨具,烹饪锅具,套锅', '901', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('792', '888', '889', '902', '厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;煲类', '厨具,烹饪锅具,煲类', '902', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('793', '888', '889', '903', '厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;水壶', '厨具,烹饪锅具,水壶', '903', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('794', '888', '889', '904', '厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;厨用杂件', '厨具,烹饪锅具,厨用杂件', '904', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('795', '888', '890', '905', '厨具&nbsp;&gt;&nbsp;刀剪菜板&nbsp;&gt;&nbsp;单刀', '厨具,刀剪菜板,单刀', '905', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('796', '888', '890', '906', '厨具&nbsp;&gt;&nbsp;刀剪菜板&nbsp;&gt;&nbsp;剪刀', '厨具,刀剪菜板,剪刀', '906', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('797', '888', '890', '907', '厨具&nbsp;&gt;&nbsp;刀剪菜板&nbsp;&gt;&nbsp;套刀', '厨具,刀剪菜板,套刀', '907', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('798', '888', '890', '908', '厨具&nbsp;&gt;&nbsp;刀剪菜板&nbsp;&gt;&nbsp;砧板', '厨具,刀剪菜板,砧板', '908', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('799', '888', '890', '909', '厨具&nbsp;&gt;&nbsp;刀剪菜板&nbsp;&gt;&nbsp;刀具配件', '厨具,刀剪菜板,刀具配件', '909', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('800', '888', '891', '910', '厨具&nbsp;&gt;&nbsp;收纳保鲜&nbsp;&gt;&nbsp;保鲜盒', '厨具,收纳保鲜,保鲜盒', '910', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('801', '888', '891', '911', '厨具&nbsp;&gt;&nbsp;收纳保鲜&nbsp;&gt;&nbsp;保鲜膜/袋', '厨具,收纳保鲜,保鲜膜/袋', '911', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('802', '888', '891', '912', '厨具&nbsp;&gt;&nbsp;收纳保鲜&nbsp;&gt;&nbsp;调料器皿', '厨具,收纳保鲜,调料器皿', '912', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('803', '888', '891', '913', '厨具&nbsp;&gt;&nbsp;收纳保鲜&nbsp;&gt;&nbsp;饭盒/提锅', '厨具,收纳保鲜,饭盒/提锅', '913', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('804', '888', '892', '914', '厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;塑料杯', '厨具,水具酒具,塑料杯', '914', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('805', '888', '892', '915', '厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;运动水壶', '厨具,水具酒具,运动水壶', '915', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('806', '888', '892', '916', '厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;玻璃杯', '厨具,水具酒具,玻璃杯', '916', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('807', '888', '892', '917', '厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;陶瓷杯', '厨具,水具酒具,陶瓷杯', '917', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('808', '888', '892', '918', '厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;保温杯', '厨具,水具酒具,保温杯', '918', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('809', '888', '892', '919', '厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;保温壶', '厨具,水具酒具,保温壶', '919', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('810', '888', '892', '920', '厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;酒杯/套装', '厨具,水具酒具,酒杯/套装', '920', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('811', '888', '892', '921', '厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;酒具配件', '厨具,水具酒具,酒具配件', '921', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('812', '888', '893', '922', '厨具&nbsp;&gt;&nbsp;餐具&nbsp;&gt;&nbsp;餐具套装', '厨具,餐具,餐具套装', '922', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('813', '888', '893', '923', '厨具&nbsp;&gt;&nbsp;餐具&nbsp;&gt;&nbsp;碗/碟/盘', '厨具,餐具,碗/碟/盘', '923', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('814', '888', '893', '924', '厨具&nbsp;&gt;&nbsp;餐具&nbsp;&gt;&nbsp;筷勺/刀叉', '厨具,餐具,筷勺/刀叉', '924', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('815', '888', '893', '925', '厨具&nbsp;&gt;&nbsp;餐具&nbsp;&gt;&nbsp;一次性餐具', '厨具,餐具,一次性餐具', '925', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('816', '888', '935', '936', '厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;整套茶具', '厨具,茶具/咖啡具,整套茶具', '936', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('817', '888', '935', '937', '厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;茶杯', '厨具,茶具/咖啡具,茶杯', '937', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('818', '888', '935', '938', '厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;茶壶', '厨具,茶具/咖啡具,茶壶', '938', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('819', '888', '935', '939', '厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;茶盘茶托', '厨具,茶具/咖啡具,茶盘茶托', '939', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('820', '888', '935', '940', '厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;茶叶罐', '厨具,茶具/咖啡具,茶叶罐', '940', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('821', '888', '935', '941', '厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;茶具配件', '厨具,茶具/咖啡具,茶具配件', '941', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('822', '888', '935', '942', '厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;茶宠摆件', '厨具,茶具/咖啡具,茶宠摆件', '942', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('823', '888', '935', '943', '厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;咖啡具', '厨具,茶具/咖啡具,咖啡具', '943', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('824', '888', '935', '944', '厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;其他', '厨具,茶具/咖啡具,其他', '944', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('825', '959', '960', '968', '母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;品牌奶粉', '母婴用品,奶粉,品牌奶粉', '968', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('826', '959', '960', '969', '母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;妈妈奶粉', '母婴用品,奶粉,妈妈奶粉', '969', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('827', '959', '960', '970', '母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;1段奶粉', '母婴用品,奶粉,1段奶粉', '970', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('828', '959', '960', '971', '母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;2段奶粉', '母婴用品,奶粉,2段奶粉', '971', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('829', '959', '960', '972', '母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;3段奶粉', '母婴用品,奶粉,3段奶粉', '972', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('830', '959', '960', '973', '母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;4段奶粉', '母婴用品,奶粉,4段奶粉', '973', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('831', '959', '960', '974', '母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;羊奶粉', '母婴用品,奶粉,羊奶粉', '974', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('832', '959', '960', '975', '母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;特殊配方', '母婴用品,奶粉,特殊配方', '975', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('833', '959', '960', '976', '母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;成人奶粉', '母婴用品,奶粉,成人奶粉', '976', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('834', '959', '961', '977', '母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;婴幼营养', '母婴用品,营养辅食,婴幼营养', '977', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('835', '959', '961', '978', '母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;初乳', '母婴用品,营养辅食,初乳', '978', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('836', '959', '961', '979', '母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;米粉/菜粉', '母婴用品,营养辅食,米粉/菜粉', '979', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('837', '959', '961', '980', '母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;果泥/果汁', '母婴用品,营养辅食,果泥/果汁', '980', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('838', '959', '961', '981', '母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;肉松/饼干', '母婴用品,营养辅食,肉松/饼干', '981', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('839', '959', '961', '982', '母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;辅食', '母婴用品,营养辅食,辅食', '982', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('840', '959', '961', '983', '母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;孕期营养', '母婴用品,营养辅食,孕期营养', '983', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('841', '959', '961', '984', '母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;清火/开胃', '母婴用品,营养辅食,清火/开胃', '984', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('842', '959', '961', '985', '母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;面条/粥', '母婴用品,营养辅食,面条/粥', '985', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('843', '959', '962', '986', '母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;品牌尿裤', '母婴用品,尿裤湿巾,品牌尿裤', '986', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('844', '959', '962', '987', '母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;新生儿', '母婴用品,尿裤湿巾,新生儿', '987', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('845', '959', '962', '988', '母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;S号', '母婴用品,尿裤湿巾,S号', '988', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('846', '959', '962', '989', '母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;M号', '母婴用品,尿裤湿巾,M号', '989', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('847', '959', '962', '990', '母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;L号', '母婴用品,尿裤湿巾,L号', '990', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('848', '959', '962', '991', '母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;XL/XXL号', '母婴用品,尿裤湿巾,XL/XXL号', '991', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('849', '959', '962', '992', '母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;裤型尿裤', '母婴用品,尿裤湿巾,裤型尿裤', '992', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('850', '959', '962', '993', '母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;湿巾', '母婴用品,尿裤湿巾,湿巾', '993', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('851', '959', '962', '994', '母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;尿布/尿垫', '母婴用品,尿裤湿巾,尿布/尿垫', '994', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('852', '959', '962', '995', '母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;成人尿裤', '母婴用品,尿裤湿巾,成人尿裤', '995', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('853', '959', '963', '996', '母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;奶瓶', '母婴用品,喂养用品,奶瓶', '996', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('854', '959', '963', '997', '母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;奶嘴', '母婴用品,喂养用品,奶嘴', '997', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('855', '959', '963', '998', '母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;吸奶器', '母婴用品,喂养用品,吸奶器', '998', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('856', '959', '963', '999', '母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;暖奶/消毒', '母婴用品,喂养用品,暖奶/消毒', '999', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('857', '959', '963', '1000', '母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;餐具', '母婴用品,喂养用品,餐具', '1000', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('858', '959', '963', '1001', '母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;水具', '母婴用品,喂养用品,水具', '1001', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('859', '959', '963', '1002', '母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;牙胶/安抚', '母婴用品,喂养用品,牙胶/安抚', '1002', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('860', '959', '963', '1003', '母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;辅助用品', '母婴用品,喂养用品,辅助用品', '1003', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('861', '959', '964', '1004', '母婴用品&nbsp;&gt;&nbsp;洗护用品&nbsp;&gt;&nbsp;宝宝护肤', '母婴用品,洗护用品,宝宝护肤', '1004', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('862', '959', '964', '1005', '母婴用品&nbsp;&gt;&nbsp;洗护用品&nbsp;&gt;&nbsp;洗浴用品', '母婴用品,洗护用品,洗浴用品', '1005', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('863', '959', '964', '1006', '母婴用品&nbsp;&gt;&nbsp;洗护用品&nbsp;&gt;&nbsp;洗发沐浴', '母婴用品,洗护用品,洗发沐浴', '1006', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('864', '959', '964', '1007', '母婴用品&nbsp;&gt;&nbsp;洗护用品&nbsp;&gt;&nbsp;清洁用品', '母婴用品,洗护用品,清洁用品', '1007', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('865', '959', '964', '1008', '母婴用品&nbsp;&gt;&nbsp;洗护用品&nbsp;&gt;&nbsp;护理用品', '母婴用品,洗护用品,护理用品', '1008', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('866', '959', '964', '1009', '母婴用品&nbsp;&gt;&nbsp;洗护用品&nbsp;&gt;&nbsp;妈妈护肤', '母婴用品,洗护用品,妈妈护肤', '1009', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('867', '959', '965', '1010', '母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;婴儿推车', '母婴用品,童车童床,婴儿推车', '1010', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('868', '959', '965', '1011', '母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;餐椅摇椅', '母婴用品,童车童床,餐椅摇椅', '1011', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('869', '959', '965', '1012', '母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;婴儿床', '母婴用品,童车童床,婴儿床', '1012', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('870', '959', '965', '1013', '母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;学步车', '母婴用品,童车童床,学步车', '1013', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('871', '959', '965', '1014', '母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;三轮车', '母婴用品,童车童床,三轮车', '1014', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('872', '959', '965', '1015', '母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;自行车', '母婴用品,童车童床,自行车', '1015', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('873', '959', '965', '1016', '母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;电动车', '母婴用品,童车童床,电动车', '1016', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('874', '959', '965', '1017', '母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;健身车', '母婴用品,童车童床,健身车', '1017', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('875', '959', '965', '1018', '母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;安全座椅', '母婴用品,童车童床,安全座椅', '1018', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('876', '959', '966', '1019', '母婴用品&nbsp;&gt;&nbsp;服饰寝居&nbsp;&gt;&nbsp;婴儿外出服', '母婴用品,服饰寝居,婴儿外出服', '1019', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('877', '959', '966', '1020', '母婴用品&nbsp;&gt;&nbsp;服饰寝居&nbsp;&gt;&nbsp;婴儿内衣', '母婴用品,服饰寝居,婴儿内衣', '1020', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('878', '959', '966', '1021', '母婴用品&nbsp;&gt;&nbsp;服饰寝居&nbsp;&gt;&nbsp;婴儿礼盒', '母婴用品,服饰寝居,婴儿礼盒', '1021', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('879', '959', '966', '1022', '母婴用品&nbsp;&gt;&nbsp;服饰寝居&nbsp;&gt;&nbsp;婴儿鞋帽袜', '母婴用品,服饰寝居,婴儿鞋帽袜', '1022', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('880', '959', '966', '1023', '母婴用品&nbsp;&gt;&nbsp;服饰寝居&nbsp;&gt;&nbsp;安全防护', '母婴用品,服饰寝居,安全防护', '1023', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('881', '959', '966', '1024', '母婴用品&nbsp;&gt;&nbsp;服饰寝居&nbsp;&gt;&nbsp;家居床品', '母婴用品,服饰寝居,家居床品', '1024', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('882', '959', '966', '1025', '母婴用品&nbsp;&gt;&nbsp;服饰寝居&nbsp;&gt;&nbsp;其他', '母婴用品,服饰寝居,其他', '1025', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('883', '959', '967', '1026', '母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;包/背婴带', '母婴用品,妈妈专区,包/背婴带', '1026', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('884', '959', '967', '1027', '母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;妈妈护理', '母婴用品,妈妈专区,妈妈护理', '1027', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('885', '959', '967', '1028', '母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;产后塑身', '母婴用品,妈妈专区,产后塑身', '1028', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('886', '959', '967', '1029', '母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;孕妇内衣', '母婴用品,妈妈专区,孕妇内衣', '1029', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('887', '959', '967', '1030', '母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;防辐射服', '母婴用品,妈妈专区,防辐射服', '1030', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('888', '959', '967', '1031', '母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;孕妇装', '母婴用品,妈妈专区,孕妇装', '1031', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('889', '959', '967', '1032', '母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;孕妇食品', '母婴用品,妈妈专区,孕妇食品', '1032', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('890', '959', '967', '1033', '母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;妈妈美容', '母婴用品,妈妈专区,妈妈美容', '1033', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('891', '1037', '1041', '1044', '虚拟充值&nbsp;&gt;&nbsp;充值&nbsp;&gt;&nbsp;手机充值', '虚拟充值,充值,手机充值', '1044', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('892', '1037', '1042', '1045', '虚拟充值&nbsp;&gt;&nbsp;游戏&nbsp;&gt;&nbsp;游戏点卡', '虚拟充值,游戏,游戏点卡', '1045', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('893', '1037', '1042', '1046', '虚拟充值&nbsp;&gt;&nbsp;游戏&nbsp;&gt;&nbsp;QQ充值', '虚拟充值,游戏,QQ充值', '1046', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('894', '1037', '1043', '1047', '虚拟充值&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;电影票', '虚拟充值,票务,电影票', '1047', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('895', '1037', '1043', '1048', '虚拟充值&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;演唱会', '虚拟充值,票务,演唱会', '1048', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('896', '1037', '1043', '1049', '虚拟充值&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;话剧/歌剧/音乐剧', '虚拟充值,票务,话剧/歌剧/音乐剧', '1049', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('897', '1037', '1043', '1050', '虚拟充值&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;体育赛事', '虚拟充值,票务,体育赛事', '1050', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('898', '1037', '1043', '1051', '虚拟充值&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;舞蹈芭蕾', '虚拟充值,票务,舞蹈芭蕾', '1051', '0');
INSERT INTO `tr_goods_class_tag` VALUES ('899', '1037', '1043', '1052', '虚拟充值&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;戏曲综艺', '虚拟充值,票务,戏曲综艺', '1052', '0');

-- ----------------------------
-- Table structure for `tr_goods_common`
-- ----------------------------
DROP TABLE IF EXISTS `tr_goods_common`;
CREATE TABLE `tr_goods_common` (
  `goods_commonid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品公共表id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_jingle` varchar(50) NOT NULL COMMENT '商品广告词',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类',
  `gc_name` varchar(200) NOT NULL COMMENT '商品分类',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `spec_name` varchar(255) NOT NULL COMMENT '规格名称',
  `spec_value` text NOT NULL COMMENT '规格值',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌id',
  `brand_name` varchar(100) NOT NULL COMMENT '品牌名称',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类型id',
  `goods_image` varchar(100) NOT NULL COMMENT '商品主图',
  `goods_attr` text NOT NULL COMMENT '商品属性',
  `goods_body` text NOT NULL COMMENT '商品内容',
  `goods_state` tinyint(3) unsigned NOT NULL COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `goods_stateremark` varchar(255) DEFAULT NULL COMMENT '违规原因',
  `goods_verify` tinyint(3) unsigned NOT NULL COMMENT '商品审核 1通过，0未通过，10审核中',
  `goods_verifyremark` varchar(255) DEFAULT NULL COMMENT '审核失败原因',
  `goods_lock` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品锁定 0未锁，1已锁',
  `goods_addtime` int(10) unsigned NOT NULL COMMENT '商品添加时间',
  `goods_selltime` int(10) unsigned NOT NULL COMMENT '上架时间',
  `goods_specname` text NOT NULL COMMENT '规格名称序列化（下标为规格id）',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_marketprice` decimal(10,2) NOT NULL COMMENT '市场价',
  `goods_costprice` decimal(10,2) NOT NULL COMMENT '成本价',
  `goods_discount` float unsigned NOT NULL COMMENT '折扣',
  `goods_serial` varchar(50) NOT NULL COMMENT '商家编号',
  `transport_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板',
  `transport_title` varchar(60) NOT NULL DEFAULT '' COMMENT '运费模板名称',
  `goods_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品推荐 1是，0否，默认为0',
  `goods_freight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `goods_vat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `areaid_1` int(10) unsigned NOT NULL COMMENT '一级地区id',
  `areaid_2` int(10) unsigned NOT NULL COMMENT '二级地区id',
  `goods_stcids` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `plateid_top` int(10) unsigned DEFAULT NULL COMMENT '顶部关联板式',
  `plateid_bottom` int(10) unsigned DEFAULT NULL COMMENT '底部关联板式',
  PRIMARY KEY (`goods_commonid`)
) ENGINE=MyISAM AUTO_INCREMENT=100088 DEFAULT CHARSET=utf8 COMMENT='商品公共内容表';

-- ----------------------------
-- Records of tr_goods_common
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_goods_images`
-- ----------------------------
DROP TABLE IF EXISTS `tr_goods_images`;
CREATE TABLE `tr_goods_images` (
  `goods_image_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品图片id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共内容id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `color_id` int(10) unsigned NOT NULL COMMENT '颜色规格值id',
  `goods_image` varchar(1000) NOT NULL COMMENT '商品图片',
  `goods_image_sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '默认主题，1是，0否',
  PRIMARY KEY (`goods_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=607 DEFAULT CHARSET=utf8 COMMENT='商品图片';

-- ----------------------------
-- Records of tr_goods_images
-- ----------------------------
INSERT INTO `tr_goods_images` VALUES ('11', '1', '2', '218', '2_04415409366497470.jpg', '0', '1');
INSERT INTO `tr_goods_images` VALUES ('12', '1', '2', '217', '2_04415409493015985.jpg', '0', '1');
INSERT INTO `tr_goods_images` VALUES ('13', '1', '2', '216', '2_04415409635635215.jpg', '0', '1');
INSERT INTO `tr_goods_images` VALUES ('14', '1', '2', '215', '2_04415409825356607.jpg', '0', '1');
INSERT INTO `tr_goods_images` VALUES ('15', '1', '2', '214', '2_04415410065557070.jpg', '0', '1');

-- ----------------------------
-- Table structure for `tr_groupbuy`
-- ----------------------------
DROP TABLE IF EXISTS `tr_groupbuy`;
CREATE TABLE `tr_groupbuy` (
  `groupbuy_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '团购ID',
  `groupbuy_name` varchar(255) NOT NULL COMMENT '活动名称',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `groupbuy_price` decimal(10,2) NOT NULL COMMENT '团购价格',
  `groupbuy_rebate` decimal(10,2) NOT NULL COMMENT '折扣',
  `virtual_quantity` int(10) unsigned NOT NULL COMMENT '虚拟购买数量',
  `upper_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买上限',
  `buyer_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已购买人数',
  `buy_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `groupbuy_intro` text COMMENT '本团介绍',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '团购状态 1.未发布 2.已取消 3.进行中 4.已完成 5.已结束',
  `recommended` tinyint(1) unsigned NOT NULL COMMENT '是否推荐 0.未推荐 1.已推荐',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `class_id` int(10) unsigned NOT NULL COMMENT '团购类别编号',
  `area_id` int(10) unsigned NOT NULL COMMENT '团购地区编号',
  `groupbuy_image` varchar(100) NOT NULL COMMENT '团购图片',
  `groupbuy_image1` varchar(100) DEFAULT NULL COMMENT '团购图片1',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`groupbuy_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='团购商品表';

-- ----------------------------
-- Records of tr_groupbuy
-- ----------------------------
INSERT INTO `tr_groupbuy` VALUES ('2', '228元任选一箱，国际大赛权威推荐“金奖”葡萄酒！', '1388995740', '1414684800', '231', '100085', '至尊金奖 法国原瓶进口AOC红酒 任选一箱 红沙城堡红葡萄酒 原装进口', '1', '官方店铺', '899.00', '228.00', '2.54', '0', '5', '0', '0', '<img src=\"../data/upload/shop/store/goods/1/1_04423392645620711_1280.jpg\" alt=\"image\" />', '20', '1', '21', '0', '0', '1_04423393922882448.jpg', '1_04423395187054760.jpg', '全国唯一支持开瓶试饮7天无理由退换货');
INSERT INTO `tr_groupbuy` VALUES ('3', '东阿阿胶桃花姬阿胶糕300g，芝麻香，核桃脆，上品阿胶，养颜', '1388997900', '1414684800', '232', '100086', '中华老字号 东阿阿胶桃花姬阿胶糕300g', '1', '官方店铺', '150.00', '95.00', '6.33', '0', '3', '0', '0', '<img src=\"../data/upload/shop/store/goods/1/1_04423412221350722_1280.jpg\" alt=\"image\" />', '20', '1', '10', '0', '0', '1_04423413554692434.jpg', '1_04423415305032356.jpg', '闪电发货 48小时送达');

-- ----------------------------
-- Table structure for `tr_groupbuy_area`
-- ----------------------------
DROP TABLE IF EXISTS `tr_groupbuy_area`;
CREATE TABLE `tr_groupbuy_area` (
  `area_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地区编号',
  `area_name` varchar(50) NOT NULL COMMENT '地区名称',
  `area_parent_id` int(10) unsigned NOT NULL COMMENT '父地区编号',
  `area_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `area_deep` tinyint(1) unsigned NOT NULL COMMENT '深度',
  PRIMARY KEY (`area_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='团购地区表';

-- ----------------------------
-- Records of tr_groupbuy_area
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_groupbuy_class`
-- ----------------------------
DROP TABLE IF EXISTS `tr_groupbuy_class`;
CREATE TABLE `tr_groupbuy_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类别编号',
  `class_name` varchar(20) NOT NULL COMMENT '类别名称',
  `class_parent_id` int(10) unsigned NOT NULL COMMENT '父类别编号',
  `sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `deep` tinyint(1) unsigned NOT NULL COMMENT '深度',
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='团购类别表';

-- ----------------------------
-- Records of tr_groupbuy_class
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_groupbuy_price_range`
-- ----------------------------
DROP TABLE IF EXISTS `tr_groupbuy_price_range`;
CREATE TABLE `tr_groupbuy_price_range` (
  `range_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '价格区间编号',
  `range_name` varchar(20) NOT NULL COMMENT '区间名称',
  `range_start` int(10) unsigned NOT NULL COMMENT '区间下限',
  `range_end` int(10) unsigned NOT NULL COMMENT '区间上限',
  PRIMARY KEY (`range_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='团购价格区间表';

-- ----------------------------
-- Records of tr_groupbuy_price_range
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_groupbuy_quota`
-- ----------------------------
DROP TABLE IF EXISTS `tr_groupbuy_quota`;
CREATE TABLE `tr_groupbuy_quota` (
  `quota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '团购套餐编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '套餐开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '套餐结束时间',
  PRIMARY KEY (`quota_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='团购套餐表';

-- ----------------------------
-- Records of tr_groupbuy_quota
-- ----------------------------
INSERT INTO `tr_groupbuy_quota` VALUES ('5', '1', '1', 'shopnc', '官方店铺', '1388995313', '1414915313');

-- ----------------------------
-- Table structure for `tr_inform`
-- ----------------------------
DROP TABLE IF EXISTS `tr_inform`;
CREATE TABLE `tr_inform` (
  `inform_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报id',
  `inform_member_id` int(11) NOT NULL COMMENT '举报人id',
  `inform_member_name` varchar(50) NOT NULL COMMENT '举报人会员名',
  `inform_goods_id` int(11) NOT NULL COMMENT '被举报的商品id',
  `inform_goods_name` varchar(100) NOT NULL COMMENT '被举报的商品名称',
  `inform_subject_id` int(11) NOT NULL COMMENT '举报主题id',
  `inform_subject_content` varchar(50) NOT NULL COMMENT '举报主题',
  `inform_content` varchar(100) NOT NULL COMMENT '举报信息',
  `inform_pic1` varchar(100) NOT NULL COMMENT '图片1',
  `inform_pic2` varchar(100) NOT NULL COMMENT '图片2',
  `inform_pic3` varchar(100) NOT NULL COMMENT '图片3',
  `inform_datetime` int(11) NOT NULL COMMENT '举报时间',
  `inform_store_id` int(11) NOT NULL COMMENT '被举报商品的店铺id',
  `inform_state` tinyint(4) NOT NULL COMMENT '举报状态(1未处理/2已处理)',
  `inform_handle_type` tinyint(4) NOT NULL COMMENT '举报处理结果(1无效举报/2恶意举报/3有效举报)',
  `inform_handle_message` varchar(100) NOT NULL COMMENT '举报处理信息',
  `inform_handle_datetime` int(11) NOT NULL DEFAULT '0' COMMENT '举报处理时间',
  `inform_handle_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员id',
  PRIMARY KEY (`inform_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='举报表';

-- ----------------------------
-- Records of tr_inform
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_inform_subject`
-- ----------------------------
DROP TABLE IF EXISTS `tr_inform_subject`;
CREATE TABLE `tr_inform_subject` (
  `inform_subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报主题id',
  `inform_subject_content` varchar(100) NOT NULL COMMENT '举报主题内容',
  `inform_subject_type_id` int(11) NOT NULL COMMENT '举报类型id',
  `inform_subject_type_name` varchar(50) NOT NULL COMMENT '举报类型名称 ',
  `inform_subject_state` tinyint(11) NOT NULL COMMENT '举报主题状态(1可用/2失效)',
  PRIMARY KEY (`inform_subject_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='举报主题表';

-- ----------------------------
-- Records of tr_inform_subject
-- ----------------------------
INSERT INTO `tr_inform_subject` VALUES ('1', '管制刀具、弓弩类、其他武器等', '1', '出售禁售品', '1');
INSERT INTO `tr_inform_subject` VALUES ('2', '赌博用具类', '1', '出售禁售品', '1');
INSERT INTO `tr_inform_subject` VALUES ('3', '枪支弹药', '1', '出售禁售品', '1');
INSERT INTO `tr_inform_subject` VALUES ('4', '毒品及吸毒工具', '1', '出售禁售品', '1');
INSERT INTO `tr_inform_subject` VALUES ('5', '色差大，质量差。', '2', '产品质量问题', '1');

-- ----------------------------
-- Table structure for `tr_inform_subject_type`
-- ----------------------------
DROP TABLE IF EXISTS `tr_inform_subject_type`;
CREATE TABLE `tr_inform_subject_type` (
  `inform_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报类型id',
  `inform_type_name` varchar(50) NOT NULL COMMENT '举报类型名称 ',
  `inform_type_desc` varchar(100) NOT NULL COMMENT '举报类型描述',
  `inform_type_state` tinyint(4) NOT NULL COMMENT '举报类型状态(1有效/2失效)',
  PRIMARY KEY (`inform_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='举报类型表';

-- ----------------------------
-- Records of tr_inform_subject_type
-- ----------------------------
INSERT INTO `tr_inform_subject_type` VALUES ('1', '出售禁售品', '销售商城禁止和限制交易规则下所规定的所有商品。', '1');
INSERT INTO `tr_inform_subject_type` VALUES ('2', '产品质量问题', '产品质量差，与描述严重不相符。', '1');

-- ----------------------------
-- Table structure for `tr_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `tr_invoice`;
CREATE TABLE `tr_invoice` (
  `inv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `inv_state` enum('1','2') DEFAULT NULL COMMENT '1普通发票2增值税发票',
  `inv_title` varchar(50) DEFAULT '' COMMENT '发票抬头[普通发票]',
  `inv_content` varchar(10) DEFAULT '' COMMENT '发票内容[普通发票]',
  `inv_company` varchar(50) DEFAULT '' COMMENT '单位名称',
  `inv_code` varchar(50) DEFAULT '' COMMENT '纳税人识别号',
  `inv_reg_addr` varchar(50) DEFAULT '' COMMENT '注册地址',
  `inv_reg_phone` varchar(30) DEFAULT '' COMMENT '注册电话',
  `inv_reg_bname` varchar(30) DEFAULT '' COMMENT '开户银行',
  `inv_reg_baccount` varchar(30) DEFAULT '' COMMENT '银行帐户',
  `inv_rec_name` varchar(20) DEFAULT '' COMMENT '收票人姓名',
  `inv_rec_mobphone` varchar(15) DEFAULT '' COMMENT '收票人手机号',
  `inv_rec_province` varchar(30) DEFAULT '' COMMENT '收票人省份',
  `inv_goto_addr` varchar(50) DEFAULT '' COMMENT '送票地址',
  PRIMARY KEY (`inv_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='买家发票信息表';

-- ----------------------------
-- Records of tr_invoice
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_lock`
-- ----------------------------
DROP TABLE IF EXISTS `tr_lock`;
CREATE TABLE `tr_lock` (
  `pid` bigint(20) unsigned NOT NULL COMMENT 'IP+TYPE',
  `pvalue` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '次数',
  `expiretime` int(11) NOT NULL DEFAULT '0' COMMENT '锁定截止时间',
  KEY `ip` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='防灌水表';

-- ----------------------------
-- Records of tr_lock
-- ----------------------------
INSERT INTO `tr_lock` VALUES ('3', '1', '1432693861');
INSERT INTO `tr_lock` VALUES ('32322359772', '1', '1433315777');

-- ----------------------------
-- Table structure for `tr_mail_msg_temlates`
-- ----------------------------
DROP TABLE IF EXISTS `tr_mail_msg_temlates`;
CREATE TABLE `tr_mail_msg_temlates` (
  `name` varchar(100) NOT NULL COMMENT '模板名称',
  `title` varchar(100) DEFAULT NULL COMMENT '模板标题',
  `code` varchar(100) NOT NULL COMMENT '模板调用代码',
  `content` text NOT NULL COMMENT '模板内容',
  `type` tinyint(1) NOT NULL COMMENT '模板类别，0为邮件，1为短信息，默认为0',
  `mail_switch` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件模板表';

-- ----------------------------
-- Records of tr_mail_msg_temlates
-- ----------------------------
INSERT INTO `tr_mail_msg_temlates` VALUES ('<strong>[给用户]</strong>用户找回密码的邮件通知', '{$site_name}提醒:{$user_name}修改密码设置', 'email_touser_find_password', '<p>尊敬的{$user_name}:</p>\r\n<p>您好, 您刚才在{$site_name}申请了重置密码，您的新密码为<span style=\"color:#ff9900;\">{$new_password}</span>。</p>\r\n<p>请点击<a href=\"{$site_url}\" target=\"_blank\">{$site_url}</a>登录，修改您的新密码。</p>\r\n<p style=\"text-align:right;\">{$site_name}</p>\r\n<p style=\"text-align:right;\">{$mail_send_time}</p>', '0', '0');

-- ----------------------------
-- Table structure for `tr_member`
-- ----------------------------
DROP TABLE IF EXISTS `tr_member`;
CREATE TABLE `tr_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `member_truename` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `member_avatar` varchar(50) DEFAULT NULL COMMENT '会员头像',
  `member_sex` tinyint(1) DEFAULT NULL COMMENT '会员性别',
  `member_birthday` date DEFAULT NULL COMMENT '生日',
  `member_passwd` varchar(32) NOT NULL COMMENT '会员密码',
  `member_email` varchar(100) NOT NULL COMMENT '会员邮箱',
  `member_qq` varchar(100) DEFAULT NULL COMMENT 'qq',
  `member_ww` varchar(100) DEFAULT NULL COMMENT '阿里旺旺',
  `member_login_num` int(11) NOT NULL DEFAULT '1' COMMENT '登录次数',
  `member_time` varchar(10) NOT NULL COMMENT '会员注册时间',
  `member_login_time` varchar(10) NOT NULL COMMENT '当前登录时间',
  `member_old_login_time` varchar(10) NOT NULL COMMENT '上次登录时间',
  `member_login_ip` varchar(20) DEFAULT NULL COMMENT '当前登录ip',
  `member_old_login_ip` varchar(20) DEFAULT NULL COMMENT '上次登录ip',
  `member_qqopenid` varchar(100) DEFAULT NULL COMMENT 'qq互联id',
  `member_qqinfo` text COMMENT 'qq账号相关信息',
  `member_sinaopenid` varchar(100) DEFAULT NULL COMMENT '新浪微博登录id',
  `member_sinainfo` text COMMENT '新浪账号相关信息序列化值',
  `member_points` int(11) NOT NULL DEFAULT '0' COMMENT '会员积分',
  `available_predeposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款可用金额',
  `freeze_predeposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款冻结金额',
  `inform_allow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许举报(1可以/2不可以)',
  `is_buy` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否有购买权限 1为开启 0为关闭',
  `is_allowtalk` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否有咨询和发送站内信的权限 1为开启 0为关闭',
  `member_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员的开启状态 1为开启 0为关闭',
  `member_credit` int(11) NOT NULL DEFAULT '0' COMMENT '会员信用',
  `member_snsvisitnum` int(11) NOT NULL DEFAULT '0' COMMENT 'sns空间访问次数',
  `member_areaid` int(11) DEFAULT NULL COMMENT '地区ID',
  `member_cityid` int(11) DEFAULT NULL COMMENT '城市ID',
  `member_provinceid` int(11) DEFAULT NULL COMMENT '省份ID',
  `member_areainfo` varchar(255) DEFAULT NULL COMMENT '地区内容',
  `member_privacy` text COMMENT '隐私设定',
  PRIMARY KEY (`member_id`),
  KEY `member_name` (`member_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of tr_member
-- ----------------------------
INSERT INTO `tr_member` VALUES ('1', 'shopnc', '', '', '0', null, '804451dc13014b1c785fb73b1617b760', 'feng@shopnc.com', '', '', '7', '1387941824', '1389780374', '1389780361', '127.0.0.1', '127.0.0.1', '', '', '', '', '90', '0.00', '0.00', '1', '1', '1', '1', '0', '5', null, null, null, null, null);
INSERT INTO `tr_member` VALUES ('2', 'test', '', '', '0', null, 'cc03e747a6afbbcbf8be7668acfebee5', '630892807@qq.com', '', null, '7', '1432693262', '1433406968', '1433310201', '192.168.1.201', '192.168.1.201', '', '', '', '', '170', '0.00', '0.00', '1', '1', '1', '1', '0', '2', null, null, null, null, null);

-- ----------------------------
-- Table structure for `tr_message`
-- ----------------------------
DROP TABLE IF EXISTS `tr_message`;
CREATE TABLE `tr_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '短消息索引id',
  `message_parent_id` int(11) NOT NULL COMMENT '回复短消息message_id',
  `from_member_id` int(11) NOT NULL COMMENT '短消息发送人',
  `to_member_id` varchar(1000) NOT NULL COMMENT '短消息接收人',
  `message_title` varchar(50) DEFAULT NULL COMMENT '短消息标题',
  `message_body` varchar(255) NOT NULL COMMENT '短消息内容',
  `message_time` varchar(10) NOT NULL COMMENT '短消息发送时间',
  `message_update_time` varchar(10) DEFAULT NULL COMMENT '短消息回复更新时间',
  `message_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '短消息打开状态',
  `message_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '短消息状态，0为正常状态，1为发送人删除状态，2为接收人删除状态',
  `message_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为私信、1为系统消息、2为留言',
  `read_member_id` varchar(1000) DEFAULT NULL COMMENT '已经读过该消息的会员id',
  `del_member_id` varchar(1000) DEFAULT NULL COMMENT '已经删除该消息的会员id',
  `message_ismore` tinyint(1) NOT NULL DEFAULT '0' COMMENT '站内信是否为一条发给多个用户 0为否 1为多条 ',
  `from_member_name` varchar(100) DEFAULT NULL COMMENT '发信息人用户名',
  `to_member_name` varchar(100) DEFAULT NULL COMMENT '接收人用户名',
  PRIMARY KEY (`message_id`),
  KEY `from_member_id` (`from_member_id`),
  KEY `to_member_id` (`to_member_id`(255)),
  KEY `message_ismore` (`message_ismore`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='短消息';

-- ----------------------------
-- Records of tr_message
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_micro_adv`
-- ----------------------------
DROP TABLE IF EXISTS `tr_micro_adv`;
CREATE TABLE `tr_micro_adv` (
  `adv_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告编号',
  `adv_type` varchar(50) DEFAULT '' COMMENT '广告类型',
  `adv_name` varchar(255) NOT NULL DEFAULT '' COMMENT '广告名称',
  `adv_image` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图片',
  `adv_url` varchar(255) NOT NULL DEFAULT '' COMMENT '广告链接',
  `adv_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '广告排序',
  PRIMARY KEY (`adv_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微商城广告表';

-- ----------------------------
-- Records of tr_micro_adv
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_micro_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tr_micro_comment`;
CREATE TABLE `tr_micro_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `comment_type` tinyint(1) NOT NULL COMMENT '评论类型编号',
  `comment_object_id` int(10) unsigned NOT NULL COMMENT '推荐商品编号',
  `comment_message` varchar(255) NOT NULL COMMENT '评论内容',
  `comment_member_id` int(10) unsigned NOT NULL COMMENT '评论人编号',
  `comment_time` int(10) unsigned NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微商城商品评论表';

-- ----------------------------
-- Records of tr_micro_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_micro_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tr_micro_goods`;
CREATE TABLE `tr_micro_goods` (
  `commend_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐编号',
  `commend_member_id` int(10) unsigned NOT NULL COMMENT '推荐人用户编号',
  `commend_goods_id` int(10) unsigned NOT NULL COMMENT '推荐商品编号',
  `commend_goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `commend_goods_store_id` int(10) unsigned NOT NULL COMMENT '推荐商品店铺编号',
  `commend_goods_name` varchar(100) NOT NULL COMMENT '推荐商品名称',
  `commend_goods_price` decimal(11,2) NOT NULL COMMENT '推荐商品价格',
  `commend_goods_image` varchar(100) NOT NULL COMMENT '推荐商品图片',
  `commend_message` varchar(1000) NOT NULL COMMENT '推荐信息',
  `commend_time` int(10) unsigned NOT NULL COMMENT '推荐时间',
  `class_id` int(10) unsigned NOT NULL,
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `microshop_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '首页推荐 0-否 1-推荐',
  `microshop_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`commend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微商城推荐商品表随心看';

-- ----------------------------
-- Records of tr_micro_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_micro_goods_class`
-- ----------------------------
DROP TABLE IF EXISTS `tr_micro_goods_class`;
CREATE TABLE `tr_micro_goods_class` (
  `class_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `class_name` varchar(50) NOT NULL COMMENT '分类名称',
  `class_parent_id` int(11) unsigned NOT NULL COMMENT '父级分类编号',
  `class_sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `class_keyword` varchar(500) NOT NULL DEFAULT '' COMMENT '分类关键字',
  `class_image` varchar(100) NOT NULL DEFAULT '' COMMENT '分类图片',
  `class_commend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推荐标志0-不推荐 1-推荐到首页',
  `class_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认标志，0-非默认 1-默认',
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微商城商品随心看分类表';

-- ----------------------------
-- Records of tr_micro_goods_class
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_micro_goods_relation`
-- ----------------------------
DROP TABLE IF EXISTS `tr_micro_goods_relation`;
CREATE TABLE `tr_micro_goods_relation` (
  `relation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关系编号',
  `class_id` int(10) unsigned NOT NULL COMMENT '微商城商品分类编号',
  `shop_class_id` int(10) unsigned NOT NULL COMMENT '商城商品分类编号',
  PRIMARY KEY (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微商城商品分类和商城商品分类对应关系';

-- ----------------------------
-- Records of tr_micro_goods_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_micro_like`
-- ----------------------------
DROP TABLE IF EXISTS `tr_micro_like`;
CREATE TABLE `tr_micro_like` (
  `like_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '喜欢编号',
  `like_type` tinyint(1) NOT NULL COMMENT '喜欢类型编号',
  `like_object_id` int(10) unsigned NOT NULL COMMENT '喜欢对象编号',
  `like_member_id` int(10) unsigned NOT NULL COMMENT '喜欢人编号',
  `like_time` int(10) unsigned NOT NULL COMMENT '喜欢时间',
  PRIMARY KEY (`like_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微商城喜欢表';

-- ----------------------------
-- Records of tr_micro_like
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_micro_member_info`
-- ----------------------------
DROP TABLE IF EXISTS `tr_micro_member_info`;
CREATE TABLE `tr_micro_member_info` (
  `member_id` int(11) unsigned NOT NULL COMMENT '用户编号',
  `visit_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '个人中心访问计数',
  `personal_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已发布个人秀数量',
  `goods_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已发布随心看数量',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微商城用户信息表';

-- ----------------------------
-- Records of tr_micro_member_info
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_micro_personal`
-- ----------------------------
DROP TABLE IF EXISTS `tr_micro_personal`;
CREATE TABLE `tr_micro_personal` (
  `personal_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐编号',
  `commend_member_id` int(10) unsigned NOT NULL COMMENT '推荐人用户编号',
  `commend_image` text NOT NULL COMMENT '推荐图片',
  `commend_buy` text NOT NULL COMMENT '购买信息',
  `commend_message` varchar(1000) NOT NULL COMMENT '推荐信息',
  `commend_time` int(10) unsigned NOT NULL COMMENT '推荐时间',
  `class_id` int(10) unsigned NOT NULL,
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `microshop_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '首页推荐 0-否 1-推荐',
  `microshop_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`personal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微商城个人秀表';

-- ----------------------------
-- Records of tr_micro_personal
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_micro_personal_class`
-- ----------------------------
DROP TABLE IF EXISTS `tr_micro_personal_class`;
CREATE TABLE `tr_micro_personal_class` (
  `class_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `class_name` varchar(50) NOT NULL COMMENT '分类名称',
  `class_sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `class_image` varchar(100) NOT NULL DEFAULT '' COMMENT '分类图片',
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微商城个人秀分类表';

-- ----------------------------
-- Records of tr_micro_personal_class
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_micro_store`
-- ----------------------------
DROP TABLE IF EXISTS `tr_micro_store`;
CREATE TABLE `tr_micro_store` (
  `microshop_store_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺街店铺编号',
  `shop_store_id` int(11) unsigned NOT NULL COMMENT '商城店铺编号',
  `microshop_sort` tinyint(1) unsigned DEFAULT '255' COMMENT '排序',
  `microshop_commend` tinyint(1) unsigned DEFAULT '1' COMMENT '推荐首页标志 1-正常 2-推荐',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`microshop_store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微商城店铺街表';

-- ----------------------------
-- Records of tr_micro_store
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `tr_navigation`;
CREATE TABLE `tr_navigation` (
  `nav_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `nav_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类别，0自定义导航，1商品分类，2文章导航，3活动导航，默认为0',
  `nav_title` varchar(100) DEFAULT NULL COMMENT '导航标题',
  `nav_url` varchar(255) DEFAULT NULL COMMENT '导航链接',
  `nav_location` tinyint(1) NOT NULL DEFAULT '0' COMMENT '导航位置，0头部，1中部，2底部，默认为0',
  `nav_new_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否以新窗口打开，0为否，1为是，默认为0',
  `nav_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类别ID，对应着nav_type中的内容，默认为0',
  PRIMARY KEY (`nav_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='页面导航表';

-- ----------------------------
-- Records of tr_navigation
-- ----------------------------
INSERT INTO `tr_navigation` VALUES ('6', '0', '关于ShopNC', 'http://localhost/travel/shop/index.php?act=article&article_id=22', '2', '0', '255', '0');
INSERT INTO `tr_navigation` VALUES ('7', '0', '联系我们', 'http://localhost/travel/shop/index.php?act=article&article_id=23', '2', '0', '240', '0');
INSERT INTO `tr_navigation` VALUES ('8', '0', '合作及洽谈', 'http://localhost/travel/shop/index.php?act=article&article_id=25', '2', '0', '220', '0');
INSERT INTO `tr_navigation` VALUES ('9', '0', '招聘英才', 'http://localhost/travel/shop/index.php?act=article&article_id=24', '2', '0', '210', '0');
INSERT INTO `tr_navigation` VALUES ('11', '0', '门户', 'http://localhost/travel/cms', '1', '1', '255', '0');
INSERT INTO `tr_navigation` VALUES ('12', '0', '圈子', 'http://localhost/travel/circle', '1', '1', '255', '0');
INSERT INTO `tr_navigation` VALUES ('13', '0', '微商城', 'http://localhost/travel/microshop', '1', '1', '255', '0');

-- ----------------------------
-- Table structure for `tr_offpay_area`
-- ----------------------------
DROP TABLE IF EXISTS `tr_offpay_area`;
CREATE TABLE `tr_offpay_area` (
  `store_id` int(8) NOT NULL COMMENT '商家ID',
  `area_id` text COMMENT '县ID组合'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='货到付款支持地区表';

-- ----------------------------
-- Records of tr_offpay_area
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_order`
-- ----------------------------
DROP TABLE IF EXISTS `tr_order`;
CREATE TABLE `tr_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单索引id',
  `order_sn` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `pay_sn` bigint(20) unsigned NOT NULL COMMENT '支付单号',
  `store_id` int(11) unsigned NOT NULL COMMENT '卖家店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `buyer_id` int(11) unsigned NOT NULL COMMENT '买家id',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  `buyer_email` varchar(80) NOT NULL COMMENT '买家电子邮箱',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `payment_code` char(10) NOT NULL DEFAULT '' COMMENT '支付方式名称代码',
  `payment_time` int(10) unsigned DEFAULT '0' COMMENT '支付(付款)时间',
  `finnshed_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单完成时间',
  `goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品总价格',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `pd_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款支付金额',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `evaluation_state` enum('0','1') DEFAULT '0' COMMENT '评价状态 0未评价，1已评价',
  `order_state` enum('0','10','20','30','40') NOT NULL DEFAULT '10' COMMENT '订单状态：0(已取消)10(默认):未付款;20:已付款;30:已发货;40:已收货;',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态:0是无退款,1是部分退款,2是全部退款',
  `lock_state` tinyint(1) unsigned DEFAULT '0' COMMENT '锁定状态:0是正常,大于0是锁定,默认是0',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `delay_time` int(10) unsigned DEFAULT '0' COMMENT '延迟时间,默认为0',
  `order_from` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1WEB2mobile',
  `shipping_code` varchar(50) DEFAULT '' COMMENT '物流单号',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of tr_order
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_order_bill`
-- ----------------------------
DROP TABLE IF EXISTS `tr_order_bill`;
CREATE TABLE `tr_order_bill` (
  `ob_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '结算单编号(年月店铺ID)',
  `ob_start_date` int(11) NOT NULL COMMENT '开始日期',
  `ob_end_date` int(11) NOT NULL COMMENT '结束日期',
  `ob_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `ob_shipping_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `ob_order_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退单金额',
  `ob_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `ob_commis_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退还佣金',
  `ob_store_cost_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺促销活动费用',
  `ob_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应结金额',
  `ob_create_date` int(11) DEFAULT '0' COMMENT '生成结算单日期',
  `os_month` mediumint(6) unsigned NOT NULL COMMENT '结算单年月份',
  `ob_state` enum('1','2','3','4') DEFAULT '1' COMMENT '1默认2店家已确认3平台已审核4结算完成',
  `ob_pay_date` int(11) DEFAULT '0' COMMENT '付款日期',
  `ob_pay_content` varchar(200) DEFAULT '' COMMENT '支付备注',
  `ob_store_id` int(11) NOT NULL COMMENT '店铺ID',
  `ob_store_name` varchar(50) DEFAULT NULL COMMENT '店铺名',
  PRIMARY KEY (`ob_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='结算表';

-- ----------------------------
-- Records of tr_order_bill
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_order_common`
-- ----------------------------
DROP TABLE IF EXISTS `tr_order_common`;
CREATE TABLE `tr_order_common` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单索引id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配送时间',
  `shipping_express_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送公司ID',
  `evaluation_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价时间',
  `evalseller_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '卖家是否已评价买家',
  `evalseller_time` int(10) unsigned NOT NULL COMMENT '卖家评价买家的时间',
  `order_message` varchar(300) DEFAULT NULL COMMENT '订单留言',
  `order_pointscount` int(11) NOT NULL DEFAULT '0' COMMENT '订单赠送积分',
  `voucher_price` int(11) DEFAULT NULL COMMENT '代金券面额',
  `voucher_code` varchar(32) DEFAULT NULL COMMENT '代金券编码',
  `deliver_explain` text COMMENT '发货备注',
  `daddress_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '发货地址ID',
  `reciver_name` varchar(50) NOT NULL COMMENT '收货人姓名',
  `reciver_info` varchar(500) NOT NULL COMMENT '收货人其它信息',
  `reciver_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人省级ID',
  `invoice_info` varchar(500) DEFAULT '' COMMENT '发票信息',
  `promotion_info` varchar(500) DEFAULT '' COMMENT '促销信息备注',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单信息扩展表';

-- ----------------------------
-- Records of tr_order_common
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tr_order_goods`;
CREATE TABLE `tr_order_goods` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单商品表索引id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `goods_pay_price` decimal(10,2) unsigned NOT NULL COMMENT '商品实际成交价',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `goods_type` enum('1','2','3','4','5') NOT NULL DEFAULT '1' COMMENT '1默认2团购商品3限时折扣商品4组合套装5赠品',
  `promotions_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '促销活动ID（团购ID/限时折扣ID/优惠套装ID）与goods_type搭配使用',
  `commis_rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单商品表';

-- ----------------------------
-- Records of tr_order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `tr_order_log`;
CREATE TABLE `tr_order_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `log_msg` varchar(150) DEFAULT '' COMMENT '文字描述',
  `log_time` int(10) unsigned NOT NULL COMMENT '处理时间',
  `log_role` char(2) NOT NULL COMMENT '操作角色',
  `log_user` varchar(30) DEFAULT '' COMMENT '操作人',
  `log_orderstate` enum('0','10','20','30','40') DEFAULT NULL COMMENT '订单状态：0(已取消)10:未付款;20:已付款;30:已发货;40:已收货;',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单处理历史表';

-- ----------------------------
-- Records of tr_order_log
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_order_pay`
-- ----------------------------
DROP TABLE IF EXISTS `tr_order_pay`;
CREATE TABLE `tr_order_pay` (
  `pay_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_sn` bigint(20) unsigned NOT NULL COMMENT '支付单号',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `api_pay_state` enum('0','1') DEFAULT '0' COMMENT '0默认未支付1已支付(只有第三方支付接口通知到时才会更改此状态)',
  PRIMARY KEY (`pay_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单支付表';

-- ----------------------------
-- Records of tr_order_pay
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_order_statis`
-- ----------------------------
DROP TABLE IF EXISTS `tr_order_statis`;
CREATE TABLE `tr_order_statis` (
  `os_month` mediumint(9) unsigned NOT NULL DEFAULT '0' COMMENT '统计编号(年月)',
  `os_year` smallint(6) DEFAULT '0' COMMENT '年',
  `os_start_date` int(11) NOT NULL COMMENT '开始日期',
  `os_end_date` int(11) NOT NULL COMMENT '结束日期',
  `os_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `os_shipping_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `os_order_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退单金额',
  `os_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `os_commis_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退还佣金',
  `os_store_cost_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺促销活动费用',
  `os_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本期应结',
  `os_create_date` int(11) DEFAULT NULL COMMENT '创建记录日期',
  PRIMARY KEY (`os_month`),
  KEY `os_month` (`os_month`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='月销量统计表';

-- ----------------------------
-- Records of tr_order_statis
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_payment`
-- ----------------------------
DROP TABLE IF EXISTS `tr_payment`;
CREATE TABLE `tr_payment` (
  `payment_id` tinyint(1) unsigned NOT NULL COMMENT '支付索引id',
  `payment_code` char(10) NOT NULL COMMENT '支付代码名称',
  `payment_name` char(10) NOT NULL COMMENT '支付名称',
  `payment_config` text COMMENT '支付接口配置信息',
  `payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '接口状态0禁用1启用',
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支付方式表';

-- ----------------------------
-- Records of tr_payment
-- ----------------------------
INSERT INTO `tr_payment` VALUES ('1', 'offline', '货到付款', 'a:1:{s:0:\"\";s:0:\"\";}', '1');
INSERT INTO `tr_payment` VALUES ('2', 'alipay', '支付宝', 'a:4:{s:14:\"alipay_service\";s:25:\"create_direct_pay_by_user\";s:14:\"alipay_account\";s:0:\"\";s:10:\"alipay_key\";s:0:\"\";s:14:\"alipay_partner\";s:0:\"\";}', '1');
INSERT INTO `tr_payment` VALUES ('3', 'tenpay', '财付通', 'a:2:{s:14:\"tenpay_account\";s:0:\"\";s:10:\"tenpay_key\";s:0:\"\";}', '1');
INSERT INTO `tr_payment` VALUES ('4', 'chinabank', '网银在线', 'a:2:{s:17:\"chinabank_account\";s:0:\"\";s:13:\"chinabank_key\";s:0:\"\";}', '1');
INSERT INTO `tr_payment` VALUES ('5', 'predeposit', '预存款', 'a:1:{s:0:\"\";s:0:\"\";}', '1');

-- ----------------------------
-- Table structure for `tr_pd_cash`
-- ----------------------------
DROP TABLE IF EXISTS `tr_pd_cash`;
CREATE TABLE `tr_pd_cash` (
  `pdc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `pdc_sn` bigint(20) NOT NULL COMMENT '记录唯一标示',
  `pdc_member_id` int(11) NOT NULL COMMENT '会员编号',
  `pdc_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `pdc_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `pdc_bank_name` varchar(40) NOT NULL COMMENT '收款银行',
  `pdc_bank_no` varchar(30) DEFAULT NULL COMMENT '收款账号',
  `pdc_bank_user` varchar(10) DEFAULT NULL COMMENT '开户人姓名',
  `pdc_add_time` int(11) NOT NULL COMMENT '添加时间',
  `pdc_payment_time` int(11) DEFAULT NULL COMMENT '付款时间',
  `pdc_payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '提现支付状态 0默认1支付完成',
  `pdc_payment_admin` varchar(30) DEFAULT NULL COMMENT '支付管理员',
  PRIMARY KEY (`pdc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='预存款提现记录表';

-- ----------------------------
-- Records of tr_pd_cash
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_pd_log`
-- ----------------------------
DROP TABLE IF EXISTS `tr_pd_log`;
CREATE TABLE `tr_pd_log` (
  `lg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `lg_member_id` int(11) NOT NULL COMMENT '会员编号',
  `lg_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `lg_admin_name` varchar(50) DEFAULT NULL COMMENT '管理员名称',
  `lg_type` varchar(15) NOT NULL DEFAULT '' COMMENT 'order_pay下单支付预存款,order_freeze下单冻结预存款,order_cancel取消订单解冻预存款,order_comb_pay下单支付被冻结的预存款,recharge充值,cash_apply申请提现冻结预存款,cash_pay提现成功,cash_del取消提现申请，解冻预存款,refund退款',
  `lg_av_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可用金额变更0表示未变更',
  `lg_freeze_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结金额变更0表示未变更',
  `lg_add_time` int(11) NOT NULL COMMENT '添加时间',
  `lg_desc` varchar(150) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`lg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='预存款变更日志表';

-- ----------------------------
-- Records of tr_pd_log
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_pd_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `tr_pd_recharge`;
CREATE TABLE `tr_pd_recharge` (
  `pdr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `pdr_sn` bigint(20) unsigned NOT NULL COMMENT '记录唯一标示',
  `pdr_member_id` int(11) NOT NULL COMMENT '会员编号',
  `pdr_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `pdr_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `pdr_payment_code` varchar(20) DEFAULT '' COMMENT '支付方式',
  `pdr_payment_name` varchar(15) DEFAULT '' COMMENT '支付方式',
  `pdr_trade_sn` varchar(50) DEFAULT '' COMMENT '第三方支付接口交易号',
  `pdr_add_time` int(11) NOT NULL COMMENT '添加时间',
  `pdr_payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付1支付',
  `pdr_payment_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pdr_admin` varchar(30) DEFAULT '' COMMENT '管理员名',
  PRIMARY KEY (`pdr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='预存款充值表';

-- ----------------------------
-- Records of tr_pd_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_points_cart`
-- ----------------------------
DROP TABLE IF EXISTS `tr_points_cart`;
CREATE TABLE `tr_points_cart` (
  `pcart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `pmember_id` int(11) NOT NULL COMMENT '会员编号',
  `pgoods_id` int(11) NOT NULL COMMENT '积分礼品序号',
  `pgoods_name` varchar(100) NOT NULL COMMENT '积分礼品名称',
  `pgoods_points` int(11) NOT NULL COMMENT '积分礼品兑换积分',
  `pgoods_choosenum` int(11) NOT NULL COMMENT '选择积分礼品数量',
  `pgoods_image` varchar(100) DEFAULT NULL COMMENT '积分礼品图片',
  PRIMARY KEY (`pcart_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分礼品兑换购物车';

-- ----------------------------
-- Records of tr_points_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_points_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tr_points_goods`;
CREATE TABLE `tr_points_goods` (
  `pgoods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分礼品索引id',
  `pgoods_name` varchar(100) NOT NULL COMMENT '积分礼品名称',
  `pgoods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '积分礼品原价',
  `pgoods_points` int(11) NOT NULL COMMENT '积分礼品兑换所需积分',
  `pgoods_image` varchar(100) NOT NULL COMMENT '积分礼品默认封面图片',
  `pgoods_tag` varchar(100) NOT NULL COMMENT '积分礼品标签',
  `pgoods_serial` varchar(50) NOT NULL COMMENT '积分礼品货号',
  `pgoods_storage` int(11) NOT NULL DEFAULT '0' COMMENT '积分礼品库存数',
  `pgoods_show` tinyint(1) NOT NULL COMMENT '积分礼品上架 0表示下架 1表示上架',
  `pgoods_commend` tinyint(1) NOT NULL COMMENT '积分礼品推荐',
  `pgoods_add_time` int(11) NOT NULL COMMENT '积分礼品添加时间',
  `pgoods_keywords` varchar(100) DEFAULT NULL COMMENT '积分礼品关键字',
  `pgoods_description` varchar(200) DEFAULT NULL COMMENT '积分礼品描述',
  `pgoods_body` text NOT NULL COMMENT '积分礼品详细内容',
  `pgoods_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '积分礼品状态，0开启，1禁售',
  `pgoods_close_reason` varchar(255) DEFAULT NULL COMMENT '积分礼品禁售原因',
  `pgoods_salenum` int(11) NOT NULL DEFAULT '0' COMMENT '积分礼品售出数量',
  `pgoods_view` int(11) NOT NULL DEFAULT '0' COMMENT '积分商品浏览次数',
  `pgoods_islimit` tinyint(1) NOT NULL COMMENT '是否限制每会员兑换数量',
  `pgoods_limitnum` int(11) DEFAULT NULL COMMENT '每会员限制兑换数量',
  `pgoods_islimittime` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制兑换时间 0为不限制 1为限制',
  `pgoods_starttime` int(11) DEFAULT NULL COMMENT '兑换开始时间',
  `pgoods_endtime` int(11) DEFAULT NULL COMMENT '兑换结束时间',
  `pgoods_sort` int(11) NOT NULL DEFAULT '0' COMMENT '礼品排序',
  PRIMARY KEY (`pgoods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分礼品表';

-- ----------------------------
-- Records of tr_points_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_points_log`
-- ----------------------------
DROP TABLE IF EXISTS `tr_points_log`;
CREATE TABLE `tr_points_log` (
  `pl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分日志编号',
  `pl_memberid` int(11) NOT NULL COMMENT '会员编号',
  `pl_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `pl_adminid` int(11) DEFAULT NULL COMMENT '管理员编号',
  `pl_adminname` varchar(100) DEFAULT NULL COMMENT '管理员名称',
  `pl_points` int(11) NOT NULL DEFAULT '0' COMMENT '积分数负数表示扣除',
  `pl_addtime` int(11) NOT NULL COMMENT '添加时间',
  `pl_desc` varchar(100) NOT NULL COMMENT '操作描述',
  `pl_stage` varchar(50) NOT NULL COMMENT '操作阶段',
  PRIMARY KEY (`pl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员积分日志表';

-- ----------------------------
-- Records of tr_points_log
-- ----------------------------
INSERT INTO `tr_points_log` VALUES ('1', '2', 'test', null, null, '20', '1432693263', '注册会员', 'regist');
INSERT INTO `tr_points_log` VALUES ('2', '2', 'test', null, null, '30', '1432780572', '会员登录', 'login');
INSERT INTO `tr_points_log` VALUES ('3', '2', 'test', null, null, '30', '1432885116', '会员登录', 'login');
INSERT INTO `tr_points_log` VALUES ('4', '2', 'test', null, null, '30', '1433216130', '会员登录', 'login');
INSERT INTO `tr_points_log` VALUES ('5', '2', 'test', null, null, '30', '1433310201', '会员登录', 'login');
INSERT INTO `tr_points_log` VALUES ('6', '2', 'test', null, null, '30', '1433406968', '会员登录', 'login');

-- ----------------------------
-- Table structure for `tr_points_order`
-- ----------------------------
DROP TABLE IF EXISTS `tr_points_order`;
CREATE TABLE `tr_points_order` (
  `point_orderid` int(11) NOT NULL AUTO_INCREMENT COMMENT '兑换订单编号',
  `point_ordersn` varchar(100) NOT NULL COMMENT '兑换订单编号',
  `point_buyerid` int(11) NOT NULL COMMENT '兑换会员id',
  `point_buyername` varchar(50) NOT NULL COMMENT '兑换会员姓名',
  `point_buyeremail` varchar(100) NOT NULL COMMENT '兑换会员email',
  `point_addtime` int(11) NOT NULL COMMENT '兑换订单生成时间',
  `point_paymentid` int(11) NOT NULL COMMENT '支付方式id',
  `point_paymentname` varchar(50) NOT NULL COMMENT '支付方式名称',
  `point_paymentcode` varchar(50) NOT NULL COMMENT '支付方式名称代码',
  `point_paymentdirect` tinyint(1) DEFAULT '1' COMMENT '支付类型:1是即时到帐,2是但保交易',
  `point_outsn` varchar(100) NOT NULL COMMENT '订单编号，外部支付时使用，有些外部支付系统要求特定的订单编号',
  `point_paymenttime` int(11) DEFAULT NULL COMMENT '支付(付款)时间',
  `point_paymessage` varchar(300) DEFAULT NULL COMMENT '支付留言',
  `point_shippingtime` int(11) DEFAULT NULL COMMENT '配送时间',
  `point_shippingcode` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `point_shippingdesc` varchar(500) DEFAULT NULL COMMENT '发货描述',
  `point_outpaymentcode` varchar(255) DEFAULT NULL COMMENT '外部交易平台单独使用的标识字符串',
  `point_finnshedtime` int(11) DEFAULT NULL COMMENT '订单完成时间',
  `point_allpoint` int(11) NOT NULL DEFAULT '0' COMMENT '兑换总积分',
  `point_orderamount` decimal(10,2) NOT NULL COMMENT '兑换订单总金额',
  `point_shippingcharge` tinyint(1) NOT NULL DEFAULT '0' COMMENT '运费承担方式 0表示卖家 1表示买家',
  `point_shippingfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费金额',
  `point_ordermessage` varchar(300) DEFAULT NULL COMMENT '订单留言',
  `point_orderstate` int(11) NOT NULL DEFAULT '10' COMMENT '订单状态：10(默认):未付款;11已付款;20:确认付款;30:已发货;40:已收货;50已完成;2已取消',
  PRIMARY KEY (`point_orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='兑换订单表';

-- ----------------------------
-- Records of tr_points_order
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_points_orderaddress`
-- ----------------------------
DROP TABLE IF EXISTS `tr_points_orderaddress`;
CREATE TABLE `tr_points_orderaddress` (
  `point_oaid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `point_orderid` int(11) NOT NULL COMMENT '订单id',
  `point_truename` varchar(50) NOT NULL COMMENT '收货人姓名',
  `point_areaid` int(11) NOT NULL COMMENT '地区id',
  `point_areainfo` varchar(100) NOT NULL COMMENT '地区内容',
  `point_address` varchar(200) NOT NULL COMMENT '详细地址',
  `point_zipcode` varchar(20) NOT NULL COMMENT '邮政编码',
  `point_telphone` varchar(20) NOT NULL COMMENT '电话号码',
  `point_mobphone` varchar(20) NOT NULL COMMENT '手机号码',
  PRIMARY KEY (`point_oaid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='兑换订单地址表';

-- ----------------------------
-- Records of tr_points_orderaddress
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_points_ordergoods`
-- ----------------------------
DROP TABLE IF EXISTS `tr_points_ordergoods`;
CREATE TABLE `tr_points_ordergoods` (
  `point_recid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单礼品表索引',
  `point_orderid` int(11) NOT NULL COMMENT '订单id',
  `point_goodsid` int(11) NOT NULL COMMENT '礼品id',
  `point_goodsname` varchar(100) NOT NULL COMMENT '礼品名称',
  `point_goodspoints` int(11) NOT NULL COMMENT '礼品兑换积分',
  `point_goodsnum` int(11) NOT NULL COMMENT '礼品数量',
  `point_goodsimage` varchar(100) DEFAULT NULL COMMENT '礼品图片',
  PRIMARY KEY (`point_recid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='兑换订单商品表';

-- ----------------------------
-- Records of tr_points_ordergoods
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_p_booth_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tr_p_booth_goods`;
CREATE TABLE `tr_p_booth_goods` (
  `booth_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '套餐商品id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `booth_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '套餐状态 1开启 0关闭 默认1',
  PRIMARY KEY (`booth_goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='展位商品表';

-- ----------------------------
-- Records of tr_p_booth_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_p_booth_quota`
-- ----------------------------
DROP TABLE IF EXISTS `tr_p_booth_quota`;
CREATE TABLE `tr_p_booth_quota` (
  `booth_quota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '套餐id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `booth_quota_starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `booth_quota_endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  `booth_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '套餐状态 1开启 0关闭 默认1',
  PRIMARY KEY (`booth_quota_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='展位套餐表';

-- ----------------------------
-- Records of tr_p_booth_quota
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_p_bundling`
-- ----------------------------
DROP TABLE IF EXISTS `tr_p_bundling`;
CREATE TABLE `tr_p_bundling` (
  `bl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合ID',
  `bl_name` varchar(50) NOT NULL COMMENT '组合名称',
  `store_id` int(11) NOT NULL COMMENT '店铺名称',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `bl_discount_price` decimal(10,2) NOT NULL COMMENT '组合价格',
  `bl_freight_choose` tinyint(1) NOT NULL COMMENT '运费承担方式',
  `bl_freight` decimal(10,2) NOT NULL COMMENT '运费',
  `bl_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组合状态 0-关闭/1-开启',
  PRIMARY KEY (`bl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组合销售活动表';

-- ----------------------------
-- Records of tr_p_bundling
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_p_bundling_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tr_p_bundling_goods`;
CREATE TABLE `tr_p_bundling_goods` (
  `bl_goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合商品id',
  `bl_id` int(11) NOT NULL COMMENT '组合id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  `bl_goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `bl_appoint` tinyint(3) unsigned NOT NULL COMMENT '指定商品 1是，0否',
  PRIMARY KEY (`bl_goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组合销售活动商品表';

-- ----------------------------
-- Records of tr_p_bundling_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_p_bundling_quota`
-- ----------------------------
DROP TABLE IF EXISTS `tr_p_bundling_quota`;
CREATE TABLE `tr_p_bundling_quota` (
  `bl_quota_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '套餐ID',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `bl_quota_month` tinyint(3) unsigned NOT NULL COMMENT '购买数量（单位月）',
  `bl_quota_starttime` varchar(10) NOT NULL COMMENT '套餐开始时间',
  `bl_quota_endtime` varchar(10) NOT NULL COMMENT '套餐结束时间',
  `bl_state` tinyint(1) unsigned NOT NULL COMMENT '套餐状态：0关闭，1开启。默认为 1',
  PRIMARY KEY (`bl_quota_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组合销售套餐表';

-- ----------------------------
-- Records of tr_p_bundling_quota
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_p_mansong`
-- ----------------------------
DROP TABLE IF EXISTS `tr_p_mansong`;
CREATE TABLE `tr_p_mansong` (
  `mansong_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满送活动编号',
  `mansong_name` varchar(50) NOT NULL COMMENT '活动名称',
  `quota_id` int(10) unsigned NOT NULL COMMENT '套餐编号',
  `start_time` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `state` tinyint(1) unsigned NOT NULL COMMENT '活动状态(1-未发布/2-正常/3-取消/4-失效/5-结束)',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  PRIMARY KEY (`mansong_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='满就送活动表';

-- ----------------------------
-- Records of tr_p_mansong
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_p_mansong_quota`
-- ----------------------------
DROP TABLE IF EXISTS `tr_p_mansong_quota`;
CREATE TABLE `tr_p_mansong_quota` (
  `quota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满就送套餐编号',
  `apply_id` int(10) unsigned NOT NULL COMMENT '申请编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `state` tinyint(1) unsigned NOT NULL COMMENT '配额状态(1-可用/2-取消/3-结束)',
  PRIMARY KEY (`quota_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='满就送套餐表';

-- ----------------------------
-- Records of tr_p_mansong_quota
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_p_mansong_rule`
-- ----------------------------
DROP TABLE IF EXISTS `tr_p_mansong_rule`;
CREATE TABLE `tr_p_mansong_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则编号',
  `mansong_id` int(10) unsigned NOT NULL COMMENT '活动编号',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '级别价格',
  `discount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '减现金优惠金额',
  `mansong_goods_name` varchar(50) NOT NULL COMMENT '礼品名称',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品编号',
  PRIMARY KEY (`rule_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='满就送活动规则表';

-- ----------------------------
-- Records of tr_p_mansong_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_p_xianshi`
-- ----------------------------
DROP TABLE IF EXISTS `tr_p_xianshi`;
CREATE TABLE `tr_p_xianshi` (
  `xianshi_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时编号',
  `xianshi_name` varchar(50) NOT NULL COMMENT '活动名称',
  `xianshi_title` varchar(10) DEFAULT NULL COMMENT '活动标题',
  `xianshi_explain` varchar(50) DEFAULT NULL COMMENT '活动说明',
  `quota_id` int(10) unsigned NOT NULL COMMENT '套餐编号',
  `start_time` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `lower_limit` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '购买下限，1为不限制',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0-取消 1-正常',
  PRIMARY KEY (`xianshi_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='限时折扣活动表';

-- ----------------------------
-- Records of tr_p_xianshi
-- ----------------------------
INSERT INTO `tr_p_xianshi` VALUES ('7', '2013年款 清仓促销', '月末折扣', '挥泪大甩卖', '5', '1389167520', '1417968000', '1', '1', 'feng', '官方店铺', '2', '1');

-- ----------------------------
-- Table structure for `tr_p_xianshi_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tr_p_xianshi_goods`;
CREATE TABLE `tr_p_xianshi_goods` (
  `xianshi_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣商品表',
  `xianshi_id` int(10) unsigned NOT NULL COMMENT '限时活动编号',
  `xianshi_name` varchar(50) NOT NULL COMMENT '活动名称',
  `xianshi_title` varchar(10) DEFAULT NULL COMMENT '活动标题',
  `xianshi_explain` varchar(50) DEFAULT NULL COMMENT '活动说明',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '店铺价格',
  `xianshi_price` decimal(10,2) NOT NULL COMMENT '限时折扣价格',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `lower_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买下限，0为不限制',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0-取消 1-正常',
  `xianshi_recommend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '推荐标志 0-未推荐 1-已推荐',
  PRIMARY KEY (`xianshi_goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='限时折扣商品表';

-- ----------------------------
-- Records of tr_p_xianshi_goods
-- ----------------------------
INSERT INTO `tr_p_xianshi_goods` VALUES ('24', '7', '2013年款 清仓促销', '月末折扣', '挥泪大甩卖', '49', '1', '春装 披肩式 超短款 针织 衫开衫 女装 青鸟 黑色', '129.00', '100.00', '1_04418240955916042.jpg', '1389167520', '1417968000', '2', '1', '0');
INSERT INTO `tr_p_xianshi_goods` VALUES ('25', '7', '2013年款 清仓促销', '月末折扣', '挥泪大甩卖', '52', '1', '新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 白色', '99.00', '58.00', '1_04418253240878850.jpg', '1389167520', '1417968000', '2', '1', '0');
INSERT INTO `tr_p_xianshi_goods` VALUES ('26', '7', '2013年款 清仓促销', '月末折扣', '挥泪大甩卖', '38', '1', '正品 2014春装新款 女 绣花针织衫 开衫外套浮桑初 蓝色', '189.00', '158.00', '1_04418207207476705.jpg', '1389167520', '1417968000', '2', '1', '0');

-- ----------------------------
-- Table structure for `tr_p_xianshi_quota`
-- ----------------------------
DROP TABLE IF EXISTS `tr_p_xianshi_quota`;
CREATE TABLE `tr_p_xianshi_quota` (
  `quota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣套餐编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '套餐开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '套餐结束时间',
  PRIMARY KEY (`quota_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='限时折扣套餐表';

-- ----------------------------
-- Records of tr_p_xianshi_quota
-- ----------------------------
INSERT INTO `tr_p_xianshi_quota` VALUES ('5', '1', '1', 'shopnc', '官方店铺', '1389167180', '1420271180');

-- ----------------------------
-- Table structure for `tr_rec_position`
-- ----------------------------
DROP TABLE IF EXISTS `tr_rec_position`;
CREATE TABLE `tr_rec_position` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pic_type` enum('1','2','0') NOT NULL DEFAULT '1' COMMENT '0文字1本地图片2远程',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '序列化推荐位内容',
  PRIMARY KEY (`rec_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推荐位';

-- ----------------------------
-- Records of tr_rec_position
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_refund_return`
-- ----------------------------
DROP TABLE IF EXISTS `tr_refund_return`;
CREATE TABLE `tr_refund_return` (
  `refund_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `order_sn` varchar(50) NOT NULL COMMENT '订单编号',
  `refund_sn` varchar(50) NOT NULL COMMENT '申请编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家会员名',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID,全部退款是0',
  `order_goods_id` int(10) unsigned DEFAULT '0' COMMENT '订单商品ID,全部退款是0',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_num` int(10) unsigned DEFAULT '1' COMMENT '商品数量',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `order_goods_type` tinyint(1) unsigned DEFAULT '1' COMMENT '订单商品类型:1默认2团购商品3限时折扣商品4组合套装',
  `refund_type` tinyint(1) unsigned DEFAULT '1' COMMENT '申请类型:1为退款,2为退货,默认为1',
  `seller_state` tinyint(1) unsigned DEFAULT '1' COMMENT '卖家处理状态:1为待审核,2为同意,3为不同意,默认为1',
  `refund_state` tinyint(1) unsigned DEFAULT '1' COMMENT '申请状态:1为处理中,2为待管理员处理,3为已完成,默认为1',
  `return_type` tinyint(1) unsigned DEFAULT '1' COMMENT '退货类型:1为不用退货,2为需要退货,默认为1',
  `order_lock` tinyint(1) unsigned DEFAULT '1' COMMENT '订单锁定类型:1为不用锁定,2为需要锁定,默认为1',
  `goods_state` tinyint(1) unsigned DEFAULT '1' COMMENT '物流状态:1为待发货,2为待收货,3为未收到,4为已收货,默认为1',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `seller_time` int(10) unsigned DEFAULT '0' COMMENT '卖家处理时间',
  `admin_time` int(10) unsigned DEFAULT '0' COMMENT '管理员处理时间,默认为0',
  `buyer_message` varchar(300) DEFAULT NULL COMMENT '申请原因',
  `seller_message` varchar(300) DEFAULT NULL COMMENT '卖家备注',
  `admin_message` varchar(300) DEFAULT NULL COMMENT '管理员备注',
  `express_id` tinyint(1) unsigned DEFAULT '0' COMMENT '物流公司编号',
  `invoice_no` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `ship_time` int(10) unsigned DEFAULT '0' COMMENT '发货时间,默认为0',
  `delay_time` int(10) unsigned DEFAULT '0' COMMENT '收货延迟时间,默认为0',
  `receive_time` int(10) unsigned DEFAULT '0' COMMENT '收货时间,默认为0',
  `receive_message` varchar(300) DEFAULT NULL COMMENT '收货备注',
  `commis_rate` smallint(6) DEFAULT '0' COMMENT '佣金比例',
  PRIMARY KEY (`refund_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='退款退货表';

-- ----------------------------
-- Records of tr_refund_return
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_salenum`
-- ----------------------------
DROP TABLE IF EXISTS `tr_salenum`;
CREATE TABLE `tr_salenum` (
  `date` int(8) unsigned NOT NULL COMMENT '销售日期',
  `salenum` int(11) unsigned NOT NULL COMMENT '销量',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='销量统计表';

-- ----------------------------
-- Records of tr_salenum
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_seller`
-- ----------------------------
DROP TABLE IF EXISTS `tr_seller`;
CREATE TABLE `tr_seller` (
  `seller_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家编号',
  `seller_name` varchar(50) NOT NULL COMMENT '卖家用户名',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `seller_group_id` int(10) unsigned NOT NULL COMMENT '卖家组编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `is_admin` tinyint(3) unsigned NOT NULL COMMENT '是否管理员(0-不是 1-是)',
  `seller_quicklink` varchar(255) DEFAULT NULL COMMENT '卖家快捷操作',
  `last_login_time` int(10) unsigned DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`seller_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='卖家用户表';

-- ----------------------------
-- Records of tr_seller
-- ----------------------------
INSERT INTO `tr_seller` VALUES ('1', 'shopnc_seller', '1', '0', '1', '1', ',store_goods_add,store_goods_online,store_goods_offline,store_order,store_deliver_set,store_groupbuy,store_promotion_xianshi', '1389835714');
INSERT INTO `tr_seller` VALUES ('2', 'test', '2', '0', '2', '1', null, '1433216173');

-- ----------------------------
-- Table structure for `tr_seller_group`
-- ----------------------------
DROP TABLE IF EXISTS `tr_seller_group`;
CREATE TABLE `tr_seller_group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家组编号',
  `group_name` varchar(50) NOT NULL COMMENT '组名',
  `limits` text NOT NULL COMMENT '权限',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='卖家用户组表';

-- ----------------------------
-- Records of tr_seller_group
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_seller_log`
-- ----------------------------
DROP TABLE IF EXISTS `tr_seller_log`;
CREATE TABLE `tr_seller_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `log_content` varchar(50) NOT NULL COMMENT '日志内容',
  `log_time` int(10) unsigned NOT NULL COMMENT '日志时间',
  `log_seller_id` int(10) unsigned NOT NULL COMMENT '卖家编号',
  `log_seller_name` varchar(50) NOT NULL COMMENT '卖家帐号',
  `log_store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `log_seller_ip` varchar(50) NOT NULL COMMENT '卖家ip',
  `log_url` varchar(50) NOT NULL COMMENT '日志url',
  `log_state` tinyint(3) unsigned NOT NULL COMMENT '日志状态(0-失败 1-成功)',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='卖家日志表';

-- ----------------------------
-- Records of tr_seller_log
-- ----------------------------
INSERT INTO `tr_seller_log` VALUES ('1', '登录成功', '1432885583', '2', 'test', '2', '', 'seller_login&login', '1');
INSERT INTO `tr_seller_log` VALUES ('2', '添加商品，平台货号:100087', '1432886130', '2', 'test', '2', '', 'store_goods_add&save_goods', '1');
INSERT INTO `tr_seller_log` VALUES ('3', '编辑商品，平台货号：100087', '1432886399', '2', 'test', '2', '', 'store_goods_online&edit_save_goods', '1');
INSERT INTO `tr_seller_log` VALUES ('4', '编辑商品，平台货号：100087', '1432886433', '2', 'test', '2', '', 'store_goods_online&edit_save_goods', '1');
INSERT INTO `tr_seller_log` VALUES ('5', '登录成功', '1433216173', '2', 'test', '2', '192.168.1.201', 'seller_login&login', '1');

-- ----------------------------
-- Table structure for `tr_seo`
-- ----------------------------
DROP TABLE IF EXISTS `tr_seo`;
CREATE TABLE `tr_seo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `description` text NOT NULL COMMENT '描述',
  `type` varchar(20) NOT NULL COMMENT '类型',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='SEO信息存放表';

-- ----------------------------
-- Records of tr_seo
-- ----------------------------
INSERT INTO `tr_seo` VALUES ('1', '{sitename}', '', '', 'index');
INSERT INTO `tr_seo` VALUES ('2', '{sitename} - 团购', 'ShopNC,{sitename}', 'ShopNC专注于研发符合时代发展需要的电子商务商城系统，以专业化的服务水平为企业级用户提供B(2B)2C【B2B2C】电子商务平台解决方案，全力打造电商平台专项ERP(CRM)系统、ERP(RFID)系统等，引领中国电子商务行业企业级需求的发展方向。咨询电话：400-611-5098', 'group');
INSERT INTO `tr_seo` VALUES ('3', '{sitename} - {name}', 'ShopNC,{name},{sitename}', 'ShopNC,{name},{sitename}', 'group_content');
INSERT INTO `tr_seo` VALUES ('4', '{sitename} - 品牌', 'ShopNC,{sitename}', 'ShopNC,{sitename}', 'brand');
INSERT INTO `tr_seo` VALUES ('5', '{sitename} - {name}', 'ShopNC,{sitename},{name}', 'ShopNC,{sitename},{name}', 'brand_list');
INSERT INTO `tr_seo` VALUES ('7', '{sitename} - {name}', 'ShopNC,{sitename},{name}', 'ShopNC,{sitename},{name}', 'coupon_content');
INSERT INTO `tr_seo` VALUES ('8', '{sitename} - 积分商城', 'ShopNC,{sitename}', 'ShopNC,{sitename}', 'point');
INSERT INTO `tr_seo` VALUES ('9', '{sitename} - {name}', 'ShopNC,{sitename},{key}', 'ShopNC,{sitename},{description}', 'point_content');
INSERT INTO `tr_seo` VALUES ('10', '{sitename} - {article_class}', 'ShopNC,{sitename}', 'ShopNC,{sitename}', 'article');
INSERT INTO `tr_seo` VALUES ('11', '{sitename} - {name}', 'ShopNC,{sitename},{key}', 'ShopNC,{sitename},{description}', 'article_content');
INSERT INTO `tr_seo` VALUES ('12', '{sitename} - {shopname}', 'ShopNC,{sitename},{key}', 'ShopNC,{sitename},{description}', 'shop');
INSERT INTO `tr_seo` VALUES ('13', '{name} - {sitename}', 'ShopNC,{sitename},{key}', 'ShopNC,{sitename},{description}', 'product');
INSERT INTO `tr_seo` VALUES ('14', '看{name}怎么淘到好的宝贝-{sitename}', 'ShopNC,{sitename},{name}', 'ShopNC,{sitename},{name}', 'sns');

-- ----------------------------
-- Table structure for `tr_setting`
-- ----------------------------
DROP TABLE IF EXISTS `tr_setting`;
CREATE TABLE `tr_setting` (
  `name` varchar(50) NOT NULL COMMENT '名称',
  `value` text COMMENT '值',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统设置表';

-- ----------------------------
-- Records of tr_setting
-- ----------------------------
INSERT INTO `tr_setting` VALUES ('captcha_status_goodsqa', '1');
INSERT INTO `tr_setting` VALUES ('captcha_status_login', '1');
INSERT INTO `tr_setting` VALUES ('captcha_status_register', '1');
INSERT INTO `tr_setting` VALUES ('closed_reason', '升级中……');
INSERT INTO `tr_setting` VALUES ('complain_time_limit', '2592000');
INSERT INTO `tr_setting` VALUES ('default_goods_image', 'default_goods_image.gif');
INSERT INTO `tr_setting` VALUES ('default_store_logo', 'default_store_logo.gif');
INSERT INTO `tr_setting` VALUES ('default_user_portrait', 'default_user_portrait.gif');
INSERT INTO `tr_setting` VALUES ('email_addr', '');
INSERT INTO `tr_setting` VALUES ('email_enabled', '0');
INSERT INTO `tr_setting` VALUES ('email_host', '');
INSERT INTO `tr_setting` VALUES ('email_id', '');
INSERT INTO `tr_setting` VALUES ('email_pass', '');
INSERT INTO `tr_setting` VALUES ('email_port', '25');
INSERT INTO `tr_setting` VALUES ('email_type', '1');
INSERT INTO `tr_setting` VALUES ('enabled_subdomain', '0');
INSERT INTO `tr_setting` VALUES ('goods_verify', '0');
INSERT INTO `tr_setting` VALUES ('groupbuy_allow', '1');
INSERT INTO `tr_setting` VALUES ('groupbuy_price', '10');
INSERT INTO `tr_setting` VALUES ('groupbuy_review_day', '0');
INSERT INTO `tr_setting` VALUES ('guest_comment', '1');
INSERT INTO `tr_setting` VALUES ('hot_search', '周大福,内衣,金史密斯,手机');
INSERT INTO `tr_setting` VALUES ('icp_number', '');
INSERT INTO `tr_setting` VALUES ('image_allow_ext', 'gif,jpg,jpeg,bmp,png,swf');
INSERT INTO `tr_setting` VALUES ('image_dir_type', '1');
INSERT INTO `tr_setting` VALUES ('image_max_filesize', '1024');
INSERT INTO `tr_setting` VALUES ('login_pic', 'a:4:{i:0;s:5:\"1.jpg\";i:1;s:5:\"2.jpg\";i:2;s:5:\"3.jpg\";i:3;s:5:\"4.jpg\";}');
INSERT INTO `tr_setting` VALUES ('malbum_max_sum', '200');
INSERT INTO `tr_setting` VALUES ('md5_key', '24567bc9c2e7b3dc207c89af2db4e112');
INSERT INTO `tr_setting` VALUES ('member_logo', 'user_center.png');
INSERT INTO `tr_setting` VALUES ('pointprod_isuse', '1');
INSERT INTO `tr_setting` VALUES ('pointshop_isuse', '1');
INSERT INTO `tr_setting` VALUES ('points_comments', '50');
INSERT INTO `tr_setting` VALUES ('points_isuse', '1');
INSERT INTO `tr_setting` VALUES ('points_login', '30');
INSERT INTO `tr_setting` VALUES ('points_ordermax', '800');
INSERT INTO `tr_setting` VALUES ('points_orderrate', '20');
INSERT INTO `tr_setting` VALUES ('points_reg', '20');
INSERT INTO `tr_setting` VALUES ('promotion_allow', '1');
INSERT INTO `tr_setting` VALUES ('promotion_booth_goods_sum', '10');
INSERT INTO `tr_setting` VALUES ('promotion_booth_price', '20');
INSERT INTO `tr_setting` VALUES ('promotion_bundling_goods_sum', '5');
INSERT INTO `tr_setting` VALUES ('promotion_bundling_price', '20');
INSERT INTO `tr_setting` VALUES ('promotion_bundling_sum', '50');
INSERT INTO `tr_setting` VALUES ('promotion_mansong_price', '20');
INSERT INTO `tr_setting` VALUES ('promotion_voucher_buyertimes_limit', '5');
INSERT INTO `tr_setting` VALUES ('promotion_voucher_default_styleimg', 'default_voucher.jpg');
INSERT INTO `tr_setting` VALUES ('promotion_voucher_price', '20');
INSERT INTO `tr_setting` VALUES ('promotion_voucher_storetimes_limit', '20');
INSERT INTO `tr_setting` VALUES ('promotion_xianshi_price', '11');
INSERT INTO `tr_setting` VALUES ('qq_appcode', '');
INSERT INTO `tr_setting` VALUES ('qq_appid', '');
INSERT INTO `tr_setting` VALUES ('qq_appkey', '');
INSERT INTO `tr_setting` VALUES ('qq_isuse', '0');
INSERT INTO `tr_setting` VALUES ('seller_center_logo', 'seller_center_logo.png');
INSERT INTO `tr_setting` VALUES ('share_isuse', '1');
INSERT INTO `tr_setting` VALUES ('share_qqweibo_appid', '');
INSERT INTO `tr_setting` VALUES ('share_qqweibo_appkey', '');
INSERT INTO `tr_setting` VALUES ('share_qqweibo_isuse', '1');
INSERT INTO `tr_setting` VALUES ('share_qqzone_appcode', '');
INSERT INTO `tr_setting` VALUES ('share_qqzone_appid', '');
INSERT INTO `tr_setting` VALUES ('share_qqzone_appkey', '');
INSERT INTO `tr_setting` VALUES ('share_qqzone_isuse', '1');
INSERT INTO `tr_setting` VALUES ('share_sinaweibo_appcode', '');
INSERT INTO `tr_setting` VALUES ('share_sinaweibo_appid', '');
INSERT INTO `tr_setting` VALUES ('share_sinaweibo_appkey', '');
INSERT INTO `tr_setting` VALUES ('share_sinaweibo_isuse', '1');
INSERT INTO `tr_setting` VALUES ('sina_appcode', '');
INSERT INTO `tr_setting` VALUES ('sina_isuse', '0');
INSERT INTO `tr_setting` VALUES ('sina_wb_akey', '');
INSERT INTO `tr_setting` VALUES ('sina_wb_skey', '');
INSERT INTO `tr_setting` VALUES ('site_bank_account', '银行:中国银行,币种:人民币,账号:xxxxxxxxxxx,姓名:ShopNC,开户行:中国银行天津分行');
INSERT INTO `tr_setting` VALUES ('site_email', 'abc@shopnc.net');
INSERT INTO `tr_setting` VALUES ('site_logo', 'logo.png');
INSERT INTO `tr_setting` VALUES ('site_name', '旅游网站');
INSERT INTO `tr_setting` VALUES ('site_phone', '23456789,88997788');
INSERT INTO `tr_setting` VALUES ('site_status', '1');
INSERT INTO `tr_setting` VALUES ('statistics_code', '');
INSERT INTO `tr_setting` VALUES ('subdomain_edit', '0');
INSERT INTO `tr_setting` VALUES ('subdomain_length', '3-12');
INSERT INTO `tr_setting` VALUES ('subdomain_reserved', 'www');
INSERT INTO `tr_setting` VALUES ('subdomain_times', '3');
INSERT INTO `tr_setting` VALUES ('taobao_api_isuse', '0');
INSERT INTO `tr_setting` VALUES ('taobao_app_key', '');
INSERT INTO `tr_setting` VALUES ('taobao_secret_key', '');
INSERT INTO `tr_setting` VALUES ('time_zone', 'Asia/Shanghai');
INSERT INTO `tr_setting` VALUES ('voucher_allow', '1');
INSERT INTO `tr_setting` VALUES ('cms_attitude_flag', '1');
INSERT INTO `tr_setting` VALUES ('cms_comment_flag', '1');
INSERT INTO `tr_setting` VALUES ('cms_isuse', '1');
INSERT INTO `tr_setting` VALUES ('cms_logo', '');
INSERT INTO `tr_setting` VALUES ('cms_seo_description', 'ShopNC,资讯,画报');
INSERT INTO `tr_setting` VALUES ('cms_seo_keywords', 'ShopNC,资讯,画报');
INSERT INTO `tr_setting` VALUES ('cms_seo_title', 'ShopNC资讯频道');
INSERT INTO `tr_setting` VALUES ('cms_submit_flag', '1');
INSERT INTO `tr_setting` VALUES ('cms_submit_verify_flag', '1');
INSERT INTO `tr_setting` VALUES ('circle_contentleast', '10');
INSERT INTO `tr_setting` VALUES ('circle_createsum', '6');
INSERT INTO `tr_setting` VALUES ('circle_exprelease', '2');
INSERT INTO `tr_setting` VALUES ('circle_expreleasemax', '10');
INSERT INTO `tr_setting` VALUES ('circle_expreplied', '3');
INSERT INTO `tr_setting` VALUES ('circle_exprepliedmax', '1000');
INSERT INTO `tr_setting` VALUES ('circle_expreply', '1');
INSERT INTO `tr_setting` VALUES ('circle_intervaltime', '1');
INSERT INTO `tr_setting` VALUES ('circle_iscreate', '1');
INSERT INTO `tr_setting` VALUES ('circle_istalk', '1');
INSERT INTO `tr_setting` VALUES ('circle_isuse', '1');
INSERT INTO `tr_setting` VALUES ('circle_joinsum', '12');
INSERT INTO `tr_setting` VALUES ('circle_loginpic', 'a:4:{i:1;a:2:{s:3:\"pic\";s:5:\"1.jpg\";s:3:\"url\";s:22:\"http://www.shopnc.net/\";}i:2;a:2:{s:3:\"pic\";s:5:\"2.jpg\";s:3:\"url\";s:22:\"http://www.shopnc.net/\";}i:3;a:2:{s:3:\"pic\";s:5:\"3.jpg\";s:3:\"url\";s:22:\"http://www.shopnc.net/\";}i:4;a:2:{s:3:\"pic\";s:5:\"4.jpg\";s:3:\"url\";s:22:\"http://www.shopnc.net/\";}}');
INSERT INTO `tr_setting` VALUES ('circle_logo', 'logo.png');
INSERT INTO `tr_setting` VALUES ('circle_managesum', '4');
INSERT INTO `tr_setting` VALUES ('circle_name', 'ShopNC圈子');
INSERT INTO `tr_setting` VALUES ('circle_seodescription', '发现精彩：圈子是买家们自己创建的私属领地，我们排斥广告分子，我们热爱真实分享！');
INSERT INTO `tr_setting` VALUES ('circle_seokeywords', '圈子,帮派,讨论小组,购物,生活,分享,show,秀,商品,电子商务,社区,消费者社区,论坛,资讯,热门话题,朋友');
INSERT INTO `tr_setting` VALUES ('circle_seotitle', '发现精彩 - ShopNC圈子');
INSERT INTO `tr_setting` VALUES ('circle_wordfilter', null);
INSERT INTO `tr_setting` VALUES ('microshop_goods_default_class', '0');
INSERT INTO `tr_setting` VALUES ('microshop_header_pic', '');
INSERT INTO `tr_setting` VALUES ('microshop_isuse', '1');
INSERT INTO `tr_setting` VALUES ('microshop_logo', '');
INSERT INTO `tr_setting` VALUES ('microshop_personal_limit', '50');
INSERT INTO `tr_setting` VALUES ('microshop_seo_description', 'ShopNC商城系统,微商城,随心看,个人秀,店铺街');
INSERT INTO `tr_setting` VALUES ('microshop_seo_keywords', 'ShopNC商城系统,微商城,随心看,个人秀,店铺街,网上购物');
INSERT INTO `tr_setting` VALUES ('microshop_store_banner', '');
INSERT INTO `tr_setting` VALUES ('microshop_style', 'default');

-- ----------------------------
-- Table structure for `tr_sns_albumclass`
-- ----------------------------
DROP TABLE IF EXISTS `tr_sns_albumclass`;
CREATE TABLE `tr_sns_albumclass` (
  `ac_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `ac_name` varchar(100) NOT NULL COMMENT '相册名称',
  `member_id` int(10) unsigned NOT NULL COMMENT '所属会员id',
  `ac_des` varchar(255) NOT NULL COMMENT '相册描述',
  `ac_sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `ac_cover` varchar(255) NOT NULL COMMENT '相册封面',
  `upload_time` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为买家秀相册  1为是,0为否',
  PRIMARY KEY (`ac_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='相册表';

-- ----------------------------
-- Records of tr_sns_albumclass
-- ----------------------------
INSERT INTO `tr_sns_albumclass` VALUES ('1', '买家秀', '2', '买家秀默认相册', '1', '', '1432693261', '1');

-- ----------------------------
-- Table structure for `tr_sns_albumpic`
-- ----------------------------
DROP TABLE IF EXISTS `tr_sns_albumpic`;
CREATE TABLE `tr_sns_albumpic` (
  `ap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片表id',
  `ap_name` varchar(100) NOT NULL COMMENT '图片名称',
  `ac_id` int(10) unsigned NOT NULL COMMENT '相册id',
  `ap_cover` varchar(255) NOT NULL COMMENT '图片路径',
  `ap_size` int(10) unsigned NOT NULL COMMENT '图片大小',
  `ap_spec` varchar(100) NOT NULL COMMENT '图片规格',
  `member_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `upload_time` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `ap_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '图片类型，0为无、1为买家秀',
  `item_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '信息ID',
  PRIMARY KEY (`ap_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='相册图片表';

-- ----------------------------
-- Records of tr_sns_albumpic
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_sns_binding`
-- ----------------------------
DROP TABLE IF EXISTS `tr_sns_binding`;
CREATE TABLE `tr_sns_binding` (
  `snsbind_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `snsbind_memberid` int(11) NOT NULL COMMENT '会员编号',
  `snsbind_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `snsbind_appsign` varchar(50) NOT NULL COMMENT '应用标志',
  `snsbind_updatetime` int(11) NOT NULL COMMENT '绑定更新时间',
  `snsbind_openid` varchar(100) NOT NULL COMMENT '应用用户编号',
  `snsbind_openinfo` text COMMENT '应用用户信息',
  `snsbind_accesstoken` varchar(100) NOT NULL COMMENT '访问第三方资源的凭证',
  `snsbind_expiresin` int(11) NOT NULL COMMENT 'accesstoken过期时间，以返回的时间的准，单位为秒，注意过期时提醒用户重新授权',
  `snsbind_refreshtoken` varchar(100) DEFAULT NULL COMMENT '刷新token',
  PRIMARY KEY (`snsbind_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分享应用用户绑定记录表';

-- ----------------------------
-- Records of tr_sns_binding
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_sns_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tr_sns_comment`;
CREATE TABLE `tr_sns_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `comment_memberid` int(11) NOT NULL COMMENT '会员ID',
  `comment_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `comment_memberavatar` varchar(100) DEFAULT NULL COMMENT '会员头像',
  `comment_originalid` int(11) NOT NULL COMMENT '原帖ID',
  `comment_originaltype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '原帖类型 0表示动态信息 1表示分享商品 默认为0',
  `comment_content` varchar(500) NOT NULL COMMENT '评论内容',
  `comment_addtime` int(11) NOT NULL COMMENT '添加时间',
  `comment_ip` varchar(50) NOT NULL COMMENT '来源IP',
  `comment_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1屏蔽',
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of tr_sns_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_sns_friend`
-- ----------------------------
DROP TABLE IF EXISTS `tr_sns_friend`;
CREATE TABLE `tr_sns_friend` (
  `friend_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id值',
  `friend_frommid` int(11) NOT NULL COMMENT '会员id',
  `friend_frommname` varchar(100) DEFAULT NULL COMMENT '会员名称',
  `friend_frommavatar` varchar(100) DEFAULT NULL COMMENT '会员头像',
  `friend_tomid` int(11) NOT NULL COMMENT '朋友id',
  `friend_tomname` varchar(100) NOT NULL COMMENT '好友会员名称',
  `friend_tomavatar` varchar(100) DEFAULT NULL COMMENT '朋友头像',
  `friend_addtime` int(11) NOT NULL COMMENT '添加时间',
  `friend_followstate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '关注状态 1为单方关注 2为双方关注',
  PRIMARY KEY (`friend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='好友数据表';

-- ----------------------------
-- Records of tr_sns_friend
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_sns_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tr_sns_goods`;
CREATE TABLE `tr_sns_goods` (
  `snsgoods_goodsid` int(11) NOT NULL COMMENT '商品ID',
  `snsgoods_goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `snsgoods_goodsimage` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `snsgoods_goodsprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `snsgoods_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `snsgoods_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `snsgoods_addtime` int(11) NOT NULL COMMENT '添加时间',
  `snsgoods_likenum` int(11) NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `snsgoods_likemember` text COMMENT '喜欢过的会员ID，用逗号分隔',
  `snsgoods_sharenum` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  UNIQUE KEY `snsgoods_goodsid` (`snsgoods_goodsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SNS商品表';

-- ----------------------------
-- Records of tr_sns_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_sns_membertag`
-- ----------------------------
DROP TABLE IF EXISTS `tr_sns_membertag`;
CREATE TABLE `tr_sns_membertag` (
  `mtag_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '会员标签id',
  `mtag_name` varchar(20) NOT NULL COMMENT '会员标签名称',
  `mtag_sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员标签排序',
  `mtag_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '标签推荐 0未推荐（默认），1为已推荐',
  `mtag_desc` varchar(50) NOT NULL COMMENT '标签描述',
  `mtag_img` varchar(50) DEFAULT NULL COMMENT '标签图片',
  PRIMARY KEY (`mtag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员标签表';

-- ----------------------------
-- Records of tr_sns_membertag
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_sns_mtagmember`
-- ----------------------------
DROP TABLE IF EXISTS `tr_sns_mtagmember`;
CREATE TABLE `tr_sns_mtagmember` (
  `mtag_id` int(11) NOT NULL COMMENT '会员标签表id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推荐，默认为0',
  PRIMARY KEY (`mtag_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员标签会员对照表';

-- ----------------------------
-- Records of tr_sns_mtagmember
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_sns_setting`
-- ----------------------------
DROP TABLE IF EXISTS `tr_sns_setting`;
CREATE TABLE `tr_sns_setting` (
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `setting_skin` varchar(50) DEFAULT NULL COMMENT '皮肤',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='个人中心设置表';

-- ----------------------------
-- Records of tr_sns_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_sns_sharegoods`
-- ----------------------------
DROP TABLE IF EXISTS `tr_sns_sharegoods`;
CREATE TABLE `tr_sns_sharegoods` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `share_goodsid` int(11) NOT NULL COMMENT '商品ID',
  `share_memberid` int(11) NOT NULL COMMENT '所属会员ID',
  `share_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `share_content` varchar(500) DEFAULT NULL COMMENT '描述内容',
  `share_addtime` int(11) NOT NULL COMMENT '分享操作时间',
  `share_likeaddtime` int(11) NOT NULL DEFAULT '0' COMMENT '喜欢操作时间',
  `share_privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隐私可见度 0所有人可见 1好友可见 2仅自己可见',
  `share_commentcount` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `share_isshare` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分享 0为未分享 1为分享',
  `share_islike` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否喜欢 0为未喜欢 1为喜欢',
  PRIMARY KEY (`share_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享商品表';

-- ----------------------------
-- Records of tr_sns_sharegoods
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_sns_sharestore`
-- ----------------------------
DROP TABLE IF EXISTS `tr_sns_sharestore`;
CREATE TABLE `tr_sns_sharestore` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `share_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `share_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `share_memberid` int(11) NOT NULL COMMENT '所属会员ID',
  `share_membername` varchar(100) NOT NULL COMMENT '所属会员名称',
  `share_content` varchar(500) DEFAULT NULL COMMENT '描述内容',
  `share_addtime` int(11) NOT NULL COMMENT '添加时间',
  `share_privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隐私可见度 0所有人可见 1好友可见 2仅自己可见',
  PRIMARY KEY (`share_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享店铺表';

-- ----------------------------
-- Records of tr_sns_sharestore
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_sns_tracelog`
-- ----------------------------
DROP TABLE IF EXISTS `tr_sns_tracelog`;
CREATE TABLE `tr_sns_tracelog` (
  `trace_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `trace_originalid` int(11) NOT NULL DEFAULT '0' COMMENT '原动态ID 默认为0',
  `trace_originalmemberid` int(11) NOT NULL DEFAULT '0' COMMENT '原帖会员编号',
  `trace_originalstate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '原帖的删除状态 0为正常 1为删除',
  `trace_memberid` int(11) NOT NULL COMMENT '会员ID',
  `trace_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `trace_memberavatar` varchar(100) DEFAULT NULL COMMENT '会员头像',
  `trace_title` varchar(500) DEFAULT NULL COMMENT '动态标题',
  `trace_content` text NOT NULL COMMENT '动态内容',
  `trace_addtime` int(11) NOT NULL COMMENT '添加时间',
  `trace_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态  0正常 1为禁止显示 默认为0',
  `trace_privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隐私可见度 0所有人可见 1好友可见 2仅自己可见',
  `trace_commentcount` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `trace_copycount` int(11) NOT NULL DEFAULT '0' COMMENT '转发数',
  `trace_orgcommentcount` int(11) NOT NULL DEFAULT '0' COMMENT '原帖评论次数',
  `trace_orgcopycount` int(11) NOT NULL DEFAULT '0' COMMENT '原帖转帖次数',
  `trace_from` tinyint(4) DEFAULT '1' COMMENT '来源 1=shop 2=storetracelog 3=microshop 4=cms 5=circle',
  PRIMARY KEY (`trace_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='动态信息表';

-- ----------------------------
-- Records of tr_sns_tracelog
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_sns_visitor`
-- ----------------------------
DROP TABLE IF EXISTS `tr_sns_visitor`;
CREATE TABLE `tr_sns_visitor` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `v_mid` int(11) NOT NULL COMMENT '访客会员ID',
  `v_mname` varchar(100) NOT NULL COMMENT '访客会员名称',
  `v_mavatar` varchar(100) DEFAULT NULL COMMENT '访客会员头像',
  `v_ownermid` int(11) NOT NULL COMMENT '主人会员ID',
  `v_ownermname` varchar(100) NOT NULL COMMENT '主人会员名称',
  `v_ownermavatar` varchar(100) DEFAULT NULL COMMENT '主人会员头像',
  `v_addtime` int(11) NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`v_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='sns访客表';

-- ----------------------------
-- Records of tr_sns_visitor
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_spec`
-- ----------------------------
DROP TABLE IF EXISTS `tr_spec`;
CREATE TABLE `tr_spec` (
  `sp_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `sp_name` varchar(100) NOT NULL COMMENT '规格名称',
  `sp_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `class_id` int(10) unsigned DEFAULT '0' COMMENT '所属分类id',
  `class_name` varchar(100) DEFAULT NULL COMMENT '所属分类名称',
  PRIMARY KEY (`sp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='商品规格表';

-- ----------------------------
-- Records of tr_spec
-- ----------------------------
INSERT INTO `tr_spec` VALUES ('1', '颜色', '0', '0', '');
INSERT INTO `tr_spec` VALUES ('15', '尺码', '0', '0', '');
INSERT INTO `tr_spec` VALUES ('16', '目的地', '0', '0', '');

-- ----------------------------
-- Table structure for `tr_spec_value`
-- ----------------------------
DROP TABLE IF EXISTS `tr_spec_value`;
CREATE TABLE `tr_spec_value` (
  `sp_value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格值id',
  `sp_value_name` varchar(100) NOT NULL COMMENT '规格值名称',
  `sp_id` int(10) unsigned NOT NULL COMMENT '所属规格id',
  `gc_id` int(10) unsigned NOT NULL COMMENT '分类id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `sp_value_color` varchar(10) DEFAULT NULL COMMENT '规格颜色',
  `sp_value_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`sp_value_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=434 DEFAULT CHARSET=utf8 COMMENT='商品规格值表';

-- ----------------------------
-- Records of tr_spec_value
-- ----------------------------
INSERT INTO `tr_spec_value` VALUES ('221', '落月黄', '1', '15', '1', '#ffff00', '1');
INSERT INTO `tr_spec_value` VALUES ('222', '蓝色', '1', '15', '1', '#4f81bd', '2');
INSERT INTO `tr_spec_value` VALUES ('223', '白色', '1', '15', '1', '#ffffff', '3');
INSERT INTO `tr_spec_value` VALUES ('224', '绿色', '1', '15', '1', '#00b050', '4');
INSERT INTO `tr_spec_value` VALUES ('225', '梅红', '1', '15', '1', '#b2a2c7', '5');
INSERT INTO `tr_spec_value` VALUES ('226', '黑色', '1', '15', '1', '#000000', '6');
INSERT INTO `tr_spec_value` VALUES ('227', '橙色', '1', '15', '1', '#f79646', '7');
INSERT INTO `tr_spec_value` VALUES ('228', '灰色', '1', '14', '1', '#d8d8d8', '8');
INSERT INTO `tr_spec_value` VALUES ('239', '绿色', '1', '14', '1', '#92d050', '1');
INSERT INTO `tr_spec_value` VALUES ('240', '梅红', '1', '14', '1', '#c0504d', '2');
INSERT INTO `tr_spec_value` VALUES ('241', '蓝色', '1', '14', '1', '#4f81bd', '3');
INSERT INTO `tr_spec_value` VALUES ('242', '黑色', '1', '14', '1', '#000000', '4');
INSERT INTO `tr_spec_value` VALUES ('243', '橙色', '1', '14', '1', '#f79646', '5');
INSERT INTO `tr_spec_value` VALUES ('244', '红色', '1', '16', '1', '#ff0000', '1');
INSERT INTO `tr_spec_value` VALUES ('245', '黑色', '1', '13', '1', '#000000', '1');
INSERT INTO `tr_spec_value` VALUES ('246', '白色', '1', '12', '1', '#ffffff', '1');
INSERT INTO `tr_spec_value` VALUES ('247', '条纹', '1', '12', '1', '#4f81bd', '2');
INSERT INTO `tr_spec_value` VALUES ('248', '黑色', '1', '12', '1', '#000000', '3');
INSERT INTO `tr_spec_value` VALUES ('249', '白色', '1', '14', '1', '#ffffff', '6');
INSERT INTO `tr_spec_value` VALUES ('250', '紫色', '1', '14', '1', '#8064a2', '7');
INSERT INTO `tr_spec_value` VALUES ('251', '粉色', '1', '14', '1', '#ff99ff', '9');
INSERT INTO `tr_spec_value` VALUES ('252', '薄荷绿', '1', '58', '1', '#ebf1dd', '1');
INSERT INTO `tr_spec_value` VALUES ('253', '肤色', '1', '58', '1', '#fdeada', '2');
INSERT INTO `tr_spec_value` VALUES ('391', '法国 黑色', '1', '620', '1', '#000000', '1');
INSERT INTO `tr_spec_value` VALUES ('392', '法国 红色', '1', '620', '1', '#c00000', '2');
INSERT INTO `tr_spec_value` VALUES ('393', '法国 棕色', '1', '620', '1', '#938953', '3');
INSERT INTO `tr_spec_value` VALUES ('394', '比利时 黑色', '1', '620', '1', '#000000', '4');
INSERT INTO `tr_spec_value` VALUES ('395', '比利时 棕色', '1', '620', '1', '#7f7f7f', '5');
INSERT INTO `tr_spec_value` VALUES ('396', '1', '1', '617', '1', '#ffffff', '1');
INSERT INTO `tr_spec_value` VALUES ('397', '2', '1', '617', '1', '#ffffff', '2');
INSERT INTO `tr_spec_value` VALUES ('398', '3', '1', '617', '1', '#ffffff', '3');
INSERT INTO `tr_spec_value` VALUES ('399', '4', '1', '617', '1', '#ffffff', '4');
INSERT INTO `tr_spec_value` VALUES ('400', '5', '1', '617', '1', '#ffffff', '5');
INSERT INTO `tr_spec_value` VALUES ('402', '6', '1', '617', '1', '#ffffff', '6');
INSERT INTO `tr_spec_value` VALUES ('408', '1', '15', '36', '1', null, '1');
INSERT INTO `tr_spec_value` VALUES ('409', '2', '15', '36', '1', null, '2');
INSERT INTO `tr_spec_value` VALUES ('410', '3', '15', '36', '1', null, '3');
INSERT INTO `tr_spec_value` VALUES ('411', '4', '15', '36', '1', null, '4');
INSERT INTO `tr_spec_value` VALUES ('412', '5', '15', '36', '1', null, '5');
INSERT INTO `tr_spec_value` VALUES ('413', '1', '1', '36', '1', '#000000', '1');
INSERT INTO `tr_spec_value` VALUES ('414', '2', '1', '36', '1', '#d8d8d8', '2');
INSERT INTO `tr_spec_value` VALUES ('415', '3', '1', '36', '1', '#595959', '3');
INSERT INTO `tr_spec_value` VALUES ('416', '4', '1', '36', '1', '#c6d9f0', '4');
INSERT INTO `tr_spec_value` VALUES ('417', '5', '1', '36', '1', '#f2dcdb', '5');
INSERT INTO `tr_spec_value` VALUES ('418', '6', '1', '36', '1', '#938953', '6');
INSERT INTO `tr_spec_value` VALUES ('419', '7', '1', '36', '1', '#ddd9c3', '7');
INSERT INTO `tr_spec_value` VALUES ('421', '红色', '1', '1055', '1', null, '0');
INSERT INTO `tr_spec_value` VALUES ('422', '黑色', '1', '1055', '1', null, '0');
INSERT INTO `tr_spec_value` VALUES ('423', '红白', '1', '1055', '1', null, '0');
INSERT INTO `tr_spec_value` VALUES ('428', '白色', '1', '1055', '1', null, '0');
INSERT INTO `tr_spec_value` VALUES ('429', '黄色', '1', '1055', '1', null, '0');
INSERT INTO `tr_spec_value` VALUES ('430', '桔色', '1', '1055', '1', null, '0');
INSERT INTO `tr_spec_value` VALUES ('431', '蓝色', '1', '1055', '1', null, '0');
INSERT INTO `tr_spec_value` VALUES ('432', '银色', '1', '1055', '1', null, '0');
INSERT INTO `tr_spec_value` VALUES ('433', '红叶谷', '16', '12', '2', null, '0');

-- ----------------------------
-- Table structure for `tr_stat_member`
-- ----------------------------
DROP TABLE IF EXISTS `tr_stat_member`;
CREATE TABLE `tr_stat_member` (
  `statm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `statm_memberid` int(11) NOT NULL COMMENT '会员ID',
  `statm_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `statm_time` int(11) NOT NULL COMMENT '统计时间，当前按照最小时间单位为天',
  `statm_ordernum` int(11) NOT NULL DEFAULT '0' COMMENT '下单量',
  `statm_orderamount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '下单金额',
  `statm_goodsnum` int(11) NOT NULL DEFAULT '0' COMMENT '下单商品件数',
  `statm_predincrease` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预存款增加额',
  `statm_predreduce` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预存款减少额',
  `statm_pointsincrease` int(11) NOT NULL DEFAULT '0' COMMENT '积分增加额',
  `statm_pointsreduce` int(11) NOT NULL DEFAULT '0' COMMENT '积分减少额',
  `statm_updatetime` int(11) NOT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`statm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员相关数据统计';

-- ----------------------------
-- Records of tr_stat_member
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_store`
-- ----------------------------
DROP TABLE IF EXISTS `tr_store`;
CREATE TABLE `tr_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺索引id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `store_auth` tinyint(1) DEFAULT '0' COMMENT '店铺认证',
  `name_auth` tinyint(1) DEFAULT '0' COMMENT '店主认证',
  `grade_id` int(11) NOT NULL COMMENT '店铺等级',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `seller_name` varchar(50) DEFAULT NULL COMMENT '店主卖家用户名',
  `store_owner_card` varchar(50) NOT NULL COMMENT '身份证',
  `sc_id` int(11) NOT NULL COMMENT '店铺分类',
  `store_company_name` varchar(50) DEFAULT NULL COMMENT '店铺公司名称',
  `area_id` int(11) NOT NULL COMMENT '地区id',
  `area_info` varchar(100) NOT NULL COMMENT '地区内容，冗余数据',
  `store_address` varchar(100) NOT NULL COMMENT '详细地区',
  `store_zip` varchar(10) NOT NULL COMMENT '邮政编码',
  `store_tel` varchar(50) NOT NULL COMMENT '电话号码',
  `store_image` varchar(100) DEFAULT NULL COMMENT '证件上传',
  `store_image1` varchar(100) DEFAULT NULL COMMENT '执照上传',
  `store_state` tinyint(1) NOT NULL DEFAULT '2' COMMENT '店铺状态，0关闭，1开启，2审核中',
  `store_close_info` varchar(255) DEFAULT NULL COMMENT '店铺关闭原因',
  `store_sort` int(11) NOT NULL DEFAULT '0' COMMENT '店铺排序',
  `store_time` varchar(10) NOT NULL COMMENT '店铺时间',
  `store_end_time` varchar(10) DEFAULT NULL COMMENT '店铺关闭时间',
  `store_label` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `store_banner` varchar(255) DEFAULT NULL COMMENT '店铺横幅',
  `store_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo关键字',
  `store_description` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo描述',
  `store_qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `store_ww` varchar(50) DEFAULT NULL COMMENT '阿里旺旺',
  `description` text COMMENT '店铺简介',
  `store_zy` text COMMENT '主营商品',
  `store_domain` varchar(50) DEFAULT NULL COMMENT '店铺二级域名',
  `store_domain_times` tinyint(1) unsigned DEFAULT '0' COMMENT '二级域名修改次数',
  `store_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `store_theme` varchar(50) NOT NULL DEFAULT 'default' COMMENT '店铺当前主题',
  `store_credit` int(10) NOT NULL DEFAULT '0' COMMENT '店铺信用',
  `praise_rate` float NOT NULL DEFAULT '0' COMMENT '店铺好评率',
  `store_desccredit` float NOT NULL DEFAULT '0' COMMENT '描述相符度分数',
  `store_servicecredit` float NOT NULL DEFAULT '0' COMMENT '服务态度分数',
  `store_deliverycredit` float NOT NULL DEFAULT '0' COMMENT '发货速度分数',
  `store_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺收藏数量',
  `store_slide` text COMMENT '店铺幻灯片',
  `store_slide_url` text COMMENT '店铺幻灯片链接',
  `store_stamp` varchar(200) DEFAULT NULL COMMENT '店铺印章',
  `store_printdesc` varchar(500) DEFAULT NULL COMMENT '打印订单页面下方说明文字',
  `store_sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺销量',
  `store_presales` text COMMENT '售前客服',
  `store_aftersales` text COMMENT '售后客服',
  `store_workingtime` varchar(100) DEFAULT NULL COMMENT '工作时间',
  `store_free_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '超出该金额免运费，大于0才表示该值有效',
  `store_storage_alarm` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '库存警报',
  PRIMARY KEY (`store_id`),
  KEY `store_name` (`store_name`),
  KEY `sc_id` (`sc_id`),
  KEY `area_id` (`area_id`),
  KEY `store_state` (`store_state`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='店铺数据表';

-- ----------------------------
-- Records of tr_store
-- ----------------------------
INSERT INTO `tr_store` VALUES ('1', '官方店铺', '0', '0', '3', '1', 'shopnc', 'shopnc_seller', '', '5', null, '0', '天津 天津市 红桥区', '', '', '', null, null, '1', '', '0', '1387942806', '', null, null, '', '', null, null, null, '', null, '0', '0', 'default', '0', '0', '0', '0', '0', '0', null, null, null, null, '0', null, null, null, '0.00', '10');
INSERT INTO `tr_store` VALUES ('2', '亚美圣地官方旗舰店', '0', '0', '3', '2', 'test', 'test', '', '4', '亚美圣地', '0', '北京 北京市 东城区', '山东济南', '', '', null, null, '1', null, '0', '1432885445', null, null, null, '', '', null, null, null, '', null, '0', '0', 'default', '0', '0', '0', '0', '0', '0', null, null, null, null, '0', null, null, null, '0.00', '10');

-- ----------------------------
-- Table structure for `tr_store_bind_class`
-- ----------------------------
DROP TABLE IF EXISTS `tr_store_bind_class`;
CREATE TABLE `tr_store_bind_class` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned DEFAULT '0' COMMENT '店铺ID',
  `commis_rate` tinyint(4) unsigned DEFAULT '0' COMMENT '佣金比例',
  `class_1` mediumint(9) unsigned DEFAULT '0' COMMENT '一级分类',
  `class_2` mediumint(9) unsigned DEFAULT '0' COMMENT '二级分类',
  `class_3` mediumint(9) unsigned DEFAULT '0' COMMENT '三级分类',
  PRIMARY KEY (`bid`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺可发布商品类目表';

-- ----------------------------
-- Records of tr_store_bind_class
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_store_class`
-- ----------------------------
DROP TABLE IF EXISTS `tr_store_class`;
CREATE TABLE `tr_store_class` (
  `sc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `sc_name` varchar(100) NOT NULL COMMENT '分类名称',
  `sc_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `sc_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`sc_id`),
  KEY `sc_parent_id` (`sc_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='店铺分类表';

-- ----------------------------
-- Records of tr_store_class
-- ----------------------------
INSERT INTO `tr_store_class` VALUES ('1', '珠宝/首饰', '0', '8');
INSERT INTO `tr_store_class` VALUES ('4', '服装鞋包', '0', '1');
INSERT INTO `tr_store_class` VALUES ('5', '3C数码', '0', '2');
INSERT INTO `tr_store_class` VALUES ('6', '美容护理', '0', '3');
INSERT INTO `tr_store_class` VALUES ('7', '家居用品', '0', '4');
INSERT INTO `tr_store_class` VALUES ('8', '食品/保健', '0', '5');
INSERT INTO `tr_store_class` VALUES ('9', '母婴用品', '0', '6');
INSERT INTO `tr_store_class` VALUES ('10', '文体/汽车', '0', '7');
INSERT INTO `tr_store_class` VALUES ('11', '收藏/爱好', '0', '9');
INSERT INTO `tr_store_class` VALUES ('12', '生活/服务', '0', '10');
INSERT INTO `tr_store_class` VALUES ('13', '女装', '4', '2');
INSERT INTO `tr_store_class` VALUES ('14', '男装', '4', '2');
INSERT INTO `tr_store_class` VALUES ('15', '女鞋', '4', '3');
INSERT INTO `tr_store_class` VALUES ('16', '运动鞋', '4', '4');
INSERT INTO `tr_store_class` VALUES ('17', '男鞋/皮鞋/休闲鞋', '4', '5');
INSERT INTO `tr_store_class` VALUES ('18', '运动服/运动包/颈环配件', '4', '6');
INSERT INTO `tr_store_class` VALUES ('19', '电脑硬件/显示器/电脑周边', '5', '1');
INSERT INTO `tr_store_class` VALUES ('20', '手机', '5', '2');
INSERT INTO `tr_store_class` VALUES ('21', '笔记本电脑', '5', '3');
INSERT INTO `tr_store_class` VALUES ('22', '网络设备/路由器/网络相关', '5', '4');
INSERT INTO `tr_store_class` VALUES ('23', '数码相机/摄像机/摄影器材', '5', '5');
INSERT INTO `tr_store_class` VALUES ('24', 'mp3/mp4/iPod/录音笔', '5', '6');
INSERT INTO `tr_store_class` VALUES ('25', '电玩/配件/游戏/攻略', '5', '7');
INSERT INTO `tr_store_class` VALUES ('26', '影音电器', '5', '8');
INSERT INTO `tr_store_class` VALUES ('27', '厨房电器', '5', '9');
INSERT INTO `tr_store_class` VALUES ('28', '生活电器', '5', '10');
INSERT INTO `tr_store_class` VALUES ('29', '男士内衣/女士内衣/家居服', '4', '7');
INSERT INTO `tr_store_class` VALUES ('30', '箱包皮具/热销女包/男包', '4', '8');
INSERT INTO `tr_store_class` VALUES ('31', '服饰配件/皮带/帽子/围巾', '4', '9');
INSERT INTO `tr_store_class` VALUES ('32', '美容护肤/美体/精油', '6', '255');
INSERT INTO `tr_store_class` VALUES ('33', '彩妆/香水/美发工具', '6', '255');
INSERT INTO `tr_store_class` VALUES ('34', '国货精品/开架化妆品', '6', '255');
INSERT INTO `tr_store_class` VALUES ('35', '家居日用/收纳/礼品', '7', '255');
INSERT INTO `tr_store_class` VALUES ('36', '厨房/餐饮用具', '7', '255');
INSERT INTO `tr_store_class` VALUES ('37', '日化/清洁/护理', '7', '255');
INSERT INTO `tr_store_class` VALUES ('38', '床上用品/靠垫/毛巾/布艺', '7', '255');
INSERT INTO `tr_store_class` VALUES ('39', '零食/坚果/茶叶/地毯', '8', '1');
INSERT INTO `tr_store_class` VALUES ('40', '滋补/生鲜/速食/订餐', '8', '2');
INSERT INTO `tr_store_class` VALUES ('41', '保健食品', '8', '3');
INSERT INTO `tr_store_class` VALUES ('42', '奶粉/辅食/营养品', '9', '255');
INSERT INTO `tr_store_class` VALUES ('43', '尿片/洗护/喂哺用品', '9', '255');
INSERT INTO `tr_store_class` VALUES ('44', '益智玩具/早教/童车床/出行', '9', '255');
INSERT INTO `tr_store_class` VALUES ('45', '童装/童鞋/孕妇装', '9', '255');
INSERT INTO `tr_store_class` VALUES ('46', '运动/瑜伽/健身/球迷用品', '10', '1');
INSERT INTO `tr_store_class` VALUES ('47', '户外/登山/野营/旅行', '10', '2');
INSERT INTO `tr_store_class` VALUES ('48', '汽车/配件/改装/摩托/自行车', '10', '3');
INSERT INTO `tr_store_class` VALUES ('49', '书籍/杂志/报纸', '10', '4');
INSERT INTO `tr_store_class` VALUES ('50', '宠物/宠物食品及用品', '10', '5');
INSERT INTO `tr_store_class` VALUES ('51', '音乐/影视/音像', '10', '6');
INSERT INTO `tr_store_class` VALUES ('52', '乐器/吉他/钢琴/配件', '10', '7');
INSERT INTO `tr_store_class` VALUES ('53', '办公设备/文具/耗材', '10', '8');
INSERT INTO `tr_store_class` VALUES ('54', '珠宝/钻石/翡翠/黄金', '1', '1');
INSERT INTO `tr_store_class` VALUES ('55', '饰品流行/首饰/时尚饰品', '1', '2');
INSERT INTO `tr_store_class` VALUES ('56', '品牌手表/流行手表', '1', '3');
INSERT INTO `tr_store_class` VALUES ('57', '玩具/模型/娃娃/人偶', '11', '1');
INSERT INTO `tr_store_class` VALUES ('58', '古董/邮币/字画/收藏', '11', '2');
INSERT INTO `tr_store_class` VALUES ('59', 'ZIPPO/瑞士军刀/眼镜', '11', '3');
INSERT INTO `tr_store_class` VALUES ('60', '鲜花速递/蛋糕配送/园艺花艺', '12', '1');
INSERT INTO `tr_store_class` VALUES ('61', '演出/吃喝玩乐折扣券', '12', '2');
INSERT INTO `tr_store_class` VALUES ('62', '酒店客栈/景点门票/度假旅游', '12', '3');
INSERT INTO `tr_store_class` VALUES ('63', '网店/网络服务/个性定制/软件', '12', '4');
INSERT INTO `tr_store_class` VALUES ('64', '成人用品/避孕/计生用品', '12', '5');

-- ----------------------------
-- Table structure for `tr_store_cost`
-- ----------------------------
DROP TABLE IF EXISTS `tr_store_cost`;
CREATE TABLE `tr_store_cost` (
  `cost_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '费用编号',
  `cost_store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `cost_seller_id` int(10) unsigned NOT NULL COMMENT '卖家编号',
  `cost_price` int(10) unsigned NOT NULL COMMENT '价格',
  `cost_remark` varchar(255) NOT NULL COMMENT '费用备注',
  `cost_state` tinyint(3) unsigned NOT NULL COMMENT '费用状态(0-未结算 1-已结算)',
  `cost_time` int(10) unsigned NOT NULL COMMENT '费用发生时间',
  PRIMARY KEY (`cost_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺费用表';

-- ----------------------------
-- Records of tr_store_cost
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_store_extend`
-- ----------------------------
DROP TABLE IF EXISTS `tr_store_extend`;
CREATE TABLE `tr_store_extend` (
  `store_id` mediumint(8) unsigned NOT NULL COMMENT '店铺ID',
  `express` text COMMENT '快递公司ID的组合',
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺信息扩展表';

-- ----------------------------
-- Records of tr_store_extend
-- ----------------------------
INSERT INTO `tr_store_extend` VALUES ('2', null);

-- ----------------------------
-- Table structure for `tr_store_goods_class`
-- ----------------------------
DROP TABLE IF EXISTS `tr_store_goods_class`;
CREATE TABLE `tr_store_goods_class` (
  `stc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `stc_name` varchar(50) NOT NULL COMMENT '店铺商品分类名称',
  `stc_parent_id` int(11) NOT NULL COMMENT '父级id',
  `stc_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '店铺商品分类状态',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `stc_sort` int(11) NOT NULL DEFAULT '0' COMMENT '商品分类排序',
  PRIMARY KEY (`stc_id`),
  KEY `stc_parent_id` (`stc_parent_id`,`stc_sort`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺商品分类表';

-- ----------------------------
-- Records of tr_store_goods_class
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_store_grade`
-- ----------------------------
DROP TABLE IF EXISTS `tr_store_grade`;
CREATE TABLE `tr_store_grade` (
  `sg_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `sg_name` char(50) DEFAULT NULL COMMENT '等级名称',
  `sg_goods_limit` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '允许发布的商品数量',
  `sg_album_limit` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '允许上传图片数量',
  `sg_space_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传空间大小，单位MB',
  `sg_template_number` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '选择店铺模板套数',
  `sg_template` varchar(255) DEFAULT NULL COMMENT '模板内容',
  `sg_price` varchar(100) DEFAULT NULL COMMENT '费用',
  `sg_confirm` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核，0为否，1为是，默认为1',
  `sg_description` text COMMENT '申请说明',
  `sg_function` varchar(255) DEFAULT NULL COMMENT '附加功能',
  `sg_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '级别，数目越大级别越高',
  PRIMARY KEY (`sg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='店铺等级表';

-- ----------------------------
-- Records of tr_store_grade
-- ----------------------------
INSERT INTO `tr_store_grade` VALUES ('1', '系统默认', '100', '500', '100', '6', 'default|style1|style2|style3|style4|style5', '100元/年', '0', '用户选择“默认等级”，可以立即开通。', '', '0');
INSERT INTO `tr_store_grade` VALUES ('2', '白金店铺', '200', '1000', '100', '6', 'default|style1|style2|style3|style4|style5', '200元/年', '1', '享受更多特权', 'editor_multimedia', '2');
INSERT INTO `tr_store_grade` VALUES ('3', '钻石店铺', '0', '1000', '100', '6', 'default|style1|style2|style3|style4|style5', '1000', '0', '', 'editor_multimedia', '100');

-- ----------------------------
-- Table structure for `tr_store_joinin`
-- ----------------------------
DROP TABLE IF EXISTS `tr_store_joinin`;
CREATE TABLE `tr_store_joinin` (
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `member_name` varchar(50) DEFAULT NULL COMMENT '店主用户名',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `company_address` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `company_address_detail` varchar(50) DEFAULT NULL COMMENT '公司详细地址',
  `company_phone` varchar(20) DEFAULT NULL COMMENT '公司电话',
  `company_employee_count` int(10) unsigned DEFAULT NULL COMMENT '员工总数',
  `company_registered_capital` int(10) unsigned DEFAULT NULL COMMENT '注册资金',
  `contacts_name` varchar(50) DEFAULT NULL COMMENT '联系人姓名',
  `contacts_phone` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `contacts_email` varchar(50) DEFAULT NULL COMMENT '联系人邮箱',
  `business_licence_number` varchar(50) DEFAULT NULL COMMENT '营业执照号',
  `business_licence_address` varchar(50) DEFAULT NULL COMMENT '营业执所在地',
  `business_licence_start` date DEFAULT NULL COMMENT '营业执照有效期开始',
  `business_licence_end` date DEFAULT NULL COMMENT '营业执照有效期结束',
  `business_sphere` varchar(1000) DEFAULT NULL COMMENT '法定经营范围',
  `business_licence_number_electronic` varchar(50) DEFAULT NULL COMMENT '营业执照电子版',
  `organization_code` varchar(50) DEFAULT NULL COMMENT '组织机构代码',
  `organization_code_electronic` varchar(50) DEFAULT NULL COMMENT '组织机构代码电子版',
  `general_taxpayer` varchar(50) DEFAULT NULL COMMENT '一般纳税人证明',
  `bank_account_name` varchar(50) DEFAULT NULL COMMENT '银行开户名',
  `bank_account_number` varchar(50) DEFAULT NULL COMMENT '公司银行账号',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '开户银行支行名称',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '支行联行号',
  `bank_address` varchar(50) DEFAULT NULL COMMENT '开户银行所在地',
  `bank_licence_electronic` varchar(50) DEFAULT NULL COMMENT '开户银行许可证电子版',
  `is_settlement_account` tinyint(1) DEFAULT NULL COMMENT '开户行账号是否为结算账号 1-开户行就是结算账号 2-独立的计算账号',
  `settlement_bank_account_name` varchar(50) DEFAULT NULL COMMENT '结算银行开户名',
  `settlement_bank_account_number` varchar(50) DEFAULT NULL COMMENT '结算公司银行账号',
  `settlement_bank_name` varchar(50) DEFAULT NULL COMMENT '结算开户银行支行名称',
  `settlement_bank_code` varchar(50) DEFAULT NULL COMMENT '结算支行联行号',
  `settlement_bank_address` varchar(50) DEFAULT NULL COMMENT '结算开户银行所在地',
  `tax_registration_certificate` varchar(50) DEFAULT NULL COMMENT '税务登记证号',
  `taxpayer_id` varchar(50) DEFAULT NULL COMMENT '纳税人识别号',
  `tax_registration_certificate_electronic` varchar(50) DEFAULT NULL COMMENT '税务登记证号电子版',
  `seller_name` varchar(50) DEFAULT NULL COMMENT '卖家帐号',
  `store_name` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `store_class_ids` varchar(1000) DEFAULT NULL COMMENT '店铺分类编号集合',
  `store_class_names` varchar(1000) DEFAULT NULL COMMENT '店铺分类名称集合',
  `joinin_state` varchar(50) DEFAULT NULL COMMENT '申请状态 10-已提交申请 11-缴费完成  20-审核成功 30-审核失败 31-缴费审核失败 40-审核通过开店',
  `joinin_message` varchar(200) DEFAULT NULL COMMENT '管理员审核信息',
  `sg_name` varchar(50) DEFAULT NULL COMMENT '店铺等级名称',
  `sg_id` int(10) unsigned DEFAULT NULL COMMENT '店铺等级编号',
  `sc_name` varchar(50) DEFAULT NULL COMMENT '店铺分类名称',
  `sc_id` int(10) unsigned DEFAULT NULL COMMENT '店铺分类编号',
  `store_class_commis_rates` varchar(200) DEFAULT NULL COMMENT '分类佣金比例',
  `paying_money_certificate` varchar(50) DEFAULT NULL COMMENT '付款凭证',
  `paying_money_certificate_explain` varchar(200) DEFAULT NULL COMMENT '付款凭证说明',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺入住表';

-- ----------------------------
-- Records of tr_store_joinin
-- ----------------------------
INSERT INTO `tr_store_joinin` VALUES ('1', 'shopnc', '官方店铺', '天津 天津市 红桥区', '冠錡大厦 8层', '18800000000', '88', '88', 'shopnc', '18880000000', '', '', '天津 天津市 红桥区', '2013-12-23', '2013-12-31', '百货', '', '', '', '', '', '888888888888', '银行', '8888888888', '天津 天津市 红桥区', '', '1', 'shopnc', '888888888888', '银行', '8888888888', '天津 天津市 红桥区', '888888888888', '8888888888888', '', 'feng', '官方店铺', 'a:4:{i:0;s:7:\"1,4,13,\";i:1;s:12:\"530,531,541,\";i:2;s:10:\"2,152,162,\";i:3;s:7:\"1,5,35,\";}', '', '40', '', '钻石店铺', '3', '  3C数码', '5', '1,2,3,4', '', '1');
INSERT INTO `tr_store_joinin` VALUES ('2', 'test', '亚美圣地', '北京 北京市 东城区', '山东济南', '88888888', '88', '888', '888', '888888888', '8@qq.com', '888', '山东省 济南市 历下区', '2015-05-28', '2025-05-31', '888', '04862292748725012.png', '888', '04862292748767566.png', '04862292748795723.png', '888888888888', '888888888888', '8888', '8888', '山东省 济南市 历下区', '04862293058352847.png', '1', '888888888888', '888888888888', '8888', '8888', '山东省 济南市 历下区', '888888', '888888', '04862293058376435.png', 'test', '亚美圣地官方旗舰店', 'a:1:{i:0;s:7:\"1,4,12,\";}', 'a:1:{i:0;s:25:\"服饰鞋帽,女装,T恤,\";}', '40', '888', '钻石店铺', '3', '  服装鞋包', '4', '1', '04862294312614193.png', '888');

-- ----------------------------
-- Table structure for `tr_store_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `tr_store_navigation`;
CREATE TABLE `tr_store_navigation` (
  `sn_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航ID',
  `sn_title` varchar(50) NOT NULL COMMENT '导航名称',
  `sn_store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卖家店铺ID',
  `sn_content` text COMMENT '导航内容',
  `sn_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `sn_if_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '导航是否显示',
  `sn_add_time` int(10) NOT NULL COMMENT '导航',
  `sn_url` varchar(255) DEFAULT NULL COMMENT '店铺导航的外链URL',
  `sn_new_open` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '店铺导航外链是否在新窗口打开：0不开新窗口1开新窗口，默认是0',
  PRIMARY KEY (`sn_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='卖家店铺导航信息表';

-- ----------------------------
-- Records of tr_store_navigation
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_store_plate`
-- ----------------------------
DROP TABLE IF EXISTS `tr_store_plate`;
CREATE TABLE `tr_store_plate` (
  `plate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联板式id',
  `plate_name` varchar(10) NOT NULL COMMENT '关联板式名称',
  `plate_position` tinyint(3) unsigned NOT NULL COMMENT '关联板式位置 1顶部，0底部',
  `plate_content` text NOT NULL COMMENT '关联板式内容',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  PRIMARY KEY (`plate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关联板式表';

-- ----------------------------
-- Records of tr_store_plate
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_store_sns_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tr_store_sns_comment`;
CREATE TABLE `tr_store_sns_comment` (
  `scomm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺动态评论id',
  `strace_id` int(11) NOT NULL COMMENT '店铺动态id',
  `scomm_content` varchar(150) DEFAULT NULL COMMENT '评论内容',
  `scomm_memberid` int(11) DEFAULT NULL COMMENT '会员id',
  `scomm_membername` varchar(45) DEFAULT NULL COMMENT '会员名称',
  `scomm_memberavatar` varchar(50) DEFAULT NULL COMMENT '会员头像',
  `scomm_time` varchar(11) DEFAULT NULL COMMENT '评论时间',
  `scomm_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '评论状态 1正常，0屏蔽',
  PRIMARY KEY (`scomm_id`),
  UNIQUE KEY `scomm_id` (`scomm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺动态评论表';

-- ----------------------------
-- Records of tr_store_sns_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_store_sns_setting`
-- ----------------------------
DROP TABLE IF EXISTS `tr_store_sns_setting`;
CREATE TABLE `tr_store_sns_setting` (
  `sauto_storeid` int(11) NOT NULL COMMENT '店铺id',
  `sauto_new` tinyint(4) NOT NULL DEFAULT '1' COMMENT '新品,0为关闭/1为开启',
  `sauto_newtitle` varchar(150) NOT NULL COMMENT '新品内容',
  `sauto_coupon` tinyint(4) NOT NULL DEFAULT '1' COMMENT '优惠券,0为关闭/1为开启',
  `sauto_coupontitle` varchar(150) NOT NULL COMMENT '优惠券内容',
  `sauto_xianshi` tinyint(4) NOT NULL DEFAULT '1' COMMENT '限时折扣,0为关闭/1为开启',
  `sauto_xianshititle` varchar(150) NOT NULL COMMENT '限时折扣内容',
  `sauto_mansong` tinyint(4) NOT NULL DEFAULT '1' COMMENT '满即送,0为关闭/1为开启',
  `sauto_mansongtitle` varchar(150) NOT NULL COMMENT '满即送内容',
  `sauto_bundling` tinyint(4) NOT NULL DEFAULT '1' COMMENT '组合销售,0为关闭/1为开启',
  `sauto_bundlingtitle` varchar(150) NOT NULL COMMENT '组合销售内容',
  `sauto_groupbuy` tinyint(4) NOT NULL DEFAULT '1' COMMENT '团购,0为关闭/1为开启',
  `sauto_groupbuytitle` varchar(150) NOT NULL COMMENT '团购内容',
  PRIMARY KEY (`sauto_storeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺自动发布动态设置表';

-- ----------------------------
-- Records of tr_store_sns_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_store_sns_tracelog`
-- ----------------------------
DROP TABLE IF EXISTS `tr_store_sns_tracelog`;
CREATE TABLE `tr_store_sns_tracelog` (
  `strace_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺动态id',
  `strace_storeid` int(11) DEFAULT NULL COMMENT '店铺id',
  `strace_storename` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `strace_storelogo` varchar(255) NOT NULL COMMENT '店标',
  `strace_title` varchar(150) DEFAULT NULL COMMENT '动态标题',
  `strace_content` text COMMENT '发表内容',
  `strace_time` varchar(11) DEFAULT NULL COMMENT '发表时间',
  `strace_cool` int(11) DEFAULT '0' COMMENT '赞数量',
  `strace_spread` int(11) DEFAULT '0' COMMENT '转播数量',
  `strace_comment` int(11) DEFAULT '0' COMMENT '评论数量',
  `strace_type` tinyint(4) DEFAULT '1' COMMENT '1=relay,2=normal,3=new,4=coupon,5=xianshi,6=mansong,7=bundling,8=groupbuy,9=recommend,10=hotsell',
  `strace_goodsdata` varchar(1000) DEFAULT NULL COMMENT '商品信息',
  `strace_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '动态状态 1正常，0屏蔽',
  PRIMARY KEY (`strace_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺动态表';

-- ----------------------------
-- Records of tr_store_sns_tracelog
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_store_watermark`
-- ----------------------------
DROP TABLE IF EXISTS `tr_store_watermark`;
CREATE TABLE `tr_store_watermark` (
  `wm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '水印id',
  `jpeg_quality` int(3) NOT NULL DEFAULT '90' COMMENT 'jpeg图片质量',
  `wm_image_name` varchar(255) DEFAULT NULL COMMENT '水印图片的路径以及文件名',
  `wm_image_pos` tinyint(1) NOT NULL DEFAULT '1' COMMENT '水印图片放置的位置',
  `wm_image_transition` int(3) NOT NULL DEFAULT '20' COMMENT '水印图片与原图片的融合度 ',
  `wm_text` text COMMENT '水印文字',
  `wm_text_size` int(3) NOT NULL DEFAULT '20' COMMENT '水印文字大小',
  `wm_text_angle` tinyint(1) NOT NULL DEFAULT '4' COMMENT '水印文字角度',
  `wm_text_pos` tinyint(1) NOT NULL DEFAULT '3' COMMENT '水印文字放置位置',
  `wm_text_font` varchar(50) DEFAULT NULL COMMENT '水印文字的字体',
  `wm_text_color` varchar(7) NOT NULL DEFAULT '#CCCCCC' COMMENT '水印字体的颜色值',
  `wm_is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '水印是否开启 0关闭 1开启',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺id',
  PRIMARY KEY (`wm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺水印图片表';

-- ----------------------------
-- Records of tr_store_watermark
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_transport`
-- ----------------------------
DROP TABLE IF EXISTS `tr_transport`;
CREATE TABLE `tr_transport` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `title` varchar(30) NOT NULL COMMENT '运费模板名称',
  `send_tpl_id` mediumint(8) unsigned DEFAULT NULL COMMENT '发货地区模板ID',
  `store_id` mediumint(8) unsigned NOT NULL COMMENT '店铺ID',
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='运费模板';

-- ----------------------------
-- Records of tr_transport
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_transport_extend`
-- ----------------------------
DROP TABLE IF EXISTS `tr_transport_extend`;
CREATE TABLE `tr_transport_extend` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板扩展ID',
  `area_id` text COMMENT '市级地区ID组成的串，以，隔开，两端也有，',
  `top_area_id` text COMMENT '省级地区ID组成的串，以，隔开，两端也有，',
  `area_name` text COMMENT '地区name组成的串，以，隔开',
  `snum` mediumint(8) unsigned DEFAULT '1' COMMENT '首件数量',
  `sprice` decimal(10,2) DEFAULT '0.00' COMMENT '首件运费',
  `xnum` mediumint(8) unsigned DEFAULT '1' COMMENT '续件数量',
  `xprice` decimal(10,2) DEFAULT '0.00' COMMENT '续件运费',
  `is_default` enum('1','2') DEFAULT '2' COMMENT '是否默认运费1是2否',
  `transport_id` mediumint(8) unsigned NOT NULL COMMENT '运费模板ID',
  `transport_title` varchar(60) DEFAULT NULL COMMENT '运费模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='运费模板扩展表';

-- ----------------------------
-- Records of tr_transport_extend
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_type`
-- ----------------------------
DROP TABLE IF EXISTS `tr_type`;
CREATE TABLE `tr_type` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `type_name` varchar(100) NOT NULL COMMENT '类型名称',
  `type_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `class_id` int(10) unsigned DEFAULT '0' COMMENT '所属分类id',
  `class_name` varchar(100) NOT NULL COMMENT '所属分类名称',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='商品类型表';

-- ----------------------------
-- Records of tr_type
-- ----------------------------
INSERT INTO `tr_type` VALUES ('34', '服饰鞋/女装/针织衫', '3', '14', '针织衫');
INSERT INTO `tr_type` VALUES ('35', '服饰鞋帽/女装/雪纺衫', '4', '15', '雪纺衫');
INSERT INTO `tr_type` VALUES ('36', '服饰鞋帽/女装/卫衣', '5', '16', '卫衣');
INSERT INTO `tr_type` VALUES ('37', '旅游', '0', '0', '');

-- ----------------------------
-- Table structure for `tr_type_brand`
-- ----------------------------
DROP TABLE IF EXISTS `tr_type_brand`;
CREATE TABLE `tr_type_brand` (
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品类型与品牌对应表';

-- ----------------------------
-- Records of tr_type_brand
-- ----------------------------
INSERT INTO `tr_type_brand` VALUES ('34', '101');
INSERT INTO `tr_type_brand` VALUES ('34', '79');
INSERT INTO `tr_type_brand` VALUES ('34', '108');
INSERT INTO `tr_type_brand` VALUES ('34', '105');
INSERT INTO `tr_type_brand` VALUES ('34', '103');
INSERT INTO `tr_type_brand` VALUES ('34', '100');
INSERT INTO `tr_type_brand` VALUES ('34', '96');
INSERT INTO `tr_type_brand` VALUES ('34', '89');
INSERT INTO `tr_type_brand` VALUES ('34', '87');
INSERT INTO `tr_type_brand` VALUES ('34', '84');
INSERT INTO `tr_type_brand` VALUES ('34', '80');
INSERT INTO `tr_type_brand` VALUES ('34', '104');
INSERT INTO `tr_type_brand` VALUES ('34', '81');
INSERT INTO `tr_type_brand` VALUES ('34', '82');
INSERT INTO `tr_type_brand` VALUES ('34', '83');
INSERT INTO `tr_type_brand` VALUES ('36', '101');
INSERT INTO `tr_type_brand` VALUES ('36', '79');
INSERT INTO `tr_type_brand` VALUES ('36', '108');
INSERT INTO `tr_type_brand` VALUES ('36', '105');
INSERT INTO `tr_type_brand` VALUES ('36', '103');
INSERT INTO `tr_type_brand` VALUES ('36', '100');
INSERT INTO `tr_type_brand` VALUES ('36', '96');
INSERT INTO `tr_type_brand` VALUES ('36', '89');
INSERT INTO `tr_type_brand` VALUES ('36', '87');
INSERT INTO `tr_type_brand` VALUES ('36', '80');
INSERT INTO `tr_type_brand` VALUES ('36', '104');
INSERT INTO `tr_type_brand` VALUES ('36', '81');
INSERT INTO `tr_type_brand` VALUES ('36', '82');
INSERT INTO `tr_type_brand` VALUES ('36', '83');
INSERT INTO `tr_type_brand` VALUES ('35', '101');
INSERT INTO `tr_type_brand` VALUES ('35', '79');
INSERT INTO `tr_type_brand` VALUES ('35', '108');
INSERT INTO `tr_type_brand` VALUES ('35', '105');
INSERT INTO `tr_type_brand` VALUES ('35', '103');
INSERT INTO `tr_type_brand` VALUES ('35', '100');
INSERT INTO `tr_type_brand` VALUES ('35', '96');
INSERT INTO `tr_type_brand` VALUES ('35', '89');
INSERT INTO `tr_type_brand` VALUES ('35', '87');
INSERT INTO `tr_type_brand` VALUES ('35', '80');
INSERT INTO `tr_type_brand` VALUES ('35', '104');
INSERT INTO `tr_type_brand` VALUES ('35', '81');
INSERT INTO `tr_type_brand` VALUES ('35', '82');

-- ----------------------------
-- Table structure for `tr_type_spec`
-- ----------------------------
DROP TABLE IF EXISTS `tr_type_spec`;
CREATE TABLE `tr_type_spec` (
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `sp_id` int(10) unsigned NOT NULL COMMENT '规格id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品类型与规格对应表';

-- ----------------------------
-- Records of tr_type_spec
-- ----------------------------
INSERT INTO `tr_type_spec` VALUES ('36', '15');
INSERT INTO `tr_type_spec` VALUES ('36', '1');
INSERT INTO `tr_type_spec` VALUES ('35', '15');
INSERT INTO `tr_type_spec` VALUES ('35', '1');
INSERT INTO `tr_type_spec` VALUES ('34', '15');
INSERT INTO `tr_type_spec` VALUES ('34', '1');
INSERT INTO `tr_type_spec` VALUES ('37', '16');

-- ----------------------------
-- Table structure for `tr_upload`
-- ----------------------------
DROP TABLE IF EXISTS `tr_upload`;
CREATE TABLE `tr_upload` (
  `upload_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名',
  `file_thumb` varchar(100) DEFAULT NULL COMMENT '缩微图片',
  `file_wm` varchar(100) DEFAULT NULL COMMENT '水印图片',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID，0为管理员',
  `upload_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文件类别，0为无，1为文章图片，默认为0，2为商品切换图片，3为商品内容图片，4为系统文章图片，5为积分礼品切换图片，6为积分礼品内容图片',
  `upload_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '信息ID',
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上传文件表';

-- ----------------------------
-- Records of tr_upload
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `tr_voucher`;
CREATE TABLE `tr_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券编号',
  `voucher_code` varchar(32) NOT NULL COMMENT '代金券编码',
  `voucher_t_id` int(11) NOT NULL COMMENT '代金券模版编号',
  `voucher_title` varchar(50) NOT NULL COMMENT '代金券标题',
  `voucher_desc` varchar(255) NOT NULL COMMENT '代金券描述',
  `voucher_start_date` int(11) NOT NULL COMMENT '代金券有效期开始时间',
  `voucher_end_date` int(11) NOT NULL COMMENT '代金券有效期结束时间',
  `voucher_price` int(11) NOT NULL COMMENT '代金券面额',
  `voucher_limit` decimal(10,2) NOT NULL COMMENT '代金券使用时的订单限额',
  `voucher_store_id` int(11) NOT NULL COMMENT '代金券的店铺id',
  `voucher_state` tinyint(4) NOT NULL COMMENT '代金券状态(1-未用,2-已用,3-过期,4-收回)',
  `voucher_active_date` int(11) NOT NULL COMMENT '代金券发放日期',
  `voucher_type` tinyint(4) NOT NULL COMMENT '代金券类别',
  `voucher_owner_id` int(11) NOT NULL COMMENT '代金券所有者id',
  `voucher_owner_name` varchar(50) NOT NULL COMMENT '代金券所有者名称',
  `voucher_order_id` int(11) DEFAULT NULL COMMENT '使用该代金券的订单编号',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代金券表';

-- ----------------------------
-- Records of tr_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_voucher_price`
-- ----------------------------
DROP TABLE IF EXISTS `tr_voucher_price`;
CREATE TABLE `tr_voucher_price` (
  `voucher_price_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券面值编号',
  `voucher_price_describe` varchar(255) NOT NULL COMMENT '代金券描述',
  `voucher_price` int(11) NOT NULL COMMENT '代金券面值',
  `voucher_defaultpoints` int(11) NOT NULL DEFAULT '0' COMMENT '代金劵默认的兑换所需积分可以为0',
  PRIMARY KEY (`voucher_price_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代金券面额表';

-- ----------------------------
-- Records of tr_voucher_price
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_voucher_quota`
-- ----------------------------
DROP TABLE IF EXISTS `tr_voucher_quota`;
CREATE TABLE `tr_voucher_quota` (
  `quota_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '套餐编号',
  `quota_applyid` int(11) NOT NULL COMMENT '申请编号',
  `quota_memberid` int(11) NOT NULL COMMENT '会员编号',
  `quota_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `quota_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `quota_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `quota_starttime` int(11) NOT NULL COMMENT '开始时间',
  `quota_endtime` int(11) NOT NULL COMMENT '结束时间',
  `quota_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(1-可用/2-取消/3-结束)',
  PRIMARY KEY (`quota_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代金券套餐表';

-- ----------------------------
-- Records of tr_voucher_quota
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_voucher_template`
-- ----------------------------
DROP TABLE IF EXISTS `tr_voucher_template`;
CREATE TABLE `tr_voucher_template` (
  `voucher_t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券模版编号',
  `voucher_t_title` varchar(50) NOT NULL COMMENT '代金券模版名称',
  `voucher_t_desc` varchar(255) NOT NULL COMMENT '代金券模版描述',
  `voucher_t_start_date` int(11) NOT NULL COMMENT '代金券模版有效期开始时间',
  `voucher_t_end_date` int(11) NOT NULL COMMENT '代金券模版有效期结束时间',
  `voucher_t_price` int(11) NOT NULL COMMENT '代金券模版面额',
  `voucher_t_limit` decimal(10,2) NOT NULL COMMENT '代金券使用时的订单限额',
  `voucher_t_store_id` int(11) NOT NULL COMMENT '代金券模版的店铺id',
  `voucher_t_storename` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `voucher_t_creator_id` int(11) NOT NULL COMMENT '代金券模版的创建者id',
  `voucher_t_state` tinyint(4) NOT NULL COMMENT '代金券模版状态(1-有效,2-失效)',
  `voucher_t_total` int(11) NOT NULL COMMENT '模版可发放的代金券总数',
  `voucher_t_giveout` int(11) NOT NULL COMMENT '模版已发放的代金券数量',
  `voucher_t_used` int(11) NOT NULL COMMENT '模版已经使用过的代金券',
  `voucher_t_add_date` int(11) NOT NULL COMMENT '模版的创建时间',
  `voucher_t_quotaid` int(11) NOT NULL COMMENT '套餐编号',
  `voucher_t_points` int(11) NOT NULL DEFAULT '0' COMMENT '兑换所需积分',
  `voucher_t_eachlimit` int(11) NOT NULL DEFAULT '1' COMMENT '每人限领张数',
  `voucher_t_styleimg` varchar(200) DEFAULT NULL COMMENT '样式模版图片',
  `voucher_t_customimg` varchar(200) DEFAULT NULL COMMENT '自定义代金券模板图片',
  PRIMARY KEY (`voucher_t_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代金券模版表';

-- ----------------------------
-- Records of tr_voucher_template
-- ----------------------------

-- ----------------------------
-- Table structure for `tr_web`
-- ----------------------------
DROP TABLE IF EXISTS `tr_web`;
CREATE TABLE `tr_web` (
  `web_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `web_name` varchar(20) DEFAULT '' COMMENT '模块名称',
  `style_name` varchar(20) DEFAULT 'orange' COMMENT '风格名称',
  `web_page` varchar(10) DEFAULT 'index' COMMENT '所在页面(暂时只有index)',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `web_sort` tinyint(1) unsigned DEFAULT '9' COMMENT '排序',
  `web_show` tinyint(1) unsigned DEFAULT '1' COMMENT '是否显示，0为否，1为是，默认为1',
  `web_html` text COMMENT '模块html代码',
  PRIMARY KEY (`web_id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='页面模块表';

-- ----------------------------
-- Records of tr_web
-- ----------------------------
INSERT INTO `tr_web` VALUES ('1', '红色', 'red', 'index', '1389864697', '1', '0', null);
INSERT INTO `tr_web` VALUES ('2', '女装/男装/内衣', 'pink', 'index', '1433403877', '1', '1', '\r\n<div class=\"home-standard-layout wrapper style-pink\">\r\n  <div class=\"left-sidebar\">\r\n    <div class=\"title\">\r\n      	      	<div class=\"pic-type\"><img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-2-21.png?920\"/></div>\r\n      	    </div>\r\n    <div class=\"left-ads\">\r\n      	      	<a href=\"http://shop.shopnc.v2014\" title=\"出游服装五折起\" target=\"_blank\">\r\n      	<img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-2-23.png?543\" alt=\"出游服装五折起\">\r\n      	</a>\r\n      	    </div>\r\n    <div class=\"recommend-classes\">\r\n      <ul>\r\n                  		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=108\" title=\"正装鞋\" target=\"_blank\">正装鞋</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=16\" title=\"卫衣\" target=\"_blank\">卫衣</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=110\" title=\"凉鞋／沙滩鞋\" target=\"_blank\">凉鞋／沙滩鞋</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=19\" title=\"半身裙\" target=\"_blank\">半身裙</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=24\" title=\"西服\" target=\"_blank\">西服</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=26\" title=\"风衣\" target=\"_blank\">风衣</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=27\" title=\"大衣\" target=\"_blank\">大衣</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=29\" title=\"棉服\" target=\"_blank\">棉服</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=31\" title=\"孕妇装\" target=\"_blank\">孕妇装</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=32\" title=\"大码装\" target=\"_blank\">大码装</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=33\" title=\"中老年装\" target=\"_blank\">中老年装</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=107\" title=\"商务休闲鞋\" target=\"_blank\">商务休闲鞋</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=109\" title=\"休闲鞋\" target=\"_blank\">休闲鞋</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=111\" title=\"男靴\" target=\"_blank\">男靴</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=112\" title=\"功能鞋\" target=\"_blank\">功能鞋</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=113\" title=\"拖鞋\" target=\"_blank\">拖鞋</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=114\" title=\"传统布鞋\" target=\"_blank\">传统布鞋</a></li>\r\n		                            <li><a href=\"http://192.168.1.201/travel/shop/index.php?act=search&op=index&cate_id=116\" title=\"帆布鞋\" target=\"_blank\">帆布鞋</a></li>\r\n		                                          </ul>\r\n    </div>\r\n  </div>\r\n  <div class=\"middle-layout\">\r\n    <ul class=\"tabs-nav\">\r\n                                            <li class=\"tabs-selected\"><i class=\"arrow\"></i><h3>冬季内衣</h3></li>\r\n                          <li class=\"\"><i class=\"arrow\"></i><h3>女装春款</h3></li>\r\n                                        </ul>\r\n                                                                                              <div class=\"tabs-panel middle-banner-style01 fade-img \">\r\n                                    <a href=\"\" title=\"美腿连裤袜-美腿就要Show出来\" class=\"a1\" target=\"_blank\">\r\n                                        <img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-2-25-1-11.png?980\" alt=\"美腿连裤袜-美腿就要Show出来\"></a>\r\n                                    <a href=\"\" title=\"男士内衣-冬季型男内衣装备\" class=\"a2\" target=\"_blank\">\r\n                                        <img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-2-25-1-12.png?428\" alt=\"男士内衣-冬季型男内衣装备\"></a>\r\n                                    <a href=\"\" title=\"冬季保暖内衣-您准备好了吗？\" class=\"b1\" target=\"_blank\">\r\n                                        <img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-2-25-1-14.png?143\" alt=\"冬季保暖内衣-您准备好了吗？\"></a>\r\n                                    <a href=\"\" title=\"可爱睡衣-冬季宅家卡哇伊\" class=\"c1\" target=\"_blank\">\r\n                                        <img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-2-25-1-21.png?789\" alt=\"可爱睡衣-冬季宅家卡哇伊\"></a>\r\n                                    <a href=\"\" title=\"聚拢文胸-女神衣橱必备\" class=\"c2\" target=\"_blank\">\r\n                                        <img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-2-25-1-24.png?630\" alt=\"聚拢文胸-女神衣橱必备\"></a>\r\n                                    <a href=\"\" title=\"北极绒羊毛超柔活力棉黄金甲加绒\" class=\"d1\" target=\"_blank\">\r\n                                        <img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-2-25-1-31.png?813\" alt=\"北极绒羊毛超柔活力棉黄金甲加绒\"></a>\r\n                                    <a href=\"\" title=\"摇粒绒套装，休闲 时光轻松舒适！\" class=\"d2\" target=\"_blank\">\r\n                                        <img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-2-25-1-32.png?409\" alt=\"摇粒绒套装，休闲 时光轻松舒适！\"></a>\r\n                                    <a href=\"\" title=\"女装 HEATTECH摇粒绒两翻领T恤\" class=\"d3\" target=\"_blank\">\r\n                                        <img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-2-25-1-33.png?697\" alt=\"女装 HEATTECH摇粒绒两翻领T恤\"></a>\r\n                                    <a href=\"\" title=\"穿着温暖感受出众 HEATTECH长短袜\" class=\"d4\" target=\"_blank\">\r\n                                        <img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-2-25-1-34.png?671\" alt=\"穿着温暖感受出众 HEATTECH长短袜\"></a>\r\n                                </div>\r\n                                                                                                        <div class=\"tabs-panel middle-goods-list tabs-hide\">\r\n                                    <ul>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=54\" title=\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 粉色\">\r\n                                          	新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 粉色</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=54\">\r\n                                          	<img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04418254218437108_240.jpg\" alt=\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 粉色\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\"><em>￥99.00</em>\r\n                                            <span class=\"original\">￥483.00</span></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=53\" title=\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 紫色\">\r\n                                          	新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 紫色</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=53\">\r\n                                          	<img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04418254088878407_240.jpg\" alt=\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 紫色\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\"><em>￥99.00</em>\r\n                                            <span class=\"original\">￥483.00</span></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=52\" title=\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 白色\">\r\n                                          	新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 白色</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=52\">\r\n                                          	<img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04418253240878850_240.jpg\" alt=\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 白色\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\"><em>￥99.00</em>\r\n                                            <span class=\"original\">￥483.00</span></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=51\" title=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 灰色\">\r\n                                          	春装 披肩式 超短款 针织 衫开衫 女装 青鸟 灰色</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=51\">\r\n                                          	<img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04418242684128103_240.jpg\" alt=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 灰色\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\"><em>￥129.00</em>\r\n                                            <span class=\"original\">￥358.00</span></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=50\" title=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 橙色\">\r\n                                          	春装 披肩式 超短款 针织 衫开衫 女装 青鸟 橙色</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=50\">\r\n                                          	<img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04418241398474746_240.jpg\" alt=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 橙色\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\"><em>￥129.00</em>\r\n                                            <span class=\"original\">￥358.00</span></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=49\" title=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 黑色\">\r\n                                          	春装 披肩式 超短款 针织 衫开衫 女装 青鸟 黑色</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=49\">\r\n                                          	<img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04418240955916042_240.jpg\" alt=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 黑色\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\"><em>￥129.00</em>\r\n                                            <span class=\"original\">￥358.00</span></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=48\" title=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 蓝色\">\r\n                                          	春装 披肩式 超短款 针织 衫开衫 女装 青鸟 蓝色</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=48\">\r\n                                          	<img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04418240795665638_240.jpg\" alt=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 蓝色\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\"><em>￥129.00</em>\r\n                                            <span class=\"original\">￥358.00</span></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=47\" title=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 梅红\">\r\n                                          	春装 披肩式 超短款 针织 衫开衫 女装 青鸟 梅红</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=47\">\r\n                                          	<img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04418240641767556_240.jpg\" alt=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 梅红\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\"><em>￥129.00</em>\r\n                                            <span class=\"original\">￥358.00</span></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                        </ul>\r\n                                  </div>\r\n                                                                </div>\r\n  <div class=\"right-sidebar\">\r\n    <div class=\"title\"></div>\r\n    <div class=\"recommend-brand\">\r\n      <ul>\r\n                                            <li>\r\n          <a href=\"http://192.168.1.201/travel/shop/index.php?act=brand&op=list&brand=104\" title=\"esprit\" target=\"_blank\">\r\n          	<img src=\"http://192.168.1.201/travel/data/upload/shop/brand/04398090828687339_sm.jpg\" alt=\"esprit\"></a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://192.168.1.201/travel/shop/index.php?act=brand&op=list&brand=103\" title=\"ELLE HOME\" target=\"_blank\">\r\n          	<img src=\"http://192.168.1.201/travel/data/upload/shop/brand/04398090611386532_sm.jpg\" alt=\"ELLE HOME\"></a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://192.168.1.201/travel/shop/index.php?act=brand&op=list&brand=102\" title=\"她他/tata\" target=\"_blank\">\r\n          	<img src=\"http://192.168.1.201/travel/data/upload/shop/brand/04398090459092275_sm.jpg\" alt=\"她他/tata\"></a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://192.168.1.201/travel/shop/index.php?act=brand&op=list&brand=99\" title=\"梦特娇\" target=\"_blank\">\r\n          	<img src=\"http://192.168.1.201/travel/data/upload/shop/brand/04398089942879365_sm.jpg\" alt=\"梦特娇\"></a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://192.168.1.201/travel/shop/index.php?act=brand&op=list&brand=96\" title=\"佐丹奴\" target=\"_blank\">\r\n          	<img src=\"http://192.168.1.201/travel/data/upload/shop/brand/04398089412399747_sm.jpg\" alt=\"佐丹奴\"></a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://192.168.1.201/travel/shop/index.php?act=brand&op=list&brand=90\" title=\"金利来\" target=\"_blank\">\r\n          	<img src=\"http://192.168.1.201/travel/data/upload/shop/brand/04397473042647991_sm.jpg\" alt=\"金利来\"></a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://192.168.1.201/travel/shop/index.php?act=brand&op=list&brand=84\" title=\"阿迪达斯\" target=\"_blank\">\r\n          	<img src=\"http://192.168.1.201/travel/data/upload/shop/brand/04397471910652190_sm.jpg\" alt=\"阿迪达斯\"></a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://192.168.1.201/travel/shop/index.php?act=brand&op=list&brand=85\" title=\"猫人\" target=\"_blank\">\r\n          	<img src=\"http://192.168.1.201/travel/data/upload/shop/brand/04397472152849925_sm.jpg\" alt=\"猫人\"></a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://192.168.1.201/travel/shop/index.php?act=brand&op=list&brand=79\" title=\"justyle\" target=\"_blank\">\r\n          	<img src=\"http://192.168.1.201/travel/data/upload/shop/brand/04397468710494742_sm.jpg\" alt=\"justyle\"></a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://192.168.1.201/travel/shop/index.php?act=brand&op=list&brand=116\" title=\"Dior\" target=\"_blank\">\r\n          	<img src=\"http://192.168.1.201/travel/data/upload/shop/brand/04398099738566948_sm.jpg\" alt=\"Dior\"></a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://192.168.1.201/travel/shop/index.php?act=brand&op=list&brand=100\" title=\"宝姿\" target=\"_blank\">\r\n          	<img src=\"http://192.168.1.201/travel/data/upload/shop/brand/04398090061006740_sm.jpg\" alt=\"宝姿\"></a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://192.168.1.201/travel/shop/index.php?act=brand&op=list&brand=95\" title=\"李宁\" target=\"_blank\">\r\n          	<img src=\"http://192.168.1.201/travel/data/upload/shop/brand/04398089270610035_sm.jpg\" alt=\"李宁\"></a>\r\n        </li>\r\n                                          </ul>\r\n    </div>\r\n    <div class=\"right-side-focus\">\r\n      <ul>\r\n                                                                                <li><a href=\"\" title=\"\" target=\"_blank\">\r\n                        <img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-2-28-1.jpg?603\" alt=\"\"/></a>\r\n                      	</li>\r\n                                                                                    <li><a href=\"\" title=\"\" target=\"_blank\">\r\n                        <img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-2-28-2.jpg?121\" alt=\"\"/></a>\r\n                      	</li>\r\n                                                                                    <li><a href=\"\" title=\"\" target=\"_blank\">\r\n                        <img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-2-28-3.jpg?841\" alt=\"\"/></a>\r\n                      	</li>\r\n                                                                </ul>\r\n    </div>\r\n  </div>\r\n</div>');
INSERT INTO `tr_web` VALUES ('3', '橘色', 'orange', 'index', '1389864697', '2', '0', null);
INSERT INTO `tr_web` VALUES ('4', '绿色', 'green', 'index', '1389864697', '3', '0', null);
INSERT INTO `tr_web` VALUES ('5', '蓝色', 'blue', 'index', '1389864697', '4', '0', null);
INSERT INTO `tr_web` VALUES ('6', '紫色', 'purple', 'index', '1389864697', '6', '0', null);
INSERT INTO `tr_web` VALUES ('7', '褐色', 'brown', 'index', '1389864697', '7', '0', null);
INSERT INTO `tr_web` VALUES ('8', '灰色', 'gray', 'index', '1389864697', '8', '0', null);
INSERT INTO `tr_web` VALUES ('101', '首页头部焦点图片', 'orange', 'index_pic', '1433403877', '100', '1', '\r\n  <ul id=\"fullScreenSlides\" class=\"full-screen-slides\">\r\n                                        <li style=\"background: #2D080F url(\'http://192.168.1.201/travel/data/upload/shop/editor/web-101-101-1.jpg?454\') no-repeat center top\">\r\n            <a href=\"\" target=\"_blank\" title=\"冬季名品-大牌季节日\">&nbsp;</a></li>\r\n                                        <li style=\"background: #F6BB3D url(\'http://192.168.1.201/travel/data/upload/shop/editor/web-101-101-5.jpg?166\') no-repeat center top\">\r\n            <a href=\"\" target=\"_blank\" title=\"全套茶具专场-年终盛典\">&nbsp;</a></li>\r\n                                        <li style=\"background: #36142C url(\'http://192.168.1.201/travel/data/upload/shop/editor/web-101-101-2.jpg?331\') no-repeat center top\">\r\n            <a href=\"\" target=\"_blank\" title=\"女人再忙也要留一天为自己疯抢\">&nbsp;</a></li>\r\n                                        <li style=\"background: #f2f2f2 url(\'http://192.168.1.201/travel/data/upload/shop/editor/web-101-101-3.jpg?249\') no-repeat center top\">\r\n            <a href=\"\" target=\"_blank\" title=\"全年爆款-年底清仓\">&nbsp;</a></li>\r\n                                        <li style=\"background: #ECBCB0 url(\'http://192.168.1.201/travel/data/upload/shop/editor/web-101-101-4.jpg?250\') no-repeat center top\">\r\n            <a href=\"\" target=\"_blank\" title=\"清仓年末特优-满99元包邮\">&nbsp;</a></li>\r\n                                  \r\n  </ul>\r\n  <div class=\"jfocus-trigeminy\">\r\n    <ul>\r\n                              <li>\r\n                                        <a href=\"\" target=\"_blank\" title=\"佳节大献礼-茶满中秋\"><img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-101-102-1-1.jpg?842\" alt=\"佳节大献礼-茶满中秋\"></a>\r\n                          <a href=\"\" target=\"_blank\" title=\"孩子喜欢-遥控悍马\"><img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-101-102-1-2.jpg?143\" alt=\"孩子喜欢-遥控悍马\"></a>\r\n                          <a href=\"\" target=\"_blank\" title=\"天气凉了-情侣家居服\"><img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-101-102-1-3.jpg?114\" alt=\"天气凉了-情侣家居服\"></a>\r\n                                      </li>\r\n                    <li>\r\n                                        <a href=\"\" target=\"_blank\" title=\"越中国越时尚-水晶中国风\"><img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-101-102-2-1.jpg?824\" alt=\"越中国越时尚-水晶中国风\"></a>\r\n                          <a href=\"\" target=\"_blank\" title=\"领先全球首创-CoolTec冰爽剃须\"><img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-101-102-2-2.jpg?851\" alt=\"领先全球首创-CoolTec冰爽剃须\"></a>\r\n                          <a href=\"\" target=\"_blank\" title=\"健康中的专家-欧姆龙血压计\"><img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-101-102-2-3.jpg?734\" alt=\"健康中的专家-欧姆龙血压计\"></a>\r\n                                      </li>\r\n                    <li>\r\n                                        <a href=\"\" target=\"_blank\" title=\"TOPTO秋季格调-衬衫促销季\"><img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-101-102-3-1.jpg?191\" alt=\"TOPTO秋季格调-衬衫促销季\"></a>\r\n                          <a href=\"\" target=\"_blank\" title=\"骆驼早秋新品尝试-热销款推荐\"><img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-101-102-3-2.jpg?628\" alt=\"骆驼早秋新品尝试-热销款推荐\"></a>\r\n                          <a href=\"\" target=\"_blank\" title=\"识得女人香-冰希利娇真我系列\"><img src=\"http://192.168.1.201/travel/data/upload/shop/editor/web-101-102-3-3.jpg?851\" alt=\"识得女人香-冰希利娇真我系列\"></a>\r\n                                      </li>\r\n                        </ul>\r\n  </div>');
INSERT INTO `tr_web` VALUES ('121', '首页促销区', 'orange', 'index_sale', '1433403877', '120', '1', '\r\n         \r\n            <li class=\"mr0\">\r\n              <a href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=231\" title=\"至尊金奖 法国原瓶进口AOC红酒 任选一箱 红沙城堡红葡萄酒 原装进口\" target=\"_blank\" onclick=\"_tcTraObj._tcTrackEvent(\'15353temaifirst\', \'Pcblock\', \'CN首页\',\'30\');\">\r\n              <div><i>5.3折</i>\r\n              <img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04423392298369303_240.jpg\" alt=\"至尊金奖 法国原瓶进口AOC红酒 任选一箱 红沙城堡红葡萄酒 原装进口\" /></div>\r\n              <div class=\"pro_des\">\r\n              <p>至尊金奖 法国原瓶进口AOC红酒 任选一箱 红沙城堡红葡萄酒 原装进口</p>\r\n              <span><em>¥</em>899.00<i>起</i><i class=\"item_type\">周边游</i></span> \r\n              </div>  \r\n              </a>  \r\n            </li>\r\n         \r\n            <li class=\"\">\r\n              <a href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=232\" title=\"中华老字号 东阿阿胶桃花姬阿胶糕300g\" target=\"_blank\" onclick=\"_tcTraObj._tcTrackEvent(\'15353temaifirst\', \'Pcblock\', \'CN首页\',\'30\');\">\r\n              <div><i>8.9折</i>\r\n              <img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04423411880302392_240.png\" alt=\"中华老字号 东阿阿胶桃花姬阿胶糕300g\" /></div>\r\n              <div class=\"pro_des\">\r\n              <p>中华老字号 东阿阿胶桃花姬阿胶糕300g</p>\r\n              <span><em>¥</em>150.00<i>起</i><i class=\"item_type\">周边游</i></span> \r\n              </div>  \r\n              </a>  \r\n            </li>\r\n         \r\n            <li class=\"\">\r\n              <a href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=53\" title=\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 紫色\" target=\"_blank\" onclick=\"_tcTraObj._tcTrackEvent(\'15353temaifirst\', \'Pcblock\', \'CN首页\',\'30\');\">\r\n              <div><i>2折</i>\r\n              <img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04418254088878407_240.jpg\" alt=\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 紫色\" /></div>\r\n              <div class=\"pro_des\">\r\n              <p>新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 紫色</p>\r\n              <span><em>¥</em>99.00<i>起</i><i class=\"item_type\">周边游</i></span> \r\n              </div>  \r\n              </a>  \r\n            </li>\r\n         \r\n            <li class=\"\">\r\n              <a href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=49\" title=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 黑色\" target=\"_blank\" onclick=\"_tcTraObj._tcTrackEvent(\'15353temaifirst\', \'Pcblock\', \'CN首页\',\'30\');\">\r\n              <div><i>3.6折</i>\r\n              <img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04418240955916042_240.jpg\" alt=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 黑色\" /></div>\r\n              <div class=\"pro_des\">\r\n              <p>春装 披肩式 超短款 针织 衫开衫 女装 青鸟 黑色</p>\r\n              <span><em>¥</em>129.00<i>起</i><i class=\"item_type\">周边游</i></span> \r\n              </div>  \r\n              </a>  \r\n            </li>\r\n         \r\n            <li class=\"mr0\">\r\n              <a href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=48\" title=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 蓝色\" target=\"_blank\" onclick=\"_tcTraObj._tcTrackEvent(\'15353temaifirst\', \'Pcblock\', \'CN首页\',\'30\');\">\r\n              <div><i>3.6折</i>\r\n              <img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04418240795665638_240.jpg\" alt=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 蓝色\" /></div>\r\n              <div class=\"pro_des\">\r\n              <p>春装 披肩式 超短款 针织 衫开衫 女装 青鸟 蓝色</p>\r\n              <span><em>¥</em>129.00<i>起</i><i class=\"item_type\">周边游</i></span> \r\n              </div>  \r\n              </a>  \r\n            </li>\r\n             \r\n            <li class=\"\">\r\n              <a href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=54\" title=\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 粉色\" target=\"_blank\" onclick=\"_tcTraObj._tcTrackEvent(\'15353temaifirst\', \'Pcblock\', \'CN首页\',\'30\');\">\r\n              <div><i>2折</i>\r\n              <img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04418254218437108_240.jpg\" alt=\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 粉色\" /></div>\r\n              <div class=\"pro_des\">\r\n              <p>新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 粉色</p>\r\n              <span><em>¥</em>99.00<i>起</i><i class=\"item_type\">周边游</i></span> \r\n              </div>  \r\n              </a>  \r\n            </li>\r\n         \r\n            <li class=\"\">\r\n              <a href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=52\" title=\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 白色\" target=\"_blank\" onclick=\"_tcTraObj._tcTrackEvent(\'15353temaifirst\', \'Pcblock\', \'CN首页\',\'30\');\">\r\n              <div><i>2折</i>\r\n              <img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04418253240878850_240.jpg\" alt=\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 白色\" /></div>\r\n              <div class=\"pro_des\">\r\n              <p>新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 白色</p>\r\n              <span><em>¥</em>99.00<i>起</i><i class=\"item_type\">周边游</i></span> \r\n              </div>  \r\n              </a>  \r\n            </li>\r\n         \r\n            <li class=\"\">\r\n              <a href=\"http://192.168.1.201/travel/shop/index.php?act=goods&op=index&goods_id=51\" title=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 灰色\" target=\"_blank\" onclick=\"_tcTraObj._tcTrackEvent(\'15353temaifirst\', \'Pcblock\', \'CN首页\',\'30\');\">\r\n              <div><i>3.6折</i>\r\n              <img src=\"http://192.168.1.201/travel/data/upload/shop/store/goods/1/1_04418242684128103_240.jpg\" alt=\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 灰色\" /></div>\r\n              <div class=\"pro_des\">\r\n              <p>春装 披肩式 超短款 针织 衫开衫 女装 青鸟 灰色</p>\r\n              <span><em>¥</em>129.00<i>起</i><i class=\"item_type\">周边游</i></span> \r\n              </div>  \r\n              </a>  \r\n            </li>\r\n                \r\n');

-- ----------------------------
-- Table structure for `tr_web_code`
-- ----------------------------
DROP TABLE IF EXISTS `tr_web_code`;
CREATE TABLE `tr_web_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '内容ID',
  `web_id` int(10) unsigned NOT NULL COMMENT '模块ID',
  `code_type` varchar(10) NOT NULL DEFAULT 'array' COMMENT '数据类型:array,html,json',
  `var_name` varchar(20) NOT NULL COMMENT '变量名称',
  `code_info` text COMMENT '内容数据',
  `show_name` varchar(20) DEFAULT '' COMMENT '页面名称',
  PRIMARY KEY (`code_id`),
  KEY `web_id` (`web_id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='模块内容表';

-- ----------------------------
-- Records of tr_web_code
-- ----------------------------
INSERT INTO `tr_web_code` VALUES ('11', '1', 'array', 'tit', '', '标题图片');
INSERT INTO `tr_web_code` VALUES ('12', '1', 'array', 'category_list', '', '推荐分类');
INSERT INTO `tr_web_code` VALUES ('13', '1', 'array', 'act', '', '活动图片');
INSERT INTO `tr_web_code` VALUES ('15', '1', 'array', 'recommend_list', '', '商品推荐');
INSERT INTO `tr_web_code` VALUES ('18', '1', 'array', 'adv', '', '广告图片');
INSERT INTO `tr_web_code` VALUES ('19', '1', 'array', 'brand_list', '', '品牌推荐');
INSERT INTO `tr_web_code` VALUES ('21', '2', 'array', 'tit', 'a:5:{s:3:\"pic\";s:28:\"shop/editor/web-2-21.png?920\";s:3:\"url\";s:0:\"\";s:4:\"type\";s:3:\"pic\";s:5:\"floor\";s:0:\"\";s:5:\"title\";s:0:\"\";}', '标题图片');
INSERT INTO `tr_web_code` VALUES ('22', '2', 'array', 'category_list', 'a:1:{s:11:\"goods_class\";a:18:{i:108;a:2:{s:5:\"gc_id\";s:3:\"108\";s:7:\"gc_name\";s:9:\"正装鞋\";}i:16;a:2:{s:5:\"gc_id\";s:2:\"16\";s:7:\"gc_name\";s:6:\"卫衣\";}i:110;a:2:{s:5:\"gc_id\";s:3:\"110\";s:7:\"gc_name\";s:18:\"凉鞋／沙滩鞋\";}i:19;a:2:{s:5:\"gc_id\";s:2:\"19\";s:7:\"gc_name\";s:9:\"半身裙\";}i:24;a:2:{s:5:\"gc_id\";s:2:\"24\";s:7:\"gc_name\";s:6:\"西服\";}i:26;a:2:{s:5:\"gc_id\";s:2:\"26\";s:7:\"gc_name\";s:6:\"风衣\";}i:27;a:2:{s:5:\"gc_id\";s:2:\"27\";s:7:\"gc_name\";s:6:\"大衣\";}i:29;a:2:{s:5:\"gc_id\";s:2:\"29\";s:7:\"gc_name\";s:6:\"棉服\";}i:31;a:2:{s:5:\"gc_id\";s:2:\"31\";s:7:\"gc_name\";s:9:\"孕妇装\";}i:32;a:2:{s:5:\"gc_id\";s:2:\"32\";s:7:\"gc_name\";s:9:\"大码装\";}i:33;a:2:{s:5:\"gc_id\";s:2:\"33\";s:7:\"gc_name\";s:12:\"中老年装\";}i:107;a:2:{s:5:\"gc_id\";s:3:\"107\";s:7:\"gc_name\";s:15:\"商务休闲鞋\";}i:109;a:2:{s:5:\"gc_id\";s:3:\"109\";s:7:\"gc_name\";s:9:\"休闲鞋\";}i:111;a:2:{s:5:\"gc_id\";s:3:\"111\";s:7:\"gc_name\";s:6:\"男靴\";}i:112;a:2:{s:5:\"gc_id\";s:3:\"112\";s:7:\"gc_name\";s:9:\"功能鞋\";}i:113;a:2:{s:5:\"gc_id\";s:3:\"113\";s:7:\"gc_name\";s:6:\"拖鞋\";}i:114;a:2:{s:5:\"gc_id\";s:3:\"114\";s:7:\"gc_name\";s:12:\"传统布鞋\";}i:116;a:2:{s:5:\"gc_id\";s:3:\"116\";s:7:\"gc_name\";s:9:\"帆布鞋\";}}}', '推荐分类');
INSERT INTO `tr_web_code` VALUES ('23', '2', 'array', 'act', 'a:4:{s:3:\"pic\";s:28:\"shop/editor/web-2-23.png?543\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:21:\"出游服装五折起\";s:3:\"url\";s:24:\"http://shop.shopnc.v2014\";}', '活动图片');
INSERT INTO `tr_web_code` VALUES ('25', '2', 'array', 'recommend_list', 'a:2:{i:1;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"冬季内衣\";}s:8:\"pic_list\";a:9:{i:11;a:4:{s:6:\"pic_id\";s:2:\"11\";s:8:\"pic_name\";s:38:\"美腿连裤袜-美腿就要Show出来\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-11.png?980\";}i:12;a:4:{s:6:\"pic_id\";s:2:\"12\";s:8:\"pic_name\";s:37:\"男士内衣-冬季型男内衣装备\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-12.png?428\";}i:14;a:4:{s:6:\"pic_id\";s:2:\"14\";s:8:\"pic_name\";s:40:\"冬季保暖内衣-您准备好了吗？\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-14.png?143\";}i:21;a:4:{s:6:\"pic_id\";s:2:\"21\";s:8:\"pic_name\";s:34:\"可爱睡衣-冬季宅家卡哇伊\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-21.png?789\";}i:24;a:4:{s:6:\"pic_id\";s:2:\"24\";s:8:\"pic_name\";s:31:\"聚拢文胸-女神衣橱必备\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-24.png?630\";}i:31;a:4:{s:6:\"pic_id\";s:2:\"31\";s:8:\"pic_name\";s:45:\"北极绒羊毛超柔活力棉黄金甲加绒\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-31.png?813\";}i:32;a:4:{s:6:\"pic_id\";s:2:\"32\";s:8:\"pic_name\";s:46:\"摇粒绒套装，休闲 时光轻松舒适！\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-32.png?409\";}i:33;a:4:{s:6:\"pic_id\";s:2:\"33\";s:8:\"pic_name\";s:37:\"女装 HEATTECH摇粒绒两翻领T恤\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-33.png?697\";}i:34;a:4:{s:6:\"pic_id\";s:2:\"34\";s:8:\"pic_name\";s:42:\"穿着温暖感受出众 HEATTECH长短袜\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-34.png?671\";}}}i:2;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"女装春款\";}s:10:\"goods_list\";a:8:{i:54;a:5:{s:8:\"goods_id\";s:2:\"54\";s:12:\"market_price\";s:6:\"483.00\";s:10:\"goods_name\";s:69:\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 粉色\";s:11:\"goods_price\";s:5:\"99.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418254218437108_240.jpg\";}i:53;a:5:{s:8:\"goods_id\";s:2:\"53\";s:12:\"market_price\";s:6:\"483.00\";s:10:\"goods_name\";s:69:\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 紫色\";s:11:\"goods_price\";s:5:\"99.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418254088878407_240.jpg\";}i:52;a:5:{s:8:\"goods_id\";s:2:\"52\";s:12:\"market_price\";s:6:\"483.00\";s:10:\"goods_name\";s:69:\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 白色\";s:11:\"goods_price\";s:5:\"99.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418253240878850_240.jpg\";}i:51;a:5:{s:8:\"goods_id\";s:2:\"51\";s:12:\"market_price\";s:6:\"358.00\";s:10:\"goods_name\";s:64:\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 灰色\";s:11:\"goods_price\";s:6:\"129.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418242684128103_240.jpg\";}i:50;a:5:{s:8:\"goods_id\";s:2:\"50\";s:12:\"market_price\";s:6:\"358.00\";s:10:\"goods_name\";s:64:\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 橙色\";s:11:\"goods_price\";s:6:\"129.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418241398474746_240.jpg\";}i:49;a:5:{s:8:\"goods_id\";s:2:\"49\";s:12:\"market_price\";s:6:\"358.00\";s:10:\"goods_name\";s:64:\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 黑色\";s:11:\"goods_price\";s:6:\"129.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418240955916042_240.jpg\";}i:48;a:5:{s:8:\"goods_id\";s:2:\"48\";s:12:\"market_price\";s:6:\"358.00\";s:10:\"goods_name\";s:64:\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 蓝色\";s:11:\"goods_price\";s:6:\"129.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418240795665638_240.jpg\";}i:47;a:5:{s:8:\"goods_id\";s:2:\"47\";s:12:\"market_price\";s:6:\"358.00\";s:10:\"goods_name\";s:64:\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 梅红\";s:11:\"goods_price\";s:6:\"129.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418240641767556_240.jpg\";}}}}', '商品推荐');
INSERT INTO `tr_web_code` VALUES ('28', '2', 'array', 'adv', 'a:3:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:30:\"shop/editor/web-2-28-1.jpg?603\";}i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:30:\"shop/editor/web-2-28-2.jpg?121\";}i:3;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:1:\"3\";s:7:\"pic_img\";s:30:\"shop/editor/web-2-28-3.jpg?841\";}}', '广告图片');
INSERT INTO `tr_web_code` VALUES ('29', '2', 'array', 'brand_list', 'a:12:{i:104;a:3:{s:8:\"brand_id\";s:3:\"104\";s:10:\"brand_name\";s:6:\"esprit\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090828687339_sm.jpg\";}i:103;a:3:{s:8:\"brand_id\";s:3:\"103\";s:10:\"brand_name\";s:9:\"ELLE HOME\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090611386532_sm.jpg\";}i:102;a:3:{s:8:\"brand_id\";s:3:\"102\";s:10:\"brand_name\";s:11:\"她他/tata\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090459092275_sm.jpg\";}i:99;a:3:{s:8:\"brand_id\";s:2:\"99\";s:10:\"brand_name\";s:9:\"梦特娇\";s:9:\"brand_pic\";s:35:\"shop/brand/04398089942879365_sm.jpg\";}i:96;a:3:{s:8:\"brand_id\";s:2:\"96\";s:10:\"brand_name\";s:9:\"佐丹奴\";s:9:\"brand_pic\";s:35:\"shop/brand/04398089412399747_sm.jpg\";}i:90;a:3:{s:8:\"brand_id\";s:2:\"90\";s:10:\"brand_name\";s:9:\"金利来\";s:9:\"brand_pic\";s:35:\"shop/brand/04397473042647991_sm.jpg\";}i:84;a:3:{s:8:\"brand_id\";s:2:\"84\";s:10:\"brand_name\";s:12:\"阿迪达斯\";s:9:\"brand_pic\";s:35:\"shop/brand/04397471910652190_sm.jpg\";}i:85;a:3:{s:8:\"brand_id\";s:2:\"85\";s:10:\"brand_name\";s:6:\"猫人\";s:9:\"brand_pic\";s:35:\"shop/brand/04397472152849925_sm.jpg\";}i:79;a:3:{s:8:\"brand_id\";s:2:\"79\";s:10:\"brand_name\";s:7:\"justyle\";s:9:\"brand_pic\";s:35:\"shop/brand/04397468710494742_sm.jpg\";}i:116;a:3:{s:8:\"brand_id\";s:3:\"116\";s:10:\"brand_name\";s:4:\"Dior\";s:9:\"brand_pic\";s:35:\"shop/brand/04398099738566948_sm.jpg\";}i:100;a:3:{s:8:\"brand_id\";s:3:\"100\";s:10:\"brand_name\";s:6:\"宝姿\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090061006740_sm.jpg\";}i:95;a:3:{s:8:\"brand_id\";s:2:\"95\";s:10:\"brand_name\";s:6:\"李宁\";s:9:\"brand_pic\";s:35:\"shop/brand/04398089270610035_sm.jpg\";}}', '品牌推荐');
INSERT INTO `tr_web_code` VALUES ('31', '3', 'array', 'tit', '', '标题图片');
INSERT INTO `tr_web_code` VALUES ('32', '3', 'array', 'category_list', '', '推荐分类');
INSERT INTO `tr_web_code` VALUES ('33', '3', 'array', 'act', '', '活动图片');
INSERT INTO `tr_web_code` VALUES ('35', '3', 'array', 'recommend_list', '', '商品推荐');
INSERT INTO `tr_web_code` VALUES ('38', '3', 'array', 'adv', '', '广告图片');
INSERT INTO `tr_web_code` VALUES ('39', '3', 'array', 'brand_list', '', '品牌推荐');
INSERT INTO `tr_web_code` VALUES ('41', '4', 'array', 'tit', '', '标题图片');
INSERT INTO `tr_web_code` VALUES ('42', '4', 'array', 'category_list', '', '推荐分类');
INSERT INTO `tr_web_code` VALUES ('43', '4', 'array', 'act', '', '活动图片');
INSERT INTO `tr_web_code` VALUES ('45', '4', 'array', 'recommend_list', '', '商品推荐');
INSERT INTO `tr_web_code` VALUES ('48', '4', 'array', 'adv', '', '广告图片');
INSERT INTO `tr_web_code` VALUES ('49', '4', 'array', 'brand_list', '', '品牌推荐');
INSERT INTO `tr_web_code` VALUES ('51', '5', 'array', 'tit', '', '标题图片');
INSERT INTO `tr_web_code` VALUES ('52', '5', 'array', 'category_list', '', '推荐分类');
INSERT INTO `tr_web_code` VALUES ('53', '5', 'array', 'act', '', '活动图片');
INSERT INTO `tr_web_code` VALUES ('55', '5', 'array', 'recommend_list', '', '商品推荐');
INSERT INTO `tr_web_code` VALUES ('58', '5', 'array', 'adv', '', '广告图片');
INSERT INTO `tr_web_code` VALUES ('59', '5', 'array', 'brand_list', '', '品牌推荐');
INSERT INTO `tr_web_code` VALUES ('61', '6', 'array', 'tit', '', '标题图片');
INSERT INTO `tr_web_code` VALUES ('62', '6', 'array', 'category_list', '', '活动图片');
INSERT INTO `tr_web_code` VALUES ('63', '6', 'array', 'act', '', '活动图片');
INSERT INTO `tr_web_code` VALUES ('65', '6', 'array', 'recommend_list', '', '商品推荐');
INSERT INTO `tr_web_code` VALUES ('68', '6', 'array', 'adv', '', '广告图片');
INSERT INTO `tr_web_code` VALUES ('69', '6', 'array', 'brand_list', '', '品牌推荐');
INSERT INTO `tr_web_code` VALUES ('71', '7', 'array', 'tit', '', '标题图片');
INSERT INTO `tr_web_code` VALUES ('72', '7', 'array', 'category_list', '', '推荐分类');
INSERT INTO `tr_web_code` VALUES ('73', '7', 'array', 'act', '', '活动图片');
INSERT INTO `tr_web_code` VALUES ('75', '7', 'array', 'recommend_list', '', '商品推荐');
INSERT INTO `tr_web_code` VALUES ('78', '7', 'array', 'adv', '', '广告图片');
INSERT INTO `tr_web_code` VALUES ('79', '7', 'array', 'brand_list', '', '品牌推荐');
INSERT INTO `tr_web_code` VALUES ('81', '8', 'array', 'tit', '', '标题图片');
INSERT INTO `tr_web_code` VALUES ('82', '8', 'array', 'category_list', '', '推荐分类');
INSERT INTO `tr_web_code` VALUES ('83', '8', 'array', 'act', '', '活动图片');
INSERT INTO `tr_web_code` VALUES ('85', '8', 'array', 'recommend_list', '', '商品推荐');
INSERT INTO `tr_web_code` VALUES ('88', '8', 'array', 'adv', '', '广告图片');
INSERT INTO `tr_web_code` VALUES ('89', '8', 'array', 'brand_list', '', '品牌推荐');
INSERT INTO `tr_web_code` VALUES ('101', '101', 'array', 'screen_list', 'a:5:{i:1;a:5:{s:8:\"pic_name\";s:28:\"冬季名品-大牌季节日\";s:7:\"pic_url\";s:0:\"\";s:5:\"color\";s:7:\"#2D080F\";s:6:\"pic_id\";s:1:\"1\";s:7:\"pic_img\";s:33:\"shop/editor/web-101-101-1.jpg?454\";}i:5;a:5:{s:6:\"pic_id\";s:1:\"5\";s:8:\"pic_name\";s:31:\"全套茶具专场-年终盛典\";s:7:\"pic_url\";s:0:\"\";s:5:\"color\";s:7:\"#F6BB3D\";s:7:\"pic_img\";s:33:\"shop/editor/web-101-101-5.jpg?166\";}i:2;a:5:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:42:\"女人再忙也要留一天为自己疯抢\";s:7:\"pic_url\";s:0:\"\";s:5:\"color\";s:7:\"#36142C\";s:7:\"pic_img\";s:33:\"shop/editor/web-101-101-2.jpg?331\";}i:3;a:5:{s:6:\"pic_id\";s:1:\"3\";s:8:\"pic_name\";s:25:\"全年爆款-年底清仓\";s:7:\"pic_url\";s:0:\"\";s:5:\"color\";s:7:\"#f2f2f2\";s:7:\"pic_img\";s:33:\"shop/editor/web-101-101-3.jpg?249\";}i:4;a:5:{s:6:\"pic_id\";s:1:\"4\";s:8:\"pic_name\";s:33:\"清仓年末特优-满99元包邮\";s:7:\"pic_url\";s:0:\"\";s:5:\"color\";s:7:\"#ECBCB0\";s:7:\"pic_img\";s:33:\"shop/editor/web-101-101-4.jpg?250\";}}', '切换大图');
INSERT INTO `tr_web_code` VALUES ('102', '101', 'array', 'focus_list', 'a:3:{i:1;a:1:{s:8:\"pic_list\";a:3:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:28:\"佳节大献礼-茶满中秋\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-1-1.jpg?842\";}i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:25:\"孩子喜欢-遥控悍马\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-1-2.jpg?143\";}i:3;a:4:{s:6:\"pic_id\";s:1:\"3\";s:8:\"pic_name\";s:28:\"天气凉了-情侣家居服\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-1-3.jpg?114\";}}}i:2;a:1:{s:8:\"pic_list\";a:3:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:34:\"越中国越时尚-水晶中国风\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-2-1.jpg?824\";}i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:38:\"领先全球首创-CoolTec冰爽剃须\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-2-2.jpg?851\";}i:3;a:4:{s:6:\"pic_id\";s:1:\"3\";s:8:\"pic_name\";s:37:\"健康中的专家-欧姆龙血压计\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-2-3.jpg?734\";}}}i:3;a:1:{s:8:\"pic_list\";a:3:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:33:\"TOPTO秋季格调-衬衫促销季\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-3-1.jpg?191\";}i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:40:\"骆驼早秋新品尝试-热销款推荐\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-3-2.jpg?628\";}i:3;a:4:{s:8:\"pic_name\";s:40:\"识得女人香-冰希利娇真我系列\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:1:\"3\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-3-3.jpg?851\";}}}}', '切换小图');
INSERT INTO `tr_web_code` VALUES ('121', '121', 'array', 'sale_list', 'a:5:{i:3;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"热卖商品\";}s:10:\"goods_list\";a:5:{i:231;a:5:{s:8:\"goods_id\";s:3:\"231\";s:12:\"market_price\";s:7:\"1688.00\";s:10:\"goods_name\";s:91:\"至尊金奖 法国原瓶进口AOC红酒 任选一箱 红沙城堡红葡萄酒 原装进口\";s:11:\"goods_price\";s:6:\"899.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04423392298369303_240.jpg\";}i:232;a:5:{s:8:\"goods_id\";s:3:\"232\";s:12:\"market_price\";s:6:\"168.00\";s:10:\"goods_name\";s:50:\"中华老字号 东阿阿胶桃花姬阿胶糕300g\";s:11:\"goods_price\";s:6:\"150.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04423411880302392_240.png\";}i:53;a:5:{s:8:\"goods_id\";s:2:\"53\";s:12:\"market_price\";s:6:\"483.00\";s:10:\"goods_name\";s:69:\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 紫色\";s:11:\"goods_price\";s:5:\"99.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418254088878407_240.jpg\";}i:49;a:5:{s:8:\"goods_id\";s:2:\"49\";s:12:\"market_price\";s:6:\"358.00\";s:10:\"goods_name\";s:64:\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 黑色\";s:11:\"goods_price\";s:6:\"129.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418240955916042_240.jpg\";}i:48;a:5:{s:8:\"goods_id\";s:2:\"48\";s:12:\"market_price\";s:6:\"358.00\";s:10:\"goods_name\";s:64:\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 蓝色\";s:11:\"goods_price\";s:6:\"129.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418240795665638_240.jpg\";}}}i:1;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"疯狂抢购\";}s:10:\"goods_list\";a:5:{i:54;a:5:{s:8:\"goods_id\";s:2:\"54\";s:12:\"market_price\";s:6:\"483.00\";s:10:\"goods_name\";s:69:\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 粉色\";s:11:\"goods_price\";s:5:\"99.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418254218437108_240.jpg\";}i:52;a:5:{s:8:\"goods_id\";s:2:\"52\";s:12:\"market_price\";s:6:\"483.00\";s:10:\"goods_name\";s:69:\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 白色\";s:11:\"goods_price\";s:5:\"99.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418253240878850_240.jpg\";}i:51;a:5:{s:8:\"goods_id\";s:2:\"51\";s:12:\"market_price\";s:6:\"358.00\";s:10:\"goods_name\";s:64:\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 灰色\";s:11:\"goods_price\";s:6:\"129.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418242684128103_240.jpg\";}i:50;a:5:{s:8:\"goods_id\";s:2:\"50\";s:12:\"market_price\";s:6:\"358.00\";s:10:\"goods_name\";s:64:\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 橙色\";s:11:\"goods_price\";s:6:\"129.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418241398474746_240.jpg\";}i:47;a:5:{s:8:\"goods_id\";s:2:\"47\";s:12:\"market_price\";s:6:\"358.00\";s:10:\"goods_name\";s:64:\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 梅红\";s:11:\"goods_price\";s:6:\"129.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418240641767556_240.jpg\";}}}i:2;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"猜您喜欢\";}s:10:\"goods_list\";a:5:{i:46;a:5:{s:8:\"goods_id\";s:2:\"46\";s:12:\"market_price\";s:6:\"358.00\";s:10:\"goods_name\";s:64:\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 绿色\";s:11:\"goods_price\";s:6:\"129.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418240378724556_240.jpg\";}i:44;a:5:{s:8:\"goods_id\";s:2:\"44\";s:12:\"market_price\";s:6:\"568.00\";s:10:\"goods_name\";s:67:\"2014春款打底毛衫拼色毛衣 长袖套头针织衫 莺 橙色\";s:11:\"goods_price\";s:6:\"179.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418211855225368_240.jpg\";}i:43;a:5:{s:8:\"goods_id\";s:2:\"43\";s:12:\"market_price\";s:6:\"568.00\";s:10:\"goods_name\";s:67:\"2014春款打底毛衫拼色毛衣 长袖套头针织衫 莺 绿色\";s:11:\"goods_price\";s:6:\"179.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418211211965600_240.jpg\";}i:42;a:5:{s:8:\"goods_id\";s:2:\"42\";s:12:\"market_price\";s:6:\"568.00\";s:10:\"goods_name\";s:67:\"2014春款打底毛衫拼色毛衣 长袖套头针织衫 莺 蓝色\";s:11:\"goods_price\";s:6:\"179.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418211646104580_240.jpg\";}i:41;a:5:{s:8:\"goods_id\";s:2:\"41\";s:12:\"market_price\";s:6:\"702.00\";s:10:\"goods_name\";s:72:\"正品 2014春装新款 女 绣花针织衫 开衫外套浮桑初 黑色\";s:11:\"goods_price\";s:6:\"189.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418207748921454_240.jpg\";}}}i:4;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"热评商品\";}s:10:\"goods_list\";a:5:{i:40;a:5:{s:8:\"goods_id\";s:2:\"40\";s:12:\"market_price\";s:6:\"702.00\";s:10:\"goods_name\";s:72:\"正品 2014春装新款 女 绣花针织衫 开衫外套浮桑初 梅红\";s:11:\"goods_price\";s:6:\"189.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418207471410641_240.jpg\";}i:39;a:5:{s:8:\"goods_id\";s:2:\"39\";s:12:\"market_price\";s:6:\"702.00\";s:10:\"goods_name\";s:72:\"正品 2014春装新款 女 绣花针织衫 开衫外套浮桑初 绿色\";s:11:\"goods_price\";s:6:\"189.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418206625430066_240.jpg\";}i:38;a:5:{s:8:\"goods_id\";s:2:\"38\";s:12:\"market_price\";s:6:\"702.00\";s:10:\"goods_name\";s:72:\"正品 2014春装新款 女 绣花针织衫 开衫外套浮桑初 蓝色\";s:11:\"goods_price\";s:6:\"189.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418207207476705_240.jpg\";}i:231;a:5:{s:8:\"goods_id\";s:3:\"231\";s:12:\"market_price\";s:7:\"1688.00\";s:10:\"goods_name\";s:91:\"至尊金奖 法国原瓶进口AOC红酒 任选一箱 红沙城堡红葡萄酒 原装进口\";s:11:\"goods_price\";s:6:\"899.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04423392298369303_240.jpg\";}i:232;a:5:{s:8:\"goods_id\";s:3:\"232\";s:12:\"market_price\";s:6:\"168.00\";s:10:\"goods_name\";s:50:\"中华老字号 东阿阿胶桃花姬阿胶糕300g\";s:11:\"goods_price\";s:6:\"150.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04423411880302392_240.png\";}}}i:5;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"新品上架\";}s:10:\"goods_list\";a:5:{i:46;a:5:{s:8:\"goods_id\";s:2:\"46\";s:12:\"market_price\";s:6:\"358.00\";s:10:\"goods_name\";s:64:\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 绿色\";s:11:\"goods_price\";s:6:\"129.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418240378724556_240.jpg\";}i:44;a:5:{s:8:\"goods_id\";s:2:\"44\";s:12:\"market_price\";s:6:\"568.00\";s:10:\"goods_name\";s:67:\"2014春款打底毛衫拼色毛衣 长袖套头针织衫 莺 橙色\";s:11:\"goods_price\";s:6:\"179.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418211855225368_240.jpg\";}i:50;a:5:{s:8:\"goods_id\";s:2:\"50\";s:12:\"market_price\";s:6:\"358.00\";s:10:\"goods_name\";s:64:\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 橙色\";s:11:\"goods_price\";s:6:\"129.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418241398474746_240.jpg\";}i:51;a:5:{s:8:\"goods_id\";s:2:\"51\";s:12:\"market_price\";s:6:\"358.00\";s:10:\"goods_name\";s:64:\"春装 披肩式 超短款 针织 衫开衫 女装 青鸟 灰色\";s:11:\"goods_price\";s:6:\"129.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418242684128103_240.jpg\";}i:52;a:5:{s:8:\"goods_id\";s:2:\"52\";s:12:\"market_price\";s:6:\"483.00\";s:10:\"goods_name\";s:69:\"新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 白色\";s:11:\"goods_price\";s:5:\"99.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04418253240878850_240.jpg\";}}}}', '促销区');
