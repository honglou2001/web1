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

-- 导出  表 dbtest.admin 结构
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `last_logintime` varchar(20) DEFAULT NULL,
  `headimage` varchar(100) DEFAULT NULL,
  `updatetime` varchar(20) DEFAULT NULL,
  `last_loginip` varchar(30) DEFAULT NULL,
  `login_count` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.admin_log 结构
CREATE TABLE IF NOT EXISTS `admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `login_ip` varchar(30) DEFAULT NULL,
  `login_time` varchar(50) DEFAULT NULL,
  `messages` varchar(100) DEFAULT NULL,
  `error` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.alarm 结构
CREATE TABLE IF NOT EXISTS `alarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialnumber` varchar(20) NOT NULL,
  `alarm` varchar(50) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serialnumber` (`serialnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.associatedaccount 结构
CREATE TABLE IF NOT EXISTS `associatedaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialnumber` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.bindphone 结构
CREATE TABLE IF NOT EXISTS `bindphone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialnumber` varchar(20) NOT NULL,
  `sos` varchar(500) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL DEFAULT '0',
  `masterno` varchar(50) NOT NULL DEFAULT '',
  `listenno` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `serialnumber` (`serialnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.config 结构
CREATE TABLE IF NOT EXISTS `config` (
  `varname` varchar(20) NOT NULL DEFAULT '',
  `info` varchar(100) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `value` text NOT NULL,
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `varname` (`varname`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.electfence 结构
CREATE TABLE IF NOT EXISTS `electfence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialnumber` varchar(20) DEFAULT NULL,
  `areanum` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `locationbd` varchar(50) DEFAULT NULL,
  `locationgd` varchar(50) DEFAULT NULL,
  `model` char(1) DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `createtime` varchar(20) DEFAULT NULL,
  `updatetime` varchar(20) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `serialnumber` (`serialnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.focus 结构
CREATE TABLE IF NOT EXISTS `focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `fusername` varchar(20) DEFAULT NULL,
  `status` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.info 结构
CREATE TABLE IF NOT EXISTS `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `serialnumber` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.locationinfo 结构
CREATE TABLE IF NOT EXISTS `locationinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialnumber` varchar(20) DEFAULT NULL,
  `text` longtext,
  `location` longtext,
  `lng` varchar(20) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `battery` varchar(3) DEFAULT NULL,
  `FAddTime` datetime DEFAULT NULL,
  `FUpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serialnumber` (`serialnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.myclass 结构
CREATE TABLE IF NOT EXISTS `myclass` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `sex` int(4) NOT NULL DEFAULT '0',
  `degree` double(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


-- 导出  表 dbtest.pedometer 结构
CREATE TABLE IF NOT EXISTS `pedometer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialnumber` varchar(20) NOT NULL,
  `distance` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serialnumber` (`serialnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.post 结构
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `content` longtext,
  `time` varchar(50) DEFAULT NULL,
  `picture` varchar(500) DEFAULT NULL,
  `status` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.rtposition 结构
CREATE TABLE IF NOT EXISTS `rtposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `query` char(1) DEFAULT NULL,
  `serialnumber` varchar(20) NOT NULL DEFAULT '',
  `createtime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.serialnumber 结构
CREATE TABLE IF NOT EXISTS `serialnumber` (
  `funiqueid` varchar(50) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialnumber` varchar(20) NOT NULL,
  `status` char(1) DEFAULT '0',
  `fdevtype` int(11) DEFAULT '0',
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
  `fdatastatus` int(11) DEFAULT '0',
  `fremark` varchar(500) DEFAULT NULL,
  `fpicture` varchar(100) DEFAULT NULL,
  `fupdatetime` datetime DEFAULT NULL,
  `fphonenum` varchar(50) DEFAULT NULL,
  `fphonetime` datetime DEFAULT NULL,
  `fislostinfo` varchar(10) DEFAULT NULL,
  `fislosttime` datetime DEFAULT NULL,
  `fregtime` datetime DEFAULT NULL,
  `fbattery` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`funiqueid`),
  UNIQUE KEY `serialnumber` (`serialnumber`),
  KEY `idx_increaseid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.somepraise 结构
CREATE TABLE IF NOT EXISTS `somepraise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `postid` varchar(20) NOT NULL,
  `status` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.subfloor 结构
CREATE TABLE IF NOT EXISTS `subfloor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `content` longtext,
  `time` varchar(50) DEFAULT NULL,
  `postid` varchar(20) NOT NULL,
  `supid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.supfloor 结构
CREATE TABLE IF NOT EXISTS `supfloor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `content` longtext,
  `time` varchar(50) DEFAULT NULL,
  `postid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

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


-- 导出  表 dbtest.t_authority_tenant 结构
CREATE TABLE IF NOT EXISTS `t_authority_tenant` (
  `FTenantID` varchar(255) NOT NULL,
  `FIncreaseID` decimal(19,2) DEFAULT NULL,
  `FParentID` varchar(255) DEFAULT NULL,
  `FTenantName` varchar(255) DEFAULT NULL,
  `FFullName` varchar(255) DEFAULT NULL,
  `FCode` varchar(255) DEFAULT NULL,
  `FLogo` varchar(255) DEFAULT NULL,
  `FAddress` varchar(255) DEFAULT NULL,
  `FZipCode` varchar(255) DEFAULT NULL,
  `FStaffNum` varchar(255) DEFAULT NULL,
  `FDescription` varchar(255) DEFAULT NULL,
  `FCategory` int(11) DEFAULT NULL,
  `FDataStatus` int(11) DEFAULT NULL,
  `FFieldStatus` int(11) DEFAULT NULL,
  `FAddTime` datetime DEFAULT NULL,
  `FUpdateTime` datetime DEFAULT NULL,
  `FRemark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FTenantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `FTenantID` varchar(255) DEFAULT NULL,
  KEY `FIncreaseID` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_base_area 结构
CREATE TABLE IF NOT EXISTS `t_base_area` (
  `FAreaID` varchar(255) NOT NULL,
  `FIncreaseID` int(11) DEFAULT NULL,
  `FParentID` varchar(255) DEFAULT NULL,
  `FName` varchar(255) DEFAULT NULL,
  `FCode` varchar(255) DEFAULT NULL,
  `FCategory` int(11) DEFAULT NULL,
  `FOrder` int(11) DEFAULT NULL,
  `FAddTime` datetime DEFAULT NULL,
  `FUpdateTime` datetime DEFAULT NULL,
  `FParentName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FAreaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_base_typecode 结构
CREATE TABLE IF NOT EXISTS `t_base_typecode` (
  `FTypeID` varchar(100) NOT NULL COMMENT '�������ID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '������',
  `FName` varchar(50) DEFAULT NULL COMMENT '����',
  `FCode` varchar(500) DEFAULT NULL COMMENT '����',
  `FValue1` varchar(50) DEFAULT NULL COMMENT '��Ӧֵ',
  `FValue2` varchar(50) DEFAULT NULL COMMENT '��Ӧֵ��',
  `FValue3` varchar(50) DEFAULT NULL COMMENT '��Ӧֵ��',
  `FValue4` varchar(50) DEFAULT NULL COMMENT '��Ӧֵ��',
  `FValue5` varchar(50) DEFAULT NULL COMMENT '��Ӧֵ��',
  `FIsDelete` int(11) DEFAULT NULL COMMENT '�Ƿ�ɾ�������ã�',
  `FCategory` int(11) DEFAULT NULL COMMENT '����',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '��ע',
  `FOrder` int(11) DEFAULT NULL COMMENT '����',
  `FAddTime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '�޸�ʱ��',
  `FIsLock` int(11) DEFAULT NULL,
  PRIMARY KEY (`FTypeID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������������𼰲���';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_farm_batch 结构
CREATE TABLE IF NOT EXISTS `t_farm_batch` (
  `FFBatchID` varchar(255) NOT NULL,
  `FIncreaseID` decimal(19,2) DEFAULT NULL,
  `FTenantID` varchar(255) DEFAULT NULL,
  `FarmID` varchar(255) DEFAULT NULL,
  `FStrain` varchar(255) DEFAULT NULL,
  `FBirth` varchar(255) DEFAULT NULL,
  `FBatchNo` varchar(255) DEFAULT NULL,
  `FPigPen` varchar(255) DEFAULT NULL,
  `FGrStage` varchar(255) DEFAULT NULL,
  `FType` int(11) DEFAULT NULL,
  `FDataStatus` int(11) DEFAULT NULL,
  `FFieldStatus` int(11) DEFAULT NULL,
  `FUserID` varchar(255) DEFAULT NULL,
  `FAddTime` datetime DEFAULT NULL,
  `FUpdateTime` datetime DEFAULT NULL,
  `FRemark` varchar(255) DEFAULT NULL,
  `FarmName` varchar(255) DEFAULT NULL,
  `FTenantName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FFBatchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_farm_feedrecord 结构
CREATE TABLE IF NOT EXISTS `t_farm_feedrecord` (
  `FFeedRecID` varchar(50) NOT NULL DEFAULT '',
  `FFBatchID` varchar(50) DEFAULT NULL,
  `FIncreaseID` decimal(19,2) DEFAULT NULL,
  `FFeedDate` datetime DEFAULT NULL,
  `FFoodstuff` varchar(100) DEFAULT NULL,
  `FWeight` decimal(9,3) DEFAULT NULL,
  `FDataStatus` int(11) DEFAULT NULL,
  `FFieldStatus` int(11) DEFAULT NULL,
  `FUserID` varchar(50) DEFAULT NULL,
  `FAddTime` datetime DEFAULT NULL,
  `FUpdateTime` datetime DEFAULT NULL,
  `FRemark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FFeedRecID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_farm_outrecord 结构
CREATE TABLE IF NOT EXISTS `t_farm_outrecord` (
  `FRecordID` varchar(50) DEFAULT NULL,
  `FarmID` varchar(50) DEFAULT NULL,
  `FIncreaseID` bigint(20) DEFAULT NULL,
  `FFBatchID` varchar(50) DEFAULT NULL,
  `FLogisticsID` varchar(50) DEFAULT NULL,
  `FQBatchID` varchar(50) DEFAULT NULL,
  `FTattooID` varchar(50) DEFAULT NULL,
  `FTenantID` varchar(50) DEFAULT NULL,
  `FLng` varchar(20) DEFAULT NULL,
  `FLat` varchar(20) DEFAULT NULL,
  `FCount` int(11) DEFAULT NULL,
  `FDataStatus` int(11) DEFAULT NULL,
  `FFieldStatus` int(11) DEFAULT NULL,
  `FUserID` varchar(50) DEFAULT NULL,
  `FAddTime` datetime DEFAULT NULL,
  `FUpdateTime` datetime DEFAULT NULL,
  `FRemark` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_farm_treatment 结构
CREATE TABLE IF NOT EXISTS `t_farm_treatment` (
  `FTreatID` varchar(50) DEFAULT NULL,
  `FFBatchID` varchar(50) DEFAULT NULL,
  `FIncreaseID` bigint(20) DEFAULT NULL,
  `FTreatDate` datetime DEFAULT NULL,
  `FTreatName` varchar(50) DEFAULT NULL,
  `FSpecs` varchar(50) DEFAULT NULL,
  `FDataStatus` int(11) DEFAULT NULL,
  `FFieldStatus` int(11) DEFAULT NULL,
  `FUserID` varchar(50) DEFAULT NULL,
  `FAddTime` datetime DEFAULT NULL,
  `FUpdateTime` datetime DEFAULT NULL,
  `FRemark` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_friend_contact 结构
CREATE TABLE IF NOT EXISTS `t_friend_contact` (
  `FContactID` varchar(50) NOT NULL COMMENT '联系信息ID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FAPPUserID` varchar(50) DEFAULT NULL COMMENT 'APP用户ID',
  `FFromSnID` varchar(50) DEFAULT NULL COMMENT 'APP用户下的手表',
  `FToSnID` varchar(50) DEFAULT NULL COMMENT '目标手表id',
  `FAction` int(11) DEFAULT NULL COMMENT '新增修改删除动作：1、2、3',
  `FIndex` int(11) DEFAULT NULL COMMENT '排序索引，服务器保证按序列号保证唯一',
  `FName` varchar(50) DEFAULT NULL COMMENT '通讯录人名称',
  `FPhoneNum` varchar(20) DEFAULT NULL COMMENT '发出去的手机号码',
  `FProperties` int(11) DEFAULT NULL COMMENT '属性，普通或sos、listen、master等：0、1、2、3',
  `FDialType` int(11) DEFAULT NULL COMMENT '拨号类型1：普通直拨；2：回拨',
  `FZone` varchar(10) DEFAULT NULL COMMENT '区号',
  `FBackup1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `FBackup2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  `FCallBackUrl` varchar(200) DEFAULT NULL COMMENT '回调的地址',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT '0' COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  `fpicture` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `serialnumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FContactID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发送到硬件手环的号码';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_friend_relation 结构
CREATE TABLE IF NOT EXISTS `t_friend_relation` (
  `FRelationID` varchar(50) NOT NULL COMMENT '关系ID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FUserIDStr` varchar(50) DEFAULT NULL COMMENT '用户ID，备用为id修改为string',
  `FFriendID` varchar(50) DEFAULT NULL,
  `FCategory` int(11) DEFAULT NULL COMMENT '类别',
  `FOrder` int(11) DEFAULT NULL COMMENT '排序',
  `FLevel` int(11) DEFAULT NULL COMMENT '重要性',
  `FIsDelete` int(11) DEFAULT NULL COMMENT '是否删除',
  `FStatus` int(11) DEFAULT '0' COMMENT '状态验证通过或拒绝',
  `FStatusTime` datetime DEFAULT NULL COMMENT '状态发生对应时间',
  `FAttachText` varchar(500) DEFAULT NULL,
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  `friendname` varchar(255) DEFAULT NULL,
  `fmobile` varchar(255) DEFAULT NULL,
  `fusername` varchar(255) DEFAULT NULL,
  `fusermobile` varchar(255) DEFAULT NULL,
  `frompic` varchar(255) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FRelationID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友列表';

-- 数据导出被取消选择。


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
  `frecordcount` int(11) DEFAULT '0',
  PRIMARY KEY (`FLocFenID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进出电子围栏关系表';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_loc_electfence_single 结构
CREATE TABLE IF NOT EXISTS `t_loc_electfence_single` (
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
  `frecordcount` int(11) DEFAULT '0',
  PRIMARY KEY (`FLocFenID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进出电子围栏关系表-无电子围栏信息';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_mq_log 结构
CREATE TABLE IF NOT EXISTS `t_mq_log` (
  `FLogID` varchar(50) NOT NULL COMMENT '日志id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FMQID` varchar(50) DEFAULT NULL COMMENT '关联的消息id',
  `FLogType` int(11) DEFAULT NULL COMMENT '日志类型',
  `FDescription` varchar(500) DEFAULT NULL COMMENT '日志描述',
  `FCmd` varchar(20) DEFAULT NULL COMMENT '命令号',
  `FCmdData` varchar(100) DEFAULT NULL COMMENT '帧的数据内容',
  `FCmdFrame` varchar(200) DEFAULT NULL COMMENT '发送的数据帧',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '手表id',
  `FSNnumber` varchar(50) DEFAULT NULL COMMENT '序列号',
  `FElapseCount` int(11) DEFAULT NULL COMMENT '执行了多少次',
  `FElapseSec` int(11) DEFAULT NULL COMMENT '超时秒数',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FPlanTime` datetime DEFAULT NULL COMMENT '开始执行的时间',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  `FOperator` varchar(50) DEFAULT NULL COMMENT '操作人',
  `FOperateState` int(11) DEFAULT NULL COMMENT '操作状态',
  `FOperateTime` datetime DEFAULT NULL COMMENT '操作时间',
  `FNotifyState` int(11) DEFAULT NULL COMMENT '通知状态',
  `FNotifyMode` varchar(50) DEFAULT NULL COMMENT '通知方式，短信、邮件等',
  `FNotifyTime` datetime DEFAULT NULL COMMENT '通知时间',
  PRIMARY KEY (`FLogID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息通讯异常日志记录';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_mq_received 结构
CREATE TABLE IF NOT EXISTS `t_mq_received` (
  `FReceivedID` varchar(50) NOT NULL COMMENT '应答消息id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FMqID` varchar(50) DEFAULT NULL COMMENT '发出的消息id',
  `FCmd` varchar(20) DEFAULT NULL COMMENT '命令号',
  `FCmdType` int(11) DEFAULT NULL COMMENT '命令类型',
  `FPriority` int(11) DEFAULT NULL COMMENT '优先级，0-9',
  `FReceivedData` varchar(500) DEFAULT NULL COMMENT '通讯数据Hex',
  `FReceivedTime` datetime DEFAULT NULL COMMENT '执行时间',
  `FReceivedResult` int(11) DEFAULT NULL COMMENT '执行结果',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '手表id',
  `FState` int(11) DEFAULT NULL COMMENT '状态',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(1000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FReceivedID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应答信息';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_mq_task 结构
CREATE TABLE IF NOT EXISTS `t_mq_task` (
  `FMQID` varchar(50) NOT NULL COMMENT '消息id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FCmd` varchar(20) DEFAULT NULL COMMENT '命令号',
  `FCmdType` int(11) DEFAULT NULL COMMENT '命令类型',
  `FSrcTable` varchar(20) DEFAULT NULL COMMENT '源数据表',
  `FSrcColumn` varchar(20) DEFAULT NULL COMMENT '源数据列',
  `FParam` varchar(500) DEFAULT NULL COMMENT '参数，多个,号隔开',
  `FTryCount` int(11) DEFAULT NULL COMMENT '发送次数',
  `FPriority` int(11) DEFAULT NULL COMMENT '优先级，0-9',
  `FSendData` varchar(500) DEFAULT NULL COMMENT '通讯数据Hex',
  `FExcTime` datetime DEFAULT NULL COMMENT '执行时间',
  `FExcResult` int(11) DEFAULT NULL COMMENT '执行结果',
  `FPlanTime` datetime DEFAULT NULL COMMENT '计划时间',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '手表id',
  `FState` int(11) DEFAULT NULL COMMENT '状态',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FMQID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息队列表，与activemq结合';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_notify_info 结构
CREATE TABLE IF NOT EXISTS `t_notify_info` (
  `FNotifyID` varchar(50) NOT NULL COMMENT '通知id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FNotifyType` int(11) DEFAULT NULL COMMENT '通知类型',
  `FTitle` varchar(50) DEFAULT NULL COMMENT '标题',
  `FDescription` varchar(500) DEFAULT NULL COMMENT '日志描述',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '手表id',
  `FName` varchar(50) DEFAULT NULL COMMENT '名称',
  `FVal1` varchar(50) DEFAULT NULL COMMENT '值1',
  `FVal2` varchar(50) DEFAULT NULL COMMENT '值2',
  `FVal3` varchar(50) DEFAULT NULL COMMENT '值3',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FNotifyID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息通知';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_reward_list 结构
CREATE TABLE IF NOT EXISTS `t_reward_list` (
  `FRewardID` varchar(50) NOT NULL COMMENT '奖励体系ID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '手表id',
  `FCategory` int(11) DEFAULT NULL COMMENT '类别',
  `FTitle` varchar(100) DEFAULT NULL COMMENT '标题',
  `FContent` varchar(2000) DEFAULT NULL COMMENT '内容说明',
  `FPicture` varchar(200) DEFAULT NULL COMMENT '图片url',
  `FScore` varchar(200) DEFAULT NULL COMMENT '默认奖励分数',
  `FState` int(11) DEFAULT NULL COMMENT '状态',
  `FStarttime` datetime DEFAULT NULL COMMENT '开始时间',
  `FEndTime` datetime DEFAULT NULL COMMENT '结束时间',
  `FProduct` varchar(200) DEFAULT NULL COMMENT '产品',
  `FProductID` varchar(100) DEFAULT NULL COMMENT '产品id，备用',
  `FOrder` int(11) DEFAULT NULL COMMENT '排序',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FRewardID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='奖励体系';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_scm_distributors 结构
CREATE TABLE IF NOT EXISTS `t_scm_distributors` (
  `FDistributorID` varchar(50) NOT NULL COMMENT '������������ID',
  `FParentID` varchar(50) DEFAULT NULL COMMENT '�ϼ�������ID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '������',
  `FIntroducer` varchar(50) DEFAULT NULL COMMENT '������ID',
  `FIntroerType` int(11) DEFAULT NULL COMMENT '���������',
  `FName` varchar(100) DEFAULT NULL COMMENT '����������',
  `FPhone` varchar(20) DEFAULT NULL COMMENT '��ϵ�绰',
  `FMobile` varchar(50) DEFAULT NULL COMMENT '��ϵ�ֻ�',
  `FAddress` varchar(150) DEFAULT NULL COMMENT '��ϵ��ַ',
  `FZipCode` varchar(20) DEFAULT NULL COMMENT '�ʱ�',
  `fsex` int(11) DEFAULT NULL,
  `FBirthday` datetime DEFAULT NULL COMMENT '��������',
  `FWeight` int(11) DEFAULT NULL COMMENT '����kg',
  `FHeight` int(11) DEFAULT NULL COMMENT '���cm',
  `FRemark` varchar(1000) DEFAULT NULL COMMENT '��ע',
  `FPicture` varchar(100) DEFAULT NULL COMMENT '��Ƭ',
  `FRelativeURL` varchar(200) DEFAULT NULL COMMENT '�����ַ',
  `FRank` int(11) DEFAULT NULL COMMENT 'Ȩ��',
  `FOrder` int(11) DEFAULT NULL COMMENT '����',
  `FAddTime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '�޸�ʱ��',
  PRIMARY KEY (`FDistributorID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_scm_salesdata 结构
CREATE TABLE IF NOT EXISTS `t_scm_salesdata` (
  `FSaleDataID` varchar(50) NOT NULL COMMENT '������ΨһID',
  `FDistributorID` varchar(50) DEFAULT NULL COMMENT '�����������ID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '������',
  `FPrice` decimal(12,3) DEFAULT NULL COMMENT '���ۼ۸�',
  `FAmount` int(11) DEFAULT NULL COMMENT '��������',
  `FType` int(11) DEFAULT NULL COMMENT '��������',
  `FDate` datetime DEFAULT NULL COMMENT '��������(ʱ��)',
  `FAddTime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '�޸�ʱ��',
  `fdistributor` varchar(255) DEFAULT NULL,
  `ftotal` decimal(19,2) DEFAULT NULL,
  `fsplit` decimal(19,2) DEFAULT NULL,
  `fsplittoal` decimal(19,2) DEFAULT NULL,
  `fintroducer` varchar(255) DEFAULT NULL,
  `fparentid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FSaleDataID`),
  KEY `AK_Key_2` (`FIncreaseID`),
  KEY `FK_Reference_distributor_saledata` (`FDistributorID`),
  CONSTRAINT `FK_Reference_distributor_saledata` FOREIGN KEY (`FDistributorID`) REFERENCES `t_scm_distributors` (`FDistributorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_scm_salesdivided 结构
CREATE TABLE IF NOT EXISTS `t_scm_salesdivided` (
  `FDivided` varchar(50) NOT NULL COMMENT '����ֵ',
  `FSaleDataID` varchar(50) DEFAULT NULL COMMENT '�����salseID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '������',
  `FPercent` decimal(12,3) DEFAULT NULL,
  `FAmount` decimal(12,3) DEFAULT NULL COMMENT '�ֳɽ��',
  `FDate` datetime DEFAULT NULL COMMENT '�ֳ�ʱ��',
  `FAddTime` datetime DEFAULT NULL COMMENT '¼��ʱ��',
  `FRemark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`FDivided`),
  KEY `AK_Key_2` (`FIncreaseID`),
  KEY `FK_Reference_2` (`FSaleDataID`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`FSaleDataID`) REFERENCES `t_scm_salesdata` (`FSaleDataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_serialnumber_apiphone 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_apiphone` (
  `FClientID` varchar(50) NOT NULL COMMENT '记录id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FAppId` varchar(50) DEFAULT NULL COMMENT '应用程序id',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '手表id',
  `FSNNumber` varchar(50) DEFAULT NULL COMMENT '手表序列号',
  `FClientNumber` varchar(50) DEFAULT NULL COMMENT '申请到的客户端id',
  `FClientPwd` varchar(50) DEFAULT NULL COMMENT '密码',
  `FClientType` varchar(10) DEFAULT NULL COMMENT '类型',
  `FFriendlyName` varchar(20) DEFAULT NULL COMMENT '友好名称',
  `FMobile` varchar(20) DEFAULT NULL COMMENT '电话',
  `FRoam` varchar(20) DEFAULT NULL COMMENT '是否开通呼转1：开通，0：未开通',
  `FBalance` decimal(9,3) DEFAULT NULL COMMENT '账户余额',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FCreateDate` datetime DEFAULT NULL COMMENT 'Client的创建时间',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FClientID`),
  UNIQUE KEY `uniqueIndex_FClientNumber` (`FClientNumber`),
  UNIQUE KEY `uniqueIndex_FMobile` (`FMobile`),
  KEY `AK_Key_2` (`FIncreaseID`),
  KEY `AK_Key_4` (`FSNID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='云之讯接口号码';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_serialnumber_datarelate 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_datarelate` (
  `FDatarelateID` varchar(100) NOT NULL COMMENT '当前关联ID，此ID会给每一条数据进行分配',
  `fsndusrid` varchar(50) DEFAULT '' COMMENT '数据归属主键ID',
  `funiqueid` varchar(50) DEFAULT NULL COMMENT '设备主键',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `fappcountid` varchar(50) DEFAULT NULL COMMENT 'fk账号用户id',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `fstarttime` datetime DEFAULT NULL COMMENT '开始日期',
  `fendtime` datetime DEFAULT NULL COMMENT '结束日期',
  `FIsDelete` int(11) DEFAULT NULL COMMENT '是否删除（禁用）',
  `FIsLock` int(11) DEFAULT NULL COMMENT '是否锁定',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '数据状态',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  `FOrder` int(11) DEFAULT NULL COMMENT '排序',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `fdeletetime` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`FDatarelateID`),
  UNIQUE KEY `uniqueIndex_relatesnidstr` (`funiqueid`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='当前设备归属用户关系';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_serialnumber_datauser 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_datauser` (
  `fsndusrid` varchar(50) NOT NULL DEFAULT '' COMMENT '数据归属主键ID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `fappcountid` varchar(50) DEFAULT NULL COMMENT 'fk账号用户id',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `nickname` varchar(50) DEFAULT '',
  `callname` varchar(50) DEFAULT NULL COMMENT '称呼',
  `relation` varchar(50) DEFAULT NULL COMMENT '关系',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `fpassword` varchar(20) DEFAULT NULL COMMENT '联系密码',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `fstatus` char(1) DEFAULT '0' COMMENT '状态',
  `createtime` varchar(50) DEFAULT '',
  `fmobile` varchar(50) DEFAULT '',
  `femail` varchar(100) DEFAULT '',
  `address` varchar(250) DEFAULT NULL COMMENT '住址',
  `birthday` varchar(50) DEFAULT '',
  `height` varchar(20) DEFAULT '',
  `weight` varchar(20) DEFAULT '',
  `picture` varchar(100) DEFAULT '',
  `flogcount` int(11) DEFAULT '0',
  `floglasttime` datetime DEFAULT NULL,
  `floglaspip` varchar(50) DEFAULT '',
  `fienabled` int(11) DEFAULT '0',
  `fdatastatus` int(11) DEFAULT '0',
  `fisdeleted` int(11) DEFAULT NULL COMMENT '是否已删除，不做物理删除',
  `fdeletetime` datetime DEFAULT NULL COMMENT '删除时间',
  `flockstatus` int(11) DEFAULT NULL COMMENT '锁定状态',
  `fremark` varchar(500) DEFAULT '',
  `furl` varchar(200) DEFAULT '',
  `faddress` varchar(200) DEFAULT '',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`fsndusrid`),
  KEY `idx_increaseid` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='当前序列号数据归属用户';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_serialnumber_detach 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_detach` (
  `FDetachID` varchar(50) NOT NULL COMMENT '移除id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '手表id',
  `FDetachInfo` varchar(50) DEFAULT NULL COMMENT '摘落信息',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FDetachID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手表摘落信息';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_serialnumber_emailhistory 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_emailhistory` (
  `FEmailRecID` varchar(50) NOT NULL COMMENT '邮件记录id',
  `FTemplateID` varchar(50) DEFAULT NULL COMMENT '使用的模板id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FAppId` varchar(100) DEFAULT NULL COMMENT '应用程序id',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '手表id',
  `FSNNumber` varchar(50) DEFAULT NULL COMMENT '手表序列号',
  `FLanguage` int(11) DEFAULT NULL COMMENT '语言类别',
  `FTag` varchar(500) DEFAULT NULL COMMENT '标签',
  `FTitle` varchar(50) DEFAULT NULL COMMENT '分类标题，soundin-进电子围栏；soundout出电子围栏;soundcharge-充值提醒;soundbattery-电量提醒',
  `FToAddress` varchar(200) DEFAULT NULL COMMENT '目的邮件地址',
  `FFromAddress` varchar(200) DEFAULT NULL COMMENT '发出的邮件地址',
  `FType` int(11) DEFAULT NULL COMMENT '分类',
  `FContent` varchar(10000) DEFAULT NULL COMMENT '消息内容',
  `FAattachment` varchar(100) DEFAULT NULL COMMENT '附件路径',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FEmailRecID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件发送历史记录';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_serialnumber_emailsmtp 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_emailsmtp` (
  `FSMtpRecID` varchar(50) NOT NULL COMMENT 'smtp记录id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FType` int(11) DEFAULT NULL COMMENT '分类',
  `FAppId` varchar(100) DEFAULT NULL COMMENT '应用程序id',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FName` varchar(50) DEFAULT NULL COMMENT 'smtp名称',
  `FMailhost` varchar(200) DEFAULT NULL COMMENT '服务器地址',
  `FMailUserName` varchar(200) DEFAULT NULL COMMENT '登录名称',
  `FMailPassword` varchar(10000) DEFAULT NULL COMMENT '登录密码',
  `FMailAddress` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `FMailFromName` varchar(100) DEFAULT NULL COMMENT '显示名称',
  `FIsDefault` int(11) DEFAULT NULL COMMENT '为1为默认，保证只能一条',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FUpdateUser` varchar(50) DEFAULT NULL COMMENT '更新的用户',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FSMtpRecID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SMTP发送服务器';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_serialnumber_emailtemplate 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_emailtemplate` (
  `FTemplateID` varchar(50) NOT NULL COMMENT '模板id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FAppId` varchar(100) DEFAULT NULL COMMENT '应用程序id',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '手表id',
  `FSNNumber` varchar(50) DEFAULT NULL COMMENT '手表序列号',
  `FTag` varchar(500) DEFAULT NULL COMMENT '标签',
  `FTitle` varchar(50) DEFAULT NULL COMMENT '分类标题，soundin-进电子围栏；soundout出电子围栏;soundcharge-充值提醒;soundbattery-电量提醒',
  `FType` int(11) DEFAULT NULL COMMENT '分类',
  `FContent` varchar(10000) DEFAULT NULL COMMENT '消息内容',
  `FLanguage` int(11) DEFAULT NULL COMMENT '语言类别',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FTemplateID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件发送模板';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_serialnumber_fee 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_fee` (
  `FFeeID` varchar(50) NOT NULL COMMENT '费用id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FTitle` varchar(50) DEFAULT NULL COMMENT '标题',
  `FDescription` varchar(500) DEFAULT NULL COMMENT '描述',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '手表id',
  `FFeeType` int(11) DEFAULT NULL COMMENT '费用类型',
  `FDeposit` decimal(9,3) DEFAULT '0.000' COMMENT '存入金额',
  `FSpending` decimal(9,3) DEFAULT '0.000' COMMENT '支出',
  `FBalance` decimal(9,3) DEFAULT '0.000' COMMENT '余额',
  `FValidStatus` int(11) DEFAULT NULL COMMENT '有效状态',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  `FRelTable` varchar(50) DEFAULT NULL COMMENT '关联数据表',
  `FRelVal` varchar(50) DEFAULT NULL COMMENT '表关联值',
  `FOperator` varchar(50) DEFAULT NULL COMMENT '操作人',
  `FOperateState` int(11) DEFAULT NULL COMMENT '操作状态',
  `FOperateTime` datetime DEFAULT NULL COMMENT '操作时间',
  `FTradeStatus` varchar(50) DEFAULT NULL,
  `FTradeNo` varchar(100) DEFAULT NULL,
  `FTradeTime` datetime DEFAULT NULL,
  PRIMARY KEY (`FFeeID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手表费用';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_serialnumber_feepacket 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_feepacket` (
  `FPacketID` varchar(50) NOT NULL COMMENT '套餐iid',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FTitle` varchar(50) DEFAULT NULL COMMENT '标题',
  `FDescription` varchar(500) DEFAULT NULL COMMENT '描述',
  `FCategory` int(11) DEFAULT NULL COMMENT '设备分类',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '手表id',
  `FPacketType` int(11) DEFAULT NULL COMMENT '套餐类型',
  `FPacketFee` decimal(9,3) DEFAULT NULL COMMENT '套餐费用',
  `FDiscount` decimal(9,3) DEFAULT NULL COMMENT '折扣优惠比例',
  `FBeginTime` datetime DEFAULT NULL COMMENT '套餐开始时间',
  `FEndTime` datetime DEFAULT NULL COMMENT '结束时间',
  `FValidStatus` int(11) DEFAULT NULL COMMENT '有效状态',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  `FOperator` varchar(50) DEFAULT NULL COMMENT '操作人',
  `FOperateState` int(11) DEFAULT NULL COMMENT '操作状态',
  `FOperateTime` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`FPacketID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户或手表套餐';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_serialnumber_jpush 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_jpush` (
  `FPushID` varchar(50) NOT NULL COMMENT '记录id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FAppId` varchar(100) DEFAULT NULL COMMENT '应用程序id',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '手表id',
  `FSNNumber` varchar(50) DEFAULT NULL COMMENT '手表序列号',
  `FALias` varchar(500) DEFAULT NULL COMMENT '别名，多个用逗号隔开',
  `FTag` varchar(500) DEFAULT NULL COMMENT '标签',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FPushID`),
  UNIQUE KEY `uniqueIndex_PushFUserID` (`FUserID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='极光推送';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_serialnumber_jpushmsg 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_jpushmsg` (
  `FPushMsgID` varchar(50) NOT NULL COMMENT '消息id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FAppId` varchar(100) DEFAULT NULL COMMENT '应用程序id',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '手表id',
  `FSNNumber` varchar(50) DEFAULT NULL COMMENT '手表序列号',
  `FALias` varchar(500) DEFAULT NULL COMMENT '别名，多个用逗号隔开',
  `FTag` varchar(500) DEFAULT NULL COMMENT '标签',
  `FTitle` varchar(50) DEFAULT NULL COMMENT '分类标题，soundin-进电子围栏；soundout出电子围栏;soundcharge-充值提醒;soundbattery-电量提醒',
  `FType` int(11) DEFAULT NULL COMMENT '分类',
  `FContent` varchar(1000) DEFAULT NULL COMMENT '消息内容',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FPushMsgID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='极光推送消息记录';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_serialnumber_meter 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_meter` (
  `FMeterID` varchar(50) NOT NULL COMMENT '记录id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '手表id',
  `FSNNumber` varchar(50) DEFAULT NULL COMMENT '手表序列号',
  `FMeterInfo` varchar(50) DEFAULT NULL COMMENT '计步信息',
  `FVal1` int(11) DEFAULT NULL COMMENT '值1',
  `FVa2` int(11) DEFAULT NULL COMMENT '值2',
  `FChar1` varchar(20) DEFAULT NULL COMMENT '字符1',
  `FChar2` varchar(20) DEFAULT NULL COMMENT '字符1',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FMeterID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计步器';

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


-- 导出  表 dbtest.t_serialnumber_sport 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_sport` (
  `FSportRecID` varchar(50) NOT NULL COMMENT '记录id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `FDataToUsrid` varchar(50) DEFAULT NULL COMMENT 'fk数据归属主键ID',
  `FSNID` varchar(50) DEFAULT NULL COMMENT '设备id',
  `FSNNumber` varchar(50) DEFAULT NULL COMMENT '设备序列号',
  `FDevType` int(11) DEFAULT NULL COMMENT '0手表，1手环',
  `FMeterInfo` varchar(50) DEFAULT NULL COMMENT '计步信息',
  `FVal1` int(11) DEFAULT NULL COMMENT '值1',
  `FVa2` int(11) DEFAULT NULL COMMENT '值2',
  `FChar1` varchar(20) DEFAULT NULL COMMENT '字符1',
  `FChar2` varchar(20) DEFAULT NULL COMMENT '字符1',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FSportTime` datetime DEFAULT NULL COMMENT '设备产生的时间',
  `FBleId` varchar(50) DEFAULT NULL COMMENT '设备编号(备用)',
  `FSportdate` varchar(20) DEFAULT NULL COMMENT '本地设备计时',
  `FStep` int(11) DEFAULT NULL COMMENT '行走步数',
  `FDistance` int(11) DEFAULT NULL COMMENT '行走多少米',
  `FCal` int(11) DEFAULT NULL COMMENT '卡路里',
  `FFloor` int(11) DEFAULT NULL COMMENT '行走楼梯数',
  `FHeartRate` int(11) DEFAULT NULL COMMENT '心率平均值',
  `FHeartrateMin` int(11) DEFAULT NULL COMMENT '最小心率',
  `FHeartRateMax` int(11) DEFAULT NULL COMMENT '心率最大值',
  `FHeartStr` varchar(5000) DEFAULT NULL COMMENT '心率接收字符串',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FSportRecID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备运：计步器、心率';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_serialnumber_weight 结构
CREATE TABLE IF NOT EXISTS `t_serialnumber_weight` (
  `FWUniqueID` varchar(100) NOT NULL COMMENT '重量主键id',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FSndusrid` varchar(50) DEFAULT '' COMMENT '主键ID',
  `FSerialnumid` varchar(50) DEFAULT NULL COMMENT '设备ID',
  `FAppcountid` varchar(50) DEFAULT NULL COMMENT 'fk账号用户id',
  `FIsDelete` int(11) DEFAULT NULL COMMENT '是否删除（禁用）',
  `FIsLock` int(11) DEFAULT NULL COMMENT '是否锁定',
  `Fweight` decimal(9,3) DEFAULT NULL COMMENT '重量',
  `FHeight` decimal(9,3) DEFAULT NULL COMMENT '身高',
  `FBMI` decimal(9,3) DEFAULT NULL COMMENT 'BMI',
  `FCalorie` decimal(9,3) DEFAULT NULL COMMENT '卡路里',
  `FFatContent` decimal(9,3) DEFAULT NULL COMMENT '脂肪值',
  `FBoneContent` decimal(9,3) DEFAULT NULL COMMENT '骨骼值',
  `FMuscleContent` decimal(9,3) DEFAULT NULL COMMENT '肌肉值',
  `FWaterContent` decimal(9,3) DEFAULT NULL COMMENT 'WaterContent',
  `FVisceralFatContent` decimal(9,3) DEFAULT NULL COMMENT 'VisceralFatContent',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '数据状态',
  `FRemark` varchar(500) DEFAULT NULL COMMENT '备注',
  `FLocalDate` varchar(50) DEFAULT NULL,
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`FWUniqueID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='脂肪秤数据';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_slaughter_batch 结构
CREATE TABLE IF NOT EXISTS `t_slaughter_batch` (
  `FSlaRecID` varchar(50) NOT NULL COMMENT '屠宰批次关联ID',
  `FHouseID` varchar(50) DEFAULT NULL COMMENT '屠宰场ID',
  `FQBatchID` varchar(50) DEFAULT NULL COMMENT '追溯批次ID',
  `FTattooID` varchar(50) DEFAULT NULL COMMENT '刺青ID',
  `FIncreaseID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '递增ID',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FSlaTime` datetime DEFAULT NULL COMMENT '屠宰时间',
  `FInsTime` datetime DEFAULT NULL COMMENT '检疫时间',
  `FInsOrg` varchar(50) DEFAULT NULL COMMENT '检疫机构',
  `FInsName` varchar(50) DEFAULT NULL COMMENT '检疫员',
  `FInsInfo` varchar(200) DEFAULT NULL COMMENT '检疫信息',
  `FUserID` varchar(50) DEFAULT NULL COMMENT '用户ID，t_authority_users主键值',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`FSlaRecID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='屠宰批次血印关系';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_test 结构
CREATE TABLE IF NOT EXISTS `t_test` (
  `Tid` varchar(255) DEFAULT NULL,
  `Ta` varchar(255) DEFAULT NULL
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


-- 导出  表 dbtest.t_user_alarm 结构
CREATE TABLE IF NOT EXISTS `t_user_alarm` (
  `FAlarmID` varchar(50) NOT NULL COMMENT '主键ID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FUserIDStr` varchar(50) DEFAULT NULL COMMENT '用户ID，备用为id修改为string',
  `FSNIDStr` varchar(50) DEFAULT NULL COMMENT 'serialno，备用修改为string',
  `FIsValid` int(11) DEFAULT NULL,
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FName` varchar(50) DEFAULT NULL COMMENT '名称',
  `FTime` varchar(20) DEFAULT NULL COMMENT '设置的时间',
  `FOrder` int(11) DEFAULT NULL COMMENT '排序',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL,
  `week` varchar(255) DEFAULT NULL,
  `hour` varchar(255) DEFAULT NULL,
  `minute` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FAlarmID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户闹钟';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_user_feedback 结构
CREATE TABLE IF NOT EXISTS `t_user_feedback` (
  `FFeedBackID` varchar(50) NOT NULL COMMENT '关系ID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FParentID` varchar(50) DEFAULT NULL COMMENT '反馈的父ID',
  `FUserIDStr` varchar(50) DEFAULT NULL COMMENT '用户ID，备用为id修改为string',
  `FContent` varchar(1000) DEFAULT NULL,
  `FCategory` int(11) DEFAULT NULL COMMENT '类别',
  `FOrder` int(11) DEFAULT NULL COMMENT '排序',
  `FLevel` int(11) DEFAULT NULL COMMENT '重要性',
  `FIsDelete` int(11) DEFAULT NULL COMMENT '是否删除',
  `FIsAnswer` int(11) DEFAULT NULL COMMENT '是否为回复',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`FFeedBackID`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈';

-- 数据导出被取消选择。


-- 导出  表 dbtest.t_user_snrelate 结构
CREATE TABLE IF NOT EXISTS `t_user_snrelate` (
  `FRelateID` varchar(50) NOT NULL COMMENT '关系ID',
  `FIncreaseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增列',
  `FUserID` int(11) DEFAULT NULL COMMENT 'User表id',
  `FSNID` int(11) DEFAULT NULL COMMENT 'serialnumber表id',
  `FUserIDStr` varchar(50) DEFAULT NULL COMMENT '用户ID，备用为id修改为string',
  `FSNIDStr` varchar(50) DEFAULT NULL COMMENT 'serialno，备用修改为string',
  `FDataStatus` int(11) DEFAULT NULL COMMENT '状态ID',
  `FFieldStatus` int(11) DEFAULT NULL COMMENT '字段属性等，锁定，禁止删除等',
  `FAddTime` datetime DEFAULT NULL COMMENT '创建时间',
  `FUpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `FRemark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`FRelateID`),
  UNIQUE KEY `uniqueIndex_snidstr` (`FSNIDStr`),
  KEY `AK_Key_2` (`FIncreaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户、序列号关系表';

-- 数据导出被取消选择。


-- 导出  表 dbtest.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `funiqueid` varchar(50) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialnumber` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
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
  UNIQUE KEY `uniqueIndex_user_femail` (`femail`),
  KEY `serialnumber` (`serialnumber`),
  KEY `idx_increaseid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dbtest.versioninfo 结构
CREATE TABLE IF NOT EXISTS `versioninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionnumber` int(11) DEFAULT NULL,
  `softname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
