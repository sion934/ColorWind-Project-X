;;----------------------------------------------------------------------
;; E-moteの基本
;;----------------------------------------------------------------------
*start|E-moteの基本

[cm]

E-mote for KAGを利用するためには、 [em]emoteoplayer.dll[endem] と [em]emoteplayer.ks[endem]の
2つのファイルが必須です。[l][r]
前者をpluginフォルダに、後者をscenarioフォルダに配置して下さい。
[p][er]

[begintag]
[em][[call storage="emoteplayer.ks"][endem]
[endtag]

その状態で、first.ks の 冒頭で以下のように emoteplayer.ks を呼び出してやることで、E-mote拡張タグが利用可能な状態になります。
[p][er]

さて、それではE-moteキャラを表示してみます。
[p][er]

[begintag]
[er]
[[[em]emotestart[endem] seg=0 storage=emote_test_front.psb]
[endtag]

[emotestart seg=0 storage=emote_test_front.psb]
こんな風に [em]emotestart[endem] タグでE-moteキャラの表示を開始します。
[p][er]

[begintag]
[er]
[[emotestart [em]seg=0[endem] storage=emote_test_front.psb]
[endtag]

seg属性ではE-moteキャラを表示する「セグメント」を指定します。[l][r]
「セグメント」は複数のE-moteキャラを識別するために使う数字です。[l][r]
0以上の整数ならどんな数字を設定しても構いません。[l][r]
キャラごとに異なる数字を割り当てるとよいでしょう。
[p][er]

[begintag]
[er]
[[emotestart seg=0 [em]storage=emote_test_front.psb[endem]]
[endtag]

storage属性で、E-moteキャラのファイル名を指定します。[l][r]
E-moteエディタからKRKRフォーマットでエクスポートしたpsbファイルが対象です。
[p][er]

次に、E-moteキャラを消去してみましょう。
[p][er]

[begintag]
[er]
[[emotestart seg=0 storage=emote_test_front.psb][r]
[[[em]emotestop[endem] seg=0]
[endtag]

[emotestop seg=0]
emotestart と対になる [em]emotestop[endem] タグを記述するだけです。[l][r]
簡単ですね。
[p][er]

[begintag]
[er]
[[emotestart [em]seg=0[endem] storage=emote_test_front.psb][r]
[[emotestop [em]seg=0[endem]]
[endtag]

emotestart で指定したのと同じセグメントを指定しています。[l][r]
これに限らず、E-moteの指定を行う（ほぼ）全てのタグではセグメントをまず指定します。[l][r]
基本中の基本なので忘れずに。
[p][cm]

[jump storage=first.ks target=*start]
