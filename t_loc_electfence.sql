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

-- 导出  表 dbtest.t_loc_electfence 结构
CREATE TABLE IF NOT EXISTS `t_loc_electfence` (
  `FLocFenID` varchar(50) NOT NULL COMMENT '主键，唯一ID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FEltFenceID` int(11) DEFAULT NULL COMMENT '电子围栏ID-外键',
  `FSerialnumber` varchar(50) NOT NULL COMMENT '序列号',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FEltLongitude` varchar(50) DEFAULT NULL COMMENT '电子围栏中心经度',
  `FEltLatitude` varchar(50) DEFAULT NULL COMMENT '电子围栏中心经度',
  `FEltScope` double DEFAULT '0' COMMENT '围栏半径',
  `FEltAddress` varchar(500) DEFAULT NULL COMMENT '电子围栏中心地址',
  `FLongitude` varchar(50) DEFAULT NULL COMMENT '定位信息的经度',
  `FLatitude` varchar(50) DEFAULT NULL COMMENT '定位信息的维度',
  `FAddress` varchar(500) DEFAULT NULL COMMENT '当前地址',
  `FDistance` double DEFAULT NULL COMMENT '两点距离',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL,
  `fareanumber` int(11) DEFAULT NULL,
  `fareaname` varchar(255) DEFAULT NULL,
  `FReadCount` int(11) DEFAULT '0' COMMENT '用户读的次数',
  `fpicture` varchar(255) DEFAULT NULL,
  `battery` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FLocFenID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进出电子围栏关系表';

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
