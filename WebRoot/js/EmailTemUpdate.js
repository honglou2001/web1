var situation;//url传的参数条件
var urldevices;
$(function () {
    $.ajaxSetup({
        async: false,
        cache: false
    });

});

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
        $("#ftitle").val(cbData.serialnumberemailtemplate.ftitle);        
        $('#ftype').combobox('setValue',cbData.serialnumberemailtemplate.ftype);        
        $("#fcontent").val(cbData.serialnumberemailtemplate.fcontent); 
        $("#flanguage").val(cbData.serialnumberemailtemplate.flanguage);        
        var d1 = cbData.serialnumberemailtemplate.flanguage;
        $('#flanguage').combobox('setValue',d1);
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

function add2(id) {
	window.showModalDialog("Email/ueditor/TemHtml.html",window,"win","toolbars=0;width=750;height=200,resable=true");//这里用window对象作为参数传递
}
//实现分组的修改



function refresh() {
    $("#dgSerialnumberEmailtemplate").datagrid('reload');
    $("#dgSerialnumberEmailtemplate").datagrid('clearSelections');
}

function cancel() {    
    $('#div_AddSerialnumberEmailtemplate').dialog('close');
}
