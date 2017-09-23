;;----------------------------------------------------------------------
;; 変数値の設定
;;----------------------------------------------------------------------
*start|変数値の設定

[cm]

[emotestart seg=0 storage=emote_test_front.psb]

さて、いよいよE-moteキャラの本領発揮である、「演技の付け方」に踏み込みます。
[p][er]

E-moteキャラに演技をつけるには「変数」を使います。[l][r]
「変数」とは何か？[l][r]
教科書的には「名前と値の組み合わせ」とでも説明されます。[l][r]
でも、これでは何のことだかよくわかりませんね。
[p][er]

要するに、首の傾きや目線の向きなど、それぞれの「動きの要素」に「名前」をつけてやり、それらの「名前」にそれぞれ対応する「値」を設定することで、動きを制御しようということです。[l][r]
この「名前」のことを「変数」と呼んでいます。
[p][er]

E-moteでは、様々なキャラクタの挙動を、変数を使って制御できるようになっています。[l][r]
変数の詳細仕様はテンプレートの説明書に書いてあるのでそちらを見てください。[l][r]
本項では、その内いくつかを適当に試してみることにしましょう。
[p][er]

まずは、首の傾きを試してみましょう。[l][er]
首の傾きは[em]head_slant[endem]という名前の変数に対応しています。[l][er]
意味を持つ値の範囲は-30から30で、それぞれ左向き、右向きに対応しています。
[p][er]

[begintag]
[er]
[[[em]emotevariable[endem] seg=0 name=head_slant value=-30]
[endtag]

[emotevariable seg=0 name=head_slant value=-30]

変数の値は、このように[em]emotevariable[endem]タグで指定します。
[p][er]

[begintag]
[er]
[[emotevariable seg=0 [em]name=head_slant[endem] value=-30]
[endtag]

[em]name[endem]属性で変数の名前を指定して…[l][r]

[begintag]
[er]
[[emotevariable seg=0 name=head_slant [em]value=-30[endem]]
[endtag]

[em]value[endem]属性で変数の値を指定します。[r]
[p][er]

[begintag]
[er]
[[emotevariable seg=0 name=head_slant value=-30][r]
[[emotevariable seg=0 name=head_slant value=30 [em]time=1000 easing=-1[endem]]
[endtag]

[emotevariable seg=0 name=head_slant value=30 time=1000 easing=-1]

もちろん、[em]time[endem]属性や[em]easing[endem]属性を指定して、時間経過のアニメーションを行うことも出来ます。[l][r]
終了は、emoteoptの時間遷移と同様に、emotewaitタグで待ち合わせることが出来ます。
[emotewait seg=0]

[p][er]

[begintag]
[er]
[[emotevariable seg=0 name=head_slant value=-30 time=1000][r]
[endtag]

[emotevariable seg=0 name=head_slant value=-30 time=1000]
[emotewait seg=0]

[begintag]
[[emotevariable seg=0 name=head_slant value=30 time=1000][r]
[endtag]

[emotevariable seg=0 name=head_slant value=30 time=1000]
[emotewait seg=0]

[begintag]
[[emotevariable seg=0 name=head_slant value=-30 time=1000][r]
[endtag]

[emotevariable seg=0 name=head_slant value=-30 time=1000]
[emotewait seg=0]

[begintag]
[[emotevariable seg=0 name=head_slant value=30 time=1000][r]
[endtag]

[emotevariable seg=0 name=head_slant value=30 time=1000]
[emotewait seg=0]

こんな感じです。
[p][er]

さらに、複数の変数の動きを同時に制御することも出来ます。[l][r]
試しに腰の傾きである [em]body_slant[endem]を同時に制御してみましょう。
[p][er]

[begintag]
[er]
[[emotevariable seg=0 name=head_slant value=-30 time=500][r]
[[emotevariable seg=0 name=body_slant value=30 time=500][r]
[endtag]

[emotevariable seg=0 name=head_slant value=-30 time=500]
[emotevariable seg=0 name=body_slant value=30 time=500]

[emotewait seg=0]

[begintag]
[[emotevariable seg=0 name=head_slant value=30 time=500][r]
[[emotevariable seg=0 name=body_slant value=-30 time=500][r]
[endtag]

[emotevariable seg=0 name=head_slant value=30 time=500]
[emotevariable seg=0 name=body_slant value=-30 time=500]

[emotewait seg=0]

[begintag]
[er]
[[emotevariable seg=0 name=head_slant value=-30 time=500][r]
[[emotevariable seg=0 name=body_slant value=30 time=500][r]
[endtag]

[emotevariable seg=0 name=head_slant value=-30 time=500]
[emotevariable seg=0 name=body_slant value=30 time=500]

[emotewait seg=0]

[begintag]
[[emotevariable seg=0 name=head_slant value=30 time=500][r]
[[emotevariable seg=0 name=body_slant value=-30 time=500][r]
[endtag]

[emotevariable seg=0 name=head_slant value=30 time=500]
[emotevariable seg=0 name=body_slant value=-30 time=500]

[emotewait seg=0]

[begintag]
[er]
[[emotevariable seg=0 name=head_slant value=-30 time=500][r]
[[emotevariable seg=0 name=body_slant value=30 time=500][r]
[endtag]

[emotevariable seg=0 name=head_slant value=-30 time=500]
[emotevariable seg=0 name=body_slant value=30 time=500]

[emotewait seg=0]

[begintag]
[[emotevariable seg=0 name=head_slant value=30 time=500][r]
[[emotevariable seg=0 name=body_slant value=-30 time=500][r]
[endtag]

[emotevariable seg=0 name=head_slant value=30 time=500]
[emotevariable seg=0 name=body_slant value=-30 time=500]

[emotewait seg=0]

感覚は掴めましたか？
[p][cm]

[emotevariable seg=0 name=head_slant value=0 time=500]
[emotevariable seg=0 name=body_slant value=0 time=500]

E-moteでは変数を使ってキャラに多彩な表情を与えられます。[r]
[p][er]

[emotevariable seg=0 name=head_LR value=-30 time=500]
[emotevariable seg=0 name=head_UD value=-30 time=500]

 頭を動かしたり、[l][r]
[emotewait seg=0]

[emotevariable seg=0 name=face_eye_LR value=30 time=500]
[emotevariable seg=0 name=face_eye_UD value=30 time=500]

目線を動かしたり、[l][r]
[emotewait seg=0]

[emotevariable seg=0 name=face_eye_open value=20 time=500]
[emotevariable seg=0 name=face_eyebrow value=40 time=500]
[emotevariable seg=0 name=face_mouth value=30]
[emotevariable seg=0 name=face_talk value=5 time=500]

表情を変えたりと。[r]
[p][er]

変数を制する者はE-moteを制する。[l][r]
変数制御の秘奥を身につけて是非すばらしい演出を実現して下さい。
[p][cm]

[emotestop seg=0]

[jump storage=first.ks target=*start]







