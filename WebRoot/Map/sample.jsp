<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!-- saved from url=(0039)http://zhaoziang.com/amap/zero_2_1.html -->
<!DOCTYPE html PUBLIC "" ""><HTML><HEAD><META content="IE=11.0000" 
http-equiv="X-UA-Compatible">
 
<META http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<TITLE>地图控件</TITLE>
<link rel="stylesheet" type="text/css" href="../css/mapzero.css" />
<SCRIPT language="javascript" src="http://webapi.amap.com/maps?v=1.2&amp;key=0a7e4fbdc57180d7411aa41ca5a7ade1"></SCRIPT>
 
<META name="GENERATOR" content="MSHTML 11.00.10240.16603"></HEAD> 
<BODY onload="mapInit()">
<DIV id="iCenter"></DIV>
<DIV id="iControlbox">
<UL>
  <LI><BUTTON onclick="javascript:toolBarShow();">显示完整鱼骨</BUTTON><BUTTON 
  onclick="javascript:toolBar.hide();">隐藏鱼骨</BUTTON><BUTTON onclick="javascript:toolBarDirection();">方向盘</BUTTON><BUTTON 
  onclick="javascript:toolBarLong();">长标尺</BUTTON><BUTTON onclick="javascript:toolBarShot();">短标尺</BUTTON></LI>
  <LI><BUTTON onclick="javascript:scale.show();">显示比例尺</BUTTON><BUTTON onclick="javascript:scale.hide();">隐藏比例尺</BUTTON></LI>
  <LI><BUTTON onclick="javascript:overView.show();">显示鹰眼</BUTTON><BUTTON 
  onclick="javascript:overView.hide();">隐藏鹰眼</BUTTON></LI>
  <LI><BUTTON onclick="javascript:iMapType();">添加地图类型切换</BUTTON><BUTTON onclick="javascript:removeMapType();">移除地图类型切换</BUTTON></LI>
  <LI><BUTTON onclick="javascript:iCircleEditor();">添加圆形编辑器</BUTTON><BUTTON 
  onclick="javascript:removeCicleEditor();">删除圆形编辑器</BUTTON></LI>
  <LI><BUTTON onclick="javascript:iPloygonEditor();">添加多边形编辑器</BUTTON><BUTTON 
  onclick="javascript:removePloygonEditor();">删除多边形编辑器</BUTTON></LI>
  <LI><BUTTON onclick="javascript:iMarker();">鼠标打点工具</BUTTON><BUTTON onclick="javascript:removeMouseTool();">清除</BUTTON></LI>
  <LI><BUTTON onclick="javascript:iPolyline();">鼠标画折线工具</BUTTON><BUTTON onclick="javascript:removeMouseTool();">清除</BUTTON></LI>
  <LI><BUTTON onclick="javascript:iPolygon();">鼠标画多边形工具</BUTTON><BUTTON onclick="javascript:removeMouseTool();">清除</BUTTON></LI>
  <LI><BUTTON onclick="javascript:iCircle();">鼠标画圆形工具</BUTTON><BUTTON onclick="javascript:removeMouseTool();">清除</BUTTON></LI>
  <LI><BUTTON onclick="javascript:iRectangle();">鼠标画矩形工具</BUTTON><BUTTON 
  onclick="javascript:removeMouseTool();">清除</BUTTON></LI>
  <LI><BUTTON onclick="javascript:iRule();">鼠标测距工具</BUTTON><BUTTON onclick="javascript:removeMouseTool();">清除</BUTTON></LI>
  <LI><BUTTON onclick="javascript:iMeasureArea();">鼠标测面积</BUTTON><BUTTON 
  onclick="javascript:removeMouseTool();">移除</BUTTON></LI>
  <LI><BUTTON onclick="javascript:iRectZoomIn();">鼠标框选缩小</BUTTON><BUTTON 
  onclick="javascript:iRectZoomOut();">鼠标框选放大</BUTTON><BUTTON onclick="javascript:removeRangingTool();">关闭鼠标放大缩小</BUTTON></LI>
  <LI><BUTTON onclick="javascript:iRangingTool();">测距插件</BUTTON><BUTTON onclick="javascript:removeRangingTool();">隐藏测距</BUTTON></LI>
  <LI><BUTTON onclick="javascript:myControl();">添加自定义控件</BUTTON><BUTTON onclick="javascript:removeMyControl();">移除自定义控件</BUTTON></LI></UL></DIV><!-- tongji begin--> 

