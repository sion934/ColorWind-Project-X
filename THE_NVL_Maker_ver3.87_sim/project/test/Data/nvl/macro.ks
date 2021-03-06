;------------------------------------------------------------
;宏设定主文件，负责：
;DLL和TJS插件载入、层信息设置、其他宏载入、界面配置文件载入
;------------------------------------------------------------
*start
;------------------------------------------------------------
;DLL插件载入
;------------------------------------------------------------
;OGG、MP3播放插件
[loadplugin module="wuvorbis.dll"] 
;[loadplugin module="wump3.dll"]
;切换特效增强插件
[loadplugin module="extrans.dll"]
[loadplugin module="extNagano.dll"]
;------------------------------------------------------------
;层数量
;------------------------------------------------------------
[laycount layers=18]
[laycount messages=5]
;------------------------------------------------------------
;层顺位
;------------------------------------------------------------
;背景层
[layopt layer=stage index=100 withback=true]
;立绘
[layopt layer="0" index=200 withback=true]
[layopt layer="1" index=300 withback=true]
[layopt layer="2" index=400 withback=true]
[layopt layer="3" index=500 withback=true]
[layopt layer="4" index=600 withback=true]
[layopt layer="5" index=700 withback=true]
;动态
[layopt layer="6" index=800 withback=true]
[layopt layer="7" index=900 withback=true]
;----------------------------------------------
;预留
;[layopt layer="event" index=1000 withback=true]
;对话框、标题画面按钮
[layopt layer="message0" index=1100 withback=true]
;头像层、标题前景图层
[layopt layer="8" index=1200 withback=true]
;选择支
[layopt layer="message1" index=1300 withback=true]
;预留
[layopt layer="9" index=1400 withback=true]
;预留
[layopt layer="10" index=1500 withback=true]
;----------------------------------------------
;系统按钮(sysbutton)
[layopt layer="message2" index=2000 withback=true]
;----------------------------------------------
;自制系统预留（地图、养成、EXTRA用）
;----------------------------------------------
;地图/养成/CG/BGM鉴赏背景
[layopt layer="11" index=3000 withback=true]
;地图/养成/EXTRA按钮
[layopt layer="message3" index=3100 withback=true]
;养成画面的文字、数值、图像显示
[layopt layer="12" index=3200 withback=true]
;地图据点显示时额外显示的悬停图片
[layopt layer="13" index=3300 withback=true]
;----------------------------------------------
;系统菜单背景（MAIN、SAVE、LOAD、OPTION）
;----------------------------------------------
[layopt layer="14" index=3400 withback=true]
;菜单层2
[layopt layer="message4" index=3500 withback=true]
;option画面高亮效果、存取按钮新档标记&截图显示
[layopt layer="15" index=3600 withback=true]
;存取画面悬停文字显示、CG模式的CG大图
[layopt layer="16" index=3700 withback=true]
;存取画面悬停图片显示
[layopt layer="17" index=3800 withback=true]
;------------------------------------------------------------
;载入游戏需要的函数和配置表
;------------------------------------------------------------
[iscript]
//载入自定义SL函数，覆盖mainwindow.tjs里的默认函数
KAGLoadScript("MySaveLoadFunction.tjs");

//载入配置文件
f.setting=Scripts.evalStorage("setting.tjs");
f.config_title=Scripts.evalStorage("uititle.tjs");
f.config_dia=Scripts.evalStorage('uidia.tjs');
f.config_menu=Scripts.evalStorage("uimenu.tjs");
f.config_slpos=Scripts.evalStorage("uislpos.tjs");
f.config_option=Scripts.evalStorage("uioption.tjs");
f.config_history=Scripts.evalStorage("uihistory.tjs");
f.config_name=Scripts.evalStorage("namelist.tjs");
f.config_save=Scripts.evalStorage("uisave.tjs");
f.config_load=Scripts.evalStorage("uiload.tjs");
//载入CG界面配置表
f.config_cgmode=Scripts.evalStorage("uicgmode.tjs");
//载入bgm界面配置表
f.config_bgmmode=Scripts.evalStorage("uibgmmode.tjs");
//载入end界面配置表
f.config_endmode=Scripts.evalStorage("uiendmode.tjs");
[endscript]
;------------------------------------------------------------
;载入游戏需要的宏和TJS插件
;------------------------------------------------------------
[call storage="function.ks"]

[call storage="macro_ui.ks"]
[call storage="macro_sl.ks"]

[call storage="macro_play.ks"]
[call storage="macro_name.ks"]
[call storage="macro_map.ks"]
[call storage="macro_edu.ks"]
[call storage="macro_cg.ks"]
[call storage="macro_bgm.ks"]
[call storage="macro_end.ks"]

;载入自定义宏
[call storage="macro_self.ks"]

;载入插件
[call storage="PicScroller.ks"]
[call storage="AnimPlayer.ks"]
;限时选项时间槽
[call storage=timebar.ks]
;粒子特效
[call storage=oldMovie.ks]
[call storage=snow.ks]
[call storage=rain.ks]
[call storage=fog.ks]
[call storage=sakura.ks]
[call storage=momiji.ks]
[call storage=firefly.ks]
;----------------------------------------------
;消息层默认定义
;----------------------------------------------
;防止因为Config.tjs里没有修改消息层大小导致的显示错误
[frame layer="message0" visible=true]
[frame layer="message1" visible=false]
[frame layer="message2" visible=false]
[frame layer="message3" visible=false]
[frame layer="message4" visible=false]
;------------------------------------------------------------
[return]
