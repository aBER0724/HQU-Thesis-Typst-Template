#import "@preview/i-figured:0.2.4"

#let _set_equation_numbering(body) ={
    show heading: i-figured.reset-counters
    set math.equation(supplement: "公式")
    show math.equation: i-figured.show-equation.with(numbering: "(1-1)")
    body
}

#let algorithm = figure.with(kind: "lovelace", supplement: "Algorithm")
