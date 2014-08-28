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
    <script type="text/javascript" src="/web1/js/Menu.js"></script>  
     
  </head>
<body style="overflow-y: hidden">
    <div>
        <table id="dgMenu" class="easyui-treegrid"></table>
    </div>


    <!--------------------------信息的弹出层---------------------------->
     <div id="div_AddUser" toolbar="#div_Toolbar" class="easyui-dialog" title="菜单信息" style="width: 400px; height: 400px; left: 100px; top: 100px;" icon="icon-edit" closed="true">
        <form id="frmUser" method="post" novalidate="novalidate">
        <input type="hidden" id="fid" name="menu.fid"/>
        <input type="hidden" id="_parentId" name="menu._parentId" value="00000000-0000-0000-0000-000000000000"/>
            <div style="height: 180px">
                <p>&nbsp;</p>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">父级名称:</span>
                    <input type="text" id="fparentName" name="fparentName" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>                
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">菜单名称:</span>
                    <input type="text" id="fmenuName" name="menu.fmenuName" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">菜单URL:</span>
                    <input type="text" id="furl" name="menu.furl" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">菜单图标:</span>
                    <input type="text" id="ficon" name="menu.ficon" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
              <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">菜单权限:</span>
                    <input id="fauthorityVal" name="menu.fauthorityVal" class="easyui-combotree" multiple style="width: 180px" />
                </div>                
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">排列序号:</span>
                    <input type="text" id="flevel" name="menu.flevel" class="easyui-validatebox" style="width: 180px" value="" />
                </div>                
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">描述:</span>
                    <input type="text" id="fdescription" name="menu.fdescription" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
            </div>
        </form>
    </div>

    <div id="div_Toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick="AddUser();">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" plain="true" onclick="cancel();">取消</a>
    </div>


    <div id="div_Menu">
            <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="add(-1);">增加</a>
                    <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-application_edit" plain="true" onclick="UpdateInfo()">修改</a>
                    <a href="#" id="txbDelte" class="easyui-linkbutton" iconcls="icon-delete" plain="true" onclick="deleteUser()">删除</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-arrow_refresh" plain="true" onclick="refresh();">刷新</a>

        <a href="#" class="easyui-linkbutton" iconcls="icon-application_cascade" plain="true" id="wrap">折叠/展开</a>
        
    </div>

</html>