<SCRIPT language="javascript">
var mapObj;
var scale;
var mapType;
var toolBar;
var overView;
var circleEditor;
var circle;
var polygonEditor;
var polygon;
var homeControl;
var controlUI;
var ruler;
var mousetool;
function mapInit(){
    mapObj = new AMap.Map("iCenter",{
		center:new AMap.LngLat(116.397728,39.90423), //地图中心点
		level:13  //地图显示的比例尺级别
	});
	mapObj.plugin(["AMap.ToolBar"],function(){   //在地图中添加ToolBar插件
        toolBar = new AMap.ToolBar();
        mapObj.addControl(toolBar);
    });
    mapObj.plugin(["AMap.Scale"],function(){    //加载比例尺插件
        scale = new AMap.Scale();
        mapObj.addControl(scale);
		scale.show();
    });
	mapObj.plugin(["AMap.OverView"],function(){  //在地图中添加鹰眼插件
        //加载鹰眼
        overView = new AMap.OverView({
            visible:true //初始化显示鹰眼
        });
        mapObj.addControl(overView);
		overView.open(); //展开鹰眼
    });
	mapObj.plugin(["AMap.RangingTool"],function(){   
		ruler = new AMap.RangingTool(mapObj);   
		AMap.event.addListener(ruler,"end",function(e){  
            ruler.turnOff();  
         });  		
	}); 
	mapObj.plugin(["AMap.MouseTool"],function(){ 	   //鼠标工具插件
		mousetool = new AMap.MouseTool(mapObj);   		  
	});
}
function toolBarShow(){
	toolBar.show();
	toolBar.showRuler();
	toolBar.showDirection();
}
function toolBarDirection(){
	toolBar.show();
	toolBar.showDirection();
	toolBar.hideRuler();
}
function toolBarLong(){
	toolBar.show();
	toolBar.hideDirection();
	toolBar.showRuler();
}
function toolBarShot(){
	toolBar.show();
	toolBar.hideRuler();
	toolBar.hideDirection();
}
function iMapType(){
	mapObj.plugin(["AMap.MapType"],function(){  //添加地图类型切换插件
        //地图类型切换
        mapType= new AMap.MapType({defaultType:1,showRoad:true});
        mapObj.addControl(mapType);
    });
}
function removeMapType(){
	mapObj.removeControl(mapType);
}
function iCircleEditor(){    //圆形编辑器
	circle = new AMap.Circle({   //圆形编辑器的样式
		map: mapObj,
		center:new AMap.LngLat("116.40332221984863","39.90025505675715"),
		radius:1000,
		strokeColor: "#F33",
		strokeOpacity: 1,
		strokeWeight: 3,
		fillColor: "ee2200",
		fillOpacity: 0.35
	});
	mapObj.plugin(["AMap.CircleEditor"],function(){
		circleEditor = new AMap.CircleEditor(mapObj,circle);   //创建圆形编辑器对象
		circleEditor.open();    //打开圆形编辑器
	});
}
function removeCicleEditor(){ //关闭圆形编辑器，隐藏圆形
	circleEditor.close();
	circle.hide();
}

function iPloygonEditor(){      //编辑多边形
    var arr=new Array();//经纬度坐标数组
    arr.push(new AMap.LngLat("116.403322","39.920255"));
    arr.push(new AMap.LngLat("116.410703","39.897555"));
    arr.push(new AMap.LngLat("116.402292","39.892353"));
    arr.push(new AMap.LngLat("116.389846","39.891365"));
    polygon = new AMap.Polygon({
        path:arr,    //设置多边形轮廓的节点数组
        strokeColor:"#0000ff",
        strokeOpacity:0.2,
        strokeWeight:3,
        fillColor: "#f5deb3",
        fillOpacity: 0.35
    });
    //地图上添加多边形
    mapObj.addOverlays(polygon);
    //构造多边形编辑对象，并开启多边形的编辑状态
    mapObj.plugin(["AMap.PolyEditor"],function(){
        polygonEditor = new AMap.PolyEditor(mapObj,polygon);
        polygonEditor.open();
    });
}
function removePloygonEditor(){
	polygonEditor.close();
	polygon.hide();
}
AMap.homeControlDiv = function(){}
AMap.homeControlDiv.prototype = {
   addTo: function(map, dom){
      dom.appendChild(this._getHtmlDom(map));
   },
   _getHtmlDom:function(map){
     this.map=map;
     // 创建一个能承载控件的<div>容器
     controlUI = document.createElement("DIV");
     controlUI.style.width='80px';     //设置控件容器的宽度
     controlUI.style.height='20px';    //设置控件容器的高度
     controlUI.style.backgroundColor='white';
     controlUI.style.borderStyle='solid';
     controlUI.style.borderWidth='2px';
     controlUI.style.cursor='pointer';
     controlUI.style.textAlign='center';

     // 设置控件的位置
     controlUI.style.position='absolute';
     controlUI.style.left='120px';     //设置控件离地图的左边界的偏移量
     controlUI.style.top='5px';        //设置控件离地图上边界的偏移量
     controlUI.style.zIndex='300';     //设置控件在地图上显示

  // 设置控件字体样式
     controlUI.style.fontFamily='Arial,sens-serif';
     controlUI.style.fontSize='12px';
     controlUI.style.paddingLeft='4px';
     controlUI.style.paddingRight='4px';
     controlUI.innerHTML="换中心点";

     // 设置控件响应点击onclick事件
     controlUI.onclick = function(){
        map.setCenter(new AMap.LngLat(116.234404, 39.12915));
     }
     return controlUI;
   }
}
AMap.event.trigger(homeControlDiv,"hide");
AMap.event.addListener(homeControlDiv,"hide",function(){
	controlUI.style.display = 'none';
})

function myControl(){
	homeControl = new AMap.homeControlDiv(mapObj); //新建自定义插件对象
	mapObj.addControl(homeControl);                  //地图上添加插件
}
function removeMyControl(){
	homeControl.hide();
	//controlUI.style.display='none';
}
function iRangingTool(){
	ruler.turnOn();
}
function removeRangingTool(){
	ruler.turnOff();
	mapObj.clearMap();
	//ruler.hide();
	//ruler.setMap(null);	
	//mapObj.removeControl(ruler);
}
function iMarker(){
	mousetool.marker(); //使用鼠标工具，在地图上画标记点
}
function iMeasureArea(){
	mousetool.measureArea();
}
function iRectZoomIn(){
	mousetool.rectZoomIn();
}
function iRectZoomOut(){
	mousetool.rectZoomOut();
}
function iPolyline(){
	mousetool.polyline();
}
function iPolygon(){
	mousetool.polygon();
}
function iCircle(){
	mousetool.circle();
}
function iRectangle(){
	mousetool.rectangle();
}
function iRule(){
	mousetool.rule();
}
function removeMouseTool(){
	mousetool.close(true);
}
</SCRIPT>
 </BODY></HTML>

