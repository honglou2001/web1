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
    <script type="text/javascript" src="/web1/js/LocElectfence.js"></script>  
     
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
                    <th style="width: 60px;">手环序号：
                    </th>
                    <td style="width: 350px;">
                             <input type="text" id="txtFAddress" name="txtFAddress" class="easyui-validatebox" style="width: 120px" value="" />&nbsp;
                   
                    </td>
                </tr>
                <tr>
                    <th style="width: 60px;">变化状态：
                    </th>
                    <td>
                        <input id='txtFname' name='FDeviceID' class="easyui-combotree"
                            multiple="multiple" data-options="url:'/FeedReport/GetComboTree'" style="width: 217px;" />
                    </td>
                    <th>围栏名称：</th>
                    <td>
                        <input type="text" id="txtFMobile" name="txtFMobile" class="easyui-validatebox" style="width: 120px" value="" />&nbsp;

                            <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-search" plain="true" onclick="searchFun();">查询</a>
                            <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-clear" plain="true" onclick="clearbox()">清空</a>

<!--                             <a href="#" id="explort" class="easyui-linkbutton" iconcls="icon-page_white_excel" plain="true" onclick="exportExcel()">导出</a> -->
                    </td>
                </tr>
            </table>
            <input type="hidden" id="txtExcel" value="1" />
        </form>
    </div>
    <div region="center" style="background: #eee; overflow-y: hidden" split="true" id="center">
        <table id="dgLocElectfence">
        </table>
    </div>

    <!--------------------------信息的弹出层---------------------------->
    <div id="div_AddLocElectfence" title="分组信息" toolbar="#div_Toolbar" icon="icon-edit" style="width: 400px; height: 250px;" resizable="true" class="easyui-dialog" closed="true">
        <form id="frmLocElectfence" method="post">   
            <div style="height: 180px">                    
                    <input type="hidden" id="flocfenid" name="locelectfence.flocfenid"/>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FIncreaseID:</span>
                    <input type="text" id="fincreaseid" name="locelectfence.fincreaseid" class="easyui-validatebox" style="width: 180px"/>
                </div>
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FEltFenceID:</span> -->
<!--                     <input type="text" id="feltfenceid" name="locelectfence.feltfenceid" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FSerialnumber:</span>
                    <input type="text" id="fserialnumber" name="locelectfence.fserialnumber" class="easyui-validatebox" style="width: 180px"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FDataStatus:</span>
                    <input type="text" id="fdatastatus" name="locelectfence.fdatastatus" class="easyui-validatebox" style="width: 180px"/>
                </div>
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FFieldStatus:</span> -->
<!--                     <input type="text" id="ffieldstatus" name="locelectfence.ffieldstatus" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">fareanumber:</span>
                    <input type="text" id="fareanumber" name="locelectfence.fareanumber" class="easyui-validatebox" style="width: 180px"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">fareaname:</span>
                    <input type="text" id="fareaname" name="locelectfence.fareaname" class="easyui-validatebox" style="width: 180px"/>
                </div> 
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FEltLongitude:</span>
                    <input type="text" id="feltlongitude" name="locelectfence.feltlongitude" class="easyui-validatebox" style="width: 180px"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FEltLatitude:</span>
                    <input type="text" id="feltlatitude" name="locelectfence.feltlatitude" class="easyui-validatebox" style="width: 180px"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FEltScope:</span>
                    <input type="text" id="feltscope" name="locelectfence.feltscope" class="easyui-validatebox" style="width: 180px"/>
                </div>
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FEltAddress:</span> -->
<!--                     <input type="text" id="feltaddress" name="locelectfence.feltaddress" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FLongitude:</span>
                    <input type="text" id="flongitude" name="locelectfence.flongitude" class="easyui-validatebox" style="width: 180px"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FLatitude:</span>
                    <input type="text" id="flatitude" name="locelectfence.flatitude" class="easyui-validatebox" style="width: 180px"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FAddress:</span>
                    <input type="text" id="faddress" name="locelectfence.faddress" class="easyui-validatebox" style="width: 180px"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FDistance:</span>
                    <input type="text" id="fdistance" name="locelectfence.fdistance" class="easyui-validatebox" style="width: 180px"/>
                </div>
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FAddTime:</span> -->
<!--                     <input type="text" id="faddtime" name="locelectfence.faddtime" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FUpdateTime:</span>
                    <input type="text" id="fupdatetime" name="locelectfence.fupdatetime" class="easyui-validatebox" style="width: 180px"/>
                </div>
                               
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FRemark:</span>
                    <input type="text" id="fremark" name="locelectfence.fremark" class="easyui-validatebox" style="width: 180px"/>
                </div>
               
            </div>
        </form>
    </div>

    <div id="div_Toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick="AddLocElectfence();">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" plain="true" onclick="cancel();">取消</a>
    </div>


    <div id="div_Menu">
<!--             <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="add();">增加</a> -->
<!--                     <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-application_edit" plain="true" onclick="UpdateInfo()">修改</a> -->
<!--                     <a href="#" id="txbDelte" class="easyui-linkbutton" iconcls="icon-delete" plain="true" onclick="DeleteLocElectfence()">删除</a> -->
        <a href="#" class="easyui-linkbutton" iconcls="icon-arrow_refresh" plain="true" onclick="refresh();">刷新</a>
    </div>

</html>


