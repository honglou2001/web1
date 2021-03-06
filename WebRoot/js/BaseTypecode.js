var situation;//url传的参数条件
var urldevices;
$(function() {
	$.ajaxSetup({
		async : false,
		cache : false
	});

	searchFun();
});

function initTable(queryData) {
	$('#dgBaseTypecode').datagrid(
			{
				loadMsg : "数据加载中,请稍候……",
				url : '/web1/BtypeQueryBaseTypecode.action',
				width : "auto",
				height : Math.max(document.body.scrollHeight,
						document.documentElement.scrollHeight),
				iconCls : 'icon-save',
				pageSize : 10,
				nowrap : true,
				fitColumns : true,
				singleSelect : true,
				striped : true,
				collapsible : true,
				pagination : true,
				rownumbers : true, //行号
				idField : 'fdistributorid',
				sortName : 'fupdatetime',
				sortOrder : 'desc',
				queryParams : queryData, //异步查询的参数
				onLoadSuccess : function(data) {

				},
				columns : [ [ {
					field : "ck",
					checkbox : true
				},

				{
					field : 'fname',
					title : '参数名称',
					width : 60,
					align : 'center',
					formatter : function(value) {
						return value;
					}
				}, {
					field : 'fcode',
					title : '参数编码',
					width : 60,
					align : 'center',
					formatter : function(value) {
						return value;
					}
				}, {
					field : 'fvalue1',
					title : '参数值',
					width : 60,
					align : 'center',
					formatter : function(value) {
						return value;
					}
				}, {
					field : 'fisdelete',
					title : '状态',
					width : 60,
					align : 'center',
					formatter : function(value) {
						if (value != null) {
							var val = "-";
							if ((value & 2) == 2)
								val = "已审核";
							else if ((value & 4) == 4)
								val = "已暂停";
							else
								val = "-";

							return val;
						}
					}
				}, {
					field : 'fislock',
					title : '是否锁定',
					width : 60,
					align : 'center',
					formatter : function(value) {
						if (value != null) {
							var val = "-";
							if ((value & 1) == 1)
								val = "不可删除";
							else
								val = "-";

							return val;
						}
					}
				}, {
					field : 'fcategory',
					title : '分类',
					width : 60,
					align : 'center',
					formatter : function(value) {
						if (value != null) {
							if (value == 1)
								return "分销商";
							else if (value == 2)
								return "留言分类";
							else
								return "-";
						}
					}
				}, {
					field : 'fremark',
					title : '备注',
					width : 60,
					align : 'center',
					formatter : function(value) {
						return value;
					}
				}, {
					field : 'fupdatetime',
					title : '修改时间',
					width : 60,
					align : 'center',
					formatter : function(value) {
						if (value != null) {
							return value.replace("T", " ");
						} else {
							return value;
						}
					}
				} ] ],
				toolbar : "#div_Menu"
			});
}

function searchFun() {
	var queryData = {
		"basetypecode.fcategory11" : 1
	};
	initTable(queryData);
}

//修改分组的信息
function UpdateInfo() {
	//首先取出来用户选择的数据的ID
	var rows = $("#dgBaseTypecode").datagrid("getSelections");
	//首先取出来值判断用户只能选择一个
	if (rows.length != 1) {
		$.messager.alert("提示", "每次只能修改一条，你已经选择了<font color='red'  size='6'>"
				+ rows.length + "</font>条。", "error");
		return;
	}

	//处理修改的信息，弹出修改的对话框,然后显示选择的分组的详细信息             
	$('#div_AddBaseTypecode').dialog('open');
	//绑定修改显示详细信息的方法
	BindShowUpdateInfo();
}

//绑定修改显示详细信息的方法
function BindShowUpdateInfo() {
	//首先用户发送一个异步请求去后台实现方法
	var ID = $("#dgBaseTypecode").datagrid("getSelections")[0].ftypeid; //获取到了用用户选择的ID  
	$.post("/web1/BtypeFindBaseTypecode.action", {
		"basetypecode.ftypeid" : ID
	}, function(cbData) {
		//debugger;
		$("#ftypeid").val(cbData.basetypecode.ftypeid);
		//        $("#fincreaseid").val(cbData.basetypecode.fincreaseid); 
		$("#fname").val(cbData.basetypecode.fname);
		$("#fcode").val(cbData.basetypecode.fcode);
		$("#fvalue1").val(cbData.basetypecode.fvalue1);
		//        $("#fvalue2").val(cbData.basetypecode.fvalue2); 
		//        $("#fvalue3").val(cbData.basetypecode.fvalue3); 
		//        $("#fvalue4").val(cbData.basetypecode.fvalue4); 
		//        $("#fvalue5").val(cbData.basetypecode.fvalue5); 
		//  ^ 1 为把锁定的去除
		$('#fisdelete').combobox('setValue', cbData.basetypecode.fisdelete);
		$('#fcategory').combobox('setValue', cbData.basetypecode.fcategory);

		if ((cbData.basetypecode.fislock & 2) == 2) {
			$("#fcode").attr("readonly", true);
			$("#fcategory").attr("readonly", true);			
		}

		//        $("#fcategory").val(cbData.basetypecode.fcategory); 
		$("#fremark").val(cbData.basetypecode.fremark);
		//        $("#forder").val(cbData.basetypecode.forder); 
		//        $("#faddtime").val(cbData.basetypecode.faddtime); 
		//        $("#fupdatetime").val(cbData.basetypecode.fupdatetime); 

	});
}

