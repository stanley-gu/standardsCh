% Standards, Platforms, and Applications
% Stanley Gu [^stanleyInfo]
  Herbert Sauro[^herbertInfo]

[^stanleyInfo]: stanleyg@uw.edu
  University of Washington
  Department of Bioengineering
  Seattle, WA USA
[^herbertInfo]: hsauro@uw.edu
  University of Washington
  Department of Bioengineering
  Seattle, WA USA

\newcommand{\bgamma}{\mbox{\boldmath $\Gamma$}}
\newcommand{\bL}{\mbox{\boldmath $L$}}
\newcommand{\bT}{\mbox{\boldmath $T$}}
\newcommand{\bI}{\mbox{\boldmath $I$}}
\newcommand{\bM}{\mbox{\boldmath $M$}}
\newcommand{\bm}{\mbox{\boldmath $m$}}
\newcommand{\bN}{\mbox{\boldmath $N$}}
\newcommand{\bE}{\mbox{\boldmath $E$}}
\newcommand{\bA}{\mbox{\boldmath $A$}}
\newcommand{\bB}{\mbox{\boldmath $B$}}
\newcommand{\bK}{\mbox{\boldmath $K$}}
\newcommand{\bP}{\mbox{\boldmath $P$}}
\newcommand{\bx}{\mbox{\boldmath $x$}}
\newcommand{\bU}{\mbox{\boldmath $U$}}
\newcommand{\bV}{\mbox{\boldmath $V$}}
\newcommand{\bZero}{\mbox{\boldmath $0$}}
\newcommand{\bLo}{\mbox{\boldmath $L_0$}}
\newcommand{\bNo}{\mbox{\boldmath $N_0$}}
\newcommand{\bNr}{\mbox{\boldmath $N_R$}}
\newcommand{\bSi}{\mbox{\boldmath $S_i$}}
\newcommand{\bSd}{\mbox{\boldmath $S_d$}}
\newcommand{\bdSi}{\mbox{\boldmath $dS_i$}}
\newcommand{\bdSd}{\mbox{\boldmath $dS_d$}}
\newcommand{\bS}{\mbox{\boldmath $S$}}
\newcommand{\bdS}{\mbox{\boldmath $dS$}}
\newcommand{\bdt}{\mbox{\boldmath $dt$}}
\newcommand{\bdSdt}{\mbox{$\displaystyle \frac{\bdS}{\bdt}$}}
\newcommand{\bdSddt}{\mbox{$\displaystyle \frac{\bdS_d}{\bdt}$}}
\newcommand{\bdSidt}{\mbox{$\displaystyle \frac{\bdS_i}{\bdt}$}}
\newcommand{\bv}{\mbox{\boldmath $v$}}
\newcommand{\bp}{\mbox{\boldmath $p$}}

# Summary

With the sequencing of the human genome, it has become apparent that Systems
Biology, the understanding of cellular networks through dynamical analysis is
becoming an important part of research for mainstream biologists. One of the
indicative trends to emerge in recent years is the development of model
interchange standards that permit biologists to easily exchange dynamical models
between different software tools. In this chapter two chief model exchange
standards, SBML and CellML are described. In addition, the development of
extensible software frameworks, including SBW and BioUML are discussed and the
role they might play in stimulating the development of new tools and approaches.
Finally, the range of possible computational applications is described,
highlighting the rich set of tools that is emerging as systems biology becomes a
mainstream science.

# Introduction

Although Computational Systems Biology may seem to be a recent field of
endeavor, its origins can be traced as far back as the 1920s and 30s
[@Wright1929]. During this period it was already believed by some that genes
were responsible in some way for specifying enzymes. It was also around this
time that glycolysis, the first metabolic pathway, was being elucidated and the
beginnings of the idea that enzymes formed linked sequences called pathways. It
is even more remarkable therefore that given the infancy of these concepts,
Sewell Wright should attempt to give a physiological explanation for the
occurrence of genetic dominance and recessivity [@Wright1934]. Wright argued
that the explanation for the origin of dominance lay with the properties of
catalytic networks, and laid out an initial mathematical theory which described
the properties of enzyme networks[^wrightWork]. In the 1940s, as the first
digital computers were being built, pioneering individuals such as Garfinkel,
Higgins and Chance began investigating the possibility of modelling the subtle
behavior of biochemical pathways. Even before the advent of the digital
computer, the same group had been using using analog computers to model simple
biochemical pathways for almost 15 years [@Ga61; @Hi59; @Chance1943].

[^wrightWork]: This early work later became significant during the development
of metabolic control analysis [@KB81]

Since the work of the pioneers in the 1950s, there have been many small groups
that have continued this line of inquiry and that together laid the foundation
for many of the techniques and theory that we use today and take for granted, in
contemporary systems biology. It should be noted that there is a large body of
literature, particularly in the Journal of Theoretical Biology, dating back
fifty years that many newcomers to the field will find useful to consider.

## What is Systems Biology?

There are many conflicting opinions today on what exactly systems biology is.
Historically the answer seems clear. The chief aim of systems biology is to
understand how individual proteins, metabolites and genes contribute
quantitatively to the phenotypic response. Lee Hood, president of the Institute
of Systems Biology in Seattle, US, defines it similarly as "the identification
of the elements in a system and the analysis of their interrelationships so as
to explain the emergent properties of the system". Even so, some believe systems
biology to be concerned with the collection of high-throughput data while others
consider the elucidation of protein-protein networks and gene networks to be its
hallmark. Certainly, both are vital prerequisites for understanding systems but
neither alone can offer great *insight* into how networks operate dynamically.

Systems Biology is the natural progression of classical molecular biology from a
descriptive to a quantitative science and is concerned with the dynamic response
of biological networks.

## Statement Of Problem

Building models is not an entirely new approach to biology. If one examines any
text book on molecular biology or biochemistry, virtually every page has a
diagram of a model. These models, which are often termed cartoon based models,
represent the culmination of years of painstaking research; they serve as
repositories of accepted doctrine and the starting point for the generation of
new hypotheses. There are, however, limits to what can be done with these
models, their predictive value tends to be poor, and the ability to reason using
qualitative models is limited. In other sciences these limitations are avoided
through the use of quantitative models, models which are described not just
pictorially but also mathematically. Quantitative models by their nature have
much better predictive value compared to qualitative models, but their real
usefulness stems from the capacity to carry out precise reasoning with them.

## Quantitative Approaches

There is a wide range of mathematical representations that one can use to build
quantitative models, the choice of approach depending on the type of biological
question, the accessibility of experimental data and the tractability of the
mathematics. A short list of modelling representations is given in Figure
\ref{Figure:jdesigner}. Probably the most successful and widely used kind of
model are those based on differential equations (both ordinary and partial).
These models assume a continuum of concentrations and rates. In reality of
course, cellular systems are discrete at the molecular level, however, since the
numbers of molecules is very large, the continuum approximation turns out to be
very good.  When the number of molecules drops to below a certain threshold the
continuum model can break down and in these cases one must revert to stochastic
simulation. The disadvantage of a stochastic simulation is that all the
analytical methods available for continuous models no longer apply. One should
therefore only use stochastic simulation if it is absolutely necessary and not
in cases where an ODE based model adequately describes the data. This problem
highlights the need to develop a new set of mathematical approaches in order to
understand the dynamics of stochastic systems. There are other approaches, which
include boolean, bayesian, formal logic and connectivity studies but these have
yet to show any overwhelming advantage over continuum based models.

In this chapter I will be exclusively concerned with models based on
differential equations and to a lesser extent stochastic equations.

* * * * *

Boolean:
:   One of the simplest possible modelling techniques is to represent a
    network using Boolean logic [@DeJong2002]. This approach has
    been used to model gene networks.

Ordinary differential equations (ODEs):
:   This is the commonest and arguably most useful representation.
    Although based on a continuum model, ODE models have proved to be
    excellent descriptions of many biological systems. Another advantage
    to using ODEs is the wide range of analytical and numerical methods
    that are available. The analytical methods in particular provide a
    means to gain a deeper insight into the workings of the model.

Deterministic hybrid:
:   A deterministic hybrid model is one which combines a continuous
    model (e.g ODE model) with discrete events. These models are
    notoriously difficult to solve efficiently and require carefully
    crafted numerical solvers. The events can occur either in the state
    variables or parameters and can be time dependent or independent. A
    simple example involves the division of a cell into two daughter
    cells. This event can be treated as a discrete event which occurs
    when the volume of the cell reaches some preset value at which point
    the volume halves.

Differential-algebraic equations (DAEs):
:   Sometimes a model requires constraints on the variables during the
    solution of the ODEs. Such a situation is often termed a DAE system.
    The simplest constraints are mass conservation constraints, however
    these are linear and can be handled efficiently and easily using
    simple assignment equations (see equation (@eqGeneral)). DAE solvers
    need only be used when the constraints are nonlinear.

Partial differential equations (PDEs):
:   Whereas simple ODEs model well stirred reactors, PDEs can be used
    model heterogenous spatial models.

Stochastic:
:   At the molecular level concentrations are discrete, but as long as
    the concentrations levels are sufficiently high, the continuous
    model is perfectly adequate. When concentrations fall below
    approximately one hundred molecules in the volume considered (e.g.
    the cell or compartment) one has to consider using stochastic
    modelling. The great disadvantage in this approach is that one
    looses almost all the analytical methods that are available for
    continuous models, as a result stochastic models are much more
    difficult to interpret.

* * * * *


### Quantitative Models Based on Differential Equations

It is probably fair to say that most of the successful models to be found in the
literature are based on ordinary differential equations.  Many researchers will
express these models using the following equation:

(@eqSystem) \begin{center} 
    $\frac{\bdS}{\bdt} = \bN \bv (\bS (\bp), \bp)$
    \end{center}

where $\bS$ is the vector of molecular species concentrations, $\bN$, the
stoichiometry matrix; $\bv$ the rate vector and $\bp$ a vector of parameters
which can influence the evolution of the system. Real cellular networks have an
additional property that is particularly characteristic of biological networks,
this is the presence of so-called moiety conserved cycles. Depending on the
time-scale of a study, there will be molecular subgroups conserved during the
evolution of a network, these are termed *conserved moieties* [@Re81]. The total
amount of a particular moiety in a network is time invariant and is determined
solely by the initial conditions imposed on the system[^conservation].

In metabolism, conserved cycles act as common conveyers of energy (ATP) or
reducing power (NAD); in signaling pathways they occur as protein
phosphorylation states while in genetic networks, they occur as bound and
unbound protein states to DNA. These conserved cycles will often have a profound
effect on the network behavior and it is important that they be properly
considered in computational models.

From the full set of molecular species in a model, it is customary to divide the
set into two groups, the dependent ($\bSd$) and independent set ($\bSi$). This
division is dependent entirely on the number and kind of conserved cycles in the
network. If there arent any conserved cycles in a model then the dependent set
is empty and the size of the independent set equals the number of molecular
species in the model. For details on how to compute $\bSd$ and $\bSi$ the reader
should consult [@Sauro:ICycles2004] or refer to Box 1 in this chapter. In many
cases it is vital that this separation into dependent and independent species be
made. For simple time course simulations the separation is not so important, but
for most other analyses it is critical and for stiff integration methods highly
desirable. The reason is that many numerical methods, including the stiff
integrators, employ a measure called the Jacobian matrix as part of the
numerical calculation. If the separation is not carried out, the Jacobian
becomes singular and thereby rendering most analyses (e.g. steady state
location, bifurcation analysis, certain optimization methods and sensitivity
methods etc.) numerically unstable if not impossible. Even when carrying out
simple time course simulations, the separation is also useful because it enables
the number of differential equations to be reduced in number and thereby improve
computational efficiency.

Equation (@eqSystem) is therefore better expressed as:

(@eqGeneral) \begin{center}
    $\begin{aligned} 
    \bSd &=& \bLo \bSi + \bT \nonumber \\
    \bdSidt &=& \bNr \bv (\bSi (p), \bSd, \bp) 
    \end{aligned}$
    \end{center}

In these equations, $\bSi$ is the vector of independent species, $\bSd$, the
vector of dependent species, $\bLo$ the link matrix, $\bT$ the total mass
vector, $\bNr$ the reduced stoichiometry matrix, $\bv$ the rate vector and $\bp$
the vector of parameters. Equation (@eqGeneral) constitutes the most general
expression of an ODE based temporal model [@hofmeyr-nutshell; @Schuster:Book].
The symbolism used in equation (@eqGeneral) is the standard notation used by
many in the Systems Biology community.

Although mathematically, reaction based models are given by equations
(@eqSystem) and (@eqGeneral), many researchers are more familiar with expressing
models in the form of a reaction scheme. For example, the following describes
part of glycolysis:

      Glucose-6-P -> Fructose-6-Phosphate Fructose-6-Phosphate + ATP ->
      Fructose-1-6-Bisphosphate + ADP Fructose-1-6-Bisphosphate -> DHAP + GAP

For brevity, the rates laws that accompany each reaction have been left out.
Such notation is well understood by biologists. It is not straight forward
however to convert this representation to the representation give by equation
(@eqGeneral). However, many software tools will permit users to enter models as
a list of reactions and then automatically generate the mathematical model
[@SauroF91; @sauro:2000; @Sauro:Omics].

\setlength\fboxsep{18pt}
\begin{boxedminipage}[hbp]{14cm}
{\bfseries Box 1. Reaction Network} Consider the simple reaction
network shown on the left below:

\begin{minipage}[t]{6cm}
\begin{picture}(60,95)(-60,-50)\thicklines
%
\put(18,20){$v_2$}
\qbezier(0,0)(20,20),(40,0) \put(42,-1){\vector(4,-3){2}}
%
\put(16,-46){$v_3$}
\qbezier(0,-20)(20,-40),(40,-20) \put(0,-19){\vector(-3,4){2}}
%
\put(-9,-12){$ES$}
\put(40,-13){$E$}
\put(65,23){$S_1$}
\put(65,-48){$S_2$}
\put(69,16){\vector(0,-1){48}}
\put(72,-8){$v_1$}
%
% Lower arm
\qbezier(62,-45)(20,-40),(0,-20)
% Upper arm
\qbezier(18,10)(26,8),(60,25) \put(61,25){\vector(2,1){2}}
%
\end{picture}
\end{minipage}
\begin{minipage}[t]{6cm}
\begin{picture}(60,85)(-40,-35)\thicklines
  % Vertical arrows
  \put(-9, 24){$ES$}
  \put(-9, 8){$S_1$}
  \put(-9, -11){$S_2$}
  \put(-9, -26){$E$}

  \put(26,40){$v_1$}
  \put(46,40){$v_2$}
  \put(68,40){$v_3$}

$\begin{array}{cc}
        \left[
         \begin{array}{rrr}
            0 & -1 &  1  \\
           -1 &  1 &  0  \\
            1 &  0 & -1  \\
            0 &  1 & -1
         \end{array}
        \right]
   \end{array}$
\end{picture}
\end{minipage}

\vspace{12pt} The {\bfseries stoichiometry matrix} for this
network is shown to the right. This network possesses two
conserved cycles given by the constraints: $S_1 + S_2 + ES = T_1$
and $E + ES = T_2$. The set of independent species includes:
$\{ES, S_1\}$ and the set of dependent species $\{E, S_2 \}$.

\bigskip
The $\bLo$ matrix can be shown to be:

\hspace{2cm} $$ \bLo = \left[ \begin{array}{rr}
  -1 & -1 \\
  -1 & 0 \\
\end{array}  \right]$$ \hfill
%
\linebreak
The complete set of equations for this model is therefore:

$$
\left[ \begin{array}{l}
  S_2 \\
  E \\
\end{array} \right] =
\left[ \begin{array}{rr}
  -1 & -1 \\
  -1 & 0 \\
\end{array}  \right]
\left[
\begin{array}{l}
    ES \\
    S_1 \\
\end{array}
\right] +
\left[
\begin{array}{l}
  T_1 \\
  T_2 \\
\end{array}
\right]$$
$$\left[
\begin{array}{l}
  dES/dt \\
  dS_1/dt \\
\end{array}
\right] =
\left[
\begin{array}{rrr}
  0 & -1 & 1 \\
  -1 & 1 & 0 \\
\end{array}
\right]
\left[
\begin{array}{l}
  v_1 \\
  v_2 \\
  v_3 \\
\end{array}
\right]$$ Note that even though there appears to be four variables
in this system, there are in fact only two independent variables, $\{ES, S_1\}$,
and hence only two differential equations and two linear constraints.

\end{boxedminipage}

[^conservation]: There are rare cases when a conservation relationship arises
out of a non-moiety cycle. This does not affect the mathematics but only the
physical interpretation of the relationship. For example, A $\rightarrow$ B + C;
B + C $\rightarrow$ D has the conservation, $B - C =\mbox{constant}$.

#### IUPS Physiome Project

#### Virtual Physiological Human

#### Virtual Physiological Rat

### Quantitative Models Based on Data-Driven Network Inference

#### DREAM

#### Sage Bionetworks

# Standards

A standard is defined as a uniform set of specifications for some or all aspects of an activity or product that encourages cooperation and interoperation. Ideally, it should be clearly and unambiguously defined and as easy as possible to interpret and implement. In the modern world, standards have been applied to everything from light bulbs, PDFs (portable document formats), railroad track gauges and video formats to mobile phones, pharmaceutical purity and even bits of bathroom plumbing. In the realm of systems biology, desire to facilitate interoperability and reuse computational models and data was the the impetus for developing standard electronic annotations and representations. 

Standards development for [@brazma2001minimum]

One group of researchers that has been particularly forward-thinking in standards development is the DNA microarray community. In the early years of array technology, researchers struggled to harmonize the output of different platforms, identify the ancillary information needed to interpret results and even define the necessary data to enable reproduction of results. As a response, the Microarray Gene Expression Data Society (MGED) drew up the Minimum Information About a Microarray Experiment (MIAME) specification (Nat. Genet. 29, 365–371, 2001), which in many respects has become the prototype for subsequent data-reporting guidelines in biology.

MIAME is now being joined by a plethora of 'minimum information' reporting standards initiatives that cover just about every large-scale technology under the biological sun. There is the Proteomics Standards Initiative's MIAPE (Minimal Information About a Proteomics Experiment), MGED's MIS-FISHIE (Minimal Information Specification for In Situ Hybridization and Immunohistochemistry Experiments), not to mention similar specifications for RNA interference (RNAi) experiments (MIARE), metabolomics studies (SMRS; ArMET), flow cytometry approaches (MI-FACE) and even cellular (MIACA) and enzyme activity assays (STRENDA).

[@naturebiotechnology2006]

