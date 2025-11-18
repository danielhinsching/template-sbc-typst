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
    *Riscos associados ao uso excessivo de assistentes virtuais*
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

Em contrapartida, o uso excessivo dessas tecnologias pode acarretar riscos significativos à privacidade de quem os usa, além de abrir portas para vulnerabilidades de segurança, que podem ser exploradas por agentes maliciosos, comprometendo a segurança do ambiente doméstico e a integridade dos dados das pessoas que utilizam desses assistentes virtuais @mendonca:24, além do avanço dos casos de venda de dados pessoais para terceiros sem o consentimento dos usuários. Este artigo tem como objetivo explorar os riscos associados ao uso excessivo de assistentes virtuais, destacando as principais vulnerabilidades do uso de maneira excessiva e precipitada dessas tecnologias, além disso vamos abordar maneiras de combater esses riscos e ideializar uma melhor utilização dessas tecnologias de automação.

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
        [AIoT AND Voice Assistant OR AIoT AND Privacy],
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

Além disso, o uso excessivo contribui para a naturalização da vigilância contínua, já que a convivência constante com dispositivos de escuta ativa leva o usuário a ignorar os riscos envolvidos. Esse processo, muitas vezes inconsciente, faz com que se aceite passivamente a coleta massiva de dados, expondo-se cada vez mais a falhas de segurança e a interferências externas.

== Gravação constante
É muito notável o uso constante e, em grande parte dos casos comuns, indevido dos usuários sob tais assistentes virtuais. Muitos, por não entenderem o funcionamento correto do aparelho e/ou _software_ acabam não percebendo certos detalhes que podem acarretar, e acarretam, em muitas brechas no contexto de privacidade. Uma boa exemplificação de uma falha na falsa segurança proposta pelas distribuidoras de dispositivos utilizadores de assistentes virtuais seriam as conversas que podem ser extraídas de aparelhos que o áudio nunca é desligado para um "melhor atendimento do dispositivo" levando a áudios de conversas privadas completamente disassociadas a qualquer contexto semelhante à chamada do evento para a "ativação" do aparelho, comprometendo, assim, a privacidade e a segurança do utilizador @mendonca:24.

O comportamento de escuta permanente ocorre não apenas quando o usuário interage com o dispositivo, mas também durante o estado de espera. Quanto mais tempo o assistente virtual permanece ativo — geralmente como consequência do uso excessivo — maior é a probabilidade de captação de áudios não intencionais (false wake-ups), potencialmente contendo informações sensíveis. Segundo pesquisas recentes, essas gravações podem até ser acessadas por funcionários para fins de aprimoramento do sistema, sem garantia de anonimização.

== Vazamento e Armazenamento de dados
Armazenamento de dados de usuários é uma prática comum entre as empresas que desenvolvem assistentes virtuais. Esses dados são frequentemente utilizados para melhorar os serviços oferecidos, personalizar a experiência do usuário e para fins de marketing. No entanto, o armazenamento inadequado ou o vazamento desses dados pode levar a sérias consequências para a privacidade dos usuários @silva:22.

Ataques cibernéticos direcionados a assistentes virtuais podem resultar no vazamento de informações pessoais sensíveis, como conversas privadas, dados financeiros e informações de localização. Esses ataques podem ser realizados por meio de vulnerabilidades no software do assistente virtual ou por meio de técnicas de engenharia social para enganar os usuários a fornecerem informações confidenciais @mendonca:24.

Outro fator agravante é que, na maioria dos casos, os usuários não possuem controle efetivo sobre os dados já armazenados. Mesmo após solicitar a exclusão, estudos indicam que parte dessas informações pode permanecer retida nos servidores das empresas, possibilitando o uso indevido ou a exposição futura em caso de incidentes de segurança. Assim, quanto mais frequente for a utilização do assistente virtual, mais extenso será o histórico comportamental construído, incluindo hábitos domésticos, rotinas horárias e até padrões de interação familiar.

= USO DEVIDO DE ASSISTENTES VIRTUAIS
O uso devido da tecnologia presente na atualidade é uma pauta muito pouco presente em contextos educacionais e até banalizada informalmente. Isso também se desmembra para o uso indevido de assistentes virtuais, onde o consumidor não se preocupa com a sua própria segurança digital. É de extrema importância que o usuário tenha ciência dos riscos que o uso excessivo de tais tecnologias pode acarretar, para que assim possa fazer um uso consciente e seguro das mesmas @oliveira:23.

