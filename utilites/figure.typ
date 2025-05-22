#import "@preview/tablex:0.0.9": gridx, hlinex, vlinex, colspanx, rowspanx
#import "@preview/pointless-size:0.1.1": zh

// 图片处理函数：支持单图和多图布局，带自动编号
#let figures-hqu(
  figs, // 图片数组
  gap: 1em, // 图片之间的间距
  caption: "", // 可选的共享标题
  width: auto, // 每个图片的宽度，auto表示自动计算
  shared-caption: true, // 是否使用共享标题
  individual-captions: (), // 单独的图片标题数组，对应每个图片
  subfigure-labels: (), // 子图标签，如 (a), (b), (c)
) = {
  let figs-array = if type(figs) == array { figs } else { (figs,) }
  let captions-array = if type(individual-captions) == array { individual-captions } else { (individual-captions) }


  let labels-array = if subfigure-labels != () {
    // 如果提供了标签，使用提供的标签
    if type(subfigure-labels) == array { subfigure-labels } else { (subfigure-labels) }
  } else {
    // 如果未提供标签，根据图片数量自动生成 (a), (b), (c) 等标签
    range(figs-array.len()).map(i => {
      let label = "(" + numbering("a", i + 1) + ")"
      [#label]
    })
  }

  let cols = (1fr,) * figs-array.len()

  // 准备子图内容
  let grid-content = grid(
    columns: cols,
    rows: (auto,),
    gutter: gap,
    row-gutter: 0pt,
    align: center + horizon, // 水平和垂直居中
    ..figs-array
      .enumerate()
      .map(((i, fig)) => {
        [
          #fig.body

          #set text(font: ("Times New Roman", "SimHei"), size: zh(5))

          #if captions-array.len() > 0 and i < captions-array.len() and captions-array.at(i) != none {
            v(0.5em)
            if labels-array.len() > 0 and i < labels-array.len() and labels-array.at(i) != none {
              // 显示子图题目
              align(center)[#labels-array.at(i) #captions-array.at(i)]
            }
          } else {
            // 显示子图标签
            if figs-array.len() > 1 {
              align(center)[#labels-array.at(i)]
            }
          }
        ]
      })
  )

  // figure_actual_body contains the grid AND the manually constructed "图 X.Y caption"
  let figure_actual_body = {
    block({
      context {
        let headings = query(heading.where(level: 1));
        let chapter = 1;
        let current-location = here();
        let current-page = counter(page).at(current-location).first();
        for hdg in headings {
          let hdg-page = counter(page).at(hdg.location()).first();
          if hdg-page <= current-page {
            chapter = counter(heading).at(hdg.location()).at(0, default: 1);
          } else {
            break;
          }
        }
        let fig_num_in_chapter = counter(figure.where(kind: "image")).at(here()).first(); // This is N in X.N

        set text(font: "SimHei", size: zh(-4));
        show regex("[0-9]+"): text.with(font: "Times New Roman");
        set align(center);

        grid-content; // The images

        // Manually build the caption string
        [图#numbering("1", chapter)#[.]#h(-0.25em)#fig_num_in_chapter#h(1em)#caption];
        v(-.5em);
      }
    })
  };

  // Call the base `figure` function.
  // Its body is `figure_actual_body` which has the images and the full caption text.
  // No `supplement` argument needed here if `figure_actual_body` does it all.
  figure(
    figure_actual_body,
    kind: "image",
    supplement: "图"
  )
  par(leading: 0em)[#text(size: 0.0em)[#h(0.0em)]]
}

// 表样式
#let table-hqu(
  caption: "", // 表格标题
  data: (), // 表格数据，二维数组
  columns-width: auto, // 可选的列宽设置
  header-bold: false, // 表头是否加粗，默认为加粗
) = {
  // 计算列数
  let columns = if data != () and data.len() > 0 and type(data.at(0)) == array {
    data.at(0).len()
  } else {
    4 // 默认列数
  }

  // 设置列宽
  let cols-width = if columns-width == auto {
    (1fr,) * columns
  } else {
    columns-width
  }

  // 创建表格内容，不包含caption
  let table-content = align(
    center,
    {
      // 表格主体 - 使用单个gridx实现三线表
      gridx(
        columns: cols-width,
        rows: (auto,) * data.len(),

        // 基本网格线
        stroke: 0.5pt,

        // 顶部和底部边框加粗
        hlinex(stroke: 1.25pt, y: 0), // 顶线加粗
        hlinex(stroke: 0.75pt, y: 1), // 表头下横线加粗
        hlinex(stroke: 1.25pt, y: data.len()), // 底线加粗

        // 处理数据和样式
        ..{
          let cells = ()

          for (r-idx, row) in data.enumerate() {
            for (c-idx, cell) in row.enumerate() {
              if r-idx == 0 {
                // 表头单元格样式
                cells.push(
                  box(
                    width: 100%,
                    height: 1.5em,
                    inset: 5pt,
                    {
                      set text(font: ("Times New Roman", "SimSun"), size: zh(-4))
                      set align(center)
                      if header-bold {
                        [*#cell*]
                      } else {
                        cell
                      }
                    },
                  ),
                )
              } else {
                // 数据单元格样式
                cells.push(
                  box(
                    width: 100%,
                    height: 1.5em,
                    inset: 5pt,
                    {
                      set text(font: ("Times New Roman", "SimSun"), size: zh(-4))
                      set align(center)
                      cell
                    },
                  ),
                )
              }
            }
          }
          cells
        },
      )
    },
  )

  // 使用figure创建最终表格，但自己控制布局，不使用figure的caption位置机制
  figure(
    kind: "table",
    supplement: "表",
    {
      block({
        // 获取当前章节号和表格编号，用于显示标题
        context {
          let headings = query(heading.where(level: 1))
          let chapter = 1

          let current-location = here()
          let current-page = counter(page).at(current-location).first()

          for hdg in headings {
            let hdg-page = counter(page).at(hdg.location()).first()
            if hdg-page <= current-page {
              chapter = counter(heading).at(hdg.location()).at(0, default: 1)
            } else {
              break
            }
          }

          let table-num = counter(figure.where(kind: "table")).at(here()).first()

          // 显示表格标题
          set text(font: "SimHei", size: zh(-4))
          show regex("[0-9]+"): text.with(font: "Times New Roman")
          set align(center)

          [表#numbering("1", chapter)#[.]#h(-0.25em)#table-num#h(1em)#caption]
        }

        // 显示表格内容
        table-content
      })
    },
  )
  par(leading: 1em)[#text(size: 0.0em)[#h(0.0em)]]
  v(-0.54em)
}


