;------------------------------------------------------------
;非常懒惰的load画面
;------------------------------------------------------------
*start
[locksnapshot]
[tempsave]

;------------------------------------------------------------
*window

;载入配置文件
[iscript]
f.config_sl=f.config_load;
[endscript]
[history enabled="false"]

*firstpage
[locklink]
[rclick enabled="true" jump="true" storage="load.ks" target=*返回]
[backlay]
[image layer=14 page=back storage=&"f.config_sl.bgd" left=0 top=0 visible="true"]

;无效化系统按钮层
[disablesysbutton page="back"]

;用message4描绘
[current layer="message4" page="back"]
[layopt layer="message4" visible="true" page="back" left=0 top=0]
[er]

[eval exp="drawslbutton('back')"]
;页数显示按钮
[sl_button_page]
;档案编号
[sl_button_datanum page=back]
[trans method="crossfade" time=300]
[wt]

[s]
;------------------------------------------------------------
*刷新画面
[current layer="message4"]
[er]
[eval exp="drawslbutton()"]
;页数显示按钮
[sl_button_page]
;档案编号
[sl_button_datanum page=fore]
[s]

;------------------------------------------------------------
*存取游戏
[if exp="checkdata(tf.最近档案)"]
[load ask="true" place="&tf.最近档案"]
[else]
[jump target=*刷新画面]
[end]
[s]
;------------------------------------------------------------
*删除档案
[iscript]
//消息、窗口、确认后执行的函数（删除档案）、取消后执行的函数（空）、为前两个函数传入的参数（想删除的档案编号）
askYesNo("删除档案吗？", "确认",delsavedata,void,tf.删除档案,kag.process(,"*刷新画面"));
[endscript]
[s]
;------------------------------------------------------------
*返回
[jump storage="main_menu.ks" target=*返回]
