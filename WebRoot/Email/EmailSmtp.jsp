<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>邮件SMTP管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/web1/css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/web1/css/gray/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/web1/css/icon.css" />
    <link href="/web1/css/syCss.css" rel="stylesheet" />
    <script type="text/javascript" src="/web1/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/web1/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/web1/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/web1/js/SysUtils.js"></script>  
    <script type="text/javascript" src="/web1/js/Emailsmtp.js"></script>  
     
  </head>
<body class="easyui-layout" style="overflow-y: hidden;">
    <div data-options="region:'north',collapsible:false,border:false,title:'查询条件'" style="height: 90px;"
        align="left">
        <form id="searchForm"  method="post" target="newWin">
            <table class="tableForm datagrid-toolbar" style="background-color: White;">
                <tr>

                    <th style="width: 60px;">注册时间：
                    </th>
                    <td style="min-width: 200px;">
                        <input id="txtStartTime" name="txtStartTime" class="easyui-datebox" style="width: 100px;" />&nbsp;&nbsp;-
                        <input id="txtEndTime" name="txtStartTime" class="easyui-datebox" style="width: 100px;" />
                    </td>
                    <th style="width: 60px;">邮件地址：
                    </th>
                    <td style="width: 350px;">
                             <input type="text" id="txtFAddress" name="txtFAddress" class="easyui-validatebox" style="width: 120px" value="" />&nbsp;
                   
                    </td>
                </tr>
                <tr>
                    <th style="width: 60px;">登录名称：
                    </th>
                    <td>
                        <input id='txtFname' name='FDeviceID' class="easyui-combotree"
                            multiple="multiple" data-options="url:'/FeedReport/GetComboTree'" style="width: 217px;" />
                    </td>
                    <th>服务器地址：</th>
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
        <table id="dgSerialnumberEmailsmtp">
        </table>
    </div>

    <!--------------------------信息的弹出层---------------------------->
    <div id="div_AddSerialnumberEmailsmtp" title="分组信息" toolbar="#div_Toolbar" icon="icon-edit" style="width: 400px; height: 250px;" resizable="true" class="easyui-dialog" closed="true">
        <form id="frmSerialnumberEmailsmtp" method="post">   
            <div style="height: 180px">                    
                    <input type="hidden" id="fsmtprecid" name="serialnumberemailsmtp.fsmtprecid"/>
                
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">说明标题:</span>
                    <input type="text" id="fname" name="serialnumberemailsmtp.fname" class="easyui-validatebox" style="width: 180px"  required="true" missingMessage="不能为空"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">SMTP地址:</span>
                    <input type="text" id="fmailhost" name="serialnumberemailsmtp.fmailhost" class="easyui-validatebox" style="width: 180px"  required="true" missingMessage="不能为空"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">登录名称:</span>
                    <input type="text" id="fmailusername" name="serialnumberemailsmtp.fmailusername" class="easyui-validatebox" style="width: 180px"  required="true" missingMessage="不能为空"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">登录密码:</span>
                    <input type="text" id="fmailpassword" name="serialnumberemailsmtp.fmailpassword" class="easyui-validatebox" style="width: 180px"  required="true" missingMessage="不能为空"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">邮件地址:</span>
                    <input type="text" id="fmailaddress" name="serialnumberemailsmtp.fmailaddress" class="easyui-validatebox" style="width: 180px"  required="true" missingMessage="不能为空"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">用户名称:</span>
                    <input type="text" id="fmailfromname" name="serialnumberemailsmtp.fmailfromname" class="easyui-validatebox" style="width: 180px"  required="true" missingMessage="不能为空"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">是否启用:</span>                    
                    <select class="easyui-combobox" id="fisdefault" name="serialnumberemailsmtp.fisdefault" style="width:180px;" data-options="editable:false" required="true" missingMessage="使用状态">   
 						<option value="0">停用</option>
 						<option value="1">使用</option>											
 					</select> 	
                </div>   
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">备注信息:</span>
                    <input type="text" id="fremark" name="serialnumberemailsmtp.fremark" class="easyui-validatebox" style="width: 180px"/>
                </div>
               
            </div>
        </form>
    </div>

    <div id="div_Toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick="AddSerialnumberEmailsmtp();">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" plain="true" onclick="cancel();">取消</a>
    </div>


    <div id="div_Menu">
            <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="add();">增加</a>
                    <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-application_edit" plain="true" onclick="UpdateInfo()">修改</a>
                    <a href="#" id="txbDelte" class="easyui-linkbutton" iconcls="icon-delete" plain="true" onclick="DeleteSerialnumberEmailsmtp()">删除</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-arrow_refresh" plain="true" onclick="refresh();">刷新</a>
    </div>

</html>