/*
This is a Typst template for SBC Conferences papers,
and is made based on an already existing template,
originally written in LaTeX:
https://www.overleaf.com/latex/templates/sbc-conferences-template/blbxwjwzdngr
*/


/*
The fonts used in this template are problably not
in the Typst compiler, so you will need to reference
them in all of the 'font: "font"' fields across the
file.
I will comment it when necessary.
*/


/*
Customization according to the template
*/
#set page(
  paper: "a4",
  margin: (
    top: 3.5cm,
    bottom: 2.5cm,
    right: 3cm,
    left: 3cm,
  ),
)

#set text(
  size: 12pt,
  font: "times-new-roman", // Reference the file in "fonts/times-new-roman.ttf"
  tracking: -0.2pt,
)

#set par(
  justify: true,
  leading: 10pt,
  first-line-indent: 1.27cm,
)

// Set table customization
#set table(
  align: (x, y) => (
    if x > 0 or y == 0 { center } else { left }
  ),
)
#set table.cell(
  breakable: true,
)
#show table.cell: it => {
  if it.y == 0 {
    pad(it, x: 15pt, y: 12pt)
  } else {
    pad(it, x: 9pt, y: 8pt)
  }
}
#show table: set text(
  font: "Helvetica", // Reference the file in "fonts/heltica.ttf"
  size: 10pt,
)


// Table with caption
// This function simulates a table with a caption above it.

/*
Call it like this:
#table-caption(quantity_of_columns, array_of_cells, caption)

The array_of_cells must be between () and the items
must be between [], as in a Typst common table.
*/

#let table-counter = counter("table-counter") // Init table counter
#let table-with-caption(cols, cells, caption) = {
  align(center)[
    #block(width: 13cm)[
      #v(6pt)
      #table-counter.step() // Increment counter in 1 for table counting

      // Caption
      #align(center)[
        #text(
          weight: "bold",
          font: "Helvetica", // Reference the file in "fonts/heltica.ttf"
          size: 10pt,
        )[Table #context table-counter.display(). #caption]
      ]

      #v(6pt)
      // Table
      #table(
        columns: cols,
        ..cells
      )
    ]
  ]
}


// Set heading customization
#set heading(
  numbering: "1.",
)
#show heading.where(level: 1): set text(size: 13pt)
#show heading.where(level: 2): set text(size: 12pt)
#show heading.where(level: 3): set text(size: 12pt)
#show heading.where(level: 4): set text(size: 12pt)
#show heading.where(level: 5): set text(size: 12pt)
#show heading.where(level: 6): set text(size: 12pt)


// Set figure customization
#show figure.caption: set text(
  font: "Helvetica",
  weight: "bold",
  size: 10pt,
)
#show figure.caption: set par(justify: true)
#show figure.caption: set block(inset: (y: 6pt))
#set figure.caption(
  separator: ". ",
)




/*
============================================
=            START OF DOCUMENT             =
============================================
*/




// Title
#align(center)[
  #text(size: 16pt)[
    *Riscos associados ao uso excessivo de assistentes virtuais
    \
    e dispositivos de AIOTs*
  ]]

#v(12pt)

// Authors
// Insert here the authors names
#let authors = ("Daniel dos S. Hinsching", "Eduardo G. dos Santos", "José E. Kahl")

// Script to generate formated names
#let counter = 1
#align(center)[
  #for i in authors {
    text()[
      *#i*#super[#counter]#if (counter != authors.len()) { [*,* ] }
    ]
    counter = counter + 1
  }
]

#v(12pt)

// Adresses
// Insert the adresses
#let adresses = (
  ("Instituto Federal Catarinense – Câmpus Araquari (IFC)", "Araquari – SC – Brazil"),
)

// Script to generate formated adresses
#let counter = 1
#align(center)[
  #for (i, j) in adresses {
    text()[
      #super[#counter]#i \ #j
      #v(12pt)
    ]
    counter = counter + 1
  }
]

#v(6pt)

// Emails
// Insert the emails
#let emails = ("danielsantoshinsching@gmail.com", "dudugx05@gmail.com", "josekahl333@gmail.com")

// Script to generate formated emails
#let counter = 1
#align(center)[
  #for i in emails {
    text(font: "Courier New", size: 10pt)[
      #i#if (counter != emails.len()) { [, ] }
    ]
    counter = counter + 1
  }
]

#v(6pt)

// Abstract and Resumo
#align(center, block(width: 21cm - 8.2cm)[
  #set align(left)

  // Abstract
  #text(style: "italic")[
    *Abstract.* Parte abstrata do artigo em inglês deve ser inserida aqui ao final da escrita do projeto.
  ]

  \

  // Resumo
  #text(style: "italic", par(first-line-indent: 0em)[
    *Resumo.* Parte do resumo do artigo em português deve ser inserida aqui ao final da escrita do projeto.
  ])
])

\

