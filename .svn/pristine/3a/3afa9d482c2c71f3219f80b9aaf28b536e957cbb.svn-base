$.extend($.fn.validatebox.defaults.rules, {
    idcard: {// 验证身份证
        validator: function (value) {
            return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
        },
        message: '身份证号码格式不正确'
    },
    minLength: {
        validator: function (value, param) {
            return value.length >= param[0];
        },
        message: '请输入至少（2）个字符.'
    },
    length: { validator: function (value, param) {
        var len = $.trim(value).length;
        return len >= param[0] && len <= param[1];
    },
        message: "输入内容长度必须介于{0}和{1}之间."
    },
    phone: {// 验证电话号码
        validator: function (value) {
            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
        },
        message: '格式不正确,请使用下面格式:020-88888888'
    },
    mobile: {// 验证手机号码
        validator: function (value) {
            return /^(13|15|18)\d{9}$/i.test(value);
        },
        message: '手机号码格式不正确'
    },
    intOrFloat: {// 验证整数或小数
        validator: function (value) {
            return /^\d+(\.\d+)?$/i.test(value);
        },
        message: '请输入数字，并确保格式正确'
    },
    currency: {// 验证货币
        validator: function (value) {
            return /^\d+(\.\d+)?$/i.test(value);
        },
        message: '货币格式不正确'
    },
    qq: {// 验证QQ,从10000开始
        validator: function (value) {
            return /^[1-9]\d{4,9}$/i.test(value);
        },
        message: 'QQ号码格式不正确'
    },
    integer: {// 验证整数 可正负数
        validator: function (value) {
            //return /^[+]?[1-9]+\d*$/i.test(value);

            return /^([+]?[0-9])|([-]?[0-9])+\d*$/i.test(value);
        },
        message: '请输入整数'
    },
    age: {// 验证年龄
        validator: function (value) {
            return /^(?:[1-9][0-9]?|1[01][0-9]|120)$/i.test(value);
        },
        message: '年龄必须是0到120之间的整数'
    },

    chinese: {// 验证中文
        validator: function (value) {
            return /^[\Α-\￥]+$/i.test(value);
        },
        message: '请输入中文'
    },
    english: {// 验证英语
        validator: function (value) {
            return /^[A-Za-z]+$/i.test(value);
        },
        message: '请输入英文'
    },
    unnormal: {// 验证是否包含空格和非法字符
        validator: function (value) {
            return /.+/i.test(value);
        },
        message: '输入值不能为空和包含其他非法字符'
    },
    username: {// 验证用户名
        validator: function (value) {
            return /^[a-zA-Z][a-zA-Z0-9_]{5,15}$/i.test(value);
        },
        message: '用户名不合法（字母开头，允许6-16字节，允许字母数字下划线）'
    },
    faxno: {// 验证传真
        validator: function (value) {
            //            return /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/i.test(value);
            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
        },
        message: '传真号码不正确'
    },
    zip: {// 验证邮政编码
        validator: function (value) {
            return /^[1-9]\d{5}$/i.test(value);
        },
        message: '邮政编码格式不正确'
    },
    ip: {// 验证IP地址
        validator: function (value) {
            return /d+.d+.d+.d+/i.test(value);
        },
        message: 'IP地址格式不正确'
    },
    name: {// 验证姓名，可以是中文或英文
        validator: function (value) {
            return /^[\Α-\￥]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
        },
        message: '请输入姓名'
    },
    date: {// 验证姓名，可以是中文或英文
        validator: function (value) {
            //格式yyyy-MM-dd或yyyy-M-d
            return /^(?:(?!0000)[0-9]{4}([-]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-]?)0?2\2(?:29))$/i.test(value);
        },
        message: '清输入合适的日期格式'
    },
    msn: {
        validator: function (value) {
            return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value);
        },
        message: '请输入有效的msn账号(例：abc@hotnail(msn/live).com)'
    },
    same: {
        validator: function (value, param) {
            if ($("#" + param[0]).val() != "" && value != "") {
                return $("#" + param[0]).val() == value;
            } else {
                return true;
            }
        },
        message: '两次输入的密码不一致！'
    }
});

function addTabExt(subtitle, url, icon) {
    //console.info(self);
    var $parent = self.parent.$;
    if (!$parent('#tabs').tabs('exists', subtitle)) {
        $parent('#tabs').tabs('add', {
            title: subtitle,
            content: createFrameExt(url),
            closable: true,
            icon: icon
        });
    } else {
        $parent('#tabs').tabs('close', subtitle);
        $parent('#tabs').tabs('add', {
            title: subtitle,
            content: createFrameExt(url),
            closable: true,
            icon: icon
        });
    }
}

function createFrameExt(url) {
    var s = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
    return s;
}

var today = new Date();

$(function () {
    /* 获取地址参数 */
    $.getUrlParam = function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        //console.info(r);
        //if (r != null) return unescape(r[2]);
        if (r != null) return decodeURI(r[2]);
        return null;
    };

    $.getDate = function (dt) {
        //console.info(dt); 
        var fdate = dt || (new Date());
        var y = fdate.getFullYear();
        var m = fdate.getMonth() + 1;
        m = m < 10 ? "0" + m : m;
        var d = fdate.getDate();
        d = d < 10 ? "0" + d : d;
        return y + "-" + m + "-" + d;
    }
})

