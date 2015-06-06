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
    <script type="text/javascript" src="/web1/js/BaseTypecode.js"></script>  
     
  </head>
<body class="easyui-layout" style="overflow-y: hidden;">
    
    <div region="center" style="background: #eee; overflow-y: hidden" split="true" id="center">
        <table id="dgBaseTypecode">
        </table>
    </div>

    <!--------------------------信息的弹出层---------------------------->
    <div id="div_AddBaseTypecode" title="分组信息" toolbar="#div_Toolbar" icon="icon-edit" style="width: 400px; height: 250px;" resizable="true" class="easyui-dialog" closed="true">
        <form id="frmBaseTypecode" method="post">   
            <div style="height: 180px">                    
                    <input type="hidden" id="ftypeid" name="basetypecode.ftypeid"/>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">参数名称:</span>
                    <input type="text" id="fname" name="basetypecode.fname" class="easyui-validatebox" style="width: 180px"  required="true" missingMessage="参数名称必须填写"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">参数编码:</span>
                    <input type="text" id="fcode" name="basetypecode.fcode" class="easyui-validatebox" style="width: 180px"  required="true" missingMessage="参数编码必须填写"/>
                </div>
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">参数数值:</span>
                    <input type="text" id="fvalue1" name="basetypecode.fvalue1" class="easyui-validatebox" style="width: 180px"  required="true" missingMessage="参数数值必须填写"/>
                </div> 
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">参数状态:</span>                   
                    <select class="easyui-combobox" id="fisdelete" name="basetypecode.fisdelete" style="width:180px;" data-options="editable:false" required="true" missingMessage="参数状态必须选择">   
 						<option value="2">审核通过</option>
						<option value="4">暂停使用</option>						
 					</select>   
 					
                </div> 
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">所属类别:</span>                   
                    <select class="easyui-combobox" id="fcategory" name="basetypecode.fcategory" style="width:180px;" data-options="editable:false" required="true" missingMessage="所属类别必须选择">   
 						<option value="1" selected>分销商</option>					
 					</select>   					
                </div>                
                <div class="a_left">
                    <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">参数备注:</span>                    
                    <textarea id="fremark" name="basetypecode.fremark" cols="22" rows="3" style="width: 180px"></textarea>
                </div>                       
            </div>
        </form>
    </div>

    <div id="div_Toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick="AddBaseTypecode();">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" plain="true" onclick="cancel();">取消</a>
    </div>


    <div id="div_Menu">
            <a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="add();">增加</a>
                    <a href="#" id="txbUpdate" class="easyui-linkbutton" iconcls="icon-application_edit" plain="true" onclick="UpdateInfo()">修改</a>
                    <a href="#" id="txbDelte" class="easyui-linkbutton" iconcls="icon-delete" plain="true" onclick="DeleteBaseTypecode()">删除</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-arrow_refresh" plain="true" onclick="refresh();">刷新</a>
    </div>

</html>


