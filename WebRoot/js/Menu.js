var situation;//url传的参数条件
var urldevices;
$(function () {
    $.ajaxSetup({
        async: false,
        cache: false
    });
   
    initTable();  
});


function initTable() {
	
	$('#dgMenu').treegrid({
		title:'TreeGrid with Footer',
		iconCls:'icon-ok',
		 width: "auto",
		height:750,
		rownumbers: true,
		animate:true,
		collapsible:true,
		fitColumns:true,
		url:'http://lenovo-pcyang:8090/web1/MenuList.action',
		idField:'fid',
		treeField:'fmenuName',
		showFooter:false,
		columns:[[
            {title:'菜单名称',field:'fmenuName',width:180},
            {
                field: "ftype", title: "类型", align: "left", width: "50",
                formatter: function (value, row, index) { return value == 1 ? "菜单" : "模块" }
            },
             {
                 field: "fauthorityVal", title: "权重", align: "left", width: 60
             },
            {
                field: "flevel", title: "排序", align: "left", width: 60,
                formatter: function (value, row, index) { return document.body.scrollHeight+"_"+document.documentElement.scrollHeight; }
            },
            {
                field: "fstate", title: "状态", align: "left", width: 60,
                formatter: function (value, row, index) { return value == "False" ? "正常" : "隐藏"; }
            },
            { field: "fdescription", title: "备注", align: "left", width: "180" }
		]],
       toolbar: "#div_Menu"
	});
//    $("#dgMenu").treegrid({
//        loadMsg: "正在加载,请稍候......",
//        url: "/web1/MenuList.action",
//        width: "auto",
//        height: Math.max(document.body.scrollHeight, document.documentElement.scrollHeight),
//        nowrap: true,
//        striped: true,
//        idField: "fid",
//        treeField: "fmenuName",
//        iconCls:"ficon",
//        rownumbers: true,
//        border: true,
//        fitColumns: true,
//        sortOrder: "asc",
//        singleSelect: false,
//        columns: [[
//            { field: "fmenuName", title: "菜单名称", align: "left", width: "160" },
//            { field: "furl", title: "页面路径", align: "left", width: "200" },
//            { field: "ficon", title: "图标", align: "left", width: "120" }
//            ]],
//        toolbar: "#div_Menu"
//    });
}

function initTable_del(queryData) {
    $('#dgFeedReport').datagrid({
        loadMsg: "数据加载中,请稍候……",
        url: '/web1/MenuList.action',
        width: "auto",
        height: Math.max(document.body.scrollHeight, document.documentElement.scrollHeight) - 87,
        iconCls: 'icon-save',
        pageSize: 10,
        nowrap: true,
        fitColumns: true,
        singleSelect:true,
        striped: true,
        collapsible: true,
        pagination: true,
        rownumbers: true, //行号
        idField: 'fid',
        sortName: 'fmenuName',
        sortOrder: 'desc',
        queryParams: queryData,  //异步查询的参数
        onLoadSuccess: function (data) {
           
        },
        columns: [[
            { field: "ck", checkbox: true },
            {
                field: 'fmenuName', title: '菜单名称', width: 60, align: 'center', formatter: function (value) {
                    return value.length == 0 ? "" : value;
                }
            }
            ,
            {
                field: 'furl', title: 'URL', width: 60, align: 'center', formatter: function (value) {
                    return value == 0 ? "" : value;
                }
            },
            {
                field: 'ficon', title: 'ICON', width: 60, align: 'center', formatter: function (value) {
                    return value == 0 ? "" : value;
                }
            }

            ,
            {
                field: 'fauthorityVal', title: 'fauthorityVal', width: 60, align: 'center', formatter: function (value) {
                    return value == 0 ? "" : value;
                }
            }
            ,
            {
                field: 'ftype', title: 'ftype',width: 60, formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fdescription', title: 'fdescription',width: 60, formatter: function (value) {
                    return value;
                }
            }
            
      ]],              
        toolbar: "#div_Menu"
    });
}
//主要目的用于点击链接过来加载
function searchFun1() { 

    //initTable();    
}

function searchFun() {
    var queryData = {
//         FStartTime: $("#txtStartTime").datebox('getValue'),
//         FEndTime: $("#txtEndTime").datebox('getValue'),
    	 "user.id": $("#txtFname").val(),	
         "user.name": $("#txtFname").val(),
         "user.Mobile": $("#txtFMobile").val(),
         "user.Adress": $("#txtFAddress").val()
    };
    initTable(queryData);
}

