#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "@preview/tablex:0.0.9": gridx, hlinex, vlinex, colspanx, rowspanx
#import "@preview/pointless-size:0.1.1": zh
#import "basic-style.typ": *

// 封面页
#let cover-page(
  title: "", // 论文标题
  author: "", // 作者
  student-id: "", // 学号
  department: "", // 学院名称
  major: "", // 专业名称
  session: "", // 届别
  supervisor: "", // 指导教师
  date: none, // 日期
  is-coop: false, // 是否校企合作项目
  is-redact: false, // 是否隐藏学号
  ) = {
  set page(margin: (top: 3.8cm, bottom: 3.4cm, left: 3.2cm, right: 3.2cm))
  align(center)[

    #show: show-cn-fakebold
    #image("../assets/横向校徽-红黑.png", height: 2.86cm) 
    #v(1.75em)

    #text(font: "LiSu", size: zh(0), weight: 1000)[本科毕业论文（设计）]
    #v(3.25em)
 
    // 论文题目信息
    #gridx(
      columns: (2.44cm, 11.77cm),
      rows: 2em,
      align: (center, center),
      [#text(font: "SimHei", size: zh(2))[题目：]],
      [#par(leading: 0.45em, justify: false)[#text(font: "SimHei", size: zh(2))[#title]]],
      hlinex(start: 1, stroke: 0.75pt),
      [],
      hlinex(start: 1, stroke: 0.75pt),
    )
    #v(2em)

    // 学生信息表格
    #set text(size: zh(4))
    #gridx(
      columns: (3.49cm, 8.75cm),
      rows: 1.32cm,
      align: (center + bottom),
      [学#h(2em)院],
      [#department],
      hlinex(start: 1, stroke: 0.5pt),
      [专#h(2em)业],
      [#major],
      hlinex(start: 1, stroke: 0.5pt),
      [年#h(2em)级],
      [#text(font: ("Times New Roman", "SimSun"))[#session]级],
      hlinex(start: 1, stroke: 0.5pt),
      [学#h(2em)号],
      [#text(font: "Times New Roman")[#redact(student-id, enabled: is-redact)]],
      hlinex(start: 1, stroke: 0.5pt),
      [姓#h(2em)名],
      [#redact(author, enabled: is-redact)],
      hlinex(start: 1, stroke: 0.5pt),
      [指导老师],
      [#redact(supervisor, enabled: is-redact)],
      hlinex(start: 1, stroke: 0.5pt),
    )
    #v(2em)

    // 页脚日期信息
    #v(-0.5em)


    #place(
      bottom + center,
      dy: 1em,
      dx: 0em,
      [    
        #text(font: "SimHei", size: zh(4))[华侨大学教务处印制]

        #if date != none {
          text(size: zh(4), weight: "bold")[#date.split("年").at(0)#text(font: "SimHei")[年]#date.split("年").at(1).split("月").at(0)#text(font: "SimHei")[月]]
        }
      ],
    )
  ]

  pagebreak()
  counter(page).update(0)
  pagebreak()

  counter(page).update(2)
}