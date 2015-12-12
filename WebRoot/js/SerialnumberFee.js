var situation;//url传的参数条件
var urldevices;
$(function () {
    $.ajaxSetup({
        async: false,
        cache: false
    });
   
    //alert(GetQueryString( "serialnumid" )); 
    var serialnumid = GetQueryString("serialnumid");
    var snnumber = GetQueryString("snnumber");
    
    QueryChargRecord(serialnumid,snnumber);
});



//修改分组的信息
function UpdateInfo() {
	
	  $.messager.alert("提示", "待增加此功能", "error");
      return;
      
    //首先取出来用户选择的数据的ID
    var rows = $("#dgSerialnumber").datagrid("getSelections");
    //首先取出来值判断用户只能选择一个
    if (rows.length != 1) {
        $.messager.alert("提示", "每次只能修改一条，你已经选择了<font color='red'  size='6'>" + rows.length + "</font>条。", "error");
        return;
    }

    //处理修改的信息，弹出修改的对话框,然后显示选择的分组的详细信息             
    $('#div_AddSerialnumber').dialog('open');
    //绑定修改显示详细信息的方法
    BindShowUpdateInfo();
}

//绑定修改显示详细信息的方法
function BindShowUpdateInfo() {
    //首先用户发送一个异步请求去后台实现方法
    var ID = $("#dgSerialnumber").datagrid("getSelections")[0].funiqueid;  //获取到了用用户选择的ID  
    $.post("/web1/snnumberFindSerialnumber.action", { "serialnumber.funiqueid": ID }, function (cbData) {
    	//debugger;
        $("#funiqueid").val(cbData.serialnumber.funiqueid);        
        $("#serialnumber").val(cbData.serialnumber.serialnumber);              
        $("#fphonenum").val(cbData.serialnumber.fphonenum); 

        var d1 = cbData.serialnumber.fdatastatus;
        var d2 = d1 & 2;
        if(d2 == 2){        	
        	$('#fdatastatus').combobox('setValue',"2");
        }
        else{
        	$('#fdatastatus').combobox('setValue',"4");
        }
    });
}


//修改分组的信息
function UpdateInfo1() {
    //首先取出来用户选择的数据的ID
    var rows = $("#dgSerialnumber").datagrid("getSelections");
    //首先取出来值判断用户只能选择一个
    if (rows.length != 1) {
        $.messager.alert("提示", "每次只能修改一条，你已经选择了<font color='red'  size='6'>" + rows.length + "</font>条。", "error");
        return;
    }

    var phonenum = $("#dgSerialnumber").datagrid("getSelections")[0].fphonenum;  //获取到了用用户选择的ID  
    
    if (phonenum==null || phonenum=='') {
        $.messager.alert("提示", "请先设定手表的手机号码", "error");
        return;
    }
    
    var clientnumber = $("#dgSerialnumber").datagrid("getSelections")[0].fclientnumber;  //获取到了用用户选择的ID  
    
    if (clientnumber!=null && clientnumber!='') {
        $.messager.alert("提示", "此号码已经申请有对应的客户端号码", "error");
        return;
    }
    
    //处理修改的信息，弹出修改的对话框,然后显示选择的分组的详细信息             
    $('#div_getCliNumber').dialog('open');
    //绑定修改显示详细信息的方法
    BindShowUpdateInfo1();
}

//绑定修改显示详细信息的方法
function BindShowUpdateInfo1() {
    //首先用户发送一个异步请求去后台实现方法
    var ID = $("#dgSerialnumber").datagrid("getSelections")[0].funiqueid;  //获取到了用用户选择的ID  
    $.post("/web1/snnumberFindSerialnumber.action", { "serialnumber.funiqueid": ID }, function (cbData) {
    	//debugger;
        $("#funiqueid1").val(cbData.serialnumber.funiqueid);        
        $("#serialnumber1").val(cbData.serialnumber.serialnumber);              
        $("#fphonenum1").val(cbData.serialnumber.fphonenum); 
        
      
        
    });
}

