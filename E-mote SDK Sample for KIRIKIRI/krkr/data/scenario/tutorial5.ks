;;----------------------------------------------------------------------
;; タイムラインの再生
;;----------------------------------------------------------------------
*start|タイムラインの再生

[cm]

[emotestart seg=0 storage=emote_test_front.psb]

変数設定による演技付けは確かに便利な機能です。[l][r]
キャラの細やかな感情をセリフに合わせて情感たっぷりに表現できます。
[p][er]

ですが、それは「演技をそれだけ手動でつけなければいけない」と言うことでもあります。[l][r]
あらゆる演技を、すべて emotevariable タグの組み合わせで付けていっては、手間がかかりすぎて作業量が爆発してしまいます。[l][r]
作業の手間と見返りが見合わなくなってしまうというわけです。
[p][er]

もちろん、E-moteではこの問題にも回答を用意してあります。
[p][er]

E-moteエディタでは、時系列に複数の変数の遷移を定義する「タイムラインエディット」機能を持っています。[l][r]
定型的な動きについては、タイムラインで定義しておいて、それらをまとめて再生することで、変数指定の手間を大いに簡略化できます。
[p][er]

では、早速タイムラインを再生してみましょう。
[p][er]

[begintag]
[er]
[[[em]emoteplaytimeline[endem] seg=0 name=sample_全自動_test]
[endtag]

[emoteplaytimeline seg=0 name=sample_全自動_test]

タイムラインの再生には、[em]emoteplaytimeline[endem]タグを使います。[l][r]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_全自動_test[endem]]
[endtag]

[em]name[endem]属性で、E-moteエディタで定義したタイムラインの名前を指定してやると、再生が始まります。
[p][er]

このサンプルタイムラインはループ設定になっているため、放っておくといつまでも再生され続けてしまいます。[l][r]
こうしたループタイムラインを停止させるには、明示的にタイムラインの停止を指定してやります。
[p][er]


[begintag]
[er]
[[emoteplaytimeline seg=0 name=sample_全自動_test][r]
[[[em]emotestoptimeline[endem] seg=0 name=sample_全自動_test]
[endtag]

[emotestoptimeline seg=0 name=sample_全自動_test]

[em]emotestoptimeline[endem] タグにタイムラインの名前を指定することで、指定のタイムラインを止めることが出来ます。
[p][cm]

ループ設定でないタイムラインの場合、例によってemotewaitタグによって、再生終了を待つことができます。[l][r]
canskipの指定を省略していれば、クリックでスキップも可能です。[l][r]
いくつか連続して再生してみるので、適当にスキップなど試してみましょう。
[p]
[er]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_00[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_00]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_01[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_01]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_02[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_02]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_03[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_03]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_04[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_04]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_05[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_05]
[emotewait seg=0]

どうでしたか？[l][r]
念のため、もう１度繰り返してみましょう。
[p]
[er]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_00[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_00]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_01[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_01]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_02[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_02]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_03[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_03]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_04[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_04]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_05[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_05]
[emotewait seg=0]

ちゃんとスキップできましたか？[p]
[cm]

E-moteでのタイムラインの用途は、「決まった動作を行わせること」だけではありません。[l][r]
呼吸による肩の上下、動揺による視線の乱れ、興味のある物事に姿勢が前のめりになる、そういった表現を通常の変数表現に「足し込んで」表現する「差分タイムライン」と言う仕組みがあります。
[p]
[er]

通常タイムラインを再生すると変数値を設定したそのままの値で上書きしていきます。[l][r]
ですが、E-moteエディタで「差分用途」にチェックを入れたタイムラインをKAGで再生すると、他のタイムラインや変数タグで設定した変数の値に、自身の値を「足し込んで」設定するように動作します。
[p]
[er]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=差分用_waiting_loop2[endem]]
[endtag]

[emoteplaytimeline seg=0 name=差分用_waiting_loop2]

今再生を開始した[em]差分用_waiting_loop2[endem]は、E-moteエディタで「差分用途」にチェックを入れたタイムラインです。[l][r]
身体の微細な横揺れを表現しています。
[p][er]

このタイムラインを再生したまま、ふたたび通常タイムラインを連続再生してみます。
[p]
[er]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_00[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_00]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_01[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_01]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_02[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_02]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_03[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_03]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_04[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_04]
[emotewait seg=0]

[begintag]
[er]
[[emoteplaytimeline seg=0 [em]name=sample_05[endem]][r]
[[emotewait seg=0]
[endtag]

[emoteplaytimeline seg=0 name=sample_05]
[emotewait seg=0]

横揺れと通常タイムラインが合成して再生されたのがわかりましたか？
[p]
[cm]

差分タイムラインは、感情表現などの「幅」を表現するため、その合成比率も自由に変更することも出来ます。[p]
[er]

[begintag]
[er]
[[[em]emotefadetimeline[endem] seg=0 name=差分用_waiting_loop2 ratio=3]
[endtag]

[emotefadetimeline seg=0 name=差分用_waiting_loop2 ratio=3]

[em]emotefadetimeline[endem]タグで、タイムラインの合成比率を変更しました。[l][r]

[begintag]
[er]
[[emotefadetimeline seg=0 name=差分用_waiting_loop2 [em]ratio=3[endem]]
[endtag]

[em]ratio[endem]属性で、初期値の1から3倍の3へと合成比率を変更しています。[l][r]
横揺れが激しくなったのがわかるかと思います。[p]
[cm]

こうした差分タイムラインは、いきなり停止すると「差分が打ち切られる」ため、唐突な消え方に見えてしまいます。[l][r]
試しにこのタイムラインをいきなり止めて見ましょう。
[p][er]

[begintag]
[er]
[[emotestoptimeline seg=0 name=差分用_waiting_loop2]
[endtag]

[emotestoptimeline seg=0 name=差分用_waiting_loop2]

唐突に横揺れが無くなりキャラが正面状態に戻ってしまいましたね？
[p]

こうした唐突感を無くすために、差分タイムラインを徐々にフェードイン・フェードアウトさせるタグが用意してあります。
[p]
[er]

[begintag]
[er]
[[[em]emotefadeintimeline[endem] seg=0 name=差分用_waiting_loop2 time=1000]
[endtag]

[emotefadeintimeline seg=0 name=差分用_waiting_loop2 time=1000]
[em]emotefadeintimeline[endem]タグで、徐々に差分タイムラインをフェードインさせ…[l][r]

[begintag]
[er]
[[em]emotefadeintimeline seg=0 name=差分用_waiting_loop2 time=1000][r]
[[[em]emotefadeouttimeline[endem] seg=0 name=差分用_waiting_loop2 time=1000]
[endtag]

[emotefadeouttimeline seg=0 name=差分用_waiting_loop2 time=1000]
[em]emotefadepouttimeline[endem]タグで、徐々に差分タイムラインをフェードアウトさせることが出来ます。
[p]
[cm]

差分タイムラインは、細やかな感情表現に向いています。[l][r]
反面、呼吸の上下動などの「微細ながら身体全体に影響する動き」をブレンドすると、常時アニメーションが続くため計算負荷が高くなるという欠点もあります。[l][r]
差分タイムラインの使用は、演出効果と処理負荷のトレードオフを考慮して慎重に検討することを推奨します。
[p][er]

タイムラインを使うと、複雑な変数の組み合わせによる複雑な演技を簡単に表現することができます。[l][r]
変数による場面ごとの細かい演技描写とうまく使い分け、労力の最小化と演出効果の最大化の両立をぜひ目指してみてください。
[p]

[cm]
[emotestop seg=0]

[jump storage=first.ks target=*start]



