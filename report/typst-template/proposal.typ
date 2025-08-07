#import "utils/general-utils.typ": * 
#import "template/styles.typ": *

#set document(title: "Thesis Proposal") // this title is visible in the PDF viewer

#show: styles

#set align(center)
#text(
  heading("A Bachelor/Master thesis proposal", numbering: none, outlined: false), size: 1.15em
)
#v(14pt)

#text("Master Thesis Proposal - <student name>
June 2025")
\


#line(length: 100%, stroke: gray)

#set align(left)
// #set heading(numbering: (x, ..xs) => numbering("1.", ..xs))
#set heading(numbering: "1.")


= Introduction

== Motivation
Electroencephalography (EEG) is a method of recording the electrical activity of the brain using a set of electrodes on the scalp and/or the face skin of the subject. The voltage difference measured between the respective scalp electrodes and a particular reference electrode is captured and stored as recorded EEG data @hari_meg-eeg_2017. The potentials recorded, however, contain not only the signals from the brain but also unwanted potentials (or 'artifacts') arising from other electrical and physical activity in the body and environment. These artifacts may be from biological sources, like eye movements, muscle movements, heartbeats and so on, or non-biological (e.g. power line noise, electrode pop, etc.). The artifacts can either be avoided by adjusting experimental conditions, or they can be compensated or removed after recording, i.e. during the preprocessing step before data analysis. In either case, the artifacts must be eliminated from the EEG data in order to get as close to a pure brain-signal as possible. #pc[@uriguen_eeg_2015] reviewed the various methods in use for this purpose. 

EEG data analysis and artifact correction methods are often provided in the form of software packages, such as in EEGLAB @delorme_eeglab_2004, autoreject @jas:hal-01313458, and MNE @larson_mne-python_2024. Although these can be tested and evaluated using real datasets from EEG recording studies, it is desirable to know the ground truth of the data being analyzed, which is difficult when working with real data. Simulating EEG data for this purpose then becomes a useful option. Some researchers choose to themselves simulate datasets, with artifacts placed at known times or with known properties. This, however, adds extra work and leads to a lack of standardization in simulation methods. Additionally, most of the artifact simulation code currently available is primarily based in MATLAB, which is closed-source and therefore less accessible. 

Thus, there is a need for a single method for artifact simulation in a standardized and accessible way. The overall aim of this thesis is to take the first step towards this, in the form of an open-source, easy to use implementation that is compatible with an existing EEG simulation package.

== Background and other work

This thesis will mainly focus on simulating eye movement artifacts, power line noise, and electrode drift. If there is time, more artifacts can be added to the simulation.

=== Eye movement artifact
The eye movement artifact in EEG is caused by the electrical charge distribution in the eye. There is an overall electrical potential difference measurable between the cornea and retina, known as the "corneo-retinal potential" @mowrer_corneo-retinal_1935. Based on this, the eye is often modelled as a single electrical dipole with its positive end towards the cornea at the front @hari_meg-eeg_2017. Since the corneal and retinal tissues themselves have a potential difference each across their surfaces, another possibility is to represent these potentials using a set of electrical dipoles each, as done in #pc[@harmening_hartmutmodeling_2022]\; this can be called the "ensemble" model of the eye. Both of these models were implemented during a previous research project @mmar-researchproject with the goal of investigating the eye movement artifact and building a more biologically-realistic eye model as a first step towards eye movement simulation. In this Master thesis, the same models will be used as a base and further developed in order to implement ballistic eye movements (and potentially other eye artifacts).

=== Power line artifact
"Power line noise" is the name given to the high-frequency artifact caused by the interference from the electrical power supply given to devices in the recording environment @hari_meg-eeg_2017. In different countries, the AC power supply has a frequency of either 50 Hz or 60 Hz, and the artifact seen in the EEG recording has the corresponding frequency (along with its harmonics). One simple, commonly used method of removing this artifact is by applying filters: a low-pass filter with a cutoff below the power line frequency, or a notch filter at the frequency of the artifact. Usage of other methods like regression, independent component analysis etc. is also a known technique @uriguen_eeg_2015. #pc[@de_cheveigne_zapline_2020] reviewed existing methods of power line artifact removal and presented a new method with their suggested improvements. 

=== Electrode drift
The recorded EEG data can also experience slow drifts in baseline magnitude @hari_meg-eeg_2017. This may be caused among other things by sweating, bad electrical contact due to improper electrode application, or drying out of the EEG electrodes over the duration of the experiment. The usual method of removing this artifact is by applying a high-pass filter with a 0.1 Hz cutoff frequency to remove these slow drifts while still keeping brain-related signals intact.

=== Data creation/simulation
Synthetic data creation has been a part of several previous studies. In terms of physically simulating a subject, #pc[@Yu_Hairston_2021] created the "Open EEG Phantom", an open-source project to allow researchers to create their own dummy head for EEG recording, as done by #pc[@s23198214]. For software simulations, EEG simulation packages provide more general support to simulate EEG data from brain sources and to add different kinds of random noise to the data @krol_sereega_2018 @BARZEGARAN2019108377 @larson_mne-python_2024 @Schepers2025. 

When creating a dataset for a particular study, some researchers choose to create a semi-simulated dataset by obtaining artifact-free recordings (usually by cleaning a regular recording) and then contaminating this data by taking samples of recorded artifacts and projecting them to the scalp electrodes @KLADOS20161004 @couchman2024simulatedeyeblinkartifactremoval @duToit_Venter_van_den_Heever_2021 @anzolinArticle. #pc[@romero_comparative_2008] created a simulated EEG-EOG dataset from a real recorded dataset by calculating a weighted sum of the EEG potentials of certain randomly chosen subjects and the EOG potentials of different randomly chosen subjects. Other methods are also possible: #pc[@Mutanen] modelled muscle artifacts from an existing dataset and used their model to simulate further muscle artifacts, and similarly #pc[@KIM2025110465] simulated eye blinks and two muscle artifacts that they identified from empirical data. #pc[@barbara_monopolar_2023] defined and extended their own battery model of the eye to simulate eye movement artifacts. #pc[@leske_reducing_2019] simulated power line noise with fluctuating amplitude and varied on- and offsets for their combined MEG/EEG study.