O uso devido de assistentes virtuais está intrinsecamente ligado à adoção de práticas de responsabilidade digital, conceito que engloba não apenas a utilização funcional da tecnologia, mas também a preocupação com os impactos éticos, sociais e jurídicos decorrentes dessa interação. Em um cenário no qual assistentes virtuais atuam como mediadores entre o usuário e o ambiente digital, compreender seus mecanismos de coleta, processamento e compartilhamento de dados torna-se uma competência fundamental para garantir a preservação da privacidade e a conformidade com princípios legais, como os estabelecidos pela Lei Geral de Proteção de Dados (LGPD).

== Consciência do utente
A conscientização do usuário sobre os riscos associados ao uso excessivo de assistentes virtuais é fundamental para mitigar possíveis ameaças à privacidade e segurança. Campanhas educativas, workshops e materiais informativos podem ajudar a disseminar conhecimento sobre boas práticas no uso dessas tecnologias @ribeiro:24. Além disso, é importante que os usuários estejam cientes das políticas de privacidade e termos de uso dos assistentes virtuais que utilizam, para entender como seus dados são coletados, armazenados e utilizados pelas empresas responsáveis @oliveira:23.

Além disso, é necessário promover uma postura crítica em relação ao uso automatizado dessas ferramentas, evitando que a familiaridade e a conveniência tecnológica conduzam à aceitação passiva de dispositivos que permanecem constantemente em escuta ativa @isadora:23. Os usuários devem ser incentivados a questionar e avaliar continuamente as implicações de privacidade associadas ao uso de assistentes virtuais, adotando uma abordagem proativa na proteção de seus dados pessoais.

== Configuração adequada de segurança
A configuração adequada das opções de segurança e privacidade nos assistentes virtuais é essencial para proteger os dados dos usuários. Isso inclui a ativação de autenticação de dois fatores, a revisão regular das permissões concedidas aos aplicativos conectados ao assistente virtual e a desativação de recursos que não são necessários para o uso cotidiano @silva:22. Além disso, é recomendável que os usuários revisem e excluam periodicamente o histórico de comandos e interações armazenadas pelos assistentes virtuais, reduzindo a quantidade de dados sensíveis disponíveis.

A utilização segura também envolve restringir a integração automática com outros dispositivos inteligentes, de forma a limitar a atuação do assistente virtual apenas aos recursos estritamente necessários. Para isso, recomenda-se que o usuário desative permissões invasivas e revise periodicamente os acessos concedidos, evitando que o dispositivo interfira em sistemas críticos do ambiente doméstico ou profissional.

= CONCLUSÃO
Com isso, vê-se que o artigo pôde analisar os riscos associados ao uso excessivo de assistentes virtuais, com ênfase em vulnerabilidades relacionadas à privacidade, armazenamento de dados e comportamento digital dos usuários. Observou-se que a crescente integração desses dispositivos no cotidiano, impulsionada pela facilidade de uso e automação de tarefas, tem contribuído para a naturalização da vigilância contínua e da coleta massiva de informações pessoais, muitas vezes sem o devido consentimento ou compreensão do usuário sobre o funcionamento dessas tecnologias @silva:22.

Entre os riscos identificados, destacam-se a gravação constante, a possibilidade de acesso indevido por terceiros — incluindo funcionários das empresas desenvolvedoras — e o armazenamento inseguro de dados sensíveis, os quais podem ser comprometidos em situações de ataques cibernéticos ou falhas de segurança @mendonca:24. Adicionalmente, verificou-se que o uso excessivo desses assistentes potencializa tais ameaças, uma vez que amplia a exposição temporal e comportamental dos usuários, tornando-os mais suscetíveis a violações de privacidade.

Por outro lado, identificou-se que o uso devido dessas tecnologias pode mitigar significativamente os riscos levantados. Tal prática envolve a adoção de uma postura crítica e consciente por parte do usuário, aliada à implementação de medidas técnicas de segurança, como a restrição de permissões, a revisão periódica de históricos de interação e a configuração de autenticação de múltiplos fatores @ribeiro:24; @silva:22. Nesse contexto, a educação digital assume papel essencial no processo de conscientização, permitindo que o usuário compreenda melhor as implicações éticas, sociais e jurídicas do uso de assistentes virtuais, promovendo um comportamento mais responsável e seguro @oliveira:23.

Conclui-se, portanto, que a utilização de assistentes virtuais pode ser considerada benéfica e funcional desde que realizada de maneira equilibrada e informada. Recomenda-se que futuras pesquisas aprofundem a análise sobre a relação entre educação digital e comportamento tecnológico, bem como explorem soluções técnicas capazes de reduzir a coleta de dados desnecessários e ampliar a transparência nos processos de processamento e armazenamento. Dessa forma, será possível avançar para um modelo de uso tecnológico mais sustentável, ético e centrado na proteção do usuário.

#pagebreak()

#set par(leading: 12pt)
#bibliography(
  "bib/references.bib",
  style: "bib/sbc-apalike.csl",
  title: "References",
)
