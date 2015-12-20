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
    $('#dgSerialnumberEmailtemplate').datagrid({
        loadMsg: "数据加载中,请稍候……",
        url: '/web1/emailTemQuerySerialnumberEmailtemplate.action',
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
        idField: 'ftemplateid',
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
                field: 'ftype', title: '分类', width: 60, align: 'center', formatter: function (value) {
                    if (value == '2'){
                    	return '注册通知';
                    } 
                    else if (value == '1'){
                    	return '其他通知';
                    }
                    else{
                    	return '-';
                    }
                }
            }
            ,
 
            {
                field: 'flanguage', title: '语言', width: 60, align: 'center', formatter: function (value) {
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
function UpdateInfo() {
    //首先取出来用户选择的数据的ID
    var rows = $("#dgSerialnumberEmailtemplate").datagrid("getSelections");
    //首先取出来值判断用户只能选择一个
    if (rows.length != 1) {
        $.messager.alert("提示", "每次只能修改一条，你已经选择了<font color='red'  size='6'>" + rows.length + "</font>条。", "error");
        return;
    }

    //处理修改的信息，弹出修改的对话框,然后显示选择的分组的详细信息             
    $('#div_AddSerialnumberEmailtemplate').dialog('open');
    //绑定修改显示详细信息的方法
    BindShowUpdateInfo();
}

//绑定修改显示详细信息的方法
function BindShowUpdateInfo() {
    //首先用户发送一个异步请求去后台实现方法
    var ID = $("#dgSerialnumberEmailtemplate").datagrid("getSelections")[0].ftemplateid;  //获取到了用用户选择的ID  
    $.post("/web1/emailTemFindSerialnumberEmailtemplate.action", { "serialnumberemailtemplate.ftemplateid": ID }, function (cbData) {
    	//debugger;
        $("#ftemplateid").val(cbData.serialnumberemailtemplate.ftemplateid); 
//        $("#fincreaseid").val(cbData.serialnumberemailtemplate.fincreaseid); 
//        $("#fappid").val(cbData.serialnumberemailtemplate.fappid); 
//        $("#fuserid").val(cbData.serialnumberemailtemplate.fuserid); 
//        $("#fsnid").val(cbData.serialnumberemailtemplate.fsnid); 
//        $("#fsnnumber").val(cbData.serialnumberemailtemplate.fsnnumber); 
//        $("#ftag").val(cbData.serialnumberemailtemplate.ftag); 
        $("#ftitle").val(cbData.serialnumberemailtemplate.ftitle); 
        
        $('#ftype').combobox('setValue',cbData.serialnumberemailtemplate.ftype);
        
        $("#fcontent").val(cbData.serialnumberemailtemplate.fcontent); 
        $("#flanguage").val(cbData.serialnumberemailtemplate.flanguage);
        
        var d1 = cbData.serialnumberemailtemplate.flanguage;
        $('#flanguage').combobox('setValue',d1);

        
//        $("#fdatastatus").val(cbData.serialnumberemailtemplate.fdatastatus); 
//        $("#ffieldstatus").val(cbData.serialnumberemailtemplate.ffieldstatus); 
//        $("#faddtime").val(cbData.serialnumberemailtemplate.faddtime); 
//        $("#fupdatetime").val(cbData.serialnumberemailtemplate.fupdatetime); 
        $("#fremark").val(cbData.serialnumberemailtemplate.fremark); 

    });
}


function clearbox() {
    $('#searchForm input').val('');   
    searchFun();
}

function add(id) {
    $("#frmSerialnumberEmailtemplate input,textarea").val('');	
    $('#div_AddSerialnumberEmailtemplate').dialog('open');
}
//实现分组的修改
function AddSerialnumberEmailtemplate() {
	
	 if($("#frmSerialnumberEmailtemplate").form('validate')==false)
	 {
	   return ;
	 }	
	//debugger;
    //if ($("#fname").val().length == 0) {
    //    $.messager.alert("提示", "请输入user.name！", "info");
    //    return;
    //}
    //获取需要传递的参数传递给前台
    var postData = $("#frmSerialnumberEmailtemplate").serializeArray();
    
    //$.messager.alert("提示", postData, "info");
    //发送异步请求到后台保存分组数据
    $.post("/web1/emailTemAddSerialnumberEmailtemplate.action", postData, function (data) {
    	//debugger;   	
        if (data.success == true&& data.errcode==0) {
            //添加成功  1.关闭弹出层，2.刷新DataGird
        	 $.messager.alert('提示', data.message, 'info');

            $("#div_AddSerialnumberEmailtemplate").dialog("close");
            refresh();
            $("#frmSerialnumberEmailtemplate input,textarea").val('');
        }
        else {
           $.messager.alert('提示', data.message, 'error');
        }
    });
}
//实现删除数据
function DeleteSerialnumberEmailtemplate() {
    //得到用户选择的数据的ID
    var rows = $("#dgSerialnumberEmailtemplate").datagrid("getSelections");
    //首先判断用户是否已经选择了需要删除的数据,然后循环将用户选择的数据传递到后台
    if (rows.length >= 1) {
        //遍历出用户选择的数据的信息，这就是用户选择删除的分组ID的信息
        var ids = "";   //1,2,3,4,5
        var names = "";
        for (var i = 0; i < rows.length; i++) {
            //异步将删除的ID发送到后台，后台删除之后，返回前台，前台刷洗表格
            ids += rows[i].ftemplateid + ",";
            //获取用户选择的分组信息
            names += rows[i].ftitle + ",";
        }
        //最后去掉最后的那一个,
        ids = ids.substring(0, ids.length - 1);
        names = names.substring(0, names.length - 1);
        var postData = {
        		"serialnumberemailtemplate.ftemplateid": ids
        };

        //然后确认发送异步请求的信息到后台删除数据
        $.messager.confirm("删除信息", "您确认删除<font color='red' size='3'>" + names + "</font>吗？", function (DeleteUser) {
            if (DeleteUser) {
                $.post("/web1/emailTemDeleteSerialnumberEmailtemplate.action", postData, function (data) {
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
    $("#dgSerialnumberEmailtemplate").datagrid('reload');
    $("#dgSerialnumberEmailtemplate").datagrid('clearSelections');
}

function cancel() {    
    $('#div_AddSerialnumberEmailtemplate').dialog('close');
}
/*
-- struct action
<action name="emailTem" class="SPemailTemAction" method="List">
    <result>/SCM/SerialnumberEmailtemplate.jsp</result>
</action> 
 
<action name="emailTem*" class="SPemailTemAction" method="{1}">
	<result type="json">
		<param name="root">dataMap</param>
	</result>	
</action>	
---
-- spring action
<bean id="SPemailTemAction" class="service.SerialnumberEmailtemplateImpl"  scope="prototype">
	 <property name="serialnumberemailtemplateDao" ref="refemailTemDao"></property>
</bean>
 	
<bean name="refemailTemDao" class="dao.SerialnumberEmailtemplateDaoIml">
</bean>	
---
*/