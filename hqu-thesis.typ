#import "utilites/cover.typ": cover-page
#import "utilites/abstract.typ": chinese-abstract, english-abstract
#import "utilites/basic-style.typ": *
#import "utilites/table-of-contents.typ": table-of-contents
#import "utilites/reference.typ": reference-content, bib_cite
#import "utilites/acknowledgement.typ": acknowledgement-content
#import "utilites/equation.typ": _set_equation_numbering
#import "utilites/abstract.typ": chinese-abstract, english-abstract
#import "utilites/figure.typ": *
#import "@preview/lovelace:0.3.0": *

// 华侨大学论文模板主函数
#let thesis-hqu(
  title: "", // 论文标题
  author: "", // 作者姓名
  student-id: "", // 学号
  department: "", // 学院名称
  major: "", // 专业
  grade: "", // 年级
  supervisor: "", // 指导教师
  date: none, // 日期
  keywords: (), // 中文关键词数组
  keywords-en: (), // 英文关键词数组
  abstract: none, // 中文摘要内容
  abstract-en: none, // 英文摘要内容
  is-redact: false, // 是否隐藏学号
  acknowledgement: none, // 致谢内容
  reference: "", // 参考文献 .bib 路径
  body, // 正文内容
) = {
  // 基础样式
  let fig-counter = counter("figure")
  show: _page_header_style
  show: _basic_font_style
  show: _basic_par_style
  show: _page_footer_style
  show: _basic_heading_style
  show: _code_block_style
  show: _set_equation_numbering
  show: _page_header_style.with(title: title)
  show: show-cn-fakebold


  // 封面
  cover-page(title: title,author: author,student-id: student-id,department: department,major: major,grade: grade,supervisor: supervisor,date: date,is-redact: is-redact)

  // 中文摘要
  chinese-abstract(abstract, keywords)

  // 英文摘要
  english-abstract(abstract-en, keywords-en)

  // 目录
  table-of-contents()

  // 正文
  body

  reference-content(reference)

  acknowledgement-content(acknowledgement)
}
