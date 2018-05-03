/*
MySQL Data Transfer
Source Host: localhost
Source Database: db_yaohuifilm
Target Host: localhost
Target Database: db_yaohuifilm
Date: 2013/5/21 20:46:12
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码密',
  `limit` int(11) DEFAULT NULL COMMENT '限权',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tb_film
-- ----------------------------
CREATE TABLE `tb_film` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '一唯标识',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '影电名字',
  `director` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '导演',
  `year` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '份年',
  `pic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '海报地址',
  `stars` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '员演',
  `genre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '型类',
  `region` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地区',
  `language` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '语言',
  `length` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '片长',
  `date` date DEFAULT NULL COMMENT '上映时间',
  `summary` text COLLATE utf8_unicode_ci COMMENT '简介',
  `url` text COLLATE utf8_unicode_ci COMMENT '下载地址',
  `like` int(11) DEFAULT '0' COMMENT '欢喜次数',
  `watching` int(11) DEFAULT '0' COMMENT '想看',
  `watched` int(11) DEFAULT '0' COMMENT '已看',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tb_film_genre
-- ----------------------------
CREATE TABLE `tb_film_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '一唯标识',
  `id_film` int(11) DEFAULT NULL COMMENT '影电Id',
  `id_genre` int(11) DEFAULT NULL COMMENT '型类id',
  PRIMARY KEY (`id`),
  KEY `fk_film` (`id_film`),
  KEY `fk_genre` (`id_genre`),
  CONSTRAINT `fk_film` FOREIGN KEY (`id_film`) REFERENCES `tb_film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_genre` FOREIGN KEY (`id_genre`) REFERENCES `tb_genre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tb_genre
-- ----------------------------
CREATE TABLE `tb_genre` (
  `id` int(11) NOT NULL COMMENT '唯一标识',
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电影类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'yaohui', '123456', '1');
INSERT INTO `tb_film` VALUES ('1', '爆头', '沃尔特·希尔', '2013', '/poster/1367554574883.jpg', '西尔维斯特·史泰龙 / 姜成镐 / 莎拉·沙黑 / 阿德沃尔·阿吉纽依-艾格拜吉 / 杰森·莫玛', ' 动作 / 惊悚 / 犯罪 ', '美国', '英语', '90分钟', '2013-02-01', '一名泰国警察在一次追杀过程中头部中弹，所幸没有生命危险，只是从此以后眼中的世界以上下颠倒的形式存在。本来就喜欢探讨人性的深刻警察，在开始寻找陷害自己仇家的过程当中，更是以独特的视觉来审视这个污垢的世界。也把自己搅进无比复杂的各种情感和事件当中，影片结尾以再次被爆头来完结所有纠结的事端，完整谱写出一曲凄美的悲歌。！！', 'magnet:?xt=urn:btih:d6778fca5c7eb8ed59d8dedafb9c8828fc7e4faf&dn=%E3%80%90%E7%88%86%E5%A4%B4%28%E5%85%A8%E9%9D%A2%E8%A1%8C%E5%8A%A8%29%E3%80%91%E3%80%90DVDscr-RMVB.%E4%B8%AD%E5%AD%97%E3%80%91%E3%80%902013%E6%9C%80%E6%96%B0%E5%8F%B2%E6%B3%B0%E9%BE%99R%E7%BA%A7%E5%8A%A8%E4%BD%9C%E6%83%8A%E6%82%9A%E5%A4%A7%E7%89%87%E3%80%91', '7', '8', '8');
INSERT INTO `tb_film` VALUES ('2', '寒战', '梁乐民 / 陆剑青', '2012', '/poster/1367401275887.jpg', '郭富城 / 梁家辉 / 李治廷 / 彭于晏 / 杨采妮', ' 剧情 / 动作 / 犯罪 ', '中国大陆 / 香港', '国语', '104分钟', '2012-11-08', '作为亚洲金融中心的香港被称作“最安全的城市”，岂料警局接到一通匿名电话，对方声称劫持了警队的一辆前线冲锋车以及车内的五名警员和武器装备。此次事件引起了香港警队高层的高度重视，适逢处长（王敏德 饰）出访国外，此时由鹰派人物行动副处长李文彬（梁家辉 饰）与年轻的管理副处长刘杰辉（郭富城 饰）一起负责这次案件，并将行动命名为“寒战”，李文彬任总指挥。李文彬的儿子（彭于晏 饰）也是人质之一，刘杰辉因此对李文彬父子产生怀疑。与此同时，匪徒展开了进一步行动：警察被杀、爆炸案频发……到底是谁在将整个警队玩弄于鼓掌之中？香港真的是“最安全的城市”吗？', 'magnet:?xt=urn:btih:0e41df167ee450558043671c171d8707941dffd0&dn=%5B2013.01.29%5D%E5%AF%92%E6%88%98%5B2012%E5%B9%B4%E4%B8%AD%E5%9B%BD%E7%8A%AF%E7%BD%AA%E5%89%A7%E6%83%85%28MKV%29%5D%EF%BC%88%E5%B8%9D%E5%9B%BD%E5%87%BA%E5%93%81%EF%BC%89', '2', '3', '3');
INSERT INTO `tb_film` VALUES ('5', '功夫熊猫2', '余仁英', '2011', '/poster/1367402306471.jpg', '杰克·布莱克 / 安吉丽娜·朱莉 / 杨紫琼 / 加里·奥德曼 / 成龙', ' 动作 / 喜剧 / 剧情 ', '美国', '英语', '91分钟', '2011-05-28', '上一部中，熊猫阿宝（杰克·布莱克 Jack Black 配音）功成名就，成为名震四方的神龙大侠。平日里他随同师傅（达斯汀·霍夫曼 Dustin Hoffman 配音）以及盖世五侠：悍娇虎 （安吉丽娜·朱莉 Angelina Jolie 配音）、猴王（成龙 Jackie Chan 配音）、快螳螂（塞斯·罗根 Seth Rogen 配音）、俏小龙（刘玉玲 Lucy Liu 配音）、灵鹤（大卫·克罗斯 David Cross 配音）在和平谷修炼，生活悠哉游哉。这一日，一伙恶徒闯入山谷抢夺金属材料，在与他们交手中阿宝意外产生幻觉，由此对自己的身世感到疑惑。 \r\n　　另一方面，恶徒的魁首白孔雀沈王爷（加里·奥德曼 Gary Oldman 配音）正图谋闯入王宫，称霸全中国。新的正邪大战拉开序幕，阿宝他们面临前所未有的挑战……', 'magnet:?xt=urn:btih:1a61b5d07e2c7cd33e41056370c62d496528b766&dn=%E9%A3%9E%E9%B8%9F%E5%A8%B1%E4%B9%90%5Bbbs.hdbird.com%5D.%E5%8A%9F%E5%A4%AB%E7%86%8A%E7%8C%AB2.720p.%E5%9B%BD%E8%8B%B1%E5%8F%8C%E8%AF%AD', '3', '4', '0');
INSERT INTO `tb_film` VALUES ('6', '太极2：英雄崛起 ', '冯德伦', '2012', '/poster/1368795565736.jpg', '梁家辉 / 袁晓超 / 杨颖 / 彭于晏 / 冯绍峰', ' 喜剧 / 喜剧 / 科幻 ', '中国大陆 / 香港', '国语', '95分钟', '2012-11-01', '在帮助陈家沟成功阻击特洛伊后，痴痴傻傻地杨露禅（袁晓超 饰）和陈玉娘（杨颖 饰）喜结连理。可就在大喜的日子里，陈家大哥栽秧（冯绍峰 饰）携妻子允儿（谢欣颖 饰）回到家中。家人团聚，自是一番旧情重叙，独掌门人陈长兴（梁家辉 饰）对长子的到来心存顾虑，反对天资聪慧的露禅寄予厚望。在此之后，接二连三的不安定悄悄在陈家沟滋生。栽秧向族人说起了铜钟夜响和拳法不传外姓人的渊源，致令全村人视露禅有如洪水猛兽，势将其赶出陈家沟。在栽秧种种险恶用心之后，怀着一颗复仇之心的方子敬（彭于晏 饰）的身影时隐时现。 \r\n　　在东西方文明剧烈碰撞的世纪之交，露禅和陈家沟的人们面临着前所未有的生死考验……', 'magnet:?xt=urn:btih:921e5423de05932d8b6f4f2b75141d3a0dd552f1&dn=%E6%A2%A6%E5%B9%BB%E5%A4%A9%E5%A0%82%C2%B7%E9%BE%99%E7%BD%91%28killman.net%29.720p.%E5%A4%AA%E6%9E%812%EF%BC%9A%E8%8B%B1%E9%9B%84%E5%B4%9B%E8%B5%B7', '0', '0', '0');
INSERT INTO `tb_film` VALUES ('7', '虎胆龙威5', '约翰·摩尔', '2013', '/poster/1367403051630.jpg', '布鲁斯·威利斯 / 杰·科特尼 / 塞巴斯蒂安·科赫 / 玛丽·伊丽莎白·文斯蒂德 / 俞莉亚·斯尼吉尔', ' 动作 / 犯罪 / 惊悚 ', '美国', '英语', '98分钟', '2013-03-14', '虽饱经枪林弹雨洗礼，但是孤胆英雄约翰·麦克莱恩（布鲁斯·威利斯 Bruce Willis 饰）与儿子杰克（杰·科特尼 Jai Courtney 饰）之间依然如同普通父子一样，有着不可逾越的深深隔阂。失去联络许多年，好不容易得到儿子消息的约翰，却发现杰克因多项罪名的指控在莫斯科沦为阶下囚，面临死刑威胁。他未作迟疑，启程前往遥远的俄罗斯。开庭当天，一伙身份不明之人连环爆炸袭击法庭，其目标直指同样遭到指控的俄罗斯富翁尤里·科马罗夫（塞巴斯蒂安·科赫 Sebastian Koch 饰）。混乱之中，杰克护送尤里逃脱，其囚徒背后的秘密身份正逐渐浮出水面。 \r\n　　异国他乡，孤立无援，麦克莱恩父子只有依靠彼此逃出生天……', 'magnet:?xt=urn:btih:55c337a378d82bbf8ef16663882728dbcff946c4&dn=%E3%80%90%E8%99%8E%E8%83%86%E9%BE%99%E5%A8%815%E3%80%91%E3%80%90DVDscr-RMVB.%E4%B8%AD%E5%AD%97%E3%80%91%E3%80%902013%E6%9C%80%E6%96%B0%E5%B8%83%E9%B2%81%E6%96%AF%C2%B7%E5%A8%81%E5%88%A9%E6%96%AFR%E7%BA%A7%E5%8A%A8%E4%BD%9C%E5%A4%A7%E7%89%87%E3%80%91', '1', '2', '1');
INSERT INTO `tb_film` VALUES ('8', '遗落战境', '约瑟夫·科辛斯基', '2013', '/poster/1367403348447.jpg', '汤姆·克鲁斯 / 摩根·弗里曼 / 欧嘉·柯瑞兰寇 / 尼可拉·科斯特-瓦尔道 / 佐伊·贝尔', ' 动作 / 科幻 / 战争 ', '美国', '英语', '126分钟', '2013-05-10', '公元2017年在经历了一次毁灭性的大战之后地球变成一片废墟和荒芜，人类移居到云层之上和外太空。60年后作为少数驻扎在地球的维修员之一，杰克哈珀（汤姆克鲁斯 饰）和他的搭档朱丽亚（安德丽亚·瑞斯波罗格 饰）的任务是维修地球上的战争机器以确保外星生物被清除。当天空坠落的飞船带来 一位似曾相识女子（欧嘉·柯瑞兰寇 饰），杰克的内心深处的记忆开始被唤醒。而他的生活也因此发生了一系列转变，杰克开始怀疑他所知的一切。而之后一位神秘人物（摩根弗里曼 饰）的出现又会向杰克揭示他自己和人类怎样的命运？', 'magnet:?xt=urn:btih:371c76ab6ae76084c254c8779a931ca8c127d5f8&dn=%E3%80%90%E5%80%A9%E5%BD%B1%E7%BF%A9%E7%BF%A9www.71pp.net%E3%80%91%E9%81%97%E5%BF%98%E6%98%9F%E7%90%83_%E6%B8%85%E6%99%B0TC%E4%B8%AD%E8%8B%B1%E5%8F%8C%E5%AD%97.rmvb', '0', '0', '0');
INSERT INTO `tb_film` VALUES ('9', '生化危机5：惩罚', '保罗·安德森', '2013', '/poster/1367403474709.jpg', '米拉·乔沃维奇 / 米歇尔·罗德里格兹 / 西耶娜·盖尔利 / 李冰冰 / 凯文·杜兰', ' 喜剧 / 剧情 / 爱情 ', '德国 / 加拿大 / 美国', '英语', '96分钟', '2013-03-17', '在上一集中，爱丽丝（米拉·乔沃维奇 Milla Jovovich 饰）救出了被冷冻的同伴们，众人在离开之际却被赶来的雇佣兵赶尽杀绝。T病毒使红皇后（Megan Charpentier 饰）的程序发生了错误，变得残暴嗜血的她想要杀死最后的人类毁灭地球。唯一能够阻止红皇后的只有爱丽丝一人。而此刻，失去了能力的爱丽丝却被保护伞公司囚禁在位于海底的秘密基地中。威斯克（肖恩·罗伯茨 Shawn Roberts 饰）通过病毒侵入了保护伞公司的系统，他放走了爱丽丝并告诉她，她是人类最后的希望，而为了拯救人类，他们必须冰释前嫌共同抵抗更强大的敌人。爱丽丝遇见了保护伞公司的前员工艾达王（李冰冰 饰），两人一路上奋勇杀敌结下了深厚的友谊。同时，爱丽丝旧日的战友们也组成了一个小分队，从外向内进行突围。 \r\n　　保护伞公司在海底建造了逼真的模拟城市，并使用克隆人作为T病毒的实验对象，为了抵达出口，爱丽丝一行人必须穿越东京、纽约、华盛顿和莫斯科四座城市，而每座城市中，都有属于它的丧尸们在蠢蠢欲动。', 'magnet:?xt=urn:btih:a599290cb9f4488cf306bb6c871f10d3e7e5d969&dn=%E6%A2%A6%E5%B9%BB%E5%A4%A9%E5%A0%82%C2%B7%E9%BE%99%E7%BD%91%28killman.net%29.720p.%E7%94%9F%E5%8C%96%E5%8D%B1%E6%9C%BA5%EF%BC%9A%E6%83%A9%E7%BD%9A', '0', '0', '0');
INSERT INTO `tb_film` VALUES ('10', '巨人捕手杰克', '布莱恩·辛格', '2013', '/poster/1368795733260.jpg', '尼古拉斯·霍尔特 / 埃莉诺·汤姆林森 / 伊万·麦克格雷格 / 斯坦利·图齐 / 埃迪·马森', ' 剧情 / 动作 / 惊悚 ', '美国', '英语', '114分钟', '2013-03-25', '在长达几个世纪的放逐之后，这些巨人第一次重回大地，他们誓要夺回失去的领土。而杰克（尼古拉斯·霍尔特 Nicholas Hoult 饰）为了阻挡巨人的脚步也被迫加入这场生死攸关的战斗。为了国家和人民，以及勇敢的伊莎贝尔公主（艾莉诺·汤姆林森 Eleanor Tomlinson 饰）对于自己的青睐，杰克必须直面他一度认为只存在于传奇中，不可阻挡的对手，而他自己最终成就了属于自己的传奇……', 'magnet:?xt=urn:btih:65bdf54b25bf0c4974d9e09aeecba73b73653a87&dn=JACK.THE.GIANT.KILLER.2013.DVDrip.Swesub.XviD.AC3-Mr_KeFF', '1', '0', '0');
INSERT INTO `tb_film_genre` VALUES ('4', '2', '8');
INSERT INTO `tb_film_genre` VALUES ('5', '2', '10');
INSERT INTO `tb_film_genre` VALUES ('6', '2', '2');
INSERT INTO `tb_film_genre` VALUES ('13', '1', '2');
INSERT INTO `tb_film_genre` VALUES ('14', '1', '9');
INSERT INTO `tb_film_genre` VALUES ('15', '1', '8');
INSERT INTO `tb_film_genre` VALUES ('16', '5', '2');
INSERT INTO `tb_film_genre` VALUES ('17', '5', '3');
INSERT INTO `tb_film_genre` VALUES ('18', '5', '10');
INSERT INTO `tb_film_genre` VALUES ('22', '7', '2');
INSERT INTO `tb_film_genre` VALUES ('23', '7', '8');
INSERT INTO `tb_film_genre` VALUES ('24', '7', '9');
INSERT INTO `tb_film_genre` VALUES ('25', '8', '2');
INSERT INTO `tb_film_genre` VALUES ('26', '8', '1');
INSERT INTO `tb_film_genre` VALUES ('27', '8', '7');
INSERT INTO `tb_film_genre` VALUES ('28', '9', '3');
INSERT INTO `tb_film_genre` VALUES ('29', '9', '10');
INSERT INTO `tb_film_genre` VALUES ('30', '9', '5');
INSERT INTO `tb_film_genre` VALUES ('37', '6', '3');
INSERT INTO `tb_film_genre` VALUES ('38', '6', '3');
INSERT INTO `tb_film_genre` VALUES ('39', '6', '1');
INSERT INTO `tb_film_genre` VALUES ('40', '10', '10');
INSERT INTO `tb_film_genre` VALUES ('41', '10', '2');
INSERT INTO `tb_film_genre` VALUES ('42', '10', '9');
INSERT INTO `tb_genre` VALUES ('1', '科幻');
INSERT INTO `tb_genre` VALUES ('2', '动作');
INSERT INTO `tb_genre` VALUES ('3', '喜剧');
INSERT INTO `tb_genre` VALUES ('4', '武侠');
INSERT INTO `tb_genre` VALUES ('5', '爱情');
INSERT INTO `tb_genre` VALUES ('6', '恐怖');
INSERT INTO `tb_genre` VALUES ('7', '战争');
INSERT INTO `tb_genre` VALUES ('8', '犯罪');
INSERT INTO `tb_genre` VALUES ('9', '惊悚');
INSERT INTO `tb_genre` VALUES ('10', '剧情');
