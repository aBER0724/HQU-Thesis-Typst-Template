#import "hqu-thesis.typ": thesis-hqu
#import "utilites/abstract.typ": chinese-abstract, english-abstract
#import "utilites/figure.typ": table-hqu, figures-hqu
#import "utilites/reference.typ": reference-content
#import "utilites/acknowledgment.typ": acknowledgment
#import "@preview/mitex:0.2.5": *

#let title = "计算机科学与技术学院本科毕业设计（论文）模板"
#let author = "作者"
#let session = "2025"
#let student-id = "2125114514"
#let department = "计算机科学与技术学院"
#let major = "信息安全"
#let supervisor = "你的导师"
#let date = "2025年3月"
#let is-coop = false
#let keywords = ("关键词1", "关键词2", "关键词3")
#let keywords-en = ("Keyword 1", "Keyword 2", "Keyword 3")

// 中文摘要内容
#let abstract-zn =[

这是一个为华侨大学计算机科学与技术学院本科生毕业论文提供的Word模版。我们的目标是帮助本科生学生更便捷地排版和格式化毕业论文，以满足学校和指导老师的要求。我们提供了专门设计的毕业论文Word模版，其中包含合适的页面设置、页眉页脚、标题样式等，简化了格式化过程。模版预设了常用的论文部分，例如封面、摘要、目录、引言等，方便用户直接填写内容。我们遵循学术写作规范，包括参考文献引用、段落格式、页码等要求。你可以根据个人需求进行定制和修改，以满足不同学校和院系的要求。使用本项目的Word模版，可以更高效地完成本科生毕业论文的排版和格式化工作。欢迎大家试用并提出宝贵的建议或意见。感谢您的支持！
]

// 英文摘要内容
#let abstract-en =[

This is a Word template designed for undergraduate students in the College of Computer Science and Technology at Huaqiao University for their graduation thesis. Our aim is to assist students in conveniently typesetting and formatting their thesis according to the requirements of the university and their supervisors. The template provides well-designed features such as appropriate page settings, headers, footers, and title styles, simplifying the formatting process. It also includes pre-defined sections commonly found in a thesis, such as cover page, abstract, table of contents, and introduction, allowing users to directly input their content. We adhere to academic writing standards, including proper citation of references, paragraph formatting, and pagination. The template is customizable to accommodate the requirements of different schools and departments. By utilizing this Word template, students can enhance the efficiency of typesetting and formatting their undergraduate thesis. We welcome users to try it out and provide valuable suggestions or feedback. Thank you for your support!

]

#show: thesis-hqu.with(title: title,author: author,student-id: student-id,department: department,major: major,session: session,supervisor: supervisor,date: date,abstract-zn: abstract-zn,abstract-en: abstract-en,keywords: keywords,keywords-en: keywords-en,is-coop: is-coop)

// 论文正文开始
= 引#h(2em)言

== 研究背景和意义

为进一步规范本科毕业设计（论文）写作格式，减少格式调整的额外工作量，本模板根据《华侨大学计算机科学与技术学院本科毕业设计（论文）的基本要求及撰写格式》的要求，制作了本科学位论文Word模板供使用。

本模板包括以下两章：第一章为引言，阐述编写本模板的背景与目的；第二章为模板使用方法，简要介绍了模板样式、模板内容、Word功能的使用；第三章为结论，总结了本文工作并提出未来展望。

文档编辑软件为Windows下的Word 2021，不同软件、平台、Word版本的操作可能有所不同。此外，不同年份、不同院系教务与图书馆的写作标准可能稍有出入，还需要酌情修改。

模板可以从GitHub 下载。欢迎给GitHub仓库点亮Star！如有任何意见建议，请在GitHub仓库提Issue. 
  
== 国内外研究现状
《清华大学本科学位论文Word模板》 作为一份被广泛认可和使用的优秀模版，具有良好的排版和格式规范。本模版在参考清华大学模版的基础上，经过适当的修改和调整，符合华侨大学计算机学院的本科生写作要求和规范。
 
= 模板使用

本章介绍了模板样式、模板内容和Word功能的使用方法，阅读完本章即可上手使用。模板规定以下格式的文字以描述Word某项功能的操作顺序：选项卡–功能组–按钮–窗口–标签页–提示文字。

== 模板样式

样式是Word中批量应用格式的重要功能。样式可以在开始–样式的样式库、或开始–样式–对话框加载按钮–样式窗格中查看。将光标置于待应用样式的段落、或选中待应用样式的文字，再点击样式即可应用。

对样式窗格中的样式右键，可以向开始–样式–样式库中添加常用样式、或从样式库中删除样式。

样式之间会因为优先级顺序相互覆盖，或者被手动设置的格式所覆盖。如果无法正确应用样式，可以尝试对文字使用开始–字体–清除所有格式后再应用样式。

常用的样式包括：正文、标题1、标题2、标题3、公式、图片、图题、表题、编号引用、参考文献、章标题等。

== 图片
图片可以通过插入–插图–图片插入，或者直接从外部复制至文档，示例见图二.1。如果插入文档的图片清晰度下降，可以在文件–选项–高级–图像大小和质量中，勾选不压缩文件中的图像或调高图片的默认分辨率。

#figures-hqu(
  figure(image("asserts/校徽与中英文标准字横式组合.png", width: 7cm)),
  caption: [华侨大学标志],
)

并排放置多幅图片可以借助无框线表格排列，示例见图二.2。
 	 
