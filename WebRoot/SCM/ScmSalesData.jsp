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
<script type="text/javascript" src="/web1/js/ScmSalesdata.js"></script>

</head>
<body class="easyui-layout" style="overflow-y: hidden;">
	<div
		data-options="region:'north',collapsible:false,border:false,title:'查询条件'"
		style="height: 60px;" align="left">
		<form id="searchForm" method="post" target="newWin">
			<table class="tableForm datagrid-toolbar"
				style="background-color: White;">
				<tr>
					<th style="width: 60px;">销售日期：</th>
					<td style="min-width: 200px;"><input id="sftimebegin"
						name="sftimebegin" class="easyui-datebox" style="width: 100px;" />&nbsp;&nbsp;-
						<input id="sftimeend" name="sftimeend" class="easyui-datebox"
						style="width: 100px;" /></td>
									
					<th>分销商名称：</th>
					<td><input type="text" id="sfdistributor" name="sfdistributor"
						class="easyui-validatebox" style="width: 217px" value="" />&nbsp;
						<a href="#" id="txbAdd" class="easyui-linkbutton"
						iconcls="icon-search" plain="true" onclick="searchFun();">查询</a> <a
						href="#" id="txbUpdate" class="easyui-linkbutton"
						iconcls="icon-clear" plain="true" onclick="clearbox()">清空</a> 
<!-- 						<a -->
<!-- 						href="#" id="explort" class="easyui-linkbutton" -->
<!-- 						iconcls="icon-page_white_excel" plain="true" -->
<!-- 						onclick="exportExcel()">导出</a> -->
						</td>
				</tr>
			</table>
			<input type="hidden" id="txtExcel" value="1" />
		</form>
	</div>
	<div region="center" style="background: #eee; overflow-y: hidden"
		split="true" id="center">
		<table id="dgScmSalesdata">
		</table>
	</div>

	<!--------------------------信息的弹出层---------------------------->
	<div id="div_AddScmSalesdata" title="分组信息" toolbar="#div_Toolbar"
		icon="icon-edit" style="width: 400px; height: 250px;" resizable="true"
		class="easyui-dialog" closed="true">
		<form id="frmScmSalesdata" method="post">
			<div style="height: 180px">
				<input type="hidden" id="fsaledataid"
					name="scmsalesdata.fsaledataid" />
				<div class="a_left">
					<span
						style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">所属分销商:</span>
					<input class="easyui-combobox" id="fdistributorid"
						name="scmsalesdata.fdistributorid" style="width:180px"
						required="true" missingMessage="所属分销商必须选择" >
				</div>
				<!--                 <div class="a_left"> -->
				<!--                     <span style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">FIncreaseID:</span> -->
				<!--                     <input type="text" id="fincreaseid" name="scmsalesdata.fincreaseid" class="easyui-validatebox" style="width: 180px" required="true" value="" /> -->
				<!--                 </div> -->
				<div class="a_left">
					<span
						style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">销售价格:</span>
					<input type="text" id="fprice" name="scmsalesdata.fprice"
						class="easyui-numberbox" style="width: 180px" required="true"
						precision="2" min="0.01" max="999999.99" size="8" maxlength="8"  style="text-align:right;" missingMessage="销售价格必须填写" />
				</div>
				<div class="a_left">
					<span
						style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">销售数量:</span>
					<input type="text" id="famount" name="scmsalesdata.famount"
						class="easyui-numberbox" style="width: 180px" required="true"
						value="" precision="0" min="1" max="9999999" size="8" maxlength="8"  style="text-align:right;" missingMessage="销售数量必须填写"/>
				</div>
				<div class="a_left">
					<span
						style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">销售类型:</span>
					<select class="easyui-combobox" id="ftype"
						name="scmsalesdata.ftype" style="width:180px;"  required="true" missingMessage="销售类型必须选择" >
						<option value="1">网络营销</option>
						<option value="2">市场营销</option>
					</select>
				</div>
				<div class="a_left">
					<span
						style="width: 75px; text-align: left; display: block; float: left; margin-left: 20px">销售日期:</span>
					<input type="text" id="fdate" name="scmsalesdata.fdate"
						class="easyui-datebox" style="width: 180px"  required="true" missingMessage="销售日期必须选择" 
						value="" />
				</div>
			</div>
		</form>
	</div>
    <div id="div_commissions" title="销售提成" style="width: 900px; height: 440px; left: 50px; top: 120px;" resizable="true" class="easyui-dialog" closed="true">
        <table id="dgcommissions">
        </table>
    </div>
	<div id="div_Toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconcls="icon-save" plain="true" onclick="AddScmSalesdata();">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconcls="icon-cancel" plain="true" onclick="cancel();">取消</a>
	</div>


	<div id="div_Menu">
		<a href="#" id="txbAdd" class="easyui-linkbutton" iconcls="icon-add"
			plain="true" onclick="add();">增加</a> <a href="#" id="txbUpdate"
			class="easyui-linkbutton" iconcls="icon-application_edit"
			plain="true" onclick="UpdateInfo()">修改</a> <a href="#" id="txbDelte"
			class="easyui-linkbutton" iconcls="icon-delete" plain="true"
			onclick="DeleteScmSalesdata()">删除</a> <a href="#"
			class="easyui-linkbutton" iconcls="icon-arrow_refresh" plain="true"
			onclick="refresh();">刷新</a>
	</div>
</html>