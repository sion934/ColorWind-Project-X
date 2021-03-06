;------------------------------------------------------------
;非常懒惰的END显示
;------------------------------------------------------------
*start
[tempsave place="2"]

[iscript]

//假如是第一次登录END，建立空白的END登陆记录
if (sf.endlist==void) sf.endlist=%[];

//载入结局列表
f.endlist=[].load("endlist.txt");

//根据结局数，计算需要的翻页数
tf.END页数=f.endlist.count\f.config_endmode.locate.count;
if (f.endlist.count%f.config_endmode.locate.count>0) tf.END页数++;
tf.当前END页=1;

[endscript]
;------------------------------------------------------------
*window
[history enabled="false"]

[locklink]
[rclick enabled="true" jump="true" storage="endmode.ks" target=*返回]

[backlay]

[image layer=11 page=back storage=&"f.config_endmode.bgd" left=0 top=0 visible="true"]

[current layer="message4" page="back"]
[layopt layer="message4" visible="true" page="back" left=0 top=0]
[er]
;描绘各种ABC
[draw_endlist]
[trans method="crossfade" time=300]
[wt]

[s]

;------------------------------------------------------------
*刷新画面
[image layer=11 page=fore storage=&"f.config_endmode.bgd" left=0 top=0 visible="true"]

[locklink]
[rclick enabled="true" jump="true" storage="endmode.ks" target=*返回]
;避免按键太快，等待100毫秒
[wait time=100]
[current layer="message4"]
[er]
;描绘各种ABC
[draw_endlist]
[s]

*结局跳转
;准备加载结局
[locklink]
[rclick enabled="false" call="true" storage="rclick.ks" target=*隐藏对话框]
[fadeoutbgm time="1000"]

[backlay]
;恢复到界面初始状态
[tempload place=2 backlay="true"]
;背景清空
[freeimage layer="base" page="back"]
[freeimage layer="11" page="back"]
;message0清空
[current layer="message0" page="back"]
[er]
[trans method="crossfade" time=200]
[wt]

[current layer="message0"]

[eval exp="dm('选择了结局：'+tf.结局)"]

[call storage=&"tf.结局+'.ks'"]

;重置对话框
[frame]
;假如当前播放的不是标题背景音乐，恢复标题背景音乐
[bgm storage=&"f.config_title.bgm" cond="kag.bgm.playingStorage!=f.config_title.bgm"]

[jump storage="endmode.ks" target="*window"]

;------------------------------------------------------------
*返回
[locklink]
[rclick enabled="false"]
[backlay]
[tempload backlay="true" bgm="false" se="false" place="2"]
[trans method="crossfade" time=200]
[wt]

[return]
