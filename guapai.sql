-- --------------------------------------------------------
-- 主机:                           192.168.1.106
-- 服务器版本:                        5.5.23 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 guapaiqu.chatmessage 结构
CREATE TABLE IF NOT EXISTS `chatmessage` (
  `cid` varchar(50) NOT NULL,
  `fromid` char(50) NOT NULL,
  `toid` char(50) NOT NULL,
  `cdatetime` datetime NOT NULL,
  `content` text,
  PRIMARY KEY (`cid`),
  KEY `FK_chatmessage_LoginInfo` (`fromid`),
  KEY `FK_chatmessage_LoginInfo_2` (`toid`),
  CONSTRAINT `FK_chatmessage_LoginInfo` FOREIGN KEY (`fromid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `FK_chatmessage_LoginInfo_2` FOREIGN KEY (`toid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  guapaiqu.chatmessage 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `chatmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatmessage` ENABLE KEYS */;


-- 导出  表 guapaiqu.guapai 结构
CREATE TABLE IF NOT EXISTS `guapai` (
  `gid` varchar(100) NOT NULL,
  `uid` char(50) NOT NULL,
  `startdatetime` datetime NOT NULL,
  `gmessage` varchar(1000) NOT NULL,
  `picidlist` varchar(200) NOT NULL,
  `enddatetime` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`gid`,`uid`,`startdatetime`),
  KEY `FK_guapai_LoginInfo` (`uid`),
  CONSTRAINT `FK_guapai_LoginInfo` FOREIGN KEY (`uid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  guapaiqu.guapai 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `guapai` DISABLE KEYS */;
/*!40000 ALTER TABLE `guapai` ENABLE KEYS */;


-- 导出  表 guapaiqu.LoginInfo 结构
CREATE TABLE IF NOT EXISTS `LoginInfo` (
  `uid` char(50) NOT NULL,
  `email` char(50) NOT NULL,
  `passwd` varchar(500) NOT NULL,
  PRIMARY KEY (`uid`,`email`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  guapaiqu.LoginInfo 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `LoginInfo` DISABLE KEYS */;
INSERT INTO `LoginInfo` (`uid`, `email`, `passwd`) VALUES
	('fight', 'fengchang_fight@127.com', '4cb990b8e58275a3e2ec3269a8f07af0'),
	('Lily', 'longquan31@21cn.com', 'e10adc3949ba59abbe56e057f20f883e'),
	('pridefight', 'fengchang_fight@126.com', '4cb990b8e58275a3e2ec3269a8f07af0'),
	('test', 'test@test.com', '96e79218965eb72c92a549dd5a330112'),
	('test2', 'test@test2.com', 'e3ceb5881a0a1fdaad01296d7554868d');
/*!40000 ALTER TABLE `LoginInfo` ENABLE KEYS */;


-- 导出  表 guapaiqu.messageboard 结构
CREATE TABLE IF NOT EXISTS `messageboard` (
  `mid` varchar(50) NOT NULL,
  `fromid` char(50) NOT NULL,
  `toid` char(50) NOT NULL,
  `mdatetime` datetime NOT NULL,
  `content` text,
  PRIMARY KEY (`mid`),
  KEY `FK_messageboard_LoginInfo` (`fromid`),
  KEY `FK_messageboard_LoginInfo_2` (`toid`),
  CONSTRAINT `FK_messageboard_LoginInfo` FOREIGN KEY (`fromid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `FK_messageboard_LoginInfo_2` FOREIGN KEY (`toid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  guapaiqu.messageboard 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `messageboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `messageboard` ENABLE KEYS */;


-- 导出  表 guapaiqu.passwdresetcode 结构
CREATE TABLE IF NOT EXISTS `passwdresetcode` (
  `email` char(50) NOT NULL,
  `resetcode` char(50) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  guapaiqu.passwdresetcode 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `passwdresetcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `passwdresetcode` ENABLE KEYS */;


-- 导出  表 guapaiqu.PersonInfo 结构
CREATE TABLE IF NOT EXISTS `PersonInfo` (
  `uid` char(50) NOT NULL,
  `gender` bit(1) NOT NULL,
  `birthdate` date NOT NULL DEFAULT '1000-01-01',
  `school` char(50) NOT NULL DEFAULT 'unknown',
  `currentcity` varchar(50) NOT NULL DEFAULT 'unknown',
  `edudegree` int(11) NOT NULL DEFAULT '0',
  `height` float NOT NULL DEFAULT '0',
  `weight` float NOT NULL DEFAULT '0',
  `major` varchar(50) NOT NULL DEFAULT 'unknown',
  `markcount` int(11) NOT NULL DEFAULT '0',
  `averagemark` float NOT NULL DEFAULT '0',
  `selfdescription` text NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0',
  `hometown` varchar(50) NOT NULL DEFAULT 'unknown',
  `extension` varchar(100) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`uid`),
  CONSTRAINT `FK_PersonInfo_LoginInfo` FOREIGN KEY (`uid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  guapaiqu.PersonInfo 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `PersonInfo` DISABLE KEYS */;
INSERT INTO `PersonInfo` (`uid`, `gender`, `birthdate`, `school`, `currentcity`, `edudegree`, `height`, `weight`, `major`, `markcount`, `averagemark`, `selfdescription`, `status`, `hometown`, `extension`) VALUES
	('fight', b'10000000', '1000-01-01', 'unknown', 'unknown', 0, 0, 0, 'unknown', 0, 0, 'nothing yet', b'00000000', 'unknown', 'unknown'),
	('Lily', b'10000000', '1000-01-01', 'unknown', 'unknown', 0, 0, 0, 'unknown', 0, 0, 'nothing yet', b'00000000', 'unknown', 'unknown'),
	('pridefight', b'10000000', '1000-01-01', 'unknown', 'unknown', 0, 0, 0, 'unknown', 0, 0, 'nothing yet', b'00000000', 'unknown', 'unknown'),
	('test', b'10000000', '1000-01-01', 'unknown', 'unknown', 0, 0, 0, 'unknown', 0, 0, 'nothing yet', b'00000000', 'unknown', 'unknown'),
	('test2', b'10000000', '1000-01-01', 'unknown', 'unknown', 0, 0, 0, 'unknown', 0, 0, 'nothing yet', b'00000000', 'unknown', 'unknown');
/*!40000 ALTER TABLE `PersonInfo` ENABLE KEYS */;


-- 导出  表 guapaiqu.PersonRequire 结构
CREATE TABLE IF NOT EXISTS `PersonRequire` (
  `uid` char(50) NOT NULL,
  `requireminheight` float NOT NULL DEFAULT '0',
  `requiremaxheight` float NOT NULL DEFAULT '220',
  `requireminweight` float NOT NULL DEFAULT '0',
  `requiremaxweight` float NOT NULL DEFAULT '1000',
  `requireearlybirth` year(4) NOT NULL DEFAULT '1901',
  `requirelatebirth` year(4) NOT NULL DEFAULT '2155',
  `requireminedu` int(11) NOT NULL DEFAULT '0',
  `requireminincome` int(11) NOT NULL DEFAULT '0',
  `requirehouse` bit(1) NOT NULL DEFAULT b'0',
  `prextension` varchar(100) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`uid`),
  CONSTRAINT `FK_PersonRequire_LoginInfo` FOREIGN KEY (`uid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  guapaiqu.PersonRequire 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `PersonRequire` DISABLE KEYS */;
INSERT INTO `PersonRequire` (`uid`, `requireminheight`, `requiremaxheight`, `requireminweight`, `requiremaxweight`, `requireearlybirth`, `requirelatebirth`, `requireminedu`, `requireminincome`, `requirehouse`, `prextension`) VALUES
	('fight', 0, 220, 0, 1000, '1901', '2155', 0, 0, b'00000000', 'unknown'),
	('Lily', 0, 220, 0, 1000, '1901', '2155', 0, 0, b'00000000', 'unknown'),
	('pridefight', 0, 220, 0, 1000, '1901', '2155', 0, 0, b'00000000', 'unknown'),
	('test', 0, 220, 0, 1000, '1901', '2155', 0, 0, b'00000000', 'unknown'),
	('test2', 0, 220, 0, 1000, '1901', '2155', 0, 0, b'00000000', 'unknown');
/*!40000 ALTER TABLE `PersonRequire` ENABLE KEYS */;


-- 导出  表 guapaiqu.picmapping 结构
CREATE TABLE IF NOT EXISTS `picmapping` (
  `uid` char(50) NOT NULL,
  `picid` int(30) NOT NULL AUTO_INCREMENT,
  `album` varchar(50) NOT NULL DEFAULT 'default',
  `photo_name` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`uid`,`picid`),
  KEY `picid` (`picid`),
  CONSTRAINT `FK_picmapping_LoginInfo` FOREIGN KEY (`uid`) REFERENCES `LoginInfo` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  guapaiqu.picmapping 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `picmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `picmapping` ENABLE KEYS */;


-- 导出  表 guapaiqu.zhaipai 结构
CREATE TABLE IF NOT EXISTS `zhaipai` (
  `fromid` char(50) NOT NULL,
  `gid` varchar(100) NOT NULL,
  `zdatetime` datetime NOT NULL,
  `zmessage` text,
  `zpiclist` varchar(200) DEFAULT NULL,
  `enddatetime` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`fromid`,`gid`,`zdatetime`),
  KEY `FK_zhaipai_guapai` (`gid`),
  CONSTRAINT `FK_zhaipai_guapai` FOREIGN KEY (`gid`) REFERENCES `guapai` (`gid`) ON DELETE CASCADE,
  CONSTRAINT `FK_zhaipai_LoginInfo` FOREIGN KEY (`fromid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  guapaiqu.zhaipai 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `zhaipai` DISABLE KEYS */;
/*!40000 ALTER TABLE `zhaipai` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
