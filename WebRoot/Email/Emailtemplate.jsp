<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>邮件模板管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/web1/css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/web1/css/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/web1/css/icon.css" />
    <link href="/web1/css/syCss.css" rel="stylesheet" />
    <script type="text/javascript" src="/web1/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/web1/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/web1/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/web1/js/SysUtils.js"></script>  
    <script type="text/javascript" src="/web1/js/Emailtemplate.js"></script>  
     
  </head>
<body class="easyui-layout" style="overflow-y: hidden;">
    <div data-options="region:'north',collapsible:false,border:false,title:'查询条件'" style="height: 90px;"
        align="left">
        <form id="searchForm"  method="post" target="newWin">
            <table class="tableForm datagrid-toolbar" style="background-color: White;">
                <tr>

                    <th style="width: 60px;">更新时间：
                    </th>
                    <td style="min-width: 200px;">
                        <input id="txtStartTime" name="txtStartTime" class="easyui-datebox" style="width: 100px;" />&nbsp;&nbsp;-
                        <input id="txtEndTime" name="txtStartTime" class="easyui-datebox" style="width: 100px;" />
                    </td>
                    <th style="width: 60px;">模板类别：
                    </th>
                    <td style="width: 350px;">
                             <input type="text" id="txtFAddress" name="txtFAddress" class="easyui-validatebox" style="width: 120px" value="" />&nbsp;
                   
                    </td>
                </tr>
                <tr>
                    <th style="width: 60px;">模板标题：
                    </th>
                    <td>
                        <input id='txtFname' name='FDeviceID' class="easyui-combotree"
                            multiple="multiple" data-options="url:'/FeedReport/GetComboTree'" style="width: 217px;" />
                    </td>
                    <th>注册手机：</th>
                    <td>
                        <input type="text" id="txtFMobile" name="txtFMobile" class="easyui-validatebox" style="width: 120px" value="" />&nbsp;

                            <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-search" plain="true" onclick="searchFun();">查询</a>
                            <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-clear" plain="true" onclick="clearbox()">清空</a>

                    </td>
                </tr>
            </table>
            <input type="hidden" id="txtExcel" value="1" />
        </form>
    </div>
    <div region="center" style="background: #eee; overflow-y: hidden" split="true" id="center">
        <table id="dgSerialnumberEmailtemplate">
        </table>
    </div>

    <!--------------------------信息的弹出层---------------------------->
    <div id="div_AddSerialnumberEmailtemplate" title="查看正文信息-HTML" toolbar="#div_Toolbar" icon="icon-edit" style="width: 400px; height: 250px;" resizable="true" class="easyui-dialog" closed="true">
        <form id="frmSerialnumberEmailtemplate" method="post">   
            <div style="height: 180px">                    
                    <input type="hidden" id="ftemplateid" name="serialnumberemailtemplate.ftemplateid"/>

                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">标题:</span>
                    <input type="text" id="ftitle" name="serialnumberemailtemplate.ftitle" class="easyui-validatebox" style="width: 180px"/>
                </div>               
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">分类:</span>                  
                     <select class="easyui-combobox" id="ftype" name="serialnumberemailtemplate.ftype" style="width:180px;" data-options="editable:false" required="true" missingMessage="分类必须选择">   
 						<option value="2">注册通知</option>
 						<option value="3">费用通知</option>
 						<option value="4">运动提醒</option>
 						<option value="1">其他通知</option>												
 					</select> 					
                </div>
             	<div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">语言:</span>                    
                    <select class="easyui-combobox" id="flanguage" name="serialnumberemailtemplate.flanguage" style="width:180px;" data-options="editable:false" required="true" missingMessage="语言必须选择">   
 						<option value="0">中文</option>
 						<option value="1">英文</option>
 						<option value="2">韩文</option>	
 						<option value="3">日文</option>	
 						<option value="4">法文</option>	
 						<option value="5">德文</option>	
 						<option value="6">俄文</option>												
 					</select> 	
                </div>               
                <div class="a_left" style="height: 100px">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">正文:</span>
                    <textarea id="fcontent" name="serialnumberemailtemplate.fcontent" cols="22" rows="6" style="width: 180px" class="easyui-validatebox" ></textarea>
                </div>
    

                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">备注:</span>
                    <input type="text" id="fremark" name="serialnumberemailtemplate.fremark" class="easyui-validatebox" style="width: 180px"/>
                </div>
               
            </div>
        </form>
    </div>

    <div id="div_Toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick="AddSerialnumberEmailtemplate();">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" plain="true" onclick="cancel();">取消</a>
    </div>


    <div id="div_Menu">
      <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="add();">增加</a>
      <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-application_edit" plain="true" onclick="UpdateInfo()">修改</a>
            <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="add2();">增加（HTML）</a>
      <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-application_edit" plain="true" onclick="update2()">修改（HTML）</a>
      <a href="#" id="txbDelte" class="easyui-linkbutton" iconcls="icon-delete" plain="true" onclick="DeleteSerialnumberEmailtemplate()">删除</a>
      <a href="#" class="easyui-linkbutton" iconcls="icon-arrow_refresh" plain="true" onclick="refresh();">刷新</a>
    </div>

</html>


