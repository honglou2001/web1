var situation;//url传的参数条件
var urldevices;
$(function () {
    $.ajaxSetup({
        async: false,
        cache: false
    });  
    searchFun();  
});


function timeFormatter(date){
    return date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();
}
function timeParser(date){
    return new Date(Date.parse(date.replace(/-/g,"/")));
}

$.extend($.fn.validatebox.defaults.rules, {
    idcard: {// 验证身份证
        validator: function (value) {
            return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
        },
        message: '身份证号码格式不正确'
    },
    minLength: {
        validator: function (value, param) {
            return value.length >= param[0];
        },
        message: '请输入至少（2）个字符.'
    },
    length: { validator: function (value, param) {
        var len = $.trim(value).length;
        return len >= param[0] && len <= param[1];
    },
        message: "输入内容长度必须介于{0}和{1}之间."
    },
    phone: {// 验证电话号码
        validator: function (value) {
            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
        },
        message: '格式不正确,请使用下面格式:020-88888888'
    },
    mobile: {// 验证手机号码
        validator: function (value) {
            return /^(13|15|18)\d{9}$/i.test(value);
        },
        message: '手机号码格式不正确'
    },
    intOrFloat: {// 验证整数或小数
        validator: function (value) {
            return /^\d+(\.\d+)?$/i.test(value);
        },
        message: '请输入数字，并确保格式正确'
    },
    currency: {// 验证货币
        validator: function (value) {
            return /^\d+(\.\d+)?$/i.test(value);
        },
        message: '货币格式不正确'
    },
    qq: {// 验证QQ,从10000开始
        validator: function (value) {
            return /^[1-9]\d{4,9}$/i.test(value);
        },
        message: 'QQ号码格式不正确'
    },
    integer: {// 验证整数 可正负数
        validator: function (value) {
            //return /^[+]?[1-9]+\d*$/i.test(value);

            return /^([+]?[0-9])|([-]?[0-9])+\d*$/i.test(value);
        },
        message: '请输入整数'
    },
    age: {// 验证年龄
        validator: function (value) {
            return /^(?:[1-9][0-9]?|1[01][0-9]|120)$/i.test(value);
        },
        message: '年龄必须是0到120之间的整数'
    },

    chinese: {// 验证中文
        validator: function (value) {
            return /^[\Α-\￥]+$/i.test(value);
        },
        message: '请输入中文'
    },
    english: {// 验证英语
        validator: function (value) {
            return /^[A-Za-z]+$/i.test(value);
        },
        message: '请输入英文'
    },
    unnormal: {// 验证是否包含空格和非法字符
        validator: function (value) {
            return /.+/i.test(value);
        },
        message: '输入值不能为空和包含其他非法字符'
    },
    username: {// 验证用户名
        validator: function (value) {
            return /^[a-zA-Z][a-zA-Z0-9_]{5,15}$/i.test(value);
        },
        message: '用户名不合法（字母开头，允许6-16字节，允许字母数字下划线）'
    },
    faxno: {// 验证传真
        validator: function (value) {
            //            return /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/i.test(value);
            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
        },
        message: '传真号码不正确'
    },
    zip: {// 验证邮政编码
        validator: function (value) {
            return /^[1-9]\d{5}$/i.test(value);
        },
        message: '邮政编码格式不正确'
    },
    ip: {// 验证IP地址
        validator: function (value) {
            return /d+.d+.d+.d+/i.test(value);
        },
        message: 'IP地址格式不正确'
    },
    name: {// 验证姓名，可以是中文或英文
        validator: function (value) {
            return /^[\Α-\￥]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
        },
        message: '请输入姓名'
    },
    date: {// 验证姓名，可以是中文或英文
        validator: function (value) {
            //格式yyyy-MM-dd或yyyy-M-d
            return /^(?:(?!0000)[0-9]{4}([-]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-]?)0?2\2(?:29))$/i.test(value);
        },
        message: '清输入合适的日期格式'
    },
    msn: {
        validator: function (value) {
            return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value);
        },
        message: '请输入有效的msn账号(例：abc@hotnail(msn/live).com)'
    },
    same: {
        validator: function (value, param) {
            if ($("#" + param[0]).val() != "" && value != "") {
                return $("#" + param[0]).val() == value;
            } else {
                return true;
            }
        },
        message: '两次输入的密码不一致！'
    }
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
        sortName: 'fincreaseid',
        sortOrder: 'desc',
        queryParams: queryData,  //异步查询的参数
        onLoadSuccess: function (data) {
           
        },
        columns: [[
            { field: "ck", checkbox: true },

            {
                field: 'fname', title: '分销商名称', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,           
            {
                field: 'fintroducer', title: '介绍人名称', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,


            {
                field: 'fphone', title: '座机', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fmobile', title: '手机', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'faddress', title: '地址', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fzipcode', title: '邮编', width: 60, align: 'center', formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'fsex', title: '性别', width: 60, align: 'center', formatter: function (value) {
                	 return value == '1' ? '男' : value == '2' ? '女' : '';
                }
            }
            ,
            {
                field: 'fbirthday', title: '生日', width: 60, align: 'center', formatter: function (value) {
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
                field: 'fremark', title: '备注', width: 60, align: 'center', formatter: function (value) {
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
    //首先用户发送一个异步请求去后台实现方法
    var ID = $("#dgScmDistributors").datagrid("getSelections")[0].fdistributorid;  //获取到了用用户选择的ID  
    $.post("/web1/ScmFindScmDistributors.action", { "scmdistributors.fdistributorid": ID }, function (cbData) {
    	//debugger;
        $("#fdistributorid").val(cbData.scmdistributors.fdistributorid); 
//        $("#fparentid").val(cbData.scmdistributors.fparentid); 
//        $("#fincreaseid").val(cbData.scmdistributors.fincreaseid); 
        $("#fintroducer").val(cbData.scmdistributors.fintroducer); 
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

function add(id) {
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
