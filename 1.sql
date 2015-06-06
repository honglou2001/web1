drop table if exists t_base_typecode;

/*==============================================================*/
/* Table: t_base_typecode                                       */
/*==============================================================*/
create table t_base_typecode
(
   FTypeID              varchar(100) not null comment '主键类别ID',
   FIncreaseID          int auto_increment comment '递增列',
   FName                varchar(50) comment '名称',
   FCode                varchar(500) comment '代码',
   FValue1              varchar(50) comment '对应值',
   FValue2              varchar(50) comment '对应值二',
   FValue3              varchar(50) comment '对应值二',
   FValue4              varchar(50) comment '对应值二',
   FValue5              varchar(50) comment '对应值二',
   FIsDelete            int comment '是否删除（禁用）',
   FCategory            int comment '分类',
   FRemark              varchar(500) comment '备注',
   FOrder               int comment '排序',
   FAddTime             datetime comment '创建时间',
   FUpdateTime          datetime comment '修改时间',
   primary key (FTypeID),
   key AK_Key_2 (FIncreaseID)
);

alter table t_base_typecode comment '基础资料数据类别及参数';
