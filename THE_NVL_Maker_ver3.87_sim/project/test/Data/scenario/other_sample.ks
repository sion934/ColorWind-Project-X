;------------------------------------------------------------
;预留菜单，主菜单上的“自定选单”会连接到这里
;你可以用这个格式制作自制选单（例如道具系统）
;使用养成面板的写法可以查看范例脚本other.ks
;------------------------------------------------------------
*start
[locksnapshot]
[tempsave]
;------------------------------------------------------------
*window
[history enabled="false"]
[locklink]
[rclick enabled="true" jump="true" storage="other.ks" target=*返回]
;------------------------------------------------------------
;自己定义界面，加在这下面
[backlay]
;界面背景图
[image layer=14 page=back storage="Sample_PANEL" left=0 top=0 visible="true"]
;无效化系统按钮层
[disablesysbutton page="back"]

[current layer="message4" page="back"]
[layopt layer="message4" visible="true" page="back" left=0 top=0]
[er]
;这里是显示按钮和图片的位置

;例如：添加一个返回按钮
;[locate x=0 y=0]
;[button normal="xxxx" target=*返回]

[trans method="crossfade" time=300]
[wt]

[s]
;------------------------------------------------------------
*返回
[jump storage="main_menu.ks" target=*返回]
