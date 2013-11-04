/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : weibo

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2013-10-17 11:55:39
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `hl_shop_info`
-- ----------------------------
DROP TABLE IF EXISTS `hl_shop_info`;
CREATE TABLE `hl_shop_info` (
  `shopid` varchar(20) NOT NULL,
  `shopname` varchar(50) NOT NULL,
  `latitude` double(10,0) NOT NULL,
  `longitude` double(10,0) NOT NULL,
  `access_token` varchar(50) NOT NULL,
  PRIMARY KEY  (`shopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hl_shop_info
-- ----------------------------
INSERT INTO `hl_shop_info` VALUES ('3500295624', 'xxxx', '-1', '-1', '2.00CnssoD9c9W7D1048e4221b00tK9p');

-- ----------------------------
-- Table structure for `t_crawler_target`
-- ----------------------------
DROP TABLE IF EXISTS `t_crawler_target`;
CREATE TABLE `t_crawler_target` (
  `user_id` varchar(20) NOT NULL default '',
  `access_token` varchar(40) NOT NULL default '0',
  `status_id` varchar(20) NOT NULL default '0',
  `last_status_id` varchar(20) NOT NULL default '0',
  `friend_since_id` varchar(20) NOT NULL default '0',
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_crawler_target
-- ----------------------------
INSERT INTO `t_crawler_target` VALUES ('3500295624', '2.00CnssoD9c9W7D1048e4221b00tK9p', '3625675380125523', '0', '3619131301844969');

-- ----------------------------
-- Table structure for `t_status_fresh`
-- ----------------------------
DROP TABLE IF EXISTS `t_status_fresh`;
CREATE TABLE `t_status_fresh` (
  `status_id` bigint(20) NOT NULL COMMENT '寰?崥ID',
  `mid` bigint(20) NOT NULL COMMENT '寰?崥MID',
  `idstr` varchar(20) NOT NULL COMMENT '瀛楃?涓插瀷鐨勫井鍗欼D',
  `created_at` datetime NOT NULL COMMENT '寰?崥鍒涘缓鏃堕棿',
  `text` varchar(280) NOT NULL COMMENT '寰?崥淇℃伅鍐呭?',
  `source` bit(1) NOT NULL default '' COMMENT '寰?崥鏉ユ簮锛屽幓 t_status_source琛ㄤ腑鏌ユ壘',
  `favorited` bit(1) NOT NULL default '\0' COMMENT '鏄?惁宸叉敹钘忥紝true锛氭槸锛宖alse锛氬惁',
  `truncated` bit(1) NOT NULL default '\0' COMMENT '鏄?惁琚?埅鏂?紝true锛氭槸锛宖alse锛氬惁',
  `in_reply_to_status_id` varchar(45) default NULL COMMENT '锛堟殏鏈?敮鎸侊級鍥炲?ID',
  `in_reply_to_user_id` varchar(45) default NULL COMMENT '锛堟殏鏈?敮鎸侊級鍥炲?浜篣ID',
  `in_reply_to_screen_name` varchar(30) default NULL COMMENT '锛堟殏鏈?敮鎸侊級鍥炲?浜烘樀绉',
  `thumbnail_pic` varchar(128) default NULL COMMENT '缂╃暐鍥剧墖鍦板潃锛屾病鏈夋椂涓嶈繑鍥炴?瀛楁?',
  `bmiddle_pic` varchar(128) default NULL COMMENT '涓?瓑灏哄?鍥剧墖鍦板潃锛屾病鏈夋椂涓嶈繑鍥炴?瀛楁?',
  `original_pic` varchar(128) default NULL COMMENT '鍘熷?鍥剧墖鍦板潃锛屾病鏈夋椂涓嶈繑鍥炴?瀛楁?',
  `geo` varchar(128) default NULL COMMENT '鍦扮悊淇℃伅瀛楁?锛屽?鏋滄湁锛屽氨鍘籺_status_geo琛ㄤ腑鎵捐?寰?崥ID瀵瑰簲鐨刧eo淇℃伅',
  `latitude` double default NULL,
  `longitude` double default NULL,
  `user_id` bigint(20) NOT NULL COMMENT '寰?崥浣滆?',
  `retweeted_status` bigint(20) default NULL COMMENT '琚?浆鍙戠殑鍘熷井鍗氫俊鎭?瓧娈碉紝褰撹?寰?崥涓鸿浆鍙戝井鍗氭椂杩斿洖',
  `reposts_count` int(11) NOT NULL default '0' COMMENT '杞?彂鏁',
  `comments_count` int(11) NOT NULL default '0' COMMENT '璇勮?鏁',
  `attitudes_count` int(11) NOT NULL default '0' COMMENT '琛ㄦ?鏁',
  `annotations` char(35) default NULL,
  `mlevel` int(11) default NULL COMMENT '鏆傛湭鏀?寔',
  `visible` bit(1) default '\0' COMMENT '寰?崥鐨勫彲瑙佹?鍙婃寚瀹氬彲瑙佸垎缁勪俊鎭??璇?bject涓璽ype鍙栧?锛?锛氭櫘閫氬井鍗氾紝1锛氱?瀵嗗井鍗氾紝3锛氭寚瀹氬垎缁勫井鍗氾紝4锛氬瘑鍙嬪井鍗氾紱list_id涓哄垎缁勭殑缁勫彿',
  `pic_urls` bit(1) default '\0' COMMENT '寰?崥閰嶅浘鍦板潃銆傚?鍥炬椂杩斿洖澶氬浘閾炬帴銆傛棤閰嶅浘杩斿洖鈥淸]鈥',
  PRIMARY KEY  (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_status_fresh
-- ----------------------------

-- ----------------------------
-- Table structure for `t_status_geo`
-- ----------------------------
DROP TABLE IF EXISTS `t_status_geo`;
CREATE TABLE `t_status_geo` (
  `status_id` bigint(20) NOT NULL COMMENT '寰?崥ID',
  `longitude` varchar(45) NOT NULL COMMENT '缁忓害鍧愭爣',
  `latitude` varchar(45) NOT NULL COMMENT '绾?害搴﹀潗鏍',
  `city` varchar(45) NOT NULL COMMENT '鎵?湪鍩庡競鐨勫煄甯備唬鐮',
  `province` varchar(45) NOT NULL COMMENT '鎵?湪鐪佷唤鐨勭渷浠戒唬鐮',
  `city_name` varchar(45) NOT NULL COMMENT '鎵?湪鍩庡競鐨勫煄甯傚悕绉',
  `province_name` varchar(45) NOT NULL COMMENT '鎵?湪鐪佷唤鐨勭渷浠藉悕绉',
  `address` varchar(45) NOT NULL COMMENT '鎵?湪鐨勫疄闄呭湴鍧?紝鍙?互涓虹┖',
  `pinyin` varchar(45) default NULL COMMENT '鍦板潃鐨勬眽璇?嫾闊筹紝涓嶆槸鎵?湁鎯呭喌閮戒細杩斿洖璇ュ瓧娈',
  `more` varchar(45) default NULL COMMENT '鏇村?淇℃伅锛屼笉鏄?墍鏈夋儏鍐甸兘浼氳繑鍥炶?瀛楁?',
  PRIMARY KEY  (`status_id`),
  UNIQUE KEY `id_UNIQUE` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='鍦扮悊淇℃伅瀛楁?geo';

-- ----------------------------
-- Records of t_status_geo
-- ----------------------------

-- ----------------------------
-- Table structure for `t_status_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_status_info`;
CREATE TABLE `t_status_info` (
  `status_id` bigint(20) NOT NULL COMMENT '寰?崥ID',
  `mid` bigint(20) NOT NULL COMMENT '寰?崥MID',
  `idstr` varchar(20) NOT NULL COMMENT '瀛楃?涓插瀷鐨勫井鍗欼D',
  `created_at` datetime NOT NULL COMMENT '寰?崥鍒涘缓鏃堕棿',
  `text` varchar(280) NOT NULL COMMENT '寰?崥淇℃伅鍐呭?',
  `source` bit(1) NOT NULL default '' COMMENT '寰?崥鏉ユ簮锛屽幓 t_status_source琛ㄤ腑鏌ユ壘',
  `favorited` bit(1) NOT NULL default '\0' COMMENT '鏄?惁宸叉敹钘忥紝true锛氭槸锛宖alse锛氬惁',
  `truncated` bit(1) NOT NULL default '\0' COMMENT '鏄?惁琚?埅鏂?紝true锛氭槸锛宖alse锛氬惁',
  `in_reply_to_status_id` varchar(45) default NULL COMMENT '锛堟殏鏈?敮鎸侊級鍥炲?ID',
  `in_reply_to_user_id` varchar(45) default NULL COMMENT '锛堟殏鏈?敮鎸侊級鍥炲?浜篣ID',
  `in_reply_to_screen_name` varchar(30) default NULL COMMENT '锛堟殏鏈?敮鎸侊級鍥炲?浜烘樀绉',
  `thumbnail_pic` varchar(128) default NULL COMMENT '缂╃暐鍥剧墖鍦板潃锛屾病鏈夋椂涓嶈繑鍥炴?瀛楁?',
  `bmiddle_pic` varchar(128) default NULL COMMENT '涓?瓑灏哄?鍥剧墖鍦板潃锛屾病鏈夋椂涓嶈繑鍥炴?瀛楁?',
  `original_pic` varchar(128) default NULL COMMENT '鍘熷?鍥剧墖鍦板潃锛屾病鏈夋椂涓嶈繑鍥炴?瀛楁?',
  `geo` varchar(128) default NULL COMMENT '鍦扮悊淇℃伅瀛楁?锛屽?鏋滄湁锛屽氨鍘籺_status_geo琛ㄤ腑鎵捐?寰?崥ID瀵瑰簲鐨刧eo淇℃伅',
  `latitude` double default NULL,
  `longitude` double default NULL,
  `user_id` bigint(20) NOT NULL COMMENT '寰?崥浣滆?',
  `retweeted_status` bigint(20) default NULL COMMENT '琚?浆鍙戠殑鍘熷井鍗氫俊鎭?瓧娈碉紝褰撹?寰?崥涓鸿浆鍙戝井鍗氭椂杩斿洖',
  `reposts_count` int(11) NOT NULL default '0' COMMENT '杞?彂鏁',
  `comments_count` int(11) NOT NULL default '0' COMMENT '璇勮?鏁',
  `attitudes_count` int(11) NOT NULL default '0' COMMENT '琛ㄦ?鏁',
  `annotations` char(35) default NULL,
  `mlevel` int(11) default NULL COMMENT '鏆傛湭鏀?寔',
  `visible` bit(1) default '\0' COMMENT '寰?崥鐨勫彲瑙佹?鍙婃寚瀹氬彲瑙佸垎缁勪俊鎭??璇?bject涓璽ype鍙栧?锛?锛氭櫘閫氬井鍗氾紝1锛氱?瀵嗗井鍗氾紝3锛氭寚瀹氬垎缁勫井鍗氾紝4锛氬瘑鍙嬪井鍗氾紱list_id涓哄垎缁勭殑缁勫彿',
  `pic_urls` bit(1) default '\0' COMMENT '寰?崥閰嶅浘鍦板潃銆傚?鍥炬椂杩斿洖澶氬浘閾炬帴銆傛棤閰嶅浘杩斿洖鈥淸]鈥',
  PRIMARY KEY  (`status_id`),
  UNIQUE KEY `id_UNIQUE` (`status_id`),
  KEY `user_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='寰?崥淇℃伅琛';

-- ----------------------------
-- Records of t_status_info
-- ----------------------------
INSERT INTO `t_status_info` VALUES ('3616608188264984', '3616608188264984', '3616608188264984', '2013-08-29 12:20:48', 'ebc', '', '\0', '\0', '-1', '-1', '', '', '', '', 'null', '-1', '-1', '3500295624', '0', '0', '0', '0', '', '0', '\0', '\0');
INSERT INTO `t_status_info` VALUES ('3618072705275980', '3618072705275980', '3618072705275980', '2013-09-02 13:20:16', 'time for work', '', '\0', '\0', '-1', '-1', '', '', '', '', 'null', '-1', '-1', '3500295624', '0', '0', '0', '0', '', '0', '\0', '\0');
INSERT INTO `t_status_info` VALUES ('3618072881453603', '3618072881453603', '3618072881453603', '2013-09-02 13:20:58', 'test', '', '\0', '\0', '-1', '-1', '', '', '', '', 'null', '-1', '-1', '3500295624', '0', '0', '0', '0', '', '0', '\0', '\0');
INSERT INTO `t_status_info` VALUES ('3619098011642230', '3619098011642230', '3619098011642230', '2013-09-05 09:14:28', '灏肩帥锛佸お鎯ㄤ簡', '', '\0', '\0', '-1', '-1', '', '', '', '', 'null', '-1', '-1', '1891212990', '3619096538979293', '38', '6', '0', '', '0', '\0', '\0');
INSERT INTO `t_status_info` VALUES ('3619107351733557', '3619107351733557', '3619107351733557', '2013-09-05 09:51:35', 'Netflix 鐨勪釜鎬у寲鎺ㄨ崘绯荤粺鏋舵瀯锛宧ttp://t.cn/zT7heoD', '', '\0', '\0', '-1', '-1', '', '', '', '', 'null', '-1', '-1', '1990786715', '0', '0', '0', '0', '', '0', '\0', '\0');
INSERT INTO `t_status_info` VALUES ('3619116416366773', '3619116416366773', '3619116416366773', '2013-09-05 10:27:35', '鏄庢櫄鍗佺偣锛屽ス浼氭潵锛屽ス涔熷洖鏉ヤ簡锛佸摝鍝堝搱鍝堝搱锛', '', '\0', '\0', '-1', '-1', '', 'http://ww4.sinaimg.cn/thumbnail/473dc466jw1e8bevo1dsaj20fx0fxab6.jpg', 'http://ww4.sinaimg.cn/bmiddle/473dc466jw1e8bevo1dsaj20fx0fxab6.jpg', 'http://ww4.sinaimg.cn/large/473dc466jw1e8bevo1dsaj20fx0fxab6.jpg', 'null', '-1', '-1', '1195230310', '0', '1956', '4909', '0', '[{\"client_mblogid\":\"iPhone-3DB379F7', '0', '\0', '\0');
INSERT INTO `t_status_info` VALUES ('3621285239997225', '3621285239997225', '3621285239997225', '2013-09-11 10:05:44', 'test for i', '', '\0', '\0', '-1', '-1', '', '', '', '', 'null', '-1', '-1', '3500295624', '0', '0', '0', '0', '', '0', '\0', '\0');
INSERT INTO `t_status_info` VALUES ('3621285441256368', '3621285441256368', '3621285441256368', '2013-09-11 10:06:32', 'new', '', '\0', '\0', '-1', '-1', '', '', '', '', 'null', '-1', '-1', '3500295624', '0', '0', '0', '0', '', '0', '\0', '\0');
INSERT INTO `t_status_info` VALUES ('3621286133125293', '3621286133125293', '3621286133125293', '2013-09-11 10:09:17', 'abc- childtime', '', '\0', '\0', '-1', '-1', '', '', '', '', 'null', '-1', '-1', '3500295624', '0', '0', '0', '0', '', '0', '\0', '\0');
INSERT INTO `t_status_info` VALUES ('3621291707731563', '3621291707731563', '3621291707731563', '2013-09-11 10:31:25', 'cba- longtime', '', '\0', '\0', '-1', '-1', '', '', '', '', 'null', '-1', '-1', '3500295624', '0', '0', '0', '0', '', '0', '\0', '\0');
INSERT INTO `t_status_info` VALUES ('3621293368495587', '3621293368495587', '3621293368495587', '2013-09-11 10:38:02', '去医院看看', '', '\0', '\0', '-1', '-1', '', '', '', '', 'null', '-1', '-1', '3500295624', '0', '0', '0', '0', '', '0', '\0', '\0');
INSERT INTO `t_status_info` VALUES ('3625675380125523', '3625675380125523', '3625675380125523', '2013-09-23 12:50:34', 'test for...', '', '\0', '\0', '-1', '-1', '', '', '', '', 'null', '-1', '-1', '3500295624', '0', '0', '0', '0', '', '0', '\0', '\0');

-- ----------------------------
-- Table structure for `t_status_json`
-- ----------------------------
DROP TABLE IF EXISTS `t_status_json`;
CREATE TABLE `t_status_json` (
  `status_id` bigint(20) NOT NULL,
  `json` varchar(2048) NOT NULL,
  PRIMARY KEY  (`status_id`),
  UNIQUE KEY `status_id_UNIQUE` (`status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='寰?崥鐨勫師濮媕son瀛楃?涓';

-- ----------------------------
-- Records of t_status_json
-- ----------------------------
INSERT INTO `t_status_json` VALUES ('3621285239997225', '{\"comments_count\":0,\"text\":\"test for i\",\"pic_urls\":[],\"geo\":null,\"visible\":{\"type\":0,\"list_id\":0},\"attitudes_count\":0,\"in_reply_to_screen_name\":\"\",\"mlevel\":0,\"truncated\":false,\"id\":3621285239997225,\"idstr\":\"3621285239997225\",\"source\":\"<a href=\\\"http://weibo.com/\\\" rel=\\\"nofollow\\\">新浪微博<\\/a>\",\"favorited\":false,\"in_reply_to_status_id\":\"\",\"reposts_count\":0,\"created_at\":\"Wed Sep 11 10:05:44 +0800 2013\",\"in_reply_to_user_id\":\"\",\"mid\":\"3621285239997225\",\"user\":{\"remark\":\"\",\"location\":\"北京 海淀区\",\"verified_type\":-1,\"verified_reason\":\"\",\"statuses_count\":1,\"lang\":\"zh-cn\",\"city\":\"8\",\"id\":3500295624,\"following\":false,\"favourites_count\":0,\"idstr\":\"3500295624\",\"description\":\"\",\"verified\":false,\"name\":\"TransCode\",\"domain\":\"\",\"province\":\"11\",\"gender\":\"m\",\"created_at\":\"Thu May 30 12:58:37 +0800 2013\",\"weihao\":\"\",\"followers_count\":27,\"online_status\":1,\"profile_url\":\"u/3500295624\",\"bi_followers_count\":2,\"geo_enabled\":true,\"star\":0,\"class\":1,\"mbrank\":0,\"avatar_hd\":\"http://tp1.sinaimg.cn/3500295624/180/0/1\",\"allow_all_comment\":true,\"allow_all_act_msg\":false,\"avatar_large\":\"http://tp1.sinaimg.cn/3500295624/180/0/1\",\"url\":\"\",\"friends_count\":24,\"mbtype\":0,\"screen_name\":\"TransCode\",\"block_word\":0,\"follow_me\":false,\"profile_image_url\":\"http://tp1.sinaimg.cn/3500295624/50/0/1\",\"ptype\":0}}');
INSERT INTO `t_status_json` VALUES ('3621285441256368', '{\"comments_count\":0,\"text\":\"new\",\"pic_urls\":[],\"geo\":null,\"visible\":{\"type\":0,\"list_id\":0},\"attitudes_count\":0,\"in_reply_to_screen_name\":\"\",\"mlevel\":0,\"truncated\":false,\"id\":3621285441256368,\"idstr\":\"3621285441256368\",\"source\":\"<a href=\\\"http://weibo.com/\\\" rel=\\\"nofollow\\\">新浪微博<\\/a>\",\"favorited\":false,\"in_reply_to_status_id\":\"\",\"reposts_count\":0,\"created_at\":\"Wed Sep 11 10:06:32 +0800 2013\",\"in_reply_to_user_id\":\"\",\"mid\":\"3621285441256368\",\"user\":{\"remark\":\"\",\"location\":\"北京 海淀区\",\"verified_type\":-1,\"verified_reason\":\"\",\"statuses_count\":2,\"lang\":\"zh-cn\",\"city\":\"8\",\"id\":3500295624,\"following\":false,\"favourites_count\":0,\"idstr\":\"3500295624\",\"description\":\"\",\"verified\":false,\"name\":\"TransCode\",\"domain\":\"\",\"province\":\"11\",\"gender\":\"m\",\"created_at\":\"Thu May 30 12:58:37 +0800 2013\",\"weihao\":\"\",\"followers_count\":27,\"online_status\":1,\"profile_url\":\"u/3500295624\",\"bi_followers_count\":2,\"geo_enabled\":true,\"star\":0,\"class\":1,\"mbrank\":0,\"avatar_hd\":\"http://tp1.sinaimg.cn/3500295624/180/0/1\",\"allow_all_comment\":true,\"allow_all_act_msg\":false,\"avatar_large\":\"http://tp1.sinaimg.cn/3500295624/180/0/1\",\"url\":\"\",\"friends_count\":24,\"mbtype\":0,\"screen_name\":\"TransCode\",\"block_word\":0,\"follow_me\":false,\"profile_image_url\":\"http://tp1.sinaimg.cn/3500295624/50/0/1\",\"ptype\":0}}');
INSERT INTO `t_status_json` VALUES ('3621286133125293', '{\"comments_count\":0,\"text\":\"abc- childtime\",\"pic_urls\":[],\"geo\":null,\"visible\":{\"type\":0,\"list_id\":0},\"attitudes_count\":0,\"in_reply_to_screen_name\":\"\",\"mlevel\":0,\"truncated\":false,\"id\":3621286133125293,\"idstr\":\"3621286133125293\",\"source\":\"<a href=\\\"http://weibo.com/\\\" rel=\\\"nofollow\\\">新浪微博<\\/a>\",\"favorited\":false,\"in_reply_to_status_id\":\"\",\"reposts_count\":0,\"created_at\":\"Wed Sep 11 10:09:17 +0800 2013\",\"in_reply_to_user_id\":\"\",\"mid\":\"3621286133125293\",\"user\":{\"remark\":\"\",\"location\":\"北京 海淀区\",\"verified_type\":-1,\"verified_reason\":\"\",\"statuses_count\":1,\"lang\":\"zh-cn\",\"city\":\"8\",\"id\":3500295624,\"following\":false,\"favourites_count\":0,\"idstr\":\"3500295624\",\"description\":\"\",\"verified\":false,\"name\":\"TransCode\",\"domain\":\"\",\"province\":\"11\",\"gender\":\"m\",\"created_at\":\"Thu May 30 12:58:37 +0800 2013\",\"weihao\":\"\",\"followers_count\":27,\"online_status\":1,\"profile_url\":\"u/3500295624\",\"bi_followers_count\":2,\"geo_enabled\":true,\"star\":0,\"class\":1,\"mbrank\":0,\"avatar_hd\":\"http://tp1.sinaimg.cn/3500295624/180/0/1\",\"allow_all_comment\":true,\"allow_all_act_msg\":false,\"avatar_large\":\"http://tp1.sinaimg.cn/3500295624/180/0/1\",\"url\":\"\",\"friends_count\":24,\"mbtype\":0,\"screen_name\":\"TransCode\",\"block_word\":0,\"follow_me\":false,\"profile_image_url\":\"http://tp1.sinaimg.cn/3500295624/50/0/1\",\"ptype\":0}}');
INSERT INTO `t_status_json` VALUES ('3621291707731563', '{\"comments_count\":0,\"text\":\"cba- longtime\",\"pic_urls\":[],\"geo\":null,\"visible\":{\"type\":0,\"list_id\":0},\"attitudes_count\":0,\"in_reply_to_screen_name\":\"\",\"mlevel\":0,\"truncated\":false,\"id\":3621291707731563,\"idstr\":\"3621291707731563\",\"source\":\"<a href=\\\"http://weibo.com/\\\" rel=\\\"nofollow\\\">新浪微博<\\/a>\",\"favorited\":false,\"in_reply_to_status_id\":\"\",\"reposts_count\":0,\"created_at\":\"Wed Sep 11 10:31:25 +0800 2013\",\"in_reply_to_user_id\":\"\",\"mid\":\"3621291707731563\",\"user\":{\"remark\":\"\",\"location\":\"北京 海淀区\",\"verified_type\":-1,\"verified_reason\":\"\",\"statuses_count\":2,\"lang\":\"zh-cn\",\"city\":\"8\",\"id\":3500295624,\"following\":false,\"favourites_count\":0,\"idstr\":\"3500295624\",\"description\":\"\",\"verified\":false,\"name\":\"TransCode\",\"domain\":\"\",\"province\":\"11\",\"gender\":\"m\",\"created_at\":\"Thu May 30 12:58:37 +0800 2013\",\"weihao\":\"\",\"followers_count\":27,\"online_status\":1,\"profile_url\":\"u/3500295624\",\"bi_followers_count\":2,\"geo_enabled\":true,\"star\":0,\"class\":1,\"mbrank\":0,\"avatar_hd\":\"http://tp1.sinaimg.cn/3500295624/180/0/1\",\"allow_all_comment\":true,\"allow_all_act_msg\":false,\"avatar_large\":\"http://tp1.sinaimg.cn/3500295624/180/0/1\",\"url\":\"\",\"friends_count\":24,\"mbtype\":0,\"screen_name\":\"TransCode\",\"block_word\":0,\"follow_me\":false,\"profile_image_url\":\"http://tp1.sinaimg.cn/3500295624/50/0/1\",\"ptype\":0}}');
INSERT INTO `t_status_json` VALUES ('3621293368495587', '{\"comments_count\":0,\"text\":\"去医院看看\",\"pic_urls\":[],\"geo\":null,\"visible\":{\"type\":0,\"list_id\":0},\"attitudes_count\":0,\"in_reply_to_screen_name\":\"\",\"mlevel\":0,\"truncated\":false,\"id\":3621293368495587,\"idstr\":\"3621293368495587\",\"source\":\"<a href=\\\"http://weibo.com/\\\" rel=\\\"nofollow\\\">新浪微博<\\/a>\",\"favorited\":false,\"in_reply_to_status_id\":\"\",\"reposts_count\":0,\"created_at\":\"Wed Sep 11 10:38:02 +0800 2013\",\"in_reply_to_user_id\":\"\",\"mid\":\"3621293368495587\",\"user\":{\"remark\":\"\",\"location\":\"北京 海淀区\",\"verified_type\":-1,\"verified_reason\":\"\",\"statuses_count\":1,\"lang\":\"zh-cn\",\"city\":\"8\",\"id\":3500295624,\"following\":false,\"favourites_count\":0,\"idstr\":\"3500295624\",\"description\":\"\",\"verified\":false,\"name\":\"TransCode\",\"domain\":\"\",\"province\":\"11\",\"gender\":\"m\",\"created_at\":\"Thu May 30 12:58:37 +0800 2013\",\"weihao\":\"\",\"followers_count\":27,\"online_status\":1,\"profile_url\":\"u/3500295624\",\"bi_followers_count\":2,\"geo_enabled\":true,\"star\":0,\"class\":1,\"mbrank\":0,\"avatar_hd\":\"http://tp1.sinaimg.cn/3500295624/180/0/1\",\"allow_all_comment\":true,\"allow_all_act_msg\":false,\"avatar_large\":\"http://tp1.sinaimg.cn/3500295624/180/0/1\",\"url\":\"\",\"friends_count\":24,\"mbtype\":0,\"screen_name\":\"TransCode\",\"block_word\":0,\"follow_me\":false,\"profile_image_url\":\"http://tp1.sinaimg.cn/3500295624/50/0/1\",\"ptype\":0}}');
INSERT INTO `t_status_json` VALUES ('3625675380125523', '{\"comments_count\":0,\"text\":\"test for...\",\"pic_urls\":[],\"geo\":null,\"visible\":{\"type\":0,\"list_id\":0},\"attitudes_count\":0,\"in_reply_to_screen_name\":\"\",\"mlevel\":0,\"truncated\":false,\"id\":3625675380125523,\"idstr\":\"3625675380125523\",\"source\":\"<a href=\\\"http://weibo.com/\\\" rel=\\\"nofollow\\\">新浪微博<\\/a>\",\"favorited\":false,\"in_reply_to_status_id\":\"\",\"reposts_count\":0,\"created_at\":\"Mon Sep 23 12:50:34 +0800 2013\",\"in_reply_to_user_id\":\"\",\"mid\":\"3625675380125523\",\"user\":{\"remark\":\"\",\"location\":\"北京 海淀区\",\"verified_type\":-1,\"verified_reason\":\"\",\"statuses_count\":1,\"lang\":\"zh-cn\",\"city\":\"8\",\"id\":3500295624,\"following\":false,\"favourites_count\":0,\"idstr\":\"3500295624\",\"description\":\"\",\"verified\":false,\"name\":\"TransCode\",\"domain\":\"\",\"province\":\"11\",\"gender\":\"m\",\"created_at\":\"Thu May 30 12:58:37 +0800 2013\",\"weihao\":\"\",\"followers_count\":31,\"online_status\":1,\"profile_url\":\"u/3500295624\",\"bi_followers_count\":2,\"geo_enabled\":true,\"star\":0,\"class\":1,\"mbrank\":0,\"avatar_hd\":\"http://tp1.sinaimg.cn/3500295624/180/0/1\",\"allow_all_comment\":true,\"allow_all_act_msg\":false,\"avatar_large\":\"http://tp1.sinaimg.cn/3500295624/180/0/1\",\"url\":\"\",\"friends_count\":24,\"mbtype\":0,\"screen_name\":\"TransCode\",\"block_word\":0,\"follow_me\":false,\"profile_image_url\":\"http://tp1.sinaimg.cn/3500295624/50/0/1\",\"ptype\":0}}');

-- ----------------------------
-- Table structure for `t_status_source`
-- ----------------------------
DROP TABLE IF EXISTS `t_status_source`;
CREATE TABLE `t_status_source` (
  `status_id` bigint(20) NOT NULL COMMENT '寰?崥ID',
  `url` varchar(128) NOT NULL COMMENT '鏉ユ簮閾炬帴',
  `relation_ship` varchar(16) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT '鏉ユ簮鏂囨?鍚嶇О',
  PRIMARY KEY  (`status_id`),
  UNIQUE KEY `id_UNIQUE` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='寰?崥鏉ユ簮source';

-- ----------------------------
-- Records of t_status_source
-- ----------------------------

-- ----------------------------
-- Table structure for `t_status_status_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_status_status_relation`;
CREATE TABLE `t_status_status_relation` (
  `status_id` bigint(20) NOT NULL COMMENT '寰?崥ID',
  `referenced _status_id` bigint(20) NOT NULL COMMENT '琚?紩鐢ㄥ井鍗欼D',
  `type` tinyint(4) NOT NULL COMMENT '寮曠敤绫诲瀷(0锛岃浆鍙戯紱1,璇勮?)',
  `user_id` bigint(20) NOT NULL COMMENT '璇ュ井鍗氱殑浣滆?ID',
  `referenced_user_id` bigint(20) NOT NULL COMMENT '琚?紩鐢ㄥ井鍗氱殑浣滆?ID',
  `created_at` datetime NOT NULL COMMENT '寰?崥鍒涘缓鏃堕棿',
  PRIMARY KEY  (`status_id`,`referenced _status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='寰?崥涔嬮棿鍏崇郴琛';

-- ----------------------------
-- Records of t_status_status_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `t_status_visible`
-- ----------------------------
DROP TABLE IF EXISTS `t_status_visible`;
CREATE TABLE `t_status_visible` (
  `status_id` bigint(20) NOT NULL,
  `type` int(11) default NULL,
  `list_id` bigint(20) default NULL,
  PRIMARY KEY  (`status_id`),
  UNIQUE KEY `id_UNIQUE` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='寰?崥鍙??鎬?isible';

-- ----------------------------
-- Records of t_status_visible
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info` (
  `user_id` bigint(20) NOT NULL COMMENT '鐢ㄦ埛UID',
  `idstr` varchar(45) NOT NULL COMMENT '瀛楃?涓插瀷鐨勭敤鎴稶ID',
  `screen_name` varchar(45) NOT NULL COMMENT '鐢ㄦ埛鏄电О',
  `name` varchar(45) NOT NULL COMMENT '鍙嬪ソ鏄剧ず鍚嶇О',
  `province` int(11) default NULL COMMENT '鐢ㄦ埛鎵?湪鐪佺骇ID',
  `city` int(11) default NULL COMMENT '鐢ㄦ埛鎵?湪鍩庡競ID',
  `location` varchar(45) default NULL COMMENT '鐢ㄦ埛鎵?湪鍦',
  `description` varchar(128) default NULL COMMENT '鐢ㄦ埛涓?汉鎻忚堪',
  `url` varchar(128) default NULL COMMENT '鐢ㄦ埛鍗氬?鍦板潃',
  `profile_image_url` varchar(128) default NULL COMMENT '鐢ㄦ埛澶村儚鍦板潃锛?0脳50鍍忕礌',
  `profile_url` varchar(128) NOT NULL COMMENT '鐢ㄦ埛鐨勫井鍗氱粺涓?RL鍦板潃',
  `domain` varchar(128) default NULL COMMENT '鐢ㄦ埛鐨勪釜鎬у寲鍩熷悕',
  `weihao` varchar(45) default NULL COMMENT '鐢ㄦ埛鐨勫井鍙',
  `gender` varchar(8) NOT NULL COMMENT '鎬у埆锛宮锛氱敺銆乫锛氬コ銆乶锛氭湭鐭',
  `followers_count` int(11) NOT NULL COMMENT '绮変笣鏁',
  `friends_count` int(11) NOT NULL COMMENT '鍏虫敞鏁',
  `statuses_count` int(11) NOT NULL COMMENT '寰?崥鏁',
  `favourites_count` int(11) NOT NULL COMMENT '鏀惰棌鏁',
  `created_at` datetime NOT NULL COMMENT '鐢ㄦ埛鍒涘缓锛堟敞鍐岋級鏃堕棿',
  `following` bit(1) NOT NULL COMMENT '鏆傛湭鏀?寔',
  `allow_all_act_msg` bit(1) NOT NULL default '' COMMENT '鏄?惁鍏佽?鎵?湁浜虹粰鎴戝彂绉佷俊锛宼rue锛氭槸锛宖alse锛氬惁',
  `geo_enabled` bit(1) NOT NULL default '' COMMENT '鏄?惁鍏佽?鏍囪瘑鐢ㄦ埛鐨勫湴鐞嗕綅缃?紝true锛氭槸锛宖alse锛氬惁',
  `verified` bit(1) NOT NULL default '\0' COMMENT '鏄?惁鏄?井鍗氳?璇佺敤鎴凤紝鍗冲姞V鐢ㄦ埛锛宼rue锛氭槸锛宖alse锛氬惁',
  `verified_type` int(11) default NULL COMMENT '鏆傛湭鏀?寔',
  `remark` varchar(45) default NULL COMMENT '鐢ㄦ埛澶囨敞淇℃伅锛屽彧鏈夊湪鏌ヨ?鐢ㄦ埛鍏崇郴鏃舵墠杩斿洖姝ゅ瓧娈',
  `allow_all_comment` bit(1) NOT NULL default '' COMMENT '鏄?惁鍏佽?鎵?湁浜哄?鎴戠殑寰?崥杩涜?璇勮?锛宼rue锛氭槸锛宖alse锛氬惁',
  `avatar_large` varchar(128) default NULL COMMENT '鐢ㄦ埛澶уご鍍忓湴鍧',
  `verified_reason` varchar(45) default NULL COMMENT '璁よ瘉鍘熷洜',
  `bi_followers_count` int(11) NOT NULL default '0' COMMENT '鐢ㄦ埛鐨勪簰绮夋暟',
  `lang` varchar(8) NOT NULL default 'zh-cn' COMMENT '鐢ㄦ埛褰撳墠鐨勮?瑷?増鏈?紝zh-cn锛氱畝浣撲腑鏂囷紝zh-tw锛氱箒浣撲腑鏂囷紝en锛氳嫳璇',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `uid_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='鏂版氮寰?崥鐢ㄦ埛淇℃伅琛';

-- ----------------------------
-- Records of t_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_relation`;
CREATE TABLE `t_user_relation` (
  `user_id` bigint(20) NOT NULL COMMENT '鐢ㄦ埛ID',
  `follow_id` bigint(20) NOT NULL COMMENT '琚?叧娉↖D锛屽嵆user_id鍏虫敞浜唂ollow_id',
  PRIMARY KEY  (`user_id`,`follow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='鐢ㄦ埛涔嬮棿鍏崇郴琛';

-- ----------------------------
-- Records of t_user_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_status_index`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_status_index`;
CREATE TABLE `t_user_status_index` (
  `author_id` varchar(50) NOT NULL,
  `status_id` varchar(50) NOT NULL,
  `mid` varchar(50) NOT NULL,
  `create_time` time NOT NULL,
  PRIMARY KEY  (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_status_index
-- ----------------------------
INSERT INTO `t_user_status_index` VALUES ('1192329374', '3619112502378330', '1192329374', '10:12:03');
INSERT INTO `t_user_status_index` VALUES ('1195230310', '3619120690112133', '1195230310', '10:44:35');
INSERT INTO `t_user_status_index` VALUES ('1212812142', '3619129124567444', '1212812142', '11:18:05');
INSERT INTO `t_user_status_index` VALUES ('1784501333', '3619121491520227', '1784501333', '10:47:45');
INSERT INTO `t_user_status_index` VALUES ('1886008124', '3619121642108502', '1886008124', '10:48:20');
INSERT INTO `t_user_status_index` VALUES ('1891212990', '3619123030643848', '1891212990', '10:53:53');
INSERT INTO `t_user_status_index` VALUES ('1962310741', '3619115421742228', '1962310741', '10:23:39');
INSERT INTO `t_user_status_index` VALUES ('1990786715', '3619107351733557', '1990786715', '09:51:35');
INSERT INTO `t_user_status_index` VALUES ('2206430561', '3619125215606944', '2206430561', '11:02:33');
INSERT INTO `t_user_status_index` VALUES ('2298469983', '3619102042364244', '2298469983', '09:30:29');
INSERT INTO `t_user_status_index` VALUES ('2677160403', '3619114574833516', '2677160403', '10:20:17');
INSERT INTO `t_user_status_index` VALUES ('3500295624', '3618060067520070', '3500295624', '12:30:02');
INSERT INTO `t_user_status_index` VALUES ('3546229743', '3619111433088203', '3546229743', '10:07:47');
