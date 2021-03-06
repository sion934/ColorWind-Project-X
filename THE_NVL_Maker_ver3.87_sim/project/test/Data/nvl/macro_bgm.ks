;-------------------------------------------------------------------------------------------
;音乐鉴赏界面相关函数
;-------------------------------------------------------------------------------------------
[iscript]
function BgmButton(name)
{
	//取得显示名和播放文件名
	var text=name.split(',');
	
	//按钮设定
	var dic=%[];
	
	var list=f.config_bgmmode.list;

	dic.normal=list.normal; //这里是设定BGM按钮底图的地方
	dic.over=list.over;
	dic.on=list.on;

	if (text[1]==kag.bgm.playingStorage)
	{
		dic.normal=list.over;
	}
	
	dic.exp="tf.当前BGM=\""+text[1]+"\"";
	dic.target="*播放音乐";
	kag.current.addButton(dic);
	
	//在按钮上描绘文字

	var x=(int)list.x;//设定按钮上文字位置的地方
	var y=(int)list.y;
	
	var str=text[0];
	var button=kag.current.links[kag.current.links.count-1].object;
	
	button.font.height=list.size;//设定字体大小
	button.font.italic=list.italic;//是否斜体
	button.font.bold=list.bold;//是否粗体
	
	if (list.edge)
	{
		button.drawText(x,y, str, list.color, 255, true, 255, list.edgecolor, 1, 0, 0);
		button.drawText(x+button.width,y, str, list.color, 255, true, 255, list.edgecolor, 1, 0, 0);
		button.drawText(x+button.width*2,y, str, list.color, 255, true, 255, list.edgecolor, 1, 0, 0);
	}
	else if (list.shadow)
	{
		button.drawText(x,y, str, list.color, 255, true, 255, list.shadowcolor, 0, 2, 2);
		button.drawText(x+button.width,y, str, list.color, 255, true, 255, list.shadowcolor, 0, 2, 2);
		button.drawText(x+button.width*2,y, str, list.color, 255, true, 255, list.shadowcolor, 0, 2, 2);
	}
	else
	{
		button.drawText(x,y,str,list.color);
		button.drawText(x+button.width,y,str,list.color);
		button.drawText(x+button.width*2,y,str,list.color);
	}
}
function draw_bgmlist()
{

	//简写名称
	var list=f.config_bgmmode.list;

	//载入按钮图片确定大小
    var temp=new Layer(kag, kag.fore.base);
	temp.loadImages(list.normal);
	temp.setSizeToImageSize();

	var width=temp.width;
	var height=temp.height;
	
	for (var i=0;i<list.num;i++)
	{
		if ((tf.当前BGM页-1)*list.num+i>=f.bgmlist.count) break;
		
		if (list.line=="single")
		{
			var btnx=list.left;
			var btny=list.top+(height+(int)list.disy)*i;
			kag.tagHandlers.locate(%["x"=>btnx,"y"=>btny]);
		}
		else
		{
			var btnx=list.left+(width+(int)list.disx)*(i%2);
			var btny=list.top+(height+(int)list.disy)*(int)(i/2);
			kag.tagHandlers.locate(%["x"=>btnx,"y"=>btny]);
		}

		BgmButton(f.bgmlist[(tf.当前BGM页-1)*list.num+i]);
	}
}
[endscript]
;-------------------------------------------------------------------------------------------
;描绘bgm按钮
;-------------------------------------------------------------------------------------------
[macro name=draw_bgmlist]

	;BGM按钮
	[eval exp="draw_bgmlist()"]
	
	;上翻按钮
	[mybutton dicname="f.config_bgmmode.up" target=*刷新画面 exp="tf.当前BGM页-- if (tf.当前BGM页>1)" cond="tf.BGM页数>1"]
	;下翻按钮
	[mybutton dicname="f.config_bgmmode.down" target=*刷新画面  exp="tf.当前BGM页++ if (tf.当前BGM页<tf.BGM页数)" cond="tf.BGM页数>1"]
	;返回按钮
	[mybutton dicname="f.config_bgmmode.back" target=*返回]

[endmacro]

;-------------------------------------------------------------------------------------------
[return]
