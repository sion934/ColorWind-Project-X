;------------------------------------------------------------
;主菜单
;------------------------------------------------------------
*start
[locksnapshot]
[tempsave]
;------------------------------------------------------------
*window
[history enabled="false"]
[locklink]
[rclick enabled="true" jump="true" storage="main_menu.ks" target=*返回]

[backlay]
;主选单背景
[image layer=14 page=back storage=&"f.config_menu.bgd" left=0 top=0 visible="true"]
;无效化系统按钮层
[disablesysbutton page="back"]
;用message4描绘
[layopt layer="message4" visible="true" page="back" left=0 top=0]
[current layer="message4" page="back"]
[er]
;显示主选单按钮
[button_menu]
[trans method="crossfade" time=200]
[wt]

[s]

*刷新画面
[current layer="message4"]
[er]
;显示主选单按钮
[button_menu]
[s]

;------------------------------------------------------------
;以下都是跳转到对应界面的window标签，避免重复tempsave
;------------------------------------------------------------
*保存游戏
[jump storage="save.ks" target=*window]

*读取进度
[jump storage="load.ks" target=*window]

*系统设定
[jump storage="option.ks" target=*window]

*自定选单
;可以自己设定跳到什么地方
[jump storage="other_sample.ks" target=*window]

;------------------------------------------------------------
;从其他界面返回时，都会跳到 *返回 标签
;如果需要返回主选单，可以修改成跳到如上的 *刷新画面 标签
;------------------------------------------------------------
*返回
[locklink]
[rclick enabled="false"]
[backlay]
[tempload backlay="true" bgm="false" se="false"]
[trans method="crossfade" time=200]
[wt]

[unlocksnapshot]
[return]
