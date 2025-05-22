#import "@preview/codelst:2.0.2": sourcecode // 代码块
#import "@preview/mitex:0.2.5": * // LaTex公式
#import "@preview/lovelace:0.3.0": *

#let algorithms = (
  cool: figure(
    kind: "algorithm",
    supplement: [Algorithm],

    pseudocode-list(booktabs: true, numbered-title: [My cool algorithm])[
      + do something
      + do something else
      + *while* still something to do
        + do even more
        + *if* not done yet *then*
          + wait a bit
          + resume working
        + *else*
          + go home
        + *end*
      + *end*
    ],
  ),
)

