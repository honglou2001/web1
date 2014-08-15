
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


//将时间年月日时转换成UTC格式，
//符合2000-01-01 06:30:00格式
function getDateUTC(time) {
    return Date.UTC(parseInt(time.substring(0, 4), 10), parseInt(time.substring(5, 7), 10) - 1, parseInt(time.substring(8, 10), 10), parseInt(time.substring(11, 13), 10), parseInt(time.substring(14, 16), 10), parseInt(time.substring(17, 19), 10), 0);
}

//利用正则将时间年月日时转换成UTC格式，
//符合2000-01-01 06:30:00或者2000-01-01格式
function getDateUTC1(time) {
    var pattern = /^([0-9]{4})-([0-9]{2})-([0-9]{2})\s([0-9]{2}):([0-9]{2}):([0-9]{2})$/g;
    var matches = pattern.exec(time);
    if (matches) {
        return Date.UTC(matches[1], matches[2] - 1, matches[3], matches[4], matches[5], matches[6], 0);
    } else {
        pattern = /^([0-9]{4})-([0-9]{2})-([0-9]{2})$/g;
        matches = pattern.exec(time);
        return Date.UTC(matches[1], matches[2] - 1, matches[3], 0, 0, 0, 0);
    }
}

function toDate(time) {
    var pattern = /^([0-9]{4})-([0-9]{2})-([0-9]{2})\s([0-9]{2}):([0-9]{2}):([0-9]{2})$/g;
    var matches = pattern.exec(time);
    return new Date(matches[1], matches[2], matches[3], matches[4], matches[5], matches[6]);
}

//time满足20132-08-01格式条件
function addDates(time, day) {
    var pattern = /^([0-9]{4})-([0-9]{2})-([0-9]{2})$/g;
    var matches = pattern.exec(time);

    var date = new Date(matches[1], parseInt(matches[2], 10) - 1, parseInt(matches[3], 10) + parseInt(day), 0, 0, 0);
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = m < 10 ? "0" + m : m;
    var d = date.getDate();
    d = d < 10 ? "0" + d : d;

    //update by zhougz  2014-5-7,加判断不能大于当前时间。
    var dateTime = new Date();
    //var dd = new Date(y + "-" + m + "-" + d);
    if (date <= dateTime) {
        return y + "-" + m + "-" + d;
    }
    else {
        var y1 = dateTime.getFullYear();
        var m1 = dateTime.getMonth() + 1;
        m1 = m1 < 10 ? "0" + m1 : m1;
        var d1 = dateTime.getDate();
        d1 = d1 < 10 ? "0" + d1 : d1;
       // alert("不能大于当前时间!")
        $.messager.alert("提示", "不能大于当前时间!", "info");
        return y1 + '-' + m1 + '-' + d1;
    }
}

//time满足20132-08-01格式条件
function addMonths(time, month) {
    var pattern = /^([0-9]{4})-([0-9]{2})-([0-9]{2})$/g;
    var matches = pattern.exec(time);

    var date = new Date(matches[1], parseInt(matches[2], 10) - 1 + parseInt(month), parseInt(matches[3], 10), 0, 0, 0);
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = m < 10 ? "0" + m : m;
    var d = date.getDate();
    d = d < 10 ? "0" + d : d;
    return y + "-" + m + "-" + d;
}



Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}


function GetDateDiff(startTime, endTime, diffType) {
    //将xxxx-xx-xx的时间格式，转换为 xxxx/xx/xx的格式  
    startTime = startTime.replace(/-/g, "/");
    endTime = endTime.replace(/-/g, "/");
    //将计算间隔类性字符转换为小写  
    diffType = diffType.toLowerCase();
    var sTime = new Date(startTime); //开始时间  
    var eTime = new Date(endTime); //结束时间  
    //作为除数的数字  
    var divNum = 1;
    switch (diffType) {
        case "second":
            divNum = 1000;
            break;
        case "minute":
            divNum = 1000 * 60;
            break;
        case "hour":
            divNum = 1000 * 3600;
            break;
        case "day":
            divNum = 1000 * 3600 * 24;
            break;
        default:
            break;
    }
    return parseInt((eTime.getTime() - sTime.getTime()) / parseInt(divNum)); //17jquery.com  
}

function setCookie(c_name, value, expiredays) {
    var exdate = new Date()
    exdate.setDate(exdate.getDate() + expiredays)
    document.cookie = c_name + "=" + escape(value) +
((expiredays == null) ? "" : ";expires=" + exdate.toGMTString())
}


function getCookie(c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=")
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1
            c_end = document.cookie.indexOf(";", c_start)
            if (c_end == -1) c_end = document.cookie.length
            return unescape(document.cookie.substring(c_start, c_end))
        }
    }
    return ""
}

//验证手机号码
function isDigit(s) {
    var patrn = /^[0-9]{1,20}$/;
    if (!patrn.exec(s)) return false
    return true
}

//验证邮箱
function CheckMail(mail) {
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (filter.test(mail)) return true;
    return false;
}


