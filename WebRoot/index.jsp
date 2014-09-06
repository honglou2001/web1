<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>jQuery.EasyUI- 1.2.2 应用实例</title>
    <link href="/web1/css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/web1/css/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/web1/css/icon.css" />
    <link href="/web1/css/syCss.css" rel="stylesheet" />
    <script type="text/javascript" src="/web1/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/web1/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/web1/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/web1/js/highcharts.js"></script>
    <script type="text/javascript" src="/web1/js/SysUtils.js"></script>
    <script type="text/javascript" src="/web1/js/outlook2.js"></script>
    <script type="text/javascript">
         var _menus = {"menus":[
						{"menuid":"1","icon":"icon-sys","menuname":"控件使用",
							"menus":[
									{"menuid":"12","menuname":"疯狂秀才","icon":"icon-add","url":"http://hxling.cnblogs.com"},
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
						},{"menuid":"56","icon":"icon-sys","menuname":"部门管理",
							"menus":[{"menuid":"31","menuname":"添加部门","icon":"icon-nav","url":"demo1.html"},
									{"menuid":"32","menuname":"部门列表","icon":"icon-nav","url":"demo2.html"}
								]
						},{"menuid":"28","icon":"icon-sys","menuname":"财务管理",
							"menus":[{"menuid":"41","menuname":"收支分类","icon":"icon-nav","url":"demo.html"},
									{"menuid":"42","menuname":"报表统计","icon":"icon-nav","url":"demo1.html"},
									{"menuid":"43","menuname":"添加支出","icon":"icon-nav","url":"demo2.html"}
								]
						},{"menuid":"39","icon":"icon-sys","menuname":"商城管理",
							"menus":[{"menuid":"51","menuname":"商品分类","icon":"icon-nav","url":"demo.html"},
									{"menuid":"52","menuname":"商品列表","icon":"icon-nav","url":"demo1.html"},
									{"menuid":"53","menuname":"商品订单","icon":"icon-nav","url":"demo2.html"}
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
                resizable: false
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

            $.post('/Authority/UpdatePwd?pwd=' + $newpass.val(), function (data) {
                if (data == "1") {
                    $.messager.alert("提示", '恭喜，密码修改成功！<br>您的新密码为：' + $newpass.val(), "info");
                    $newpass.val('');
                    $rePass.val('');
                    $('#w').window('close');
                    //close();
                }
                else {
                    $.messager.alert("提示", data, "error");
                }
            })
        }

        $(function () {

            openPwd();

            $('#editpass').click(function () {
                $('#w').window('open');
            });

            $('#btnEp').click(function () {
                serverLogin();
            })

            $('#btnCancel').click(function () { closePwd(); })

            $('#loginOut').click(function () {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function (r) {

                    if (r) {
                        location.href = '/Authority/Logout';
                    }
                });

            })
        });
    </script>
</head>
<body class="easyui-layout">
       <noscript>
        <div style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px; width: 100%; background: white; text-align: center;">
            <img src="/Content/themes/Images/noscript.gif" alt='抱歉，请开启脚本支持！' />
        </div>
    </noscript>
    <div id="loading-mask" style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; background: white;">
        <div id="pageloading" style="position: absolute; top: 50%; left: 50%; margin: -120px 0px 0px -120px; text-align: center; border: 2px solid #8DB2E3; width: 200px; height: 35px; font-size: 14px; padding: 10px; font-weight: bold; background: #fff; color: #15428B;">
            <img src="/Content/themes/Images/loading.gif" align="absmiddle" />
            正在加载中,请稍候...
        </div>
    </div>
	<div data-options="region:'north',border:false" class="logo" style="background: white; overflow: hidden; height: 45px; line-height: 20px;">
        <span style="float: right; padding-top: 15px; padding-right: 15px;">
        <input  class="easyui-combobox" id="FUnitID" name="FUnitID" style="width: 180px;border:none"/>
        <span style="margin: 0 40px 0 0;">欢迎您，<span style="font-weight: 300;">
        
       
         yantang           
       
!</span></span>
                <span style="margin: 0 20px 0 0; font-weight: 300;">软件版本:v1.0</span>
                <a href="#" id="editpass"  plain="true"  class="easyui-linkbutton">修改密码</a><a href="javascript:void(0);" id="loginOut"
                    plain="true" class="easyui-linkbutton" iconcls="icon-back">退出</a>
           
        </span>
        <span style="float:left; width:397px; margin-left:10px; margin-top:-2px">
            
            <img src="images/logo.png" runat="server" id="imgrn" alt="" style="height:100%; width:397px" />   
        </span>

	</div>
	<div data-options="region:'west',split:true,title:'导航菜单'" style="width:180px;">
              <div id="menuPanel" class="easyui-accordion" fit="true" border="false">
            <!--  导航内容 -->
        </div>
        </div>

	<div data-options="region:'south',border:false"  style="overflow: hidden;height: 30px; /*background: #D2E0F2;*/">

               
        <div style="text-align: center;">Copyright © 2010-2014 Winland Technologies, Inc. All Rights Reserved&nbsp;&nbsp;<a target="_blank" style=" color:Blue;" href="http://www.rntech.com.cn">http://www.rntech.com.cn</a></div>


	</div>
	<div id="mainPanle" data-options="region:'center'">
            <div id="tabs" class="easyui-tabs" fit="true" border="false">
            <div title="首页" iconcls="icon-application_home" style="padding: 1px; overflow: hidden;" id="home">
                <iframe class="iframe-self" scrolling="auto" frameborder="0" src="/Home/Main" style="padding: 0px 5px 5px 5px; width: 100%; height: 100%;"></iframe>
                

            </div>
        </div>
        <div id="mm-tabupdate"></div>
	</div>
     <!--修改密码窗口-->
    <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" style="width: 300px; height: 150px; padding: 5px; background: #fafafa;">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding="3">
                    <tr>
                        <td>新密码：</td>
                        <td>
                            <input id="txtNewPass" type="password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td>
                            <input id="txtRePass" type="password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">确定</a> <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
            </div>
        </div>
    </div>
        <div id="mm" class="easyui-menu" style="width: 150px;">
        <div id="mm-tabclose">关闭</div>
        <div id="mm-tabcloseall">全部关闭</div>
        <div id="mm-tabcloseother">除此之外全部关闭</div>
        <div class="menu-sep"></div>
        <div id="mm-tabcloseright">当前页右侧全部关闭</div>
        <div id="mm-tabcloseleft">当前页左侧全部关闭</div>
        <div class="menu-sep"></div>
        <div id="mm-exit">退出</div>
    </div>
    <script type="text/javascript" language="javascript">
             
        function refreshTab(title)
        {   
            if ($('#tabs').tabs('exists', title)) { //注意：此方法至适用刷新主页
                var currTab = $('#tabs').tabs('getTab', title),
                content = '<iframe class="iframe-self" scrolling="auto" frameborder="0"  src="/Home/Main" style="padding: 0px 5px 5px 5px;width:100%;height:100%;"></iframe>';
                $('#tabs').tabs('update', { tab: currTab, options: { content: content, closable: false } });
            }
        }
        //关闭当前tab
        function closeTab(title)
        {
            if ($('#tabs').tabs('exists', title)) {
                $('#tabs').tabs('close', title);
            }
        }

        $('#mm-tabupdate').click(function () {
            //debugger;
            var currTab = $('#tabs').tabs('getSelected');
            var url = $(currTab.panel('options').content).attr('src');
            $('#tabs').tabs('update', {
                tab: currTab,
                options: {
                    content: createFrame(url)
                }
            })
        })

        //除当前之外关闭所有
        function closeother(title) {
            //console.info(title);
            $(".tabs li").each(function (i, n) {
                var otherTitle = $(n).text();
                if (otherTitle != title) {
                    $('#tabs').tabs('close', otherTitle);
                }
            });
        };
        function createFrame(url) {
            var s = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
            return s;
        }
    </script>
    
</body>
</html>
   