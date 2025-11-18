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
  font: "Times New Roman", // Reference the file in "fonts/times-new-roman.ttf"
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
    pad(it, x: 7pt, y: 7pt)
} else {
    pad(it, x: 7pt, y: 7pt)
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

= INTRODUÇÃO
Com o passar dos anos e o avanço da tecnologia, novos meio de automação residencial surgiram, permitindo que usuários controlem diversos dispositivos em sua casa de maneira eficiente e prática. Assistentes virtuais, como Amazon Alexa, Google Assistant e Apple Siri, tornaram-se populares, oferecendo controle por voz para uma variedade de dispositivos conectados à Internet, conhecidos como AIOTs (Artificial Intelligence of Things). Esses dispositivos incluem lâmpadas inteligentes, termostatos, câmeras de segurança, entre outros @silva:22.

Em contrapartida, o uso excessivo dessas tecnologias pode acarretar riscos significativos à privacidade de quem os usa, além de abrir portas para vulnerabilidades de segurança, que podem ser exploradas por agentes maliciosos, comprometendo a segurança do ambiente doméstico e a integridade dos dados das pessoas que utilizam desses assistentes virtuais @mendonca:24, além do avanço dos casos de venda de dados pessoais para terceiros sem o consentimento dos usuários. Este artigo tem como objetivo explorar os riscos associados ao uso excessivo de assistentes virtuais e dispositivos AIOTs, destacando as principais vulnerabilidades do uso de maneira excessiva e precipitada dessas tecnologias, além disso vamos abordar maneiras de combater esses riscos e ideializar uma melhor utilização dessas tecnologias de automação.

= METODOLOGIA
A metodologia adotada neste estudo baseia-se em uma abordagem qualitativa, exploratória e bibliográfica, permitindo uma análise aprofundada sobre os riscos de privacidade e segurança associados ao uso de assistentes virtuais e dispositivos

== Definição dos Termos de Busca
Foi realizada uma busca usando 5 (cinco) bases de dados: IEEE Xplore, ACM Digital Library, Scopus, Springer Link e Google Acadêmico. A pesquisa foi definida como: privacidade em assistentes virtuais. Foram desenvolvidos e utilizados durante as pesquisas, nas bases de dados citadas anteriormente, termos de busca especificos para a situação.

#table-with-caption(
    1,
    (
        [Termos de Busca],
        [Information Security OR Cybersecurity OR Data Security],
        [Virtual Assistants OR Voice Assistants OR Smart Assistants],
        [AIoT OR Internet of Things OR IoT Devices OR Intelligent IoT],
        [AIoT AND Privacy OR Smart Assistants AND Privacy],

    ),
    [Termos de Busca]

)

== Revisão Bibliográfica 
Foi realizada uma revisão sistemática de leitura de diferentes artigos que tratam sobre o tema de assistentes virtuais, dispositivos AIOTs, privacidade e segurança digital. Foram consultadas diversass bases de dados acadêmicas, artigos científicos na área determinada e relatórios técnicos relevantes para o tema.

== Análise de Casos
Foram analisados casos documentados de vulnerabilidades e incidentes de segurança relacionados ao uso de assistentes virtuais e dispositivos AIOTs. Essa análise permitiu identificar padrões comuns e as principais ameaças enfrentadas pelos usuários dessas tecnologias.

== Comparação de Tecnologias e Protocolos
Durante a elaboração da pesquisa também foram comparadas diferentes tecnologias e empresas responsáveis por assistentes virtuais de acesso ao público, avaliando seus termos de uso, políticas de privacidade e medidas tomadas para garantia de segurança dos dados dos usuários.

== Síntese dos riscos Identificados
Baseando-se nas informações coletadas, foi realizada a elaboração dos principais riscos associados ao uso em excesso de assistentes virtuais e dispositivos de AIOTs, destacando os problemas mais críticos e as possíveis consquências do mal uso dessas tecnologias.

= Assistentes virtuais
Assistentes virtuais são programas feitos para a realização de tarefas de maneira automática com a utilização de Inteligências Artificiais (IA). O seu funcionamento passa por um sistema de fala para texto, a onde o dispositivo recebe a fala do usuário como entrada, transforma para texto e processa a tarefa com base no texto recebido. @ribeiro:24.

A Alexa, uma assistente de voz que se comunica com a sua Inteligência Artifical respectiva, toma a fala do utente e utiliza dela para disparar um evento respectivo a fala e então o evento é enviado aos servidores da Amazon onde o evento é devidamente tratado e retorna para o consumidor a ação correspondente @ribeiro:24.

= PERIGOS AO USO EXCESSIVO DE ASSISTENTES VIRTUAIS
== Uso excessivo
Na conteporâniedade do nosso atual milênio, o uso cotidiano e constante de tecnologia vem cada vez aumenta mais e mais, a ponto de dispositivos eletrônicos se tornarem um pilar intrínseco em nossas vidas. O manuseio quotidiano de aparelhos digitais é algo muito intenso no dias de hoje e, com a falta de educação digital, a grande maioria da população tende a ter um uso "indevido" dessas tecnologias tanto no contexto de assistentes virtuais quanto no aspecto mais geral, que não será abordado neste artigo. 

Devido a popularização do uso indevido e excessivo de assistentes virtuais, nota-se grandes falhas na percepção do funcionamento de tais aparelhos. É muito comum o processo de pensamento que concluí em uma forte segurança nessas ferramentas já que o ativamento se vem apenas, e somente, via fala pré-definida para a utilização do mesmo @silva:22.

== Gravação constante
É muito notável o uso constante e, em grande parte dos casos comuns, indevido dos usuários sob tais assistentes virtuais. Muitos, por não entenderem o funcionamento correto do aparelho e/ou _software_ acabam não percebendo certos detalhes que podem acarretar, e acarretam, em muitas brechas no contexto de privacidade. Uma boa exemplificação de uma falha na falsa segurança proposta pelas distribuidoras de dispositivos utilizadores de assistentes virtuais seriam as conversas que podem ser extraídas de aparelhos que o áudio nunca é desligado para um "melhor atendimento do dispositivo" levando a áudios de conversas privadas completamente disassociadas a qualquer contexto semelhante à chamada do evento para a "ativação" do aparelho, comprometendo, assim, a privacidade e a segurança do utilizador @mendonca:24.

== Vazamento e Armazenamento de dados


#pagebreak()

#set par(leading: 12pt)
#bibliography(
  "bib/references.bib",
  style: "bib/sbc-apalike.csl",
  title: "References",
)
