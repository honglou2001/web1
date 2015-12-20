<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>邮件记录管理</title>
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
    <script type="text/javascript" src="/web1/js/Emailhistory.js"></script>  
     
  </head>
<body class="easyui-layout" style="overflow-y: hidden;">
    <div data-options="region:'north',collapsible:false,border:false,title:'查询条件'" style="height: 90px;"
        align="left">
        <form id="searchForm"  method="post" target="newWin">
            <table class="tableForm datagrid-toolbar" style="background-color: White;">
                <tr>

                    <th style="width: 60px;">发送时间：
                    </th>
                    <td style="min-width: 200px;">
                        <input id="txtStartTime" name="txtStartTime" class="easyui-datebox" style="width: 100px;" />&nbsp;&nbsp;-
                        <input id="txtEndTime" name="txtStartTime" class="easyui-datebox" style="width: 100px;" />
                    </td>
                    <th style="width: 60px;">目标邮箱：
                    </th>
                    <td style="width: 350px;">
                             <input type="text" id="txtFAddress" name="txtFAddress" class="easyui-validatebox" style="width: 120px" value="" />&nbsp;
                   
                    </td>
                </tr>
                <tr>
                    <th style="width: 60px;">注册用户：
                    </th>
                    <td>
                        <input id='txtFname' name='FDeviceID' class="easyui-combotree"
                            multiple="multiple" data-options="url:'/FeedReport/GetComboTree'" style="width: 217px;" />
                    </td>
                    <th>发送邮箱：</th>
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
        <table id="dgSerialnumberEmailhistory">
        </table>
    </div>

    <!--------------------------信息的弹出层---------------------------->
    <div id="div_AddSerialnumberEmailhistory" title="邮件正文" toolbar="#div_Toolbar" icon="icon-edit" style="width: 400px; height: 250px;" resizable="true" class="easyui-dialog" closed="true">
        <form id="frmSerialnumberEmailhistory" method="post">   
            <div style="height: 180px">                    
                    <input type="hidden" id="femailrecid" name="serialnumberemailhistory.femailrecid"/>
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FTemplateID:</span> -->
<!--                     <input type="text" id="ftemplateid" name="serialnumberemailhistory.ftemplateid" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FIncreaseID:</span> -->
<!--                     <input type="text" id="fincreaseid" name="serialnumberemailhistory.fincreaseid" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FAppId:</span> -->
<!--                     <input type="text" id="fappid" name="serialnumberemailhistory.fappid" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FUserID:</span> -->
<!--                     <input type="text" id="fuserid" name="serialnumberemailhistory.fuserid" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FSNID:</span> -->
<!--                     <input type="text" id="fsnid" name="serialnumberemailhistory.fsnid" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FSNNumber:</span> -->
<!--                     <input type="text" id="fsnnumber" name="serialnumberemailhistory.fsnnumber" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FLanguage:</span> -->
<!--                     <input type="text" id="flanguage" name="serialnumberemailhistory.flanguage" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FTag:</span> -->
<!--                     <input type="text" id="ftag" name="serialnumberemailhistory.ftag" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FTitle:</span> -->
<!--                     <input type="text" id="ftitle" name="serialnumberemailhistory.ftitle" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FToAddress:</span> -->
<!--                     <input type="text" id="ftoaddress" name="serialnumberemailhistory.ftoaddress" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FFromAddress:</span> -->
<!--                     <input type="text" id="ffromaddress" name="serialnumberemailhistory.ffromaddress" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FType:</span> -->
<!--                     <input type="text" id="ftype" name="serialnumberemailhistory.ftype" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
                <div class="a_left">
                <br/> <br/>
                   
                      <div id="contentdiv">
                      </div>
                     
                </div>
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FAattachment:</span> -->
<!--                     <input type="text" id="faattachment" name="serialnumberemailhistory.faattachment" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FDataStatus:</span> -->
<!--                     <input type="text" id="fdatastatus" name="serialnumberemailhistory.fdatastatus" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FFieldStatus:</span> -->
<!--                     <input type="text" id="ffieldstatus" name="serialnumberemailhistory.ffieldstatus" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FAddTime:</span> -->
<!--                     <input type="text" id="faddtime" name="serialnumberemailhistory.faddtime" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FUpdateTime:</span> -->
<!--                     <input type="text" id="fupdatetime" name="serialnumberemailhistory.fupdatetime" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
<!--                 <div class="a_left"> -->
<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FRemark:</span> -->
<!--                     <input type="text" id="fremark" name="serialnumberemailhistory.fremark" class="easyui-validatebox" style="width: 180px"/> -->
<!--                 </div> -->
               
            </div>
        </form>
    </div>

    <div id="div_Toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick="AddSerialnumberEmailhistory();">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" plain="true" onclick="cancel();">取消</a>
    </div>


    <div id="div_Menu">
<!--             <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="add();">增加</a> -->
                    <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-application_edit" plain="true" onclick="QueryInfo()">查看正文</a>
<!--                     <a href="#" id="txbDelte" class="easyui-linkbutton" iconcls="icon-delete" plain="true" onclick="DeleteSerialnumberEmailhistory()">删除</a> -->
        <a href="#" class="easyui-linkbutton" iconcls="icon-arrow_refresh" plain="true" onclick="refresh();">刷新</a>
    </div>

</html>


