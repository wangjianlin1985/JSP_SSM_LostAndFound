/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : swzl

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-07-29 13:11:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `byx`
-- ----------------------------
DROP TABLE IF EXISTS `byx`;
CREATE TABLE `byx` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(128) default NULL,
  `name` varchar(128) default NULL,
  `time` varchar(32) default NULL,
  `content` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of byx
-- ----------------------------
INSERT INTO `byx` VALUES ('1', '测试AS', '张三ASS', '2018-03-30 20:20', '<p><img src=\"/swzl/ueditor/jsp/upload/image/20180330/1522412437564028869.png\" title=\"1522412437564028869.png\" alt=\"司机信息.png\"/>&nbsp; &nbsp; 表扬三张</p>');

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键ID',
  `pid` int(11) default NULL COMMENT '上级部门ID',
  `name` varchar(128) default NULL COMMENT '部门名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '0', 'XX学校');
INSERT INTO `dept` VALUES ('15', '1', '2016级');
INSERT INTO `dept` VALUES ('16', '1', '2017级');
INSERT INTO `dept` VALUES ('17', '1', '2015级');
INSERT INTO `dept` VALUES ('18', '15', '1班');
INSERT INTO `dept` VALUES ('19', '15', '2班');
INSERT INTO `dept` VALUES ('20', '15', '3班');
INSERT INTO `dept` VALUES ('21', '16', '1班');
INSERT INTO `dept` VALUES ('22', '16', '2班');
INSERT INTO `dept` VALUES ('23', '16', '3班');

