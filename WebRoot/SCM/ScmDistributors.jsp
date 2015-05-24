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
    <script type="text/javascript" src="/web1/js/ScmDistributors.js"></script>  
     
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
                    <th style="width: 60px;">注册地址：
                    </th>
                    <td style="width: 350px;">
                             <input type="text" id="txtFAddress" name="txtFAddress" class="easyui-validatebox" style="width: 120px" value="" />&nbsp;
                   
                    </td>
                </tr>
                <tr>
                    <th style="width: 60px;">注册账号：
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

                            <a href="#" id="explort" class="easyui-linkbutton" iconcls="icon-page_white_excel" plain="true" onclick="exportExcel()">导出</a>
                    </td>
                </tr>
            </table>
            <input type="hidden" id="txtExcel" value="1" />
        </form>
    </div>
    <div region="center" style="background: #eee; overflow-y: hidden" split="true" id="center">
        <table id="dgScmDistributors">
        </table>
    </div>

    <!--------------------------信息的弹出层---------------------------->
    <div id="div_AddScmDistributors" title="分组信息" toolbar="#div_Toolbar" icon="icon-edit" style="width: 400px; height: 250px;" resizable="true" class="easyui-dialog" closed="true">
        <form id="frmScmDistributors" method="post" novalidate="novalidate">   
            <div style="height: 180px">                    
                    <input type="hidden" id="fdistributorid" name="scmdistributors.fdistributorid"/>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FParentID:</span>
                    <input type="text" id="fparentid" name="scmdistributors.fparentid" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FIncreaseID:</span>
                    <input type="text" id="fincreaseid" name="scmdistributors.fincreaseid" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FIntroducer:</span>
                    <input type="text" id="fintroducer" name="scmdistributors.fintroducer" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FIntroerType:</span>
                    <input type="text" id="fintroertype" name="scmdistributors.fintroertype" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FName:</span>
                    <input type="text" id="fname" name="scmdistributors.fname" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FPhone:</span>
                    <input type="text" id="fphone" name="scmdistributors.fphone" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FMobile:</span>
                    <input type="text" id="fmobile" name="scmdistributors.fmobile" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FAddress:</span>
                    <input type="text" id="faddress" name="scmdistributors.faddress" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FZipCode:</span>
                    <input type="text" id="fzipcode" name="scmdistributors.fzipcode" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FSex:</span>
                    <input type="text" id="fsex" name="scmdistributors.fsex" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FBirthday:</span>
                    <input type="text" id="fbirthday" name="scmdistributors.fbirthday" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FWeight:</span>
                    <input type="text" id="fweight" name="scmdistributors.fweight" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FHeight:</span>
                    <input type="text" id="fheight" name="scmdistributors.fheight" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FRemark:</span>
                    <input type="text" id="fremark" name="scmdistributors.fremark" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FPicture:</span>
                    <input type="text" id="fpicture" name="scmdistributors.fpicture" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FRelativeURL:</span>
                    <input type="text" id="frelativeurl" name="scmdistributors.frelativeurl" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FRank:</span>
                    <input type="text" id="frank" name="scmdistributors.frank" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FOrder:</span>
                    <input type="text" id="forder" name="scmdistributors.forder" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FAddTime:</span>
                    <input type="text" id="faddtime" name="scmdistributors.faddtime" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FUpdateTime:</span>
                    <input type="text" id="fupdatetime" name="scmdistributors.fupdatetime" class="easyui-validatebox" style="width: 180px" required="true" value="" />
                </div>
               
            </div>
        </form>
    </div>

    <div id="div_Toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick="AddScmDistributors();">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" plain="true" onclick="cancel();">取消</a>
    </div>


    <div id="div_Menu">
            <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="add();">增加</a>
                    <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-application_edit" plain="true" onclick="UpdateInfo()">修改</a>
                    <a href="#" id="txbDelte" class="easyui-linkbutton" iconcls="icon-delete" plain="true" onclick="DeleteScmDistributors()">删除</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-arrow_refresh" plain="true" onclick="refresh();">刷新</a>
    </div>

</html>


