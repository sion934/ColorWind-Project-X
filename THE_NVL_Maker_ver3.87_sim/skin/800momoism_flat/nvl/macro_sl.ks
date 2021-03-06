;-------------------------------------------------------------------------------------------
;SAVE、LOAD系统通用的宏
;layer 14 背景
;message4 按钮
;15 状态
;16 悬停显示
;17 截图
;-------------------------------------------------------------------------------------------
*start
;--------------------------------------------
;【页数显示按钮】
;根据是不是当前页，改变按钮显示状态
;--------------------------------------------
[macro name=sl_page_button]
	[if exp="mp.num==sf.最近存储页"]
	[button normal=MOMOism_page_on over=MOMOism_page_on]
	[else]
	[button normal=MOMOism_page_off over=MOMOism_page_on target="*刷新画面" exp=&("sf.最近存储页="+mp.num)]
	[endif]
[endmacro]
;--------------------------------------------
;【页数显示按钮】位置定义
;插入到save.ks/load.ks中
;--------------------------------------------
[macro name=sl_button_page]
	[locate x=227 y=558]
	[sl_page_button num=1]
	[locate x=264 y=558]
	[sl_page_button num=2]
	[locate x=301 y=558]
	[sl_page_button num=3]
	[locate x=338 y=558]
	[sl_page_button num=4]
	[locate x=375 y=558]
	[sl_page_button num=5]
	[locate x=412 y=558]
	[sl_page_button num=6]
	[locate x=449 y=558]
	[sl_page_button num=7]
	[locate x=486 y=558]
	[sl_page_button num=8]
	[locate x=523 y=558]
	[sl_page_button num=9]
	[locate x=560 y=558]
	[sl_page_button num=10]