function QueryChargRecord(serialnumid,snnumber) {	
	

//    var rows = $("#dgSerialnumber").datagrid("getSelections");
//    //首先取出来值判断用户只能选择一个
//    if (rows.length != 1) {
//        $.messager.alert("提示", "每次只能查询一个手表的费用记录，你已经选择了<font color='red'  size='6'>" + rows.length + "</font>条。", "error");
//        return;
//    }
//    
//	$('#div_chargerecord').panel({title: "查看手表充值及消费记录"});	
//	$("#div_chargerecord").show().dialog("open");
//	
//	var ID = $("#dgSerialnumber").datagrid("getSelections")[0].funiqueid;  //获取到了用用户选择的ID		
	var queryData = {
	  	"serialnumber.funiqueid": serialnumid
	  };
	
	var divtitle = "手表—"+snnumber+"费用记录";
	
	$("#div_query").panel({title:divtitle});
	$("#div_chargerecord").panel({title:"数据列表"});
	   
	ListRecordDetail(queryData);
}


function ListRecordDetail(queryData) {
    $('#dgchargerecord').datagrid({
        loadMsg: "数据加载中,请稍候……",
        url: '/web1/snnumberQuerySerialnumberFee.action',
        width: "auto",
        height: Math.max(document.body.scrollHeight, document.documentElement.scrollHeight),
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
        idField: 'ffeeid',
        sortName: 'fincreaseid',
        sortOrder: 'desc',
        queryParams: queryData,  //异步查询的参数
        onLoadSuccess: function (data) {
           
        },
        columns: [[
            { field: "ck", checkbox: true },
            {
                field: 'ftitle', title: '标题', width: 60, align: 'left', formatter: function (value) {
                    return value;
                }
            }
  
            ,
            {
                field: 'fdeposit', title: '充值费用', width: 60, align: 'left', formatter: function (value) {
                    return value;
                }
            }
  
            ,
            {
                field: 'fspending', title: '支出费用', width: 60, align: 'left', formatter: function (value) {
                    return value;
                }
            }
  
            ,
            {
                field: 'fbalance', title: '账户余额', width: 60, align: 'left', formatter: function (value) {
                    return value;
                }
            }
  
            ,
            {
                field: 'faddtime', title: '更新时间 ', width: 60, align: 'center', formatter: function (value) {
                    if (value!=null){
                    	return value.replace("T"," ");
                    }
                    else{
                    	return value;
                    }
                }
            }
            
      ]]
        ,              
        toolbar: "#div_Menu"
    });
}



function clearbox() {
    $('#searchForm input').val('');   
    //searchFun();
}

function add(id) {
    $("#frmSerialnumber input,textarea").val('');	
    $('#div_AddSerialnumber').dialog('open');
}

//实现分组的修改
function AddSerialnumber() {
	
	 if($("#frmSerialnumber").form('validate')==false)
	 {
	   return ;
	 }	
    //获取需要传递的参数传递给前台
    var postData = $("#frmSerialnumber").serializeArray();
    //发送异步请求到后台保存分组数据
    $.post("/web1/snnumberAddSerialnumber.action", postData, function (data) {
    	//debugger;   	
        if (data.success == true&& data.errcode==0) {
            //添加成功  1.关闭弹出层，2.刷新DataGird
        	 $.messager.alert('提示', data.message, 'info');

            $("#div_AddSerialnumber").dialog("close");
            refresh();
            $("#frmSerialnumber input,textarea").val('');
        }
        else {
           $.messager.alert('提示', data.message, 'error');
        }
    });
}

