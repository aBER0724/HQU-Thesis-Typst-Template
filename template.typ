#import "hqu-thesis.typ": *
#import "@preview/mitex:0.2.5": * // LaTex公式
#import "@preview/codelst:2.0.2": sourcecode // 代码块
#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "algorithms.typ": algorithms
#let reference = "references.bib"

// 基本信息配置
#let title = "华侨大学计算机学院本科毕业论文模板使用指南"
#let author = "张三"
#let grade = "2021"
#let student-id = "20210xxxxx"
#let department = "计算机科学与技术学院"
#let major = "计算机科学与技术"
#let supervisor = "李四 教授"
#let date = "2025年6月"
#let keywords = ("毕业论文", "Typst", "论文模板", "排版指南")
#let keywords-en = ("Thesis", "Typst", "Template", "Formatting Guide")
#let is-redact = false

// 中文摘要内容
#let abstract = [
本文是华侨大学计算机科学与技术学院本科毕业论文Typst模板的使用指南。Typst是一种现代化的标记文本语言, 相比LaTeX具有编译速度快、语法简洁等优势。本指南旨在帮助学生快速上手使用该模板完成毕业论文的排版工作。

本指南详细介绍了模板的基本结构、使用方法和注意事项, 包括各类要素（如标题、摘要、目录、正文、图表、公式、参考文献等）的排版方式。通过阅读本指南并参照示例, 学生可以轻松掌握如何利用Typst编写符合华侨大学计算机学院规范的毕业论文。
]

// 英文摘要内容
#let abstract-en = [
This paper serves as a user guide for the Huaqiao University Computer Science and Technology undergraduate thesis Typst template. Typst is a modern markup language that offers advantages such as fast compilation and concise syntax compared to LaTeX. This guide aims to help students quickly learn how to use the template to format their thesis.

The guide provides detailed instructions on the basic structure, usage methods, and important considerations of the template, including formatting various elements (such as title, abstract, table of contents, main text, figures, tables, equations, references, etc.). By reading this guide and following the examples, students can easily master how to use Typst to write a thesis that meets the standards of the College of Computer Science at Huaqiao University.
]

// 致谢
#let acknowledgement = [
在此模板的开发过程中, 我参考了许多优秀的开源项目和文档。特别感谢Typst社区的支持和贡献, 他们开发的各种包和工具为本模板的实现提供了便利。

需要特别说明的是, 这个模板是我个人开发的, 并非华侨大学计算机科学与技术学院或学校的官方模板。它是我为了帮助同学们更方便地使用Typst排版毕业论文而创建的个人项目。

希望这个模板和使用指南能对你的毕业论文写作有所帮助, 让你能够专注于内容创作而非繁琐的排版工作。如有问题或建议, 欢迎反馈交流。
]

// 应用模板
#show: thesis-hqu.with(
  title: title,
  author: author,
  student-id: student-id,
  department: department,
  major: major,
  grade: grade,
  supervisor: supervisor,
  date: date,
  abstract: abstract,
  abstract-en: abstract-en,
  keywords: keywords,
  keywords-en: keywords-en, 
  acknowledgement: acknowledgement,
  is-redact: is-redact,
  reference: reference
)

// 论文正文开始
= 模板概述

== Typst介绍

Typst是一种现代化的标记文本语言, 定位与LaTeX类似, 具有极强的排版能力。通过简洁的语法编写文档, 然后生成PDF文件。与LaTeX相比, Typst具有以下优势: 

1. 编译速度快: Typst提供增量编译功能, 修改后通常能在一秒内完成编译, 并支持监听修改自动编译。
2. 环境搭建简单: 原生支持中日韩等非拉丁语言, 无需安装庞大的环境。
3. 语法友好: 对于普通排版需求, 上手难度与Markdown相当, 源码可读性高。

本模板基于Typst实现了华侨大学计算机学院本科毕业论文的排版规范, 使用简单, 效果专业。

== 模板文件结构

华侨大学计算机学院本科毕业论文Typst模板由以下文件组成: 

- `main.typ`: 主文件, 包含论文内容和基本配置
- `hqu-thesis.typ`: 模板核心文件, 定义了论文的整体样式
- `utilites/`: 辅助功能目录
  - `abstract.typ`: 摘要相关功能
  - `figure.typ`: 图表相关功能
