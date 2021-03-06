;-------------------------------------------------------------------------------------------
;CG设定相关宏
;-------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------
;取得CG缩略图列表
;-------------------------------------------------------------------------------------------
[iscript]
function getThumList()
{

	var list=[].load(f.cginfo);

	var thumlist=[];

	for (var i=0;i<list.count;i++)
	{
		var obj=list[i];
		var arr=obj.split(",");
		thumlist.add(arr[0]);
	}

	return thumlist;
}

[endscript]
;-------------------------------------------------------------------------------------------
;取得已登录的CG差分
;-------------------------------------------------------------------------------------------
[iscript]
function getCgDif(num)
{

	var list=[].load(f.cginfo);
	var obj=list[num];
	var arr=obj.split(",");

	var cglist=[];

	dm(" 列表文件"+f.cginfo+"，第"+num+"行，共"+arr.count+"个差分");

	for (var i=0;i<arr.count;i++)
	{
		var name=arr[i];

		//只有已经登录的CG才会被显示
		if (sf.cglist[name]==true)
		{
			cglist.add(name);
			dm(" 差分"+name+"已登陆");
		}
		else
		{
			dm(" 差分"+name+"未登陆");
		}
	}

	return cglist;
}

[endscript]

;-------------------------------------------------------------------------------------------
;登录CG
;-------------------------------------------------------------------------------------------
[iscript]
function AddToCgList(name)
{
	//假如是第一次登录CG
	if (sf.cglist==void) sf.cglist=%[];
	sf.cglist[name]=true;
	dm("登录CG："+name);
}
[endscript]

[macro name=addcg]
[eval exp="AddToCgList(mp.storage)"]
[endmacro]
;-------------------------------------------------------------------------------------------
;CG按钮【取得缩略图的文件名，以及在对应列表文件里的行号】
;-------------------------------------------------------------------------------------------
[iscript]
function CgButton(name,num)
{

		f.config_cgmode.thum.target="*显示CG";

		//点下按钮之后执行的表达式，将通过行号取得同一缩略图的差分列表并准备显示
		f.config_cgmode.thum.exp="(tf.CG差分=getCgDif("+num+")),(tf.CG编号=0)";

		//利用thumbnail大小图片添加一个CG按钮
		kag.current.addButton(f.config_cgmode.thum);

		//设定按钮为最近添加的按钮
		var button=kag.current.links[kag.current.links.count-1].object;

        //临时图层，读取CG或CG缩略图
        var temp=new Layer(kag, kag.fore.base);

		//查找PNG格式的缩略图，找不到则直接缩放原图
		if (Storages.isExistentStorage(name+"_thum"+".png"))
		{
			temp.loadImages(name+"_thum");
		}
        else
		{
			temp.loadImages(name);
		}

        temp.setSizeToImageSize();

        //临时图层，读取thumbnail大小图片
        var temp2=new Layer(kag, kag.fore.base);
        temp2.loadImages(f.config_cgmode.thum.normal);
        temp2.setSizeToImageSize();

		//将CG缩略图描绘到按钮上
        button.stretchCopy(0, 0, button.width, button.height, temp, 0, 0, temp.width, temp.height, stLinear);
        button.stretchCopy(button.width, 0, button.width, button.height, temp, 0, 0, temp.width, temp.height, stLinear);
        button.stretchCopy(button.width*2, 0, button.width, button.height, temp, 0, 0, temp.width, temp.height, stLinear);
        
        //选中效果（thumbnail大小图片同时作为高亮效果使用）
         button.operateStretch(button.width, 0, button.width, button.height, temp2, 0, 0, temp2.width, temp2.height);
         button.operateStretch(button.width*2, 0, button.width, button.height, temp2, 0, 0, temp2.width, temp2.height);
        
}
[endscript]

;-------------------------------------------------------------------------------------------
;CG列表
;-------------------------------------------------------------------------------------------
[iscript]
function draw_cglist()
{

	dm("=========描绘CG按钮，当前第"+tf.当前CG页+"页=========");

	for (var i=0;i<f.config_cgmode.locate.count;i++)
	{	     
	     kag.tagHandlers.locate(%["x"=>f.config_cgmode.locate[i][0],"y"=>f.config_cgmode.locate[i][1]]);
	     
	     //取得CG在列表中的编号（行号）
	     var j=i+f.config_cgmode.locate.count*(tf.当前CG页-1);
	     
	     if (f.cglist[j]!=void)
	     {
		    var name=f.cglist[j];
		    
		    if (sf.cglist[name]==true)
		    {
			    dm("【CG按钮："+name+"成功显示】");
				//假如已经登陆了这张CG文件，则显示按钮
			    CgButton(name,j);
		    }
		    else
		    {
			    dm("【CG按钮："+name+"尚未登录】");
		    }
	     }
	}
}
[endscript]

[macro name=draw_cglist]

	;描绘CG
	[eval exp="draw_cglist()"]
	
	;前一页
	[mybutton dicname="f.config_cgmode.up" exp="tf.当前CG页-- if (tf.当前CG页>1)" target=*刷新画面]
	;后一页
	[mybutton dicname="f.config_cgmode.down" exp="tf.当前CG页++ if (tf.当前CG页<tf.CG页数)" target=*刷新画面]
	;返回按钮
	[mybutton dicname="f.config_cgmode.back" target=*返回]

[endmacro]
;-------------------------------------------------------------------------------------------
[return]

