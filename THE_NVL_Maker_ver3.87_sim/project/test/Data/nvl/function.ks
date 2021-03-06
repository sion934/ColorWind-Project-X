;-------------------------------------------------------------------------------------------
;系统相关函数：键盘操作、选择按钮、自定界面宏、历史记录等
;-------------------------------------------------------------------------------------------
*start
;------------------------------------------------------------
;使用ALT+ENTER切换全屏/窗口
;------------------------------------------------------------
[iscript]
function changeScreenMode(key, shift)
{
  if (key != VK_RETURN || !(shift & ssAlt))
    return false;
  if (global.kag.fullScreen)
    global.kag.onWindowedMenuItemClick(global.kag);
  else
    global.kag.onFullScreenMenuItemClick(global.kag);
  return true;
}
// キー押下時のハンドラを登録
kag.keyDownHook.add(changeScreenMode);
[endscript]
;------------------------------------------------------------
;截图功能
;------------------------------------------------------------
[iscript]
//保存截图
function savenote(name)
{
	//设定保存路径
	var fn = System.exePath + "/ScreenShot/" + name+".bmp";

	//锁定当前截图
	kag.tagHandlers.locksnapshot();
	//保存截图
	kag.snapshotLayer.saveLayerImage(fn,"bmp32");
	//解锁截图
	kag.tagHandlers.unlocksnapshot();
	dm("保存截图为"+name);
}

//获得日期时间字符串
function getDateString()
{
	var time=new Date();
	
	var str=System.title;
	var year=time.getYear();
	var month=time.getMonth()+1;
	var day=time.getDate();
	
	if (month<10) month="0"+(string)month;
	if (day<10) day="0"+(string)day;
	
	var hour=time.getHours();
	var minute=time.getMinutes();
	var second=time.getSeconds();
	
	if (hour<10) hour="0"+(string)hour;
	if (minute<10) minute="0"+(string)minute;
	if (second<10) second="0"+(string)second;
	
	//最后结果
	str+=(string)year+(string)month+(string)day+"_";
	str+=(string)hour+(string)minute+(string)second;
	return str;
}

function ScreenShot(key, shift)
{	
  dm("按键编号"+key);
  
  //106为小键盘星号截图键|116为F5
  if (!(key == 106 || key==116))
    return false;

	//保存图片
	var str=getDateString();
	savenote("nvlmaker_"+str);
}
// キー押下時のハンドラを登録
kag.keyDownHook.add(ScreenShot);
[endscript]
;------------------------------------------------------------
;左键点击显示对话框
;------------------------------------------------------------
[iscript]
function onLeftClick()
{
  kag.process("rclick.ks", "*显示对话框");
  return true;
}
[endscript]
;------------------------------------------------------------
;封装的人物姓名宏，字体设置
;------------------------------------------------------------
[iscript]
//按照配置表的内容设定字体，默认只是改变字体颜色
function setfont()
{
  kag.tagHandlers.font(%["color"=>f.config_name[1].color]);
}
[endscript]
;------------------------------------------------------------
;字典相关数据处理
;------------------------------------------------------------
[iscript]
//删除字典中的空值
function checkdict(name,value,dict)
{
	if (value=='') 
	{
		dict[name]=void;
	}
}

//将字典dict中不为空的值复制到字典param内
function setdictvalue(name,value,dict,param)
{
	if (value!=void)
	{
		param[name]=dict[name];
		//查看有几个参数被传入
		//dm("mp."+name+"="+value);
	}
}
[endscript]
;------------------------------------------------------------
;描绘选择按钮
;------------------------------------------------------------
[iscript]
//用函数创建按钮并描绘文字
function createSelbutton(mp)
{
	var selbutton=%[];
	//复制默认设定
	(Dictionary.assign incontextof selbutton)(f.setting.selbutton);
	//将mp中传入的值覆盖默认设定
	foreach(mp,setdictvalue,selbutton);
	//删除空值
	foreach(selbutton,checkdict);
	//根据字典建立按钮
	kag.tagHandlers.button(selbutton);

	//为描绘文字做出处理

	//假如没有填写剧本，则读取当前执行中的剧本名
	if (mp.storage==void) mp.storage=Storages.extractStorageName(kag.conductor.curStorage);
	//假如连标签也没有，就自动填个标签
	if (mp.target==void) mp.target="*start";

	//在按钮上描绘文字
	drawSelButton(mp.text,mp.storage,mp.target);
}