function clearbox() {
	$('#searchForm input').val('');
	searchFun();
}

function add(id) {
	$("#frmBaseTypecode input,textarea").val('');
	$("#fcode").attr("readonly", false);
	$("#fcategory").attr("readonly", false);	
	
	$('#div_AddBaseTypecode').dialog('open');
}
//实现分组的修改
function AddBaseTypecode() {

	if ($("#frmBaseTypecode").form('validate') == false) {
		return;
	}

	//debugger;
	//if ($("#fname").val().length == 0) {
	//    $.messager.alert("提示", "请输入user.name！", "info");
	//    return;
	//}
	//获取需要传递的参数传递给前台
	var postData = $("#frmBaseTypecode").serializeArray();

	//$.messager.alert("提示", postData, "info");
	//发送异步请求到后台保存分组数据
	$.post("/web1/BtypeAddBaseTypecode.action", postData, function(data) {
		//debugger;   	
		if (data.success == true && data.errcode == 0) {
			//添加成功  1.关闭弹出层，2.刷新DataGird
			$.messager.alert('提示', data.message, 'info');

			$("#div_AddBaseTypecode").dialog("close");
			refresh();
			$("#frmBaseTypecode input,textarea").val('');
		} else {
			$.messager.alert('提示', data.message, 'error');
		}
	});
}
//实现删除数据
function DeleteBaseTypecode() {
	//得到用户选择的数据的ID
	var rows = $("#dgBaseTypecode").datagrid("getSelections");
	var state = 0;
	//首先判断用户是否已经选择了需要删除的数据,然后循环将用户选择的数据传递到后台
	if (rows.length >= 1) {
		//遍历出用户选择的数据的信息，这就是用户选择删除的分组ID的信息
		var ids = ""; //1,2,3,4,5
		var names = "";
		for ( var i = 0; i < rows.length; i++) {
			//异步将删除的ID发送到后台，后台删除之后，返回前台，前台刷洗表格
			ids += rows[i].ftypeid + ",";
			//获取用户选择的分组信息
			names += rows[i].fname + ",";
			state = state | rows[i].fislock;

		}
		if ((state & 1) == 1) {
			$.messager.alert("提示", "有不可删除的参数", "error");
			return;
		}
		//最后去掉最后的那一个,
		ids = ids.substring(0, ids.length - 1);
		names = names.substring(0, names.length - 1);
		var postData = {
			"basetypecode.ftypeid" : ids
		};

		//然后确认发送异步请求的信息到后台删除数据
		$.messager.confirm("删除信息", "您确认删除<font color='red' size='3'>" + names
				+ "</font>吗？", function(DeleteUser) {
			if (DeleteUser) {
				$.post("/web1/BtypeDeleteBaseTypecode.action", postData,
						function(data) {
							debugger;
							if (data.success == true && data.errcode == 0) {
								//添加成功  1.关闭弹出层，2.刷新DataGird
								$.messager.alert('提示', data.message, 'info');
								refresh();
								rows.length = "";
							} else {
								$.messager.alert("提示", data.message, "error");
							}
						});
			}
		});
	} else {
		$.messager.alert("提示", "请选择你要删除的数据！", "info");
	}
}

function refresh() {
	$("#dgBaseTypecode").datagrid('reload');
	$("#dgBaseTypecode").datagrid('clearSelections');
}

function cancel() {
	$('#div_AddBaseTypecode').dialog('close');
}
/*
 -- struct action
 <action name="Btype" class="SPBtypeAction" method="List">
 <result>/SCM/BaseTypecode.jsp</result>
 </action> 

 <action name="Btype*" class="SPBtypeAction" method="{1}">
 <result type="json">
 <param name="root">dataMap</param>
 </result>	
 </action>	
 ---
 -- spring action
 <bean id="SPBtypeAction" class="service.BaseTypecodeImpl"  scope="prototype">
 <property name="basetypecodeDao" ref="refBtypeDao"></property>
 </bean>

 <bean name="refBtypeeDao" class="dao.BaseTypecodeDaoIml">
 </bean>	
 ---
 */