//实现分组的修改
function UpdateSnPhoneNumber() {
	
	 if($("#frmSerialnumber").form('validate')==false)
	 {
	   return ;
	 }	
    //获取需要传递的参数传递给前台
    var postData = $("#frmSerialnumber").serializeArray();
    //发送异步请求到后台保存分组数据
    $.post("/web1/snnumberUpdateSnPhoneNumber.action", postData, function (data) {
    	//debugger;   	
        if (data.success == true&& data.errcode==0) {
            //添加成功  1.关闭弹出层，2.刷新DataGird
        	 $.messager.alert('提示', data.message, 'info');

            $("#div_AddSerialnumber").dialog("close");
            refresh();
            $("#frmSerialnumber input,textarea").val('');
        }
        else {
           $.messager.alert('提示', data.message, 'error');
        }
    });
}

//实现分组的修改
function AddPushMsg() {
	
	 if($("#frmpushmsg").form('validate')==false)
	 {
	   return ;
	 }	
    //获取需要传递的参数传递给前台
    var postData = $("#frmpushmsg").serializeArray();
    //发送异步请求到后台保存分组数据
    $.post("/web1/snnumberPushMsgToAPP.action", postData, function (data) {
    	//debugger;   	
        if (data.success == true&& data.errcode==0) {
            //添加成功  1.关闭弹出层，2.刷新DataGird
        	 $.messager.alert('提示', data.message, 'info');

            $("#div_pushmsg").dialog("close");
            refresh();
            $("#frmpushmsg input,textarea").val('');
        }
        else {
           $.messager.alert('提示', data.message, 'error');
        }
    });
}

//查找云之迅客户端号码
function GetClientNumber() {
	
	var phonenum = $("#fphonenum1").val();
	 
    if (phonenum == null || phonenum =='') {
        $.messager.alert("提示", "请先设置电话号码后再进行此操作", "error");
        return;
    }
	    
    var ID = $("#dgSerialnumber").datagrid("getSelections")[0].funiqueid;  //获取到了用用户选择的ID  
    
    var postData = {
    		"serialnumber.funiqueid": ID,
    		"chargefee":  $("#chargefee").val()
    };
    $.post("/web1/snnumberGetClientNumber.action", postData, function (data) {
    	//debugger;
       	if (data.success == true && data.errcode ==0) {
            //添加成功  1.关闭弹出层，2.刷新DataGird
        	$.messager.alert('提示', data.message, 'info');

            
            $("#div_getCliNumber").dialog("close");
            refresh();
            $("#frmApplyClient input,textarea").val('');
            
            rows.length = "";
        }
        else {
            $.messager.alert("提示", data.message, "error");
        }
    });
}

//实现删除数据
function DeleteSerialnumber() {
    //得到用户选择的数据的ID
    var rows = $("#dgSerialnumber").datagrid("getSelections");
    //首先判断用户是否已经选择了需要删除的数据,然后循环将用户选择的数据传递到后台
    if (rows.length >= 1) {
        //遍历出用户选择的数据的信息，这就是用户选择删除的分组ID的信息
        var ids = "";   //1,2,3,4,5
        var names = "";
        for (var i = 0; i < rows.length; i++) {
            //异步将删除的ID发送到后台，后台删除之后，返回前台，前台刷洗表格
            ids += rows[i].funiqueid + ",";
            //获取用户选择的分组信息
            names += rows[i].fname + ",";
        }
        //最后去掉最后的那一个,
        ids = ids.substring(0, ids.length - 1);
        names = names.substring(0, names.length - 1);
        var postData = {
        		"serialnumber.funiqueid": ids
        };

        //然后确认发送异步请求的信息到后台删除数据
        $.messager.confirm("删除信息", "您确认删除<font color='red' size='3'>" + names + "</font>吗？", function (DeleteUser) {
            if (DeleteUser) {
                $.post("/web1/snnumberDeleteSerialnumber.action", postData, function (data) {
                	//debugger;
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
    $("#dgSerialnumber").datagrid('reload');
    $("#dgSerialnumber").datagrid('clearSelections');
}

function cancel() {    
    $('#div_AddSerialnumber').dialog('close');
}
function cancelApply() {    
    $('#div_getCliNumber').dialog('close');
}