//描绘按钮文字用函数
function drawSelButton(caption, storage, target)
{
	var button;
	button=kag.current.links[kag.current.links.count-1].object;

	//默认文字样式设定
	button.font.face = kag.fore.messages[0].userFace;
	button.font.bold = kag.fore.messages[0].defaultBold;
	button.font.height = f.setting.selfont.height;
	
	//sel颜色设定
	var normal=f.setting.selfont.normal;
	var read=f.setting.selfont.read;
	var over=f.setting.selfont.over;
	var on=f.setting.selfont.on;
	
	var edgecolor=kag.fore.messages[0].defaultEdgeColor;
	var shadowcolor=kag.fore.messages[0].defaultShadowColor;

	var w = button.font.getTextWidth(caption); // 取得要描绘文字的宽度
	var x = (button.width - w) \ 2;    // 在按钮中央显示文字
	var y = (button.height - button.font.getTextHeight(caption)) \ 2;   //   文字在按钮上的y位置（左上角起算）

	//取得既读设定
	var target_name=target.substring(1,target.length-1); //去掉星号
	var labelname="trail_"+Storages.chopStorageExt(storage)+"_"+target_name;
	var checklabel="sf[\""+labelname+"\"]";
	var sel_color;

	// 既读文字颜色设定
	if ((checklabel!)>0 && read!=void) {sel_color=read;}
	else {sel_color=normal;}

	//设定每行最大字数
	var num=20;
	//计算行数
	var t_linecount=caption.length\num;
	if  (caption.length%num>0) {t_linecount++;}
	//假如多于1行，修改x的坐标
	if (t_linecount>1) x=(button.width - button.font.getTextWidth("一")*num) \ 2;

	//描绘文字
	for (var i=0; i<t_linecount; i++)
	{
		//y的坐标随行数变化
		var y=(button.height - button.font.getTextHeight(caption)*t_linecount) \ 2+i*button.font.getTextHeight(caption);
		//以20个字为单位取得要描绘的文字
		var text=caption.substring(i*num,num);

		if (kag.fore.messages[0].defaultEdge) //默认设置带有描边
		{
			// 按钮「通常状態」部分文字显示
			button.drawText(x,y, text, sel_color, 255, true, 255, edgecolor, 1, 0, 0);
			// 按钮「按下状態」部分文字显示
			button.drawText(x+button.width, y, text, on ,255, true, 255, edgecolor, 1, 0, 0);
			// 按钮「选中状態」部分文字显示
			button.drawText(x+button.width+button.width, y, text, over ,255, true, 255, edgecolor, 1, 0, 0);
		}
		else if (kag.fore.messages[0].defaultShadow)//默认设置带有阴影
		{
			// 按钮「通常状態」部分文字显示
			button.drawText(x,y, text, sel_color, 255, true, 255, shadowcolor, 0, 2, 2);
			// 按钮「按下状態」部分文字显示
			button.drawText(x+button.width, y, text, on ,255, true, 255, shadowcolor, 0, 2, 2);
			// 按钮「选中状態」部分文字显示
			button.drawText(x+button.width+button.width, y, text, over ,255, true, 255, shadowcolor, 0, 2, 2);
		}
		else //无任何效果
		{
			// 按钮「通常状態」部分文字显示
			button.drawText(x,y, text, sel_color, 255, true);
			// 按钮「按下状態」部分文字显示
			button.drawText(x+button.width, y, text, on ,255, true);
			// 按钮「选中状態」部分文字显示
			button.drawText(x+button.width+button.width, y, text, over ,255, true);
		}

	}

}
[endscript]
;------------------------------------------------------------------
;自定按钮宏（对应NVL参数字典,标签，表达式，TICK间隔时间，点击时每TICK执行函数）
;------------------------------------------------------------------
[iscript]

