
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Gatlen Culp"
#let locale-catalog-page-numbering-style = context { "Gatlen Culp - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Apr 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.2em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(72, 61, 139)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(72, 61, 139)
#let design-colors-connections = rgb(85, 85, 85)
#let design-colors-links = rgb(72, 61, 139)
#let design-section-titles-font-family = "Poppins"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 5pt
#let design-section-titles-font-size = 1.2em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.65cm
#let design-section-titles-vertical-space-below = 0.5cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 11pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Poppins"
#let design-header-name-font-size = 20pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "Poppins"
#let design-header-vertical-space-between-name-and-connections = 0.3cm
#let design-header-vertical-space-between-connections-and-first-section = 0.8cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = left
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.3cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.4em
#let design-entries-vertical-space-between-entries = 1.3em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = false
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 1.3cm
#let design-page-bottom-margin = 1.3cm
#let design-page-left-margin = 1.3cm
#let design-page-right-margin = 1.3cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = false
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

= Gatlen Culp

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Cambridge, MA],
  [#box(original-link("mailto:gculp@mit.edu")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)gculp\@mit.edu])],
  [#box(original-link("http://gatlen.me/")[#fa-icon("link", size: 0.9em) #h(0.05cm)gatlen.me])],
  [#box(original-link("https://github.com/GatlenCulp")[#fa-icon("github", size: 0.9em) #h(0.05cm)GatlenCulp])],
  [#box(original-link("https://scholar.google.com/citations?user=Gatlen_Culp")[#fa-icon("graduation-cap", size: 0.9em) #h(0.05cm)Google Scholar])],
)
#connections(connections-list)



== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BS]],
  middle-content: [
    #strong[Massachusetts Institute of Technology]

Computer Science with a concentration in AI & Decision Making
  ],
  right-content: [
    #strong[Sept 2021 -- Dec 2025]

Cambridge, MA
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #box(
      fa-icon("ruler-combined", size: 0.7em, solid: true),
      baseline: -10%,
    )
    #strong[AI Evaluations & Software Engineering Contractor]

#link("https://metr.org/")[Model Evaluation and Threat Research \(METR\)]
 ⋅ #link("https://vivaria.metr.org/")[Vivaria]  ⋅ #link("https://github.com/GatlenCulp/homebrew-vivaria/")[Homebrew]  ⋅ #link("https://github.com/METR/vivaria/pull/710")[Eval Templates]   ],
  right-content: [
    #strong[Sept 2024 -- present]

Remote
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Developed CLI tools, evaluation templates, and installers for #link("https://vivaria.metr.org/")[Vivaria], a platform used by METR to conduct AI capability and risk evaluations in partnership with OpenAI, Anthropic, and US\/UK AI safety institutes. Enhanced documentation for rapid adoption. Investigated integrating  SWE-Agent and UK AISI's Inspect framework])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #box(
      fa-icon("spider", size: 0.7em, solid: true),
      baseline: -10%,
    )
    #strong[DevOps & Full Stack Engineer]

#link("https://compbio.mit.edu/")[MIT Computational Biology Lab]
 ⋅ #link("https://home.withmantis.com/")[MantisAI Website]   ],
  right-content: [
    #strong[June 2024 -- Aug 2024]

Cambridge, MA
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Engineered NetworkX-based graph visualization system, DevOps infrastructure, and testing suite for #link("https://home.withmantis.com/")[MantisAI], a Django web platform for interactive text and data analysis. Architected CI\/CD pipeline with GitHub Actions, Docker, and AWS deployment. Led PostgreSQL migration, identified critical security vulnerabilities, and lead a project-wide codebase and documentation refactor.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #box(
      fa-icon("file-lines", size: 0.7em, solid: true),
      baseline: -10%,
    )
    #strong[Director of Operations]

#link("https://aialignment.mit.edu")[MIT AI Alignment] \(+ #link("https://haist.ai/")[Harvard AI Safety Team]\)
 ⋅ #link("https://mitalignment.notion.site/MopMan-Documentation-9bbc80b1f07744458712211f4817dfc1?pvs=74")[MopMan]  ⋅ #link("https://mitalignment.notion.site/Resources-for-AIS-University-Groups-8006446beb6b45b6be3052901ac93ff7?pvs=74")[Public Resources]  ⋅ #link("https://github.com/GatlenCulp/gatpack")[GatPack]   ],
  right-content: [
    #strong[Feb 2023 -- Nov 2024]

Cambridge, MA
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Led operations for student organization across 300+ people and 36+ programs. Created #link("https://mitalignment.notion.site/MopMan-Documentation-9bbc80b1f07744458712211f4817dfc1?pvs=74")[MopMan] and #link("https://github.com/GatlenCulp/gatpack")[GatPack] automation tooling saving 7 hours\/week across 3+ AI safety groups. Halved expenses via office relocation. Managed facility logistics, interior design, digital infrastructure, communications, and program operations.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #box(
      fa-icon("robot", size: 0.7em, solid: true),
      baseline: -10%,
    )
    #strong[Machine Learning Researcher]

#link("https://seri.stanford.edu/")[Stanford Existential Risks Initiative] & #link("https://github.com/Algorithmic-Alignment-Lab/CommonClaim")[MIT Algorithmic Alignment Group]
 ⋅ #link("https://github.com/Algorithmic-Alignment-Lab/CommonClaim")[CommonClaim]   ],
  right-content: [
    #strong[June 2022 -- Oct 2022]

Berkeley, CA
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Developed RL fine-tuning technique for GPT-2 to autonomously identify diverse prompts resulting in harmful model outputs \(violence, disinformation, etc.\). Built evaluation pipelines and created survey resulting in the #link("https://github.com/Algorithmic-Alignment-Lab/CommonClaim")[CommonClaim] dataset of 20,000 boolean statements. Paper - \"#link("https://arxiv.org/abs/2306.09442")[Explore, Establish, Exploit- Red Teaming Language Models from Scratch]\".])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #box(
      fa-icon("globe", size: 0.7em, solid: true),
      baseline: -10%,
    )
    #strong[Full Stack Web Developer]

#link("https://civicdatadesignlab.mit.edu/")[MIT's Civic Data Design Lab \(CDDL\)]
  ],
  right-content: [
    #strong[May 2022 -- June 2022]

Cambridge, MA
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Finalized #link("https://livingheritage.mit.edu/")[UN Heritage Website] and WhatsApp interface in under three weeks. Implemented contribution web-form using React, SASS, REST API, and Node. Created WhatsApp informational messaging interface with Twilio. Developed image compression script to improve MongoDB load times.])], column-gutter: 0cm)
  ],
)



