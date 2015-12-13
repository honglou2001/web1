﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>jQuery.EasyUI- 1.2.6 后台经典框架使用DEMO</title>
    <link href="css/default.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css" href="js/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="js/themes/icon.css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min172.js"></script>
	<script type="text/javascript" src='js/XiuCai.index.js'> </script>

    <script type="text/javascript">

// 	var _menus = {
// 	"menus": [{
// 		"menuid": "1",
// 		"icon": "icon-sys",
// 		"menuname": "控件使用",
// 		"menus": [{
// 			"menuid": "12",
// 			"menuname": "管理后台",
// 			"icon": "icon-add",
// 			"url": "http://www.baidu.com",
// 			"child": [{
// 				"menuid": "140",
// 				"menuname": "角色管理 3",
// 				"icon": "icon-role",
// 				"url": "List.action"
// 			},
// 			{
// 				"menuid": "150",
// 				"menuname": "权限设置 3",
// 				"icon": "icon-set",
// 				"url": "demo.html"
// 			}]
// 		},
// 		{
// 			"menuid": "13",
// 			"menuname": "用户管理",
// 			"icon": "icon-users",
// 			"url": "demo2.html",
// 			"child": [{
// 				"menuid": "141",
// 				"menuname": "角色管理 3",
// 				"icon": "icon-role",
// 				"url": "demo2.html"
// 			},
// 			{
// 				"menuid": "151",
// 				"menuname": "权限设置 3",
// 				"icon": "icon-set",
// 				"url": "demo.html"
// 			}]
// 		},
// 		{
// 			"menuid": "14",
// 			"menuname": "角色管理",
// 			"icon": "icon-role",
// 			"url": "demo2.html",
// 			"child": [{
// 				"menuid": "142",
// 				"menuname": "角色管理 3",
// 				"icon": "icon-role",
// 				"url": "demo2.html"
// 			},
// 			{
// 				"menuid": "152",
// 				"menuname": "权限设置 3",
// 				"icon": "icon-set",
// 				"url": "demo.html"
// 			}]
// 		},
// 		{
// 			"menuid": "15",
// 			"menuname": "权限设置",
// 			"icon": "icon-set",
// 			"url": "demo.html",
// 			"child": [{
// 				"menuid": "143",
// 				"menuname": "角色管理 3",
// 				"icon": "icon-role",
// 				"url": "demo2.html"
// 			},
// 			{
// 				"menuid": "153",
// 				"menuname": "权限设置 3",
// 				"icon": "icon-set",
// 				"url": "demo.html"
// 			}]
// 		},
// 		{
// 			"menuid": "16",
// 			"menuname": "系统日志",
// 			"icon": "icon-log",
// 			"url": "demo1.html",
// 			"child": [{
// 				"menuid": "144",
// 				"menuname": "角色管理 3",
// 				"icon": "icon-role",
// 				"url": "demo2.html"
// 			},
// 			{
// 				"menuid": "154",
// 				"menuname": "权限设置 3",
// 				"icon": "icon-set",
// 				"url": "demo.html"
// 			}]
// 		}]
// 	},
// 	{
// 		"menuid": "8",
// 		"icon": "icon-sys",
// 		"menuname": "员工管理",
// 		"menus": [{
// 			"menuid": "21",
// 			"menuname": "员工列表",
// 			"icon": "icon-nav",
// 			"url": "demo.html"
// 		},
// 		{
// 			"menuid": "22",
// 			"menuname": "视频监控",
// 			"icon": "icon-nav",
// 			"url": "demo1.html",
// 			"child": [{
// 				"menuid": "221",
// 				"menuname": "员工列表 3",
// 				"icon": "icon-nav",
// 				"url": "demo.html"
// 			},
// 			{
// 				"menuid": "222",
// 				"menuname": "视频监控 3",
// 				"icon": "icon-nav",
// 				"url": "demo1.html"
// 			}]
// 		}]
// 	},
// 	{
// 		"menuid": "56",
// 		"icon": "icon-sys",
// 		"menuname": "部门管理",
// 		"menus": [{
// 			"menuid": "31",
// 			"menuname": "添加部门",
// 			"icon": "icon-nav",
// 			"url": "demo1.html"
// 		},
// 		{
// 			"menuid": "321",
// 			"menuname": "部门列表",
// 			"icon": "icon-nav",
// 			"url": "demo2.html",
// 			"child": [{
// 				"menuid": "311",
// 				"menuname": "添加部门 4",
// 				"icon": "icon-nav",
// 				"url": "demo1.html"
// 			},
// 			{
// 				"menuid": "312",
// 				"menuname": "部门列表 4",
// 				"icon": "icon-nav",
// 				"url": "demo2.html"
// 			}]
// 		}]
// 	}
// 	,{"menuid":"51","icon":"icon-sys","menuname":"设备管理",
// 							"menus":[
// 							{"menuid":"60","menuname":"设备信息","icon":"icon-nav","url":"snnumber.action"},
// 							{"menuid":"61","menuname":"定位查询","icon":"icon-nav","url":"LocElt.action"}
// 								]
// 						}]
	
	
// };

