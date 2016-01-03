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

-- 导出  表 dbtest.t_authority_resval 结构
CREATE TABLE IF NOT EXISTS `t_authority_resval` (
  `FID` varchar(50) DEFAULT NULL,
  `FName` varchar(50) DEFAULT NULL,
  `FSysID` int(11) DEFAULT NULL,
  `FVal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dbtest.t_authority_resval 的数据：~4 rows (大约)
DELETE FROM `t_authority_resval`;
/*!40000 ALTER TABLE `t_authority_resval` DISABLE KEYS */;
INSERT INTO `t_authority_resval` (`FID`, `FName`, `FSysID`, `FVal`) VALUES
	('a6621e18-2f27-11e4-a366-00ffc5cf07b8', '新增', 1, 1),
	('acdfe14a-2f27-11e4-a366-00ffc5cf07b8', '修改', 1, 2),
	('b39ac086-2f27-11e4-a366-00ffc5cf07b8', '删除', 1, 4),
	('bd38bd66-2f27-11e4-a366-00ffc5cf07b8', '查看', 1, 8);
/*!40000 ALTER TABLE `t_authority_resval` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
