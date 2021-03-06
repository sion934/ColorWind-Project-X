;-------------------------------------------------------------------------------------------
;结局设定相关宏
;-------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------
;登录END
;-------------------------------------------------------------------------------------------
[iscript]
function AddToEndList(name)
{
	//假如是第一次登录
	if (sf.endlist==void) sf.endlist=%[];
	sf.endlist[name]=true;
	//通关设定为true
	sf.通关=true;
	dm("登录END："+name);
}
[endscript]

[macro name=addend]
[eval exp="AddToEndList(mp.storage)"]

[endmacro]

;-------------------------------------------------------------------------------------------
;END按钮
;-------------------------------------------------------------------------------------------
[iscript]
function EndButton(filename,picname)
{
		f.config_endmode.thum.target="*结局跳转";

		//点下按钮之后执行的表达式，将通过行号取得同一缩略图的差分列表并准备显示
		f.config_endmode.thum.exp="tf.结局=\""+filename+"\"";

		//利用thumbnail大小图片添加一个CG按钮
		kag.current.addButton(f.config_endmode.thum);

		//设定按钮为最近添加的按钮
		var button=kag.current.links[kag.current.links.count-1].object;

        //临时图层，读取CG或CG缩略图
        var temp=new Layer(kag, kag.fore.base);

		//查找PNG格式的缩略图，找不到则直接缩放原图
		if (Storages.isExistentStorage(picname+"_thum"+".png"))
		{
			temp.loadImages(picname+"_thum");
		}
        else
		{
			temp.loadImages(picname);
		}

        temp.setSizeToImageSize();

        //临时图层，读取thumbnail大小图片
        var temp2=new Layer(kag, kag.fore.base);
        temp2.loadImages(f.config_endmode.thum.normal);
        temp2.setSizeToImageSize();

		//将CG缩略图描绘到按钮上
        button.stretchCopy(0, 0, button.width, button.height, temp, 0, 0, temp.width, temp.height, stLinear);
        button.stretchCopy(button.width, 0, button.width, button.height, temp, 0, 0, temp.width, temp.height, stLinear);
        button.stretchCopy(button.width*2, 0, button.width, button.height, temp, 0, 0, temp.width, temp.height, stLinear);
        
        //选中效果（thumbnail大小图片同时作为高亮效果使用）
         button.operateStretch(button.width, 0, button.width, button.height, temp2, 0, 0, temp2.width, temp2.height);
         button.operateStretch(button.width*2, 0, button.width, button.height, temp2, 0, 0, temp2.width, temp2.height);
}

//
function draw_endlist()
{

	dm("=========描绘END按钮，当前第"+tf.当前END页+"页=========");

	for (var i=0;i<f.config_endmode.locate.count;i++)
	{	     
	     kag.tagHandlers.locate(%["x"=>f.config_endmode.locate[i][0],"y"=>f.config_endmode.locate[i][1]]);
	     
	     //取得CG在列表中的编号（行号）
	     var j=i+f.config_endmode.locate.count*(tf.当前END页-1);
	     
	     if (f.endlist[j]!=void)
	     {
			var arr=f.endlist[j].split(",");
			//脚本名
			var name=arr[0];
			//对应图片
		    var pic=arr[1];
		    
		    if (sf.endlist[name]==true)
		    {
			    dm("【END按钮："+name+"成功显示】");
			    EndButton(name,pic);
		    }
		    else
		    {
			    dm("【END按钮："+name+"尚未登录】");
		    }
	     }
	}
}
[endscript]


[macro name=draw_endlist]

	;描绘按钮
	[eval exp="draw_endlist()"]

	;前一页
	[mybutton dicname="f.config_endmode.up" exp="tf.当前END页-- if (tf.当前END页>1)" target=*刷新画面]
	;后一页
	[mybutton dicname="f.config_endmode.down" exp="tf.当前END页++ if (tf.当前END页<tf.END页数)" target=*刷新画面]
	;返回按钮
	[mybutton dicname="f.config_endmode.back" target=*返回]
[endmacro]

[return]
