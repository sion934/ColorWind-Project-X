;------------------------------------------------------------
;系统设定
;------------------------------------------------------------
*start
[iscript]
//判断当前音量并同步显示到画面上
sf.sevolume=kag.se[0].volume;
sf.voicevolume=kag.se[1].volume;
[endscript]
[locksnapshot]
[tempsave]
;------------------------------------------------------------
*window

[history enabled="false"]

[locklink]
[rclick enabled="true" jump="true" storage="option.ks" target=*返回]

[backlay]
[image layer=14 page=back storage=&"f.config_option.bgd" left=0 top=0 visible="true"]
;无效化系统按钮层
[disablesysbutton page="back"]

[current layer="message4" page="back"]
[layopt layer="message4" visible="true" page="back" left=0 top=0]
[er]
;描绘各种ABC
[button_option page=back]
[trans method="crossfade" time=500]
[wt]

[s]

*刷新画面
[current layer="message4"]
[er]
;描绘各种ABC
[button_option page=fore]
[s]

*默认
[iscript]
if (kag.fullScreen) kag.fullScreen=false;
kag.allskip=false;

kag.bgmvolume=50;
kag.sevolume=100;

sf.sevolume=50;
sf.voicevolume=50;
kag.se[0].volume=sf.sevolume;
kag.se[1].volume=sf.voicevolume;

kag.textspeed=5;
kag.autospeed=5;
[endscript]
[jump target=*刷新画面]

*返回
[jump storage="main_menu.ks" target=*返回]
