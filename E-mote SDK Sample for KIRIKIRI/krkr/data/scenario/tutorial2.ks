;;----------------------------------------------------------------------
;; 属性の変更
;;----------------------------------------------------------------------
*start|属性の変更

[cm]

[begintag]
[er]
[[emotestart seg=0 storage=emote_test_front.psb]
[endtag]

[emotestart seg=0 storage=emote_test_front.psb]

E-moteキャラには様々な[em]属性[endem]を設定する事ができます。
[p][er]

これには [em]emoteopt[endem]タグを使います。[l][r]
試しにこのタグを使って、キャラを右に移動させてみましょう。
[p][er]

[begintag]
[er]
[[emotestart seg=0 storage=emote_test_front.psb][r]
[[[em]emoteopt[endem] seg=0 xofs=300]
[endtag]

[emoteopt seg=0 xofs=300]

キャラがすぱっと右に移動しました。
[p][er]

[begintag]
[er]
[[emotestart seg=0 storage=emote_test_front.psb][r]
[[emoteopt seg=0 [em]xofs=300[endem]]
[endtag]

emoteoptタグの [em]xofs[endem] 属性を使って、X方向のオフセットを指定しています (対になる yofs 属性を使ってY方向のオフセットも指定できます)。
[p][er]

[begintag]
[er]
[[emoteopt seg=0 xofs=-300]
[endtag]

[emoteopt seg=0 xofs=-300]

すぱっ。
[p][er]

[begintag]
[er]
[[emoteopt seg=0 xofs=-300][r]
[[emoteopt seg=0 xofs=300]
[endtag]

[emoteopt seg=0 xofs=300]

すぱぱっ。
[p][er]

移動するのはよいのですが、ちょっと髪が派手に揺れすぎでうっとおしいですね。[l][r]
こういう時は [em]skip[endem] 属性を使うと移動に伴う物理挙動をキャンセルすることが出来ます。
[p][er]

[begintag]
[er]
[[emoteopt seg=0 xofs=-300 [em]skip=true[endem]]
[endtag]

[emoteopt seg=0 xofs=-300 skip=true]

すぱっ。[l][r]

[begintag]
[er]
[[emoteopt seg=0 xofs=-300 skip=true][r]
[[emoteopt seg=0 xofs=300 [em]skip=true[endem]]
[endtag]

[emoteopt seg=0 xofs=300 skip=true]

すぱぱっ。
[p][er]
 
ね、簡単でしょう？
[p][er]

E-moteの属性は、emoteoptタグに[em]time[endem]属性を指定することで、一定の時間をかけて変更させることも出来ます。
[p][er]

[begintag]
[er]
[[emoteopt seg=0 xofs=-300 [em]time=1000[endem]]
[endtag]

[emoteopt seg=0 xofs=-300 time=1000]
1000ミリ秒(1秒)かけて左に移動…。[l][r]
[emotewait seg=0]

[begintag]
[er]
[[emoteopt seg=0 xofs=-300 time=1000][r]
[[emoteopt seg=0 xofs=300 [em]time=1000[endem]]
[endtag]

[emoteopt seg=0 xofs=300 time=1000]
再び右に折り返し…。
[emotewait seg=0]
[p][er]

今は等速の移動をさせましたが、[em]easing[endem]属性を指定することで、徐々に速くなったり徐々に遅くなったりする動きをさせることも出来ます。
[p][er]

[begintag]
[er]
[[emoteopt seg=0 xofs=-300 time=1000 [em]easing=-1.5[endem]]
[endtag]

[emoteopt seg=0 xofs=-300 time=1000 easing=-1.5]
負の数を指定すると、徐々に遅くなるイーズインの動き…。[l][r]
[emotewait seg=0]

[begintag]
[er]
[[emoteopt seg=0 xofs=-300 time=1000 easing=-1.5][r]
[[emoteopt seg=0 xofs=300 time=1000 [em]easing=1.5][endem]
[endtag]

[emoteopt seg=0 xofs=300 time=1000 easing=1.5]
正の数を指定すると、徐々に速くなるイーズアウトの動きをします。
[emotewait seg=0]

[p][cm]

[emoteopt seg=0 xofs=0 skip=true]

emoteopt タグで指定できる属性はオフセットだけではありません。
[p][er]

[begintag]
[er]
[[emoteopt seg=0 [em]zoom=1.5[endem]]
[endtag]

[emoteopt seg=0 zoom=1.5]
[em]zoom[endem]属性で表示倍率を変更したり。[l][r]

[begintag]
[er]
[[emoteopt seg=0 zoom=1.5][r]
[[emoteopt seg=0 [em]rot=45[endem]]
[endtag]

[emoteopt seg=0 rot=45]
[em]rot[endem]属性で角度を変更したり。[l][r]

[begintag]
[er]
[[emoteopt seg=0 zoom=1.5][r]
[[emoteopt seg=0 rot=45][r]
[[emoteopt seg=0 [em]color=0x804040[endem]]
[endtag]

[emoteopt seg=0 color=0x804040]
[em]color[endem]属性でDIFFUSEカラーを変更したり。
[p][er]

[begintag]
[er]
[[emoteopt seg=0 zoom=1.5][r]
[[emoteopt seg=0 rot=45][r]
[[emoteopt seg=0 color=0x804040][r]
[[emoteopt seg=0 [em]zoom=1 rot=0 color=0x808080 time=1000[endem]]
[endtag]

[emoteopt seg=0 zoom=1 rot=0 color=0x808080 time=1000]
もちろん、これらの属性はまとめて一度に変更することも出来ます。
[emotewait seg=0]

[p][cm]

time属性で時間指定のアニメーションをした場合、[em]emotewait[endem]タグを使って再生終了を待つことが出来ます。
[p][er]

[begintag]
[er]
[[emoteopt seg=0 zoom=0.3 time=2000 easing=-1][r]
[em][[emotewait seg=0][endem][r]
[endtag]

[emoteopt seg=0 zoom=0.3 time=2000 easing=-1]
[emotewait seg=0]

[begintag]
[er]
[[emoteopt seg=0 zoom=0.3 time=2000 easing=-1][r]
[[emotewait seg=0][r]
[[emoteopt seg=0 zoom=1 time=2000 easing=1][r]
[em][[emotewait seg=0][endem][r]
[endtag]

[emoteopt seg=0 zoom=1 time=2000 easing=1]
[emotewait seg=0]

順序通り再生されましたね？
[p][er]

emotewait中は、画面をクリックすることでアニメーションをスキップすることが出来ます。[l][r]
もう一度同じ処理をするので画面をクリックして飛ばしてみましょう。
[p][er]

[begintag]
[er]
[[emoteopt seg=0 zoom=0.3 time=2000 easing=-1][r]
[em][[emotewait seg=0][endem][r]
[endtag]

[emoteopt seg=0 zoom=0.3 time=2000 easing=-1]
[emotewait seg=0]

[begintag]
[er]
[[emoteopt seg=0 zoom=0.3 time=2000 easing=-1][r]
[[emotewait seg=0][r]
[[emoteopt seg=0 zoom=1 time=2000 easing=1][r]
[em][[emotewait seg=0][endem][r]
[endtag]

[emoteopt seg=0 zoom=1 time=2000 easing=1]
[emotewait seg=0]

ちゃんとスキップできましたか？
[p][er]

スキップして欲しく無い場合は、 emotewait タグに [em]canskip[endem]属性を指定することで、明示的にスキップを禁止することが出来ます。[l][r]
もう一度同じ処理をするので再び画面をクリックしてみましょう。
[p][er]

[begintag]
[er]
[[emoteopt seg=0 zoom=0.3 time=2000 easing=-1][r]
[[emotewait seg=0 [em]canskip=false[endem]][r]
[endtag]

[emoteopt seg=0 zoom=0.3 time=2000 easing=-1]
[emotewait seg=0 canskip=false]

[begintag]
[er]
[[emoteopt seg=0 zoom=0.3 time=2000 easing=-1][r]
[[emotewait seg=0 canskip=false][r]
[[emoteopt seg=0 zoom=1 time=2000 easing=1][r]
[[emotewait seg=0 [em]canskip=false[endem]][r]
[endtag]

[emoteopt seg=0 zoom=1 time=2000 easing=1]
[emotewait seg=0 canskip=false]

今度はスキップ出来ませんでしたね？
[p][cm]

[emotestop seg=0]

ちなみに emoteoptで指定できる属性は、 [em]emotestart[endem] で表示を開始する時にも指定することが出来ます。
[p][er]

[begintag]
[[emotestart seg=0 storage=emote_test_front.psb [em]xofs=200 rot=30 color=0x404080[endem]]
[endtag]

[emotestart seg=0 storage=emote_test_front.psb xofs=200 rot=30 color=0x404080]

表示開始時点から、属性を指定できているのがわかりますね。
[p][er]

基本的に全てのE-moteの属性は、 emotestart タグでも emoteopt タグでも指定することが出来ます。[l][r]
ここまで説明していませんでしたが、実は[em]storage[endem]属性も、両者共通で指定が可能な属性の一つです。
[p][er]

[begintag]
[er]
[[emotestart seg=0 storage=emote_test_front.psb xofs=200 rot=30 color=0x404080][r]
[[emoteopt seg=0 [em]storage=emote_test_slant.psb[endem]]
[endtag]

[emoteopt seg=0 storage=emote_test_slant.psb]

つまりこうして、emoteopt タグで storage 属性を使ってE-moteキャラを切り替えることも出来るというわけですね。
[p][er]

属性の変更は、E-moteの演出の基礎です。[l][r]
この辺のタグの使い方は暗記して暗唱できるくらいになっておくとベストでしょう。
[p][cm]

[emotestop seg=0]

[jump storage=first.ks target=*start]

