;------------------------------------------------------------
;点下“开始游戏”以后一开始默认执行的内容
;你可以把下面替换成自己的剧本，或者直接从这里跳跃到其他自建脚本
;------------------------------------------------------------
*start|序章
@bgm storage="BGM074.ogg"
@bg storage="BG14a"
@fg pos="center" storage="fg01_02"
@dia
@history output="true"
@nvl娘 face="face01_02"
欢迎来到THE NVL Maker的世界～[lr]一起来创作好玩的游戏吧！[w]
@nvl娘 face="face01_01" fg="fg01_01"
《THE NVL Maker》是一款图形化编辑工具，可以用来制作电子小说、恋爱冒险游戏、养成游戏等等。[w]
@nvl娘
软件在任何情况下（制作免费游戏、同人贩卖游戏、商业游戏），都是可以免费使用的。[w]
@nvl娘
但是请注意，发布游戏时，需要在游戏内或说明文档、发布帖等地方，明确写出使用了本工具。[w]
@fg pos="center" storage="fg01_02"
@nvl娘 face="face01_02" fg="fg01_02"
这是为了让更多人能认识NVL娘，所以拜托了嘛。[w]
@nvl娘
另外，
@link exp="System.shellExecute('http://www.nvlmaker.net/')"
《THE NVL Maker》的官网
@endlink
也提供了专门的页面用于游戏宣传，方便同好交流。[w]
@nvl娘
所以，发布游戏的时候欢迎
@link exp="System.shellExecute('http://www.weibo.com/nvlmaker')"
@font color="0xCCFFCC"
艾特官方微博
@resetfont
@endlink
哟~[w]
@nvl娘 face="face01_01" fg="fg01_01"
还有一点要注意的是，在使用THE NVL Maker制作游戏时，不能使用“侵犯到他人版权的素材”。[w]
@nvl娘
例如，不能使用网上随意搜索到的风景图片作为背景，不能使用来源不明的MP3作为BGM等等。[w]
@nvl娘
NVL可以使用的素材仅限于此范围：来历明确（可指向特定的作者，而非收集者）、有清楚的使用规约（作者声明同意用于游戏）。[w]
@nvl娘
网上会有一些所谓的素材站，将其他游戏的图片音乐音效等解包并放出，或随意扩散他人版权的作品，这些被称为“版权物”，是绝对不可以使用的。[w]
@nvl娘
简单地说，请不要使用由“收集者”而非“原作者”上传的“XX素材包”。[w]
@nvl娘
如果你看到“内容由用户上传版权归原作者所有仅供学习”等字样，那么可以直接把那个站拉黑了。[w]
@nvl娘
“禁止侵权”这点对免费游戏也没有例外。因为，一旦你公开了包含版权问题素材的游戏，你的行为已经不属于通称的“个人学习使用”。[w]
@nvl娘
在这种情况下，发布（如在论坛、贴吧、QQ群有条件或无条件分享等等）即是违法。[w]
@nvl娘 face="face01_02" fg="fg01_02"
当然，并不是说所有东西都一定要自己做。[lr]还是可以利用现有资源的～[w]
@nvl娘
所以，为了帮助大家更有效率地制作游戏，
@link exp="System.shellExecute('http://www.nvlmaker.net/')"
《THE NVL Maker》的官网[endlink]
提供了一些合法的共享素材网站连接。
请点
@link exp="System.shellExecute('http://www.nvlmaker.net/material.html')"
@font color="0xCCFFCC"
这里查看
@resetfont
@endlink
。[w]
@nvl娘 face="face01_01" fg="fg01_01"
对于一些作品的二次创作（即是俗称的XX作品的同人），在没有获得官方授权的情况下，也不可以使用官方的原画、截图、OST等。[w]
@nvl娘 face="face01_02" fg="fg01_02"
真心想要制作二次创作游戏的话，请写信去向官方索要授权，[lr]或者征集同好一起来画图、创作音乐吧。[w]
@nvl娘 face="face01_01" fg="fg01_01"
接下来进入演示正题～[w]
@clfg layer="8" time="100"
;----------
;设置默认姓名
@eval exp="f.姓='abc'"
@eval exp="f.名='def'"
@history output="false"
;自定义主角名字的代码
@nowait
请输入主角名字：[r]
姓氏：[edit opacity=0 color=0xFFFFFF name=f.姓][r]
名字：[edit opacity=0 color=0xFFFFFF name=f.名][r]
@links target="*输入完毕" text="确定" hint="点这里继续~"
@endnowait
@history output="true"
@s
;----------
*输入完毕
;将输入的名字使用commit保存下来，没有这个指令的话输入了也还是维持默认值
@commit
@er
;使用emb指令来在对话里显示变数的值
@主角
主角的姓氏是[emb exp=f.姓]，名字是[emb exp=f.名]。[w]
@fg layer="0" pos="center" storage="fg01_02"
@nvl娘 face="face01_02"
那么，测试一下选择吧。[w]
@clfg layer="0" clface="1"
;----------
;显示选择按钮
@selstart hidemes="0" hidesysbutton="0"
@locate y="200" x="0"
@selbutton target="*选择A" text="我要选择A"
@locate y="300" x="0"
@selbutton target="*选择B" text="我要选择B"
@selend
;----------
*选择A|路线一
@clsel
@bg storage="cg_01"
;登陆CG（记得也要在cglist.txt里写上对应CG名才能成功显示）
@addcg storage="cg_01"
@npc id="路人甲"
你选择了A。第一张CG现在可以在CG模式里查看了。[w]
@bg storage="cg_01_a"
@addcg storage="cg_01_a"
@npc id="路人甲"
第一张CG的变化也被登陆了，现在在CG模式中点选第一张CG，会连续显示两张图。[w]
@jump target="*合并"
;----------
*选择B|路线二
@clsel
@bg storage="cg_02"
;登陆CG（记得也要在cglist.txt里写上对应CG名才能成功显示）
@addcg storage="cg_02"
@npc id="路人甲"
你选择了B。第二张CG现在可以在CG模式里查看了。[w]
@jump target="*合并"
;----------
*合并
@npc id="路人甲"
不管选择了A还是B，最后你都会看到这句话。[w]
@scr
试试另外一个样式的对话框……[w]
你也可以切换文字的颜色。[l][font color=0xCCFFCC]比如这样……[resetfont][lr][r]
改变[font size=30]大[font size=15]小[resetfont]也没有问题哟。[w]
@dia
@npc id="路人甲"
现在换回来了……[w]
@npc id="路人甲"
地图测试。[w]
@clfg layer="all"
@map storage="sample.map"
;----------
*地图01|教室
@clmap
@bg storage="BG01a"
@dia
@主角
来到了教室。[w]
@call storage="endA.ks"
;呼叫结局事件A，当事件执行完之后就会返回这里
@jump target="*地图合并"
;----------
*地图02|车上
@clmap
@bg storage="BG12a"
@dia
@主角
来到了车上。[w]
@call storage="endB.ks"
;呼叫结局事件B，当事件执行完之后就会返回这里
@jump target="*地图合并"
;----------
*地图合并
@fg pos="center" storage="fg01_02"
@nvl娘 face="face01_02"
功能演示完毕。[lr]
更多内容请查看tutorial文件夹下的教程。[w]
@nvl娘 face="face01_01" fg="fg01_01"
准备好就返回标题了哦。[w]
;执行返回标题指令，返回到标题画面
@gotostart ask="false"
