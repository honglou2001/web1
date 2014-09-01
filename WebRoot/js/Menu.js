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
		//title:'TreeGrid with Footer',
		iconCls:'icon-ok',
		 width: "auto",
		 height: 750,
		rownumbers: true,
		animate:true,
		collapsible:true,
		fitColumns:true,
		url:'http://lenovo-pcyang:8090/web1/MenuList.action',
		idField:'fid',
		treeField:'fmenuName',
		showFooter:false,
		columns:[[
		    { field: "ck", checkbox: true },
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
    var row = $("#dgMenu").treegrid("getSelections")
    //首先取出来值判断用户只能选择一个
    if (row.length != 1) {
        $.messager.alert("提示", "每次只能修改一条，你已经选择了<font color='red'  size='6'>" + row.length + "</font>条。", "warning");
        return;
    }
    
    //处理修改的信息，弹出修改的对话框,然后显示选择的分组的详细信息             
    $('#div_AddUser').dialog('open');
    //绑定修改显示详细信息的方法
    var menuid = row ? row[0].fid:"";
    var authorityVal = row ? row[0].fauthorityVal : "";
    var parentRow = $("#dgMenu").treegrid("getParent", row[0].fid);
    $("#_parentId").val(parentRow ? parentRow.fid : "");
    $("#fparentName").val(parentRow ? parentRow.fmenuName : "无上级菜单");
      
    $("#fid").val(menuid);
    $("#fmenuName").val(row ? row[0].fmenuName : "");
    $("#furl").val(row ? row[0].furl : "");
    $("#ficon").val(row ? row[0].ficon : "");
    //$("#fauthorityVal").val(authorityVal);
    $("#flevel").val(row ? row[0].flevel : "");  
    $("#fdescription").val(row ? row[0].fdescription : "");
    
    initComboTree(authorityVal);

}

function initComboTree(authorityVal) {
    $('#fauthorityVal').combotree({
         url: '/web1/CbTreeVal.action?menu.fauthorityVal='+authorityVal,
		 valueField: 'id',
	     textField: 'text',
	     required: true,
	     editable: false,
	     async: false,
	     cache: false,
	     onClick: function (node) { 
	         
	     }, //全部折叠
	     onLoadSuccess: function (node, data) {	    	
//	    	 debugger;
//	    	 data[1].checked = true;
	     }	
    });
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
	var row = id == -1 ? $("#dgMenu").treegrid("getSelected") : $("#dgMenu").treegrid("find", id);
    $('#div_AddUser input[type="text"],#div_AddUser textarea').val('');
    $('#_parentId').val(row ? row.fid : '');
    
    //$.messager.alert("提示", row.fid, "info");
    
    $('#fparentName').val(row ? row.fmenuName : '无上级菜单');
    $('#div_AddUser').dialog('open');
    
    initComboTree("");
}
//实现分组的修改
function AddUser() {
	
	//debugger;
    if ($("#fmenuName").val().length == 0) {
        $.messager.alert("提示", "请输入菜单名称！", "info");
        return;
    }
    //获取需要传递的参数传递给前台
    //var postData = $("#frmUser").serializeArray();
    //debugger;
    var comval = $('#fauthorityVal').combotree('getValues');
    var longval = GetComVal(comval); 
    var postData = {
     	 "menu.fid": $("#fid").val(),	
     	 "menu._parentId": $("#_parentId").val(),	
         "menu.fmenuName": $("#fmenuName").val(),
         "menu.furl": $("#furl").val(),
         "menu.fsysId": 1,//$("#fsysId").val(),
         "menu.ficon": $("#ficon").val(),
         "menu.fauthorityVal":longval,
         "menu.flevel": $("#flevel").val(),
         "menu.fdescription": $("#fdescription").val()
     };
    
    //$.messager.alert("提示", postData, "info");
    //发送异步请求到后台保存分组数据
    $.post("/web1/MenuAdd.action", postData, function (data) {
    	//debugger;  	
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

function GetComVal(strArr) {	
	//var s = str.split(",");
	var sum = 0;
	  $.each(strArr,function(key,val){
		  sum = sum|val;
	  });	
	  
	 return sum; 
}

//实现删除数据
function deleteMenu() {
    //得到用户选择的数据的ID
    var rows = $("#dgMenu").treegrid("getSelections");
    //首先判断用户是否已经选择了需要删除的数据,然后循环将用户选择的数据传递到后台
    if (rows.length >= 1) {
        //遍历出用户选择的数据的信息，这就是用户选择删除的分组ID的信息
        var ids = "";   //1,2,3,4,5
        var UserNames = "";
        for (var i = 0; i < rows.length; i++) {
            //异步将删除的ID发送到后台，后台删除之后，返回前台，前台刷洗表格
            ids += rows[i].fid + ",";
            //获取用户选择的分组信息
            UserNames += rows[i].fmenuName + ",";
        }
        //最后去掉最后的那一个,
        ids = ids.substring(0, ids.length - 1);
        UserNames = UserNames.substring(0, UserNames.length - 1);
        var postData = {
        		"menu.fid": ids
        }

        //然后确认发送异步请求的信息到后台删除数据
        $.messager.confirm("删除信息", "您确认删除<font color='red' size='3'>" + UserNames + "</font>吗？", function (DeleteUser) {
            if (DeleteUser) {
                $.post("/web1/MenuDelete.action", postData, function (data) {
                	//debugger;
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
    $("#dgMenu").treegrid('reload');
    $("#dgMenu").treegrid('clearSelections');
}

function cancel() {
    //$("#frmUser input,textarea").val('');
    //$("#div_AddUser").dialog('close');
    
    $('#div_AddUser').dialog('close');
}


