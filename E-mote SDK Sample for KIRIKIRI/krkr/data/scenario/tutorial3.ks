;;----------------------------------------------------------------------
;; キャラの前後関係
;;----------------------------------------------------------------------
*start|キャラの前後関係

[cm]

[begintag]
[er]
[em]この解説はDirect3Dを使わずCPU描画をしている場合にのみ影響のある内容です。
GPU描画をしている場合は特におかしな表示には見えませんので念のため。[r]
[endem]
[endtag]

それでは今度は改めて、2人のキャラを同時に表示してみましょう。[l][r]
これまでの説明で原理はわかりますね？[l][r]
そう、異なるセグメントを指定してキャラを表示すればいいのです。
[p][er]

[begintag]
[er]
[[emotestart [em]seg=0[endem] storage=emote_test_front.psb xofs=-300 color=0x804040][r]
[[emotestart [em]seg=1[endem] storage=emote_test_front.psb xofs=300 color=0x404080]
[endtag]

[emotestart seg=0 storage=emote_test_front.psb xofs=-300 color=0x804040]
[emotestart seg=1 storage=emote_test_front.psb xofs=300 color=0x404080]

セグメント0と1、それぞれに emotestart を実行して、2体のキャラを同時に表示してみました。[l][r]
区別がつけやすいように色をそれぞれ変えてあります。
[p][er]

さて、そのまま2体のキャラを少しずつ近づけてみましょう。[l][r]

[begintag]
[er]
[endtag]

[emoteopt seg=0 xofs=-50 time=2000 easing=-2]
[emoteopt seg=1 xofs=50 time=2000 easing=-2]
[emotewait seg=0]
[emotewait seg=1]

！？[l][r]
なにやら重ね合わせがおかしなことになっていますね。
[p][er]

実はこれはバグでも何でもありません。[l][r]
E-moteでは、処理の高速化のため、キャラを構成するパーツ毎に吉里吉里の「レイヤ」を割り当てています。[l][r]
このキャラだとおおよそ20枚前後のレイヤで構成されているため、その順序が入り組むと、重ねた際にこうした気持ち悪い事態になるのはある意味当然のことです。
[p][er]

この問題を解決するには[em]index[endem]属性を使って、前後関係を明示的に指定してやります。
[p][er]

[begintag]
[er]
[[emoteopt seg=0 [em]index=0[endem]][r]
[[emoteopt seg=1 [em]index=1000[endem]]
[endtag]

[emoteopt seg=0 index=0]
[emoteopt seg=1 index=1000]

ぱっ。[r]
[p][er]

このように、emoteopt、あるいはemotestartでindex属性を指定してやると、indexの大きいE-moteキャラの方が手前に表示されるようになります。
[p][er]

indexの値は、imageタグやlayoptタグでKAGのメッセージレイヤやイメージレイヤに対してindex属性を指定するのと全く同じ意味を持っています。[l][r]
つまり、それらのレイヤとの前後関係もindex属性の指定で問題無く行う事が出来ます。
[p][er]

先に説明したように、E-moteキャラは1体あたり20～30枚程度のレイヤを使っています。[l][r]
つまり、index=1000を指定して表示したキャラは、実際には内部的には1020から1030あたりまでindexを消費しています。[l][r]
複数のE-moteキャラ、イメージレイヤ間で重ね合わせを制御する際は、indexの間隔にはじゅうぶん余裕を持つようにしておきましょう。
[p][cm]

[emotestop seg=0]
[emotestop seg=1]

[jump storage=first.ks target=*start]

