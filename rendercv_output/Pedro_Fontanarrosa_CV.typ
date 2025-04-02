
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Pedro Fontanarrosa"
#let locale-catalog-page-numbering-style = context { "Pedro Fontanarrosa - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Mar 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-full-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Pedro Fontanarrosa

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)London, England, GB],
  [#box(original-link("mailto:pfontanarrosa@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)pfontanarrosa\@gmail.com])],
  [#box(original-link("tel:+44-7564-594770")[#fa-icon("phone", size: 0.9em) #h(0.05cm)07564 594770])],
  [#box(original-link("https://fontanapink.github.io/Resume-PedroFontanarrosa/")[#fa-icon("link", size: 0.9em) #h(0.05cm)fontanapink.github.io\/Resume-PedroFontanarrosa])],
  [#box(original-link("https://github.com/Fontanapink")[#fa-icon("github", size: 0.9em) #h(0.05cm)Fontanapink])],
  [#box(original-link("https://orcid.org/0000-0002-0535-2684")[#fa-icon("orcid", size: 0.9em) #h(0.05cm)0000-0002-0535-2684])],
  [#box(original-link("https://scholar.google.com/citations?user=Pedro Fontanarrosa")[#fa-icon("graduation-cap", size: 0.9em) #h(0.05cm)Google Scholar])],
  [#box(original-link("https://researchgate.net/profile/Pedro Fontanarrosa")[#fa-icon("researchgate", size: 0.9em) #h(0.05cm)Pedro Fontanarrosa])],
  [#box(original-link("https://linkedin.com/in/Pedro Fontanarrosa")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)Pedro Fontanarrosa])],
)
#connections(connections-list)



== Profile


#one-col-entry(
  content: [Broadly skilled researcher with a strong foundation in computational\/software engineering and biological sciences.]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [Extensive experience developing Genetic Design Automation \(GDA\) tools and mathematical models for genetic circuit design during Master's and PhD research.]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [Currently expanding into advanced machine learning algorithm development at UCL—designing custom Gaussian process regression kernels, applying Bayesian inference with VAR regression, and developing physics-informed neural networks.]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [Excels in remote, multidisciplinary collaborations.]
)


== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[Ph.D.]],
  middle-content: [
    #strong[University of Utah], Biomedical Engineering \(Synthetic Biology Track\)
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([GPA: 3.8\/4.0],[Courses: \[\]],)
  ],
  right-content: [
    Salt Lake City, UT, USA

Aug 2019 – Aug 2022
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[Master]],
  middle-content: [
    #strong[University of Utah], Bioengineering \(Synthetic Biology Track\)
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([GPA: 3.67\/4.0],[Courses: \[\]],)
  ],
  right-content: [
    Salt Lake City, UT, USA

Aug 2017 – Aug 2019
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[Licentiate]],
  middle-content: [
    #strong[University of Buenos Aires], Biological Sciences \(Genetics, Evolution and Ecology\)
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([GPA: 8.39\/10.00],[Courses: \[\]],)
  ],
  right-content: [
    Buenos Aires, Argentina

Jan 2007 – Jan 2014
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Computational Systems and Synthetic Biology Lab, University College London], Postdoctoral Researcher
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Focus on developing and enhancing Python packages tailored for modeling, inference, and design of biological systems. Responsible for creating and adapting CI\/CD pipelines to streamline the software development lifecycle for computational biology, while applying and advancing machine learning techniques—including Gaussian processes, neural networks, and VAR models—and Bayesian optimization methods to improve the design and analysis of complex biological systems.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed robust Python packages for genetic design automation and modeling inference],[Created and adapted CI\/CD pipelines for scalable computational biology workflows],[Applied and advanced machine learning \(GP, VAR, NN\) and Bayesian optimization algorithms to enhance predictive modeling and system design],)
  ],
  right-content: [
    London, UK

June 2023 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Genetic Logic Lab, University of Boulder], Postdoctoral Researcher
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Developed Genetic Design Automation \(GDA\) tools and mathematical models for synthetic biology. Focused on computational methods for genetic circuit simulation and design in a collaborative, interdisciplinary setting.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Enhanced iBioSim functionalities for genetic circuit modeling],[Developed robust mathematical models for genetic design],[Collaborated with international research teams using cloud-based tools],)
  ],
  right-content: [
    Boulder, CO, USA

Aug 2022 – June 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[University of Utah], Research Assistant \(PhD Researcher\)
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Conducted independent advanced research in Biomedical Engineering focused on developing computational models and Genetic Design Automation \(GDA\) tools. Performed mathematical modeling and simulation to guide experimental validation.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Simulated genetic regulatory networks using stochastic modeling, forecasting gene expression levels with 95\% accuracy and guiding subsequent experimental validation by other team members.],[Guided experimental research through simulation-based predictions],[Collaborated on interdisciplinary synthetic biology projects],)
  ],
  right-content: [
    Salt Lake City, UT, USA

Aug 2019 – Aug 2022
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[COMBINE Standards], SBOL Editor
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Curated and maintained the Synthetic Biology Open Language \(SBOL\) standard for representing biological designs. Coordinated change proposals and supported the development of software libraries and community documentation.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Led weekly meetings to coordinate SBOL standard updates],[Facilitated community-driven revisions and improvements to SBOL],[Enhanced interoperability in synthetic biology data exchange],)
  ],
  right-content: [
    Online

Jan 2019 – Jan 2022
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[University of Utah], Research Assistant \(Master's Researcher\)
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Performed supervised research focused on early-stage development of computational tools for genetic circuit design. Assisted in mathematical modeling and collaborative simulation projects.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Contributed to preliminary genetic circuit modeling tools],[Supported modeling and simulation of genetic regulatory systems],[Collaborated on interdisciplinary research initiatives],)
  ],
  right-content: [
    Salt Lake City, UT, USA

Aug 2017 – Aug 2019
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Northlands School], Highschool Chemistry Teacher
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Taught chemistry to high school students and coordinated Extended Essays in chemical research.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed lesson plans that enhanced student engagement],[Mentored students in chemical research projects],)
  ],
  right-content: [
    Buenos Aires, Argentina

Jan 2015 – Jan 2017
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Tarbut School], Science and Mathematics Teacher
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Taught science and mathematics to primary and high school students and organized Mathematical Ingenious Olympiads.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Designed and implemented creative educational programs],[Coordinated school-wide science and math competitions],)
  ],
  right-content: [
    Buenos Aires, Argentina

Jan 2014 – Jan 2015
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Evolutionary Studies Laboratory, University of Buenos Aires], Research Assistant
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Conducted research in genetics and ecology, including maintaining Drosophila isogenetic lines, coordinating field expeditions, managing statistical programs and databases, and mentoring lab members.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Coordinated field expeditions and permit negotiations],[Managed statistical programs and databases],[Trained new laboratory members],)
  ],
  right-content: [
    Buenos Aires, Argentina

Jan 2010 – Jan 2014
  ],
)



