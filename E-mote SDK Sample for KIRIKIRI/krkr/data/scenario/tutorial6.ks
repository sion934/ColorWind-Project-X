;;----------------------------------------------------------------------
;; 裏画面の活用
;;----------------------------------------------------------------------
*start|裏画面の活用

[cm]

ここまで解説を見てきて、ひとつ気になっていることがあるのではないでしょうか？
[p][er]


それは、キャラが[emotestart seg=0 storage=emote_test_front.psb]「ぱっと出たり」「ぱっと消えたり」[emotestop seg=0]しかしない、いわゆる「パ消え」の状態になっていることです。
[p][er]

これだと演出の幅が狭くなってしまう…と不安になっているそこのあなた。[l][r]
ご心配なく、もちろんE-moteでも吉里吉里/KAGのセオリーであるトランジションをからめた演出が出来るようになっています！
[p][er]


ここまで解説の簡単化のためにはしょってきましたが、
E-mote制御系の全てのタグは、[em]page[endem]属性を使って表画面を対象か裏画面を対象か、指定を行うことが出来ます。[l][r]
[em]page=fore[endem]で表画面、[em]page=back[endem]で裏画面が操作対象になるという、imageタグなどイメージレイヤ操作系のタグと同等の属性指定になっています。[l][r]
省略すると[em]fore[endem]を指定したのと同じことになるので、今までは常に表画面を対象に操作が実行されていたわけです。
[p][er]

裏画面の操作手順はイメージレイヤ系のセオリーと同等で、[r]
(1)まずbacklayタグで表画面の内容を裏画面にコピーして[r]
(2)適当なタグで裏画面の属性を変更して[r]
(3)transタグでトランジションを開始して[r]
(4)wtタグでトランジションの終了を待つ[r]
となっています。
[p][er]

では早速やってみましょう。
[p][er]

[begintag]
[[backlay][r]
[[emotestart seg=0 page=back storage=emote_test_front.psb][r]
[[trans method=crossfade time=1000][r]
[[wt][r]
[endtag]

[backlay]
[emotestart seg=0 page=back storage=emote_test_front.psb]
[trans method=crossfade time=1000]
[wt]

[begintag]
[er]
[[backlay][r]
[[emotestart seg=0 [em]page=back[endem] storage=emote_test_front.psb][r]
[[trans method=crossfade time=1000][r]
[[wt][r]
[endtag]

emotestartタグに[em]page=back[endem]を指定することで、ちゃんと裏画面から表示が開始されています。
[p][er]

次は、同様に表示を消してみましょう。
[p][er]

[begintag]
[er]
[[backlay][r]
[[emotestop seg=0 page=back][r]
[[trans method=crossfade time=1000][r]
[[wt][r]
[endtag]

[backlay]
[emotestop seg=0 page=back]
[trans method=crossfade time=1000]
[wt]

[begintag]
[er]
[[backlay][r]
[[emotestop seg=0 [em]page=back[endem]][r]
[[trans method=crossfade time=1000][r]
[[wt][r]
[endtag]

emotestopタグに[em]page=back[endem]を指定することで、トランジションしながらE-moteの再生を終了することが出来ました。
[p][cm]

裏画面を使ったトランジションをからめた演出は、開始・停止だけでなく、様々な応用を効かせることが出来ます。
[p][er]

[emotestart seg=0 storage=emote_test_front.psb]

たとえば、拡大しながらトランジションをしたり…。
[p]

[begintag]
[er]
[[backlay][r]
[[emoteopt seg=0 page=back [em]zoom=2[endem]][r]
[[trans method=crossfade time=1000][r]
[[wt][r]
[endtag]

[backlay]
[emoteopt seg=0 page=back zoom=2]
[trans method=crossfade time=1000]
[wt]

[p][cm]

[emotestop seg=0]
[emotestart seg=0 storage=emote_test_front.psb]

たとえば、移動アニメをしながらトランジションをしたり…。
[p]

[begintag]
[er]
[[backlay][r]
[[emoteopt seg=0 page=back [em]xofs=300 time=1000[endem]][r]
[[trans method=crossfade time=1000][r]
[[wt][r]
[endtag]

[backlay]
[emoteopt seg=0 page=back xofs=300 time=1000]
[trans method=crossfade time=1000]
[wt]

[p][cm]

[emotestop seg=0]
[emotestart seg=0 storage=emote_test_front.psb]

たとえば、ファイルを切り替えながらトランジションをしたり…。
[p]

[begintag]
[er]
[[backlay][r]
[[emoteopt seg=0 page=back [em]storage=emote_test_slant.psb[endem]][r]
[[trans method=crossfade time=1000][r]
[[wt][r]
[endtag]

[backlay]
[emoteopt seg=0 page=back storage=emote_test_slant.psb]
[trans method=crossfade time=1000]
[wt]

[p][er]

emoteoptだけでなく、変数指定やタイムライン指定のタグでも、裏画面を操作対象に指定することで同様にトランジションを行いながらの動作開始を行うことが出来ます。[l][r]
あなただけの演出効果をぜひ開発してみて下さい。
[p][cm]

[emotestop seg=0]

[jump storage=first.ks target=*start]



