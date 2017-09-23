;;----------------------------------------------------------------------
;; E-moteプレイヤー初期化
;;----------------------------------------------------------------------
[call storage="emoteplayer.ks"]
[emoteenv meshdivisionratio=0.5 bustscale=1 hairscale=1 partsscale=1]
[image storage="snow_bg" page=fore layer=base]
[position layer=message1 page=fore left=16 top=416 width=768 height=168 marginl=8 margint=8 marginr=8 marginb=8 visible=true]

;;----------------------------------------------------------------------
;; マクロ設定
;;----------------------------------------------------------------------
[macro name=begintag]
[current layer=message1]
[nowait]
[endmacro]

[macro name=endtag]
[current layer=message0]
[endnowait]
[endmacro]

[macro name=em]
[font color=0xFF8080]
[endmacro]

[macro name=endem]
[resetfont]
[endmacro]

;;----------------------------------------------------------------------
;; 選択画面
;;----------------------------------------------------------------------
*start|一覧

[cm]
[nowait]
E-mote for KAG 入門[r]
[link storage=tutorial1.ks](1) E-moteの基本[endlink][r]
[link storage=tutorial2.ks](2) 属性の変更[endlink][r]
[link storage=tutorial3.ks](3) キャラの前後関係[endlink][r]
[link storage=tutorial4.ks](4) 変数値の設定[endlink][r]
[link storage=tutorial5.ks](5) タイムラインの再生[endlink][r]
[link storage=tutorial6.ks](6) 裏画面の活用[endlink][r]
[link storage=tutorial7.ks](7) ボイスとの同期[endlink][r]
[link storage=tutorial8.ks](8) 環境設定[endlink][r]
[link storage=etc.ks](ex) その他の注意点[endlink][r]
[if exp="emote_get_d3d_available()"]
[if exp="sf.emote_used3d==0"]
[link target=*d3d_on]Direct3D描画(オン/*オフ)[endlink]
[else]
[link target=*d3d_off]Direct3D描画(*オン/オフ)[endlink]
[endif]
[endif]
[endnowait]
[s]

*d3d_on|
[emoteenv used3d=1]
[jump target=*start]

*d3d_off|
[emoteenv used3d=0]
[jump target=*start]

