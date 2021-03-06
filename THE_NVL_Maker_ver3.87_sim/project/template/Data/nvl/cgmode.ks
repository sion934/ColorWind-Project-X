;------------------------------------------------------------
;非常懒惰的CG显示
;------------------------------------------------------------
*start
[tempsave]
;------------------------------------------------------------
*window

[iscript]
//假如是第一次登录CG，建立空白的CG登陆记录
if (sf.cglist==void) sf.cglist=%[];

//设定CG列表文件
f.cginfo="cglist.txt";

//根据CG列表文件，载入作为缩略图的CG图片文件名称列表
f.cglist=getThumList();

//根据f.cglist的CG图片数，计算需要的翻页数
tf.CG页数=f.cglist.count\f.config_cgmode.locate.count;
if (f.cglist.count%f.config_cgmode.locate.count>0) tf.CG页数++;
tf.当前CG页=1;

[endscript]

[history enabled="false"]

[locklink]
[rclick enabled="true" jump="true" storage="cgmode.ks" target=*返回]

[backlay]
[image layer=11 page=back storage=&"f.config_cgmode.bgd" left=0 top=0 visible="true"]

[current layer="message4" page="back"]
[layopt layer="message4" visible="true" page="back" left=0 top=0]
[er]
;描绘各种ABC
[draw_cglist]
[trans method="crossfade" time=300]
[wt]

[s]
;------------------------------------------------------------
*刷新画面
[locklink]
[rclick enabled="true" jump="true" storage="cgmode.ks" target=*返回]
;避免按键太快，等待100毫秒
[wait time=100]
[current layer="message4"]
[er]
;描绘各种ABC
[draw_cglist]
[s]

*显示CG
[locklink]
[rclick enabled="true" jump="true" storage="cgmode.ks" target=*消除CG]
;取得CG文件名
[iscript]
tf.当前CG=tf.CG差分[tf.CG编号];
[endscript]

;显示CG
[backlay]
[image layer=16 storage=&tf.当前CG left=0 top=0 page="back" visible="true"]
[trans method="crossfade" time=100]
[wt]
[waitclick]

;假如还有CG差分，取得下一个差分的编号
[if exp="tf.CG编号<tf.CG差分.count-1"]
[eval exp="tf.CG编号++"]
[jump target="*显示CG"]
[endif]


*消除CG
[rclick enabled="true" jump="true" storage="cgmode.ks" target=*返回]
[stoptrans]
[backlay]
[freeimage layer=16 page="back"]
[trans method="crossfade" time=100]
[wt]
[jump target=*刷新画面]
;------------------------------------------------------------
*返回
[locklink]
[rclick enabled="false"]
[backlay]
[tempload backlay="true" bgm="false" se="false"]
[trans method="crossfade" time=200]
[wt]

[return]