var _menus = {"menus":[
						{"menuid":"1","icon":"icon-sys","menuname":"控件使用",
							"menus":[
									{"menuid":"12","menuname":"疯狂秀才","icon":"icon-add","url":"#"},
									{"menuid":"13","menuname":"用户管理","icon":"icon-users","url":"demo2.html"},
									{"menuid":"14","menuname":"角色管理","icon":"icon-role","url":"demo2.html"},
									{"menuid":"15","menuname":"权限设置","icon":"icon-set","url":"demo.html"},
									{"menuid":"16","menuname":"系统日志","icon":"icon-log","url":"demo1.html"}
								]
						},{"menuid":"8","icon":"icon-sys","menuname":"权限管理",
							"menus":[{"menuid":"21","menuname":"员工列表","icon":"icon-nav","url":"List.action"},
									{"menuid":"22","menuname":"菜单管理","icon":"icon-nav","url":"Menu.action"},
									{"menuid":"23","menuname":"角色管理","icon":"icon-nav","url":"Roles.action"}
								]
						},{"menuid":"56","icon":"icon-sys","menuname":"分销管理",
							"menus":[
									{"menuid":"31","menuname":"提成比例设置","icon":"icon-nav","url":"Btype.action"},
									{"menuid":"32","menuname":"分销商管理","icon":"icon-nav","url":"ScmDistor.action"},
									{"menuid":"33","menuname":"销售及分成","icon":"icon-nav","url":"ScmSales.action"}
								]
						},{"menuid":"28","icon":"icon-sys","menuname":"财务管理",
							"menus":[{"menuid":"41","menuname":"收支分类","icon":"icon-nav","url":"demo.html"},
									{"menuid":"42","menuname":"报表统计","icon":"icon-nav","url":"demo1.html"},
									{"menuid":"43","menuname":"添加支出","icon":"icon-nav","url":"demo2.html"}
								]
						},{"menuid":"39","icon":"icon-sys","menuname":"商城管理",
							"menus":[{"menuid":"51","menuname":"商品分类","icon":"icon-nav","url":"LocElt1.action"},
									{"menuid":"52","menuname":"商品列表","icon":"icon-nav","url":"demo1.html"},
									{"menuid":"53","menuname":"商品订单","icon":"icon-nav","url":"demo2.html"}
								]
						},{"menuid":"51","icon":"icon-sys","menuname":"设备管理",
							"menus":[
							{"menuid":"60","menuname":"设备信息","icon":"icon-nav","url":"snnumber.action"},
							{"menuid":"61","menuname":"定位查询","icon":"icon-nav","url":"LocElt.action"}
								]
						}
				]};

        //设置登录窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable:false
            });
        }
        //关闭登录窗口
        function closePwd() {
            $('#w').window('close');
        }

        

        //修改密码
        function serverLogin() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }

            $.post('/ajax/editpassword.ashx?newpass=' + $newpass.val(), function(msg) {
                msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
                $newpass.val('');
                $rePass.val('');
                close();
            })
            
        }

        $(function() {

            openPwd();

            $('#editpass').click(function() {
                $('#w').window('open');
            });

            $('#btnEp').click(function() {
                serverLogin();
            })

			$('#btnCancel').click(function(){closePwd();})

            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                    if (r) {
                        location.href = '/ajax/loginout.ashx';
                    }
                });
            })
        });
		
		

    </script>

</head>
<body class="easyui-layout" style="overflow-y: hidden"  fit="true"   scroll="no">
<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>

<div id="loading-mask" style="position:absolute;top:0px; left:0px; width:100%; height:100%; background:#D2E0F2; z-index:20000">
<div id="pageloading" style="position:absolute; top:50%; left:50%; margin:-120px 0px 0px -120px; text-align:center;  border:2px solid #8DB2E3; width:200px; height:40px;  font-size:14px;padding:10px; font-weight:bold; background:#fff; color:#15428B;"> 
    <img src="images/loading.gif" align="absmiddle" /> 正在加载中,请稍候...</div>
</div>

    <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: url(images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">欢迎 用户 <a href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px; font-size: 16px; "><img src="images/blocks.gif" width="20" height="20" align="absmiddle" /> 后台管理系统</span>
    </div>
    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer">By 小猪嘟嘟后台管理 jQuery.Easy-UI QQ讨论群： 112044258、32994605、36534121、56271061</div>
    </div>
    <div region="west" split="true"  title="导航菜单" style="width:180px;" id="west">
			<div id="nav">
		<!--  导航内容 -->
				
			</div>

    </div>
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" style="padding:20px;overflow:hidden; color:red; " >
				<h1 style="font-size:24px;">* 小猪嘟嘟后台管理-人员、设备、数据管理</h1>
<h1 style="font-size:24px;">* BLOG: <a style="font-size:24px;color:green;" href="http://hxling.cnblogs.com">博客</a></h1>
<h1 style="font-size:24px;">* 讨论群：112044258、32994605、36534121、56271061</h1>
				<h1 style="font-size:24px;">* 广告：</h1>
			</div>
		</div>
    </div>
    
    
    <!--修改密码窗口-->
    <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >
                    确定</a> <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
            </div>
        </div>
    </div>

	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="close">关闭</div>
		<div id="closeall">全部关闭</div>
		<div id="closeother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="closeright">当前页右侧全部关闭</div>
		<div id="closeleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="exit">退出</div>
	</div>


</body>
</html>