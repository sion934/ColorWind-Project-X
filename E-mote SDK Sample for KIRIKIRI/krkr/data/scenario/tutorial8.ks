;;----------------------------------------------------------------------
;; 環境設定
;;----------------------------------------------------------------------
*start|環境設定

[cm]

E-moteではいくつか、「キャラ個別に設定する必要は無く、まとめて設定してしまえばよい」パラメータがあります。[l][r]
これらのパラメータをE-moteの[em]環境設定[endem]と呼びます。[l][r]
環境設定は [em]emoteenv[endem] タグで設定します。[l][r]
設定した数値は、システム変数 [em]sf[endem]に保存されます。
[p][er]

対象となるパラメータは[r]
メッシュ分割率 (meshdivisionratio)[r]
髪揺れスケール (hairscale)[r]
胸揺れスケール (bustscale)[r]
パーツ揺れスケール (partsscale)[r]
描画のDirect3D使用 (used3d)[r]
です。
[p][er]

では、ひとつずつ解説していきましょう。
[p][er]

[emotestart seg=0 storage=emote_test_front.psb]
[emoteplaytimeline seg=0 name=sample_全自動_test]

「メッシュ分割率」はメッシュ変形を行う際の分割の細かさを決める係数です。[l][r]
標準状態では1の値が設定されているのですが、この値を変えてみるとどうなるでしょうか？
[p][er]

[begintag]
[[emoteenv [em]meshdivisionratio=0[endem]]
[endtag]

[emoteenv meshdivisionratio=0]

[em]meshdivisionratio[endem]を0に設定してみました。[l][r]
キャラが動くと、形が崩れてしまっているのがわかるでしょうか？[l][r]
あまり値を小さくしてしまうと、このように変形が粗くなってしまいます。
[p][er]

では、逆に値を大きくしてみましょう。
[p][er]

[begintag]
[er]
[[emoteenv [em]meshdivisionratio=30[endem]]
[endtag]

[emoteenv meshdivisionratio=30]

[em]meshdivisionratio[endem]を30に設定してみました。[l][r]
形は綺麗ですが、処理がとても重くなっていますね。[l][r]
このように、値が大きすぎると頂点計算に負荷がかかり、ひどいことになってしまいます。
[p][er]

[begintag]
[er]
[[emoteenv [em]meshdivisionratio=0.5[endem]]
[endtag]

[emoteenv meshdivisionratio=0.5]

吉里吉里では、デフォルトでは描画もCPUで行っている関係上、メッシュ分割率の設定はシビアにパフォーマンスに影響を与えます。[l][r]
そのため、形が崩れて見えず処理も軽めになる[em]0.5[endem]という値を設定することを強く推奨します。[l][r]
ちなみにこの入門でも、first.ksの一番最初で0.5という値を設定しています。

[p][cm]

それでは次に各種物理スケールを変更してみましょう。
[p][er]

[begintag]
[er]
[[emoteenv [em]hairscale=0[endem]]
[endtag]

[emoteenv hairscale=0]

[em]hairscale[endem]属性では、髪揺れの度合いを設定します。[l][r]
初期値が1ですが、これを0にすることで、髪が一切ゆれなくなります。[l][r]
0から1の間のいずれかの値を設定することで、揺れの度合いを微調整できます。
[p][cm]

[begintag]
[er]
[[emoteenv [em]bustscale=0[endem]]
[endtag]

[emoteenv hairscale=1 bustscale=0]

[em]bustscale[endem]属性では、胸揺れの度合いを設定します。[l][r]
こちらも hairscale 同様に、胸の揺れ加減を設定します。[l][r]
0に設定することで、胸が全く揺れなくなっていますね？
[p][cm]

[emoteenv bustscale=1]

このキャラには無いですが、追加パーツで「パーツ揺れ」タイプのパーツを追加した場合、その揺れ加減は [em]partsscale[endem]属性で同様に設定することが出来ます。
[p][er]

[em]used3d[endem]属性では、E-moteの内部的な描画処理に吉里吉里内蔵のCPU処理を使うか、Direct3D経由でGPU処理を使うかを設定します。[l][r]
CPUで描画する場合、環境を選びませんが描画処理は重くなります。[l][r]
GPUで描画する場合、GPUのパフォーマンスに左右されますが、一般的にCPUよりも描画が速くなります。
[p][cm]

emoteenvタグは通常 first.ks の冒頭で1度だけ設定を行うという使い方をします。[l][r]
ですが、胸揺れや、髪揺れの程度、GPU使用の有無は、ゲームのコンフィグで変更可能にしてもいいでしょう。
[p][er]


各属性はそれぞれ、システム変数に[r]
[em]sf.emote_meshdivisionratio[r]
sf.emote_hairscale[r]
sf.emote_bustscale[r]
sf.emote_partsscale[r]
sf.emote_usedx[r][endem]
の名前で記録されています。
[p][er]

この値を読み出して、UIで適当に変更を行い、また書き戻すことで、プレイヤーがこれらの値を変更可能なようにすることも出来ます。
[p][er]

余談ですが、これらusedx以外の4つの属性は、emotestart やemoteopt タグで、キャラ個別に設定することも出来るようになっています。[l][r]
もっとも、普通そこまで細かい設定を行う必要性は無いでしょう。[l][r]
キャラ毎に胸のゆれ具合を個別にコンフィグで設定させたい、というようなマニアックなケースで、マクロと組み合わせて活用してみて下さい。
[p][cm]

[emotestop seg=0]

[jump storage=first.ks target=*start]






