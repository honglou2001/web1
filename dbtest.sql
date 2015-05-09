-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.20 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 dbtest 的数据库结构
CREATE DATABASE IF NOT EXISTS `dbtest` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbtest`;


-- 导出  表 dbtest.myclass 结构
CREATE TABLE IF NOT EXISTS `myclass` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `sex` int(4) NOT NULL DEFAULT '0',
  `degree` double(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_authority_menu 结构
CREATE TABLE IF NOT EXISTS `t_authority_menu` (
  `FID` varchar(50) NOT NULL,
  `FParentID` varchar(50) NOT NULL,
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT,
  `FMenuName` varchar(50) NOT NULL DEFAULT '0',
  `FURL` varchar(200) DEFAULT NULL,
  `FIcon` varchar(200) DEFAULT NULL,
  `FAuthorityVal` bigint(20) NOT NULL,
  `FSysID` int(11) NOT NULL,
  `FCreateUser` varchar(50) DEFAULT NULL,
  `FCreateTime` timestamp NULL DEFAULT NULL,
  `FModifyUser` varchar(50) DEFAULT NULL,
  `FModifyTime` timestamp NULL DEFAULT NULL,
  `FLevel` int(11) DEFAULT NULL,
  `FType` int(11) DEFAULT NULL,
  `FState` int(11) DEFAULT NULL,
  `FIsDeleted` bit(1) DEFAULT NULL,
  `FIsFixed` bit(1) DEFAULT NULL,
  `FDescription` varchar(500) DEFAULT NULL,
  KEY `FIncreaseID` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_authority_resval 结构
CREATE TABLE IF NOT EXISTS `t_authority_resval` (
  `FID` varchar(50) DEFAULT NULL,
  `FName` varchar(50) DEFAULT NULL,
  `FSysID` int(11) DEFAULT NULL,
  `FVal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_authority_rolemenu 结构
CREATE TABLE IF NOT EXISTS `t_authority_rolemenu` (
  `FID` char(36) NOT NULL,
  `FRoleID` char(36) NOT NULL,
  `FMenuID` char(36) NOT NULL,
  `FAuthVal` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_authority_roles 结构
CREATE TABLE IF NOT EXISTS `t_authority_roles` (
  `FID` char(36) NOT NULL,
  `FIncreaseID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FRoleName` varchar(50) DEFAULT '0',
  `FOrder` int(11) DEFAULT '0',
  `FDescription` varchar(500) DEFAULT '0',
  `FCreateUser` varchar(500) DEFAULT '0',
  `FCreateTime` time DEFAULT '00:00:00',
  `FUpdateUser` varchar(50) DEFAULT '0',
  `FUpdateTime` varchar(50) DEFAULT '0',
  `FIsDelete` bit(1) DEFAULT b'0',
  `FIsFixed` bit(1) DEFAULT b'0',
  KEY `FIncreaseID` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_authority_users 结构
CREATE TABLE IF NOT EXISTS `t_authority_users` (
  `FID` char(36) NOT NULL,
  `FIncreaseID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FName` varchar(50) DEFAULT NULL,
  `FPwd` varchar(50) DEFAULT NULL,
  `FMobile` varchar(50) DEFAULT NULL,
  `FEmail` varchar(50) DEFAULT NULL,
  `FAdress` varchar(200) DEFAULT NULL,
  `FDescription` mediumtext,
  `FCreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `FIncreaseID` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_users 结构
CREATE TABLE IF NOT EXISTS `t_users` (
  `FID` varchar(255) NOT NULL,
  `FName` varchar(255) DEFAULT NULL,
  `FPwd` varchar(255) DEFAULT NULL,
  `FMobile` varchar(255) DEFAULT NULL,
  `FEmail` varchar(255) DEFAULT NULL,
  `FAdress` varchar(255) DEFAULT NULL,
  `FDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