== Projects


#two-col-entry(
  left-content: [
    #strong[Synergistic Discovery and Design \(SD2\)]
  ],
  right-content: [
    Jan 2018 – June 2022
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Genetic circuit design for extreme environments enabled by models extracted from petabyte+ perturbation analyses.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[iBioSim Development]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Worked on iBioSim—a CAD tool for modeling, analysis, and design of genetic circuits supporting SBML and SBOL, including capabilities for multicellular and spatial models.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Advanced Machine Learning for Biological Systems]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Developing and applying novel machine learning algorithms to model and predict the structure and dynamics of biological systems. Techniques include custom Gaussian process regression with covariance \(kernel\) designs, Bayesian inference with VAR regression for time-series analysis, and physics-informed neural networks for scalable inference with limited samples. Originally applied to microbial systems, these methods are generalizable to any biological system.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Detecting Fake News]
  ],
  right-content: [
    Jan 2022 – present
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A machine learning project that uses advanced algorithms to detect fake news. Developed in Python and hosted on GitHub.])], column-gutter: 0cm)
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Software Engineering:] Expert; Keywords: Python, Java, C++, JavaScript, R, Git, GitHub, GitLab, CI\/CD, Docker, Kubernetes, Google Cloud, TensorFlow, PyTorch, scikit-learn]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Optimization & Operations Research:] Expert; Keywords: CPLEX, Gurobi, Pyomo, Linear Programming, Nonlinear Programming, Integer Programming]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Web Scraping:] Intermediate; Keywords: Scrapy, Splash, Selenium]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Probabilistic Modeling:] Advanced; Keywords: Gaussian Process Regression, Bayesian Machine Learning]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Data Science & Machine Learning:] Expert; Keywords: Artificial Intelligence, Data Analysis, Neural Networks, Physics-Informed Neural Networks, Bayesian Inference, VAR Regression]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Web Development:] Expert; Keywords: HTML, Hugo, Jekyll]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Databases:] Intermediate; Keywords: SQL]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[High Performance Computing:] Expert; Keywords: HPC, Parallel Computing, Cluster Computing, MPI, Job Scheduling, Distributed Computing]
)


== Publications


