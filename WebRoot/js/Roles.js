$(function () {
    //当页面首次刷新的时候执行的事件
  
    initTable();
});


//实现对设备DataGird控件的绑定操作
function initTable(queryData) {
    $('#t_Role').datagrid({
        loadMsg: "数据加载中,请稍候……",
        url: '/web1/RoleList.action',
        width: "auto",
        //height: Math.max(document.body.scrollHeight, document.documentElement.scrollHeight) ,
        pageSize: 20,
        nowrap: true,
        autoRowHeight: false,
        striped: true,
        collapsible: true,
        pagination: true,
        rownumbers: true, //行号
        singleSelect: true,
        idField: 'FID',
        sortName: 'FRoleName',
        sortOrder: 'asc',
        queryParams: queryData,  //异步查询的参数
        frozenColumns: [[
              { field: "ck", checkbox: true }
        ]],
        columns: [[
            { field: "froleName", title: "角色名称", width: "160", align: "left", sortable: false },
            //{ field: "FUpdateTime", title: "注册时间", width: "160", align: "left",  formatter: function (value) { return value.replace("T", " ") }},
            { field: "fdescription", title: "备注", width: "220", align: "left", sortable: false }
        ]],
        toolbar: "#div_Menu"


    });
}

function initTree(roleid) {
	var froleid = $("#txbRoleID").val();
	
	//$.messager.alert("提示", froleid, "error");
    $('#ulpermission').tree({
        url: '/web1/TreeMenuResVal.action?menu.fauthorityVal=0&menu.froleid='+froleid,
        checkbox: true,
        cascadeCheck: true,
        onLoadSuccess: function (node, data) {
        	//alert(eval(data));
        	//debugger;
            $('#ulpermission').show();
        }
    });
	
//    $('#treeul').tree({
//        checkbox:true,
//        url:'initTree.aspx',
//        onLoadSuccess:function(){
//            //绑定权限
//             $.ajax({
//                url:'getId.aspx?id='+v,
//                 cache:false,
//                 dataType:'text',
//                 success:function(data){  
//                    var array = data.split(',');
//                    for(var i=0;i<array.length;i++)
//                    {
//                        var node = $('#treeul').tree('find',array[i]);
//                       $('#treeul').tree('check',node.target);
//                    }
//                }
//            })
//        }
//    });  
}

function edit(index) {
    var row = null;
    //点击的是编辑按钮
    if (index == -2) {
        row = $("#t_Role").datagrid("getSelections");
        //首先取出来值判断用户只能选择一个
        if (row.length != 1) {
            $.messager.alert("提示", "每次只能修改一条，你已经选择了<font color='red'  size='6'>" + row.length + "</font>条。", "error");
            return;
        }
    }
    
    $("#div_EditRole").show().dialog("open");
    if (index == -2) {
        $("#txtRoleName").val(row[0].froleName);
        $("#txtDescription").val(row[0].fdescription);
        $("#txbRoleID").val(row[0].fid);
        $("#txbAction").val("edit");

    }
    else {
        $("#txtRoleName").val('');
        $("#txtDescription").val('');
        $("#txbRoleID").val('');
        $("#txbAction").val('add');
       
    }
    initTree($("#txbRoleID").val());
}

function save() {
    if ($("#txtRoleName").val().length == 0) {
        $.messager.alert("提示", "请输入角色名称！", "info");
        return;
    }
   
    var noded = $('#ulpermission').tree('getChildren');
    var nodei = $('#ulpermission').tree('getChecked', 'indeterminate')
    //debugger;
    var s = '';
    for (var i = 0; i < noded.length; i++) {
        if (noded[i].checked) {
        	//var pnode = $('#ulpermission').tree('getParent',noded[i].target); 
        	//debugger;
        	var attr = noded[i].attributes;
        	var attrval = "";
        	
        	if (attr !=null)
        		{
        			attrval = noded[i].attributes.menuid;
        		}
        	
            s += noded[i].id + ';'+attrval+',';
        }
//        else {
//            for (var j = 0; j < nodei.length; j++) {
//                if (noded[i].id == nodei[j].id) {
//                    s += noded[i].id + ',;';
//                }
//            }
//        }
    }
    if (s != '') {
        s = s.substr(0, s.length - 1);
    }
    
//    $.messager.alert("提示123", s, "info");
//    
//    return;
    
    $("#txbPermissions").val(s);
    //debugger;
    var actionType = $('#txbAction').val();
    var url =  "/web1/RoleAdd.action";
   
    //获取需要传递的参数传递给前台
    var postData = $("#ff_add").serializeArray();
   
    $.post(url, postData, function (data) {
        if (data == "OK") {
            //友情提示用户删除成功，刷新表格
            $.messager.alert("提示", "保存成功！", "info");
            $("#div_EditRole").dialog("close");
            refresh();
        }
        else {
            $.messager.alert("提示", data.message, "error");
        }
    });
}

function del() {
    var rows = $("#t_Role").datagrid('getSelections');

    var ids = "";
    var roleNames = "";
    for (var i = 0; i < rows.length; i++) {
        if (rows[i].FFixed == 1) {
            $.messager.alert("提示", "<font color='red'  size='6'>" + rows[i].FRoleName + "</font>为系统数据，不可删除！", "warning");
            return false;
        }
      
        ids += rows[i].FRoleID + ",";
        roleNames += rows[i].FRoleName + ",";
    }
    
    ids = ids.substr(0, ids.length - 1);
    roleNames = roleNames.substr(0, roleNames.length - 1);
    if (ids.length == 0) {
        $.messager.alert("提示", "请选中要删除的权限！", "info");
        return;
    }

    var postData = {
        IDS: ids
    }
    if (rows.length > 0) {
        $.messager.confirm("提示", "确认删除<font color='red' size='3'>" + roleNames + "</font>？", function (r) {
            if (!r) {
                return;
            }

            $.post("/Rights/DeleteBaseRole", postData, function (data) {
                if (data == "OK") {
                    //友情提示用户删除成功，刷新表格
                    $.messager.alert("提示", "删除成功！", "info");
                    refresh();
                    rows.length = "";
                }
                else {
                    $.messager.alert("提示", data, "error");
                }
            });
        });
    }
    else {
        $.messager.alert('提示', '请选择要删除的记录！', 'error');
    }
}

function refresh() {
    $("#t_Role").datagrid('reload');
}
