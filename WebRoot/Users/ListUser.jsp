<%@ page language="java" import="java.util.*,bean.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>


 <!DOCTYPE html>
<html>
<head>
    <title>轻云平台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/web1/css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/web1/css/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/web1/css/icon.css" />
    <link href="/web1/css/syCss.css" rel="stylesheet" />
    <script type="text/javascript" src="/web1/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/web1/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/web1/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/web1/js/highcharts.js"></script>
    <script type="text/javascript" src="/web1/js/SysUtils.js"></script>  
    <script type="text/javascript" src="/web1/js/UserList.js"></script>  
     
  </head>
<body class="easyui-layout" style="overflow-y: hidden;">
    <div data-options="region:'north',collapsible:false,border:false,title:'查询条件'" style="height: 90px;"
        align="left">
        <form id="searchForm" action="/FeedReport/GetFeedReportExcel" method="post" target="newWin">
            <table class="tableForm datagrid-toolbar" style="background-color: White;">
                <tr>

                    <th style="width: 60px;">饲喂日期：
                    </th>
                    <td style="min-width: 200px;">
                        <input id="txtStartDate" name="FStartDate" class="easyui-datebox" style="width: 100px;" />&nbsp;&nbsp;-
                        <input id="txtEndDate" name="FEndDate" class="easyui-datebox" style="width: 100px;" />
                    </td>
                    <th style="width: 60px;">连续
                    </th>
                    <td style="width: 350px;">
                        
                        <input id="txtDay" name="FDay" class="easyui-numberbox" style="width: 50px;" />天 采食量
                       <select id="txtdindex" class="easyui-combobox" name="FCompare" style="width: 80px;">
                           <option value="0">小于等于</option>
                           <option value="1">大于</option>
                       </select>
                        <input id="txtFeedAmount" name="FFeedAmount" class="easyui-numberbox" style="width: 50px;" />
                        <input id="rdFFeedAmountA" name="FIsweight" type="radio" checked="checked" value="1" style="width: 20px;" />%
                        <input id="rdFFeedAmountB" name="FIsweight" type="radio" value="2" style="width: 25px;" />kg
                    </td>
                </tr>
                <tr>
                    <th style="width: 60px;">设备名称：
                    </th>
                    <td>
                        <input id='txtDeviceName' name='FDeviceID' class="easyui-combotree"
                            multiple="multiple" data-options="url:'/FeedReport/GetComboTree'" style="width: 217px;" />
                    </td>
                    <th>耳牌号：</th>
                    <td>
                        <input type="text" id="txtFEarNumber" name="FEarNumber" class="easyui-validatebox" style="width: 120px" value="" />&nbsp;

                            <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-search" plain="true" onclick="searchFun();">查询</a>
                            <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-clear" plain="true" onclick="clearbox()">清空</a>

                            <a href="#" id="explort" class="easyui-linkbutton" iconcls="icon-page_white_excel" plain="true" onclick="exportExcel()">导出</a>
                    </td>
                </tr>
            </table>
            <input type="hidden" id="txtExcel" value="1" />
        </form>
    </div>
    <div region="center" style="background: #eee; overflow-y: hidden" split="true" id="center">
        <table id="dgFeedReport">
        </table>
    </div>

    <!--------------------------信息的弹出层---------------------------->
    <div id="div_AddUser" title="分组信息" toolbar="#div_Toolbar" icon="icon-edit" style="width: 400px; height: 250px;" resizable="true" class="easyui-dialog" closed="true">
        <form id="frmUser" method="post" novalidate="novalidate">
        <input type="hidden" id="id" name="user.id"/>
            <div style="height: 180px">
                <p>&nbsp;</p>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">帐号:</span>
                    <input type="text" id="name" name="user.name" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">密码:</span>
                    <input type="text" id="Pwd" name="user.Pwd" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">邮箱:</span>
                    <input type="text" id="Email" name="user.Email" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">手机:</span>
                    <input type="text" id="Mobile" name="user.Mobile" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">地址:</span>
                    <input type="text" id="Adress" name="user.Adress" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>                                                                
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">描述:</span>
                    <textarea id="description" name="user.description" cols="22" rows="3" style="width: 180px"></textarea>
                </div>
            </div>
        </form>
    </div>

    <div id="div_Toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick="AddUser();">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" plain="true" onclick="cancel();">取消</a>
    </div>


    <div id="div_Menu">
            <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="add();">增加</a>
                    <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-application_edit" plain="true" onclick="UpdateInfo()">修改</a>
                    <a href="#" id="txbDelte" class="easyui-linkbutton" iconcls="icon-delete" plain="true" onclick="deleteGroup()">删除</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-arrow_refresh" plain="true" onclick="refresh();">刷新</a>
    </div>

</html>

