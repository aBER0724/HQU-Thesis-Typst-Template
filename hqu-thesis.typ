#import "utilites/cover.typ": cover-page
#import "utilites/abstract.typ": chinese-abstract, english-abstract
#import "utilites/acknowledgment.typ": acknowledgment
#import "utilites/basic-style.typ": *
#import "utilites/table-of-contens.typ": table-of-contents

// 华侨大学论文模板主函数
#let thesis-hqu(
  title: "", // 论文标题
  author: "", // 作者姓名
  student-id: "", // 学号
  department: "", // 学院名称
  major: "", // 专业
  session: "", // 届别
  supervisor: "", // 指导教师
  date: none, // 日期
  keywords: (), // 中文关键词数组
  keywords-en: (), // 英文关键词数组
  abstract-zn: none, // 中文摘要内容
  abstract-en: none, // 英文摘要内容
  is-coop: false, // 是否校企合作项目
  acknowledgment-content: none, // 致谢内容
  body, // 正文内容
) = {
  // 基础样式
  let fig-counter = counter("figure")
  show: _basic_font_style
  show: _basic_par_style
  show: _basic_heading_style
  show: _page_header_style.with(title: title)


  // 封面
  cover-page(title: title,author: author,student-id: student-id,department: department,major: major,session: session,supervisor: supervisor,date: date,is-coop: is-coop)

  // 中文摘要
  chinese-abstract(abstract-zn, keywords)

  // 英文摘要
  english-abstract(abstract-en, keywords-en)

  // 目录
  table-of-contents()

  // 正文
  body
}