//修改分组的信息
function UpdateInfo() {
    //首先取出来用户选择的数据的ID
    var rows = $("#dgFeedReport").datagrid("getSelections");
    //首先取出来值判断用户只能选择一个
    if (rows.length != 1) {
        $.messager.alert("提示", "每次只能修改一条，你已经选择了<font color='red'  size='6'>" + rows.length + "</font>条。", "error");
        return;
    }

    //处理修改的信息，弹出修改的对话框,然后显示选择的分组的详细信息             
    $('#div_AddUser').dialog('open');
    //绑定修改显示详细信息的方法
    BindShowUpdateInfo();
}

//绑定修改显示详细信息的方法
function BindShowUpdateInfo() {
    //首先用户发送一个异步请求去后台实现方法
    var ID = $("#dgFeedReport").datagrid("getSelections")[0].id;  //获取到了用用户选择的ID  
    $.post("/web1/Edit.action", { fid: ID }, function (callbackdata) {
    	debugger;
        $("#id").val(ID);
        $("#name").val(callbackdata.user.name);        
        $("#Pwd").val(callbackdata.user.pwd);        
        $("#Email").val(callbackdata.user.email);
        $("#Mobile").val(callbackdata.user.mobile);
        $("#Adress").val(callbackdata.user.adress);
        $("#description").val(callbackdata.user.description);

    });
}


function clearbox() {
    var date = new Date();
    var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
    var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
    $('#txtFname').combotree("setValue", "");
    $('#searchForm input').val('');
    $('#txtStartTime').datebox('setValue', date.getFullYear() + '-' + month + '-' + currentDate);
    $('#txtEndTime').datebox('setValue', date.getFullYear() + '-' + month + '-' + currentDate);    
    searchFun();
}

function add(id) {
    $('#div_AddUser').dialog('open');
}
//实现分组的修改
function AddUser() {
	
	//debugger;
    if ($("#fmenuName").val().length == 0) {
        $.messager.alert("提示", "请输入菜单名称！", "info");
        return;
    }
    //获取需要传递的参数传递给前台
    var postData = $("#frmUser").serializeArray();
    
    //$.messager.alert("提示", postData, "info");
    //发送异步请求到后台保存分组数据
    $.post("/web1/MenuAdd.action", postData, function (data) {
    	debugger;
    	
    	
        if (data.success == true) {
            //添加成功  1.关闭弹出层，2.刷新DataGird
        	 $.messager.alert('提示', data.message, 'info');

            $("#div_AddUser").dialog("close");
            refresh();
            $("#frmUser input,textarea").val('');
        }
        else {
            $.messager.alert('提示', data, 'error');
        }
    });
}
//实现删除数据
function deleteUser() {
    //得到用户选择的数据的ID
    var rows = $("#dgFeedReport").datagrid("getSelections");
    //首先判断用户是否已经选择了需要删除的数据,然后循环将用户选择的数据传递到后台
    if (rows.length >= 1) {
        //遍历出用户选择的数据的信息，这就是用户选择删除的分组ID的信息
        var ids = "";   //1,2,3,4,5
        var UserNames = "";
        for (var i = 0; i < rows.length; i++) {
            //异步将删除的ID发送到后台，后台删除之后，返回前台，前台刷洗表格
            ids += rows[i].id + ",";
            //获取用户选择的分组信息
            UserNames += rows[i].name + ",";
        }
        //最后去掉最后的那一个,
        ids = ids.substring(0, ids.length - 1);
        UserNames = UserNames.substring(0, UserNames.length - 1);
        var postData = {
        		fid: ids
        }

        //然后确认发送异步请求的信息到后台删除数据
        $.messager.confirm("删除信息", "您确认删除<font color='red' size='3'>" + UserNames + "</font>吗？", function (DeleteUser) {
            if (DeleteUser) {
                $.post("/web1/DelJson.action", postData, function (data) {
                	debugger;
                	if (data.success == true) {
                        //添加成功  1.关闭弹出层，2.刷新DataGird
                    	$.messager.alert('提示', data.message, 'info');
                        refresh();
                        rows.length = "";
                    }
                    else {
                        $.messager.alert("提示", data.message, "error");
                    }
                });
            }
        });
    }
    else {
        $.messager.alert("提示", "请选择你要删除的数据！", "info");
    }
}

//折叠展开
$("#wrap").toggle(function () { $("#dgMenu").treegrid("collapseAll"); }, function () { $("#dgMenu").treegrid("expandAll"); });

function refresh() {
    $("#dgFeedReport").datagrid('reload');
    $("#dgFeedReport").datagrid('clearSelections');
}

function cancel() {
    //$("#frmUser input,textarea").val('');
    //$("#div_AddUser").dialog('close');
    
    $('#div_AddUser').dialog('close');
}


