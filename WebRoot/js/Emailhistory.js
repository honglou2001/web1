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
    $('#dgSerialnumberEmailhistory').datagrid({
        loadMsg: "数据加载中,请稍候……",
        url: '/web1/emailHisQuerySerialnumberEmailhistory.action',
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
        idField: 'femailrecid',
        sortName: 'fincreaseid',
        sortOrder: 'desc',
        queryParams: queryData,  //异步查询的参数
        onLoadSuccess: function (data) {
           
        },
        columns: [[
            { field: "ck", checkbox: true },
 
           
            {
                field: 'ftitle', title: '标题', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'ftoaddress', title: '目标邮箱', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'ffromaddress', title: '发送邮箱', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            
            ,
            {
                field: 'ftemplateid', title: '模板ID', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'flanguage', title: '语言类别', width: 60, align: 'center', formatter: function (value) {
                    if (value == '1'){
                    	return '英文';
                    }
                    else{
                    	return '中文';
                    }
                }
            }
            ,
            {
                field: 'fuserid', title: '用户id', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
//            {
//                field: 'ftype', title: '分类', width: 60, align: 'center', formatter: function (value) {
//                    return value;
//                }
//            }
//            ,
          
            {
                field: 'fupdatetime', title: '更新时间', width: 60, align: 'center', formatter: function (value) {
                    if (value!=null){
                    	return value.replace("T"," ");
                    }
                    else{
                    	return value;
                    }
                }
            }

      ]],              
        toolbar: "#div_Menu"
    });
}

function searchFun() {
    var queryData = {
//    	 "user.id": $("#txtFname").val(),	
//       "user.name": $("#txtFname").val(),
//       "user.Mobile": $("#txtFMobile").val(),
//       "user.Adress": $("#txtFAddress").val()
    };
    initTable(queryData);
}

//修改分组的信息
function QueryInfo() {
    //首先取出来用户选择的数据的ID
    var rows = $("#dgSerialnumberEmailhistory").datagrid("getSelections");
    //首先取出来值判断用户只能选择一个
    if (rows.length != 1) {
        $.messager.alert("提示", "每次只能修改一条，你已经选择了<font color='red'  size='6'>" + rows.length + "</font>条。", "error");
        return;
    }

    //处理修改的信息，弹出修改的对话框,然后显示选择的分组的详细信息             
    $('#div_AddSerialnumberEmailhistory').dialog('open');
    //绑定修改显示详细信息的方法
    BindShowUpdateInfo();
}

//绑定修改显示详细信息的方法
function BindShowUpdateInfo() {
    //首先用户发送一个异步请求去后台实现方法
    var ID = $("#dgSerialnumberEmailhistory").datagrid("getSelections")[0].femailrecid;  //获取到了用用户选择的ID  
    $.post("/web1/emailHisFindSerialnumberEmailhistory.action", { "serialnumberemailhistory.femailrecid": ID }, function (cbData) {
    	//debugger;
//        $("#femailrecid").val(cbData.serialnumberemailhistory.femailrecid); 
//        $("#ftemplateid").val(cbData.serialnumberemailhistory.ftemplateid); 
//        $("#fincreaseid").val(cbData.serialnumberemailhistory.fincreaseid); 
//        $("#fappid").val(cbData.serialnumberemailhistory.fappid); 
//        $("#fuserid").val(cbData.serialnumberemailhistory.fuserid); 
//        $("#fsnid").val(cbData.serialnumberemailhistory.fsnid); 
//        $("#fsnnumber").val(cbData.serialnumberemailhistory.fsnnumber); 
//        $("#flanguage").val(cbData.serialnumberemailhistory.flanguage); 
//        $("#ftag").val(cbData.serialnumberemailhistory.ftag); 
//        $("#ftitle").val(cbData.serialnumberemailhistory.ftitle); 
//        $("#ftoaddress").val(cbData.serialnumberemailhistory.ftoaddress); 
//        $("#ffromaddress").val(cbData.serialnumberemailhistory.ffromaddress); 
//        $("#ftype").val(cbData.serialnumberemailhistory.ftype); 
        //$("#fcontent").val(cbData.serialnumberemailhistory.fcontent);     	  	
    	  $("#contentdiv").html(cbData.serialnumberemailhistory.fcontent);
//        $("#faattachment").val(cbData.serialnumberemailhistory.faattachment); 
//        $("#fdatastatus").val(cbData.serialnumberemailhistory.fdatastatus); 
//        $("#ffieldstatus").val(cbData.serialnumberemailhistory.ffieldstatus); 
//        $("#faddtime").val(cbData.serialnumberemailhistory.faddtime); 
//        $("#fupdatetime").val(cbData.serialnumberemailhistory.fupdatetime); 
//        $("#fremark").val(cbData.serialnumberemailhistory.fremark); 

    });
}


function clearbox() {
    $('#searchForm input').val('');   
    searchFun();
}

function add(id) {
    $("#frmSerialnumberEmailhistory input,textarea").val('');	
    $('#div_AddSerialnumberEmailhistory').dialog('open');
}
//实现分组的修改
function AddSerialnumberEmailhistory() {
	
	 if($("#frmSerialnumberEmailhistory").form('validate')==false)
	 {
	   return ;
	 }	
	//debugger;
    //if ($("#fname").val().length == 0) {
    //    $.messager.alert("提示", "请输入user.name！", "info");
    //    return;
    //}
    //获取需要传递的参数传递给前台
    var postData = $("#frmSerialnumberEmailhistory").serializeArray();
    
    //$.messager.alert("提示", postData, "info");
    //发送异步请求到后台保存分组数据
    $.post("/web1/emailHisAddSerialnumberEmailhistory.action", postData, function (data) {
    	//debugger;   	
        if (data.success == true&& data.errcode==0) {
            //添加成功  1.关闭弹出层，2.刷新DataGird
        	 $.messager.alert('提示', data.message, 'info');

            $("#div_AddSerialnumberEmailhistory").dialog("close");
            refresh();
            $("#frmSerialnumberEmailhistory input,textarea").val('');
        }
        else {
           $.messager.alert('提示', data.message, 'error');
        }
    });
}
//实现删除数据
function DeleteSerialnumberEmailhistory() {
    //得到用户选择的数据的ID
    var rows = $("#dgSerialnumberEmailhistory").datagrid("getSelections");
    //首先判断用户是否已经选择了需要删除的数据,然后循环将用户选择的数据传递到后台
    if (rows.length >= 1) {
        //遍历出用户选择的数据的信息，这就是用户选择删除的分组ID的信息
        var ids = "";   //1,2,3,4,5
        var names = "";
        for (var i = 0; i < rows.length; i++) {
            //异步将删除的ID发送到后台，后台删除之后，返回前台，前台刷洗表格
            ids += rows[i].femailrecid + ",";
            //获取用户选择的分组信息
            names += rows[i].ftitle + ",";
        }
        //最后去掉最后的那一个,
        ids = ids.substring(0, ids.length - 1);
        names = names.substring(0, names.length - 1);
        var postData = {
        		"serialnumberemailhistory.femailrecid": ids
        };

        //然后确认发送异步请求的信息到后台删除数据
        $.messager.confirm("删除信息", "您确认删除<font color='red' size='3'>" + names + "</font>吗？", function (DeleteUser) {
            if (DeleteUser) {
                $.post("/web1/emailHisDeleteSerialnumberEmailhistory.action", postData, function (data) {
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
    $("#dgSerialnumberEmailhistory").datagrid('reload');
    $("#dgSerialnumberEmailhistory").datagrid('clearSelections');
}

function cancel() {    
    $('#div_AddSerialnumberEmailhistory').dialog('close');
}
/*
-- struct action
<action name="emailHis" class="SPemailHisAction" method="List">
    <result>/SCM/SerialnumberEmailhistory.jsp</result>
</action> 
 
<action name="emailHis*" class="SPemailHisAction" method="{1}">
	<result type="json">
		<param name="root">dataMap</param>
	</result>	
</action>	
---
-- spring action
<bean id="SPemailHisAction" class="service.SerialnumberEmailhistoryImpl"  scope="prototype">
	 <property name="serialnumberemailhistoryDao" ref="refemailHisDao"></property>
</bean>
 	
<bean name="refemailHisDao" class="dao.SerialnumberEmailhistoryDaoIml">
</bean>	
---
*/