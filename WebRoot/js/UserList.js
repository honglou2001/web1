var situation;//url传的参数条件
var urldevices;
$(function () {
    $.ajaxSetup({
        async: false,
        cache: false
    });
   
    searchFun1();  
});

function GetArgumentFromUrl(url) {
    //debugger;
    var returnObj = {};
    //构造参数对象并初始化 
    var name, value = '', i;
    var str = url.toLowerCase(); //获得浏览器地址栏URL串
    var num = str.indexOf("?")
    if (num < 0) return;
    str = str.substr(num + 1); //截取“?”后面的参数串
    var arrtmp = str.split("&"); //将各参数分离形成参数数组
    for (i = 0; i < arrtmp.length; i++) {
        num = arrtmp[i].indexOf("=");
        if (num > 0) {
            name = arrtmp[i].substring(0, num); //取得参数名称
            value = arrtmp[i].substr(num + 1); //取得参数值
            returnObj[name] = value; //定义对象属性并初始化
        }
    }
    return returnObj;
}

function initTable(queryData) {
    $('#dgFeedReport').datagrid({
        loadMsg: "数据加载中,请稍候……",
        url: '/web1/json.action',
        width: "auto",
        height: Math.max(document.body.scrollHeight, document.documentElement.scrollHeight) - 87,
        iconCls: 'icon-save',
        pageSize: 10,
        nowrap: true,
        fitColumns: true,
        //autoRowHeight: false,
        singleSelect:true,
        striped: true,
        collapsible: true,
        pagination: true,
        rownumbers: true, //行号
        idField: 'id',
        sortName: 'name',
        sortOrder: 'desc',
        queryParams: queryData,  //异步查询的参数
        onLoadSuccess: function (data) {
           
        },
        columns: [[
            { field: "ck", checkbox: true },
            {
                field: 'name', title: 'Fname', width: 60, align: 'center', formatter: function (value) {
                    return value.length == 0 ? "" : value;
                }
            }
            ,
            {
                field: 'pwd', title: 'pwd', width: 60, align: 'center', formatter: function (value) {
                    return value == 0 ? "" : value;
                }
            },
            {
                field: 'mobile', title: 'Mobile', width: 60, align: 'center', formatter: function (value) {
                    return value == 0 ? "" : value;
                }
            }

            ,
            {
                field: 'id', title: 'id', width: 60, align: 'center', formatter: function (value) {
                    return value == 0 ? "" : value;
                }
            }
            ,
            {
                field: 'adress', title: 'adress',width: 60, formatter: function (value) {
                    return value;
                }
            }
            ,
            {
                field: 'description', title: 'description',width: 60, formatter: function (value) {
                    return value;
                }
            }
            
      ]],      
        
        toolbar: "#div_Menu"
    });
}
//主要目的用于点击链接过来加载
function searchFun1() { 
    var queryData = {
        //FSerialNumber: $("#txtFSerialNumber").val(),
        FStartDate: $("#txtStartDate").datebox('getValue'),
        FEndDate: $("#txtEndDate").datebox('getValue'),
        FDeviceID: urldevices,
        FDays: $("#txtDay").val(),
        FCompare: $("#txtdindex").combobox("getValue"),
        FFeedAmount: $("#txtFeedAmount").val(),
        FIsweight: $('input:radio[name="FIsweight"]:checked').val(),
        FEarNumber: $("#txtFEarNumber").val(),
        FSituation: situation
    };
    initTable(queryData);    
}

function searchFun() {
    situation = "";
    urldevices = "";
    var t = $('#txtDeviceName').combotree('tree');
    var n = t.tree('getChecked');
    var deviceids = '';
    for (var i = 0; i < n.length; i++) {
        deviceids += "'" + n[i].id + "',";
    }
    if (deviceids.length > 1) {
        deviceids = deviceids.substr(0, deviceids.length - 1);
    }
    var queryData = {
        //FSerialNumber: $("#txtFSerialNumber").val(),
        FStartDate: $("#txtStartDate").datebox('getValue'),
        FEndDate: $("#txtEndDate").datebox('getValue'),
        FDeviceID: deviceids,
        FDays: $("#txtDay").val(),
        FCompare: $("#txtdindex").combobox("getValue"),
        FFeedAmount: $("#txtFeedAmount").val(),
        FIsweight: $('input:radio[name="FIsweight"]:checked').val(),
        FEarNumber: $("#txtFEarNumber").val(),
        FSituation: situation
    };
    initTable(queryData);
}

