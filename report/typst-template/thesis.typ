// A central place where libraries are imported (or macros are defined)
// which are used within all the chapters:
#import "utils/global.typ": *


// Fill me with the Abstract
#let abstract = [#lorem(150)]

// Fill me with acknowledgments
#let acknowledgements = [#lorem(50)]


// if you have appendices, add them here
#let appendix = [
  = Appendices
  //#include "./chapters/appendix.typ"
]

// Put your abbreviations/acronyms here.
// 'key' is what you will reference in the typst code
// 'short' is the abbreviation (what will be shown in the pdf on all references except the first)
// 'long' is the full acronym expansion (what will be shown in the first reference of the document)
//
// In the text, call @eeg or @uniS to reference  the shortcode
#let abbreviations = (
  (
    key: "eeg",
    short: "EEG",
    long: "Electroencephalography",
  ),
  (
    key: "uniS",
    short: "UoS",
    long: "University of Stuttgart",
  ),
)

#show: thesis.with(
  author: "<author>",
  title: "<title>",
  degree: "<degree>",
  faculty: "Faculty of Electrical Engineering and Computer Science",
  department: "Computational Cognitive Science",
  major: "<major>",
  supervisors: (
    (
      title: "Main Supervisor",
      name: "Benedikt Ehinger",
      affiliation: [Computational Cognitive Science \
        Faculty of Electrical Engineering and Computer Science, \
        Department of Computer Science
      ],
    ),
    (
      title: "Second Supervisor",
      name: "Max Mustermann",
      affiliation: [Computational Cognitive Science \
        Faculty of Electrical Engineering and Computer Science, \
        Department of Computer Science
      ],
    ),
  ),
  epigraph: none,
  abstract: abstract,
  appendix: appendix,
  acknowledgements: acknowledgements,
  preface: none,
  figure-index: false,
  table-index: false,
  listing-index: false,
  abbreviations: abbreviations,
  date: datetime(year: 2025, month: 6, day: 1),
  bibliography: bibliography("refs.bib", title: "Bibliography", style: "ieee"),
)

// Code blocks
#codly(
  languages: (
    rust: (
      name: "Rust",
      color: rgb("#CE412B"),
    ),
    // NOTE: Hacky, but 'fs' doesn't syntax highlight
    fsi: (
      name: "F#",
      color: rgb("#6a0dad"),
    ),
  ),
)

// If you wish to use lining figures rather than old-style figures, uncomment this line.
// #set text(number-type: "lining")


// Main Content starts here

// Proposal Phase:
= Introduction <chp:introduction>
== Motivation
This is the motivation for your project. Why is it interesting?
== Other work
Here you add all the Background findings, citing different studies and the likes. You do not need to include text-book knowledge e.g. how exactly EEG works, except if you are working on the topic and require the detail. Think of writing this proposal for a fellow student, but one that was in the EEG/ET-courses already.

//
// NOTE:
// It's important to have explicit pagebreaks between each chapter,
// otherwise header stylings from the template might break
#pagebreak()
= Planned Project
== Research Question
What is the main guiding question(s) you want to answer?

== Approach
How are you going to answer them?

== Goals
Here you define the goals you really want to reach, and the stretch goals. Please link (via e.g. wording) the respective goal list to the respective paragraphs in the previous section `Approach`
=== Main Goals
1. I want to finish this Proposal
2. I want to finish my Thesis
=== Stretch Goals
1. I'll do another thesis if there is time


#pagebreak()
= Plan
Some 3-4 sentences on the order, but mainly focus on the time-table. Note that every planning time-table is subject to change and adaptation during the project. It is a first orientation, but should be discussed and adapted regularly


= Other chapters
#include "template/demo/main.typ"