One of the most daunting aspects of using genomic technologies—including microarray, proteomic, metabolomic, and other approaches—is the sheer quantity of data that they produce. With thousands of biologically relevant molecules surveyed across (increasingly) large numbers of samples, interpretation of the data requires the use of computational approaches. And while many researchers thought that storing the data could simply build on our experiences with genome sequencing, it quickly became apparent that if one was to make sense of the results from any analysis, there was a need to store much more complex ancillary data than would be necessary for genome sequence. In 1999, as microarrays were establishing themselves as a truly viable technology, the Microarray Gene Expression Data Society (MGED; http://www.mged.org) arranged to define the critical information necessary to effectively analyze a microarray experiment and to describe a means of encoding that information. Through a series of discussions between interested parties, public presentations, and working group meetings, what emerged were the Minimal Information About a Microarray Experiment (MIAME) (Brazma et al, 2001; Ball et al, 2002, 2004) and MAGE-ML (Spellman et al, 2002), an XML-based markup language used for describing a microarray experiment.

The early success of MIAME and its widespread adoption by scientific journals also exposed some of its weaknesses, including the need to develop domain-specific extensions of MIAME to capture information about the experimental design and sample characteristics necessary for interpreting data coming, for example, from toxicology experiments (MIAME-Tox; Sansone et al, 2005) and extensions to other domains such as in situ hybridizations (MISFISHIE, the Minimum Information Specification For In Situ Hybridization and Immunohistochemistry Experiments; http://scgap.systemsbiology.net/sta
ndards/misfishie). In fact, the MGED subgroup on Reporting Structure for Biological Investigations Working Groups (RSBI WGs; http://www.mged.org/Workgroups/rsbi/
rsbi.html) is looking at ways to extend MIAME to a wide range of other areas.

The principles underlying MIAME, particularly the need to clearly describe an experiment and report the variables necessary for data analysis, have resonated beyond the microarray community. For example, the metabolomics/metabonomics community/communities (I am not going to decide which is right, and by not doing so invite the scorn of all rather than one group or the other) are moving toward standardization and reporting of metabolic analyses (Lindon et al, 2005) and practitioners of proteomics have at least two XML-based standards for reporting proteomics from which to choose, HUP-ML (Hermjakob et al, 2004) and AGML (Stanislaus et al, 2004), as well as guidance through the Minimum Information About a Proteomics Experiment (MIAPE) (Orchard et al, 2004).

A recent paper by Novère et al extends the reporting standards notion beyond the experimental world, to the description of quantitative models of biochemical systems and attempts to reconcile some of the various standards that have evolved. The Minimum Information Requested In the Annotation of biochemical Models (MIRIAM) standard proposed by this group is an attempt to bring together CellML (Lloyd et al, 2004) and SBML (Finney and Hucka, 2003; Hucka et al, 2003) and to gain acceptance from databases that archive models to provide access to these in a standard machine-readable format. This is an ambitious, but important, goal as systems biology hopes to produce quantitative models of cells and cellular processes. However, unless these models, which can become quite complex, are easily testable and comparable, they will ultimately be of little value. This is an important first step in helping to establish modeling and the value it will bring to developing a predictive biology, but the ultimate impact will depend on how widely the standard is adopted and how many software tools are developed to facilitate its use.

[@quackenbush2006standardizing]

To fully understand the context, methods, data and conclusions that pertain to an experiment, one must have access to a range of background information. However, the current diversity of experimental designs and analytical techniques complicates the discovery and evaluation of experimental data; furthermore, the increasing rate of production of those data compounds the problem. Community opinion increasingly favors that a regularized set of the available metadata ('data about the data') pertaining to an experiment1, 2 be associated with the results, making explicit both the biological and methodological contexts. Many journals and funding agencies now require that authors reporting microarray-based transcriptomics experiments comply with the Minimum Information about a Microarray Experiment (MIAME) checklist3 as a prerequisite for publication4, 5, 6, 7. Similarly, minimum information guidelines for reporting proteomics experiments and describing systems biology models are gaining broader support in their respective database communities8, 9; and progress is being made toward the standardization of the reporting of clinical trials in the medical literature10. Such minimum information checklists promote transparency in experimental reporting, enhance accessibility to data and support effective quality assessment, increasing the general value of a body of work (and the competitiveness of the originators).

## Minimum Information

To fully understand the context, methods, data and conclusions that pertain to an experiment, one must have access to a range of background information. However, the current diversity of experimental designs and analytical techniques complicates the discovery and evaluation of experimental data; furthermore, the increasing rate of production of those data compounds the problem. Community opinion increasingly favors that a regularized set of the available metadata ('data about the data') pertaining to an experiment1, 2 be associated with the results, making explicit both the biological and methodological contexts. Many journals and funding agencies now require that authors reporting microarray-based transcriptomics experiments comply with the Minimum Information about a Microarray Experiment (MIAME) checklist3 as a prerequisite for publication4, 5, 6, 7. Similarly, minimum information guidelines for reporting proteomics experiments and describing systems biology models are gaining broader support in their respective database communities8, 9; and progress is being made toward the standardization of the reporting of clinical trials in the medical literature10. Such minimum information checklists promote transparency in experimental reporting, enhance accessibility to data and support effective quality assessment, increasing the general value of a body of work (and the competitiveness of the originators).

Collaborative minimum information checklist development projects for diverse biologically and technologically delineated subject areas are ongoing. A special issue of the journal OMICS11 included invited pieces from eight communities supporting minimum information checklist development projects. However, until recently there were no mechanisms for such projects to coordinate their development. Consequently, the full range of checklists can be difficult to establish without intensive searching, and tracking their evolution is nontrivial. Furthermore, overlaps in scope and arbitrary decisions on wording and substructuring inhibit their use in combination. These issues present difficulties for checklist users, especially those who routinely combine information from several disciplines. Here we explore some of the issues arising from the development of checklists in relative isolation, discuss the potential benefits of greater coordination and describe the mechanisms we have put in place to facilitate such coordination. In summary, we present the MIBBI project (http://www.mibbi.org/), which maintains a web-based, freely accessible resource for checklist projects, providing straightforward access to extant checklists (and to complementary data formats, controlled vocabularies, tools and databases), thereby enhancing both transparency and accessibility, as discussed above. MIBBI is managed by representatives of its various participant communities and is fully open to comment from any interested party. Our goal is to facilitate the development of an integrated checklist resource site for the wider bioscience community.

MIBBI [@taylor2008promoting]

[@le2006model]

### Minimum Information Required in the Annotation of Models (MIRIAM)

[@novere2005minimum]

The MIRIAM Guidelines are an effort to standardise upon the essential, minimal set of information that is sufficient to annotate a model in such a way as to enable its reuse. This includes a means to identify the model itself, the components of which it is composed, and formalises a means by which unambiguous annotation of components should be encoded. This is essential to allow collaborative working by different groups which may not be spatially co-located, and facilitates model sharing and reuse by the general modelling community. The goal of the project, initiated by the BioModels.net effort, was to produce a set of guidelines suitable for model annotation. These guidelines can be implemented in any structured format used to encode computational models, for example SBML, CellML, or NeuroML . MIRIAM is a member of the MIBBI family of community-developed 'minimum information' reporting guidelines for the biosciences.

During the genomic era we have witnessed a vast increase in availability of large amounts of quantitative data. This is motivating a shift in the focus of molecular and cellular research from qualitative descriptions of biochemical interactions towards the quantification of such interactions and their dynamics. One of the tenets of systems biology is the use of quantitative models (see Box 1 for definitions) as a mechanism for capturing precise hypotheses and making predictions1, 2. Many specialized models exist that attempt to explain aspects of the cellular machinery. However, as has happened with other types of biological information, such as sequences, macromolecular structures or microarray data, quantitative models will be useful only if their access and reuse is made easy for all scientists. Moreover, the next step towards a more synergistic view of living systems is assembling models into larger entities, by module reuse and assembly or modeling across different spatial, temporal or physiological scales. Both model retrieval and model composition require formal descriptions of model structure and semantics. Our separate groups have been active in the development of standards for encoding biological models in machine-readable formats (e.g., CellML3 and SBML4, 5) and of public repositories of computational models (such as BioModels Database6, Sigpath7, EcoCyc8, the CellML repository (http://www.cellml.org/examples/repository/), JWS Online9, RegulonDB10, DOQCS11). We firmly believe in the value of expressing computational models using standardized, structured formats as a means of enabling direct interpretation and manipulation of those models by software tools.

Databases of quantitative models are valuable resources only if researchers can trust the quality of their content. Similarly, repositories are not useful unless users can search for specific models and then relate model constituents to other data sets such as bioinformatics databases and controlled vocabularies. To meet these needs, we believe four complementary aspects of the quality of an encoded model must be addressed: (i) the quality of the documentation (e.g., journal article) associated with the encoded model, (ii) the degree of correspondence between the encoded model and the documentation, (iii) the accuracy and extent of the annotations of the encoded model and (iv) whether the model is encoded in a machine-readable format, that is, a format that can be immediately and unambiguously parsed by software to perform simulations and analysis.

Most of the encoded models available in scientific publications or on the Internet are not in a standard format. Of those that are encoded in a standard format, it turns out that most actually fail compliance tests developed for these standards. Failures occur for a variety of reasons, ranging from minor syntactic errors to significant conceptual problems, including the incorrect specification of units. Even deeper semantic inaccuracies can lie in the structure of the model itself. Finally, there is no standard naming scheme for the model constituents, so the precise identification of constituents depends on the associated documentation/annotation. Most models available today are not annotated, and as a result, users are faced with such things as a reaction 'X' between the constituents 'A' and 'B,' producing 'C' and modulated by 'M.' As a consequence, models frequently have to be re-encoded in order to be reused, a process that in practice is often performed by a different person from the original author.

These quality issues must be addressed when curating model collections for public use, just as it is done for other type of biological data. One crucial step is the development of interchange standards12, such as those developed for microarray data13, protein interactions14 or metabolic analyses15. By 'curation,' we mean the processes of collecting models, verifying them to some degree and annotating them with metadata. We propose to standardize an approach to the curation of model collections and the encoding of models using a framework of rules we call MIRIAM, the Minimum Information Requested In the Annotation of Models. MIRIAM aims to define processes and schemes that will instill confidence in model collections, enable the assembly of meta-collections of models at the same high level of quality and allow the curation process to be shared among teams at different sites and institutions. The standard we propose is designed to cover encoding processes that may be conducted either up front by the model author or post hoc by a curator. However, we do not believe that the post hoc approach is particularly efficient, and prefer modelers to make their models available in standard formats. Box 2 describes some uses of MIRIAM.

Scope of MIRIAM
MIRIAM applies only to models linked to a unique reference description. MIRIAM does not address directly issues of quality of documentation (although sufficiently poor documentation can make a model impossible to curate). The assessment of the quality of documentation is well established in the scientific community. We expect that, by assessing the documentation describing quantitative models, peer reviewers (not the model curators) will assess the models' ability to represent and predict the quantitative behavior of biological systems and/or make an important theoretical contribution. Instead, MIRIAM focuses on the correspondence of an encoded model to its associated description and how the encoded model is annotated. In other words, even if it is MIRIAM compliant, a model may not necessarily make sense in biological terms. Conversely, many models that cannot be declared MIRIAM compliant may still be of high scientific interest.


We expect MIRIAM to apply mainly to quantitative models that can be simulated over a range of parameter values and provide numerical results. This encompasses not only models that can be integrated or iterated forwards in time, such as ordinary and partial differential equation models and differential algebraic equation models, but also other quantitative approaches such as steady-state models (e.g., Metabolic Control Analysis16, Flux Balance Analysis17). Discrete approaches, such as logical modeling18, 19, 20 or stochastic and hybrid Petri Net21, can also be considered when they can lead to specific numerical results. Although we are aware that this means we can cover only part of the modeling field, we make this our initial focus because only these models can lead to quantitative numerical results providing refutable predictions. The comparison of these predictions with the reference description of the model is a crucial test of MIRIAM compliance.

### Minimum Information About a Simulation Experiment (MIASE)

Reproducibility of experiments is a basic requirement for science. Minimum Information (MI) guidelines have proved a helpful means of enabling reuse of existing work in modern biology. The Minimum Information Required in the Annotation of Models (MIRIAM) guidelines promote the exchange and reuse of biochemical computational models. However, information about a model alone is not sufficient to enable its efficient reuse in a computational setting. Advanced numerical algorithms and complex modeling workflows used in modern computational biology make reproduction of simulations difficult. It is therefore essential to define the core information necessary to perform simulations of those models. The Minimum Information About a Simulation Experiment (MIASE, Glossary in Box 1) describes the minimal set of information that must be provided to make the description of a simulation experiment available to others. It includes the list of models to use and their modifications, all the simulation procedures to apply and in which order, the processing of the raw numerical results, and the description of the final output. MIASE allows for the reproduction of any simulation experiment. The provision of this information, along with a set of required models, guarantees that the simulation experiment represents the intention of the original authors. Following MIASE guidelines will thus improve the quality of scientific reporting, and will also allow collaborative, more distributed efforts in computational modeling and simulation of biological processes.

The rise of systems biology as a new paradigm of biological research has put computational modeling under the spotlight. In cell biology [1], physiology [2], and more recently in synthetic biology [3], mathematical modeling and simulation have become parts of a researcher's toolkit. Following Cellier [4], we consider a model (M) for a system (S) and an experiment (E) is anything to which E can be applied in order to answer questions about S and a simulation is an experiment performed on a model. Zeigler [5] emphasized the importance of separating the descriptions of the experimental frame (e.g., the initial conditions), the model, and the simulation.

Although generic, this framework for modeling and simulation applies well to the field of computational modeling and simulation of biological processes, where models are created and simulated as testable hypotheses in order to determine whether or not they are compatible with experimental data or expected future observations; their analysis supports the design of additional experiments and helps in the synthesis of engineered biological systems. The acceptance of the computationally aided systems biology approach has led to the creation of models at an ever increasing rate, as shown by the rapid growth of model databases. Because of the size of the systems considered, and their multi-scale aspects (both temporal and spatial), modeling activity in integrative systems biology requires researchers to leverage new approaches from prior work. Initiatives to establish standards for describing models and simulations have already been advocated in 1969, e.g., to establish a standard form of what a model should be like, how it should be described and documented []. This is intended in part to facilitate communication of information about models, which may be difficult owing to their complexity [6].

Such an endeavor requires the model descriptions (specifying the mathematical expressions and parameters for a given model) to be stored and exchanged in a way that allows for their efficient reuse [7], [8]. Once the model descriptions are retrieved, the user typically wants to test existing simulation protocols on them to obtain a desired output. Currently, most users do so by reading the simulation description in the corresponding publication. This is, however, not only time-consuming, but also error prone. In some cases the published description of a simulation experiment is incomplete, or even wrong, and it requires educated guesswork to reconstruct the original experiment. Examples for such guesses include the initial conditions of simulation, the determination of a starting point for bifurcation diagrams, or the normalization of raw simulation output. Incomplete or erroneous descriptions impede reuse and replication of existing work, and hamper the use of models for educational purposes. Conversely, making this information available to others leads to a greater reuse of existing models.

Standardization plays a central role in facilitating the exchange and interpretation of the outcomes of scientific research, and in particular of computational modeling [9]. Defining which information must be provided when describing an experimental procedure is the task of reporting guidelines, federated in the global project Minimum Information for Biological and Biomedical Investigations (MIBBI) [10]. Those reporting guidelines generally result from consultations with a large community and are carefully thought out. To facilitate reuse of models, MIRIAM [11] was defined in 2005. MIRIAM is a set of rules describing the information that must be provided with a mathematical model in order to allow its effective reuse. Most of the MIRIAM rules deal with the origin and structure of the model, and the precise identification of its components. But the MIRIAM guidelines also state that:

Scope of MIASE

MIASE sets out to define minimum requirements for simulation descriptions. It covers the simulation procedures, and allows for the experiments to be reproduced. The particular focus of MIASE is on life science applications.

MIASE Covers Simulation Procedures

One of the difficulties in applying common guidelines to multiple simulation methods is that the definitions of model and simulation vary, and there is an ill-defined line between the two concepts. This conceptual entanglement is sometimes at the core of mathematical and computational approaches, as with executable biology [12], where the model is the simulation algorithm itself. When the description of biological processes builds on numerical integration, there is often a clear conceptual distinction between a model definition and its numerical simulation over space and time. Both concepts are nevertheless sometimes merged at the level of the description formats. Experienced modelers use this feature to run advanced simulations that may even involve the combination of several models. However, for the purpose of the present discussion, the term simulation stands for any calculation performed on a model and describing evolutions of the biological system represented, for instance, over spatial and/or temporal dimensions. This includes, but is not limited to, time series simulations (describing the evolution of model variables over time), parameter scans (iterating a given simulation for a range of parameter combinations), sensitivity analyses (variation of parameters or other model properties according to some algorithm, with additional post-processing such as statistical analysis of results), and bifurcation analyses (experiments to study and find stable and unstable steady states). Every necessary piece of information contributing to the unambiguous description of such a simulation is part of the MIASE guidelines. Conversely, information required for the description of the model structure (covered by MIRIAM) for the determination of the model's parameterization, and the specifics of simulation experimental setups, are not part of the MIASE guidelines.

MIASE Is a Reporting Guideline

Reporting guidelines describe how to report clearly and unambiguously what has been done, by describing the entities involved in the experiment. They are not, on the contrary, meant to describe which experimental approaches are correct, or how an experiment should be performed [13]. MIASE is a therefore neither a standard operating procedure nor a description of correct experimental approaches. As such, MIASE does not cover assumptions made during model design or simulation procedure. As mentioned above, information needed for the model description itself is listed in the MIRIAM guidelines. MIRIAM specifies the information necessary to correctly interpret the model, but does not require the explicit statement as to why this model was chosen to represent a particular biological process. Similarly, the reasons behind the choice of a particular simulation approach, e.g., using a stochastic rather than a deterministic algorithm, are not necessary for a MIASE-compliant simulation description. Also, MIASE does not require any statement about the correctness or the scope of a simulation experiment. Whether or not the simulation results match biological reality and whether or not an experiment should be conducted on a certain model is outside MIASE's mission. Nevertheless, a MIASE-compliant description should be detailed enough to allow others to investigate and discuss whether the experiment setup is correct.

[@waltemath2011minimum]

## Ontologies

Controlled vocabularies in bioinformatics
The background to this paper is the now widespread recognition that many existing biological and medical ontologies (or 'controlled vocabularies') can be improved by adopting tools and methods that bring a greater degree of logical and ontological rigor. We describe one endeavor along these lines, which is part of the current reform efforts of the Open Biomedical Ontologies (OBO) consortium [1,2] and which has implications for ontology construction in the life sciences generally.

The OBO ontology library [1] is a repository of controlled vocabularies developed for shared use across different biological and medical domains. Thus the Gene Ontology (GO) [3,4] consists of three controlled vocabularies (for cellular components, molecular functions, and biological processes) designed to be used in annotations of genes or gene products. Some ontologies in the library - for example the Cell and Sequence Ontologies, as well as the GO itself - contain terms which can be used in annotations applying to all organisms. Others, especially OBO's range of anatomy ontologies, contain terms applying to specific taxonomic groups such as fly, fungus, yeast, or zebrafish.

Controlled vocabularies can be conceived as graph-theoretical structures consisting on the one hand of terms (which form the nodes of each corresponding graph) linked together by means of edges called relations. The ontologies in the OBO library are organized in this way by means of different types of relations. OBO's Mouse Anatomy ontology, for example, uses just one type of edge, labeled part_of. The GO currently uses two, labeled is_a and part_of. The Drosophila Anatomy ontology includes also a develops_from link. Other OBO ontologies include further links, for example (in the Sequence Ontology) position_of and disjoint_from. The National Cancer Institute (NCI) Thesaurus adds many additional links, including has_location for anatomical structures and different part_of relations for structures and for processes.

The problem is that when OBO and similar ontologies incorporate such relations they typically do so in informal ways, often providing no definitions at all, so that the logical interconnections between the various relations employed are unclear, and even the relations is_a and part_of are not always used in consistent fashion both within and between ontologies. Our task in what follows is to rectify these defects, drawing on the requirements analysis presented in [5].

Of the criteria that ontologies must currently satisfy if they are to be included in the OBO library, the most important for our purposes are: first, inclusion of textual definitions or descriptions designed to ensure that the precise meanings of terms as used within particular ontologies will be clear to a human reader; second, employment of a standard syntax, such as the OWL or OBO flatfile syntax; third, orthogonality to the other ontologies already included in the library. These criteria are designed to support the integration of OBO ontologies, above all by ensuring the compatibility of ontologies pertaining to an identical subject matter. OBO has now added a fourth criterion to assist in achieving such compatibility, namely that the relations (edges) used to connect terms in OBO ontologies should be applied in ways consistent with their definitions as set forth in this paper.

The Relation Ontology offered here is designed to put flesh on this criterion. How, exactly, should part_of or located_in be defined in order to ensure maximally reliable curation of each single ontology while at the same time guaranteeing maximal leverage in building a solid base for life-science knowledge integration in general? We describe a rigorous methodology for providing an answer to this question and illustrate its use in the construction of an easily extendible list of ten relations of a type familiar to those working in the bio-ontological field. This list forms the core of the new OBO Relation Ontology. What is distinctive about our methodology is that, while the relations are each provided with rigorous formal definitions, these definitions can at the same time be formulated in such a way that the underlying technical details remain invisible to ontology authors and curators.

[@smith2005relations]

### Open Biomedical Ontologies (OBO)

The value of any kind of data is greatly enhanced when it exists in a form that allows it to be integrated with other data. One approach to integration is through the annotation of multiple bodies of data using common controlled vocabularies or 'ontologies'. Unfortunately, the very success of this approach has led to a proliferation of ontologies, which itself creates obstacles to integration. The Open Biomedical Ontologies (OBO) consortium is pursuing a strategy to overcome this problem. Existing OBO ontologies, including the Gene Ontology, are undergoing coordinated reform, and new ontologies are being created on the basis of an evolving set of shared principles governing ontology development. The result is an expanding family of ontologies designed to be interoperable and logically well formed and to incorporate accurate representations of biological reality. We describe this OBO Foundry initiative and provide guidelines for those who might wish to become involved.

Introduction
In the search for what is biologically and clinically significant in the swarms of data being generated by today's high-throughput technologies, a common strategy involves the creation and analysis of 'annotations' linking primary data to expressions in controlled, structured vocabularies, thereby making the data available to search and to algorithmic processing1. The most successful such endeavor, measured both by numbers of users and by reach across species and granularities, is the Gene Ontology (GO)2. There exist over 11 million annotations relating gene products described in the UniProt, Ensembl and other databases to terms in the GO3, of which half a million have been manually verified by specialist curators in different model-organism communities on the basis of the analysis of experimental results reported in 52,000 scientific journal articles (http://www.ebi.ac.uk/GOA/). Data related to some 180,000 genes have been manually annotated in this way, an endeavor now being refined and systematized within the Reference Genome Project (US National Institutes of Health National Human Genome Research Institute grant 2P41HG002273-07), which will provide comprehensive GO annotations for both the human genome and a representative set of model-organism genomes in support of research on the primary molecular systems affecting human health.

From retrospective mapping to prospective standardization
The domain of molecular biology is marked by the availability of large amounts of well defined data that can be used without restriction as inputs to algorithmic processing. In the clinical domain, by contrast, only limited amounts of data are available for research purposes, and these still consist overwhelmingly of natural language text. Even where more systematic clinical data are available, the use of local coding schemes means that these data do not cumulate in ways useful to research4. One approach to solving this problem is the Unified Medical Language System (UMLS)5, a compendium of some 100 source vocabularies combined through a process of retrospective mapping based on the identification of synonymy relations between constituent terms. The UMLS has yielded very useful results for applications such as indexing and retrieval of documents. But because the separate vocabularies have no common architecture6, 7, UMLS mappings do not meld their terms together into any single system8.

Increasingly, therefore, the need is being recognized for strategies of prospective standardization designed to bring about the progressive improvement and reciprocal alignment of the frameworks employed for the management, description and publication of biomedical data. Two conspicuous products of this trend are the US National Cancer Institute's Cancer Biomedical Informatics Grid (caBIG) project9 and HL7's Reference Information Model (RIM) (http://hl7.org). caBIG seeks to integrate all cancer research data in a common cyberinfrastructure by standardizing the ways in which such data are acquired, formatted, processed and stored. The HL7 RIM, similarly, offers a standard for the exchange, management and integration of all information relevant to healthcare, from clinical genomics to hospital billing. However, because both caBIG and HL7 focus on the meta-level question of how data and information should be represented in computer and messaging systems, it can be argued that they fail to do justice to the object-level question of how best to represent the proteins, organisms, diseases or drug interactions that are of primary interest in biomedical research7, 10.

A collaborative experiment in ontology development
In 2001, Ashburner and Lewis initiated a strategy to address this object-level question by creating OBO, an umbrella body for the developers of life-science ontologies. OBO applies the key principles underlying the success of the GO, namely, that ontologies be open, orthogonal, instantiated in a well-specified syntax and designed to share a common space of identifiers11. Ontologies must be open in the sense that they and the bodies of data described in their terms should be available for use without any constraint or license and so be applicable to new purposes without restriction. They are also receptive to modification as a result of community debate. They must be orthogonal to ensure additivity of annotations and to bring the benefits of modular development. They must be syntactically in good order to support algorithmic processing. And they must employ a common system of identifiers to enable backward compatibility with legacy annotations as the ontologies evolve.

OBO now comprises over 60 ontologies, and its role as an ontology information resource is supported by the NIH Roadmap National Center for Biomedical Ontology (NCBO) through its BioPortal12. At the same time, the developers of a subset of OBO ontologies have initiated the OBO Foundry, a collaborative experiment based on the voluntary acceptance by its participants of an evolving set of principles (available at http://obofoundry.org) that extend those of the original OBO by requiring in addition that ontologies (i) be developed in a collaborative effort, (ii) use common relations that are unambiguously defined, (iii) provide procedures for user feedback and for identifying successive versions and (iv) have a clearly bounded subject-matter (so that an ontology devoted to cell components, for example, should not include terms like 'database' or 'integer'). A graphical representation of the coverage of the initial Foundry ontologies is provided in Table 1.

[@smith2007obo]


Biomedical ontologies provide essential domain knowledge to drive data integration, information retrieval, data annotation, natural-language processing and decision support. BioPortal (http://bioportal.bioontology.org) is an open repository of biomedical ontologies that provides access via Web services and Web browsers to ontologies developed in OWL, RDF, OBO format and Protg frames. BioPortal functionality includes the ability to browse, search and visualize ontologies. The Web interface also facilitates community-based participation in the evaluation and evolution of ontology content by providing features to add notes to ontology terms, mappings between terms and ontology reviews based on criteria such as usability, domain coverage, quality of content, and documentation and support. BioPortal also enables integrated search of biomedical data resources such as the Gene Expression Omnibus (GEO), ClinicalTrials.gov, and ArrayExpress, through the annotation and indexing of these resources with ontologies in BioPortal. Thus, BioPortal not only provides investigators, clinicians, and developers one-stop shopping to programmatically access biomedical ontologies, but also provides support to integrate data from a variety of biomedical resources.


As the number of biomedical ontologies increases, so does the number of repositories that index and organize ontologies. Some repositories crawl the Web to collect ontologies (e.g. Swoogle, http://swoogle.umbc.edu;, Watson, http://watson.kmi.open.ac.uk/Overview.html; and OntoSelect, http://olp.dfki.de/ontoselect?wicket:bookmarkablePage=wicket-0:de.dfki.ontoselect.Home), some request users to submit their ontologies themselves (e.g. the DAML ontology library. http://www.daml.org/ontologies; and SchemaWeb, http://www.schemaweb.info) and others are limited to storage of ontologies based on ontology representation language [Ontology Lookup Service, http://www.ebi.ac.uk/ontology-lookup/(1,2)]. BioPortal is an open repository of biomedical ontologies that stores ontologies developed in various formats, that provides for automatic updates by user submissions of new versions, and that provides access via Web browsers and through Web services. BioPortal users can browse and search the ontologies, submit new versions of the ontologies in the repository, comment on any ontology (or portion of an ontology) in the repository, add a review of the ontology, describe their experience in using the ontology or make suggestions to ontology developers. The focus on enabling members of the community to contribute actively to BioPortal content and to increase the value of that content to other users distinguishes BioPortal from other ontology repositories.

Most researchers in biomedicine, however, are interested in biomedical data and not the ontologies per se. Indeed, ontologies provide the means for users to interpret and integrate the data. One of the key features of BioPortal is the Open Biomedical Repository (OBR). To create OBR, we have indexed biomedical data sets available online (e.g. entries in GEO, ClinicalTrials.gov) with ontologies in BioPortal. The index links the underlying data sets to the terms in the ontologies in BioPortal. While the content of BioPortal focuses on the biomedical domain, the BioPortal technology is domain-independent.

[@noy2009bioportal]

#### Systems Biology Ontology (SBO)


Abstract
Genomic sequencing has made it clear that a large fraction of the genes specifying the core biological functions are shared by all eukaryotes. Knowledge of the biological role of such shared proteins in one organism can often be transferred to other organisms. The goal of the Gene Ontology Consortium is to produce a dynamic, controlled vocabulary that can be applied to all eukaryotes even as knowledge of gene and protein roles in cells is accumulating and changing. To this end, three independent ontologies accessible on the World-Wide Web (http://www.geneontology.org) are being constructed: biological process, molecular function and cellular component.

The accelerating availability of molecular sequences, particularly the sequences of entire genomes, has transformed both the theory and practice of experimental biology. Where once biochemists characterized proteins by their diverse activities and abundances, and geneticists characterized genes by the phenotypes of their mutations, all biologists now acknowledge that there is likely to be a single limited universe of genes and proteins, many of which are conserved in most or all living cells. This recognition has fuelled a grand unification of biology; the information about the shared genes and proteins contributes to our understanding of all the diverse organisms that share them. Knowledge of the biological role of such a shared protein in one organism can certainly illuminate, and often provide strong inference of, its role in other organisms.

Progress in the way that biologists describe and conceptualize the shared biological elements has not kept pace with sequencing. For the most part, the current systems of nomenclature for genes and their products remain divergent even when the experts appreciate the underlying similarities. Interoperability of genomic databases is limited by this lack of progress, and it is this major obstacle that the Gene Ontology (GO) Consortium was formed to address.

Go to:
Functional conservation requires a common language for annotation
Nowhere is the impact of the grand biological unification more evident than in the eukaryotes, where the genomic sequences of three model systems are already available (budding yeast, Saccharomyces cerevisiae, completed in 1996 (ref. 1); the nematode worm Caenorhabditis elegans, completed in 1998 (ref. 2); and the fruitfly Drosophila melanogaster, completed earlier this year3) and two more (the flowering plant Arabidopsis thaliana4 and fission yeast Schizosaccharomyces pombe) are imminent. The complete genomic sequence of the human genome is expected in a year or two, and the sequence of the mouse (Mus musculus) will likely follow shortly thereafter.

The first comparison between two complete eukaryotic genomes (budding yeast and worm5) revealed that a surprisingly large fraction of the genes in these two organisms displayed evidence of orthology. About 12% of the worm genes (~18,000) encode proteins whose biological roles could be inferred from their similarity to their putative orthologues in yeast, comprising about 27% of the yeast genes (~5,700). Most of these proteins have been found to have a role in the core biological processes common to all eukaryotic cells, such as DNA replication, transcription and metabolism. A three-way comparison among budding yeast, worm and fruitfly shows that this relationship can be extended; the same subset of yeast genes generally have recognizable homologues in the fly genome6. Estimates of sequence and functional conservation between the genes of these model systems and those of mammals are less reliable, as no mammalian genome sequence is yet known in its entirety. Nevertheless, it is clear that a high level of sequence and functional conservation will extend to all eukaryotes, with the likelihood that genes and proteins that carry out the core biological processes will again be probable orthologues. Furthermore, since the late 1980s, many experimental confirmations of functional conservation between mammals and model organisms (commonly yeast) have been published7-12.

This astonishingly high degree of sequence and functional conservation presents both opportunities and challenges. The main opportunity lies in the possibility of automated transfer of biological annotations from the experimentally tractable model organisms to the less tractable organisms based on gene and protein sequence similarity. Such information can be used to improve human health or agriculture. The challenge lies in meeting the requirements for a largely or entirely computational system for comparing or transferring annotation among different species. Although robust methods for sequence comparison are at hand13-15, many of the other elements for such a system remain to be developed.

Go to:
A dynamic gene ontology
The GO Consortium is a joint project of three model organism databases: FlyBase16, Mouse Genome Informatics17,18 (MGI) and the Saccharomyces Genome Database19 (SGD). It is expected that other organism databases will join in the near future. The goal of the Consortium is to produce a structured, precisely defined, common, controlled vocabulary for describing the roles of genes and gene products in any organism. Early considerations of the problems posed by the diversity of activities that characterize the cells of yeast, flies and mice made it clear that extensions of standard indexing methods (for example, keywords) are likely to be both unwieldy and, in the end, unworkable. Although these resources remain essential, and our proposed system will continue to link to and depend on them, they are not sufficient in themselves to allow automatic transfers of annotation.

Each node in the GO ontologies will be linked to other kinds of information, including the many gene and protein keyword databases such as SwissPROT (ref. 20), Gen-Bank (ref. 21), EMBL (ref. 22), DDBJ (ref. 23), PIR (ref. 24), MIPS (ref. 25), YPD & WormPD (ref. 26), Pfam (ref. 27), SCOP (ref. 28) and ENZYME (ref. 29). One reason for this is that the state of biological knowledge of what genes and proteins do is very incomplete and changing rapidly. Discoveries that change our understanding of the roles of gene products in cells are published on a daily basis. To illustrate this, consider annotating two different proteins. One is known to be a transmembrane receptor serine/threonine kinase involved in p53-induced apoptosis; the other is known only to be a membrane-bound protein. In one case, the knowledge about the protein is substantial, whereas in the other it is minimal. We need to be able to organize, describe, query and visualize biological knowledge at vastly different stages of completeness. Any system must be flexible and tolerant of this constantly changing level of knowledge and allow updates on a continuing basis.

Similar considerations suggested that a static hierarchical system, such as the Enzyme Commission30 (EC) hierarchy, although computationally tractable, was also likely to be inadequate to describe the role of a gene or a protein in biology in a manner that would be either intuitive or helpful for biologists. The hierarchical EC numbering system for enzymes is the standard resource for classifying enzymatic chemical reactions. The EC system does not address the classification of non-enzymatic proteins or the ability to describe the role of a gene product within a cell; also, the system has little facility for describing diverse protein interactions. The vagueness of the term function when applied to genes or proteins emerged as a particular problem, as this term is colloquially used to describe biochemical activities, biological goals and cellular structure. It is commonplace today to refer to the function of a protein such as tubulin as GTPase or constituent of the mitotic spindle. For all these reasons, we are constructing three independent ontologies.

Go to:
Three categories of GO
Biological process refers to a biological objective to which the gene or gene product contributes. A process is accomplished via one or more ordered assemblies of molecular functions. Processes often involve a chemical or physical transformation, in the sense that something goes into a process and something different comes out of it. Examples of broad (high level) biological process terms are cell growth and maintenance or signal transduction. Examples of more specific (lower level) process terms are translation, pyrimidine metabolism or cAMP biosynthesis.

Molecular function is defined as the biochemical activity (including specific binding to ligands or structures) of a gene product. This definition also applies to the capability that a gene product (or gene product complex) carries as a potential. It describes only what is done without specifying where or when the event actually occurs. Examples of broad functional terms are enzyme, transporter or ligand. Examples of narrower functional terms are adenylate cyclase or Toll receptor ligand.

Cellular component refers to the place in the cell where a gene product is active. These terms reflect our understanding of eukaryotic cell structure. As is true for the other ontologies, not all terms are applicable to all organisms; the set of terms is meant to be inclusive. Cellular component includes such terms as ribo-some or proteasome, specifying where multiple gene products would be found. It also includes terms such as nuclear membrane or Golgi apparatus.

Ontologies have long been used in an attempt to describe all entities within an area of reality and all relationships between those entities. An ontology comprises a set of well-defined terms with well-defined relationships. The structure itself reflects the current representation of biological knowledge as well as serving as a guide for organizing new data. Data can be annotated to varying levels depending on the amount and completeness of available information. This flexibility also allows users to narrow or widen the focus of queries. Ultimately, an ontology can be a vital tool enabling researchers to turn data into knowledge. Computer scientists have made significant contributions to linguistic formalisms and computational tools for developing complex vocabulary systems using reason-based structures, and we hope that our ontologies will be useful in providing a well-developed data set for this community to test their systems. The Molecular Biology Ontology Working Group (http://wwwsmi.stanford.edu/projects/bio-ontology/) is actively attempting to develop standards in this general field.

Biological process, molecular function and cellular component are all attributes of genes, gene products or gene-product groups. Each of these may be assigned independently and, indeed, we believe that simply recognizing that biological process, molecular function and cellular location represent independent attributes is by itself clarifying in many situations, as in the annotation of gene-expression data. The relationships between a gene product (or gene-product group) to biological process, molecular function and cellular component are one-to-many, reflecting the biological reality that a particular protein may function in several processes, contain domains that carry out diverse molecular functions, and participate in multiple alternative interactions with other proteins, organelles or locations in the cell.

The ontologies are developed for a generic eukaryotic cell; accordingly, specialized organs or body parts are not represented. Full integration of the ontologies with anatomical structures will occur as the ontologies are incorporated into each species database and are related to anatomical data within each database. GO terms are connected into nodes of a network, thus the connections between its parents and children are known and form what are technically described as directed acyclic graphs. The ontologies are dynamic, in the sense that they exist as a network that is changed as more information accumulates, but have sufficient uniqueness and precision so that databases based on the ontologies can automatically be updated as the ontologies mature. The ontologies are flexible in another way, so that they can reflect the many differences in the biology of the diverse organisms, such as the breakdown of the nucleus during mitosis. In this way the GO Consortium has built up a system that supports a common language with specific, agreed-on terms with definitions and supporting documentation (the GO ontologies) that can be understood and used by a wide biological community.

[@ashburner2000gene]

Systems biology ontology
An ontology is defined here in its information science meaning, as a hierarchical structuring of knowledge. In our case, it is a set of relational vocabularies, that is a set of terms linked together. Each term has a definition and a unique identifier. The most famous ontology in life-science is Gene Ontology (GO) [13]. One of the goals of the Systems Biology Ontology (SBO, http://www.ebi.ac.uk/sbo/ webcite) is to facilitate the immediate identification of the relation between a model component and the model structure. SBO is currently made up of four different vocabularies. Within a vocabulary, the terms are related by "is a" inheritances, which represent sub-classing.

1. A classification of rate laws. This CV is a taxonomy of kinetic rate equations. Examples of terms in this CV are "mass action kinetic", "Henri-Michaelis-Menten kinetics", "Hill function" etc. Note that although taking the same mathematical form, the rate-laws "Henri-Michaelis-Menten", "Van Slyke" and "Briggs-Haldane", being based on different assumptions, will be represented by different terms. This will help a user to choose the adequate conversion to elementary steps if needed.

2. A taxonomy of the roles of reaction participants, including the following terms: "catalyst", "substrate", "competitive inhibitor", "non-competitive inhibitor" etc.

3. A CV for parameter roles in quantitative models. This CV includes terms such as "forward unimolecular rate constant", "Hill coefficient", "Michaelis constant" etc.

4. A list of modelling framework, that precises how to interpret a mathematical expression, such as "deterministic", "stochastic", "boolean" etc.

The annotation of model components with SBO terms will be an essential step to reach MIRIAM-compliance. Not only such an annotation will be important to understand and to programmatically analyse models, it will also power the search strategies used by the databases of models, and in particular BioModels Database. The use of SBO terms within SBML will allow to a limited extend to get rid of the explicit mathematics in the model itself, but to download the adequate rate-law instead (Figure 3).

[@le2006model]



The use of computational modeling to describe and analyze biological systems is at the heart of systems biology. Model structures, simulation descriptions and numerical results can be encoded in structured formats, but there is an increasing need to provide an additional semantic layer. Semantic information adds meaning to components of structured descriptions to help identify and interpret them unambiguously. Ontologies are one of the tools frequently used for this purpose. We describe here three ontologies created specifically to address the needs of the systems biology community. The Systems Biology Ontology (SBO) provides semantic information about the model components. The Kinetic Simulation Algorithm Ontology (KiSAO) supplies information about existing algorithms available for the simulation of systems biology models, their characterization and interrelationships. The Terminology for the Description of Dynamics (TEDDY) categorizes dynamical features of the simulation results and general systems behavior. The provision of semantic information extends a model's longevity and facilitates its reuse. It provides useful insight into the biology of modeled processes, and may be used to make informed decisions on subsequent simulation experiments.

Keywords:dynamics; kinetics; model; ontology; simulation
Top of page
Introduction: semantics in computational systems biology
Models as abstract representations of observed or hypothesized phenomena are not new to the life sciences. They have long been used as tools for organizing and communicating information. However, the form those models take in systems biology has changed dramatically. Traditional representations of biomolecular networks have used natural language narratives augmented with block-and-arrow diagrams. While useful for describing hypotheses about a system's components and their interactions, those representations are increasingly recognized as inadequate vehicles for understanding complex systems (Bialek and Botstein, 2004). Instead, formal, quantitative models replace these static diagrams as integrators of knowledge, and serve as the centerpiece of the scientific modeling and simulation cycle. By systematically describing how biological entities and processes interrelate and unfold, and by the adoption of standards for how these are defined, represented, manipulated and interpreted, quantitative models can enable meaningful comparison between the consequences of basic assumptions and the empirical facts (May, 2004).

The ease with which modern computational and theoretical tools can be applied to modeling is leading not only to a large increase in the number of computational models in biology, but also to a dramatic increase in their size and complexity. As an example, the number of models deposited in BioModels Database (Le Novre et al, 2006; Li et al, 2010a) is doubling roughly every 22 months while the average number of relationships between variables per model is doubling every 13 months. The models published with the first release of BioModels Database contained on average 30 relationships per model, and this number rose to around 100 in the 17th release. Standardization of the encoding formats is required to search, compare or integrate such a large amount of models. We have argued that the standards used in descriptions of knowledge in life sciences can be divided into three broad categories: content standards, syntax standards and semantic standards (see for instance the matrix in Le Novre, 2008). Content standards provide checklists or guidelines as to what information should be stored for a particular data type or subject area. Examples of such Minimum Information checklists are hosted on the MIBBI portal (Taylor et al, 2008). Syntax standards provide structures for formatting the information requested in a content standard. Frequent examples are representation formats, for instance using an XML language. Semantic standards provide a unified, common definition for all words, phrases or vocabulary used to describe a particular data type or subject area. By using standards from these three categories in concert, model descriptions can achieve both human and computational usability, reusability and interoperability, and it has even been claimed that the markup is the model (Kell and Mendes, 2008).

Computational models, expressed in representation formats such as the Systems Biology Markup Language (SBML; Hucka et al, 2003), CellML (Lloyd et al, 2004) and NeuroML (Gleeson et al, 2010), still require much human interpretation. While syntax standards define the format for expressing the mathematical structure of models (i.e. the variables and their mathematical relationships), they define neither what the variables and the mathematical expressions represent, nor how they were generated. Where this critical information is communicated through free-text descriptions or non-standard annotations, it can onlyif at allbe computationally interpreted with complex text-mining procedures (and hardly even with those; Ananiadou et al, 2006). Existing modeling tools that work only with unannotated models are therefore restricted to a fraction of the overall model information available, omitting the crucial semantic portion encoded in non-standard annotations. Furthermore, textual descriptions of semantics can be ambiguous and error-prone. Subsequent activities such as model searching, validation, integration, analysis and sharing all suffer as a result; software tools are of limited use without standardized, machine-readable data. The extent of semantic information associated with models is potentially unlimited and susceptible to rapid evolution. Thus, to provide for maximum flexibility, semantic information should be defined independently of the standard formats used for model encoding. This allows for easy updates and extensions of the vocabulary as science evolves, without invalidating previously encoded models. Making use of ontologies, as one approach of encoding semantics, has gained momentum in life sciences over the last decade (Smith, 2003). Ontologies are formal representations of knowledge with definitions of concepts, their attributes and relations between them expressed in terms of axioms in a well-defined logic (Rubin et al, 2008). Ontologies include information about their terms, especially definitional knowledge, and provide a single identifier for each distinct entity, allowing unambiguous reference and identification. In addition, ontologies can be augmented with terminological knowledge such as synonyms, abbreviations and acronyms. Widely used and established examples include the Gene Ontology (Ashburner et al, 2000), the Foundational Model of Anatomy (Rosse and Mejino, 2003) and BioPAX (Demir et al, 2010). Ontologies used in conjunction with standard formats provide a rich, flexible, fast-evolving semantic layer on top of the stable and robust standard formats.

While existing ontologies adequately cover the biology encoded in models, we extend the idea to model-related information. We describe three ontology efforts to standardize the encoding of semantics for models and simulations in systems biology. These publicly available, free consensus ontologies are the Systems Biology Ontology (SBO), the Kinetic Simulation Algorithm Ontology (KiSAO) and the Terminology for the Description of Dynamics (TEDDY). Together, they provide stable and perennial identifiers, referencing machine-readable, software-interpretable, regulated terms. These ontologies define semantics for the aspects of models, which correspond to the three steps of the modeling and simulation process as shown in Figure 1. The efforts we introduce here are at different stages of development and have different levels of community support; SBO is a well-established software tool, KiSAO gathers increasing community support and TEDDY is as yet in its infancy, being primarily a research project. The purpose of our work is to provide practical tools for computational systems biology and as such, the development of the ontologies presented here is largely driven by the needs of the projects using them. However, their focus and coverage is not voluntarily restricted and any community requirements will, in general, be accommodated. All three ontologies aim to fill specific niches in the concept space covered by the Open Biomedical Ontology (OBO) foundry (Smith et al, 2007). The level of compliance with the OBO foundry principles is described for each of the three ontologies in Table I.

[@courtot2011controlled]



## Physiological Models

In recent years, particulary since the sequencing of the human genome, there has
been an ever increasing list of wide ranging cellular models published in the
literature. Each author has a particular notation that they use to publish the
model. Some authors will publish the model as a reaction scheme, much like the
notation given in Figure \ref{Figure:sbw}. Others will itemize the actual
mathematical representation in the form of a list of differential equations.
Some authors do not publish the model at all but provide the model as
supplementary information. Until recently, there has been no way to publish
models in a standard format. Without a standard format it has proved very
difficult if not impossible in many cases to use published models without
considerable effort.

As a result of this obvious shortcoming, a number of groups set out to gather
community support to develop a standard that model developers would be happy to
use. There was an early effort in 1998 by the BTK (BioThermoKinetics) group to
standardize on a practical format for exchanging models between Gepasi
[@Gepasi:1993] and SCAMP [@SauroF91], both tools were widely used at the time.
Around the same time, bioengineers at the University of Auckland began
investigating the role that XML [@harold:2001] could play in defining a standard
for exchanging computational models in order to reduce errors that appeared
frequently in published models. From the Auckland team emerged CellML
[@LloydCellML2004]. Members from the BTK group subsequently took their
experience and contributed significantly to the other major model exchange
standard, called SBML [@hucka:2002d]. SBML was developed in 2000 at Caltech,
Pasadena as a result of funding received from the Japanese ERATO program. Both
CellML and SBML are today viewed as the main standards for exchanging cellular
network models. There are however fundamental differences between the approaches
that CellML and SBML take in the way models are represented.

[@bray1997extensible]

Extensible Markup Language, abbreviated XML, describes a class of data objects called XML documents
and partially describes the behavior of computer programs which process them. XML is an application
profile or restricted form of SGML, the Standard Generalized Markup Language [ISO 8879]. By construction, XML documents are conforming SGML documents.
XML documents are made up of storage units called entities, which contain either parsed or unparsed data.
Parsed data is made up of characters, some of which form character data, and some of which form markup.
Markup encodes a description of the document's storage layout and logical structure. XML provides a
mechanism to impose constraints on the storage layout and logical structure.
A software module called an XML processor is used to read XML documents and provide access to their
content and structure. It is assumed that an XML processor is doing its work on behalf of another module,
called the application. This specification describes the required behavior of an XML processor in terms
of how it must read XML data and the information it must provide to the application.
1.1. Origin and Goals
XML was developed by an XML Working Group (originally known as the SGML Editorial Review Board)
formed under the auspices of the World Wide Web Consortium (W3C) in 1996. It was chaired by Jon
Bosak of Sun Microsystems with the active participation of an XML Special Interest Group (previously
known as the SGML Working Group) also organized by the W3C. The membership of the XML Working
Group is given in an appendix. Dan Connolly served as the Working Group's contact with the W3C.
The design goals for XML are:
1. XML shall be straightforwardly usable over the Internet.
2. XML shall support a wide variety of applications.
3. XML shall be compatible with SGML.
4. It shall be easy to write programs which process XML documents.
5. The number of optional features in XML is to be kept to the absolute minimum, ideally zero.
6. XML documents should be human-legible and reasonably clear.
7. The XML design should be prepared quickly.
8. The design of XML shall be formal and concise.
9. XML documents shall be easy to create.
10. Terseness in XML markup is of minimal importance.

### Systems Biology Markup Language (SBML)

Whereas CellML attempts to be highly comprehensive, SBML was designed to meet
the immediate needs of the modelling community and is therefore more focused on
a particular problem set. One result of this is that the standard is much
simpler and much less verbose. Like CellML, SBML is based on XML, however unlike
CellML, it takes a different approach to representing cellular models. The way
SBML represents models closely maps the way existing modelling packages
represent models. Whereas CellML represents models as a mathematical wiring
diagram, SBML represent models as a list of chemical transformations much like
the example indicated in Figure \ref{Figure:sbw}. Since every process in a
biological cells can ultimately be broken down into one or more chemical
transformations this was the natural representation to use. However SBML does
not have generalized elements such as components and connections, SBML employs
specific elements to represent spatial compartments, molecular species and
chemical transformations. In addition to these, SBML also has provision for
rules which can be used to represent constraints, derived values and general
math which for one reason or another cannot be transformed into a chemical
scheme. Like CellML, the dependent and independent species are implied.

#### SBML Development Tools

Early on in the development of SBML, the original authors decided to provide
software tools almost immediately for the community. Since XML at the time was
not well understood by many software developers the provision of such assistance
was crucial. In hindsight, this is probably one reason why SBML has become a
popular standard. Initially the original authors provided a simple library for
the Windows platform since the bulk of biology based users tend to be Windows
users. Today this library is still used by a number of tools including Gepasi,
Jarnac and JDesigner. With the growing popularity of SBML, the community has
since developed a comprehensive cross platform tool
(<http://sbml.sourceforge.org>) which is now the recommended SBML toolkit to use
(libSBML). libSBML was developed in C/C++ for maximum portability.

#### Extensibility

It was realized early on by the authors of SBML that as systems biology
developed there would be pressure from the community to make additional
functionality available in SBML. To address this issue, SBML has a formal means
for adding extensions in the form of the so-called annotations. There now exist
a number of annotations that are used by software developers. Some of these
address issues such as providing visualization information to allow software
tools to render the model in some meaningful way (two examples of these will be
given in a later section). Other extensions provide a means to store information
necessary for flux balance analysis or to provide information for stochastic
simulations. Ultimately some of the extensions will most likely be folded into
the official SBML standard. This mechanism, a sort of Darwinian evolution,
permits the most important and popular requests to be made part of SBML. It
makes the process of SBML evolution more transparent and permits users to be
more involved in the development of SBML.

#### Practical Considerations

While CellML is very general, SBML is more specific, as result, the storage
requirement for SBML is much less. It takes on average roughly 1.5Kbytes to
store a single chemical transformation in SBML Level 2 (compared to 5K for
CellML). Interestingly it only takes roughly 50 to 100 bytes to store single
transformations in raw binary format where there is minimal extraneous syntax.
Some readers may feel that with todays cheap storage technologies, that
discussions on storage requirements is unnecessary. Indeed for small models it
is not an issue.  However, in future very large models are likely to be
developed. There is, for example a serious attempt (www.physiome.org) now
underway to model in the long term entire organs and even whole organisms. The
amount of information in these cases is huge and the question of efficient
storage is not so trivial. Obviously XML is highly compressible and large models
can be stored in this way. However, inefficient storage also increases the time
taken to manipulate the models. Furthermore, in a modelling environment, model
authors tend to generate hundreds of variants while developing the model. For a
large model this clearly would generate huge amounts of XML based data. One of
the things that has yet to be addressed by either standard is the how model
variants can be efficiently stored.

#### Usage

Both SBML and CellML have been taken up by many software developers and
implemented in their software. SBML in particular is being used in over 75
software projects. In addition, SBML is the official model interchange format
for the SBW project <www.sys-bio.org>, the international *E. coli* alliance, and
the receptor tyrosine kinase consortium. Much of the SBML support is in
stand-alone applications, however, a number of database vendors have also
decided to provide export of SBML as an option, examples include reactome, stke
and sigpath.

A related standard that has been proposed by [@MFAML2004] is for the storage of
flux balance models. The proposed format is very similar to SBML but has the
additional feature of storing the flux balance objective function.

### CellML

CellML [@LloydCellML2004] represents cellular models using a mathematical
description similar to equation (@eqGeneral). In addition, CellML represents
entities using a component based approach where relationships between components
are represented by connections. In many ways CellML represents a literal
translation of the mathematical equations, except that the relationship between
dependent and independent species is implied rather then explicit. The literal
translation of the mathematics however goes much further, in fact the
representation that CellML uses is very reminiscent of the way an engineer might
wire up an analog computer to solve the equations (though without specifying the
integrators). As a result CellML is very general and in principal could probably
represent any system that has a mathematical description (and not just the kind
indicated by equation (@eqSystem)). CellML is also very precise in that every
item in a model is defined explicitly. However, the generality and explicit
nature of CellML also results in increased complexity especially for software
developers. Another side effect of the increased complexity is that models that
are represented using CellML tend to be quite large. On average, my own analysis
of a sample from the CellML repository <www.cellml.org/examples/repository/>
indicates that each reaction in a model requires about 5Kbytes of storage.

Another key aspect of CellML is its provision for metadata support. The metadata
can be used to provide a context for a model, such as the author name, when it
was created and what additional documents are available for its description.
CellML uses standard XML based metadata containers such as RDF and within RDF
the Dublin Core.

The CellML team has amassed a very large suite (hundreds) of models which
provides many real examples of CellML syntax. This is an extremely useful
resource for the community.

Tools [@beard2009cellml]

Owing to the complexity of CellML, one unfortunate side effect is that there are
very few tools which can read and write CellML. As far as the author is aware
there are only two third-party tools that can read and write CellML, these are
VCell [@VCELL] and COR [@COR2003]. The CellML team have recently (2004,
http://cellml.sourceforge.net/) began to provide their own software tools to
third-party developers. The delay in providing such tools to the community is
probably one reason why CellML (given its complexity) has not proved so popular
relative to SBML which I will discuss next.

### Mathematical Modeling Language (MML)

MML is a text-based format that is the primary form of model representations in
the JSim platform [@raymond03]. Unlike SBML and CellML which are based on XML,
MML uses its own a C-styled language for model declaration. MML models are often
expressed generally in terms of mathematical equations -- any mixture of
ordinary and partial differential equations, implicit equations, integrations,
discrete events, and even external programming code, such as Java, C, or MATLAB.
One feature that sets MML apart from other model languages is its awareness of
physical units when run through JSim's MML compiler [@chizeck2009]. 

### NeuroML

Paralleling efforts in SBML and CellML in molecular pathway and cell physiology
modeling, NeuroML provides a common data format for defining and exchanging
descriptions of neuronal cell networks [@goddard:2001]. Level 1 (MorphML), Level
2 (ChannelML), and Level 3 (NetworkML) describe neuronal systems to different
levels of biological granularity. 

Biological nervous systems and the mechanisms underlying their operation exhibit astonishing complexity. Computational models of these systems have been correspondingly complex. As these models become ever more sophisticated, they become increasingly difficult to define, comprehend, manage and communicate. Consequently, for scientific understanding of biological nervous systems to progress, it is crucial for modellers to have software tools that support discussion, development and exchange of computational models. We describe methodologies that focus on these tasks, improving the ability of neuroscientists to engage in the modelling process. We report our findings on the requirements for these tools and discuss the use of declarative forms of model descriptionequivalent to objectoriented classes and database schemawhich we call templates. We introduce NeuroML, a markup language for the neurosciences which is defined syntactically using templates, and its specific component intended as a common format for communication between modellingrelated tools. Finally, we propose a template hierarchy for this modelling component of NeuroML, sufficient for describing models ranging in structural levels from neuron cell membranes to neural networks. These templates support both a framework for userlevel interaction with models, and a highperformance framework for efficient simulation of the models.

Biologically detailed single neuron and network models are important for understanding how ion channels, synapses and anatomical connectivity underlie the complex electrical behavior of the brain. While neuronal simulators such as NEURON, GENESIS, MOOSE, NEST, and PSICS facilitate the development of these data-driven neuronal models, the specialized languages they employ are generally not interoperable, limiting model accessibility and preventing reuse of model components and cross-simulator validation. To overcome these problems we have used an Open Source software approach to develop NeuroML, a neuronal model description language based on XML (Extensible Markup Language). This enables these detailed models and their components to be defined in a standalone form, allowing them to be used across multiple simulators and archived in a standardized format. Here we describe the structure of NeuroML and demonstrate its scope by converting into NeuroML models of a number of different voltage- and ligand-gated conductances, models of electrical coupling, synaptic transmission and short-term plasticity, together with morphologically detailed models of individual neurons. We have also used these NeuroML-based components to develop an highly detailed cortical network model. NeuroML-based model descriptions were validated by demonstrating similar model behavior across five independently developed simulators. Although our results confirm that simulations run on different simulators converge, they reveal limits to model interoperability, by showing that for some models convergence only occurs at high levels of spatial and temporal discretisation, when the computational overhead is high. Our development of NeuroML as a common description language for biophysically detailed neuronal and network models enables interoperability across multiple simulation environments, thereby improving model transparency, accessibility and reuse in computational neuroscience.



A number of software of packages are written to work with NeuroML,  NEURON [@carnevale2006neuron],
GENESIS [@bower1995book], MOOSE [@ray2008pymoose], NEST [@diesmann2001nest], and PSICS [@cannon2010stochastic]

A recent comparison of the  (including the reconstruction of 3D structure
)compared simulators [@gleeson2010]


Encoding computational models in a standard format permit to share and re-use them in a variety of contexts. The Systems Biology Markup Language (SBML) is the de facto standard open format for exchanging models between software tools in systems biology. Neuronal models can often be encoded using this format, thus providing the modeler with access to a large variety of software packages that support SBML. We give a brief overview of the main constructs of SBML Level 3 Version 1 Core (the latest version of SBML). We provide practical examples of encoding particular neuronal models using SBML, illustrate the results of using the SBML encoding to simulate the models, and demonstrate the correspondance of results produced by the original modelers and the exchangeable encoding of the model in SBML.

Furthermore, in the future there may be further merging of standards. There are
recent efforts to convert NeuroML into SBML, which would allow NeuroML models
and modelers access to the vast library of SBML compliant software tools
[@keating2012encoding].

## Simulation

The share and reuse of biological models are primary challenges in the field of
computational biology. While the previous discussed model exchange formats
address issues of reproducing the structural components of the model, there are
still missing elements in the computational procedure to unambiguously generate
or reproduce relevant simulation results. MIRIAM does not require that these
relevant simulation results, nor the process of obtaining them how to obtain
them. Thus, it is crucial to also provide [@waltemath2011minimum]

### Simulation Experiment Description Markup Language (SED-ML)

Share and reuse of biochemical models have become two of the main issues in the field of Computational Systems Biology. There already exist widely-accepted formats to encode the structure of models. However, the problem of describing the simulations to be run using those models has not yet been tackled in a satisfactory way. The community believes that providing detailed information about simulation recipes will highly improve the efficient use of existing models. Accordingly a set of guidelines called the Minimum Information About a Simulation Experiment (MIASE) is currently under development. It covers information about the simulation settings, including information about the models, changes on them, simulation settings applied to the models and output definitions. Here we present the Simulation Experiment Description Markup Language (SED-ML), an XML format that enables the storage and exchange of part of the information required to implement the MIASE guidelines. SED-ML is independent of the formats used to encode the models  as long as they are expressed in XML , and it is independent of the software tools used to run the simulations. Several test implementations are being developed to benchmark SED-ML on simple cases, and pave the way to a more complete support of MIASE.

[@kohn2008sed]

### Systems Biology Results Markup Language (SBRML)

Motivation: Research in systems biology is carried out through a combination of experiments and models. Several data standards have been adopted for representing models (Systems Biology Markup Language) and various types of relevant experimental data (such as FuGE and those of the Proteomics Standards Initiative). However, until now, there has been no standard way to associate a model and its entities to the corresponding datasets, or vice versa. Such a standard would provide a means to represent computational simulation results as well as to frame experimental data in the context of a particular model. Target applications include model-driven data analysis, parameter estimation, and sharing and archiving model simulations.

Results: We propose the Systems Biology Results Markup Language (SBRML), an XML-based language that associates a model with several datasets. Each dataset is represented as a series of values associated with model variables, and their corresponding parameter values. SBRML provides a flexible way of indexing the results to model parameter values, which supports both spreadsheet-like data and multidimensional data cubes. We present and discuss several examples of SBRML usage in applications such as enzyme kinetics, microarray gene expression and various types of simulation results.

Availability and Implementation: The XML Schema file for SBRML is available at http://www.comp-sys-bio.org/SBRML under the Academic Free License (AFL) v3.0.

Systems biology is typically carried out with a solid basis on explicit (computational) models, which are used to guide traditional experimentation as well as data analysis. Computational models are at the core of the systems biology methodology, and therefore an important part of the infrastructure needed for practicing systems biology.

The growing reliance on computational models to support biological research has given rise to several types of modelling software. There are software packages for creation and visualization of models (Funahashi et al., 2003), for their analysis and simulation (Hoops et al., 2006; Moraru et al., 2008) and also for analysing experimental data in their context (Shannon et al., 2003). Additionally, there are several databases for sharing models within the community (Le Novre et al., 2006; Olivier and Snoep, 2004).

The most prominent standard is the Systems Biology Markup Language (SBML; Hucka et al., 2003), which is an XML-based language for representing systems biology models in a way that is largely independent from the means to simulate those models. Models represented in SBML are thus interpretable by a wide range of software, which can manipulate them in different ways: simulate their dynamics through ordinary differential equations, stochastic simulation algorithms, Petri nets or other formalisms; analyse their underlying stoichiometric properties; fit their parameters to experimental data; explore their parameter space by parameter scans or bifurcation analysis and many more computational applications. The existence of a standard way to represent models has been a catalyst for the appearance of these diverse types of software, since they have a common basis in SBML, allowing researchers to share models and effectively use them with these software tools.

Another important standard in the area is MIRIAM (Le Novre et al., 2005), which is a set of guidelines to be followed when communicating models. More specifically, MIRIAM provides a means of unequivocally identifying biological molecules [through the use of resource description framework (RDF) and universal identifiers]. MIRIAM also recommends that models should be encoded in a machine-readable format, and that their authorship and terms of distribution should be specified explicitly. While MIRIAM does not prescribe which machine-readable format should be used to encode the model, SBML is a convenient way to do so, and the combination of these two standards has become a predominant way to specify self-contained models (Herrgrd et al., 2008).

The Simulation Experiment Description Markup Language (SED-ML; Khn and Le Novre, 2008) is another XML-based standardization effort for describing computational simulation experiments.

Despite the increasing popularity of SBML and MIRIAM, which has resulted in many models now being available in electronic form, there is currently no standard way of communicating the actual results of the operations carried out on such models (e.g. simulations). Because of this lack of a standardized way to communicate model-derived data, it is very difficult to share such results between different software applications. Such activities have to be done in ways that require ad hoc programs to transform the data formats appropriately.

Here, we propose a new markup language which is intended to specify results from operations carried out on models. We name this format the Systems Biology Results Markup Language (SBRML). While developing SBRML as a means of communicating simulation results, it became obvious that it is equally useful to associate any kind of experimental data to a model, something that seems to be missing in the landscape of computational systems biology. SBRML is therefore a means of specifying any kind of quantitative results in the context of a systems biology model. Some of its major uses are:

associating experimental results with models for passing to analysis tools;

sharing and archiving of model simulations; and

recording the results of analysis for validation, archiving or comparison.

The rest of this article describes the overall structure of SBRML documents and illustrates a number of use cases that are expected to cover the most common applications. Finally, SBRML is discussed in the context of a more complete scenario of computational activities centered on biological models, and therefore showing its relation with other existing and emerging standards.

[@dada2010sbrml]

## Other Standards

Apart from using XML to define an interchange format, there are two other
mediums for representing models, these include, human readable text based
formats and visual formats.

### Visualization of Models

For many users, the ability to visualize models and to build models using visual
tools is an important feature. There are currently a number of visualization
formats that are in common use. One of the most comprehensive and freely
available formats is the molecular interaction maps developed by Kohn
[@Kohn1999] and more recently by Mirit Aladjem [@Kohn2004]. The Kohn format
emerged from the need to represent complex signaling networks in a compact way.
Unlike metabolic networks, signalling networks can be extremely complex with
multiple protein states and interactions and therefore an alternative and more
concise approach is desirable. At the time of writing there is no software for
manipulating Kohn maps and no means to convert Kohn maps to SBML or any other
standard. Hopefully this will change in the future.

An early computer based visual notation was proposed by Cook [@Cook2001] who
developed a notation called BioD. This notation has been implemented in a
commercial software package called KineCyte
(http://www.rainbio.com/Software.html).

Another proposal has been put forward by Kitano [@Kitano2003]. This is a more
traditional approach where different molecular entities (such as proteins, ions,
transporters etc.) have particular pictorial representations. The software tool
called cellDesigner [@CellDesigner2003] implements this proposed format.

#### JDesigner

One of the first visualization tools, JDesigner [@Sauro:Omics] also implements a
traditional way to depict networks (see Figure 3) using a pictorial
representation to indicate substances and reactions. JDesigner also employs
bezier curves to represent arcs in an attempt to make the diagrams similar to
the notation found in many molecular biology text books. CellDesigner and
JDesigner connect to the Systems Biology Workbench (SBW) for simulation support.

![Example of JDesigner's visual
format\label{Figure:jdesigner}](images/JDesigner1.eps)

Finally, there is a proposal from a commercial company called Gene Network
Sciences which has devised a derivative of the Kohn notation called DCL. However
this notation is proprietary and its utility to the general scientific
community is not certain at this time.

#### Systems Biology Graphical Notation (SBGN)

Circuit diagrams and Unified Modeling Language diagrams are just two examples of standard visual languages that help accelerate work by promoting regularity, removing ambiguity and enabling software tool support for communication of complex information. Ironically, despite having one of the highest ratios of graphical to textual information, biology still lacks standard graphical notations. The recent deluge of biological knowledge makes addressing this deficit a pressing concern. Toward this goal, we present the Systems Biology Graphical Notation (SBGN), a visual language developed by a community of biochemists, modelers and computer scientists. SBGN consists of three complementary languages: process diagram, entity relationship diagram and activity flow diagram. Together they enable scientists to represent networks of biochemical interactions in a standard, unambiguous way. We believe that SBGN will foster efficient and accurate representation, visualization, storage, exchange and reuse of information on all kinds of biological knowledge, from gene regulation, to metabolism, to cellular signaling.

"Un bon croquis vaut mieux qu'un long discours" ("A good sketch is better than a long speech"), said Napoleon Bonaparte. This claim is nowhere as true as for technical illustrations. Diagrams naturally engage innate cognitive faculties1 that humans have possessed since before the time of our cave-drawing ancestors. Little wonder that we find ourselves turning to them in every field of endeavor. Just as with written human languages, communication involving diagrams requires that authors and readers agree on symbols, the rules for arranging them and the interpretation of the results. The establishment and widespread use of standard notations have permitted many fields to thrive. One can hardly imagine today's electronics industry, with its powerful, visually oriented design and automation tools, without having first established standard notations for circuit diagrams. Such was not the case in biology2. Despite the visual nature of much of the information exchange, the field was permeated with ad hoc graphical notations having little in common between different researchers, publications, textbooks and software tools. No standard visual language existed for describing biochemical interaction networks, inter- and intracellular signaling gene regulationconcepts at the core of much of today's research in molecular, systems and synthetic biology. The closest to a standard is the notation long used in many metabolic and signaling pathway maps, but in reality, even that lacks uniformity between sources and suffers from undesirable ambiguities (Fig. 1). Moreover, the existing tentative representations, however well crafted, were ambiguous, and only suitable for specific needs, such as representing metabolic networks or signaling pathways or gene regulation.

The molecular biology era, and more recently the rise of genomics and other high-throughput technologies, have brought a staggering increase in data to be interpreted. It also favored the routine use of software to help formulate hypotheses, design experiments and interpret results. As a group of biochemists, modelers and computer scientists working in systems biology, we believe establishing standard graphical notations is an important step toward more efficient and accurate transmission of biological knowledge among our different communities. Toward this goal, we initiated the SBGN project in 2005, with the aim of developing and standardizing a systematic and unambiguous graphical notation for applications in molecular and systems biology.

Historical antecedents
Graphical representation of biochemical and cellular processes has been used in biochemical textbooks as far back as sixty years ago3, reaching an apex in the wall charts hand drawn by Nicholson4 and Michal5. Those graphs describe the processes that transform a set of inputs into a set of outputs, in effect being process, or state transition, diagrams. This style was emulated in the first database systems that depicted metabolic networks, including EMP6, EcoCyc7 and KEGG8. More notations have been 'defined' by virtue of their implementation in specialized software tools such as pathway and network designers (e.g., NetBuilder9, Patika10, JDesigner11, CellDesigner12). Those graphical notations were not standardized, and their understanding relied mainly on relating examples with one's preexisting knowledge of biochemical processes. Although the classical graphs adequately conveyed information about biochemistry, other types of diagrams were needed to represent signaling pathways, and incomplete or indirect information, as coming from molecular biology or genomics. Those conventions effectively mimicked the empirical notations used by biologists, describing either the relationships between elements13, 14 or the flow of activity or influence15, 16, 17. Lists of standard glyphs (Box 1) to represent identified concepts were then provided. The efforts to create rigidly defined schema were pioneered by Kurt Kohn with his Molecular Interaction Maps (MIM), which defined not only a set of symbols but also a syntax to describe interactions and relationships of molecules18, 19. The MIM notation influenced other proposals14. Several proposals followed to describe process diagrams, not only with standard symbols but also defined grammars20, 21, 22, 23.

The SBGN project
Despite the popularity of some of the efforts mentioned above, none of the notations has acquired the status of a community standard. This can be attributed partly to the fact that the efforts only went as far as to propose notations, or implement them in software. Several of us have been involved in the development of the Systems Biology Markup Language (SBML)24, from which we learned that establishing a standard is extremely difficult without an explicit, concerted, effort to engage a community and build a consensus among participants. We organized the SBGN project with this lesson in mind.

For SBGN to be successful, it must satisfy a majority of technical and practical needs and be embraced by a diverse community of biologists, biochemists, bioinformaticians, geneticists, theoreticians and software engineers. Early in the project's history, we established the following overarching principles to help steer SBGN toward those aims, ranked by rough hierarchical order of precedence.


The notation should

be free of intellectual property restrictions to allow free use by the community;
be syntactically and semantically consistent and unambiguous;
support representation of diverse common biological objects, their properties and their interactions;
keep the number of symbols and syntax to a minimum to help comprehension and learning by humans;
be visually consistent and concise, using discriminable symbols;
support modularity to help cope with diagram size and complexity;
support the automated generation of diagrams by software starting from mathematical models.
Many of the design principles above resonate with research on visual languages25, 26 and studies aimed at understanding end-user needs in pathway visualization27, although we derived them from our collective hands-on experiences with developing notations and software. In addition to these principles, we also sought to avoid many problems (Table 1) that affect some existing notations.

The three languages of SBGN
Molecular entities possess many properties that affect their interactions with other entities. Attempting to represent all the possible reactions and interactions in the same diagram is often futile, usually resulting in an incomprehensible jumble. The different styles of notations described above were attempts to control this complexity by presenting only what was needed in a specific context, or what was available through specific views of the system14. Each view focuses on only a portion of the semantics of the overall system, trading off diagram comprehensibility against completeness of biological knowledge.

SBGN follows this strategy and defines three orthogonal and complementary types of diagrams that can be seen as three alternative projections of the underlying more complex biological information. The process diagram draws its inspiration from process-style notations, borrowing ideas from the work of CellDesigner28 and EPE22. By contrast, the entity relationship diagram is based to a large extent on Kohn's MIM notation18, 19. The SBGN activity flow diagram depicts only the cascade of activity, thus making the notation similar to the reduced representations often used in the current literature to describe signaling pathways and gene regulatory networks. In Figure 2, we illustrate the three views applied to a very simple example. The characteristics of the SBGN languages are summarized in Table 2.

The idea of having three diagram types naturally begs the question of whether they could be merged into one, at least in paper form. The answer is no, for at least two reasons. First, a single diagram type would bring us back to the problem of dealing with unreasonable numbers of interactions as described above. Second, each SBGN language reflects fundamental differences in the underlying formal description of the phenomena. The meanings are so different that merging diagram types would compromise their representational robustness.

Having multiple visual languages is not uncommon in engineering (consider, for example, block diagrams and circuit diagrams in electronics, UML class, state sequence and deployment diagrams in software engineering), and this supports the idea that having three sublanguages in SBGN will be manageable in practice. In SBGN, the sharing of symbols representing identical concepts further reduces the differences between the three languages to differences in syntax and semantics. We believe that this, combined with careful design, will mitigate some of the difficulties of learning SBGN. However, it is to be noted that the clean orthogonality of the languages makes their overlap very limited, mostly to modulatory arcs, and node decorations.

[@le2009systems]

Results: The Biological Connection Markup Language (BCML) is a format to describe, annotate and visualize pathways. BCML is able to store multiple information, permitting a selective view of the pathway as it exists and/or behave in specific organisms, tissues and cells. Furthermore, BCML can be automatically converted into data formats suitable for analysis and into a fully SBGN-compliant graphical representation, making it an important tool that can be used by both computational biologists and wet lab scientists.

[@le2010report]

### Human Readable Formats

#### Jarnac

In addition to visualization approaches and the use of XML to represent models,
there has been a long tradition in the field to describe models using human
readable text based formats. Indeed the very first simulator BIOSSIM, [@Ga68],
allowed a user to describe a model using a list of reaction schemes. Variants of
this have been employed by a number of simulators since, including, SCAMP
[@SauroF91], Jarnac [@sauro:2000], E-Cell [@ECELL] and more recently Pysces
[@Pysces2004]. Being able to represent models in a human readable format offers
many advantages, including, conciseness, easily understood and manipulated using
a simple editor, flexible, portable and above all extremely easy to include
commenting and annotation.

#### Pysces

PySCeS is a console based application written in the Python
(http://www.python.org) programming language that runs on
both Microsoft Windows (2000/XP) and Linux. It runs as
either a single user application on Windows or a multi-user
application under Linux. PySCeS makes use of the Scienti-
c Libraries for Python (SciPy), a large collection of mathematical algorithms for science and engineering applications
(http://www.scipy.org).
Some of the advantages of using Python with SciPy are
as follows. Python is scripted, with all the object oriented
features of a modern programming language, and includes
automatic memory management and garbage collection. It
is well suited to act as a glue for applications that interface
with libraries compiled in other languages such as C, C++
and Fortran. Both Python and SciPy are freely available and
run on a wide variety of operating systems.

It is, of course, possible to build models directly using only
Python with SciPy (Olivier et al., 2002). Although exible,
this approach does require considerable skill in both numerical analysis and computer programming. PySCeS has been
developed to provide a high-level modelling interface that
utilises and extends the low level capabilities provided by
Python and SciPy, making it unnecessary for the modeller
to work with advanced programming techniques or low level
numerical algorithms.
Once a working Python/SciPy environment is available
(installation details for various operating systems are available from the SciPy web-site) PysCeS may be installed using
the standard Python distribution utilities.

[@Pysces2004]

### High-throughput Data

CellML and SBML are the primary formats used to store interchangeable dynamic
models. Apart from the particular details on the model itself there is also the
need to consider data that is used to build the models. Most models are built by
laboriously searching the literature and carrying out additional experiments as
necessary to fill in gaps in the data. This has proved to be an extremely
effective method to building reliable models [@TysonNatReview2001;
@TysonBioessay2002].  However, Many inexperienced researches in Systems Biology
feel that high-throughput data is the answer to the needs of the modelling
community. Unfortunately much of the high-throughput data that is currently
available is not appropriate. Much of the high-throughput data is very noisy and
is probably more suitable for building qualitative models. More importantly, the
bulk of high-throughput data is not generated with dynamic model building in
mind and therefore is often not appropriate for this purpose. To date there has
not been a single dynamic model that has been constructed as a result of
high-throughput data. As systems biology and the construction of dynamic models
becomes more important, it is very likely that the utility of high-throughput
data will become much more significant. When this happens a proposed standard,
called BioPAX (www.biopax.org) will most likely contribute.

BioPAX (Biological Pathway Exchange) is another proposed standard based on XML.
BioPAX aims to integrate many of the incompatible pathway related databases
(such as BioCYC, BIND, WIT, aMAZE, KEGG and others) so that data from any one of
these databases can be easily interchanged. In future it should be possible to
extract data from many of the pathway databases and integrate the data directly
into SBML (or CellML) via BioPAX. The BioPAX group proposes to embed BioPAX
elements onto SBML or cellML for unambiguous identification of substances
(metabolites, enzymes) and reactions.


## Model Databases

At the time of writing there are, surprisingly, no model databases currently in
existence. There are databases for almost every other kind of biological
information except dynamic information. This is even more surprising since
dynamic behavior is probably *the* key feature of biological systems.

There are a number of sites which include simple lists of models, for example
the CellML Repository, but there are no searchable databases.  Although such
databases would be of great advantage to the community, the funding agencies
have so far been reluctant to provide support.  Instead a number of groups,
including the original SBML group and the SBW group are instead developing model
databases as part of other projects. In particular the Department of Energy
through their GTL program are funding a small project to develop a database for
microbial models. What features of a database might be useful? Probably one of
the most useful features for such a database (apart from the obvious ability to
query the database for particular models, organisms etc) would be the ability to
deliver models in different computationally ready formats.

### BioModels

BioModels Database (http://www.ebi.ac.uk/biomodels/), part of the international initiative BioModels.net, provides access to published, peer-reviewed, quantitative models of biochemical and cellular systems. Each model is carefully curated to verify that it corresponds to the reference publication and gives the proper numerical results. Curators also annotate the components of the models with terms from controlled vocabularies and links to other relevant data resources. This allows the users to search accurately for the models they need. The models can currently be retrieved in the SBML format, and import/export facilities are being developed to extend the spectrum of formats supported by the resource.

The number of quantitative models trying to explain various aspects of the cellular machinery is increasing at a steady pace, thanks in part to the rising popularity of systems biology (1). However, as for all types of knowledge, such models will only be as useful as their access and reuse is easy for all scientists. A first step was to define standard descriptions to encode quantitative models in machine-readable formats. Example of such formats are CellML (2) and the Systems Biology Markup Language (SBML) (3,4). The biomedical community now needs public integrated resources, where authors can deposit, in controlled formats, the models they describe in scientific publications.

Some general repositories of quantitative models have been made available, such as the CellML repository CellML repository [(5), http://www.cellml.org/examples/repository/index.html] JWS Online (6) and the former SBML repository. In addition specialist repositories include SenseLab ModelDB (7), the Database of Quantitative Cellular Signalling (DOCQS) (8) and SigPath (9). However no general public resource existed that allowed the user to browse, search and retrieve annotated models

Here we present BioModels Database, developed as part of the BioModels.net initiative (http://www.biomodels.net/). BioModels.net is a collaboration between the SBML Team (USA), the EMBL-EBI (UK), the Systems Biology Group of the Keck Graduate Institute (USA), the Systems Biology Institute (Japan) and JWS Online at Stellenbosch University (South Africa). Its aims are as follows: (i) to define agreed-upon standards for model curation, (ii) to define agreed-upon vocabularies for annotating models with connections to biological data resources and (iii) to provide a free, centralized, publicly accessible database of annotated, computational models in SBML and other structured formats.

BioModels Database is an annotated resource of quantitative models of biomedical interest. Models are carefully curated to verify their correspondence to their source articles. They are also extensively annotated, with (i) terms from controlled vocabularies, such as disease codes and Gene Ontology terms and (ii) links to other data resources, such as sequence or pathway databases. Researchers in the biomedical and life science communities can then search and retrieve models related to a particular disease, biological process or molecular complex.

Previous Section
Next Section
SUBMISSION, CURATION AND ANNOTATION

Models can be submitted by anyone to the curation pipeline of the database (Figure 1). At present, BioModels Database aims to store and annotate models that can be encoded with SBML. CellML models are also accepted. These model formats are synonymous with models that can be integrated or iterated forwards in time, such as ordinary differential equation models. Although we are aware that this means we can cover only a restricted part of the modeling field, we make this our initial focus for the following reason: (i) since a crucial part of the curation process is the verification that the models produce numerical results similar to the ones described in the reference article, iterative simulations over ranges of parameter values and perturbation of simulations at equilibrium are mandatory and (ii) a very large number of such models have already been published, and the pace of their publication is increasing steadily. As a consequence, they are sufficient to consume all the curation workforce we have, and we can envision to gather in the near future.


View larger version:
In this page In a new window
Download as PowerPoint Slide
Figure 1
Pipeline describing the structure of BioModels database.

To be accepted in BioModels Database, a model must be compliant with MIRIAM, the Minimal Information Requested in the Annotation of Models (10). One of the requirements of MIRIAM is that a model has to be associated with a reference description that provides directly, or through references, the structure of the model, the necessary quantitative parameters and presents the results of numerical analysis of the model. BioModels Database further refines the notion of reference description, by considering only models described in the peer-reviewed scientific litterature.

A series of automated tasks are performed by the pipeline prior to human intervention (see Materials and Methods for details):

Verification that the file is well-formed XML.

If necessary, conversion to the latest version of SBML.

Verification of the syntax of SBML.

Series of consistency checks, enforcing the validity of the model.

If any of those steps is not completed, a member of the distributed team of curators can reject the model, or instead correct it and resubmit it to the pipeline. The last and most important step, of the curation process, is verifying that when instantiated in a simulation, the model provides results corresponding to the reference scientific article. Curators do not normally challenge the biological relevance of the models, and assume the peer-review process already filtered out unsuitable contributions. However, in specific cases, curators can spot mistakes in an article and, with the agreement of the authors, modify the model accordingly. Once the model is verified to be valid SBML, and to correspond well to the article, it is accepted in the production database for annotation.

In order to be confident in reusing an encoded model, one should be able to trace its origin, and the people who were involved in its inception. The following information is therefore added to the model: (i) either a PubMed identifier (http://www.pubmed.gov) or a DOI (http://www.doi.org) or an URL that permits identifying the peer-review article describing the model; (ii) name and contact details of the individuals who actually contributed to the encoding of the model in its present form; (iii) name and contact of the the person who finally entered the model in the production database and who should be contacted if there is a problem with the encoding of the model or the annotation.

In addition, model components are annotated with references to relevant resources, such as terms from controled vocabularies (Taxonomy, Gene Ontology, ChEBI, etc.) and links to other databases (UniProt, KEGG, Reactome, etc.). This annotation is a crucial feature of BioModels Database in that it permits the unambiguous identification of molecular species or reactions and enables effective search stategies.

[@le2006biomodels]

### CellML Repository

High throughput experimental techniques have led to the population of web-accessible databases with vast amounts of biological data. Mathematical models of biological systems are playing an essential role in the interpretation of this data. The scientific community now faces the challenge of the mathematical models themselves becoming increasingly complex and numerous. There is a need for centralized databases to store all these models in standard formats to make them easily accessible and reusable by the research community. Publishing the models in a standard format, concurrent with the submission of a written paper, will eliminate many of the errors introduced into the model during the publication process. Here we introduce the CellML Model Repository (http://www.cellml.org/models) and discuss it as a solution to these challenges. The BioModels database (Le Novere et al., 2006) is a similar effort, containing biochemical pathway models that have been described in peer-review publications, expressed in SBML (Hucka et al., 2003). Similarly, JWS Online (Olivier and Snoep, 2004) is a repository of kinetic models describing biological systems, and ModelDB (Hines et al., 2004) is a database which stores published models in the field of computational neuroscience.

CellML (Lloyd et al., 2004) and the CellML Model Repository are part of the IUPS Physiome Project (Hunter and Nielsen, 2005) effort to create a virtual physiological human. The explicit representation of modularity, together with the flexible nature of the CellML language which allows the description of a diverse range of cellular and subcellular systems, are two essential features of CellML with regards to its role in the Physiome Project.

Initially the CellML Model Repository started out as a set of examples to illustrate how the language could be applied to describe various biological processes, and to test its features as the language evolved. Later, once the CellML 1.0 specification was stabilized, the CellML repository became a collection of CellML descriptions of models drawn from peer-reviewed journal publications. The CellML Model Repository has since undergone significant growth, with over 330 freely available, quantitative models of biological processes taken from the peer-reviewed literature. In contrast with other databases, such as BioModels, JWS and ModelDB, which focus on specific areas such as systems biology pathway models or computational neuroscience, the CellML Model Repository contains models describing a wide range of biological processes, including: signal transduction pathways, metabolic pathways, elec-trophysiology, immunology, the cell cycle, muscle contraction and mechanical models and constitutive laws. This wide scope exemplifies CellML's ability to describe much of the biochemistry, electrophysiology and mechanics of the intracellular environment. Lumped parameter models dealing with systems physiology (e.g. blood pressure control, fluid retention, electrolyte balance, endocrine function, etc.) are also within the scope of CellML.

Previous Section
Next Section
2 MODEL CURATION

Currently, of the 330 models in the CellML Model Repository, approximately half have been curated to some degree. A star system signifies the curation status of a CellML model. No stars indicate the model has yet to be curated (level 0); one star denotes the CellML model is consistent with the published paper (level 1); two stars imply the CellML model has been checked for typographical errors, unit consistency, completeness (i.e. there are no missing parameters or equations), overconstraints and finally, and arguably most importantly, the CellML model is capable of reproducing the published results (level 2). If a CellML model has three stars it is known to satisfy physical constraints such as conservation of mass, momentum, charge, etc. At this level the curation is conducted by a domain expert (level 3).

From experience, we have found that levels 1 and 2 can be mutually exclusive. Frequently, the errors introduced into the model during the publication process require us to correct minor typographical errors or unit inconsistencies, and/or contact the original model author to request missing parameter values or equations.

The process of model curation involves the following sequence of actions:

The CellML model is loaded into an editing and simulation environment such as the Physiome CellML Environment (PCEnv) or Cellular Open Resource (COR). Any obvious typographical errors and unit inconsistencies are corrected, which is facilitated by a series of error messages and validation prompts generated by the software, and the rendering of the MathML equations in an easily readable format.

Assuming the model is able to be run, we then compare the simulation output with the results in the published paperthis typically involves comparing the graphical results with the published figures.

If we cannot get the CellML model to run, or the simulation output disagrees with the published results, we then attempt to contact the original model author(s) and seek their advice and, where possible, obtain the original model code, which may be in a wide range of different programming languages.

We aim to complete the curation of all the models in the CellML repository, ideally to the level that they replicate the results in the published paper (level 2), however we acknowledge this will not be possible for all models. According to the dynamic, growing nature of the CellML Model Repository, we have designed it with the concept of community curation in mind, so that groups of expert modellers with vested interests in particular models are able to collaborate on their curation.

Previous Section
Next Section
3 MODEL ANNOTATION

Metadata, the extra information associated with a model, are embedded in CellML using the W3C approved RDF standard. In order for a CellML model to be committed to the repository, at the very least it must contain the full citation of the peer-reviewed publication from which the model was taken. This may also be complemented by non-compulsory metadata such as the model authorship and modification histories. While currently these data are non-compulsory, this information is regarded as essential to the utility of a model as a public resource. The CellML Model Repository curators respect the MIRIAM framework (Le Novere et al., 2005) for minimum model annotation requirements, but place different emphasis on annotation requirements. For example, a full modification history explaining what changes were made at what time, by whom, and for what reason is suggested, but not required, by MIRIAM, whereas the CellML Model Repository curators place great importance on this information. A model which is supposedly correct, but offers no explanation as to why it differs from the incorrect description given in the original publication is of limited use to a researcher.

Mathematical descriptions of biological systems implemented in CellML can be given semantic meaning by annotating elements within the CellML model with ontologies and constrained vocabularies, such as SBO (http://www.ebi.ac.uk/sbo/), BioPAX (http://www.biopax.org/), UniProt (http://beta.uniprot.org/), Gene Ontology(http://www.geneontology.org/), etc. One of the primary goals of the semantic annotation of CellML models within the CellML Model Repository is to facilitate searches of models, and elements within models, to allow them to be reused. Further, the annotation of models with semantic information will increase intercompatibility between CellML and other modelling languages, such as SBML, by facilitating the identification of common elements.

[@lloyd2008cellml]

### Physiome Repository

Increases in the computational resources available to modellers have progressively allowed more detailed models to be created and simulated. The traditional approach of publishing a human-readable description of a model in an academic journal, and expecting reviewers and readers to implement the model from the manuscript alone, is becoming less feasible. It is therefore important for modellers to share machine-readable descriptions of models. This has led to the development of model description languages, such as CellML (Cuellar et al., 2003) and SBML (Hucka et al., 2003), standardized model processing libraries such as the CellML API (Miller et al., 2010) and libSBML (Bornstein et al., 2008), and model repositories such as the CellML model repository (Lloyd et al., 2008), BioModels Database (Li et al., 2010) and JWS online (Olivier et al., 2004).

From its creation in 2000 until June 2009, the CellML model repository represented a relatively simple storage facility for CellML model files. Although all the models in the repository were freely accessible to the public, there was no mechanism in place to promote the sharing of models with their revision history intact. Furthermore, collaboration between several researchers is often required during the development of a model. Collaboration on a model can be greatly simplified by a tool which records the change history of a model, and makes that history available to other collaborators. Finally, once a model is ready to be published, it must be indexed and presented so that it can be easily searched for and viewed, thereby avoiding unnecessary duplication of modelling efforts. Since it was not possible to extend the original repository software to support these more advanced usage requirements, a complete rewrite was required, and the Physiome Model Repository 2 (PMR2) was created. Here, we introduce PMR2 as a solution to the above concerns, and discuss the advantages it provides to the modelling community.

Previous Section
Next Section
2 IMPLEMENTATION

Unlike the previous version of the CellML model repository, PMR2 is file format agnostic, meaning that it has no restrictions on what it can store. For example, SBML1 and FieldML (Christie et al., 2009) models can be stored alongside models in CellML and other formats. However, in order to properly handle (display, edit, etc.) these, there is a need to implement plugins for each different format. In addition to the model files, it is possible to upload additional supplementary data with a model, including images, software-specific information and even the original experimental data on which the model is based.

2.1 Workspaces, distributed version control systems and model revision history
All the files related to a particular model are stored together in PMR2 within a defined workspace, which can be regarded as a folder. The implementation of workspaces uses a distributed version control system (DVCS) called Mercurial (O'Sullivan, 2007). By providing version tracking, this system ensures that users within a group cannot accidentally overwrite or purge changes of other users. Furthermore, each change made to a model, or its associated files, is recorded as a single changeset: a time-stamped, informative comment from an identifiable user, which describes the changes they have made. As model files are progressively altered, the changesets preserve the history of model development. Finally, even if two users simultaneously change the same model file, distinct changesets allow their work to be later merged in a controlled manner.

Another advantage associated with using a DVCS is that it allows users to collaborate directly with each other, independent of a centralized online repository, as collaborators of any particular model will have a complete clone of the workspace with the model and related files they are working on. This allows each individual collaborator to work and commit changes to their local copy, creating new changesets which may then be shared between themselves, or pushed to a centralized repository when their work is ready to be reviewed or released.

2.2 CellML 1.1 and embedded workspaces
The previous version of the model repository software could only handle CellML 1.0 models. By introducing the concept of workspaces, PMR2 has enabled the storage of CellML 1.1 models: models that use the import feature can reference components and units from other existing models. PMR2 version 0.2 has developed this concept further by including support for embedded workspaces, in which one or more workspaces can be included, by reference, into another workspace. Embedded workspaces are intended to manage the separation of the core model from its subcomponents, and thereby facilitate the sharing and reuse of model components independently from the source model. As this separation enables the development of the subcomponents to proceed independently of the main model, the version of the workspaces embedded is also tracked. Changes made to a workspace which has been embedded in another workspace will not affect the embedding workspace until the author explicitly chooses to update the version to use. This gives the author the opportunity to review the changes to the embedded workspace, and ensure that they won't adversely affect the models in the embedding workspace. Finally, embedded workspaces enable the import of components via relative URLs, thus promoting modular model development.

2.3 Model exposures
In addition to the concept of a workspace as a folder, the other main feature of PMR2 is the presentation view of the model and any associated data which may be within the workspace. As the contents of the workspace at the revision corresponding to any changeset are immutable, one can select a single changeset and create an exposure from it. Presently, creating an exposure leads to both the generation of the presentation view of the contents of a workspace as at the selected revision, and to the exposure's URL being included in the main repository category listings. Currently, a curator may annotate their assessment of the quality of the coded version of the model using curation stars.

PMR2 has been designed to be extensible to enable the support of the range of presentation styles required for the different file types. This requires a system where plug-ins can be installed with ease onto an instance of PMR2; we have implemented and built this system on the Zope Component Architecture (Baiju, 2007), which makes use of the adapter pattern (Gamma et al., 1995) to register and activate plugins based on their names. This system allows software developers to construct specific plugins, to generate the presentation styles required for any particular model type, which can be installed and enabled on an instance of PMR2. This enables modellers to use them to render pages to describe models, or activate specific browser plug-ins to create a richer web interface for viewing models.

The access control and presentational layer of PMR2 is managed by Plone (Aspeli, 2007), a Content Management System. The access control features of Plone allow authorized users to manage permissions for other users, such as allowing a user to view a private workspace, push changesets, create exposures and update workflow states such as expiring exposures.


PMR2 is accessible to the end user over a web interface. Exposure pages in a PMR2 based repository can be accessed simply by entering the URL of the repository into a web browser. PMR2 has been used to create the CellML Model Repository, which currently contains over 500 CellML models and can be viewed at http://models.cellml.org/. Modellers will need to use a Mercurial client to create local clones of existing workspaces.

In summary, the key features of PMR2 are:

facilitated model exchange directly between modellers, without reliance on a central repository;

a detailed revision history for each model;

user access workflows to control privacy when required; and

embedded workspaces to enable model reuse and promote modular model development.

The combination of these features, together with the CellML language and associated metadata specifications, provides a collaborative model development environment that is capable of enhancing communication throughout the modelling community.

[@yu2011physiome]

### JWS Online

JWS Online aims to provide a service to the Systems Biology community by 1) giving access to a database of curated models of biological systems, and 2) allowing the users to run these models in a web browser via an easy to use interface, and 3) helping in reviewing of manuscripts containing kinetic models. JWS Online is linked to a number or research initiatives: SysMO-DB, The Virtual Liver, and UniCellSys, and universities and research institutes: Stellenbosch University, Vrije Universiteit Amsterdam, Manchester University and the Centre for Plant Integrative Biology. In addition JWS Online is an important component of an ambitious research initiative: The Silicon Cell.

JWS Online is a repository of kinetic models,
describing biological systems, which can be interactively run
and interrogated over the Internet. It is implemented using a
clientserver strategy where the clients, in the form of web
browser based Java applets, act as a graphical interface
to the model servers, which perform the required numerical
computations.
Availability: The JWS Online website is publicly accessible
at http://jjj.biochem.sun.ac.za/ with mirrors at http://www.jjj.bio.
vu.nl/ and http://jjj.vbi.vt.edu/
Contact: jls@sun.ac.za
OVERVIEW
Kinetic models are powerful tools for describing and understanding the behaviour of complex cellular systems. Since
the 1960s and especially in the last decade a large number
of these models have been constructed and today form
the basis for projects such as the Silicon Cell, SiC!
(http://www.siliconcell.net/). However, key problems are
often encountered by biologists who would like to study
these models. For example, no central model database exists
for kinetic models, making it difcult to nd all the relevant information needed to build and study published models.
Even when models are publicly available they often require a
specic software environment to run in. This environment
typically includes software that might be either operating
system dependent, expensive to obtain or difcult to set
up and maintain. New initiatives, such as the one by the
System Biology Markup Language (SBML) working group
(http://www.sbml.org/), are beginning to address the problem of model interchange by creating a standard language
for describing biochemical reaction networks. Using SBML,
modellers may easily exchange models between compatible
applications such as Gepasi (Mendes, 1997) or Jarnac (Sauro,
2000). Currently, only a limited number of models are available in the SBML format. A need, therefore, exists for both
a central repository of kinetic models as well as a freely
accessible, platform-independent and user-friendly modelling
interface that allows these models to be run using the Internet

On visiting the JWS Online sites, which are freely available from a growing number of international locations, the
database page contains all the currently available online
models. These range in type from those built with realistic parametersso-called silicon cell models typically
obtained from literature, e.g. Helfert et al. (2001)to core
models useful for teaching purposes. The database page also
contains links to any relevant bibliographic information and
we have established a collaboration with the SBML working
group to make SBML versions of the models in the database
available for download.
Once requested from the database, the model page is displayed, as shown in Figure 1. It consists of two main sections:
the client applet Figure 1a and its metabolic reaction scheme
Figure 1b. The applet acts as a graphical interface to the
server and three types of analyses are available: a time simulation, steady-state analysis and metabolic-control analysis. The
model parameters may easily be changed by setting their values in an input table situated on the left-hand side of the applet.
The type of analysis to be performed may be selected using
the tabbed panel on the applets right-hand side. Each analysis type has various suboptions that become available on its
selection. The time simulation allows either selected metabolite concentrations or enzyme rates to be output as required.
Metabolic control analysis (MCA) is used to study the control properties of the system at steady state (Kacser and Burns,
1973). The steady-state solution of the system may be calculated as well as various structural properties of the system
(such as the K and L matrices) (Hofmeyr, 2001), elasticities
and control coefcients. If the mouse cursor is moved over
an enzyme on the reaction scheme, the selected steps rate
equation is displayed in the lower window (Fig. 1c). All results are returned to the applet and displayed individually as
shown in Figure 1d and e.

[@olivier2004web]

### Payao

Summary: Payao is a community-based, collaborative web service platform for gene-regulatory and biochemical pathway model curation. The system combines Web 2.0 technologies and online model visualization functions to enable a collaborative community to annotate and curate biological models. Payao reads the models in Systems Biology Markup Language format, displays them with CellDesigner, a process diagram editor, which complies with the Systems Biology Graphical Notation, and provides an interface for model enrichment (adding tags and comments to the models) for the access-controlled community members.

Availability and implementation: Freely available for model curation service at http://www.payaologue.org. Web site implemented in Seaser Framework 2.0 with S2Flex2, MySQL 5.0 and Tomcat 5.5, with all major browsers supported.

Creating an extensive model of gene-regulatory and biochemical networks with the latest data is a painstaking task. Curation is essential to creating an accurate model. Yet as science and technology advances rapidly, once curated models soon become out-of-date and need to be revised constantly. Many pathways and networks are now available online via pathway databases, such as Reactome, BioModels.net, Panther Pathways and many pathway editors are available (Bauer-Mehren et al., 2009). What is needed is a framework to facilitate tracking and update mechanism for modelers and researchers in the community to contribute to the collaborative model building and curation process.

WikiPathways (Pico et al., 2008) is an effort for such a collaborative platform in the Wiki style. While the Wiki system has its strength in collaborative editing and version tracking, it does not provide access control or explicit community tagging mechanisms. In a community-driven model enrichment environment, it is effective to differentiate privileges to special interest group (SIG) members for curation activitiescommenting on existing tags, adding tags to models, annotating individual component inside a model and validating the annotations. In view of the complexity of biological pathways and the expertise of biologists in different areas, a community platform for biology requires an exquisite balance of federated resource sharing and quality control of information by a SIG of experts in the particular pathway or process. An access control privilege system allows the community to share and disseminate the knowledge, while enabling a dedicated SIG to maintain high-quality, curated information.

To provide such a curation framework, we have developed a system called Payao. The system is named after a fish aggregating device, an artificial floating raft where fish congregate and popular in Okinawa/Philippine area. Payao aims to become a biological knowledge aggregating system, which enable a community to work on the same models simultaneously, insert tags as pop-up balloon to the parts of the model, exchange comments, record the discussions and eventually update the models accurately and concurrently.

The current workflow for pathway curation has two phases working in a cyclical manner, as shown in Figure 1: pathway editing using biological pathway editors (CellDesigner) and community-driven pathway enrichment and knowledge sharing. Payao serves for enrichment phase of the curation. Payao is a web-based platform, providing an interface for adding tags and comments to the components (such as Species, Reactions and specified area) of the model, as well as community management functionality. The information on the users and tag data is stored in a relational database (RDBMS) on the server. Payao adopts community standards, accepting Systems Biology Markup Language (SBML; Hucka et al., 2003) format models and displays them in Systems Biology Graphical Notation (Le Novere et al., 2009) compliant CellDesigner (Funahashi et al., 2008) graphical notation. Curation data on Payao can be easily reintegrated into the original model via CellDesigner.

2 PLATFORM

Payao consists of the server application, client user interface and database. The server application has been implemented in Java on Seaser Framework 2.0 with S2Flex2. Tomcat 5.5 was used as the servlet container to build the web application. The client user interface has been implemented in ActionScript on Flex framework 2.0.1, which allows us to build a Rich Internet Application to visualize SBML models. The server communicates with the client via the Action Message Format (AMF3) protocol on S2Flex2, which enables us to translate between Java Objects in Seaser and Action Script Object in Flex. The server can handle CellDesigner models including SBML models and the visual information using CellDesigner API ver.4.0. It parses SBML files sent from client to create CellDesigner models, and provides the information as CellDesigner Plugin classes. The client application receives the model information and draws the model. MySQL 5.0 is used to store information on user, model and tags/comments in the database.

As Payao accepts pathway models stored in SBML format and uses CellDesigner APIs for visualization, the most suitable SBML editor for Payao is CellDesigner. In SBML format, models can capture details of biochemical process descriptions, not only proteinprotein interactions. Adopting SBML format enables the models to be easily used as the base of computational data analysis or simulation of dynamic behaviors. The Payao platform enriches the model curation process by providing a host of features for user management, tagging and model updates [detailed are available for reference in (Payao User guide, 2009)].

3.1 Community management
Forming a community is an important step for curation. Different expertise groups can contribute variety of information to the model. As web-based Payao can be accessible from all physical locations, it enables experts across the world to communicate in a collaborative curation effort.

Community is formed around a pathway model. It is the model owner who sets access control over the registered model. In the Payao system, access controls can be set by specifying the privileges to individuals as well as to user categories, such as guest, login user and model user (who are invited to access the model by the model owner). This enables a user to stage the curation process, initiate the curation within a small group (e.g. SIG) and then switch the access control of the model for public viewing.

3.2 Model management
The model owner registers and manages the SBML model. Upon registration, the model owner specifies the basic model information including, thumbnail image, references and copyright. The owner sets the access privilege to the user in three levels (browsing, adding tags, adding comments) by user categories or by individual users. The registered models can be sorted by Register Date and by Popularity. Popularity is measured by the activity level (number of tags and comments) and ranked in the list. All the registered models are listed with the thumbnails in the top screen in the right panel (Fig. 2). Registered models are stored in the database.

3.3 Community tagging and commenting
The tagging on the visually represented pathways is a characteristic of Payao, which makes the curators easy to grasp the nature of the pathway while discussing on the specific component of the pathways. Like Google Maps, tags are displayed in a bubble form attached to the items (Species, Reactions or any specified area), and click to expand and display the content of the information in the tag. Tags can specifically be keywords, links, PubMed IDs as well as free text, as shown in Figure 3. A TagSet groups a set of tags and can be color coded for ease of viewing. User-defined TagSets also allow access control features (browsing, editing and editing tags) to be set by a user, in the same way as for model access privilege settings. Thus, a user can set permissions to a My Tagset, which hides comments and tags from the community members. Inside the tag, comments can be added in the free text format. While tags anchor the points for annotation in the model, comments function serves as the discussion space.

[@matsuoka2010payao]

## Future Considerations

The development of standards for systems biology is still at a very early stage.
I have not for example considered the problem of standardizing the formats for
the experimental data that will be required for modelling. For example, there
are no current standards for representing *quantitative* proteomic or
metabolomic data, though efforts for defining a quantitative microarray format
is maturing (<www.mged.org>).

More pressing from a modelling perspective is that there is currently no agreed
way to merge smaller sub-models into larger models (composition).  One of the
few groups to have considered composition is Ginkel and Kremling [@Promot2000].
They have examined possible extensions to SBML to allow SBML to represent
sub-models and models composed of sub-models. Additional issues include
distinguishing different kinds of models, particularly ODE and stochastic
models, currently there is no means to identify the kind of model an SBML file
represents other than to use specific annotations. One unfortunate side-effect
of using XML is the temptation to omit a detailed semantic specification. XML is
often vaunted as a desirable technology because it is easily parsed, however,
parsing and syntax checking is a very easy task to implement, the real
difficulty comes when semantic checks are required and current XML technology
offer no assistance in this task.

# Platforms

## Modeling

### VCell

Much of the current software development in the systems biology community
concentrates on the development of stand-alone applications.  Most of these
tools are not easily extensible and many of them offer nearly identical
functionality. One of the problems that currently plagues systems biology is the
continual reinvention of the same kind of tool (called YADS - yet another
differential equation solver). I believe it is not too unfair to suggest that in
many cases our software capability today in systems biology is only marginally
better than the first systems biology simulation package ever written (BIOSSIM)
by David Garfinkel around 1960 [@Ga68]. In many cases even the user interfaces
are only marginally better. There are of course exceptions to this, VCell
[@VCELL] in particular comes to mind as well as tools such as Gepasi
[@Gepasi:1993] and Jarnac/JDesigner [@Sauro:Omics]. VCell is particularly suited
to spatial modelling, Gepasi is well known for its GUI user interface, the
selection of optimization methods and its ability to fit data to models, Jarnac
was until very recently (See Pysces [@Pysces2004]) the only script based
programmable modelling tool which has a fairly complete set of tools for the
analysis of time dependent ODEs and stochastic systems and finally JDesigner
because it was the first visual design model tool.


[@moraru2008virtual]

The Virtual Cell (VCell; http://vcell.org/) is a problem solving environment, built on a central database, for
analysis, modelling and simulation of cell biological processes. VCell integrates a growing range of molecular
mechanisms, including reaction kinetics, diffusion, ow, membrane transport, lateral membrane diffusion and
electrophysiology, and can associate these with geometries derived from experimental microscope images. It has
been developed and deployed as a web-based, distributed, client server system, with more than a thousand
world-wide users. VCell provides a separation of layers (core technologies and abstractions) representing biological
models, physical mechanisms, geometry, mathematical models and numerical methods. This separation claries
the impact of modelling decisions, assumptions and approximations. The result is a physically consistent,
mathematically rigorous, spatial modelling and simulation framework. Users create biological models and VCell
will automatically (i) generate the appropriate mathematical encoding for running a simulation and (ii) generate
and compile the appropriate computer code. Both deterministic and stochastic algorithms are supported for
describing and running non-spatial simulations; a full partial differential equation solver using the nite volume
numerical algorithm is available for reactiondiffusionadvection simulations in complex cell geometries including
3D geometries derived from microscope images. Using the VCell database, models and model components can be
reused and updated, as well as privately shared among collaborating groups, or published. Exchange of models
with other tools is possible via import/export of SBML, CellML and MatLab formats. Furthermore, curation of
models is facilitated by external database binding mechanisms for unique identication of components and by
standardised annotations compliant with the MIRIAM standard. VCell is now open source, with its native model
encoding language (VCML) being a public specication, which stands as the basis for a new generation of more
customised, experiment-centric modelling tools using a new plug-in based platform.

The reason for the repetitive nature of software in systems biology is that
almost each and every group engaged in computational systems biology writes
their own simulation package. Given the time constraints on the project, the
software will only reach a level of maturity that is often equivalent to
BIOSSIM. As a result, the provision of software does not appear to advance.

A number of groups have recognized this problem and instead of developing single
isolated applications, they have chosen to develop a software infrastructure
that permits and encourages extensibility and code reuse. The later is extremely
important as it allows developers to build on existing code which in turn leads
to new and interesting software tools. In this section I will describe three
such environments, SBW, BioSPICE and BioUML. All three environments are open
source.

### Systems Biology Workbench SBW

SBW (Sauro et. al., 2004) is an extensible software framework that is both
platform and language independent. Its primary purpose is to encourage code
reuse among members of the systems biology community.  Developers can run SBW on
Linux, Windows or Mac OS and can develop software in a variety of different
languages including C/C++, Java, Delphi, FORTRAN, Matlab, Perl, Python and any
.NET language (e.g. Visual Basic or C\#). The SBW was originally developed in
parallel with SBML (Systems Biology Markup Language) as part of the Symbiotic
Systems Project ERATO project at Caltech, Pasadena (Subsequent development was
supported by DARPA through the BioSPICE program and development is now focused
at the Keck Graduate Institute).

The central component of SBW is the broker, which is responsible for
coordinating interactions among the different resources connected to it.  These
resources include simulation engines, model editors, SBML translators,
databases, visualization tools and a variety of analysis packages. All modules
in SBW connect via defined interfaces, which allows any one of the modules to be
easily replaced if necessary. The key concept in SBW is that any new module may
exploit resources provided by other modules; this dramatically improves
productivity by allowing developers to build on existing tools rather than
continuously reinvent.

In the past other similar architectures have been developed, most notably CORBA.
When SBW was being developed, CORBA was seriously considered but a number of
problems arose, first the learning curve for CORBA is very steep which means
that it is out of reach for most developers except highly skilled individuals;
the aim of SBW was to allow the average computational biologists to develop new
SBW modules hence the programming model had to be simple. Finally, there were
very few open source equivalents to the SBW broker and many of them were
incompatible with each other.

![The Systems Biology Workbench (SBW) is a dynamic open-source distributed
system. Client modules can attach and detach at runtime.  Client modules can be
written in a variety of languages, including, C/C++, Java, Delphi, FORTRAN,
Python, Perl, Matlab, any .NET language.  Data is exchanged between modules via
binary messages which can include any combination of bytes, integers, floating
point, complex numbers, strings, arrays and lists.  Currently the available
modules include, simulators, model editors, SBML manipulation, math library,
frequency analyzer, bifurcation discover and analysis modules, structural
analysis modules and others. Further details to be found at
<www.sys-bio.org>\label{Figure:sbw}](images/sbwFig.eps)

An SBW module (the client) provides one or more interfaces or services.  Each
service provides one or more methods. Modules register the services they provide
with the SBW Broker. The module optionally places each service it provides into
a category. By convention, a category is a group of services from one or more
modules that have a common set of methods.

One of the key advantages of SBW is its language and OS neutrality. At a stroke
this eliminates the irrational language and operating systems wars that often
plague software development. In addition to providing support for multiple
languages there is also the facility to automatically generate web services from
any SBW module (Frank Bergmann, personal communication).

#### Messaging Protocols

At the heart of SBW is the messaging protocol used to exchange information
between the different modules. For efficiency reasons, messages that are
exchanged between modules are simple sequences of binary data. For each
programming language there is a language binding library which takes care of
much, if not all, of the housekeeping necessary to operate through SBW,
including connection and transmission of data. In addition, issues such as
little and big-endian byte ordering need not concern the developer as this is
taken care of automatically by the binding libraries. Each binding also provides
the necessary message packing and unpacking logic and exposes functionality in
the form of an easy-to-use API.

Since SBW message passing is based on TCP/IP sockets it is straight forward to
run SBW across the internet or more significantly across computational nodes on
a supercomputer cluster.

### JSim

JSim [1] is a Java-based [2] simulation system for building quantitative numeric models and 
analyzing them with respect to experimental reference data. JSim was developed primarily for
generating model solutions for use in designing experiments and analyzing data in physiological
and biochemical studies, but its computational engine is general and equally applicable to 
solving equations in physics, chemistry, and mechanics. JSim has been under development at the
National Simulation Resource for Mass Transport and Metabolism (NSR) since 1999. JSim uses
a model specification language, MML (for Mathematical Modeling Language) which supports
ordinary and partial differential equations, implicit equations, integrals, summations, discrete
events, and allows calls to external procedures. JSim's compiler translates MML into Java code
in which the numeric results are calculated. Within the JSim graphical user interface (GUI) users
adjust parameter values, initiate model runs, plot data, and perform behavioral analysis,
sensitivity analysis, parameter optimization for curve fitting. Alternatively one can use JSim's
command line interfaces (jsbatch and jsfim). JSim's capabilities are more advanced than previous
NSR software systems SIMCON [3], for simulation control, and XSIM [4] for X-terminal
operation. JSim source code, binaries (for Windows, Macintosh and Linux) and documentation 
are available free for non-commercial use at http://physiome.org/.

### Cell Designer

[@funahashi2003celldesigner]

[@funahashi2008celldesigner]

Systems biology is characterized by synergistic integration of theory, computational modeling, and experiments [1]. Identification of the logic and dynamics of gene-regulatory and biochemical networks is a major challenge of systems biology. From the view of computational modeling, a model is used to understand the dynamics of biological phenomena. The model consists of molecules and reactions that represents gene regulatory and biochemical network (such as transcription, translation, proteinprotein interaction, enzymatic reaction, etc.), and contains a mathematical equation for each reaction. So that the model contains mathematical equations inside, it would be possible to simulate the dynamics of the model and compare the simulation results with their experiments; even more, it would be possible to tune the parameters in the model to fit with the experimental results. This workflow is important to understand unknown function or structure of biological phenomena, so development of software infrastructure to support this workflow is essential for systems biology research. While the software infrastructure is one of the most crucial components in systems biology research, there has been almost no common infrastructure or standard to enable integration of computational resources. For example, researchers built their model with their specific application or inside their simulator as a source code so that it was difficult to port their model to be used on other applications. Since there was no gold-standard software for systems biology research, at that time, researchers had to use multiple applications to solve their problem. They had to switch their software to run simulations, analyze the model, and fit parameters with their experimental results. To solve this problem, the Systems Biology Markup Language 1 (SBML) [2], [3] and the Systems Biology Workbench 2 (SBW) have been developed [4]. SBML is an open, Extensible Markup Language (XML)-based format for representing biochemical reaction networks, which enables researchers to share their model between different software applications, while SBW is a modular, broker-based message-passing framework for simplified intercommunication between applications. Rapid acceptance of this standard is proved by the fact that more than 110 simulation and analysis software packages already support SBML or are in the process of supporting the standard.

We believe that the standardized technologies, such as SBML, SBW, and Systems Biology Graphical Notation (SBGNa graphical notation for network diagrams of biological models), play a critical role as the software platform to tackle this challenge. As an approach, we have developed CellDesigner [5], a process diagram editor for gene-regulatory and biochemical networks. CellDesigner currently supports model creation, simulation, and database integrationthose features are significant for users willing to create their model from scratch.

The current version (3.5.2, as of June 2008) of CellDesigner has the following features:

representation of biochemical semantics;
detailed description of state transition of proteins;
SBML compliant (SBML Level-1 and Level-2 Version-1);
integration with SBW-enabled simulation/analysis modules;
integration with native simulation library (SBML ODE Solver [6]);
database connectivity;
platform independent.
The aim of developing CellDesigner is to supply a process diagram editor utilizing standardized technology (SBML and SBGN in this case) for every computing platform, so that it could confer benefits to as many users as possible. By using the standardized technology, any model can be easily ported to other applications, thereby reducing the cost to create a specific model from scratch. The main standardized features that CellDesigner supports are summarized as graphical notation, model description, and application integration environment. The standard for graphical notation plays an important role for efficient and accurate dissemination of knowledge [7], and these standards for model description enhance the portability of models among various software tools and aid human readability. Similarly, the standard for application integration environment will help software developers to provide the ability for their applications to communicate with other tools.

A. Symbols/Expressions and SBGN

CellDesigner supports graphical notation and listing of symbols based on a proposal by our group [7]. While we have proposed our original notation system, graphical notation has now been developed as an international community based activities called SBGN.3 So far, several graphical notation systems already have been proposed [8], [9], [10], [11], [12]. The goal of SBGN is to design a graphical notation system expressing sufficient information in more visible and more unambiguous way, as we proposed [7]. We expect that these features will become part of the standardized technology in systems biology field. The key components of SBGN are:

to allow representation of diverse biological objects and interactions;
to be semantically and visually unambiguous;
to be able to incorporate other notations;
to allow software tools to convert a graphically represented model into mathematical formulas for analysis and simulation;
to have software support to draw diagrams;
to make the notation scheme of SBGN freely available.
To accomplish the above requirements for the notation, we first decided to define a notation by using a process diagram [7]. The notation graphically represents state transitions of the molecules involved. In the process diagram representation, each node represents the state of the molecules and complex, and each arrow represents state transitions among the states of a molecule. In the conventional entity-relationship diagrams, an arrow generally represents activation of the molecule. However, this confuses the semantics of the diagram, as well as limits possible molecular processes that can be represented [7]. A process diagram represents a more intuitive way for model definition than entity-relationship diagrams. One of the reasons is that the process diagram could be explicitly represented as a temporal sequence of events whereas an entity-relationship cannot. For example, in a process of mitosis-promoting factor (MPF) activation in cell cycle, Wee1 phosphorylates residues of Cdc2 (Cell Division Cycle 2), is one of the components of MPF (Fig. 1). However, MPF is not yet activated by this phosphorylation. If we use an arrow for activation, we cannot properly represent the case. In the process diagram, on the other hand, whether a molecule is active or not is represented as a state of the node instead of an arrow symbol for activation. Promoting and inhibition of catalysis are represented as a modifier of state transition using a circle-headed line and a bar-headed line, respectively.

### BioUML

BioUML (<www.biouml.org>), developed by Fedor Kolpakov and his team, is a Java
framework based around eclipse and targeted at the systems biology community.
The authors state that the utility of BioUML covers access to databases with
experimental data, tools for formalized description of biological systems
structure and functioning, as well as tools for their visualization and
simulations. BioUML is at an early stage of development but the central idea is
of a plugable environment where plugins written in Java are used to extend the
functionality of the framework. Much work remains to make the BioUML usable for
the average biologists but the idea is interesting although the requirement to
write all code in Java is limiting and some means to permit alternative language
bindings would be useful. Recently the BioUML team developed a SBW interface,
which permits access to plugins that are written in many different languages.

## Simulation 

### Road Runner

 RoadRunner (Bergmann and Sauro, 2006) and SBML ODE Solver (Machn et al., 2006). This process was largely possible through the use of the Systems Biology Workbench (SBW) (Bergmann and Sauro, 2006), a resource sharing framework that allows applications to share functionality with each other. Jarnac and Roadrunner are already included with an SBW installation. Emery Conrad enabled Ocill8 for use in the SBW framework. For the comparison we wrapped COPASI and SBML ODE Solver to be available for use within SBW.
[@bergmann2008comparing]


roadRunner: In an effort to create a fully SBML compliant simulator we next focused on creating roadRunner. 
Instead of interpreting model equations, roadRunner will 
compile the model equations dynamically, which results in 
much improved performance  when compared with traditional simulators. RoadRunner uses the integrator CVODE 
and NLEQ (ZIB 2003) for steady state analysis. To further 
speed up the simulation, the model is separated into a system of independent and dependent variables. This separation process is described in detail in (Vallabhajosyula et al. 
2006). Again, roadRunner has been written completely in 
C#. Provided that CVODE and NLEQ are available for a 
given operating system, roadRunner will run on that operating system. Thus, all major operating systems are supported

[@bergmann2006sbw]

### COPASI

Simulation and modeling is becoming one of the standard approaches to understand complex biochemical processes. Therefore, there is a growing need for software tools that allow access to diverse simulation and modeling methods as well as support for the usage of these methods. These software tools should be compatible, e.g. via file standards, platform independent and user friendly to avoid time-consuming conversions and learning procedures. In addition, the software should be actively maintained and updated by its authors.

Standard methodology used in the field comprises, e.g. the deterministic [integration of ordinary differential equations (ODEs)] and stochastic [e.g. using Gillespie's algorithm; Gillespie (1976)] simulation of reaction networks, the computation of steady states and their stability, stoichiometric network analysis, e.g. computing elementary modes (Schuster et al., 1999), sensitivity analysis [metabolic control analysis; Fell (1996); Heinrich and Shuster, 1997], optimization and parameter estimation.

In order to meet this need for software in the field, several tools have been developed and released recently (see http://www.sbml.org). Most tools offer specific functionalities, e.g. stochastic simulations of reaction networks (Le Novre and Shimizu, 2001) and flux analysis (Klamt et al., 2003). However, some tools contain whole suites of functionalities, e.g. simulation, flux and control analysis (Tomita et al., 1999; Sauro et al., 2003; Meng et al., 2004).

In order to improve the compatibility of these tools, markup languages such as SBML (Hucka et al., 2003) and CellML (Lloyd et al., 2004) were created to allow model exchange. Many tools are now able to read and write models in these file formats.

Here we present a new programCOPASI (COmplex PAthway SImulator)which combines all of the above standards and some unique methods for the simulation and analysis of biochemical reaction networks. COPASI is the successor to Gepasi (Mendes, 1993, 1997) and is available for all major operating systems (Linux, Mac OS X, Windows, Solaris). As described below, COPASI supports non-expert users by, for example, automatically converting reaction equations to the appropriate mathematical formalism (ODEs or reaction propensities). The general features of COPASI are described briefly and those that are unique are discussed in more detail.

Previous Section
Next Section
GENERAL FEATURES

COPASI is a stand-alone program that can be used through two different executable versions: a graphical user interface (CopasiUI) and a command line version (CopasiSE) that only contains the calculation engine. CopasiSE is intended for situations in which the user is not expected to interact with the software. The following use cases are examples of situations in which it would be used: (i) when third-party programs manipulate COPASI files, call CopasiSE to produce results, and then inspect and continue generating other COPASI files depending on results; (ii) to run simulations in the background, which is useful when the run takes a long time; (iii) as a simulation engine for specialized front-ends that may be created by others. Essentially, CopasiSE allows much flexibility of execution and control, with the penalty that this version can only run numerical procedures, not edit models. CopasiUI, on the other hand, is the complete version of the program and is the one that we expect users to run most often. CopasiUI provides a full graphical user interface (GUI), including functions for creating and editing models and plotting results. In terms of execution of the numerical procedures (simulation, optimization, etc.) the two versions are essentially equal, except that CopasiUI may be slightly slower when producing graphical output. In practice the two executables share the same source code and are expected to produce exactly the same results.

COPASI's graphical interface is similar to Windows Explorer in operation, where there is a vertical window on the left with a set of functions organized in a hierarchical way; on the right there is a larger window that contains all of the controls to operate the function selected on the left (Fig. 1). The major group of functions in the program are as follows:

Model, where the model can be edited and viewed according to a biochemical or mathematical perspective.

Tasks, consisting of the major numerical operations on the model: steady state, time course, stoichiometry, metabolic control analysis and Lyapunov exponents. Below each task an entry with results will appear after the task has been run.

Multiple Tasks, which are operations repeating elementary tasks: parameter scanning, optimization and parameter estimation.

Output is where plots and reports are defined and listed.

Functions containing the mathematical functions available, such as the rate laws.


View larger version:
In this page In a new window
Download as PowerPoint Slide
Fig. 1
COPASI's interface for model editing: the left panel contains all of the possible actions organized in a hierarchy; the right panel changes according to the selection on the tree control. (A) kinetic functions: the mathematical formula of the kinetic rate laws is displayed together with the specifications of the kinetic parameters including their dimensions. (B) Parameter overview; listing all model parameters in a single table. including initial conditions and kinetic parameters. (C) Metabolite overview: where all molecules of the model are listed and their properties edited.

Model editing is done through tables and specialized widgets (Fig. 1) and the program provides various ways of editing the model items. For example, the user can change the value of kinetic constants in the single reaction widget (which provides detailed information about a single reaction), or in the parameter overview widget (Fig. 1B). There are two major views of the model: one set of widgets provides a view from the biochemical perspective, where the model is composed of reactions, compartments, metabolites, etc.; while another provides a mathematical view, where the model is composed of variables and differential equations. In the current version of COPASI the mathematical representation is for viewing only. The advantage of having two alternative views is that we expect different users to have different backgrounds and be more comfortable with one view or the other. This also provides a common software tool that may act as a translator of concepts for collaborators from different backgrounds.

Developing a model usually means combining information, e.g. kinetic data, from different sources. One possible source of errors in this process is the conversion of units of concentrations, kinetic parameters, etc. Although COPASI cannot do automatic conversion of such units, it provides help to the user in the following way: When a kinetic function is entered (or chosen from the integrated kinetics library) COPASI determines the units of the kinetic parameters from an analysis of the rate law, where possible. This allows the user to easily determine if available kinetic parameters from one source match a kinetic function from another source. To our knowledge, COPASI is currently the only software tool that is able to do so.

COPASI's native file format is based on XML and documentation of its schema is available so that other tools can write (or read) it. COPASI can also read Gepasi files, providing backwards compatibility with its predecessor. Finally and as explained below in more detail COPASI is able to import SBML either level 1 or level 2, and thus it can obtain models from many sources, such as other simulators, model databases, pathway databases and so on (see http://www.sbml.org). To store the complete model information, including task settings and output definitions, COPASI uses its own file format. Models can also be exported in SBML and the program can write the ordinary differential equations in plain C files (ready to be included in other C/C++ programs) and in Berkeley Madonna's format (http://www.berkeleymadonna.com), a popular program for nonlinear dynamics which does not import SBML.

COPASI can also output results of its various functions in two ways: report files and plots. The user can define report files containing any number of simulation results, parameters and other model items; this is done through an interface where all these items are organized in a hierarchy. In addition, the software has a number of predefined report formats that cover most of the common use cases. Results of operations are also presented directly in the user interface, in table format, which can be saved to tab-delimited files easily. Examples of such tables presented directly are time courses, the Jacobian matrix, matrices of control coefficients, etc. Tab-delimited files can also be saved directly from the plot window. Plotting support is built-in and plots, such as reports, can be defined in very flexible ways. COPASI supports xy line plots and distribution histograms (a feature not commonly found in simulators, Fig. 2), scales can be linear or log-transformed, and the plot window allows zooming and panning.


View larger version:
In this page In a new window
Download as PowerPoint Slide
Fig. 2
Example of COPASI plotting capabilities, depicting a stochastic simulation of a model with oscillations. The light gray curve is the trajectory of the system in a 2D phase space projection. The black curve is a histogram of the distribution of the particle numbers of one of the species during the oscillation.

COPASI calculates time courses using a deterministic or a stochastic framework, depending on the user preference. For deterministic solutions, the LSODA integrator is used (Petzold, 1983), whereas for stochastic solutions the GibsonBruck version (Gibson and Bruck, 2000) of the Gillespie method (Gillespie, 1976) is applied (Fig. 2). In addition, a hybrid method that we developed is also available and described below. The user can easily switch between these methods by choosing from a drop-down list. COPASI can automatically convert chemical kinetic rate laws into their appropriate discrete stochastic equivalents, although this feature can be disabled when desired. Generally, for not too small particle numbers, the propensity of a reaction (the differential probability that a reaction event will happen in the next small time interval) is proportional to the reaction rate, which is given by the kinetic function of the reaction. This has been shown for mass action kinetics (Gillespie, 1976) and is at least approximately true under certain conditions for other kinetic types, such as MichaelisMenten (see discussion below). For very small particle numbers, however, this relation does not necessarily hold. Consider, for example, a second-order mass action reaction (2SP). Its forward reaction rate is proportional to the square of the number of substrate particles. On the other hand the probability of a reaction event, calculated from the probability that two substrate particles meet (Gillespie, 1976), is proportional to , where NS is the number of particles of the substrate. When presented with a model that was written for the deterministic simulation paradigm, COPASI can automatically do the conversion from N2 to N*(N1), thus enabling a transparent switch from deterministic to stochastic simulation.

Another basic simulation function is the calculation of steady states, which is carried out by a combination of the damped Newton method and forward or backward integration (using LSODA). The steady state can also be characterized with linear stability analysis (Stucki, 1978) and metabolic control analysis (Fell, 1996).

COPASI determines structural (stoichiometric) properties of the biochemical network. Mass conservation is calculated using the algorithm described by Vallabhajosyula et al. (2006) that uses Householder reflections. (Vallabhajosyula et al. mentioned that COPASI used Gauss elimination for this purpose, which was true at that time; however, since then we have switched to using this more efficient algorithm.) Elementary flux modes, a unique set of the smallest possible sub-networks that still allow a steady state (Schuster et al., 1999) are calculated using our implementation of the METATOOL algorithm (Pfeiffer et al., 1999).

COPASI is equipped with a number of diverse optimization algorithms that can be used to minimize or maximize any variable of the model, following the scheme proposed by Mendes and Kell (1998). Two algorithms are based on estimating derivatives of the objective function, steepest descent and LevenbergMarquardt (Levenberg, 1944; Marquardt, 1963; Goldfeld et al., 1966); a direct search algorithm, which is based on geometric concepts, the HookeJeeves method (Hooke and Jeeves, 1961); four evolutionary algorithms, evolutionary programming (Fogel et al., 1992), genetic algorithm [a version with floating point encoding; Michalewicz (1994)], evolution strategy with stochastic ranking (SRES; Runarsson and Yao, 2000) and a genetic algorithm with stochastic ranking; finally, there is also a simple random search algorithm.

The optimization algorithms are also used for estimating parameter values that best fit a set of data provided by the user. To this end, COPASI reproduces the functionality of Gepasi (Mendes and Kell, 1998) and exceeds it by allowing mixtures of time course and steady-state data to be used simultaneously (Gepasi could only deal with one of these types of data at a time).

Finally, COPASI is able to compute the Lyapunov exponents and the divergence of a given system (as described below in more detail).

Previous Section
Next Section
ARCHITECTURE

Our goals for COPASI are ease of use, availability of complex analysis methods and fast reliable simulation, which seem to be contradictory. In addition the software needs to be available for the majority of scientists, i.e. the main operating systems need to be supported. These requirements drove the architectural design.

Ease of use requires an interactive GUI. However, the size and complexity of some of the simulation tasks such as Parameter Estimation requires speed and batch processing capabilities. To address both needs we chose C++ as the programming language and made a clear separation between the representation and the computing layer. This results in two separate versions of the program, one with a GUI and the other with a command line interface, that nevertheless share a common code base. The code itself is structured into smaller packages such as the model, the time course integration or the parameter estimation libraries to enhance maintainability.

The software is available for the following operating systems: Microsoft Windows (Windows 98 and above), Linux, Mac OS X (PowerPC, runs also on Intel) and Sun Microsystems Solaris (version 8 and above on SPARC). This cross platform portability has been achieved by adhering to the ANSI C++ standard and relying on toolkits and libraries that are available on the major operating systems.

The GUI was constructed based on the QT toolkit (Trolltech, Inc., Oslo), which is the essential portability layer (i.e. produces different OS versions from the same source code). This results in a program that has the expected look and feel of the underlying operating system. Since the users are provided with an interface following the same style and layout as other applications on their computer the usability is greatly enhanced. In addition support libraries for QT are available, which allow us to provide convenient plotting of results (Qwt project, http://qwt.sf.net) and rendering of mathematical expressions (QT Solutions, MML Widget).

For reliable and fast computation COPASI uses standard numerical libraries: LAPACK (Anderson et al., 1999) for linear algebra, BLAS (Lawson et al.,1979) for matrix and vector operations, and LSODA (Petzold, 1983) from ODEPACK (Hindmarsh, 1983) for integration of ODEs. There are optimized versions of LAPACK and BLAS for the major hardware and operating system that we have used to build the binary versions, providing COPASI with a little extra performance. For example, the Intel BLAS version uses special features of Pentium processors, whereas the Apple BLAS version uses the AltiVec unit of the PowerPC processors.

[@hoops2006copasi]

## Online Platforms

### JWSOnline

### SBW

### CycSim

Summary: CycSim is a web application dedicated to in silico experiments with genome-scale metabolic models coupled to the exploration of knowledge from BioCyc and KEGG. Specifically, CycSim supports the design of knockout experiments: simulation of growth phenotypes of single or multiple gene deletions mutants on specified media, comparison of these predictions with experimental phenotypes and direct visualization of both on metabolic maps. The web interface is designed for simplicity, putting constraint-based modelling techniques within easier reach of biologists. CycSim also functions as an online repository of genome-scale metabolic models.

Availability: http://www.genoscope.cns.fr/cycsim

Constraint-based modelling (Price et al., 2004) is a framework, simple and abstract enough to allow tractable modelling of metabolism at genome-scale, providing direct insights into the genotypephenotype relationship. Constraint-based models (CBM) consist of a stoichiometric representation of the whole-cell metabolism together with a set of constraints on reaction fluxes. A wide variety of computational methods have been developed for this framework to characterize metabolic capabilities, help to discover new reactions, simulate scenarios of metabolic evolution or design experimental strategies to investigate metabolic behaviours (Feist and Palsson, 2008).

A few simulation tools (Becker et al., 2007; Beste et al., 2007; Lee et al., 2003; Sympheny, www.genomatica.com) and model repositories (Le Novre et al., 2006; BiGG, unpublished data, http://bigg.ucsd.edu) have been proposed to the growing community of CBM users. These software tools have been limited in their usefulness to biologists for several reasons. First, most are either commercial, or add-ons to commercial platforms (e.g. MATLAB, http://www.mathworks.com). Next, they are typically directed at users with a background in modelling. Lastly, these tools are not designed to explore the biochemical and genomic knowledge underlying the metabolic models. Currently, the most convenient tools to reconstruct metabolic networks from genome annotation are databases of reference pathways such as BioCyc (Karp et al., 2005) and KEGG (Kanehisa et al., 2008). These databases provide descriptive and queriable views of the genetic and biochemical components of metabolism, but do not support modelling, simulation or prediction.

To address these shortcomings, we introduce CycSim, a web platform which supports in silico experiments with a variety of metabolic models, puts both the design and the results of these experiments in the visual context of reference pathways databases and allows confrontation with experimental data.

Previous Section
Next Section
2 FUNCTIONALITIES

Predictions: CycSim supports in silico experiments with metabolic models. Each experiment consists in selecting a wild-type strain, choosing one or several genetic perturbations (e.g. knockout), and picking a set of growth media. Growth phenotype predictions are then generated for all (mutant, medium) pairs. These predictions can be compared against experimental growth phenotypes when available (Fig. 1). Two prediction methods are implemented: flux balance analysis and metabolites producibility check (Feist and Palsson, 2008). For any given (mutant, medium) pair, CycSim can also compute a flux distribution that is compatible with the model constraints and the objective function.

[@le2009cycsim]

### Web Applications

#### `snap`

#### SBML to MATLAB Translator

## Commercial

### MATLAB SimBiology

SimBiology provides a graphical environment and programmatic tools to model, simulate, and analyze dynamic systems, focusing on pharmacokinetic/pharmacodynamic (PK/PD) and systems biology applications. It provides a block diagram editor for building models, or you can create models programmatically using the MATLAB language. SimBiology includes a library of common PK models, which you can customize and integrate with mechanistic systems biology models.

A variety of model exploration techniques let you identify optimal dosing schedules and putative drug targets in cellular pathways. SimBiology uses ordinary differential equations (ODEs) and stochastic solvers to simulate the time course profile of drug exposure, drug efficacy, and enzyme and metabolite levels. You can investigate system dynamics and guide experimentation using parameter sweeps and sensitivity analysis. You can also use single subject or population data to estimate model parameters.

Graphical editor for PK/PD and systems biology modeling
Ordinary differential equations (ODEs) and stochastic solvers
Library of pharmacokinetic models
Parameter estimation techniques for single subject and population data, including nonlinear mixed-effects models
Sensitivity analysis and parameter sweeps to investigate how parameters affect system dynamics
Diagnostic plots for individual and population fits
Methods for creating dosing schedules

SimBiology lets you represent a model of a biological or a pharmacological mechanism just as you would draw it on a piece of paper. Using a reaction network modeling approach, SimBiology lets you model drug pharmacokinetics and pharmacodynamics (PK/PD), biological systems, and chemical reaction kinetics.

SimBiology automatically constructs the ODEs based on the model structure and the math underlying individual interactions, providing an alternative to an ODE-based representation of the model.

You can create models using a block diagram editor or programmatically. You can also import models from a built-in library of PK models or a Systems Biology Markup Language (SBML) file.

Building Models

SimBiology models consist of three basic building blocks:

Species represent dynamic states of the model, typically the concentration or amount of an entity, such as a drug, protein, gene, or metabolite. Species are connected to each other via reactions.

Reactions represent interactions between one or more species, such as transformation, flow, transport, and binding processes.

Compartments represent physically isolated regions in which you can associate sets of species.

Specifying Model Dynamics

SimBiology provides two additional modeling constructs for specifying model dynamics:

Rules let you define relationships between model components that cannot be represented as a reaction. For example, you can set the value of a parameter as a function of the value of another parameter or the concentration of another species.

Simulation events let you define a sudden, discrete change in model behavior based on a condition you specify. For example, you can use an event to reset a parameter value at a certain time point or when a certain concentration threshold is crossed.

Exploring a Model

SimBiology lets you explore what-if scenarios without creating multiple copies of the same model. You can create model variants to store a set of parameter values or initial conditions that is different from the base model configuration. For example, you can use model variants to store parameter values for multiple cell lines, drug compounds, or mutant strains. Similarly, you can create multiple dosing strategies and apply them to evaluate model responses.

SimBiology lets you estimate model parameters by fitting the model to experimental data. You can fit time-course data from a single individual using nonlinear regression. You can also use nonlinear mixed-effect (NLME) models to simultaneously fit data from a population using the following algorithms:

Stochastic Approximation Expectation-Maximization (SAEM)
First-order conditional estimate (FOCE)
First-order estimate (FO)
Linear mixed-effects approximation (LME)
Restricted LME approximation (RELME)
SimBiology provides standard goodness-of-fit statistics, including:

Root mean squared error (RMSE)
Standard errors for estimated parameters
Akaike Information Criterion (AIC) and Bayesian Information Criterion (BIC)
Population weighted residuals

You can simulate models using deterministic or stochastic solvers. Simulations return time and state information of model components. You can also simulate systems that incorporate discontinuities, such as events and dose administration.


Drug concentration profile. SimBiology lets you treat doses as discontinuous events.

SimBiology provides several deterministic and stochastic solvers. You can perform a deterministic simulation using MATLAB ODE solvers or the CVODE solver from the SUNDIALS suite. SimBiology also provides three stochastic solvers: stochastic simulation algorithm (SSA), explicit tau-leaping, and implicit tau-leaping.

[@simbiology][MATLAB SimBiology]

[simbiology]: http://www.mathworks.com/products/simbiology "MATLAB SimBiology"

# Applications

In recent years there has been a proliferation of software applications for the
systems biology community (See Figure \ref{figure:apps}).

![The Release of Software Tools for Computational Systems Biology over Time.
Note the spike in the last five
years.\label{figure:apps}](images/ToolsPerYear.pdf)

On the whole, many of these applications provide very similar functionality. The
distinguishing feature among them is how easy they are to install and use. The
more mature applications tend to be easier to install and have a much richer
repertoire of functionality. Many of the applications are simple wrappers around
standard ODE or Gillespie solvers and provide a simple means to load models and
run time courses.  Some of the applications fall by the wayside because the
author has lost interest or funding has stopped. It is important therefore that
what ever tool one uses, that the ability to export and import a recognized
standard (or at least a documented format) such as SBML and/or CellML be
available.

The original intention in this section was to list as many of the applications
as possible together with their capabilities but given the large number now
available it soon became clear that this task would be too great. Instead I
refer the reader to the recent paper by Hucka et.  al. (2004) where the authors
describe almost forty applications. An even larger list can be found at the
sbml.org web site.

There are some applications however that are worth mentioning specifically
because they have some special characteristic. Table 1 lists a number of
applications which are being actively maintained, have a reasonably large user
base and offer facilities that are either unique or well done. I have not
mentioned any stochastic simulators in Table 1 because many of these are still
immature.

* * * *

**Application and Description**

VCell: :   A very mature server based application that is specialized to build
and simulate large scale spatial (PDE) models - Open Source, multiplatform
[@VCELL].

Gepasi: :   This is a forms based application which has been maintained for many
years by a dedicated author, the tool is particularly adapt at carrying out
optimizations of ODE based models to data - Closed source, Windows, Linux
[@Gepasi:1993].

WinSCAMP: :   A script based GUI application, which like Gepasi has a long
tradition. Specialized for time course, steady state and metabolic control
analysis of ODE based models.
    - Source available upon request, multiplatform [@SauroF91; @SauroScamp93]

Pysces: :   This is a very complete ODE based simulation environment built
around the scripting language Python
    - Open Source, multiplatform [@Pysces2004].

Jarnac/JDesigner: :   Jarnac is a script based application, JDesigner (See
Figure 3) is a visual design tool which can use Jarnac via SBW to carry out
simulations. The simulation capabilities of Jarnac are quite extensive, offering
both ODE and stochastic simulation - Open Source, Windows, Linux [@sauro:2000;
@Sauro:Omics].

* * * *

There are also more general purpose tools available, both commercial and
open-source which are worth considering. Probably the most well known commercial
tool is Matlab (<www.mathworks.com>). Although Matlab is an excellent
prototyping tool if suffers from poor performance when simulating systems larger
than about thirty species if the model is not specified in the correct way. In
fact a number of the open-source tools are orders of magnitude faster than
Matlab. This stems from the fact that Matlab is a general purpose tool whereas
the open-source tools are specialists and are therefore more heavily optimized
for their specific application. The commercial tools require a high degree of
programming skill because they do not have facilities for representing models in
a way familiar to most biologists, instead users are required to derive the
differential equations explicitly. Platforms, such as SBW make available
translators from SBML to a variety of formats including Matlab, and in a number
of cases, users employ tools such as JDesigner to maintain the model, but use a
translator to generate Matlab (or any other supported format such as C or Java).

In addition to generic commercial modelling tools there are also now available a
number of commercial tools specifically geared for modelling cellular networks.
The most well known include Gene Networks Sciences, Berkeley Madonna and
Teranode (These can easily be located on the web by using a reliable search
engine).

## Model Analysis

As a user, one of the most important aspects that I consider is the range of
techniques that are available for analyzing the model. The purpose of building a
model is not simply to generate a predictive tool, if it were we could probably
get away with using empirical statistical techniques or machine learning
approaches such a neural nets. An additional important role of model building is
also to gain a deeper understanding into the properties of the model and to
understand how the structure of the model leads it to behave the way it does. In
order to answer these kinds of questions one needs techniques that can
interrogate the model in a variety of different ways.

Table 2 lists some of the most important techniques that are available for
analyzing models. Without these techniques, a model will often be as difficult
to understand as the real system it attempts to model; the application of these
techniques is therefore important.

* * * * 

**Approach and Description**

Connectionist Theory:
:   Connectivity studies are centered around the
    search for patterns in the way cellular networks are physically
    connected. [@BarabasiReview2004]

Structural Analysis:
:   There are a wide range of useful techniques which
    focus on the properties of the networks that depend on the
    mass conservation properties of networks. These
    include, conservation analysis, flux balance and
    elementary mode analysis [@Schuster:Book].

Cellular Control Analysis:
:   CCA (also known as metabolic control analysis)
    is a powerful technique for analyzing the
    propagation of perturbations through a network.
    There exists a very large literature describing
    applications and theory [@Fell:Book].

Frequency Analysis: 
:   Closely related to CCA is the analysis of how signals
    propagate through a network [@Ingalls2004; @RaoSauroArkin].

Bifurcation Analysis: 
:   Bifurcation analysis is concerned with the study
    of how the qualitative behavior of steady state
    solutions change with changes in the
    model parameters [@TysonNatReview2001].

* * * *
All these techniques are extremely useful in gaining insight into how a model
operates. The connectionist and structural analyses focus on the network
properties of the model, that is they do not explicitly consider the dynamics of
the model but on how the network connectivity sets the stage for generating the
dynamics of the model. The last three techniques, CCA, frequency analysis and
bifurcation analysis focus on the dynamical aspects of a model and are crucial
to gaining a deep insight into the model [@Bakker:1997; @TysonNatReview2001].

## Model Fitting and Validation

An important activity in systems biology modelling is the need to fit
experimental data to models. There isnt sufficient space to cover to any great
detail this topic but as time series data from microarray, proteomic and
metabolomic data becomes more readily available the need to fit models to
experimental data will become more acute. There are a number of issues related
to this topic, one concerns the nature of the data that is generated by most of
the current experimental techniques.  In particular, most current techniques
generate normalized data, that is absolute values are not given. This poses a
number of problems to a fitting algorithm, since the underlying model is in
terms of absolute quantities. A number of solutions are potentially available,
however none are entirely satisfactory and ultimately the models generated by
normalized data will most likely be only capable of reproducing trends in the
data. Whether such models will have great predictive value is open to question
and much research remains to be done in this area.

The other issue, is the intensive nature of the computations that are required
to fit even a moderately sized model. One of the necessary requirements for
fitting a model is estimating the confidence limits on the fitted parameters and
the range of parameter space which describes the experimental data. This
information is crucial to determine the validity of the model and can be used to
design additional experiments to either refute the model or increase the
precision of the model parameters. As a result of these requirements, computing
a global optimization can take a considerable time. For example, in a recent
study, Vijay Chickarmane (unpublished) estimated that the time required to fit a
model of approximately three hundred parameters would be of the order of seven
years on a normal desktop computer. Luckily, global optimization can be easily
parallelized given a suitable optimizer (for example a genetic algorithm based
optimizer) and the computation time can be reduced by hosting the problem on a
cluster machine. Chickarmane estimates that using a one thousand node cluster,
the optimization of a three hundred parameter model can be reduced to
approximately two days of computation time. Such a computation can be easily
setup using SBW. A single node on the cluster would act as the primary
optimizer; this node in turn would farms out the time consuming simulation
computations to the remaining nodes on the computer. For very large models, Grid
computing [@GridComputing:Abbas] may be very appropriate for solving this kind
of problem.

# Future Prospects and Conclusion

The Systems Biology field has been developing rapidly in recent years but much
remains to be done. One of the most useful developments must undoubtedly go to
the development of standards such as SBML and CellML.  Indeed the most recent of
a long list of new systems biology journals, (Molecular Systems Biology) has
stipulated that SBML is the preferred format for contributing models, hopefully
other journals will follow.  However, one aspect that still remains to be dealt
with is to formalize the sematic rules for SBML. At the moment there is no
guarantee that models written by different tools can be interchanged. If one
focuses on the core specification in SBML that this is generally not an issue
but it is vital that sematic validators be developed for SBML.

The other area that has received a lot of attention in recent years is the
development of tools for systems biology. However, much of what is being
developed is repetitious and little true advancement is being made. This is
probably do to the large number of new comers to the field who are inexperienced
and inevitably repeat what has gone before. A number of solutions exist to solve
this problem, one is to develop extensible frameworks such as SBW, BioSPICE or
BioUML, the other is to develop a suite of open-source libraries which can carry
out specific functionality. An example of this is libSBML being developed by the
SBML team. This library, written in C/C++ for maximum portability, enables other
developers to concentrate on simulation capability rather than waste unnecessary
effort developing their own SBML parser. In terms of other possible libraries,
examples include, open-source Gillespie based stochastic solvers and ODE
solvers. In both cases there is also the need to develop scalable and robust
methods for computing the dependent and independent species. Further more,
hybrid methods combining continuous and stochastic methods is a pressing need at
the current time. Many biological systems interface noisy sensory apparatus
(e.g. ligand binding to the surface of a cell membrane) to internal continuous
analog networks [@SauroReview:2004]. In addition to the core solvers, we also
need scalable analysis tools, particularly bifurcation analysis tools and
sensitivity analysis tools. On the model validation front, much remains to be
done, particularly the relationship between model validation and how this can
direct future experimentation. This leads on to the development of new methods
and algorithms for analyzing the complex networks in particular methods should
be developed to modularize large networks since understanding an entire network
is virtually impossible with out some recourse to a hierarchical modularization.

Finally, the role of high performance computing in systems biology is still very
novel. In fact there appear to be very few applications to date of high
performance computing to systems biology. One of the few useful applications is
model fitting to data. When done correctly, this is an extremely computationally
intensive calculation and is an ideal candidate for large cluster machines. In
fact, one wonders whether this is the application for systems biology which
could benefit from Grid computing.

# Recommended Resources

Four web sources which are of interest to readers of this chapter include:

<http://www.cellml.org> :   This is the main CellML site. It has a very rich set
of models expressed in CellML including specifications for the standard and
pointers to software toolkits.

<http://www.sbml.org> :   This is the main SBML site. The site as ample
documentation, examples illustrating how SBML is and should be used. In addition
is has a rich set of software tools, in particular libSBML, which allows
developers to easily add SBML support to their tools.

<http://www.sys-bio.org> :   This is the main SBW (Systems Biology Workbench)
site. The latest versions for SBW, developer documentation, example models,
screen shots, user guides can be obtained from this site. A link to the main
sourceforge site is given where all the source code for SBW is made available.

# Acknowledgements

I would first like to acknowledge the generous support from the Japan Science
and Technology Agency, DARPA (BAA01-26 Bio-Computation) and the US Department of
Energy GTL program, without which the bulk of the work described in this chapter
would not have been carried out. I would also like to acknowledge Mike Hucka,
Andrew Finney and Hamid Bolouri for their initial work on the Systems Biology
Workbench and in more recent years the tremendous programming work done by Frank
Bergmann and the critical support given by Sri Paladugu and Vijay Chickarmane to
the development of novel computational methods in Systems Biology.


# References
