var situation;//url传的参数条件
var urldevices;
$(function () {
    $.ajaxSetup({
        async: false,
        cache: false
    });  
    searchFun();  
});


//function timeFormatter(date){
//    return date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();
//}
//function timeParser(date){
//    return new Date(Date.parse(date.replace(/-/g,"/")));
//}

function initTable(queryData) {
    $('#dgScmDistributors').datagrid({
        loadMsg: "数据加载中,请稍候……",
        url: '/web1/ScmQueryScmDistributors.action',
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
        idField: 'fdistributorid',
        sortName: 'fincreaseid',
        sortOrder: 'desc',
        queryParams: queryData,  //异步查询的参数
        onLoadSuccess: function (data) {
           
        },
        columns: [[
            { field: "ck", checkbox: true },
//
//            {
//                field: 'fname', title: '分销商名称', width: 60, align: 'center', formatter: function (value) {
//                    return value;
//                }
//            }
//            , 
            {
                field: 'fname', title: '分销商名称', width: 60,  align: 'left',formatter: function (value, row, index) {
                    var e = '<a href="#" mce_href="#" onclick="QueryCommissions(\'' + row.fdistributorid + '\',\'' + value + '\',\'' +row.fparentid + '\')"><font color="blue">' + value + '</font></a>';
                    return e;
                }
            },
            {
                field: 'fintroducer', title: '介绍人名称', width: 60,  align: 'left',formatter: function (value, row, index) {
                    var e1 = '<a href="#" mce_href="#" onclick="QueryCommissions(\'' + row.fparentid + '\',\'' + value + '\',\'' +row.fparentid + '\')"><font color="blue">' + value + '</font></a>';
                    return e1;
                }
            },
//            {
//                field: 'fintroducer', title: '介绍人名称', width: 60, align: 'left', formatter: function (value) {
//                    return value;
//                }
//            }
//            ,
            {
                field: 'fphone', title: '座机', width: 45, align: 'left', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fmobile', title: '手机', width: 45, align: 'left', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'faddress', title: '地址', width: 60, align: 'left', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fsex', title: '性别', width: 20, align: 'center', formatter: function (value) {
                	 return value == '1' ? '男' : value == '2' ? '女' : '';
                }
            }
            ,
            {
                field: 'fbirthday', title: '生日', width: 45, align: 'center', formatter: function (value) {
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
                field: 'fremark', title: '备注', width: 60, align: 'left', formatter: function (value) {
                    return value;
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

function QueryCommissions(distributorid,fname, parentid) {	;
	$('#div_commissions').panel({title: fname+"—销售提成"});

    $("#div_commissions").show().dialog("open");
    //$('#div_commissions').attr("title",fname);
    var queryData = {
      	"scmsalesdata.fparentid": distributorid
        //"scmsalesdata.fdistributor": distributorid
      };
    
    CommissionsDetail(queryData);
}


function CommissionsDetail(queryData) {
    $('#dgcommissions').datagrid({
        loadMsg: "数据加载中,请稍候……",
        url: '/web1/SaleQueryScmSalesdata.action',
        width: "auto",
        height: Math.max(document.body.scrollHeight, document.documentElement.scrollHeight),
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
                field: 'fdistributor', title: '下级分销商', width: 60, align: 'left', formatter: function (value) {
                    return value;
                }
            }
//            ,
//            {
//                field: 'fintroducer', title: '介绍人名称', width: 60, align: 'center', formatter: function (value) {
//                    return value;
//                }
//            }
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
            
      ]]
    });
}


function searchFun() {
    var queryData = {
       	 "scmdistributors.fintroducer": $("#sinstroducer").val(),	
         "scmdistributors.faddress": $("#sfaddress").val(),
         "scmdistributors.fname": $("#sfname").val(),
         "scmdistributors.fmobile": $("#sfmobile").val()
       };
    initTable(queryData);
}


//修改分组的信息
function UpdateInfo() {
    //首先取出来用户选择的数据的ID
    var rows = $("#dgScmDistributors").datagrid("getSelections");
    //首先取出来值判断用户只能选择一个
    if (rows.length != 1) {
        $.messager.alert("提示", "每次只能修改一条，你已经选择了<font color='red'  size='6'>" + rows.length + "</font>条。", "error");
        return;
    }

    //处理修改的信息，弹出修改的对话框,然后显示选择的分组的详细信息             
    $('#div_AddScmDistributors').dialog('open');
    //绑定修改显示详细信息的方法
    BindShowUpdateInfo();
}

//绑定修改显示详细信息的方法
function BindShowUpdateInfo() {
	ShowDistorCom();
	
    //首先用户发送一个异步请求去后台实现方法
    var ID = $("#dgScmDistributors").datagrid("getSelections")[0].fdistributorid;  //获取到了用用户选择的ID  
    $.post("/web1/ScmFindScmDistributors.action", { "scmdistributors.fdistributorid": ID }, function (cbData) {
    	//debugger;
        $("#fdistributorid").val(cbData.scmdistributors.fdistributorid); 
//        $("#fparentid").val(cbData.scmdistributors.fparentid); 
//        $("#fincreaseid").val(cbData.scmdistributors.fincreaseid); 
        //$("#fintroducer").val(cbData.scmdistributors.fintroducer); 
        $('#fparentid').combobox('setValue',cbData.scmdistributors.fparentid);   
//        $("#fintroertype").val(cbData.scmdistributors.fintroertype); 
        $("#fname").val(cbData.scmdistributors.fname); 
        $("#fphone").val(cbData.scmdistributors.fphone); 
        $("#fmobile").val(cbData.scmdistributors.fmobile); 
        $("#faddress").val(cbData.scmdistributors.faddress); 
        $("#fzipcode").val(cbData.scmdistributors.fzipcode); 
//        $("#fsex").val(cbData.scmdistributors.fsex); 
        $('#fsex').combobox('setValue',cbData.scmdistributors.fsex);
        
        if (cbData.scmdistributors.fbirthday!=null){
        	 $('#fbirthday').datebox('setValue',cbData.scmdistributors.fbirthday.substr(0, 10));
        }
        
//        $('#fbirthday').datebox('setValue',cbData.scmdistributors.fbirthday);
//        $("#fbirthday").val(cbData.scmdistributors.fbirthday); 
//        $("#fweight").val(cbData.scmdistributors.fweight); 
//        $("#fheight").val(cbData.scmdistributors.fheight); 
        $("#fremark").val(cbData.scmdistributors.fremark); 
//        $("#fpicture").val(cbData.scmdistributors.fpicture); 
//        $("#frelativeurl").val(cbData.scmdistributors.frelativeurl); 
//        $("#frank").val(cbData.scmdistributors.frank); 
//        $("#forder").val(cbData.scmdistributors.forder); 
//        $("#faddtime").val(cbData.scmdistributors.faddtime); 
//        $("#fupdatetime").val(cbData.scmdistributors.fupdatetime); 

    });
}


function clearbox() {

    $('#searchForm input').val('');
   
    searchFun();
}

function ShowDistorCom()
{
    var url = "/web1/ScmQueryScmDistributors.action";
    $.getJSON(url, function(json) {
	    $('#fparentid').combobox({
	    data : json.rows,
	    valueField:'fdistributorid',
	    textField:'fname',
	    editable:true//禁止编辑  
	    });
    });	
}

function add(id) {
	ShowDistorCom();
	
	$("#frmScmDistributors input,textarea").val('');
    $('#div_AddScmDistributors').dialog('open');
}
//实现分组的修改
function AddScmDistributors() {
	
	 if($("#frmScmDistributors").form('validate')==false)
	 {
	   return ;
	 }
	//debugger;
    if ($("#fname").val().length == 0) {
        $.messager.alert("提示", "请输入user.name！", "info");
        return;
    }
    //获取需要传递的参数传递给前台
    var postData = $("#frmScmDistributors").serializeArray();
    
    //$.messager.alert("提示", postData, "info");
    //发送异步请求到后台保存分组数据
    $.post("/web1/ScmAddScmDistributors.action", postData, function (data) {
    	//debugger;   	
        if (data.success == true && data.errcode==0) {
            //添加成功  1.关闭弹出层，2.刷新DataGird
        	 $.messager.alert('提示', data.message, 'info');

            $("#div_AddScmDistributors").dialog("close");
            refresh();
            $("#frmScmDistributors input,textarea").val('');
        }
        else {
            $.messager.alert('提示', data.message, 'error');
        }
    });
}
//实现删除数据
function DeleteScmDistributors() {
    //得到用户选择的数据的ID
    var rows = $("#dgScmDistributors").datagrid("getSelections");
    //首先判断用户是否已经选择了需要删除的数据,然后循环将用户选择的数据传递到后台
    if (rows.length >= 1) {
        //遍历出用户选择的数据的信息，这就是用户选择删除的分组ID的信息
        var ids = "";   //1,2,3,4,5
        var names = "";
        for (var i = 0; i < rows.length; i++) {
            //异步将删除的ID发送到后台，后台删除之后，返回前台，前台刷洗表格
            ids += rows[i].fdistributorid + ",";
            //获取用户选择的分组信息
            names += rows[i].fname + ",";
        }
        //最后去掉最后的那一个,
        ids = ids.substring(0, ids.length - 1);
        names = names.substring(0, names.length - 1);
        var postData = {
        		"scmdistributors.fdistributorid": ids
        };

        //然后确认发送异步请求的信息到后台删除数据
        $.messager.confirm("删除信息", "您确认删除<font color='red' size='3'>" + names + "</font>吗？", function (DeleteUser) {
            if (DeleteUser) {
                $.post("/web1/ScmDeleteScmDistributors.action", postData, function (data) {
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
    $("#dgScmDistributors").datagrid('reload');
    $("#dgScmDistributors").datagrid('clearSelections');
}

function cancel() {    
    $('#div_AddScmDistributors').dialog('close');
}
