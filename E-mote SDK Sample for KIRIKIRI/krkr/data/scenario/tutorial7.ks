;;----------------------------------------------------------------------
;; ボイスとの同期
;;----------------------------------------------------------------------
*start|ボイスとの同期

[cm]

[emotestart seg=0 storage=emote_test_front.psb]

E-moteでは、変数[em]face_talk[endem]に値を指定して、口パクも滑らかに行わせることが出来ます。
[p][er]

[emotevariable seg=0 name=face_talk value=5 time=200]
[emotewait seg=0]
[emotevariable seg=0 name=face_talk value=0 time=200]
[emotewait seg=0]
[emotevariable seg=0 name=face_talk value=5 time=200]
[emotewait seg=0]
[emotevariable seg=0 name=face_talk value=0 time=200]
[emotewait seg=0]

ですが、さすがに口パクをいちいち手でつけるのは現実的ではありませんよね。[l][r]
何らかの便利な手段はないものか？[l][r]
もちろん、用意してあります！
[p][er]

E-moteエディタは[em]ボイスボリュームを解析する[endem]という機能で、ボイスの音量を解析して、E-moteの変数に割り当てるのにちょうどいい数値の一覧表を作って出力する機能を持っています。[l][r]
E-mote for KAGでは、この音声ボリューム解析ファイルを読み込んで、自動的に変数の値を更新することが出来ます。
[p][er]

では、実際にやってみましょう。
[p][er]

[seopt volume=25]

[begintag]
[[playse buf=0 storage=emote1.wav][r]
[[emotevariable seg=0 name=face_talk storage=emote1.vol.csv]
[endtag]

[playse buf=0 storage=emote1.wav]
[emotevariable seg=0 name=face_talk storage=emote1.vol.csv]
[ws]

ちゃんとボイスに合わせてそれらしく口パクがされましたね。
[p][er]

テキストファイルからの変数指定には、 emotevariable タグを使います。[l][r]

[begintag]
[er]
[[playse buf=0 storage=emote1.wav][r]
[[emotevariable seg=0 name=face_talk [em]storage=emote1.vol.csv[endem]]
[endtag]

[em]storage[endem]属性でテキストファイルのファイル名を指定することで、変数の値をそのファイルから読み込んで自動的に更新してくれます。
[p][er]

では、続けていくつか他のボイスも再生してみましょう。
[p][er]

[begintag]
[er]
[[playse buf=0 storage=emote2.wav][r]
[[emotevariable seg=0 name=face_talk [em]storage=emote2.vol.csv[endem]]
[endtag]

[playse buf=0 storage=emote2.wav]
[emotevariable seg=0 name=face_talk storage=emote2.vol.csv]
[ws]

[p]

[begintag]
[er]
[[playse buf=0 storage=emote3.wav][r]
[[emotevariable seg=0 name=face_talk [em]storage=emote3.vol.csv[endem]]
[endtag]

[playse buf=0 storage=emote3.wav]
[emotevariable seg=0 name=face_talk storage=emote3.vol.csv]
[ws]

[p][cm]

吉里吉里に限った機能ですが、再生中のSEバッファから直接ボリュームを取得して口パクに反映させることも出来ます。[l][r]
試してみましょう。
[p][er]

[begintag]
[er]
[[playse buf=0 storage=emote1.wav][r]
[[emotevariable seg=0 name=face_talk buf=0]
[endtag]

[playse buf=0 storage=emote1.wav]
[emotevariable seg=0 name=face_talk buf=0]
[ws]

今度はテキストを参照せずに、直接playseで鳴らしたSEバッファのボリュームを参照して口パクを行いました。[l][r]

[begintag]
[er]
[[playse buf=0 storage=emote1.wav][r]
[[emotevariable seg=0 name=face_talk [em]buf=0[endem]]
[endtag]

[em]buf[endem]属性でSEバッファの番号を指定することで、変数の値をそのバッファから読み込んで自動的に更新してくれます。
[p][cm]

この機能を使うには、SEバッファの音量を取得するため、getSample.dll をリンクしておく必要があります。[l][r]

[begintag]
system/Override.tjs[r]
--[r]
Plugins.link("getSample.dll");[r]
[endtag]

KAGの初期化前に dll のリンクが完了していないといけないため、下記のように Override.tjs でプラグインをロードしておきます。
[p][cm]

他のボイスも、buf指定で口パクをさせてみましょう。
[p][er]

[begintag]
[er]
[[playse buf=0 storage=emote2.wav][r]
[[emotevariable seg=0 name=face_talk [em]buf=0[endem]]
[endtag]

[playse buf=0 storage=emote2.wav]
[emotevariable seg=0 name=face_talk buf=0]
[ws]

[p]

[begintag]
[er]
[[playse buf=0 storage=emote3.wav][r]
[[emotevariable seg=0 name=face_talk [em]buf=0[endem]]
[endtag]

[playse buf=0 storage=emote3.wav]
[emotevariable seg=0 name=face_talk buf=0]
[ws]

[p][cm]

[em]storage[endem]指定と[em]buf[endem]指定では、計算式が異なるため口パクの挙動の詳細が異なります。[l][r]
E-moteエディタでボイスを解析したテキストを利用する場合、詳細な解析を行うので非常に滑らかなアニメーションを生成します。[l][r]
ボイスをgetSample.dllリアルタイムに解析する場合、前準備が要らないので導入がお手軽です。[l][r]
ワークフローに合わせて、お好みの手法をお選びください。
[p]

[emotestop seg=0]

[jump storage=first.ks target=*start]