function mybutton(dicname,target,exp,interval,ontimer)
{
	//新建字典并复制一份参数
	var mybutton=new Dictionary(); 
	mybutton=dicname!;

	//假如内容为空，则不发生任何事
	if (mybutton==void) return;
	
	//假如按钮存在并且使用到，则增加其他传入参数
	if (mybutton.use==true)
	{
		kag.tagHandlers.locate(
		%[
			"x" => mybutton.x,
			"y" => mybutton.y
		]);

		mybutton.target=target;
		mybutton.exp=exp;
		
		mybutton.interval=interval;
		mybutton.ontimer=ontimer;

		//删除字典内的空值
		foreach(mybutton,checkdict);
		kag.tagHandlers.button(mybutton);

	}
}
[endscript]
;------------------------------------------------------------------
;系统按钮有效、无效操作
;------------------------------------------------------------------
[iscript]
//无效化单个系统按钮（foreach循环用）
function oneButtonEnabled(name,value,dict,enabled)
{
	dict[name].enabled=enabled;
}
//将所有系统按钮无效化/有效化的函数
function setSysbuttonEnabled(page,enabled)
{
	var layer;
	
	if (page=="fore") layer=kag.fore.messages[2];
	else layer=kag.back.messages[2];

	//if (layer.buttons[name]!=void) layer.buttons[name].enabled=enabled;//处理单个按钮的范例

	//批量处理当前层上所有按钮
	foreach(layer.buttons,oneButtonEnabled,enabled);
}
[endscript]
;------------------------------------------------------------------
;自定系统按钮宏（系统按钮名字，对应NVL参数字典，表达式，不安定时是否可点）
;------------------------------------------------------------------
[iscript]
function mysysbutton(dicname,name,exp,nostable)
{

	var mysysbutton=new Dictionary();
	mysysbutton=dicname!;
	
	//假如不存在对应的参数，则不发生任何事
	if (mysysbutton==void) return;

	//假如按钮存在并且使用到，则增加其他传入参数
	if (mysysbutton.use==true)
	{
		mysysbutton.name=name;
		mysysbutton.exp=exp;
		mysysbutton.nostable=nostable;

		//删除字典内的空值
		foreach(mysysbutton,checkdict);

		kag.tagHandlers.sysbutton(mysysbutton);

	}
}
[endscript]
;------------------------------------------------------------
;自定滑动槽
;------------------------------------------------------------
[iscript]
//即时调整音效和语音音量的函数
function setSeVolume()
{
    kag.se[0].volume=sf.sevolume;
	dm("Se Volume="+kag.se[0].volume);
}

function setVoiceVolume()
{
	kag.se[1].volume=sf.voicevolume;
	dm("Voice Volume="+kag.se[1].volume);
}
[endscript]

[iscript]
//滑动槽定义
function myslider(dicname,value,max,min,mychangefunc)
{

	var myslider=new Dictionary();	
	myslider=dicname!;

	//假如不存在对应的参数，则不发生任何事
	if (myslider==void) return;

	//假如Slider存在并且使用到，则增加其他传入参数
	if (myslider.use==true)
	{

		kag.tagHandlers.locate(
		%[
			"x" => myslider.x,
			"y" => myslider.y
		]);

		myslider.nofixpos=true;
		myslider.nohilight=true;

		myslider.value=value;
		myslider.max=max;
		myslider.min=min;

		myslider.mychangefunc=mychangefunc;

		//删除字典内的空值
		foreach(myslider,checkdict);
		//创建滑动槽
		kag.tagHandlers.slider(myslider);

	}
}
[endscript]
;------------------------------------------------------------
;历史记录里，播放语音用的函数
;------------------------------------------------------------
[iscript]
//简单的播放语音函数
function playse(file,buf=1,isloop=false)
{
	kag.tagHandlers.playse(%[
	"storage"=>file,
	"buf"=>buf,
	"loop"=>isloop
	]);
}
[endscript]
;------------------------------------------------------------
;历史记录里，识别人名并自动返回对应颜色
;------------------------------------------------------------
[iscript]
function history_color(text)
{
       if (text!=void && text.charAt(0)=="【")
       {
	         var name=text.substring(1,text.length-2);
	         var arr=f.config_name;
         
	         //为主角，使用主角的颜色
	         if (name==f.姓+f.名) return arr[0].color;
	         //否则
	         //是姓名列表里的角色，使用列表里设置的颜色
	           for (var i=2;i<arr.count;i++)
	          {
	             if (arr[i].name==name) return arr[i].color;
	           }
           
	         //无颜色记录,使用路人的颜色
	         return arr[1].color;

       }
       //不是人名，返回对话默认字体颜色
       return kag.fore.messages[0].defaultChColor;
}
[endscript]
;------------------------------------------------------------
;为ptext指令增加\n换行效果
;------------------------------------------------------------
[iscript]
kag.tagHandlers.ptext = function(elm)
{
        var layer = getLayerFromElm(elm);

        if(elm.lineheight === void)
        {
                layer.drawReconstructibleText(elm);
        }
        else
        {
                var textS = elm.text;
                var textarr = textS.split(/\\n|\n/);
                var lineheight = +elm.lineheight;
                var iy = +elm.y;
                for(var i=0; i<textarr.count; i++)
                {
                        elm.text = textarr[i];
                        layer.drawReconstructibleText(elm);
                        iy += lineheight;
                        elm.y = iy;
                }
        }
        return 0;
} incontextof kag;
[endscript]
;------------------------------------------------------------
[return]
