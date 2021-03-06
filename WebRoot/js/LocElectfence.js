var situation;//url传的参数条件
var urldevices;
$(function () {
    $.ajaxSetup({
        async: false,
        cache: false
    });
   
    searchFun();  
});


function initTable(queryData) {
    $('#dgLocElectfence').datagrid({
        loadMsg: "数据加载中,请稍候……",
        url: '/web1/LocEltQueryLocElectfence.action',
        width: "auto",
        height: Math.max(document.body.scrollHeight, document.documentElement.scrollHeight) - 87,
        iconCls: 'icon-save',
        pageSize: 12,
        pageList: [12,24,36,48],
        nowrap: true,
        fitColumns: true,
        singleSelect:true,
        striped: true,
        collapsible: true,
        pagination: true,
        rownumbers: true, //行号
        idField: 'flocfenid',
        sortName: 'fincreaseid',
        sortOrder: 'desc',
        queryParams: queryData,  //异步查询的参数
        onLoadSuccess: function (data) {
           
        },
        columns: [[
            { field: "ck", checkbox: true },
            {
                field: 'fincreaseid', title: 'ID', width: 50, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
//            {
//                field: 'feltfenceid', title: 'FEltFenceID', width: 60, align: 'center', formatter: function (value) {
//                    return value;
//                }
//            }
//            ,
            {
                field: 'fserialnumber', title: '序列号', width: 78, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fdatastatus', title: '状态值', width: 30, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
//            {
//                field: 'ffieldstatus', title: 'FFieldStatus', width: 60, align: 'center', formatter: function (value) {
//                    return value;
//                }
//            }
//            ,
            {
                field: 'fareanumber', title: '围栏编号', width: 45, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fareaname', title: '围栏名称', width: 55, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,            
            {
                field: 'feltlongitude', title: '围栏经度', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'feltlatitude', title: '围栏维度', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'feltscope', title: '围栏半径', width: 50, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
//            {
//                field: 'feltaddress', title: 'FEltAddress', width: 60, align: 'center', formatter: function (value) {
//                    return value;
//                }
//            }
//            ,
            {
                field: 'flongitude', title: '定位经度', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'flatitude', title: '定位维度', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'faddress', title: '定位地址', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fdistance', title: '距中心距离', width: 60, align: 'left', formatter: function (value) {
                   // return value;
                    
                    if (value!=null){
                    	return  (parseFloat(value)* 1.00).toFixed(5);
                    }
                    else
                    	{
                    	return "";
                    	}
                }
            }
            ,
//            {
//                field: 'faddtime', title: 'FAddTime', width: 60, align: 'center', formatter: function (value) {
//                    return value;
//                }
//            }
//            ,
            {
                field: 'fupdatetime', title: '更新时间', width: 78, align: 'center', formatter: function (value) {
                    if (value!=null){
                    	return value.replace("T"," ");
                    }
                    else{
                    	return value;
                    }
                }
            }
            ,
            {
                field: 'fremark', title: '备注', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
      ]],              
        toolbar: "#div_Menu"
    });
}

function searchFun() {
    var queryData = {
    	 "locelectfence.fserialnumber": $("#txtSnNumber").val(),	
         "locelectfence.fareaname": $("#txtFenceName").val(),
         "locelectfence.fdatastatus": $('#selStatus').combobox('getValue'),
         "startTime": $("#txtStartTime").datebox('getValue'),
         "endTime": $("#txtEndTime").datebox('getValue') 
    };
    initTable(queryData);
}

//修改分组的信息
function UpdateInfo() {
    //首先取出来用户选择的数据的ID
    var rows = $("#dgLocElectfence").datagrid("getSelections");
    //首先取出来值判断用户只能选择一个
    if (rows.length != 1) {
        $.messager.alert("提示", "每次只能修改一条，你已经选择了<font color='red'  size='6'>" + rows.length + "</font>条。", "error");
        return;
    }

    //处理修改的信息，弹出修改的对话框,然后显示选择的分组的详细信息             
    $('#div_AddLocElectfence').dialog('open');
    //绑定修改显示详细信息的方法
    BindShowUpdateInfo();
}

//绑定修改显示详细信息的方法
function BindShowUpdateInfo() {
    //首先用户发送一个异步请求去后台实现方法
    var ID = $("#dgLocElectfence").datagrid("getSelections")[0].flocfenid;  //获取到了用用户选择的ID  
    $.post("/web1/LocEltFindLocElectfence.action", { "locelectfence.flocfenid": ID }, function (cbData) {
    	//debugger;
        $("#flocfenid").val(cbData.locelectfence.flocfenid); 
        $("#fincreaseid").val(cbData.locelectfence.fincreaseid); 
        $("#feltfenceid").val(cbData.locelectfence.feltfenceid); 
        $("#fserialnumber").val(cbData.locelectfence.fserialnumber); 
        $("#fdatastatus").val(cbData.locelectfence.fdatastatus); 
        $("#ffieldstatus").val(cbData.locelectfence.ffieldstatus); 
        $("#feltlongitude").val(cbData.locelectfence.feltlongitude); 
        $("#feltlatitude").val(cbData.locelectfence.feltlatitude); 
        $("#feltscope").val(cbData.locelectfence.feltscope); 
        $("#feltaddress").val(cbData.locelectfence.feltaddress); 
        $("#flongitude").val(cbData.locelectfence.flongitude); 
        $("#flatitude").val(cbData.locelectfence.flatitude); 
        $("#faddress").val(cbData.locelectfence.faddress); 
        $("#fdistance").val(cbData.locelectfence.fdistance); 
        $("#faddtime").val(cbData.locelectfence.faddtime); 
        $("#fupdatetime").val(cbData.locelectfence.fupdatetime); 
        $("#fremark").val(cbData.locelectfence.fremark); 

    });
}


function clearbox() {
    $('#searchForm input').val('');   
    searchFun();
}

function add(id) {
    $("#frmLocElectfence input,textarea").val('');	
    $('#div_AddLocElectfence').dialog('open');
}
//实现分组的修改
function AddLocElectfence() {
	
	 if($("#frmLocElectfence").form('validate')==false)
	 {
	   return ;
	 }	
	//debugger;
    //if ($("#fname").val().length == 0) {
    //    $.messager.alert("提示", "请输入user.name！", "info");
    //    return;
    //}
    //获取需要传递的参数传递给前台
    var postData = $("#frmLocElectfence").serializeArray();
    
    //$.messager.alert("提示", postData, "info");
    //发送异步请求到后台保存分组数据
    $.post("/web1/LocEltAddLocElectfence.action", postData, function (data) {
    	//debugger;   	
        if (data.success == true&& data.errcode==0) {
            //添加成功  1.关闭弹出层，2.刷新DataGird
        	 $.messager.alert('提示', data.message, 'info');

            $("#div_AddLocElectfence").dialog("close");
            refresh();
            $("#frmLocElectfence input,textarea").val('');
        }
        else {
           $.messager.alert('提示', data.message, 'error');
        }
    });
}
//实现删除数据
function DeleteLocElectfence() {
    //得到用户选择的数据的ID
    var rows = $("#dgLocElectfence").datagrid("getSelections");
    //首先判断用户是否已经选择了需要删除的数据,然后循环将用户选择的数据传递到后台
    if (rows.length >= 1) {
        //遍历出用户选择的数据的信息，这就是用户选择删除的分组ID的信息
        var ids = "";   //1,2,3,4,5
        var names = "";
        for (var i = 0; i < rows.length; i++) {
            //异步将删除的ID发送到后台，后台删除之后，返回前台，前台刷洗表格
            ids += rows[i].flocfenid + ",";
            //获取用户选择的分组信息
            names += rows[i].fname + ",";
        }
        //最后去掉最后的那一个,
        ids = ids.substring(0, ids.length - 1);
        names = names.substring(0, names.length - 1);
        var postData = {
        		"locelectfence.flocfenid": ids
        };

        //然后确认发送异步请求的信息到后台删除数据
        $.messager.confirm("删除信息", "您确认删除<font color='red' size='3'>" + names + "</font>吗？", function (DeleteUser) {
            if (DeleteUser) {
                $.post("/web1/LocEltDeleteLocElectfence.action", postData, function (data) {
                	debugger;
                	if (data.success == true && data.errcode ==0) {
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


function refresh() {
    $("#dgLocElectfence").datagrid('reload');
    $("#dgLocElectfence").datagrid('clearSelections');
}

function cancel() {    
    $('#div_AddLocElectfence').dialog('close');
}
/*
-- struct action
<action name="LocElt" class="SPLocEltAction" method="List">
    <result>/SCM/LocElectfence.jsp</result>
</action> 
 
<action name="LocElt*" class="SPLocEltAction" method="{1}">
	<result type="json">
		<param name="root">dataMap</param>
	</result>	
</action>	
---
-- spring action
<bean id="SPLocEltAction" class="service.LocElectfenceImpl"  scope="prototype">
	 <property name="locelectfenceDao" ref="refLocEltDao"></property>
</bean>
 	
<bean name="refLocEltDao" class="dao.LocElectfenceDaoIml">
</bean>	
---
*/