#figures-hqu(
  (
    figure(image("asserts/校徽与中英文标准字中轴组合.png", width: 3cm)),
    figure(image("asserts/校徽与中英文标准字横式组合.png", width: 6cm))
  ),
    caption: "并排图片示例",
    individual-captions: ([华侨大学标志1], [华侨大学标志2])
)

更便捷的操作为，直接选中上述示例，在文中任意位置以"保留源格式"方式粘贴，再选中图题中的图片编号，右键选择"更新域"（或按快捷键F9）。
对于并排图片来说，进行上述操作后，需要根据新图片大小自动调整表格布局。选中表格，在布局–单元格大小–自动调整里，先选择"根据内容自动调整表格"，再选择"根据窗口自动调整表格"。
在正文中插入题注的交叉引用通过引用–题注–交叉引用，引用类型选择"图"，引用内容选择"仅标签和编号"，勾选"插入为超链接"，选择需要引用的题注，点击"插入"。

== 表格
表格可以通过插入–表格–表格插入，在表设计–表格样式中应用三线表样式。在表设计–表格样式选项中勾选标题行才能确保首行的下框线正常显示。三线表如表二.1所示。


#table-hqu(
  caption: "三线表示例",
  header-bold: true,
  data: (
    ("姓名", "学号", "数学成绩", "英语成绩"),
    ("丁纪翔", "20010001", "97.5", "100"),
    ("赵冬雪", "20010002", "98.8", "99.7")
  )
)
表格后需要额外空一行。
表注插入和图注插入相同，见第2.2节。
如果需要为跨页表格在续表前添加题注，只需在插入–文本–文档部件下拉菜单中插入续表题注，用对前页表的交叉引用文字代替原文字，其中设置交叉引用窗口–引用内容为整项题注，在交叉引用文字前再加上续字，最后对文字应用题注样式即可。

= 公式

== 公式样式
公式样式名为公式，用于行间公式。需要提前安装字体XITS Math 。

通过快捷键Alt和=、或插入–符号–公式，可以插入一公式占位符。在公式占位符内，公式–转换支持以Unicode或LaTeX语法构建公式，插入–符号–公式下拉菜单提供了若干内置公式，公式–符号、公式–结构提供了大量预置的字符和表达式结构。

常用字符可以在公式–符号面板中点击插入。输入字符的原理为自动更正：如果一串字符（通常以反斜线\开头）在公式–转换–对话框加载按钮–公式选项窗口–数学符号自动更正–自动更正窗口–数学符号自动更正中定义了自动更正命令、并且勾选了键入时自动替换，则这串字符会在键入空格˽后被替换为指定字符。字符的输入命令可以在符号面板的按钮上通过鼠标悬停查看，也可以在数学符号自动更正中定义和修改。

公式的具体输入方法见清华大学《Word公式输入指南》。这里以"无框线表格排版公式和题注编号"为例，示例如公式(二 1)所示：
	ReLU{\left(x\right)}=\max{\left(0,\ x\right)}.	(二 1)

插入无框线表格排版的行间公式通过插入–文本–文档部件–常规，选择"公式块"。输入公式后，选中右侧公式编号，按F9更新域。

若您要自定义公式块，并重复使用您自定义的排版方式，则可以选择表格，通过插入–文本–文档部件–将所选内容保存到文档部件库，在新建构建基块窗口中设置类别为常规，选项为仅插入内容，修改保存位置、名称、库和说明后保存即可，此后即可在插入–文本–文档部件下拉菜单中快捷插入表格。

公式在正文中的交叉引用通过引用–题注–交叉引用，选择引用类型为"公式"，引用内容为"整项题注"，勾选"插入为超链接"，选择要引用的公式题注，点击"插入"。

== 列表

列表样式包括：
列表编号~列表编号5，用于编号列表，编号格式分别为带点阿拉伯数字1.、带圆括号阿拉伯数字(1)、带点小写英文字母a.、带顿号汉字一、、大写罗马数字I.
列表项目符号~列表项目符号5，用于符号列表，序号格式分别为实心圆点•、空心圆点◦、实心方块▪、空心方块▫、实心圆●.
为编号列表指定从1起重新编号，需在编号右键菜单中选择重新开始于1 .

== 脚注

脚注样式名为脚注文本。

通过引用–脚注–插入脚注，可以在光标所在位置插入脚注。脚注序号和脚注文本间隔0.5字符。

= 参考文献
#show: reference-content

= 致#h(2em)谢
#show: acknowledgment([
  完成本篇论文之际，我要向许多人表达我的感激之情。

  首先，我要感谢我的指导教师，他/她对本文提供的宝贵建议和指导。所有这些支持和指导都是无私的，而且让我受益匪浅。

  其次，我还要感谢我的家人和朋友们，他们一直以来都是我的支持和鼓励者。他们从未停止鼓舞我，勉励我继续前行，感谢你们一直在我身边，给我幸福和力量。

  此外，我还要感谢我的同学们，大家一起度过了很长时间的学习时光，互相支持和鼓励，共同进步。因为有你们的支持，我才能不断地成长、进步。

  最后，我想感谢笔者各位，你们的阅读和评价对我非常重要，这也让我意识到了自己写作方面的不足，同时更加明白了自己的研究方向。谢谢大家！

  再次向所有支持和鼓励我的人表达我的谢意和感激之情。

  本致谢生成自 ChatGPT。
])