;------------------------------------------------------------
;非常懒惰的BGM鉴赏系统
;------------------------------------------------------------
*start
[tempsave]
[iscript]
//载入bgm列表
f.bgmlist=[].load("bgmlist.txt");

//计算页数
tf.BGM页数=f.bgmlist.count\f.config_bgmmode.list.num;
if (f.bgmlist.count%f.config_bgmmode.list.num>0) tf.BGM页数++;
tf.当前BGM页=1;
[endscript]
;------------------------------------------------------------
*window
[history enabled="false"]

[locklink]
[rclick enabled="true" jump="true" storage="bgmmode.ks" target=*返回]

[backlay]
;这里修改背景图片
[image layer=11 page=back storage=&"f.config_bgmmode.bgd" left=0 top=0 visible="true"]

[current layer="message4" page="back"]
[layopt layer="message4" visible="true" page="back" left=0 top=0]
[er]
;描绘各种ABC
[draw_bgmlist]
[trans method="crossfade" time=300]
[wt]

[s]
*播放音乐
[playbgm storage=&"tf.当前BGM"]
;------------------------------------------------------------
*刷新画面
[rclick enabled="true" jump="true" storage="bgmmode.ks" target=*返回]
[current layer="message4"]
[er]
;描绘各种ABC
[draw_bgmlist]
[s]

;------------------------------------------------------------
*返回
;假如当前播放的不是标题背景音乐，恢复标题背景音乐
[bgm storage=&"f.config_title.bgm" cond="kag.bgm.playingStorage!=f.config_title.bgm"]
[locklink]
[rclick enabled="false"]
[backlay]
[tempload backlay="true" bgm="false" se="false"]
[trans method="crossfade" time=200]
[wt]

[return]