\
= Planned Project
== Research Questions
+ Given a set of chosen EEG artifacts (eye movement, power line noise and electrode drift), what is known about their origin and characteristics?
+ How are these artifacts usually simulated?
+ How can we simulate them in a way that is standardized and compatible with existing open-source EEG simulation packages?

== Goals
The planned thesis work can be broken down into a set of main and optional goals, as detailed below.

=== Main Goals <mainGoals>
#v(0.3em)
#set enum(numbering: "A.")

// #show figure: set align(left) 
// #figure(
//   [+ The contents of my figure!],
//   gap: 0pt,
//   supplement: [Goal],
//   kind: "goal",
//   outlined: false,
//   numbering: "A"
// ) #label("mainGoal2")

// + #figure(
//   [The contents of my figure!],
//   gap: 0pt,
//   supplement: [Goal],
//   kind: "goal",
//   outlined: false,
//   numbering: "A"
// ) #label("mainGoal3")
// + #figure(
//   [short version],
//   gap: 0pt,
//   supplement: [Goal],
//   kind: "goal",
//   outlined: false,
//   numbering: "A"
// ) <mg4>
// #block(inset: 0pt)
#[
  #show figure: set align(left) 
  + #goal("Ballistic eye movement simulation - using the HArtMuT model.") <goal1>  
  + #goal("Power line noise and drift artifacts - first simulation.") <goal2>  
  + #goal("Code Interfaces - Compatibility of simulation code with UnfoldSim.jl; implementation should provide a format for specifying the higher-level properties of the simulation (e.g. onset, frequency of occurrence, correlation with other artifacts, etc).") <goal3>
]


=== Stretch Goals <stretchGoals>
#v(0.3em)
#set enum(numbering: "A.", start: 4)
#[
  #show figure: set align(left) 
  + #goal("Evaluation - Testing if analysis tools correctly identify the simulated artifacts similar to those in real data.") <goal4>
  + #goal("Implementation of more artifacts - E.g. eyelid movement, blinking, muscle artifacts, cable sway, sweating, heartbeat, etc.") <goal5>
]

== Approach
A literature review should be carried out to gain a better understanding of the origin and characteristics of the selected artifacts and of how these artifacts could be simulated. Some exploratory analysis of recorded EEG datasets may also be required, especially for the power line and drift artifacts.

Building on the previously mentioned initial work on eye movement simulation using the HArtMuT model @mmar-researchproject, the simulation of saccadic eye movements will be implemented at first (*@goal1*). For *@goal2*, as a basic simulation of power line and drift artifacts, a simple method can be followed based on the characteristics identified in the literature review, approximating the real artifact to a reasonable extent.

The code of the final implementation should be well-structured, easy to use and suited for integration with an existing EEG simulation package (*@goal3*). Since the implementation of this thesis project is undertaken in JuliaLang, the package UnfoldSim.jl has been selected for this purpose. To this end, the code in UnfoldSim.jl should be analyzed to understand the architecture and design principles followed there, and the artifact simulation code can be written following the same principles.

If time permits, further tasks can be taken up based on the list of stretch goals. A rough evaluation of the simulation could be carried out, for example by simulating some EEG data similar to a real dataset, then running it through an analysis pipeline to check if the analysis results of the real and simulated data are similar to each other. An existing artifact implementation can be extended or optimized, or a new artifact can be chosen and a first simulation implemented for this artifact.

\

= Plan
\
The overall time period for the thesis is six months, placing the end of the thesis around late November. Allowing a month for the initial literature review, the eye movement simulation (*@goal1*) can be started once the required information for the eye movement artifact is obtained. For artifacts requiring data analysis, this should be started as soon as possible. Thereafter, the implementation of the power line and drift artifacts (*@goal2*) can be started. As the simulation code takes shape, it should be continuously refined and reorganized in order to be integrated with UnfoldSim.jl (*@goal3*). 
The writing of the thesis report can begin at the latest once the initial implementation is complete, and proceed in parallel with the integration. Finally, the time from September to November is kept as a buffer in case something unforeseen comes up during the previous months, and can also be used for review or for working on stretch goals.



#timeliney.timeline(
  show-grid: true,
  {
    import timeliney: *
      
    headerline(group([*Jun*],[*Jul*],[*Aug*],[*Sept*],[*Oct*],[*Nov*]))
    
    task("Literature review", (0, 1), style: (stroke: 2pt + gray))
    task("Eye movement simulation (Goal A)", (0.5, 2), style: (stroke: 2pt + gray))
    task("Power line and drift: Dataset analysis (Goal B)", (1, 2), style: (stroke: 2pt + gray))
    task("Power line and drift: Implementation (Goal B)", (2, 3), style: (stroke: 2pt + gray))
    task("Integration with UnfoldSim.jl (Goal C)", (2,4), style: (stroke: 2pt + gray))
    task("Writing of the thesis", (3, 6), style: (stroke: 2pt + gray))
    task("Buffer / Review / Stretch goals (Goal D-E)", (4,6), style: (stroke: 2pt + gray))

    milestone(
      at: 4,
      style: (stroke: (dash: "dashed")),
      align(center, [
        *Main goal completion*\
        Sept 2025
      ])
    )
  }
)




#line(length: 100%, stroke: gray)

#bibliography("refs.bib", style: "american-psychological-association")