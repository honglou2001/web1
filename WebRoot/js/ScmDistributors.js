var situation;//url传的参数条件
var urldevices;
$(function () {
    $.ajaxSetup({
        async: false,
        cache: false
    });
   
    searchFun1();  
});


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
        sortName: 'fupdatetime',
        sortOrder: 'desc',
        queryParams: queryData,  //异步查询的参数
        onLoadSuccess: function (data) {
           
        },
        columns: [[
            { field: "ck", checkbox: true },
            {
                field: 'fdistributorid', title: 'FDistributorID', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fparentid', title: 'FParentID', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fincreaseid', title: 'FIncreaseID', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fintroducer', title: 'FIntroducer', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fintroertype', title: 'FIntroerType', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fname', title: 'FName', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fphone', title: 'FPhone', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fmobile', title: 'FMobile', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'faddress', title: 'FAddress', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fzipcode', title: 'FZipCode', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fsex', title: 'FSex', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fbirthday', title: 'FBirthday', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fweight', title: 'FWeight', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fheight', title: 'FHeight', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fremark', title: 'FRemark', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fpicture', title: 'FPicture', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'frelativeurl', title: 'FRelativeURL', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'frank', title: 'FRank', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'forder', title: 'FOrder', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'faddtime', title: 'FAddTime', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fupdatetime', title: 'FUpdateTime', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            
      ]],              
        toolbar: "#div_Menu"
    });
}
//主要目的用于点击链接过来加载
function searchFun1() { 
    var queryData = {
    	"user.id": $("#txtFname").val(),
        "user.name": $("#txtFname").val(),
        "user.Mobile": $("#txtFMobile").val(),
        "user.Adress": $("#txtFAddress").val()
    };
    initTable(queryData);    
}

function searchFun() {
    var queryData = {
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
    //首先用户发送一个异步请求去后台实现方法
    var ID = $("#dgScmDistributors").datagrid("getSelections")[0].fdistributorid;  //获取到了用用户选择的ID  
    $.post("/web1/ScmFindScmDistributors.action", { "scmdistributors.fdistributorid": ID }, function (cbData) {
    	//debugger;
        $("#fdistributorid").val(cbData.scmdistributors.fdistributorid); 
        $("#fparentid").val(cbData.scmdistributors.fparentid); 
        $("#fincreaseid").val(cbData.scmdistributors.fincreaseid); 
        $("#fintroducer").val(cbData.scmdistributors.fintroducer); 
        $("#fintroertype").val(cbData.scmdistributors.fintroertype); 
        $("#fname").val(cbData.scmdistributors.fname); 
        $("#fphone").val(cbData.scmdistributors.fphone); 
        $("#fmobile").val(cbData.scmdistributors.fmobile); 
        $("#faddress").val(cbData.scmdistributors.faddress); 
        $("#fzipcode").val(cbData.scmdistributors.fzipcode); 
        $("#fsex").val(cbData.scmdistributors.fsex); 
        $("#fbirthday").val(cbData.scmdistributors.fbirthday); 
        $("#fweight").val(cbData.scmdistributors.fweight); 
        $("#fheight").val(cbData.scmdistributors.fheight); 
        $("#fremark").val(cbData.scmdistributors.fremark); 
        $("#fpicture").val(cbData.scmdistributors.fpicture); 
        $("#frelativeurl").val(cbData.scmdistributors.frelativeurl); 
        $("#frank").val(cbData.scmdistributors.frank); 
        $("#forder").val(cbData.scmdistributors.forder); 
        $("#faddtime").val(cbData.scmdistributors.faddtime); 
        $("#fupdatetime").val(cbData.scmdistributors.fupdatetime); 

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
    $('#div_AddScmDistributors').dialog('open');
}
//实现分组的修改
function AddScmDistributors() {
	
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
        if (data.success == true) {
            //添加成功  1.关闭弹出层，2.刷新DataGird
        	 $.messager.alert('提示', data.message, 'info');

            $("#div_AddScmDistributors").dialog("close");
            refresh();
            $("#frmScmDistributors input,textarea").val('');
        }
        else {
            $.messager.alert('提示', data, 'error');
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
    $("#dgScmDistributors").datagrid('reload');
    $("#dgScmDistributors").datagrid('clearSelections');
}

function cancel() {    
    $('#div_AddScmDistributors').dialog('close');
}