//修改分组的信息
function UpdateInfo() {
    //首先取出来用户选择的数据的ID
    var rows = $("#dgFeedReport").datagrid("getSelections");
    //首先取出来值判断用户只能选择一个
    if (rows.length != 1) {
        $.messager.alert("提示", "每次只能修改一条，你已经选择了<font color='red'  size='6'>" + rows.length + "</font>条。", "error");
        return;
    }

    //处理修改的信息，弹出修改的对话框,然后显示选择的分组的详细信息             
    $('#div_AddUser').dialog('open');
    //绑定修改显示详细信息的方法
    BindShowUpdateInfo();
}

//绑定修改显示详细信息的方法
function BindShowUpdateInfo() {
    //首先用户发送一个异步请求去后台实现方法
    var ID = $("#dgFeedReport").datagrid("getSelections")[0].id;  //获取到了用用户选择的ID  
    $.post("/web1/Edit.action", { fid: ID }, function (callbackdata) {
    	//debugger;
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
    $('#txtDeviceName').combotree("setValue", "");
    $('#searchForm input').val('');
    $('#txtdindex').combobox('setValue', '0');
    $('#txtStartDate').datebox('setValue', date.getFullYear() + '-' + month + '-' + currentDate);
    $('#txtEndDate').datebox('setValue', date.getFullYear() + '-' + month + '-' + currentDate);
    searchFun();
}
function seeView(deviceid, devicename, date) {
    $("#div_FeedDetil").show().dialog("open");

    var postData = {
        deviceID: deviceid,
        feedDate: date
    };
  
    options.series[0].data.splice(0, options.series[0].data.length);
    options.series[1].data.splice(0, options.series[1].data.length);
    options.xAxis.categories.splice(0, options.xAxis.categories.length);

    $.getJSON("/FeedReport/GetSingleReport", postData, function (data) {

        for (var i = 0; i < data.rows.length; i++) {
            options.xAxis.categories.push(data.rows[i]["FPigState"].toString());
            options.series[0].data.push(parseFloat(data.rows[i]["FFeedAmount"].toString()));
            options.series[1].data.push(parseFloat(data.rows[i]["FDayFeedAmount"].toString()));
        }
        options.title.text = data.rows[0]["FFeedDate"].substr(0, 10) + " 至 " + data.rows[data.rows.length - 1]["FFeedDate"].substr(0, 10);
        options.subtitle.text = devicename;
        options.tooltip.formatter = function () {

            var feeddate = "";
            for (var i = 0; i < data.rows.length; i++) {
                if (this.x == data.rows[i]["FPigState"]) {
                    feeddate = data.rows[i]["FFeedDate"].substr(0, 10);
                }
            }
            return '日 期：' + feeddate + '<br/>' + this.series.name + '：' + this.y + 'kg';

        };
        Chart1 = new Highcharts.Chart(options);
        //$("body").children("div.datagrid-mask-msg").remove();
    });
}
function add(id) {
    $('#div_AddUser').dialog('open');
}
//实现分组的修改
function AddUser() {
	
	//debugger;
    if ($("#name").val().length == 0) {
        $.messager.alert("提示", "请输入user.name！", "info");
        return;
    }
    //获取需要传递的参数传递给前台
    var postData = $("#frmUser").serializeArray();
    
    //$.messager.alert("提示", postData, "info");
    //发送异步请求到后台保存分组数据
    $.post("/web1/reg1.action", postData, function (data) {
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


function ChangeDateFormat(time) {
    if (time != null) {
        var date = new Date(parseInt(time.replace("/Date(", "").replace(")/", ""), 10));
        //月份为0-11，所以+1，月份小于10时补个0
        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        return date.getFullYear() + "-" + month + "-" + currentDate;
    }
    return "";
}


function refresh() {
    $("#dgFeedReport").datagrid('reload');
    $("#dgFeedReport").datagrid('clearSelections');
}

function cancel() {
    //$("#frmUser input,textarea").val('');
    //$("#div_AddUser").dialog('close');
    
    $('#div_AddUser').dialog('close');
}


