-- --------------------------------------------------------
-- 主机:                           120.24.176.185
-- 服务器版本:                        5.6.10 - MySQL Community Server (GPL)
-- 服务器操作系统:                      linux-glibc2.5
-- HeidiSQL 版本:                  8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 dbtest.serialnumber 结构
CREATE TABLE IF NOT EXISTS `serialnumber` (
  `funiqueid` varchar(50) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialnumber` varchar(20) NOT NULL,
  `status` char(1) DEFAULT '0',
  `ef` char(1) DEFAULT NULL,
  `setgps` varchar(255) NOT NULL DEFAULT '300',
  `gpsstatus` varchar(255) NOT NULL DEFAULT '0',
  `isreg` char(1) NOT NULL DEFAULT '0',
  `lbs` char(1) NOT NULL DEFAULT '1',
  `listenstatus` char(1) NOT NULL DEFAULT '2',
  `online` char(1) NOT NULL DEFAULT '0',
  `onlinetime` datetime DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `fqrcode` varchar(200) DEFAULT NULL,
  `birthday` varchar(50) DEFAULT NULL,
  `fsex` int(11) DEFAULT NULL,
  `fweight` varchar(20) DEFAULT NULL,
  `feight` varchar(20) DEFAULT NULL,
  `fgrade` varchar(50) DEFAULT NULL,
  `fclass` varchar(50) DEFAULT NULL,
  `fschool` varchar(50) DEFAULT NULL,
  `fcallname` varchar(50) DEFAULT NULL,
  `flogcount` int(11) DEFAULT '0',
  `floglasttime` datetime DEFAULT NULL,
  `floglastip` varchar(50) DEFAULT NULL,
  `fdatastatus` int(11) DEFAULT NULL,
  `fremark` varchar(500) DEFAULT NULL,
  `fpicture` varchar(100) DEFAULT NULL,
  `fupdatetime` datetime DEFAULT NULL,
  `fphonenum` varchar(50) DEFAULT NULL,
  `fphonetime` datetime DEFAULT NULL,
  `fislostinfo` varchar(10) DEFAULT NULL,
  `fislosttime` datetime DEFAULT NULL,
  `fregtime` datetime DEFAULT NULL,
  PRIMARY KEY (`funiqueid`),
  UNIQUE KEY `serialnumber` (`serialnumber`),
  KEY `idx_increaseid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_authority_users 结构
CREATE TABLE IF NOT EXISTS `t_authority_users` (
  `FID` char(36) NOT NULL,
  `FIncreaseID` bigint(20) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) DEFAULT NULL,
  `FPwd` varchar(50) DEFAULT NULL,
  `FMobile` varchar(50) DEFAULT NULL,
  `FEmail` varchar(50) DEFAULT NULL,
  `FAdress` varchar(200) DEFAULT NULL,
  `FDescription` mediumtext,
  `FCreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `FIncreaseID` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_serialnumber_param 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_param` (
  `FTypeID` varchar(100) NOT NULL COMMENT '主键类别ID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FSnID` varchar(50) DEFAULT NULL COMMENT '序列号ID',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FName` varchar(50) DEFAULT NULL COMMENT '名称',
  `FCode` varchar(50) DEFAULT NULL COMMENT '代码',
  `FChar1` varchar(50) DEFAULT NULL COMMENT '文本参数',
  `FChar2` varchar(50) DEFAULT NULL COMMENT '文本参数',
  `FChar3` varchar(50) DEFAULT NULL COMMENT '文本参数',
  `FChar4` varchar(50) DEFAULT NULL COMMENT '文本参数',
  `FLong1` bigint(20) DEFAULT NULL COMMENT '数值参数',
  `FLong2` bigint(20) DEFAULT NULL COMMENT '数值参数',
  `FLong3` bigint(20) DEFAULT NULL COMMENT '数值参数',
  `FIsDelete` int(11) DEFAULT NULL COMMENT '是否删除（禁用）',
  `FIsLock` int(11) DEFAULT NULL COMMENT '是否锁定',
  `FCategory` int(11) DEFAULT NULL COMMENT '分类',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  `FOrder` int(11) DEFAULT NULL COMMENT '排序',
  `FOperator` varchar(50) DEFAULT NULL,
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`FTypeID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手表配置参数：静默设置、gps定位模式等';

-- 数据导出被取消选择。


-- 导出  表 dbtest.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `funiqueid` varchar(50) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialnumber` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `status` char(1) DEFAULT '0',
  `createtime` varchar(50) NOT NULL DEFAULT '',
  `fmobile` varchar(50) DEFAULT '',
  `nickname` varchar(50) DEFAULT '',
  `birthday` varchar(50) DEFAULT '',
  `height` varchar(20) DEFAULT '',
  `weight` varchar(20) DEFAULT '',
  `picture` varchar(100) DEFAULT '',
  `flogcount` int(11) DEFAULT '0',
  `floglasttime` datetime DEFAULT NULL,
  `floglaspip` varchar(50) DEFAULT '',
  `fienabled` int(11) DEFAULT '0',
  `fdatastatus` int(11) DEFAULT '0',
  `fremark` varchar(500) DEFAULT '',
  `femail` varchar(100) DEFAULT '',
  `furl` varchar(200) DEFAULT '',
  `faddress` varchar(200) DEFAULT '',
  PRIMARY KEY (`funiqueid`),
  KEY `serialnumber` (`serialnumber`),
  KEY `idx_increaseid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