-- ----------------------------
-- Table structure for `lq`
-- ----------------------------
DROP TABLE IF EXISTS `lq`;
CREATE TABLE `lq` (
  `id` int(11) NOT NULL auto_increment COMMENT '领取信息',
  `name` varchar(32) default NULL COMMENT '姓名',
  `phone` varchar(128) default NULL COMMENT '联系方式',
  `swzlid` int(11) default NULL COMMENT '失物招领的ID',
  `time` varchar(32) default NULL COMMENT '领取时间',
  `userid` int(11) default NULL COMMENT '经办人',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lq
-- ----------------------------
INSERT INTO `lq` VALUES ('2', '李四', '2018年3月30号', '2', '2018-03-31 14:11', '1');
INSERT INTO `lq` VALUES ('3', '张三', '1386712312', '3', '2018-03-31 14:35', '1');
INSERT INTO `lq` VALUES ('4', '李思琪', '13983083423', '4', '2018-07-29 13:04', '19');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menuId` int(10) NOT NULL auto_increment COMMENT '菜单ID',
  `menuName` varchar(50) default NULL COMMENT '名称',
  `menuUrl` varchar(100) default NULL COMMENT '方法',
  `parentId` int(11) default NULL COMMENT '父ID',
  `menuDescription` varchar(200) default NULL COMMENT '描述',
  `state` varchar(20) default NULL COMMENT '状态/OPEN/CLOSED',
  `iconCls` varchar(50) default NULL COMMENT '图标',
  `seq` int(11) default NULL COMMENT '顺序排序',
  PRIMARY KEY  (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '失物招领管理系统', '', '-1', '主菜单', 'closed', 'icon-home', '1');
INSERT INTO `menu` VALUES ('2', '系统管理', '', '1', '', 'closed', 'icon-permission', '1');
INSERT INTO `menu` VALUES ('5', '菜单管理', 'menu/menuIndex.htm', '2', '', 'open', 'icon-menuManage', '4');
INSERT INTO `menu` VALUES ('6', '用户管理', 'user/userIndex.htm', '2', '', 'open', 'icon-489', '5');
INSERT INTO `menu` VALUES ('7', '角色管理', 'role/roleIndex.htm', '2', '', 'open', 'icon-486', '3');
INSERT INTO `menu` VALUES ('27', '部门管理', 'dept/index.htm', '2', '', 'open', 'icon-', '4');
INSERT INTO `menu` VALUES ('49', '寻物启事', '', '1', '', 'closed', 'icon-', '2');
INSERT INTO `menu` VALUES ('50', '我发布的', 'xwqs/myIndex.htm', '49', '', 'open', 'icon-', '1');
INSERT INTO `menu` VALUES ('51', '寻物信息', 'xwqs/index.htm', '49', '', 'open', 'icon-', '2');
INSERT INTO `menu` VALUES ('52', '失物招领', '', '1', '', 'closed', 'icon-', '3');
INSERT INTO `menu` VALUES ('53', '我的发布', 'swzl/myIndex.htm', '52', '', 'open', 'icon-', '1');
INSERT INTO `menu` VALUES ('54', '失物招领', 'swzl/index.htm', '52', '', 'open', 'icon-', '2');
INSERT INTO `menu` VALUES ('55', '领取信息', 'lq/index.htm', '52', '', 'open', 'icon-', '3');
INSERT INTO `menu` VALUES ('56', '信息管理', '', '1', '', 'closed', 'icon-', '4');
INSERT INTO `menu` VALUES ('57', '通知公告', 'notice/index.htm', '56', '给学生看的', 'open', 'icon-', '1');
INSERT INTO `menu` VALUES ('58', '通知公告', 'notice/myIndex.htm', '56', '给管理员看的', 'open', 'icon-', '2');
INSERT INTO `menu` VALUES ('59', '表扬信', 'byx/index.htm', '56', '给管理员的', 'open', 'icon-', '3');
INSERT INTO `menu` VALUES ('60', '表扬信', 'byx/myIndex.htm', '56', '给学生的', 'open', 'icon-', '4');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(32) default NULL,
  `content` text,
  `time` varchar(32) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('2', '2017年钢铁煤炭去产能拟激励省份名单公示 ', '<p>　按照《国务院办公厅关于对真抓实干成效明显地方加大激励支持力度的通知》（国办发〔2016〕82号）有关要求，财政部、发展改革委对2017年钢铁煤炭去产能激励省份名单进行了研究，综合考虑各地区去产能实际完成情况、职工安置情况、工作积极主动性等方面，此次拟提请激励通报表扬的名单如下：</p><p>　　钢铁方面：河北、江苏、山东、河南、重庆；</p><p>　　煤炭方面：河北、山西、内蒙古、河南、辽宁。</p><p>　　现将名单予以公示，公示时间为2018年3月26日至2018年3月28日。如有意见，请在公示期内以书面（实名）形式反馈财政部经济建设司。</p><p>　　联系电话：010-68552862</p><p>　　传&nbsp;&nbsp;&nbsp; 真：010-68552977</p><p>　　</p><p><br/></p>', '2018-03-31 14:44');

-- ----------------------------
-- Table structure for `operation`
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation` (
  `operationId` int(11) NOT NULL auto_increment COMMENT '具体的方法',
  `operationName` varchar(100) default NULL COMMENT '方法名',
  `menuId` int(11) default NULL COMMENT '所属菜单',
  `menuName` varchar(50) default NULL,
  PRIMARY KEY  (`operationId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=10052 DEFAULT CHARSET=utf8 COMMENT='具体的页面按钮上的方法\r\n（此自增ID至少从10000开始）';

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES ('10000', '添加', '5', '菜单管理');
INSERT INTO `operation` VALUES ('10001', '修改', '5', '菜单管理');
INSERT INTO `operation` VALUES ('10002', '删除', '5', '菜单管理');
INSERT INTO `operation` VALUES ('10003', '添加', '6', '用户管理');
INSERT INTO `operation` VALUES ('10004', '修改', '6', '用户管理');
INSERT INTO `operation` VALUES ('10005', '删除', '6', '用户管理');
INSERT INTO `operation` VALUES ('10006', '添加', '7', '角色管理');
INSERT INTO `operation` VALUES ('10007', '修改', '7', '角色管理');
INSERT INTO `operation` VALUES ('10008', '删除', '7', '角色管理');
INSERT INTO `operation` VALUES ('10009', '授权', '7', '角色管理');
INSERT INTO `operation` VALUES ('10014', '按钮管理', '5', '菜单管理');
INSERT INTO `operation` VALUES ('10016', '添加', '27', '部门管理');
INSERT INTO `operation` VALUES ('10017', '修改', '27', '部门管理');
INSERT INTO `operation` VALUES ('10018', '删除', '27', '部门管理');
INSERT INTO `operation` VALUES ('10036', '发布', '50', '我的发布');
INSERT INTO `operation` VALUES ('10037', '修改', '50', '我的发布');
INSERT INTO `operation` VALUES ('10038', '改变状态', '50', '我的发布');
INSERT INTO `operation` VALUES ('10039', '删除', '50', '我的发布');
INSERT INTO `operation` VALUES ('10040', '发布', '53', '我的发布');
INSERT INTO `operation` VALUES ('10041', '修改', '53', '我的发布');
INSERT INTO `operation` VALUES ('10042', '领取', '53', '我的发布');
INSERT INTO `operation` VALUES ('10043', '删除', '53', '我的发布');
INSERT INTO `operation` VALUES ('10044', '修改', '55', '领取信息');
INSERT INTO `operation` VALUES ('10045', '删除', '55', '领取信息');
INSERT INTO `operation` VALUES ('10046', '添加', '58', '通知公告');
INSERT INTO `operation` VALUES ('10047', '修改', '58', '通知公告');
INSERT INTO `operation` VALUES ('10048', '删除', '58', '通知公告');
INSERT INTO `operation` VALUES ('10049', '添加', '60', '表扬信');
INSERT INTO `operation` VALUES ('10050', '修改', '60', '表扬信');
INSERT INTO `operation` VALUES ('10051', '删除', '60', '表扬信');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL auto_increment COMMENT '角色ID',
  `roleName` varchar(20) default NULL COMMENT '角色名称',
  `menuIds` varchar(200) default NULL COMMENT '菜单IDs',
  `operationIds` varchar(200) default NULL COMMENT '按钮IDS',
  `roleDescription` varchar(200) default NULL COMMENT '描述',
  PRIMARY KEY  (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '1,2,7,5,27,6,49,50,52,53,55,56,58,60', '10006,10007,10008,10009,10000,10001,10002,10014,10016,10017,10018,10003,10004,10005,10036,10037,10038,10039,10040,10041,10042,10043,10044,10045,10046,10047,10048,10049,10050,10051', '拥有全部权限的超级管理员角色');
INSERT INTO `role` VALUES ('5', '学生', '1,49,50,51,52,53,54,55,56,57,59', '10036,10037,10038,10040,10041,10042', '');

-- ----------------------------
-- Table structure for `swzl`
-- ----------------------------
DROP TABLE IF EXISTS `swzl`;
CREATE TABLE `swzl` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) default NULL COMMENT '发布人',
  `code` varchar(32) default NULL COMMENT '编号',
  `title` varchar(128) default NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `time` varchar(32) default NULL COMMENT '时间',
  `status` varchar(32) default NULL COMMENT '状态',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swzl
-- ----------------------------
INSERT INTO `swzl` VALUES ('2', '1', '20180331141111', '这个是失物招领', '<p>&nbsp; &nbsp; 啊啊啊啊啊啊啊</p>', '2018-03-31 14:11', '已领取');
INSERT INTO `swzl` VALUES ('3', '1', '20180331143257', '这里面是失误信息', '<p>&nbsp; &nbsp; 啊啊</p>', '2018-03-31 14:32', '已领取');
INSERT INTO `swzl` VALUES ('4', '19', '20180729130203', '捡到一个金士顿u盘', '<p>今天下午我捡到了一个金士顿的u盘，是哪个同学的，请联系我认领！<br/><br/><img src=\"/swzl/ueditor/jsp/upload/image/20180729/1532840488615035708.jpg\" title=\"1532840488615035708.jpg\" alt=\"timg (1).jpg\" width=\"514\" height=\"379\"/></p>', '2018-07-29 13:02', '已领取');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL auto_increment COMMENT '用户ID',
  `userName` varchar(20) default NULL COMMENT '用户名',
  `realName` varchar(32) default NULL COMMENT '姓名',
  `password` varchar(20) default NULL COMMENT '密码',
  `userType` tinyint(4) default NULL COMMENT '用户类型',
  `roleId` int(11) default NULL COMMENT '角色ID',
  `userDescription` varchar(200) default NULL COMMENT '描述信息',
  `deptId` int(11) default NULL COMMENT '部门ID',
  PRIMARY KEY  (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '超管', 'admin', '1', '1', '1', '1');
INSERT INTO `user` VALUES ('19', '1111', '1111', '1111', '2', '5', null, '20');
INSERT INTO `user` VALUES ('20', '222', '222', '222', '2', '5', null, '21');

-- ----------------------------
-- Table structure for `xwqs`
-- ----------------------------
DROP TABLE IF EXISTS `xwqs`;
CREATE TABLE `xwqs` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(256) default NULL COMMENT '内容',
  `content` text COMMENT '标题',
  `time` varchar(32) default NULL COMMENT '时间',
  `status` varchar(32) default NULL COMMENT '发布中',
  `userId` int(11) default NULL COMMENT '发布人',
  `code` varchar(32) default NULL COMMENT '编号',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xwqs
-- ----------------------------
INSERT INTO `xwqs` VALUES ('7', '习近平举行仪式欢迎纳米比亚总统访华并同其举行会谈', '<p>	&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">　<strong>习近平举行仪式欢迎纳米比亚总统访华</strong></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　国家主席习近平29日下午在人民大会堂北大厅举行仪式，欢迎纳米比亚总统哈格·戈特弗里德·根哥布对我国进行国事访问。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　天安门广场上鸣礼炮21响。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　习近平主席夫人彭丽媛，全国人大常委会副委员长吉炳轩，国务委员兼外交部部长王毅，全国政协副主席马飚、何立峰等出席欢迎仪式。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　陪同根哥布访华的有总统夫人、副总理兼国际关系与合作部部长、驻华大使等。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　军乐团奏纳中两国国歌。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　根哥布在习近平陪同下检阅中国人民解放军三军仪仗队。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　根哥布是应习近平的邀请对我国进行国事访问的。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">　　<strong>习近平同纳米比亚总统举行会谈</strong></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　欢迎仪式后，习近平主席在人民大会堂同根哥布总统举行会谈。两国元首一致决定，建立中纳全面战略合作伙伴关系。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　习近平指出，中纳两国两党传统友谊深厚，在反对帝国主义、殖民主义的斗争中并肩作战，在国家建设中相互支持，友好合作不断巩固，值得双方倍加珍惜。当前，中纳两国各自发展都已进入新阶段，发展战略高度契合，执政理念多有相通，经济合作优势互补。作为“全天候”朋友，中方愿同纳方一道，推动中纳关系继续稳步、积极发展，更好造福两国人民。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　习近平强调，中纳要在全面战略合作伙伴关系新起点上，加强高层交往及各层级友好往来与合作，不断增进政治互信，在涉及彼此核心利益和重大关切问题上坚定相互支持。要抓好优先领域和重点项目，结合各自优势，充分挖掘潜力，不断深化两国互利共赢合作。中方欢迎纳方积极参与“一带一路”建设，愿同纳方共同抓住机遇，加强政策沟通和规划对接，推进重点领域合作。要加强人文交流，夯实两国友好的社会民意基础。中方愿同纳方加大野生动物保护合作，对走私野生动物制品等违法行动绝不姑息袒护。要加强在国际地区事务中沟通协调，更好维护非洲和发展中国家共同利益。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　根哥布首先代表纳米比亚政府和人民再次祝贺习近平当选中国国家主席，祝贺中国在以习近平为核心的中国党和政府领导下取得经济社会发展巨大成就，祝愿中国早日建设成为富强民主文明和谐美丽的社会主义现代化强国。根哥布表示，很高兴来到中国这一非洲最好朋友的国度访问。纳中友谊源远流长，纳米比亚高度重视对华关系，愿提升两国关系水平，加强同中国在基础设施、可持续发展、人力资源、技术、减贫、人文等领域交流合作，落实好重大合作项目，实现互利共赢。中国从来没有殖民过非洲、从来没有掠夺过非洲，一直平等对待非洲中小国家。中国历史上支持我们的正义事业，今天继续帮助我们的发展。中国才是非洲的真诚伙伴和朋友。非洲人民反对那些无端指责中国的不实之辞。纳米比亚积极支持中非合作论坛框架下合作，支持加强中非在国际事物中协调配合。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　习近平指出，中非是休戚与共的命运共同体和合作共赢的利益共同体，中非关系是南南合作的典范。在中国还不富裕的年代，毛泽东主席等中国老一代领导人就表示我们克服困难也要支持非洲。今天，中国发展起来了，我们无论是在情义上还是实力上都应更多地帮助非洲。中方将继续秉持正确义利观和真实亲诚对非政策理念，把中国发展同助力非洲发展紧密结合起来，实现合作共赢、共同发展，特别是让非洲各国通过中非合作增强自主可持续发展能力。相信中非将携手构建更加紧密的中非命运共同体，不断为中非关系发展注入新动力。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　会谈后，两国元首还共同见证了基础设施、融资、检验检疫等领域双边合作文件的签署。</p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 1.75em; font-family: Arial, 宋体; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　王毅、何立峰等参加上述活动。</p><p><br/></p>', '2018-03-30 13:49', '发布中', '19', '20180330134910');
INSERT INTO `xwqs` VALUES ('8', '这里面是寻物启事信息', '<p>&nbsp; &nbsp; 内容</p>', '2018-03-31 14:30', '发布中', '1', '20180331143042');
INSERT INTO `xwqs` VALUES ('9', '我的苹果7掉了', '<p>中午吃饭的时候掉在了第一食堂里面，是一个黑色的，谁看到了哦？</p><p><img src=\"/swzl/ueditor/jsp/upload/image/20180729/1532840151291095103.jpg\" title=\"1532840151291095103.jpg\" alt=\"timg.jpg\" width=\"479\" height=\"410\"/><br/></p>', '2018-07-29 12:56', '发布中', '19', '20180729125647');
