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
    <script type="text/javascript" src="/web1/js/Serialnumber.js"></script>  
     
  </head>
<body class="easyui-layout" style="overflow-y: hidden;">
    <div data-options="region:'north',collapsible:false,border:false,title:'查询条件'" style="height: 90px;"
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
                        <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-search" plain="true" onclick="searchFun();">查询</a>
                        <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-clear" plain="true" onclick="clearbox()">清空</a>

                    </td>
                </tr>
            </table>
            <input type="hidden" id="txtExcel" value="1" />
        </form>
    </div>
    <div region="center" style="background: #eee; overflow-y: hidden" split="true" id="center">
        <table id="dgSerialnumber">
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
    
      <!--------------------------信息的弹出层---------------------------->
      <div id="div_getCliNumber" title="申请云之迅客户端号码，如已申请则查看，否则进行申请"  toolbar="#div_CliToolBar" icon="icon-edit" style="width: 400px; height: 250px;" resizable="true" class="easyui-dialog" closed="true">
        <form id="frmApplyClient" method="post">   
            <div style="height: 180px">                    
                    <input type="hidden" id="funiqueid1" name="serialnumber.funiqueid"/>
                     <br/>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">手表序列号:</span>
                    <input type="text" id="serialnumber1" name="serialnumber.serialnumber" class="easyui-validatebox"  readonly="readonly" style="width: 180px"/>
                </div>  
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">电话号码:</span>
                    <input type="text" id="fphonenum1" name="serialnumber.fphonenum" class="easyui-validatebox"  readonly="readonly" style="width: 180px"/>
                </div>  
                
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">初始费用:</span>
                    <input type="text" id="chargefee" name="chargefee" class="easyui-validatebox" style="width: 180px"/>
                </div>           
            </div>
        </form>
    </div>

    <div id="div_CliToolBar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick="GetClientNumber();">查询或获取云之迅客户端号码</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" plain="true" onclick="cancelApply();">取消</a>
    </div>

    <div id="div_chargerecord" title="手表-充值及消费记录" style="width: 750px; height: 450px;left: 50px; top: 20px;" resizable="true" class="easyui-dialog" closed="true">
        <table id="dgchargerecord">
        </table>
    </div>
   
   <!--------------------------信息的弹出层---------------------------->  
  <div id="div_pushmsg" title="新增推送信息" toolbar="#div_PushToolbar" icon="icon-edit" style="width: 400px; height: 250px;" resizable="true" class="easyui-dialog" closed="true">
        <form id="frmpushmsg" method="post">   
            <div style="height: 180px">                    
                    <input type="hidden" id="fmsgusrid" name="serialnumber.fusrid"/>
                    <br/>
                 <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">用户电话:</span>
                    <input type="text" id="fmsgphonenum" name="serialnumber.fphonenum" class="easyui-validatebox"  readonly="readonly" style="width: 180px"/>
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
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick="AddPushMsg();">确定</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" plain="true" onclick="cancelMsg();">取消</a>
    </div>
            
    <div id="div_Menu">
        <a href="#" id="btnRefPhone" class="easyui-linkbutton" iconcls="icon-add" plain="true"  onclick="UpdateInfo();">设置关联手机号及回拨模式</a> 
		<a href="#" id="btnApplyNumber" class="easyui-linkbutton" iconcls="icon-add" plain="true"  onclick="UpdateInfo1();">申请云之迅客户端号码</a>            
        <a href="#" id="btnChargeRec" class="easyui-linkbutton" iconcls="icon-add" plain="true"   onclick="QueryChargRecord();">查看充值及消费记录</a>
        <a href="#" id="btnPushMsg" class="easyui-linkbutton" iconcls="icon-application_edit" plain="true"  onclick="OpenPushDiv();">给对应用户APP推送信息</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-arrow_refresh" plain="true" onclick="refresh();">刷新</a>
    </div>

</html>


