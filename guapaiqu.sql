-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 10 月 22 日 22:53
-- 服务器版本: 5.5.32-0ubuntu0.13.04.1
-- PHP 版本: 5.4.9-4ubuntu2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `guapaiqu`
--

-- --------------------------------------------------------

--
-- 表的结构 `chatmessage`
--

CREATE TABLE IF NOT EXISTS `chatmessage` (
  `cid` varchar(50) NOT NULL,
  `fromid` char(50) NOT NULL,
  `toid` char(50) NOT NULL,
  `cdatetime` datetime NOT NULL,
  `content` text,
  PRIMARY KEY (`cid`),
  KEY `FK_chatmessage_LoginInfo` (`fromid`),
  KEY `FK_chatmessage_LoginInfo_2` (`toid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `guapai`
--

CREATE TABLE IF NOT EXISTS `guapai` (
  `gid` varchar(100) NOT NULL,
  `uid` char(50) NOT NULL,
  `startdatetime` datetime NOT NULL,
  `gmessage` varchar(1000) NOT NULL,
  `picidlist` varchar(200) NOT NULL,
  `enddatetime` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`gid`,`uid`,`startdatetime`),
  KEY `FK_guapai_LoginInfo` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `LoginInfo`
--

CREATE TABLE IF NOT EXISTS `LoginInfo` (
  `uid` char(50) NOT NULL,
  `email` char(50) NOT NULL,
  `passwd` varchar(500) NOT NULL,
  PRIMARY KEY (`uid`,`email`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `LoginInfo`
--

INSERT INTO `LoginInfo` (`uid`, `email`, `passwd`) VALUES
('fight', 'fengchang_fight@127.com', '4cb990b8e58275a3e2ec3269a8f07af0'),
('Lily', 'longquan31@21cn.com', 'e10adc3949ba59abbe56e057f20f883e'),
('pridefight', 'fengchang_fight@126.com', '4cb990b8e58275a3e2ec3269a8f07af0'),
('test', 'test@test.com', '96e79218965eb72c92a549dd5a330112'),
('test2', 'test@test2.com', 'e3ceb5881a0a1fdaad01296d7554868d');

-- --------------------------------------------------------

--
-- 表的结构 `messageboard`
--

CREATE TABLE IF NOT EXISTS `messageboard` (
  `mid` varchar(50) NOT NULL,
  `fromid` char(50) NOT NULL,
  `toid` char(50) NOT NULL,
  `mdatetime` datetime NOT NULL,
  `content` text,
  PRIMARY KEY (`mid`),
  KEY `FK_messageboard_LoginInfo` (`fromid`),
  KEY `FK_messageboard_LoginInfo_2` (`toid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `passwdresetcode`
--

CREATE TABLE IF NOT EXISTS `passwdresetcode` (
  `email` char(50) NOT NULL,
  `resetcode` char(50) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `PersonInfo`
--

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
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `PersonInfo`
--

INSERT INTO `PersonInfo` (`uid`, `gender`, `birthdate`, `school`, `currentcity`, `edudegree`, `height`, `weight`, `major`, `markcount`, `averagemark`, `selfdescription`, `status`, `hometown`, `extension`) VALUES
('fight', b'1', '1000-01-01', 'unknown', 'unknown', 0, 0, 0, 'unknown', 0, 0, 'nothing yet', b'0', 'unknown', 'unknown'),
('Lily', b'1', '1000-01-01', 'unknown', 'unknown', 0, 0, 0, 'unknown', 0, 0, 'nothing yet', b'0', 'unknown', 'unknown'),
('pridefight', b'1', '1000-01-01', 'unknown', 'unknown', 0, 0, 0, 'unknown', 0, 0, 'nothing yet', b'0', 'unknown', 'unknown'),
('test', b'1', '1000-01-01', 'unknown', 'unknown', 0, 0, 0, 'unknown', 0, 0, 'nothing yet', b'0', 'unknown', 'unknown'),
('test2', b'1', '1000-01-01', 'unknown', 'unknown', 0, 0, 0, 'unknown', 0, 0, 'nothing yet', b'0', 'unknown', 'unknown');

-- --------------------------------------------------------

--
-- 表的结构 `PersonRequire`
--

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
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `PersonRequire`
--

INSERT INTO `PersonRequire` (`uid`, `requireminheight`, `requiremaxheight`, `requireminweight`, `requiremaxweight`, `requireearlybirth`, `requirelatebirth`, `requireminedu`, `requireminincome`, `requirehouse`, `prextension`) VALUES
('fight', 0, 220, 0, 1000, 1901, 2155, 0, 0, b'0', 'unknown'),
('Lily', 0, 220, 0, 1000, 1901, 2155, 0, 0, b'0', 'unknown'),
('pridefight', 0, 220, 0, 1000, 1901, 2155, 0, 0, b'0', 'unknown'),
('test', 0, 220, 0, 1000, 1901, 2155, 0, 0, b'0', 'unknown'),
('test2', 0, 220, 0, 1000, 1901, 2155, 0, 0, b'0', 'unknown');

-- --------------------------------------------------------

--
-- 表的结构 `picmapping`
--

CREATE TABLE IF NOT EXISTS `picmapping` (
  `uid` char(50) NOT NULL,
  `picid` int(30) NOT NULL AUTO_INCREMENT,
  `album` varchar(50) NOT NULL DEFAULT 'default',
  `photo_name` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL,
  `caption` varchar(50) DEFAULT '',
  `desc` text,
  PRIMARY KEY (`uid`,`picid`),
  KEY `picid` (`picid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `picmapping`
--

INSERT INTO `picmapping` (`uid`, `picid`, `album`, `photo_name`, `date_added`, `caption`, `desc`) VALUES
('pridefight', 1, 'default', 'the_golden_hour-wallpaper-1366x768.jpg', '2012-09-02 00:00:00', 'cap1', 'desc1'),
('pridefight', 2, 'default', 'Apple-vs-Droid.jpg', '2012-09-03 00:00:00', 'cap2', 'desc2'),
('pridefight', 3, 'default', 'Sm9FVZu0J9HTIwpRJqxc.jpg', '2013-10-13 20:27:19', '', NULL),
('pridefight', 4, 'default', 'tlx1SHJfxKY_Lxdg8ANX.jpg', '2013-10-13 20:28:02', '', NULL),
('pridefight', 5, 'default', 'Kxl9CWB2MO3fDySfGtoB.jpg', '2013-10-13 20:32:22', '', NULL),
('pridefight', 6, 'default', 'coLnZI5Osiz_z8qNQ0UQ.jpg', '2013-10-13 20:35:26', '', NULL),
('pridefight', 7, 'default', 'C4VB27Jop01hHz1oCXuv.jpg', '2013-10-13 20:36:10', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zhaipai`
--

CREATE TABLE IF NOT EXISTS `zhaipai` (
  `fromid` char(50) NOT NULL,
  `gid` varchar(100) NOT NULL,
  `zdatetime` datetime NOT NULL,
  `zmessage` text,
  `zpiclist` varchar(200) DEFAULT NULL,
  `enddatetime` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`fromid`,`gid`,`zdatetime`),
  KEY `FK_zhaipai_guapai` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 限制导出的表
--

--
-- 限制表 `chatmessage`
--
ALTER TABLE `chatmessage`
  ADD CONSTRAINT `FK_chatmessage_LoginInfo` FOREIGN KEY (`fromid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_chatmessage_LoginInfo_2` FOREIGN KEY (`toid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE;

--
-- 限制表 `guapai`
--
ALTER TABLE `guapai`
  ADD CONSTRAINT `FK_guapai_LoginInfo` FOREIGN KEY (`uid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE;

--
-- 限制表 `messageboard`
--
ALTER TABLE `messageboard`
  ADD CONSTRAINT `FK_messageboard_LoginInfo` FOREIGN KEY (`fromid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_messageboard_LoginInfo_2` FOREIGN KEY (`toid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE;

--
-- 限制表 `PersonInfo`
--
ALTER TABLE `PersonInfo`
  ADD CONSTRAINT `FK_PersonInfo_LoginInfo` FOREIGN KEY (`uid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE;

--
-- 限制表 `PersonRequire`
--
ALTER TABLE `PersonRequire`
  ADD CONSTRAINT `FK_PersonRequire_LoginInfo` FOREIGN KEY (`uid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE;

--
-- 限制表 `picmapping`
--
ALTER TABLE `picmapping`
  ADD CONSTRAINT `FK_picmapping_LoginInfo` FOREIGN KEY (`uid`) REFERENCES `LoginInfo` (`uid`);

--
-- 限制表 `zhaipai`
--
ALTER TABLE `zhaipai`
  ADD CONSTRAINT `FK_zhaipai_guapai` FOREIGN KEY (`gid`) REFERENCES `guapai` (`gid`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_zhaipai_LoginInfo` FOREIGN KEY (`fromid`) REFERENCES `LoginInfo` (`uid`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
