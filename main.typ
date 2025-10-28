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
  spacing: 10pt,
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
    *Abstract.* This meta-paper describes the style to be used in articles and short papers for SBC conferences. For papers in English, you should add just an abstract while for the papers in Portuguese, we also ask for an abstract in Portuguese (``resumo''). In both cases, abstracts should not have more than 10 lines and must be in the first page of the paper.
  ]

  \

  // Resumo
  #text(style: "italic", par(first-line-indent: 0em)[
    *Resumo.* Este meta-artigo descreve o estilo a ser usado na confecção de artigos e resumos de artigos para publicação nos anais das conferências organizadas pela SBC. É solicitada a escrita de resumo e abstract apenas para os artigos escritos em português. Artigos em inglês deverão apresentar apenas abstract. Nos dois casos, o autor deve tomar cuidado para que o resumo (e o abstract) não ultrapassem 10 linhas cada, sendo que ambos devem estar na primeira página do artigo.
  ])
])

\

= General Information
All full papers and posters (short papers) submitted to some SBC conference, including any supporting documents, should be written in English or in Portuguese. The format paper should be A4 with single column, 3.5 cm for upper margin, 2.5 cm for bottom margin and 3.0 cm for lateral margins, without headers or footers. The main font must be Times, 12 point nominal size, with 6 points of space before each paragraph. Page numbers must be suppressed.

Full papers must respect the page limits defined by the conference. Conferences that publish just abstracts ask for *one*-page texts.

= First Page
The first page must display the paper title, the name and address of the authors, the abstract in English and ``resumo'' in Portuguese (``resumos'' are required only for papers written in Portuguese). The title must be centered over the whole page, in 16 point boldface font and with 12 points of space before itself. Author names must be centered in 12 point font, bold, all of them disposed in the same line, separated by commas and with 12 points of space after the title. Addresses must be centered in 12 point font, also with 12 points of space after the authors' names. E-mail addresses should be written using font Courier New, 10 point nominal size, with 6 points of space before and 6 points of space after.


The abstract and ``resumo'' (if is the case) must be in 12 point Times font, indented 0.8cm on both sides. The word *Abstract* and *Resumo*, should be written in boldface and must precede the text.

= CD-ROMs and Printed Proceedings
In some conferences, the papers are published on CD-ROM while only the abstract is published in the printed Proceedings. In this case, authors are invited to prepare two final versions of the paper. One, complete, to be published on the CD and the other, containing only the first page, with abstract and ``resumo'' (for papers in Portuguese).

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
All images and illustrations should be in black-and-white, or gray tones, excepting for the papers that will be electronically available (on CD-ROMs, internet, etc.). The image resolution on paper should be about 600 dpi for black-and-white images, and 150-300 dpi for grayscale images.  Do not include images with excessive resolution, as they may take hours to print, without any visible difference in the result.

= References
Bibliographic references must be unambiguous and uniform. We recommend giving the author names references in brackets, e.g. @knuth:84, @boulic:91, and @smith:99.

The references must be listed using 12 point font size, with 6 points of space before each r>eference. The first line of each reference should not be indented, while the subsequent should be indented by 0.5 cm.


// References page

/*
You can make a reference inline by calling the author name
followed by a collon and the year in the reference.
All references must be in the bib/references.bib
*/
#pagebreak()

#set par(spacing: 12pt)
#bibliography(
  "bib/references.bib",
  style: "bib/sbc-apalike.csl",
  title: "References",
)
