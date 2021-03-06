<%@ page language="java" import="java.util.*,bean.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>手表管理</title>
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
    <script type="text/javascript" src="/web1/js/SerialnumberFee.js"></script>  
     
  </head>
<body class="easyui-layout" style="overflow-y: hidden;">
    <div id="div_query" data-options="region:'north',collapsible:false,border:false,title:'查询条件'" style="height: 90px;"
        align="left">
        <form id="searchForm"  method="post" target="newWin">
            <table class="tableForm datagrid-toolbar" style="background-color: White;">
                <tr>

                    <th style="width: 90px;">是否注册：
                    </th>
                    <td style="width: 250px;">
                        <input type="checkbox" name="getIsReg" value="1" style="width: 20px;" />已注册序列号&nbsp;
                        <input type="checkbox" name="getIsReg" value="2" style="width: 20px;"/>未注册序列号&nbsp;
                    </td>
                    <th style="width: 90px;">是否在线：
                    </th>
                    <td style="width: 300px;">
                       <input type="checkbox" name="getIsOnline" value="1" style="width: 20px;"/>在线设备&nbsp;
                       <input type="checkbox" name="getIsOnline" value="2" style="width: 20px;"/>离线设备&nbsp;                  
                    </td>
                </tr>
                <tr>
                    <th>序列号名称：
                    </th>
                    <td >
                       <input type="text" id="txtSNnumber" name="txtSNnumber" class="easyui-validatebox" value="" />&nbsp;
                    </td>
                    <th>关联手机号：</th>
                    <td >
                        <input type="text" id="txtFMobile" name="txtFMobile" class="easyui-validatebox"  value="" />&nbsp;
                        <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-search" plain="true" onclick="UpdateInfo();">查询</a>
                        <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-clear" plain="true" onclick="UpdateInfo()">清空</a>

                    </td>
                </tr>
            </table>
            <input type="hidden" id="txtExcel" value="1" />
        </form>
    </div>
    <div  id="div_chargerecord" region="center" style="background: #eee; overflow-y: hidden" split="true" id="center">
        <table id="dgchargerecord">
        </table>
    </div>

    <!--------------------------信息的弹出层---------------------------->
    <div id="div_AddSerialnumber" title="设置手表手机号码及设置回拨模式" toolbar="#div_Toolbar" icon="icon-edit" style="width: 400px; height: 250px;" resizable="true" class="easyui-dialog" closed="true">
        <form id="frmSerialnumber" method="post">   
            <div style="height: 180px">                    
                    <input type="hidden" id="funiqueid" name="serialnumber.funiqueid"/>
                    <br/>
                 <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">序列号:</span>
                    <input type="text" id="serialnumber" name="serialnumber.serialnumber" class="easyui-validatebox"  readonly="readonly" style="width: 180px"/>
                </div>  
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">电话号码:</span>
                    <input type="text" id="fphonenum" name="serialnumber.fphonenum" class="easyui-validatebox" style="width: 180px"/>
                </div>  
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">回拨模式:</span>                   
                    <select class="easyui-combobox" id="fdatastatus" name="serialnumber.fdatastatus" style="width:180px;" data-options="editable:false" required="true" missingMessage="参数状态必须选择">   
 						<option value="4">默认模式</option>
 						<option value="2">全局直拨</option>												
 					</select>   					
                </div>            
            </div>
        </form>
    </div>

    <div id="div_Toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick="UpdateSnPhoneNumber();">保存手机号</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" plain="true" onclick="cancel();">取消</a>
    </div>
    
    

    
    <div id="div_Menu">
        <a href="#" id="btnRefPhone" class="easyui-linkbutton" iconcls="icon-add" plain="true"   onclick="UpdateInfo();">手动充值</a> 
<!--         <a href="#" id="btnApplyCallBack" class="easyui-linkbutton" iconcls="icon-application_edit" plain="true">推送信息</a> -->
        <a href="#" class="easyui-linkbutton" iconcls="icon-arrow_refresh" plain="true" onclick="refresh();">刷新</a>
    </div>

</html>