#two-col-entry(
  left-content: [
    #strong[Evaluating the Contribution of Model Complexity in Predicting Robustness in Synthetic Genetic Circuits]

  ],
  right-content: [
    Jan 2024
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Pedro Fontanarrosa

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/xx.xxxx/acssynbio.xxxxxx")[doi.org/xx.xxxx/acssynbio.xxxxxx] (ACS Synthetic Biology)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Synthetic Biology Open Language \(SBOL\) Version 3.1.0]

  ],
  right-content: [
    Jan 2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Pedro Fontanarrosa

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/xx.xxxx/jib.xxxxxx")[doi.org/xx.xxxx/jib.xxxxxx] (Journal of Integrative Bioinformatics)])



== Awards


#one-col-entry(
  content: [- Fulbright and Argentine Presidential Fellowship in Science & Technology, Date: 2017, Awarder: Argentine President’s Cabinet & U.S. Embassy of Buenos Aires, Summary: Awarded to pursue a master’s degree in the United States starting Fall 2017.],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Research and Communication Excellency Award, Date: 2015, Awarder: Ministry of Science and Technology, Argentinean government, Summary: Recognized for excellence in research and communication under the 'Beca Estímulo' scholarship.],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Beca Estímulo \(Encouragement Scholarship\), Date: 2011, Awarder: University of Buenos Aires, Summary: Supported research and development tasks in genetics and ecology.],
)


== Certificates


#one-col-entry(
  content: [- Data Science Bootcamp – THE ERDŐS INSTITUTE \(2023\); URL: https:\/\/www.erdosinstitute.org\/certificates\/spring-2023\/data-science-boot-camp\/pedro-fontanarrosa],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus \[2023\] – Udemy \(2023\); URL: https:\/\/www.udemy.com\/certificate\/UC-099abc5f-7fbc-4674-988d-1c2c96302ec8\/],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Optimization with Python: Solve Operations Research Problems – Udemy; URL: https:\/\/www.udemy.com\/course\/optimization-with-python-linear-nonlinear-and-cplex-gurobi\/?couponCode=ST10MT30325G2],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Optimization with Python: Complete Pyomo Bootcamp A-Z – Udemy; URL: https:\/\/www.udemy.com\/course\/optimization-with-python-complete-pyomo-bootcamp-a-z\/?couponCode=ST10MT30325G2],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- AI and Meta-Heuristics \(Combinatorial Optimization\) Python – Udemy; URL: https:\/\/www.udemy.com\/course\/ai-and-combinatorial-optimization-with-meta-heuristics\/?couponCode=ST10MT30325G2],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Modern Web Scraping with Python using Scrapy Splash Selenium – Udemy; URL: https:\/\/www.udemy.com\/course\/web-scraping-in-python-using-scrapy-and-splash\/?couponCode=ST10MT30325G2],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Deployment of Machine Learning Models – Udemy; URL: https:\/\/www.udemy.com\/course\/deployment-of-machine-learning-models\/?couponCode=ST10MT30325G2],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Pyomo Bootcamp: Python Optimization from Beginner to Advance – Udemy; URL: https:\/\/www.udemy.com\/course\/optimization-in-python\/?couponCode=ST10MT30325G2],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Theory of Gaussian Process Regression for Machine Learning – Udemy; URL: https:\/\/www.udemy.com\/course\/gaussian-process-regression-fundamentals-and-application\/?couponCode=ST10MT30325G2],
)


== Languages


#one-col-entry(
  content: [#strong[Spanish:] Native]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[English:] Proficient]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Portuguese:] Intermediate]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[French:] Beginner]
)


== Volunteer


#one-col-entry(
  content: [- Data-Centric Biological Design & Engineering Interest Group – Organizer, URL: https:\/\/data-centric-biodesign-tig.github.io\/, Start: 2024-10, End: 2025-05, Summary: Organizes a monthly seminar series under the Alan Turing Institute's banner to leverage AI in advancing biological system engineering. Unites experts from computer science, biology, and engineering to address global challenges in sustainable manufacturing, healthcare innovation, and environmental impact.],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Biohacking BA – Volunteer Organizer, URL: https:\/\/www.meetup.com\/es\/biohackingBA\/, Start: 2013-01, End: 2017-01, Summary: Organized talks, workshops, hackathons, and DIY projects to promote innovation in science, engineering, and synthetic biology. Highlights: Organized hackathons for SBOL and FAIR data practices; Coordinated interdisciplinary teams and managed remote collaboration.],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- University of Buenos Aires Biology Week – Event Organizer, Start: 2010-01, End: 2012-01, Summary: Coordinated the annual Biology Week to promote science careers among high school students.],
)


== Interests



#one-col-entry(
  content: [
    #strong[Synthetic Biology]

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Electronics & DIY]

    
  ],
)