[endmacro]
;--------------------------------------------
;【档案编号显示】
;根据当前翻到的页数，将档案编号的图片插入到save.ks/load.ks中
;--------------------------------------------
[macro name=sl_button_datanum]
[pimage storage=&("MOMOism_datanum_"+sf.最近存储页) page=%page|fore layer=15 dx=0 dy=0]
[endmacro]
;--------------------------------------------
;【删除档案用】
;当点下删除按钮并确认之后执行的内容
;--------------------------------------------
[iscript]
function delsavedata(num)
{
	kag.eraseBookMark(num);
	sf.历史[num]=void;
	kag.process(,"*刷新画面");
}
[endscript]
;------------------------------------------------------------
;返回档案名/确认档案是否存在
;------------------------------------------------------------
[iscript]
function storagedata(num)
{
	var sd=kag.saveDataLocation+'/data'+num+'.bmp';
	return sd;
}
function checkdata(num)
{
	//是否存在图片文件
	var cd=Storages.isExistentStorage(kag.saveDataLocation+'/data'+num+'.bmp');
	//如果图片存在，但档案已被删除，也判断为不存在
	if (kag.getBookMarkDate(num)=="0000/00/00") cd=false;
	return cd;
}
[endscript]
;------------------------------------------------------------
;在存取按钮上描绘文字的函数
;------------------------------------------------------------
[iscript]
function drawbuttontext(button,style,mytext)
{
	//取得传入的字体样式参数和文字内容参数
	button.font.height=style.height;

	var sha=style.sha;
	var shac=style.shac;
	var edg=style.edg;
	var edgc=style.edgc;
	var normal=style.normal;
	var over=style.over;
	var on=style.on;

	var x=mytext.x;
	var y=mytext.y;
	var str=mytext.str;

	if (sha)
	{
		button.drawText(x,                    y, str, normal,255,true,255,shac,0,2,2);
		button.drawText(x+button.width,y, str, on,255,true,255,shac,0,2,2);
		button.drawText(x+button.width+button.width, y, str, over,255,true,255,shac,0,2,2);
	}
	else if (edg)
	{
		button.drawText(x,                           y, str, normal,255,true,255,edgc,1,0,0);
		button.drawText(x+button.width,              y, str, on,255,true,255,edgc,1,0,0);
		button.drawText(x+button.width+button.width, y, str, over,255,true,255,edgc,1,0,0);
	}
	else
	{
		button.drawText(x,                           y, str, normal);
		button.drawText(x+button.width,              y, str, on);
		button.drawText(x+button.width+button.width, y, str, over);
	}
}
[endscript]
;------------------------------------------------------------
;根据设置，在按钮上描绘相应文字
;------------------------------------------------------------
[iscript]
function slbuttontitle(button,num)
{
	//公用样式1
	button.font.face=kag.fore.messages[0].userFace;
	button.font.bold=f.config_slpos.pagefont.bold;
	button.font.italic=f.config_slpos.pagefont.italic;

	var style=new Dictionary();

	//公用样式2
	style.sha=f.config_slpos.pagefont.shadow;
	style.shac=f.config_slpos.pagefont.shadowcolor;
	style.edg=f.config_slpos.pagefont.edge;
	style.edgc=f.config_slpos.pagefont.edgecolor;
	
	var mytext=new Dictionary();

	//档案编号
	if (f.config_slpos.num.use)
	{
		style.height=f.config_slpos.num.height;
		style.normal=f.config_sl.num.normal;
		style.over=f.config_sl.num.over;
		style.on=f.config_sl.num.on;

		mytext.x=(int)f.config_slpos.num.x;
		mytext.y=(int)f.config_slpos.num.y;
		mytext.str=f.config_slpos.num.pre+(num*1+1)+f.config_slpos.num.after;
		
		drawbuttontext(button,style,mytext);
	}

	//章节名
	if (f.config_slpos.bookmark.use)
	{
		style.height=f.config_slpos.bookmark.height;
		style.normal=f.config_sl.bookmark.normal;
		style.over=f.config_sl.bookmark.over;
		style.on=f.config_sl.bookmark.on;

		mytext.x=(int)f.config_slpos.bookmark.x;
		mytext.y=(int)f.config_slpos.bookmark.y;
		mytext.str=kag.getBookMarkPageName(num);
		
		drawbuttontext(button,style,mytext);
	}

	//日期
	if (f.config_slpos.date.use)
	{
		style.height=f.config_slpos.date.height;
		style.normal=f.config_sl.date.normal;
		style.over=f.config_sl.date.over;
		style.on=f.config_sl.date.on;

		mytext.x=(int)f.config_slpos.date.x;
		mytext.y=(int)f.config_slpos.date.y;
		mytext.str=kag.getBookMarkDate(num);
		
		drawbuttontext(button,style,mytext);
	}
	
	//最近对话
	if (f.config_slpos.history.use)
	{
		style.height=f.config_slpos.history.height;
		style.normal=f.config_sl.history.normal;
		style.over=f.config_sl.history.over;
		style.on=f.config_sl.history.on;

		mytext.x=(int)f.config_slpos.history.x;
		mytext.y=(int)f.config_slpos.history.y;
		
		//取得历史记录
		var his;
		if (sf.历史[num]!=void) {his=sf.历史[num];}
		else { his="…"; }
		//切掉不必要的字数
		var str=his.substring(0,f.config_slpos.history.num);
		str+="…";

		mytext.str=str;
		
		drawbuttontext(button,style,mytext);
	}
}
[endscript]
;------------------------------------------------------------
;悬停
;------------------------------------------------------------
[iscript]
function slshow(num)
{
	if (kag.getBookMarkDate(num)!=void)
	{
	    //清空描绘层
	    kag.fore.layers[16].loadImages(%['storage'=>'empty','visible'=>true,'left'=>0,'top'=>0]);

		var setting=new Dictionary();
		//复制字体设定
		(Dictionary.assign incontextof setting)(f.config_slpos.pagefont);
		//其他参数设定
		setting.layer="16";
		setting.face=kag.fore.messages[0].userFace;

	   //描绘章节名
	   if (f.config_slpos.drawmark.use)
	   {
	      //设定其他参数
	      setting.text=kag.getBookMarkPageName(num);
	      setting.x=f.config_slpos.drawmark.x;
	      setting.y=f.config_slpos.drawmark.y;
	      setting.size=f.config_slpos.drawmark.size;
	      setting.color=f.config_sl.draw.bookmark;   
	      kag.tagHandlers.ptext(setting);
	   }
	   
	   //描绘日期时间
	   if (f.config_slpos.drawdate.use)
	   {
	      //设定其他参数
	      setting.text=kag.getBookMarkDate(num);
	      setting.x=f.config_slpos.drawdate.x;
	      setting.y=f.config_slpos.drawdate.y;
	      setting.size=f.config_slpos.drawdate.size;
	      setting.color=f.config_sl.draw.date;   
	      kag.tagHandlers.ptext(setting);
	   }
	   
	   //描绘对话
	   if (f.config_slpos.drawtalk.use)
	   {
	        if (sf.历史[num]!=void)
	      {
	           var talk=sf.历史[num];
	           talk+="……";
	           var t_linecount=talk.length\f.config_slpos.drawtalk.count;
	           if  (talk.length%f.config_slpos.drawtalk.count>0) {t_linecount++;}

	      		//设定其他参数
				setting.size=f.config_slpos.drawtalk.size;
				setting.color=f.config_sl.draw.talk;
	            setting.x=(int)f.config_slpos.drawtalk.x;

	           //开始描绘
	            for (var i=0; i<t_linecount; i++)
	               {
	      			   //改变坐标和描绘内容
	                   setting.y=(int)i*f.config_slpos.drawtalk.space+(int)f.config_slpos.drawtalk.y;
	                   setting.text=talk.substring(i*f.config_slpos.drawtalk.count,f.config_slpos.drawtalk.count);

	                   kag.tagHandlers.ptext(setting);
	               }
	        }
	    }
	
	   //描绘截图
	   if (checkdata(num)) kag.fore.layers[17].loadImages(%[
	      'storage'=>storagedata(num),
	      'visible'=>f.config_slpos.snapshot.visible, //假如设定visible=0，这个功能照样在但是不显示
	      'left'=>f.config_slpos.snapshot.x,
	      'top'=>f.config_slpos.snapshot.y
	     ]);
	 
	 }
}

