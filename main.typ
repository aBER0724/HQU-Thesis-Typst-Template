#import "hqu-thesis.typ": *
#import "@preview/mitex:0.2.5": * // LaTex公式
#import "@preview/codelst:2.0.2": sourcecode // 代码块
#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "algorithms.typ": algorithms
#let reference = "references.bib"

// 基本信息配置
#let title = ""
#let author = ""
#let grade = "202X"
#let student-id = ""
#let department = "计算机科学与技术学院"
#let major = ""
#let supervisor = ""
#let date = "20XX年5月"
#let keywords = ("")
#let keywords-en = ("")
#let is-redact = false

// 中文摘要内容
#let abstract = []

// 英文摘要内容
#let abstract-en = []

// 致谢
#let acknowledgement = []

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
  reference: reference
)

// 论文正文开始
= 引言
== 研究背景和意义
== 国内外研究现状
== 主要研究内容
== 论文结构

= 预备知识
== 本章小节

= 实验结果与分析
== 实验设置
== 实验分析

= 结论与展望
== 研究总结
== 未来研究方向