/*
将form表单元素中的值序列化成对像
*/
function SerializeObject(vform) {
    var o = {};
    //console.info(vform);
    $.each(vform.serializeArray(), function (index) {
        if (o[this['name']]) {
            o[this['name']] = o[this['name']] + ',' + this['value'];
        }
        else {
            o[this['name']] = this['value'];
        }
    });
    return o;
}

/*
将form表单元素中的值序列化成对像(编码)
*/
function EncodeSerializeObject(vform) {
    var o = {};
    $.each(vform.serializeArray(), function (index) {
        if (o[this['name']]) {
            o[this['name']] = o[this['name']] + ',' + escape(this['value']);
        }
        else {
            o[this['name']] = this['value'];
        }
    });
    return o;
}

function GetArgumentFromUrl(url) {
    var returnObj = {};
    //构造参数对象并初始化 
    var name, value = '', i;
    var str = url.toLowerCase(); //获得浏览器地址栏URL串
    var num = str.indexOf("?")
    if (num < 0) return;
    str = str.substr(num + 1); //截取“?”后面的参数串
    var arrtmp = str.split("&"); //将各参数分离形成参数数组
    for (i = 0; i < arrtmp.length; i++) {
        num = arrtmp[i].indexOf("=");
        if (num > 0) {
            name = arrtmp[i].substring(0, num); //取得参数名称
            value = arrtmp[i].substr(num + 1); //取得参数值
            returnObj[name] = value; //定义对象属性并初始化
        }
    }
    return returnObj;
}

//系统中不实现此功能
function CheckStartDate(startCtrlId, endCtrlName) {
    startCtrlId.datebox({
        onSelect: function (date) {
            var endDate = $("input[name='" + endCtrlName + "']").val();
            if (endDate != "") {
                var dtTemp = new Date(Date.parse(endDate.replace(/-/g, "/")));
                //console.info(date);
                //console.info(dtTemp);
                if (date > dtTemp) {
                    startCtrlId.datebox('setValue', endDate);
                    //startCtrlId.focus();
                    $.messager.alert("警告", "开始日期不能大于结束日期", "warning");
                }
            }
        }
    });
}

function CheckEndDate(startCtrlName, endCtrlId) {
    endCtrlId.datebox({
        onSelect: function (date) {
            var startDate = $("input[name='" + startCtrlName + "']").val();
            if (startDate != "") {
                var dtTemp = new Date(Date.parse(startDate.replace(/-/g, "/")));
                if (date < dtTemp) {
                    endCtrlId.datebox('setValue', startDate);
                    //endCtrlId.focus();
                    $.messager.alert("警告", "结束日期不能小于开始日期", "warning");
                }
            }
        }
    });
}

function addTabExt(subtitle, url, icon) {
    //console.info(self);
    var $parent = self.parent.$;
    if (!$parent('#tabs').tabs('exists', subtitle)) {
        $parent('#tabs').tabs('add', {
            title: subtitle,
            content: createFrameExt(url),
            closable: true,
            icon: icon
        });
    } else {
        $parent('#tabs').tabs('close', subtitle);
        $parent('#tabs').tabs('add', {
            title: subtitle,
            content: createFrameExt(url),
            closable: true,
            icon: icon
        });
    }
}

function createFrameExt(url) {
    var s = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
    return s;
}

function GetHighChart(title, renderTo, yAxisName, isLegend) {
    var highChart = new Highcharts.Chart({
        chart: {
            renderTo: renderTo,
            shadow: false,
            //            defaultSeriesType: systel,
            //            width: width,
            //            height: height,
            //            marginTop: 50,
            //            marginLeft: 60,
            marginRight: 10,
            //            marginBottom: 50,
            plotBackgroundColor: null,
            //plotBorderColor: '#69ABC8',
            plotBorderWidth: 0
        },
        title: {
            text: title,
            style: { color: '#000', fontSize: '14px', fontWeight: '600' }
        },
        subtitle: {
            //            text: CurentTime(),
            text: "",
            style: { color: '#000', fontSize: '11px' }
        },
        labels: {
            items: [
            //            {
            //                //标签代码（html代码）
            //                html: '<div style="font-size:12px; color:#000;">耳号：123</div><br/>',
            //                style: { //设置标签位置
            //                    left: '510px',
            //                    top: '40px'
            //                }
            //            }
            ],
            style: {    //设置标签颜色
                color: 'rgb(0,0,255)'
            }
        },
        credits: {
            href: 'http://www.rntech.com.cn ',
            text: '润农科技'
        },
        xAxis: {
            title: { text: '时间', style: { fontSize: '10px', padding: '20px' } },
            categories: [],
            labels: { rotation: -45, style: { fontSize: '12px' } }
        },
        yAxis: {
            min: 0,
            title: { text: yAxisName, style: { fontSize: '12px', padding: '20px' } }
        },
        legend: {
            enabled: isLegend,
            layout: 'vertical',
            floating: true,
            backgroundColor: '#FFFFFF',
            align: 'right',
            verticalAlign: 'middle',
            x: 0
        },
        tooltip: {
            formatter: function () {
                //return '' + this.x + ': ' + this.y;
                return '' + this.y;
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                shadow: false,
                enableMouseTracking: false
            },
            enabled: true,
            column: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false,
                pointPadding: 0.2,
                borderWidth: 0,
                pointWidth: 10,
                shadow: false
            }
        },
        series: []
    });
    return highChart;
}