function slhide()
{
	kag.fore.layers[16].visible=false;
	kag.fore.layers[17].visible=false;
}
[endscript]
;------------------------------------------------------------
;描绘单个按钮
;------------------------------------------------------------
[iscript]
function checkdict(name,value,dict)
{
	if (value=='') 
	{
		dict[name]=void;
	}
}
function slbutton(num)
{
	//创建数据
	var savebutton = new Dictionary();

	//复制按钮设定
	(Dictionary.assign incontextof savebutton)(f.config_sl.button);
	
	//使透明部分不响应
	savebutton.recthit=false;
	
	savebutton.onenter='slshow('+num+')';
	savebutton.onleave="slhide()";
	savebutton.exp='tf.最近档案='+num;
	savebutton.target="*存取游戏";

	//检查字典里是否有空字符串，如有的话，强制设定为void
	foreach(savebutton,checkdict);
	//创建按钮
	kag.tagHandlers.button(savebutton);
	//创建按钮后描绘文字
	slbuttontitle(kag.current.links[kag.current.links.count-1].object,num);
}

function delbutton(num)
{

	//添加删除按钮
	var delbutton = new Dictionary();
	delbutton.normal = "ms_delbutton";
	delbutton.over = "ms_delbutton_over";
	delbutton.exp = 'tf.删除档案='+num;
	delbutton.target = "*删除档案";
	kag.tagHandlers.button(delbutton);
}
[endscript]
;------------------------------------------------------------
;批量描绘
;------------------------------------------------------------
[iscript]
function drawslbutton(page="fore")
{
	var layer;

	//载入空白图片,用于显示状态
	  if (page=="fore") layer=kag.fore.layers[15];
	  else layer=kag.back.layers[15];
	  layer.loadImages(%['storage'=>'empty', 'visible'=>true,'left'=>0,'top' =>0]);
	
	//描绘其他按钮

	//返回
	if (f.config_slpos.back[2])
	{
	      kag.tagHandlers.locate(
	      %[
	        "x" => f.config_slpos.back[0],
	        "y" => f.config_slpos.back[1]
	      ]);
	
		//创建数据
		var mybutton = new Dictionary();
		//复制按钮设定
		(Dictionary.assign incontextof mybutton)(f.config_sl.back);
		
		mybutton.target="*返回";

		//删除字典内的空值
		foreach(mybutton,checkdict);
		kag.tagHandlers.button(mybutton);
	
	}
	//上翻
	if (f.config_slpos.up[2])
	{
	      kag.tagHandlers.locate(
	      %[
	        "x" => f.config_slpos.up[0],
	        "y" => f.config_slpos.up[1]
	      ]);
	
	
			//创建数据
			var mybutton = new Dictionary();
			//复制按钮设定
			(Dictionary.assign incontextof mybutton)(f.config_sl.up);
			
			mybutton.target="*刷新画面";
			mybutton.exp="sf.最近存储页-- if (sf.最近存储页>1)";

			//删除字典内的空值
			foreach(mybutton,checkdict);
			kag.tagHandlers.button(mybutton);
	}
	//下翻
	if (f.config_slpos.down[2])
	{
	      kag.tagHandlers.locate(
	      %[
	        "x" => f.config_slpos.down[0],
	        "y" => f.config_slpos.down[1]
	      ]);
	
			//创建数据
			var mybutton = new Dictionary();
			//复制按钮设定
			(Dictionary.assign incontextof mybutton)(f.config_sl.down);
			
			mybutton.target="*刷新画面";
			mybutton.exp="sf.最近存储页++ if (sf.最近存储页<(kag.numBookMarks/f.config_slpos.locate.count))";

			//删除字典内的空值
			foreach(mybutton,checkdict);
			kag.tagHandlers.button(mybutton);
	
	}
	//循环描绘存取按钮及按钮上的小截图、最新档标记等
	for (var i=0;i<f.config_slpos.locate.count;i++)
	  {
	      var number=i*1+(sf.最近存储页-1)*(f.config_slpos.locate.count);
			//取得坐标
			var x=f.config_slpos.locate[i][0];
			var y=f.config_slpos.locate[i][1];
			//sl按钮坐标
			kag.tagHandlers.locate(
			%[
				"x" => x,
				"y" => y
			]);
			//描绘sl按钮
			slbutton(number);

			//删除按钮坐标
			kag.tagHandlers.locate(
			%[
				"x" => x+580,
				"y" => y+55
			]);
			//描绘删除按钮
			delbutton(number);

	      //当前编号==sf.最近档案，且的确存在档案时，描绘状态标记
	      if (number==sf.最近档案 && f.config_slpos.lastsavemark.use==1 && checkdata(sf.最近档案)==true)
	      {
	           kag.tagHandlers.pimage(
	           %[
	              "layer"=>"15",
	              "page"=>page,
	              "storage"=>f.config_sl.lastsavemark,
	              "dx"=> (int)f.config_slpos.lastsavemark.x+(int)f.config_slpos.locate[i][0],
	              "dy"=>(int)f.config_slpos.lastsavemark.y+(int)f.config_slpos.locate[i][1]
	           ]);
	      }

	      //有用到，进行游戏截图描绘
	      if (f.config_slpos.smallsnap.use==1 && checkdata(number))
	      {
	         var snap=new Dictionary();
	         snap.layer="15";
	         snap.page=page;
	         snap.storage=storagedata(number);
	         snap.dx=(int)f.config_slpos.smallsnap.x+(int)f.config_slpos.locate[i][0];
	         snap.dy=(int)f.config_slpos.smallsnap.y+(int)f.config_slpos.locate[i][1];
	         kag.tagHandlers.pimage(snap);
	      }
	  }

}
[endscript]
;------------------------------------------------------------
[return]
