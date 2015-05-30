var situation;//url传的参数条件
var urldevices;
$(function () {
    $.ajaxSetup({
        async: false,
        cache: false
    });
   
    searchFun();  
});



function myLoader(parameter){
	return function(param,success,error){
		debugger;
		var q = param.q || '';
		if (q.length <= 1){return false}
		$.ajax({
			url: '/web1/ScmQueryScmDistributors.action',
			dataType: 'jsonp',
	        data: {
	            featureClass: "P",
	            style: "full",
	            maxRows: 20,
	            name_startsWith: q
	        },
			success: function(data){
				var items = $.map(data.rows, function(item){
					return {
						id: item.fdistributorid,
						name: item.fname + (item.fname ? ', ' + item.fname : '') + ', ' + item.fname
					};
				});
				success(items);
			},
	        error: function(){
				error.apply(this, arguments);
			}
		});
	}
}

function initTable(queryData) {
    $('#dgScmSalesdata').datagrid({
        loadMsg: "数据加载中,请稍候……",
        url: '/web1/SaleQueryScmSalesdata.action',
        width: "auto",
        height: Math.max(document.body.scrollHeight, document.documentElement.scrollHeight) - 57,
        iconCls: 'icon-save',
        pageSize: 10,
        nowrap: true,
        fitColumns: true,
        singleSelect:true,
        striped: true,
        collapsible: true,
        pagination: true,
        rownumbers: true, //行号
        idField: 'fdistributorid',
        sortName: 'fupdatetime',
        sortOrder: 'desc',
        queryParams: queryData,  //异步查询的参数
        onLoadSuccess: function (data) {
           
        },
        columns: [[
            { field: "ck", checkbox: true },
            {
                field: 'fsaledataid', title: '销售编号', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fdistributor', title: '分销商名称', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }

            ,
            {
                field: 'fprice', title: '价格', width: 60, align: 'left', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'famount', title: '数量', width: 60, align: 'left', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'ftotal', title: '总额', width: 60, align: 'left', formatter: function (value) {
                    return value;
                }
            }
            
            ,
            {
                field: 'fdate', title: '销售日期', width: 60, align: 'center', formatter: function (value) {
                    if (value!=null){
                    	return value.substr(0, 10);
                    }
                    else{
                    	return value;
                    }
                }
            }
            ,
            {
                field: 'fsplit', title: '分成比例', width: 60, align: 'left', formatter: function (value) {                                      
                    if (value!=null){
                    	return  (parseFloat(value)* 1.00).toFixed(2)  + "%";
                    }
                    else
                    	{
                    	return "";
                    	}
                }
            }
            ,
            {
                field: 'fsplittoal', title: '分成总额', width: 60, align: 'left', formatter: function (value) {
                    return  (parseFloat(value)* 1.00).toFixed(2);
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
    	 "scmsalesdata.fdistributorid": $("#sftimebegin").datebox('getValue'),
    	 "scmsalesdata.fsaledataid": $("#sftimeend").datebox('getValue'),   	 
         "scmsalesdata.fdistributor": $("#sfdistributor").val()
    };
    initTable(queryData);
}

//修改分组的信息
function UpdateInfo() {
    //首先取出来用户选择的数据的ID
    var rows = $("#dgScmSalesdata").datagrid("getSelections");
    //首先取出来值判断用户只能选择一个
    if (rows.length != 1) {
        $.messager.alert("提示", "每次只能修改一条，你已经选择了<font color='red'  size='6'>" + rows.length + "</font>条。", "error");
        return;
    }

    //处理修改的信息，弹出修改的对话框,然后显示选择的分组的详细信息             
    $('#div_AddScmSalesdata').dialog('open');
    //绑定修改显示详细信息的方法
    BindShowUpdateInfo();
}

//绑定修改显示详细信息的方法
function BindShowUpdateInfo() {
    //首先用户发送一个异步请求去后台实现方法
	ShowDistorCom();
	
    var ID = $("#dgScmSalesdata").datagrid("getSelections")[0].fsaledataid;  //获取到了用用户选择的ID  
    $.post("/web1/SaleFindScmSalesdata.action", { "scmsalesdata.fsaledataid": ID }, function (cbData) {
    	//debugger;
        $("#fsaledataid").val(cbData.scmsalesdata.fsaledataid);         
        $('#fdistributorid').combobox('setValue',cbData.scmsalesdata.fdistributorid);                           
        $("#fincreaseid").val(cbData.scmsalesdata.fincreaseid); 
        $("#fprice").val(cbData.scmsalesdata.fprice); 
        $("#famount").val(cbData.scmsalesdata.famount); 
       
        $('#ftype').combobox('setValue',cbData.scmsalesdata.ftype);
        if (cbData.scmsalesdata.fdate!=null){
       	 $('#fdate').datebox('setValue',cbData.scmsalesdata.fdate.substr(0, 10));
       }
        
        $("#faddtime").val(cbData.scmsalesdata.faddtime); 
        $("#fupdatetime").val(cbData.scmsalesdata.fupdatetime); 

    });
}


function clearbox() {
    $('#searchForm input').val('');  
    searchFun();
}

function add(id) {   

	ShowDistorCom();
    $("#frmScmSalesdata input,textarea").val('');
    $('#div_AddScmSalesdata').dialog('open');
    


}

function ShowDistorCom()
{
    var url = "/web1/ScmQueryScmDistributors.action";
    $.getJSON(url, function(json) {
	    $('#fdistributorid').combobox({
	    data : json.rows,
	    valueField:'fdistributorid',
	    textField:'fname',
	    editable:true//禁止编辑  
	    });
    });	
}
//实现分组的修改
function AddScmSalesdata() {
	
	 if($("#frmScmSalesdata").form('validate')==false)
		 {
		   return ;
		 }
	//debugger;
    //if ($("#fname").val().length == 0) {
    //    $.messager.alert("提示", "请输入user.name！", "info");
    //    return;
    //}
    //获取需要传递的参数传递给前台
    var postData = $("#frmScmSalesdata").serializeArray();
    
    //$.messager.alert("提示", postData, "info");
    //发送异步请求到后台保存分组数据
    $.post("/web1/SaleAddScmSalesdata.action", postData, function (data) {
    	//debugger;   	
        if (data.success == true && data.errcode==0) {
            //添加成功  1.关闭弹出层，2.刷新DataGird
        	 $.messager.alert('提示', data.message, 'info');

            $("#div_AddScmSalesdata").dialog("close");
            refresh();
            $("#frmScmSalesdata input,textarea").val('');
        }
        else {
        	$.messager.alert('提示', data.message, 'error');
        }
    });
}
//实现删除数据
function DeleteScmSalesdata() {
    //得到用户选择的数据的ID
    var rows = $("#dgScmSalesdata").datagrid("getSelections");
    //首先判断用户是否已经选择了需要删除的数据,然后循环将用户选择的数据传递到后台
    if (rows.length >= 1) {
        //遍历出用户选择的数据的信息，这就是用户选择删除的分组ID的信息
        var ids = "";   //1,2,3,4,5
        var names = "";
        for (var i = 0; i < rows.length; i++) {
            //异步将删除的ID发送到后台，后台删除之后，返回前台，前台刷洗表格
            ids += rows[i].fsaledataid + ",";
            //获取用户选择的分组信息
            names += rows[i].fdistributor + ",";
        }
        //最后去掉最后的那一个,
        ids = ids.substring(0, ids.length - 1);
        names = names.substring(0, names.length - 1);
        var postData = {
        		"scmsalesdata.fsaledataid": ids
        };

        //然后确认发送异步请求的信息到后台删除数据
        $.messager.confirm("删除信息", "您确认删除<font color='red' size='3'>" + names + "的销售记录</font>吗？", function (DeleteUser) {
            if (DeleteUser) {
                $.post("/web1/SaleDeleteScmSalesdata.action", postData, function (data) {
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


function refresh() {
    $("#dgScmSalesdata").datagrid('reload');
    $("#dgScmSalesdata").datagrid('clearSelections');
}

function cancel() {    
    $('#div_AddScmSalesdata').dialog('close');
}