- `assets/`: 存放图片等资源文件
- `references.bib`: BibTeX格式的参考文献文件

接下来, 我们将详细介绍如何使用该模板编写毕业论文。

= 基本信息配置

== 论文信息设置

在`main.typ`文件开头, 通过设置一系列变量来配置论文的基本信息。这些信息将自动用于生成封面、页眉等部分。下面是一个示例配置: 

```typ
#let title = "华侨大学计算机学院本科毕业论文模板使用指南"
#let author = "张三"
#let grade = "2024"
#let student-id = "20210xxxxx"
#let department = "计算机科学与技术学院"
#let major = "计算机科学与技术"
#let supervisor = "李四 教授"
#let date = "2024年6月"
```

其中: 
- `title`: 论文标题
- `author`: 作者姓名
- `grade`: 届别（毕业年份）
- `student-id`: 学号
- `department`: 院系名称
- `major`: 专业
- `supervisor`: 指导教师
- `date`: 完成日期

== 关键词与参考文献设置

关键词设置包括中英文两组, 使用元组格式: 

```typ
#let keywords = ("毕业论文", "Typst", "论文模板", "排版指南")
#let keywords-en = ("Thesis", "Typst", "Template", "Formatting Guide")
```

参考文献文件指定: 

```typ
#let reference = "references.bib"
```

参考文献使用BibTeX格式, 保存在`references.bib`文件中。系统会自动根据正文中的引用生成参考文献列表。

== 摘要与致谢设置

摘要和致谢内容通过变量进行设置: 

```typ
#let abstract = [
  中文摘要内容...
]

#let abstract-en = [
  英文摘要内容...
]

#let acknowledgement = [
  致谢内容...
]
```

内容使用方括号`[]`包围, 可以包含多个段落。

= 正文编写

== 章节结构

Typst使用`=`符号表示标题层级, 类似Markdown中的`#`。一级标题（章）用一个`=`, 二级标题（节）用两个`=`, 依此类推: 

```typ
= 一级标题（章）
== 二级标题（节）
=== 三级标题
==== 四级标题
```

例如, 当前您看到的"正文编写"就是一个一级标题, 而"章节结构"是其下的二级标题。

#figures-hqu(
  figure(image("assets/校徽.png", width: 8cm)),
  caption: [Typst的标题层级示例],
)

== 段落与文本格式

段落之间通过空行分隔。正文中的文本可以使用各种格式: 

- *粗体文本*: 使用`*粗体*`
- _斜体文本_: 使用`_斜体_`
- 上标^上标^: 使用`^上标^`
- 下标~下标~: 使用`~下标~`

行内代码可以使用反引号: `#let x = 5`

代码块可以使用三个反引号: 

```
#let title = "论文标题"
#let author = "作者名"
```

== 列表

Typst支持有序列表和无序列表: 

无序列表使用 "-": 
- 第一项
- 第二项
- 第三项

有序列表使用数字后跟点号: 
1. 第一项
2. 第二项
3. 第三项

也可以使用嵌套列表: 
- 主项目1
  - 子项目1.1
  - 子项目1.2
- 主项目2
  - 子项目2.1

= 图表与公式

== 插入图片

使用`figures-hqu`函数插入图片: 

```typ
#figures-hqu(
  figure(image("assets/图片路径.png", width: 8cm)),
  caption: [图片标题],
)
```

下面是一个图片示例: 

#figures-hqu(
  figure(image("assets/校徽与中英文标准字中轴组合.png", width: 10cm)),
  caption: [华侨大学校徽示例],
)

== 并排图片

可以使用`figures-hqu`函数并排放置多张图片: 

```typ
#figures-hqu(
  (
    figure(image("assets/图片1.png", width: 6cm)),
    figure(image("assets/图片2.png", width: 6cm))
  ),
  caption: "总标题",
  individual-captions: ([图1标题], [图2标题])
)
```

以下是并排图片示例: 

#figures-hqu(
  (
    figure(image("assets/校徽与中英文标准字中轴组合.png", width: 5cm)),
    figure(image("assets/校徽与中英文标准字横式组合.png", width: 5cm))
  ),
    caption: "华侨大学校徽展示",
    individual-captions: ([中轴组合], [横式组合])
)

