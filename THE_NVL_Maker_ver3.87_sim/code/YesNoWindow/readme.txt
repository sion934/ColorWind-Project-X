图形化的询问窗口代码，样式1。
（1）使用图层代替窗口
（2）支持半透明
（3）退出和返回标题使用图形、保存和读取等保留原造型（可自行修改为全部使用不同图形）

代码：修改自KAG EX1的MyYesNoDialog.tjs
素材：翔岚

使用方法：将对应的素材和代码放入游戏工程nvl文件夹内。覆盖原有文件。
在Override.tjs内加入一行
KAGLoadScript("MyYesNoDialog.tjs");

自行修改图片的方法：
（1）在MySaveLoadFuntion.tjs里，修改存档、读取时，askyesno使用的文字。
（2）修改方法为，将askYesNo(prompt,…)的prompt，修改为"准备使用的文字"。
（3）将对应的文字加入到MyYesNoDialog.tjs里的yesnoMap这个字典中。
（4）例如，保存文字修改为“确定要保存吗？”，则在yesnoMap里加入一行：

    "确定要保存吗？" => "保存用的背景图片名",

具体可以参考或直接套用新模板momoism_flat里的MySaveLoadFunction.tjs和MyYesNoDialog.tjs写法。