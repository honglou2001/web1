<%@ page language="java" import="java.util.*,bean.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>推送消息管理</title>
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
    <script type="text/javascript" src="/web1/js/MsgPush.js"></script>       
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
    <div id="div_pushmsg" title="新增推送信息" toolbar="#div_PushToolbar" icon="icon-edit" style="width: 400px; height: 250px;" resizable="true" class="easyui-dialog" closed="true">
        <form id="frmpushmsg" method="post">   
            <div style="height: 180px">                    
                    <input type="hidden" id="fusrid" name="serialnumber.fusrid"/>
                    <br/>
                 <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">用户注册电话:</span>
                    <input type="text" id="fphonenum" name="serialnumber.fphonenum" class="easyui-validatebox"  readonly="readonly" style="width: 180px"/>
                </div>  
                 <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">推送类型:</span>                   
                    <select class="easyui-combobox" id="pushmsgtitle" name="pushmsgtitle" style="width:180px;" data-options="editable:false" required="true" missingMessage="推送类型必须选择">   
 						<option value="soundin">进电子围栏</option>
 						<option value="soundout">出电子围栏</option>	
 						<option value="soundcharge">充值提醒</option>	
 						<option value="soundbattery">电量提醒</option>											
 					</select>   					
                </div>                
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">推送内容:</span>
                    <input type="text" id="pushmsgcontent" name="pushmsgcontent" class="easyui-validatebox" style="width: 180px"  required="true" missingMessage="推送内容必须选择"/>
                </div>             
            </div>
        </form>
    </div>

    <div id="div_PushToolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick="UpdateSnPhoneNumber();">确定</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" plain="true" onclick="cancel();">取消</a>
    </div>
    
    

    
    <div id="div_Menu">
        <a href="#" id="btnRefPhone" class="easyui-linkbutton" iconcls="icon-add" plain="true"   onclick="UpdateInfo();">新增推送信息</a> 
        <a href="#" class="easyui-linkbutton" iconcls="icon-arrow_refresh" plain="true" onclick="refresh();">刷新</a>
    </div>

</html>