== Misc


#one-col-entry(
  content: [#strong[Professional Certifications:] #link("https://www.credly.com/badges/83bd3cf9-7488-4954-97bf-e3575973ce2d/public_url")[AWS Certified Cloud Practitioner] \(Dec 2023 - Dec 2026\), Autodesk Certified User - Inventor, OSHA 10-Hour General Industry \(Feb 2020\)]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Academic & Technical Awards:] #link("https://floridatsa.org/wp-content/uploads/2019/03/2019-Awards-Report.pdf")[State-Level Competitive Programming Awards] \(TSA\), '#link("https://www.contest.comap.com/highschool/contests/himcm/instructions.html#:~:text=COMAP'S%20High%20School%20Mathematical%20Contest,problem%20solving%2C%20and%20writing%20skills")[Meritorious]' Award \(HiMCM\), #link("https://tryhackme.com/p/GatlenCulp")[TryHackMe Badges and Experience]]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Notable Projects:] #link("https://www.linkedin.com/feed/update/urn:li:activity:6697359801967607808/")[OpenGesture] - OpenCV app for custom keyboard\/mouse inputs, #link("https://drive.google.com/file/d/1WwNgYYWfpA8-xY6De4dTSH_6tmojpW30/view?usp=sharing")[Transformative AI] - Technical article on AI trajectory and impacts, #link("http://gatlen.blog")[Personal Blog] - Containing various notes and thoughts, #link("https://github.com/GatlenCulp/gatlens-opinionated-template")[GOTem] - Cutting-edge, opinionated, and ambitious project builder for power users and researchers]
)


