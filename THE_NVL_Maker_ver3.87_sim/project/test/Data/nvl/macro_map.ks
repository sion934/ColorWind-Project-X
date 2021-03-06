;-------------------------------------------------------------------------------------------
;地图显示专用宏
;和养成相同
;背景板显示在layer11层上
;按钮显示在message3层上
;可刷新的数值显示面板显示在layer12上
;悬停图片显示在layer13上

;追加悬停图片函数,配合新增的参数，鼠标移到按钮上时可在指定位置额外显示一张图片
;使用方式为在如下参数里填入内容:
;鼠标移入：mapshow('图片名',x,y)
;鼠标移出：maphide()
;-------------------------------------------------------------------------------------------
*start
[iscript]
//------------------------------------------------------------
//读入地图配置表
//------------------------------------------------------------
//显示地图按钮
function loadmap(name)
{
	//创建字典并读入地图文件信息
	var dic =[];
	dic=Scripts.evalStorage(name);

 if (dic!='')
 {
   //载入背景
	kag.back.layers[11].loadImages(%["storage"=>dic[0].bgd,"visible"=>true,"left"=>0,"top"=>0]);
   //循环描绘按钮
   for (var i=1;i<dic.count;i++)
   {
	   //定义按钮位置
	   kag.tagHandlers.locate(%["x" => dic[i]["x"], "y" => dic[i]["y"] ]);
	   //创建按钮用字典
	   var mapbutton = new Dictionary();
	   //取得数据
	   mapbutton["normal"]=dic[i]["normal"];
	   mapbutton["over"]=dic[i]["over"];
	   mapbutton["on"]=dic[i]["on"];
	   mapbutton["storage"]=dic[i]["storage"];
	   mapbutton["target"]=dic[i]["target"];
	
	   if (dic[i]["exp"]!=void) mapbutton["exp"]=dic[i]["exp"];
	   
		if (dic[i]["enterse"]!=void) mapbutton["enterse"]=dic[i]["enterse"];
		if (dic[i]["clickse"]!=void) mapbutton["clickse"]=dic[i]["clickse"];
		if (dic[i]["onenter"]!=void) mapbutton["onenter"]=dic[i]["onenter"];
		if (dic[i]["onleave"]!=void) mapbutton["onleave"]=dic[i]["onleave"];
	
	   //假如有条件，取得条件表达式
	   if (dic[i]["cond"]!=void) mapbutton["cond"]=dic[i]["cond"];
	   
	       //该据点在本地图上使用到
	       if (dic[i]["use"]==1)
	      {

	           //满足条件
	           if (Scripts.eval(mapbutton["cond"])==true) kag.tagHandlers.button(mapbutton);
	           //或者无需条件
	          if (mapbutton["cond"]==void) kag.tagHandlers.button(mapbutton);
	      }
  	 }
 }
}
[endscript]
;------------------------------------------------------------
;地图悬停显示图片用函数（默认为layer13，不过也可以自行传入参数）
;------------------------------------------------------------
[iscript]
function mapshow(storage,x=0,y=0,num=13)
{
    //读入图片
    kag.fore.layers[num].loadImages(%['storage'=>storage,'visible'=>true,'left'=>x,'top'=>y]);
}

function maphide(num=13)
{
	kag.fore.layers[num].visible=false;
}
[endscript]
;------------------------------------------------------------
;显示地图
;------------------------------------------------------------
[macro name=map]
[rclick enabled="false"]
[history enabled="false"]
[backlay]
;隐藏一般对话层
[layopt layer="message0" page="back" visible="false"]
;隐藏系统按钮层
[hidesysbutton]
;设定当前所用消息层
[frame layer="%msg|message3" page="back"]
[current layer="%msg|message3" page="back"]
[er]
;显示地图背景和按钮
[eval exp=&"'loadmap(\''+mp.storage+'\')'"]
[trans * method=%method|crossfade time=%time|300]
[wt]
[s]
[endmacro]
;------------------------------------------------------------
;清除地图
;------------------------------------------------------------
[macro name=clmap]
[backlay]
[freeimage layer=11 page="back"]
[freeimage layer=13 page="back"]
[current layer="%msg|message3" page="back"]
[er]
[layopt layer="%msg|message3" page="back" visible="false"]
[layopt layer="message0" page="back" visible="true"]
[hidesysbutton]
[trans * method=%method|crossfade time=%time|200]
[wt]
[current layer="message0"]
[rclick enabled="true"]
[history enabled="true"]
[endmacro]
;------------------------------------------------------------
;自制系统用地图宏（没有等待指令，可自行插入右键设置等）
;------------------------------------------------------------
[macro name=sysmap]
[rclick enabled="false"]
[history enabled="false"]
[backlay]
;隐藏标题按钮层
[layopt layer="message0" page="back" visible="false"]
;隐藏系统按钮层
[hidesysbutton]
;设定当前所用消息层
[frame layer="%msg|message3" page="back"]
[current layer="%msg|message3" page="back"]
[er]
;显示地图背景和按钮
[eval exp=&"'loadmap(\''+mp.storage+'\')'"]
[trans * method=%method|crossfade time=%time|300]
[wt]
[endmacro]
;------------------------------------------------------------
;清除自制系统用地图宏（禁止右键菜单，是否消除地图背景要添加额外参数clbg）
;------------------------------------------------------------
[macro name=clsysmap]
[rclick enabled="false"]
[history enabled="false"]
[backlay]
[freeimage layer=11 page="back" cond="mp.clbg"]
[freeimage layer=13 page="back"]
[current layer="%msg|message3" page="back"]
[er]
[layopt layer="%msg|message3" page="back" visible="false"]
[trans * method=%method|crossfade time=%time|200]
[wt]
[current layer="message0"]
[endmacro]
;------------------------------------------------------------
[return]