= Introdução
Com o passar dos anos e o avanço da tecnologia, novos meio de automação residencial surgiram, permitindo que usuários controlem diversos dispositivos em sua casa de maneira eficiente e prática. Assistentes virtuais, como Amazon Alexa, Google Assistant e Apple Siri, tornaram-se populares, oferecendo controle por voz para uma variedade de dispositivos conectados à Internet, conhecidos como AIOTs (Artificial Intelligence of Things). Esses dispositivos incluem lâmpadas inteligentes, termostatos, câmeras de segurança, entre outros. No entanto, o uso excessivo dessas tecnologias pode acarretar riscos significativos à privacidade de quem os usa, além de abrir portas para vulnerabilidades de segurança, que podem ser exploradas por agentes maliciosos, comprometendo a segurança do ambiente doméstico e a integridade dos dados das pessoas que utilizam desses assistentes virtuais, além do avanço dos casos de venda de dados pessoais para terceiros sem o consentimento dos usuários. Este artigo tem como objetivo explorar os riscos associados ao uso excessivo de assistentes virtuais e dispositivos AIOTs, destacando as principais vulnerabilidades do uso de maneira excessiva e precipitada dessas tecnologias, além disso vamos abordar maneiras de combater esses riscos e ideializar uma melhor utilização dessas tecnologias de automação.

= Metodologia
A metodologia adotada neste estudo baseia-se em uma abordagem qualitativa, exploratória e bibliográfica, permitindo uma análise aprofundada sobre os riscos de privacidade e segurança associados ao uso de assistentes virtuais e dispositivos AIOTs. A seguir, são descritos os procedimentos utilizados:
+ *Revisão Bibliográfica*: Foi realizada uma revisão sistemática de leitura de diferentes artigos que tratam sobre o tema de assistentes virtuais, dispositivos AIOTs, privacidade e segurança digital. Foram consultadas diversass bases de dados acadêmicas, artigos científicos na área determinada e relatórios técnicos relevantes para o tema.
+ *Análise de Casos*: Foram analisados casos documentados de vulnerabilidades e incidentes de segurança relacionados ao uso de assistentes virtuais e dispositivos AIOTs. Essa análise permitiu identificar padrões comuns e as principais ameaças enfrentadas pelos usuários dessas tecnologias.
+ *Comparação de Tecnologias e Protocolos*: Durante a elaboração da pesquisa também foram comparadas diferentes tecnologias e empresas responsáveis por assistentes virtuais de acesso ao público, avaliando seus termos de uso, políticas de privacidade e medidas tomadas para garantia de segurança dos dados dos usuários.
+ *Síntese dos riscos Identificados*: Baseando-se nas informações coletadas, foi realizada a elaboração dos principais riscos associados ao uso em excesso de assistentes virtuais e dispositivos de AIOTs, destacando os problemas mais críticos e as possíveis consquências do mal uso dessas tecnologias.

= Sections and Paragraphs
Section titles must be in boldface, 13pt, flush left. There should be an extra 12 pt of space before each title. Section numbering is optional. The first paragraph of each section should not be indented, while the first lines of subsequent paragraphs should be indented by 1.27 cm.

== Subsections
The subsection titles must be in boldface, 12pt, flush left.

= Figures and Captions
Figure and table captions should be centered if less than one line (Figure 1), otherwise justified and indented by 0.8cm on both margins, as shown in Figure 2. The caption font must be Helvetica, 10 point, boldface, with 6 points of space before and after each caption. #figure(image("img/fig1.jpg"), caption: [A typical figure])

In tables, try to avoid the use of colored or shaded backgrounds, and avoid thick, doubled, or unnecessary framing lines. When reporting empirical data, do not use more #figure(image("img/fig2.jpg"), caption: [This figure is an example of a figure caption taking more than one line and justified considering margins mentioned in Section 5.]) decimal digits than warranted by their precision and reproducibility. Table caption must be placed before the table (see Table 1) and the font used must also be Helvetica, 10 point, boldface, with 6 points of space before and after each caption.

#table-with-caption(
  3,
  (
    [],
    [Chessboard top view],
    [Chessboard perspective view],
    [Selection with side movements],
    $6.02 plus.minus 5.22$,
    $7.01 plus.minus 6.84$,
    [Selection with indepth movements],
    $6.29 plus.minus 4.99$,
    $12.22 plus.minus 11.33$,
    [Manipulation with side movements],
    $4.66 plus.minus 4.94$,
    $3.47 plus.minus 2.20$,
    [Manipulation with indepth movements],
    $5.71 plus.minus 4.55$,
    $5.37 plus.minus 3.28$,
  ),
  [This is my table caption],
)

= Images

= References

// References page

/*
You can make a reference inline by calling the author name
followed by a collon and the year in the reference.
All references must be in the bib/references.bib
*/
#pagebreak()

#set par(leading: 12pt)
#bibliography(
  "bib/references.bib",
  style: "bib/sbc-apalike.csl",
  title: "References",
)
