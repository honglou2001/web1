drop table if exists t_base_typecode;

/*==============================================================*/
/* Table: t_base_typecode                                       */
/*==============================================================*/
create table t_base_typecode
(
   FTypeID              varchar(100) not null comment '�������ID',
   FIncreaseID          int auto_increment comment '������',
   FName                varchar(50) comment '����',
   FCode                varchar(500) comment '����',
   FValue1              varchar(50) comment '��Ӧֵ',
   FValue2              varchar(50) comment '��Ӧֵ��',
   FValue3              varchar(50) comment '��Ӧֵ��',
   FValue4              varchar(50) comment '��Ӧֵ��',
   FValue5              varchar(50) comment '��Ӧֵ��',
   FIsDelete            int comment '�Ƿ�ɾ�������ã�',
   FCategory            int comment '����',
   FRemark              varchar(500) comment '��ע',
   FOrder               int comment '����',
   FAddTime             datetime comment '����ʱ��',
   FUpdateTime          datetime comment '�޸�ʱ��',
   primary key (FTypeID),
   key AK_Key_2 (FIncreaseID)
);

alter table t_base_typecode comment '��������������𼰲���';