== 表格创建

使用`table-hqu`函数创建符合规范的三线表: 

```typ
#table-hqu(
  caption: "表格标题",
  header-bold: true,
  data: (
    ("表头1", "表头2", "表头3"),
    ("数据1", "数据2", "数据3"),
    ("数据4", "数据5", "数据6")
  )
)
```

下面是一个表格示例: 

#table-hqu(
  caption: "Typst与其他排版工具比较",
  header-bold: true,
  data: (
    ("工具", "编译速度", "语法复杂度", "学习曲线"),
    ("Typst", "快", "简单", "平缓"),
    ("LaTeX", "慢", "复杂", "陡峭"),
    ("Word", "不适用", "图形界面", "平缓")
  )
)

== 数学公式

$ A = pi r^2 $ <eq1>

根据 @eqt:eq1 , 推断出 @eqt:eq2

$ x < y => x gt.eq.not y $ <eq2>

然后也有多行的如 @eqt:eq3, 标签名字可以自定义

$
  sum_(k=0)^n k
  &< 1 + ... + n \
  &= (n(n+1)) / 2
$ <eq3>

如果不想编号就在公式后面使用标签 `<->`

$ x < y => x gt.eq.not y $ <->

使用`$`符号包围行内公式: $E = "mc"^2$

使用`$ $`包围行间公式: 

$ F(x) = integral_(- infinity)^(infinity) f(t) e^(-2 pi i t x) d t $

复杂公式示例: 

$ nabla times vec(B) - 1 / c (partial vec(E)) / (partial t) = 4pi / c vec(j) $

也可以使用`#mitex()`函数插入LaTeX公式: 

#mitex(`
  \newcommand{\f}[2]{#1f(#2)}
  \f\relax{x} = \int_{-\infty}^\infty
    \f\hat\xi\,e^{2 \pi i \xi x}
    \,d\xi
`)

== 代码

=== 代码块
#sourcecode[```typ
#show "ArtosFlow": name => box[
  #box(image(
    "logo.svg",
    height: 0.7em,
  ))
  #name
]

This report is embedded in the
ArtosFlow project. ArtosFlow is a
project of the Artos Institute.
```]

=== 伪代码

#algorithms.cool <cool>

See @cool for details on how to do something cool.

= 引用与脚注

== 脚注使用

使用`#footnote[]`添加脚注#footnote[这是一个脚注示例, 用于提供补充说明。]。脚注将自动编号并显示在页面底部。

多个脚注会自动管理编号#footnote[第二个脚注]#footnote[第三个脚注]。

== 参考文献引用

参考文献使用`<citekey>`格式引用。例如: 

根据Smith等人的研究#bib_cite(<girshick2014rich>), 大语言模型在自然语言处理领域取得了显著进展。

多个引用可以组合使用: #bib_cite(<girshick2014rich>, <liu2016ssd>, <redmon2016you>)

引用将自动链接到参考文献列表, 并根据引用样式进行格式化。

= 常见问题与解决方案

== 编译问题

如果遇到编译错误, 请检查: 

1. 语法是否正确, 特别是括号、引号的匹配
2. 引用的文件或图片是否存在
3. 函数参数是否正确

常见错误: 
- 文件路径错误: 检查图片文件是否位于正确路径
- 括号不匹配: 检查`()`、`[]`、`{}`是否成对出现
- 引用错误: 检查BibTeX引用键是否存在

== 格式调整

如需调整特定元素的格式, 可以: 

1. 使用`#set`命令设置特定范围的样式
2. 修改模板文件中的相应定义

例如, 调整文本对齐方式: 

```typ
#set par(justify: true)
这段文本将会两端对齐, 适合用于正文段落的排版, 使得文本看起来更加整齐美观。
```

= 结论

Typst为华侨大学计算机学院学生提供了一种现代化、高效的论文排版解决方案。通过本指南, 您已经了解了如何: 

1. 配置论文基本信息
2. 编写结构化的正文内容
3. 插入图片、表格和数学公式
4. 使用脚注和引用

与传统工具相比, Typst具有学习曲线平缓、编译速度快、语法简洁等优势, 特别适合编程背景的学生使用。希望本指南能帮助您顺利完成毕业论文的排版工作, 专注于内容创作而非格式调整。