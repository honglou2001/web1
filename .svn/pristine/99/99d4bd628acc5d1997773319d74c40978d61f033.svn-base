<%@ page language="java" import="java.util.*,bean.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>


 <!DOCTYPE html>
<html>
<head>
    <title>轻云平台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/web1/css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/web1/css/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/web1/css/icon.css" />
    <link href="/web1/css/syCss.css" rel="stylesheet" />
    <script type="text/javascript" src="/web1/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/web1/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/web1/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/web1/js/highcharts.js"></script>
    <script type="text/javascript" src="/web1/js/SysUtils.js"></script>  
    <script type="text/javascript" src="/web1/js/Roles.js"></script>  
     
  </head>
<body>
    <div id="div_Main">
        <table id="t_Role" class="easyui-datagrid"></table>
    </div>

    <div id="div_EditRole" title="角色信息" toolbar="#div_Toolbar" icon="icon-edit" style="width: 400px; height: 450px;left: 100px; top: 100px;" resizable="true" class="easyui-dialog" closed="true">
        <div id="div_Tabs" class="easyui-tabs">
            <div id="div_BaseMsg" title="基本信息">
                <form id="ff_add" runat="server">
                    <div style="height: 350px">
                        <p>&nbsp;</p>
                        <div class="a_left">
                            <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">角色名称:</span>
                            <input type="text" id="txtRoleName" name="role.froleName" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                        </div>
                        <div class="a_left">
                            <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">备注信息:</span>
                            <textarea id="txtDescription" name="role.fdescription" cols="22" rows="3" style="width: 180px;"></textarea>
                        </div>
                        <input type="hidden" id="txbRoleID" name="role.fid" />
                        <input type="hidden" id="txbAction" name="action" value="add" />
                        <input type="hidden" id="txbPermissions" name="role.fpermissions" />
                    </div>
                </form>
            </div>
            <div id="div_Permission" title="权限分配">
                <ul id="ulpermission" style="height: 350px"></ul>
            </div>
        </div>

    </div>
    <div id="div_Toolbar">
        <a href="#" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick="save();">保存</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-cancel" plain="true" onclick="$('#div_EditRole').dialog('close');">取消</a>
    </div>

    <div id="div_Menu">
            <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="edit(-1);">增加</a>
                    <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-application_edit" plain="true" onclick="edit(-2)">修改</a>
                    <a href="#" id="txbDelte" class="easyui-linkbutton" iconcls="icon-delete" plain="true" onclick="del()">删除</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-arrow_refresh" plain="true" onclick="refresh();">刷新</a>
    </div>

</body>
</html>


