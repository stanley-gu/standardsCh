% Standards, Platforms, and Applications
% 	Stanley Gu [^stanleyInfo]
	Herbert Sauro[^herbertInfo]

[^stanleyInfo]: stanleyg@uw.edu
[^herbertInfo]: hsauro@uw.edu

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

[![Standards](images/standards.png)](images/standards.png)

\newpage
\tableofcontents
\newpage



# Summary

With the sequencing of the human genome, it has become apparent that Systems
Biology, the understanding of cellular networks through dynamical analysis is
becoming an important part of research for mainstream biologists. One of the
indicative trends to emerge in recent years is the development of model
interchange standards that permit biologists to easily exchange dynamical models
between different software tools. In this chapter two chief model exchange
standards, SBML and CellML are described. In addition, the development of
extensible software frameworks, including SBW, are discussed and the
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
Higgins and Chance began investigating the possibility of modeling the subtle
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
mathematics. A short list of modeling representations is given in Figure
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
include boolean, Bayesian, formal logic and connectivity studies but these have
yet to show any overwhelming advantage over continuum based models.

In this chapter I will be exclusively concerned with models based on
differential equations and to a lesser extent stochastic equations.

* * * * *

Boolean:
:   One of the simplest possible modeling techniques is to represent a
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

(@scheme)	`Glucose-6-P -> Fructose-6-Phosphate Fructose-6-Phosphate + ATP ->`
			`Fructose-1-6-Bisphosphate + ADP Fructose-1-6-Bisphosphate -> DHAP + GAP`

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

# Standards

A standard is defined as a uniform set of specifications for some or all aspects
of an activity or product that encourages cooperation and interoperation.
Ideally, it should be clearly and unambiguously defined and as easy as possible
to interpret and implement. In the modern world, standards have been applied to
everything from light bulbs, PDFs (portable document formats), railroad track
gages and video formats to mobile phones, pharmaceutical purity and even bits
of bathroom plumbing. In the realm of systems biology, desire to facilitate
interoperability and reuse computational models and data was the the impetus for
developing standard electronic annotations and representations.

## Minimum Information (MI)

Standards development for systems biology reached its first major milestone at
the turn of the millennium, with the sequencing of the human genome and the rise
of DNA microarray technology. Given the increasingly large and complex
experiments, involving numerous biological samples and different experimental
conditions, researchers within the DNA microarray quickly realized that if one
was to make sense of the results from any analysis, a new way of storing and
retrieving this complex information was needed. Forward-thinking scientists
struggled to harmonize the output of different platforms, identify the ancillary
information needed to interpret results and even define the necessary data to
enable reproduction of results. Through discussions between interested members
of the community, public presentations, and workshop meetings, the Microarray
Gene Expression Data Society (MGED) outlined the Minimum Information About a
Microarray Experiment (MIAME) specification and Microarray Gene Expression
Markup Language (MAGE-ML) [@brazma2001minimum;@spellman2002design]. In many
ways, this precedent has become the prototype for subsequent data annotation
guidelines in systems biology [@quackenbush2006standardizing].

The early success of MIAME and its widespread adoption led to the development of
many domain-specific extensions and variations. MIAME is now accompanied with a
myriad of "minimum information" reporting standards initiatives that cover
practically every major biotechnological field [@naturebiotechnology2006]. The
Minimum Reporting Guidelines for Biological and Biomedical Investigations
(MIBBI) project has arisen as a comprehensive source of these reporting
"checklists" @taylor2008promoting]. MIBBI maintains a web-based and freely
accessible resource for minimum information standards (<http://www.mibbi.org/>),
providing access to extant checklists (and to complementary data formats,
controlled vocabularies, tools and databases), thereby enhancing both
transparency and accessibility of experimental results to the wider bioscience
community.

### Minimum Information Required in the Annotation of Models (MIRIAM)

Extending beyond the laboratory, the Minimum Information Requested In the
Annotation of biochemical Models (MIRIAM) standard was developed by Novère et
al. [@le2006model] for describing quantitative models of biochemical systems and
bring together the new standards in computational systems biology, SBML and
CellML (discussed later in this chapter). By unifying different modeling
sub-domain standards under the same requisites, thus ensuring that models are
easily testable, reproducible, and comparable, the utility of quantitative
modeling may be enhanced for the benefit of biomedical research. However, the
ultimate impact of these standards depends on their adoption throughout the
community and the number of software tools that are developed to facilitate its
use.

The MIRIAM Guidelines are an effort to standardize upon the essential, minimal
set of information that is sufficient to annotate a model in such a way as to
enable its reuse. This includes a means to identify the model itself, the
components of which it is composed, and formalizes a means by which unambiguous
annotation of components should be encoded. This is essential to allow
collaborative working by different groups which may not be spatially co-located,
and facilitates model sharing and reuse by the general modeling community.
These guidelines can be implemented in any structured format used to encode
computational models [@novere2005minimum].

Many encoded models available in scientific publications or on the
Internet are not in a standard format. Of those that are encoded in a standard
format, it turns out that most actually fail compliance tests developed for
these standards. Failures occur for a variety of reasons, ranging from minor
syntactic errors to significant conceptual problems, including the incorrect
specification of units. Even deeper semantic inaccuracies can lie in the
structure of the model itself. Finally, there is no standard naming scheme for
the model constituents, so the precise identification of constituents depends on
the associated documentation and annotation. Most models available today are not
annotated, and as a result, users are faced with such things as a reaction 'X'
between the constituents 'A' and 'B,' producing 'C' and modulated by 'M.' As a
consequence, models frequently have to be re-encoded in order to be reused, a
process that in practice is often performed by a different person from the
original author.

Thus, to address these quality issues, MIRIAM comprises of the following
guidelines:

Reference correspondence:

:	The model must be encoded in a public, standardized, machine-readable format (SBML, CellML, GENESIS, ...).
:	The model must comply with the standard in which it is encoded.
:	The model must be clearly related to a single reference description. If a model is composed from different parts, there should still be a description of the derived/combined model.
:	The encoded model structure must reflect the biological processes described by the reference description.
:	The model must be instantiable in a simulation: all quantitative attributes must be defined, including initial conditions.
:	When instantiated, the model must be able to reproduce all results given in the reference description within an epsilon (algorithms, round-up errors).

Attribution annotation:

:	The model has to be named.
:	A citation to the reference description must be provided (complete citation, unique identifier, unambigous URL). The citation should identify the authors of the model.
:	The name and contact information for model creators must be provided.
:	The date and time of model creation and last modification should be specified. A history is useful but not required.
:	The model should be linked to a precise statement about the terms of it's distribution. MIRIAM does not require “freedom of use” or “no cost”.

External resource annotation:

:	The annotation must unambiguously relate a piece of knowledge to a model constituent.
:	The referenced information should be described using a triplet {collection, identifier, qualifier}:
:	The annotation should be written as a Uniform Resource Identifier (URI).
:	The identifier should be considered within the context of the framework of the collection.
:	Collection namespace and identifier are be combined into a single URI, such as: http://identifiers.org/collection/identifier. For example: http://identifiers.org/uniprot/P62158.
:	Qualifiers (optional) should refine the link between the model constitutent and the piece of knowledge: “has a”, “is version of”, “is homolog to”, etc.
:	The community has to agree upon a set of standard valid URIs. A database and the associated API (Web Services) have been developed at the EBI to provide the generation and interpretation of URIs.

MIRIAM applies to a broad range of quantitative models that can be simulated
over a range of parameter values and provide numerical results. This encompasses
not only models that can be integrated or iterated forwards in time, such as
ordinary and partial differential equation models and differential algebraic
equation models, but also other quantitative approaches such as steady-state
models (*e.g.*, Metabolic Control Analysis, Flux Balance Analysis). The
comparison of these predictions with the reference description of the model is a
crucial test of MIRIAM compliance.

### Minimum Information About a Simulation Experiment (MIASE)

The MIRIAM guidelines promote the exchange and reuse of biochemical
computational models. However, information about a model alone is not sufficient
to enable its efficient reuse in a computational setting. Advanced numerical
algorithms and complex modeling workflows used in modern computational biology
make reproduction of simulations difficult. It is therefore essential to define
the core information necessary to perform simulations of those models. The
Minimum Information About a Simulation Experiment (MIASE) guidelines describe
the minimal set of information that must be provided to make the description of
a simulation experiment available to others. It includes the list of models to
use and their modifications, all the simulation procedures to apply and in which
order, the processing of the raw numerical results, and the description of the
final output.

* * * *

**MIASE Guidelines**

All models used in the experiment must be identified, accessible, and fully described.

* The description of the simulation experiment must be provided together with the models necessary for the experiment, or with a precise and unambiguous way of accessing those models.
*	The models required for the simulations must be provided with all governing equations, parameter values and necessary conditions (initial state and/or boundary conditions). If a model is not encoded in a standard format, then the model code must be made available to the user. 
*	If a model is not encoded in an open format or code, its full description must be provided, sufficient to re-implement it.
*	Any modification of a model (pre-processing) required before the execution of a step of the simulation experiment must be described.

A precise description of the simulation steps and other procedures used by\
the experiment must be provided.

*	All simulation steps must be clearly described, including the simulation algorithms to be used, the models on which to apply each simulation, the order of the simulation steps, and the data processing to be done between the simulation steps.
*	All information needed for the correct implementation of the necessary simulation steps must be included, through precise descriptions, or references to unambiguous information sources.
*	If a simulation step is performed using a computer program for which source-code is not available, all information needed to reproduce the simulation, and not only repeat it, must be provided, including the algorithms used by the original software and any information necessary to implement them, such as the discretization and integration methods.
*	If it is known that a simulation step will produce different results when performed in a different simulation environment or on a different computational platform, an explanation of how the model has to be run with the specified environment/platform in order to achieve the purpose of the experiment must be given.

All information necessary to obtain the desired numerical results must \
be provided.

*	All post-processing steps applied on the raw numerical results of simulation steps in order to generate the final results have to be described in detail. That includes the identification of data to process, the order in which changes were applied, and also the nature of changes.
*	If the expected insights depend on the relation between different results, such as a plot of one against another, the results to be compared have to be specified.

* * * *

MIASE allows for the reproduction of any simulation experiment. The provision of
this information, along with a set of required models, guarantees that the
simulation experiment represents the intention of the original authors.
Following MIASE guidelines will thus improve the quality of scientific
reporting, and will also allow collaborative, more distributed efforts in
computational modeling and simulation of biological processes
[@waltemath2011minimum]

## Ontologies

The MIRIAM guidelines state that a model's constituents must be unambiguously
annotated. The value of any kind of data is greatly enhanced when it exists in a
form that allows it to be integrated with other data. Thus, a common language is
necessary for different models that may describe the same physical entity or
biological process. One approach to integration is through the annotation of
multiple bodies of data using common controlled and structured vocabularies or
"ontologies".

One of the most successful examples of the use of a biomedical ontology,
measured by both the number of users and its reach across different subdomains
is the Gene Ontology (GO), which defines specific gene products across different
species. All terms are organized in a hierarchical structure, where there are
three main branches, biological processe, celular component, or molecular
function, and the leaves are proteins. GO terms have been used in millions of
annotations relating to gene products described in protein databases such as
UnitProt and Ensembl [@smith2005relations].

### Open Biomedical Ontologies (OBO)

Unfortunately, the success of this approach has led to dizzying number of
different ontologies, the sheer number which may create an obstacle to
integration. OBO was created in 2001 to address this issue by serving as an
umbrella body for the developers of life-science ontologies. OBO applies the key
principles led to the success of GO, such as having ontologies that are *open*
and *orthogonal*. Onotologies within OBO are *open* in the sense that its usage
should be available without any constraints or licenses, and new applications
may build upon OBO without restriction. Ontologies within OBO are *orthogonal*
such that vocabulary is non-overlapping with other ontologies.

OBO now comprises over 60 ontologies, and its role as an ontology information
resource is supported by the NIH Roadmap National Center for Biomedical Ontology
(NCBO) through BioPortal (<http://bioportal.bioontology.org/>)
[@noy2009bioportal]. At the same time, the developers of a subset of OBO
ontologies have initiated the OBO Foundry (<http://obofoundry.org>), a
collaborative experiment based on the voluntary acceptance by its participants
of an evolving set of principles  that extend those of the original OBO by
requiring in addition that ontologies (i) be developed in a collaborative
effort, (ii) use common relations that are unambiguously defined, (iii) provide
procedures for user feedback and for identifying successive versions and (iv)
have a clearly bounded subject-matter (so that an ontology devoted to cell
components, for example, should not include terms like 'database' or 'integer')
[@smith2007obo].

#### Systems Biology Ontology (SBO)

SBO (<http://www.ebi.ac.uk/sbo/>) is one member of the OBO family of ontologies.
One of the goals of SBO, is to facilitate the immediate identification of the
relation between a systems biology model component and the model structure. SBO
is currently made up of four different vocabularies. Within a vocabulary, the
terms are related by "is a" inheritances, which represent sub-classing.

1. A classification of rate laws. This CV is a taxonomy of kinetic rate equations. Examples of terms in this CV are "mass action kinetic", "Henri-Michaelis-Menten kinetics", "Hill function" etc. Note that although taking the same mathematical form, the rate-laws "Henri-Michaelis-Menten", "Van Slyke" and "Briggs-Haldane", being based on different assumptions, will be represented by different terms. This will help a user to choose the adequate conversion to elementary steps if needed.

2. A taxonomy of the roles of reaction participants, including the following terms: "catalyst", "substrate", "competitive inhibitor", "non-competitive inhibitor" etc.

3. A CV for parameter roles in quantitative models. This CV includes terms such as "forward unimolecular rate constant", "Hill coefficient", "Michaelis constant" etc.

4. A list of modelling framework, that precises how to interpret a mathematical expression, such as "deterministic", "stochastic", "boolean" etc.

The annotation of model components with SBO terms will be an essential step to
reach MIRIAM-compliance. Not only such an annotation will be important to
understand and to programmatically analyze models, it will also power the search
strategies used by the databases of models, and in particular BioModels
Database. The use of SBO terms within SBML will allow to a limited extend to get
rid of the explicit mathematics in the model itself, but to download the
adequate rate-law instead [@le2006model].

Together, SBO, the Kinetic Simulation Algorithm Ontology (KiSAO) and the
Terminology for the Description of Dynamics (TEDDY) provide stable and perennial
identifiers, referencing machine-readable, software-interpretable, regulated
terms. These ontologies define semantics for the aspects of models, which
correspond to the three steps of the modeling and simulation process. SBO is a
well-established software tool, KiSAO gathers increasing community support and
TEDDY is as yet in its infancy, being primarily a research project. All three
ontologies aim to fill specific niches in the concept space covered by the OBO
foundry [@courtot2011controlled].

## Physiological Models

In these following sections, the most popular and influential standards for
encoding and exchanging physiological models will be discussed. The relative
merits of each format will be surveyed and compared. But first, why are model
standards useful?

Since the sequencing of the human genome, there has been an ever increasing list
of wide ranging cellular models published in the literature. For most of
scientific publishing history, each author has a particular notation that they
use to publish the model. Some authors will publish the model as a reaction
scheme (@scheme), much like the notation given in scheme. Others will itemize
the actual mathematical representation in the form of a list of differential
equations. Some authors do not publish the model at all but provide the model as
supplementary information. Until recently, there has been no way to publish
models in a standard format. Without a standard format it has proved very
difficult if not impossible in many cases to implement and use published models
without considerable effort.

Thus, as a result of this serious issue, a number of groups set out to gather
community support to develop a standard that model developers would be happy to
use. There was an early effort in 1998 by the BTK (BioThermoKinetics) group to
standardize on a practical format for exchanging models between Gepasi
[@Gepasi:1993] and SCAMP [@SauroF91], both tools were widely used at the time.
Around the same time, bioengineers at the University of Auckland began
investigating the role that Extensible Markup Language (XML) [@harold:2001]
could play in defining a standard for exchanging computational models in order
to reduce errors that appeared frequently in published models. From the Auckland
team emerged CellML [@LloydCellML2004]. Members from the BTK group subsequently
took their experience and contributed significantly to the other major model
exchange standard, called SBML [@hucka:2002d].

### Systems Biology Markup Language (SBML)

SBML was developed in 2000 at Caltech, Pasadena as a result of funding received
from the Japanese ERATO program. Both CellML and SBML are today viewed as the
main standards for exchanging cellular network models. There are however
fundamental differences between the approaches that CellML and SBML take in the
way models are represented.

Whereas CellML attempts to be highly comprehensive, SBML was designed to meet
the immediate needs of the modeling community and is therefore more focused on
a particular problem set. One result of this is that the standard is much
simpler and much less verbose. Like CellML, SBML is based on XML, however unlike
CellML, it takes a different approach to representing cellular models. The way
SBML represents models closely maps the way existing modeling packages
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

The development of SBML is stratified in order to organize architectural changes
and versioning. Major editions of SBML are termed Levels and represent
substantial changes to the composition and structure of the language. Models
defined in lower Levels of SBML can always be represented in higher Levels,
though some translation may be necessary. The converse (from higher Level to
lower Level) is sometimes also possible, though not guaranteed. The Levels
remain distinct; a valid SBML Level 1 document is not a valid SBML Level 2
document. Minor revisions of SBML are termed Versions and constitute changes
within a level to correct, adjust, and refine language features. Finally,
specification documents inevitably require minor editorial changes as its users
discover errors and ambiguities. Such problems are corrected in new Releases of
a given SBML specification.

#### Extensibility

It was realized early on by the authors of SBML that as systems biology
developed there would be pressure from the community to make additional
functionality available in SBML. To address this issue, SBML has a formal means
for adding extensions in the form of *annotations*. There now exist
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

The latest generation of SBML, which is Level 3, is modular in the sense of
having a defined core set of features and optional packages adding features on
top of the core. This modular approach means that models can declare which
feature-sets they use, and likewise, software tools can declare which packages
they support. It also means that the development of SBML Level 3 can proceed in
a modular fashion. The development process for Level 3 is designed around this
concept. SBML Level 3 package development is today an ongoing activity, with
packages being created to extend SBML in many areas that its core functionality
does not directly support. Examples include models whose species have structure
and/or state variables, models with spatially nonhomogeneous compartments and
spatially dependent processes, and models in which species and processes refer
to qualitative entities and processes rather than quantitative ones.

[@hucka2010systems]

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

#### Practical Considerations

While CellML is very general, SBML is more specific, as result, the storage
requirement for SBML is much less. It takes on average roughly 1.5Kbytes to
store a single chemical transformation in SBML Level 2 (compared to 5K for
CellML). Interestingly it only takes roughly 50 to 100 bytes to store single
transformations in raw binary format where there is minimal extraneous syntax.
Some readers may feel that with todays cheap storage technologies, that
discussions on storage requirements is unnecessary. Indeed for small models it
is not an issue.  However, in future very large models are likely to be
developed. There is, for example a serious attempt (<www.physiome.org>) now
underway to model in the long term entire organs and even whole organisms. The
amount of information in these cases is huge and the question of efficient
storage is not so trivial. Obviously XML is highly compressible and large models
can be stored in this way. However, inefficient storage also increases the time
taken to manipulate the models. Furthermore, in a modeling environment, model
authors tend to generate hundreds of variants while developing the model. For a
large model this clearly would generate huge amounts of XML based data. One of
the things that has yet to be addressed by either standard is the how model
variants can be efficiently stored.

XML is a popular choice for model exchange languages because
[@bray1997extensible]:

#. XML is easily transmitted through the Internet (much like HTML).
#. There are a large number of software tools and libraries for parsing XML.
#. XML documents are human legible, reasonably clear, and easy to modify.

#### Usage

Over the past decade, SBML has become the *de facto* standard for systems
biology models. As of this writing, 251 different software packages are
officially listed on the SBML Software Guide
(<http://sbml.org/SBML_Software_Guide>).

Both SBML and CellML have been taken up by many software developers and
implemented in their software. SBML in particular is being used in over 75
software projects. In addition, SBML is the official model interchange format
for the SBW project (<www.sys-bio.org>), the international *E. coli* alliance,
and the receptor tyrosine kinase consortium. Much of the SBML support is in
standalone applications, however, a number of database vendors have also
decided to provide export of SBML as an option, examples include reactome, stke
and sigpath.

A related standard that has been proposed by [@MFAML2004] is for the storage of
flux balance models. The proposed format is very similar to SBML but has the
additional feature of storing the flux balance objective function.

### CellML

CellML [@LloydCellML2004] represents cellular models using a mathematical
description similar to equation (@eqGeneral). CellML also has provisions for
metadata annotations to allow MIRIAM compliance. In addition, CellML represents
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
of a sample from the CellML repository (<www.cellml.org/examples/repository/>)
indicates that each reaction in a model requires about 5 kilobytes of storage.

Owing to the complexity of CellML, one unfortunate side effect is that there are
substantially fewer tools which can read and write CellML compared to SBML. The
CellML team <http://cellml.sourceforge.net/>) also provides their own software
tools to third-party developers, including the CellML API (<http://cellml-
api.sourceforge.net/>), which is a library much like libSBML that allows
software developers to read and write CellML models.


### NeuroML

Paralleling efforts in SBML and CellML in molecular pathway and cell physiology
modeling, NeuroML provides a common data format for defining and exchanging
descriptions of neuronal cell networks [@goddard:2001]. Level 1 (MorphML), Level
2 (ChannelML), and Level 3 (NetworkML) describe neuronal systems to different
levels of biological granularity.

A number of software of packages are written to work with NeuroML,  NEURON
[@carnevale2006neuron], GENESIS [@bower1995book], MOOSE [@ray2008pymoose], NEST
[@diesmann2001nest], and PSICS [@cannon2010stochastic]. These different
environments were successfully able to reproduce the same model simulation
(including a reconstruction of the 3D structure of a neural pathway), using
NeuroML as the exchange format [@gleeson2010].

There are recent efforts to convert NeuroML into SBML, which may allow NeuroML
models and modelers access to the vast library of SBML compliant software tools
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

SED-ML is an XML format that enables the storage and exchange of part of the
information required to implement the MIASE guidelines. It covers information
about the simulation settings, including information about the models, changes
on them, simulation settings applied to the models and output definitions. SED-
ML is independent of the formats used to encode the models  as long as they are
expressed in XML, and it is independent of the software tools used to run the
simulations. Several test implementations are being developed to benchmark SED-
ML on simple cases, and pave the way to a more complete support of MIASE
[@kohn2008sed]. The share and reuse of biochemical models have become two of the
main issues in the field of Computational Systems Biology. The community
believes that providing detailed information about simulation recipes will
highly improve the efficient use of existing models, encoded in widely accept
formats of model structure, such as SBML and CellML.

### Systems Biology Results Markup Language (SBRML)

SBRML is an XML-based language that associates a model with several datasets.
Each dataset is represented as a series of values associated with model
variables, and their corresponding parameter values. SBRML provides a flexible
way of indexing the results to model parameter values, which supports both
spreadsheet-like data and multidimensional data cubes. SBRML may be used in
applications such as enzyme kinetics, microarray gene expression and various
types of simulation results.

Availability and Implementation: The XML Schema file for SBRML is available at
http://www.comp-sys-bio.org/SBRML under the Academic Free License (AFL) v3.0.

SBRML and SED-ML are also complementary. While the main purpose of SBRML is to
encode the simulation results and/or experimental data and all context in which
it was obtained, SED-ML is used for a detailed description of the operations
that generate simulation results. This means SED-ML could be used for a detailed
description of the specific operations that led to the data in SBRML. One way to
achieve this might be the inclusion of an SED-ML container in an SBRML file in
similar way to SBML container in ‘model’ element of SBRML [@dada2010sbrml].

### Numerical Markup Language (NuML)




## Visualization

### Systems Biology Graphical Notation (SBGN)


For many users, the ability to visualize models and to build models using visual
tools is an important feature. There are currently a number of visualization
formats that are in common use. One of the most comprehensive and freely
available formats is the molecular interaction maps developed by Kohn
[@Kohn1999] and more recently by Mirit Aladjem [@Kohn2004]. The Kohn format
emerged from the need to represent complex signaling networks in a compact way.
Unlike metabolic networks, signaling networks can be extremely complex with
multiple protein states and interactions and therefore an alternative and more
concise approach is desirable. At the time of writing there is no software for
manipulating Kohn maps and no means to convert Kohn maps to SBML or any other
standard. Hopefully this will change in the future.

An early computer based visual notation was proposed by Cook [@Cook2001] who
developed a notation called BioD.

Another proposal has been put forward by Kitano [@Kitano2003]. This is a more
traditional approach where different molecular entities (such as proteins, ions,
transporters etc.) have particular pictorial representations. The software tool
called cellDesigner [@CellDesigner2003] implements this proposed format.


Circuit diagrams and Unified Modeling Language diagrams are just two examples of
standard visual languages that help accelerate work by promoting regularity,
removing ambiguity and enabling software tool support for communication of
complex information. Ironically, despite having one of the highest ratios of
graphical to textual information, biology still lacks standard graphical
notations. The recent deluge of biological knowledge makes addressing this
deficit a pressing concern. Toward this goal, we present the Systems Biology
Graphical Notation (SBGN), a visual language developed by a community of
biochemists, modelers and computer scientists. SBGN consists of three
complementary languages: process diagram, entity relationship diagram and
activity flow diagram. Together they enable scientists to represent networks of
biochemical interactions in a standard, unambiguous way. We believe that SBGN
will foster efficient and accurate representation, visualization, storage,
exchange and reuse of information on all kinds of biological knowledge, from
gene regulation, to metabolism, to cellular signaling.

SBGN defines three orthogonal and complementary types of diagrams that can be
seen as three alternative projections of the underlying more complex biological
information. The process diagram draws its inspiration from process-style
notations, borrowing ideas from the work of CellDesigner28 and EPE22. By
contrast, the entity relationship diagram is based to a large extent on Kohn's
MIM notation18, 19. The SBGN activity flow diagram depicts only the cascade of
activity, thus making the notation similar to the reduced representations often
used in the current literature to describe signaling pathways and gene
regulatory networks. In Figure 2, we illustrate the three views applied to a
very simple example. The characteristics of the SBGN languages are summarized in
Table 2.

The idea of having three diagram types naturally begs the question of whether
they could be merged into one, at least in paper form. The answer is no, for at
least two reasons. First, a single diagram type would bring us back to the
problem of dealing with unreasonable numbers of interactions as described above.
Second, each SBGN language reflects fundamental differences in the underlying
formal description of the phenomena. The meanings are so different that merging
diagram types would compromise their representational robustness.

Having multiple visual languages is not uncommon in engineering (consider, for
example, block diagrams and circuit diagrams in electronics, UML class, state
sequence and deployment diagrams in software engineering), and this supports the
idea that having three sublanguages in SBGN will be manageable in practice. In
SBGN, the sharing of symbols representing identical concepts further reduces the
differences between the three languages to differences in syntax and semantics.
We believe that this, combined with careful design, will mitigate some of the
difficulties of learning SBGN. However, it is to be noted that the clean
orthogonality of the languages makes their overlap very limited, mostly to
modulatory arcs, and node decorations.

[@le2009systems]


SBGN-ML and libSBGN

cySBGN [@goncalves2013cysbgn]


Efficient integration of the SBGN standard into the research cycle requires adoption by visualization and modeling software. Encouragingly, a growing number of pathway tools (see http://sbgn.org/SBGN_Software) offer some form of SBGN compatibility. However, current software implementations of SBGN are often incomplete and sometimes incorrect. This is not surprising: as SBGN covers a broad spectrum of biological phenomena, complete and accurate implementation of the full SBGN specifications represents a complex, error-prone and time-consuming task for individual tool developers. This development step could be simplified, and redundant implementation efforts avoided, by accurately translating the full SBGN specifications into a single software library, available freely for any tool developer to reuse in their own project. Moreover, the maps produced by any given tool usually cannot be reused in another tool, because SBGN only defines how biological information should be visualized, but not how the maps should be stored electronically. Related community standards for exchanging pathway knowledge, namely BioPAX (Demir et al., 2010) and SBML (Hucka et al., 2003), have proved insufficient for this role (more on this topic in Section 4). Therefore, we observed a second need, for a dedicated, standardized SBGN file format.

Following these observations, we started a community effort with two goals: to encourage the adoption of SBGN by facilitating its implementation in pathway tools, and to increase interoperability between SBGN-compatible software. This has resulted in a file format called SBGN-ML and a software library called LibSBGN. Each of these two components will be explained separately in the next sections.

SBGN-ML is a dedicated lightweight XML-based file format describing the overall geometry of SBGN maps, while also preserving their underlying biological meaning. SBGN-ML is designed to fulfill two basic requirements:

easy to draw (as a machine) and read (as a human) and

easy to interpret (as a machine).

The first set of requirement deals with the graphical aspect of SBGN. It means it should be easy to render a SBGN-ML file to the screen. Therefore, the format stores all necessary information, such as coordinates, to draw the map faithfully, so that rendering tools do not have to perform any complex calculations. Incidentally, this implies the layout of the whole SBGN map has to be expressed explicitly: the size and position of each graphical object and the path of each arc. Various efforts have shown that generating a layout for heterogeneous biological pathways is a computationally hard problem, so a good layout is always worth preserving, if only from a computational perspective. Besides, the choice of a specific layout by the author of a map is often driven by concerns related to aesthetics, readability or to reinforce ideas of chronology or proximity. This information might be lost with automated layouts. Layout conventions predate SBGN, and are not part of any standard, but they nonetheless play a large role in making it easier for other human beings to understand the biological system being described.

The second requirement encompasses two perpendicular characteristics of SBGN as a language: semantics and syntax. Beyond the picture itself, the format should capture the biological meaning of an SBGN map. Therefore, SBGN-ML specifies the nature of graphical elements (glyphs), following the SBGN terminology (e.g., macromolecule, process, etc.). For example, we can distinguish between a ‘logic arc’ and a ‘consumption arc’ even though they have the same visual appearance. Supporting tools refer to this terminology and draw the glyph according to the SBGN specifications. In terms of syntax, SBGN-ML encodes information on relationships between the various SBGN objects: the glyphs at both ends of an arc, the components of a complex, the members of a compartment and the ‘decorations’ (such as unit of information and state variable) belonging to specific glyphs and arcs. This semantic and syntactic information is essential to a number of automated tasks, such as map validation, or network analysis (as the topology of the underlying biological network can be inferred from the various relationships encoded by the format).

[@le2010report]

A software library called LibSBGN complements the file format. It consists of two parallel implementations in Java and C++. The libraries share the same object model, so that algorithms operating on it can be easily translated to different programming languages.

The primary goal of LibSBGN is to simplify the work for developers of existing pathway tools. To reach this goal we followed three design principles. First, we avoided tool-specific implementation details. Implementation artifacts that are specific for one bioinformatics tool would impose difficulties for adoption by others. We sought input from several tool developers into the LibSBGN effort early on.

Second, we do not want to force the use of a single rendering implementation (meaning the software routine that translates from memory objects to screen or graphic format). Early in the development of LibSBGN, it became clear that for most pathway drawing tools, the rendering engine is an integral part that is not easily replaced by a common library. The typical usage scenario is therefore to let LibSBGN handle input and output, but to translate to the application's own object model, and display using the application's own rendering engine. Enforcing a common rendering library would hamper adoption of LibSBGN. We instead opted to build a render comparison pipeline to ensure consistency between various renderers (this pipeline is described in more detail in Section 3.2).

Third, we wish to provide optimal libraries for each development environment. For both the C++ and Java versions, code is automatically generated based on the XML Schema definition (XSD). The method of generating code from XSD has reduced the effort needed to keep the Java and C++ versions synchronized during development. The generated Java code plus helper classes form a pure Java library. The alternative possibility, to create a single C++ library and a Java wrapper around that, is not preferable because it complicates multi-platform installation and testing. Our experience with a related project, LibSBML (Bornstein et al., 2008), is that the community has a need for a pure Java library in spite of existing Java bindings for C++, which has led to the development of the pure Java JSBML (Dräger et al., 2011) as an alternative. Although both LibSBML and JSBML are successful projects, the maintenance of two similar projects in different languages is costly in terms of developer time. By generating native libraries for both environments automatically, we hope to avoid that extra cost.

[@van2012software]

## Other Standards



Apart from using XML to define an interchange format, there are two other
mediums for representing models, these include, human readable text based
formats and visual formats.

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
(<http://www.python.org>) programming language that runs on both Microsoft Windows
(2000/XP) and Linux. It runs as either a single user application on Windows or a
multi-user application under Linux. PySCeS makes use of the Scientific Libraries
for Python (SciPy), a large collection of mathematical algorithms for science
and engineering applications (<http://www.scipy.org>). Some of the advantages of
using Python with SciPy are as follows. Python is scripted, with all the object
oriented features of a modern programming language, and includes automatic
memory management and garbage collection. It is well suited to act as a glue for
applications that interface with libraries compiled in other languages such as
C, C++ and Fortran. Both Python and SciPy are freely available and run on a wide
variety of operating systems.

It is, of course, possible to build models directly using only Python with SciPy
[@olivier2002modelling]]. Although entirely possibly, this approach does require
considerable skill in both numerical analysis and computer programming. PySCeS
has been developed to provide a high-level modeling interface that utilities and
extends the low level capabilities provided by Python and SciPy, making it
unnecessary for the modeler to work with advanced programming techniques or low
level numerical algorithms. Once a working Python/SciPy environment is available
(installation details for various operating systems are available from the SciPy
web-site) PysCeS may be installed using the standard Python distribution
utilities.

[@Pysces2004]


#### SBML Shorthand


SBML-shorthand provides a shorthand notation for SBML that is much easier for humans to read and write than full SBML. The full specification for SBML-shorthand and a conversion tool is available at the authors' website.

The library also includes the SBML-shorthand to SBML and SBML to SBML-shorthand Python conversion tools. These are useful for rapidly building and editing models destined for SBML encoding. They are particularly well-suited to building SBML models designed for discrete stochastic simulation.

It isn't really meant as a complete alternative to GUI model-building tools. It is just a useful tool for rapid building of essential model structure. Once the basics are defined, you can translate to SBML and load up in the GUI tool of your choice.

[@gillespie2006tools]


#### Antimony

Antimony is unique in that it combines the relative simplicity of languages like Jarnac, PySCeS, and SBML-shorthand with the modularity of languages like little-b and ProMoT's MDL, without requiring that the modeler learn a programming language like Python or Lisp. GEC does the same, though it focuses on one particular problem domain. The libAntimony library will allow Antimony-formatted files to be read by other software packages like PySCeS, allowing them to benefit from Antimony's modularity without having to implement it directly. The Antimony/SBML converters further extend Antimony's usefulness by allowing users to convert their modules into a ‘flattened’ form for use in their SBML-compliant software.

A cross-platform library ‘libAntimony’ is available to parse and convert Antimony-formatted text files, written in Bison and C++ with language bindings for C, and supported on Linux, Windows, and MacOS X. It uses libSBML (Bornstein et al., 2008) to convert modules to and from the SBML format. Stand-alone programs are also provided that translate SBML models to Antimony, and translate ‘flattened’ Antimony models to SBML.

[@smith2009antimony]


### High-throughput Data

CellML and SBML are the primary formats used to store interchangeable dynamic
models. Apart from the particular details on the model itself there is also the
need to consider data that is used to build the models. Most models are built by
laboriously searching the literature and carrying out additional experiments as
necessary to fill in gaps in the data. This has proved to be an extremely
effective method to building reliable models [@TysonNatReview2001;
@TysonBioessay2002].  However, Many inexperienced researcher in Systems Biology
feel that high-throughput data is the answer to the needs of the modeling
community. Unfortunately much of the high-throughput data that is currently
available is not appropriate. Much of the high-throughput data is very noisy and
is probably more suitable for building qualitative models. More importantly, the
bulk of high-throughput data is not generated with dynamic model building in
mind and therefore is often not appropriate for this purpose. To date there has
not been a single dynamic model that has been constructed as a result of high-
throughput data. As systems biology and the construction of dynamic models
becomes more important, it is very likely that the utility of high-throughput
data will become much more significant. When this happens a proposed standard,
called BioPAX (<www.biopax.org>) will most likely contribute.

#### BioPax

(<http://www.ebi.ac.uk/compneur-srv/sbml/converters/SBMLtoBioPax.html>)

BioPAX (Biological Pathway Exchange) is another proposed standard based on XML.
BioPAX aims to integrate many of the incompatible pathway related databases
(such as BioCYC, BIND, WIT, aMAZE, KEGG and others) so that data from any one of
these databases can be easily interchanged. In future it should be possible to
extract data from many of the pathway databases and integrate the data directly
into SBML (or CellML) via BioPAX. The BioPAX group proposes to embed BioPAX
elements onto SBML or cellML for unambiguous identification of substances
(metabolites, enzymes) and reactions.

Biological Pathway Exchange (BioPAX) is a standard language to represent
biological pathways at the molecular and cellular level and to facilitate the
exchange of pathway data. The rapid growth of the volume of pathway data has
spurred the development of databases and computational tools to aid
interpretation; however, use of these data is hampered by the current
fragmentation of pathway information across many databases with incompatible
formats. BioPAX, which was created through a community process, solves this
problem by making pathway data substantially easier to collect, index, interpret
and share. BioPAX can represent metabolic and signaling pathways, molecular and
genetic interactions and gene regulation networks. Using BioPAX, millions of
interactions, organized into thousands of pathways, from many organisms are
available from a growing number of databases. This large amount of pathway data
in a computable form will support visualization, analysis and biological
discovery.


[@demir2010biopax]
[@stromback2005representations]

## Model Databases

High throughput experimental techniques have led to the population of web-
accessible databases with vast amounts of biological data. Mathematical models
of biological systems are playing an essential role in the interpretation of
this data. The scientific community now faces the challenge of the mathematical
models themselves becoming increasingly complex and numerous. There is a need
for centralized databases to store all these models in standard formats to make
them easily accessible and reusable by the research community. Publishing the
models in a standard format, concurrent with the submission of a written paper,
will eliminate many of the errors introduced into the model during the
publication process.

### BioModels

923 models, about half curated. 

BioModels Database (<http://www.ebi.ac.uk/biomodels/>), part of the
international initiative BioModels.net, provides access to published, peer-
reviewed, quantitative models of biochemical and cellular systems. Each model is
carefully curated to verify that it corresponds to the reference publication and
gives the proper numerical results. Curators also annotate the components of the
models with terms from controlled vocabularies and links to other relevant data
resources. This allows the users to search accurately for the models they need.
The models can currently be retrieved in the SBML format, and import/export
facilities are being developed to extend the spectrum of formats supported by
the resource [@le2006biomodels].

The number of quantitative models trying to explain various aspects of the
cellular machinery is increasing at a steady pace, thanks in part to the rising
popularity of systems biology (1). However, as for all types of knowledge, such
models will only be as useful as their access and reuse is easy for all
scientists. A first step was to define standard descriptions to encode
quantitative models in machine-readable formats. Example of such formats are
CellML (2) and the Systems Biology Markup Language (SBML) (3,4). The biomedical
community now needs public integrated resources, where authors can deposit, in
controlled formats, the models they describe in scientific publications.

Some general repositories of quantitative models have been made available, such
as the CellML repository CellML repository (
<http://www.cellml.org/examples/repository/index.html> JWS Online (6) and the
former SBML repository. In addition specialist repositories include SenseLab
ModelDB (7), the Database of Quantitative Cellular Signalling (DOCQS) (8) and
SigPath (9). However no general public resource existed that allowed the user to
browse, search and retrieve annotated models

Here we present BioModels Database, developed as part of the BioModels.net
initiative (<http://www.biomodels.net/>). BioModels.net is a collaboration
between the SBML Team (USA), the EMBL-EBI (UK), the Systems Biology Group of the
Keck Graduate Institute (USA), the Systems Biology Institute (Japan) and JWS
Online at Stellenbosch University (South Africa). Its aims are as follows: (i)
to define agreed-upon standards for model curation, (ii) to define agreed-upon
vocabularies for annotating models with connections to biological data resources
and (iii) to provide a free, centralized, publicly accessible database of
annotated, computational models in SBML and other structured formats.

BioModels Database is an annotated resource of quantitative models of biomedical
interest. Models are carefully curated to verify their correspondence to their
source articles. They are also extensively annotated, with (i) terms from
controlled vocabularies, such as disease codes and Gene Ontology terms and (ii)
links to other data resources, such as sequence or pathway databases.
Researchers in the biomedical and life science communities can then search and
retrieve models related to a particular disease, biological process or molecular
complex.

Models can be submitted by anyone to the curation pipeline of the database
(Figure 1). At present, BioModels Database aims to store and annotate models
that can be encoded with SBML. CellML models are also accepted. These model
formats are synonymous with models that can be integrated or iterated forwards
in time, such as ordinary differential equation models. Although we are aware
that this means we can cover only a restricted part of the modeling field, we
make this our initial focus for the following reason: (i) since a crucial part
of the curation process is the verification that the models produce numerical
results similar to the ones described in the reference article, iterative
simulations over ranges of parameter values and perturbation of simulations at
equilibrium are mandatory and (ii) a very large number of such models have
already been published, and the pace of their publication is increasing
steadily. As a consequence, they are sufficient to consume all the curation
workforce we have, and we can envision to gather in the near future.

To be accepted in BioModels Database, a model must be compliant with MIRIAM. One
of the requirements of MIRIAM is that a model has to be associated with a
reference description that provides directly, or through references, the
structure of the model, the necessary quantitative parameters and presents the
results of numerical analysis of the model. BioModels Database further refines
the notion of reference description, by considering only models described in the
peer-reviewed scientific literature.

A series of automated tasks are performed by the pipeline prior to human
intervention:

* Verification that the file is well-formed XML.
* If necessary, conversion to the latest version of SBML.
* Verification of the syntax of SBML.
* Series of consistency checks, enforcing the validity of the model.

If any of those steps is not completed, a member of the distributed team of
curators can reject the model, or instead correct it and resubmit it to the
pipeline. The last and most important step, of the curation process, is
verifying that when instantiated in a simulation, the model provides results
corresponding to the reference scientific article. Curators do not normally
challenge the biological relevance of the models, and assume the peer-review
process already filtered out unsuitable contributions. However, in specific
cases, curators can spot mistakes in an article and, with the agreement of the
authors, modify the model accordingly. Once the model is verified to be valid
SBML, and to correspond well to the article, it is accepted in the production
database for annotation.

In order to be confident in reusing an encoded model, one should be able to
trace its origin, and the people who were involved in its inception. The
following information is therefore added to the model: (i) either a PubMed
identifier (<http://www.pubmed.gov>) or a DOI (<http://www.doi.org>) or an URL that
permits identifying the peer-review article describing the model; (ii) name and
contact details of the individuals who actually contributed to the encoding of
the model in its present form; (iii) name and contact of the the person who
finally entered the model in the production database and who should be contacted
if there is a problem with the encoding of the model or the annotation.

In addition, model components are annotated with references to relevant
resources, such as terms from controlled vocabularies (Taxonomy, Gene Ontology,
ChEBI, etc.) and links to other databases (UniProt, KEGG, Reactome, etc.). This
annotation is a crucial feature of BioModels Database in that it permits the
unambiguous identification of molecular species or reactions and enables
effective search strategies.

### CellML Repository

The CellML Model Repository (<http://www.cellml.org/models>) is a similar
effort, which contains hundreds of biochemical pathway models that have been
described in peer- review publications.[@beard2009cellml]. CellML and the CellML
Model Repository are part of the IUPS Physiome Project effort to create a
virtual physiological human [@hunter2005integration]. The explicit
representation of modularity, together with the flexible nature of the CellML
language which allows the description of a diverse range of cellular and
subcellular systems, are two essential features of CellML with regards to its
role in the Physiome Project.

Initially the CellML Model Repository started out as a set of examples to
illustrate how the language could be applied to describe various biological
processes, and to test its features as the language evolved. Later, once the
CellML 1.0 specification was stabilized, the CellML repository became a
collection of CellML descriptions of models drawn from peer-reviewed journal
publications. The CellML Model Repository has since undergone significant
growth, with over 330 freely available, quantitative models of biological
processes taken from the peer-reviewed literature. In contrast with other
databases, such as BioModels, JWS and ModelDB, which focus on specific areas
such as systems biology pathway models or computational neuroscience, the CellML
Model Repository contains models describing a wide range of biological
processes, including: signal transduction pathways, metabolic pathways,
electrophysiology, immunology, the cell cycle, muscle contraction and mechanical
models and constitutive laws. This wide scope exemplifies CellML's ability to
describe much of the biochemistry, electrophysiology and mechanics of the
intracellular environment. Lumped parameter models dealing with systems
physiology (e.g. blood pressure control, fluid retention, electrolyte balance,
endocrine function, etc.) are also within the scope of CellML
[@lloyd2008cellml].

### Physiome Repository

From its creation in 2000 until June 2009, the CellML model repository
represented a relatively simple storage facility for CellML model files.
Although all the models in the repository were freely accessible to the public,
there was no mechanism in place to promote the sharing of models with their
revision history intact. Furthermore, collaboration between several researchers
is often required during the development of a model. Collaboration on a model
can be greatly simplified by a tool which records the change history of a model,
and makes that history available to other collaborators. Finally, once a model
is ready to be published, it must be indexed and presented so that it can be
easily searched for and viewed, thereby avoiding unnecessary duplication of
modelling efforts. Since it was not possible to extend the original repository
software to support these more advanced usage requirements, a complete rewrite
was required, and the Physiome Model Repository 2 (PMR2) was created. 

Unlike the previous version of the CellML model repository, PMR2 is file format
agnostic, meaning that it has no restrictions on what it can store. For example,
SBML1 and FieldML (Christie et al., 2009) models can be stored alongside models
in CellML and other formats. However, in order to properly handle (display,
edit, etc.) these, there is a need to implement plugins for each different
format. In addition to the model files, it is possible to upload additional
supplementary data with a model, including images, software-specific information
and even the original experimental data on which the model is based.

Workspaces, distributed version control systems and model revision history All
the files related to a particular model are stored together in PMR2 within a
defined workspace, which can be regarded as a folder. The implementation of
workspaces uses a distributed version control system (DVCS) called Mercurial
[@o2007distributed]. By providing version tracking, this system ensures that
users within a group cannot accidentally overwrite or purge changes of other
users. Furthermore, each change made to a model, or its associated files, is
recorded as a single changeset: a time-stamped, informative comment from an
identifiable user, which describes the changes they have made. As model files
are progressively altered, the changesets preserve the history of model
development. Finally, even if two users simultaneously change the same model
file, distinct changesets allow their work to be later merged in a controlled
manner.

Another advantage associated with using a DVCS is that it allows users to
collaborate directly with each other, independent of a centralized online
repository, as collaborators of any particular model will have a complete clone
of the workspace with the model and related files they are working on. This
allows each individual collaborator to work and commit changes to their local
copy, creating new changesets which may then be shared between themselves, or
pushed to a centralized repository when their work is ready to be reviewed or
released [@yu2011physiome].

### JWS Online

JWS Online (<http://jjj.biochem.sun.ac.za/>) is a repository of kinetic models,
describing biological systems, which can be interactively run and interrogated
over the Internet. At the time of this writing, JWS Online contains 131 models,
downloadable to SBML, while also providing a web browser interface to a
simulation server [@olivier2004web].

### Payao

Payao (<http://www.payaologue.org>) is a community-based, collaborative web
service platform for gene-regulatory and biochemical pathway model curation. The
system combines Web 2.0 technologies and online model visualization functions to
enable a collaborative community to annotate and curate biological models. Payao
reads the models in Systems Biology Markup Language format, displays them with
CellDesigner, a process diagram editor, which complies with the Systems Biology
Graphical Notation, and provides an interface for model enrichment (adding tags
and comments to the models) for the access-controlled community members
[@matsuoka2010payao].

Creating an extensive model of gene-regulatory and biochemical networks with the
latest data is a painstaking task. Curation is essential to creating an accurate
model. Yet as science and technology advances rapidly, once curated models soon
become out-of-date and need to be revised constantly. Many pathways and networks
are now available online via pathway databases, such as Reactome, BioModels.net,
Panther Pathways and many pathway editors are available (Bauer-Mehren et al.,
2009). What is needed is a framework to facilitate tracking and update mechanism
for modelers and researchers in the community to contribute to the collaborative
model building and curation process.

Payao aims to become a biological knowledge aggregating system, which enable a
community to work on the same models simultaneously, insert tags as pop-up
balloon to the parts of the model, exchange comments, record the discussions and
eventually update the models accurately and concurrently.

Payao is a spiritual successor to WikiPathways (<http://www.wikipathways.org/>),
a similar effort for such a collaborative platform, but in the Wiki style. While
the Wiki system has its strength in collaborative editing and version tracking,
it does not provide access control or explicit community tagging mechanisms. In
a community-driven model enrichment environment, it is effective to
differentiate privileges to special interest group (SIG) members for curation
activities commenting on existing tags, adding tags to models, annotating
individual component inside a model and validating the annotations. In view of
the complexity of biological pathways and the expertise of biologists in
different areas, a community platform for biology requires an exquisite balance
of federated resource sharing and quality control of information by a SIG of
experts in the particular pathway or process. An access control privilege system
allows the community to share and disseminate the knowledge, while enabling a
dedicated SIG to maintain high- quality, curated information
[@pico2008wikipathways].

## Future Considerations

With the success of Minimum Information guidelines and standardized
representations of biological models, quantitative modeling has surged in
popularity. However, the ever-growing number of published dynamic models
published also presents a significant challenge in terms of model reuse and
integration. While there is currently no agreed upon way to merge smaller sub-
models into larger models, MIRIAM and MIASE annotations enable model composition
software to make use of the semantic information and enable algorithms parse
through models, or parts of models, of interest to the user. Recent efforts in
this arena include semanticSBML [@krause2010annotation], SemSim
[@neal2009advances], and the SBML Reaction Finder [@neal2012sbml].

# Platforms

## Modeling

The first systems biology simulation package, BIOSIM, was written in the 1960s
[@Ga68]. Since then, m



### CellDesigner

CellDesigner (<http://www.celldesigner.org/>) is a structured diagram editor for
drawing gene-regulatory and biochemical networks. Networks are drawn based on
the process diagram, with graphical notation system that influenced the
development of SBGN, and are stored using the Systems Biology Markup Language
(SBML), a standard for representing models of biochemical and gene-regulatory
networks. CellDesigner supports simulation and parameter scanning through a
selection of different simulation engines, SBML ODE Solver, Copasi, or SBW
[@funahashi2003celldesigner;@funahashi2008celldesigner].

### JSim

JSim [@raymond03] is a Java-based simulation system for building quantitative
numeric models and  analyzing them with respect to experimental reference data.
JSim was developed primarily for generating model solutions for use in designing
experiments and analyzing data in physiological and biochemical studies, but its
computational engine is general and equally applicable to  solving equations in
physics, chemistry, and mechanics. JSim has been under development at the
National Simulation Resource for Mass Transport and Metabolism (NSR) since 1999.
JSim uses a model specification language, MML (for Mathematical Modeling
Language) which supports ordinary and partial differential equations, implicit
equations, integrals, summations, discrete events, and allows calls to external
procedures. JSim's compiler translates MML into Java code in which the numeric
results are calculated. Within the JSim graphical user interface (GUI) users
adjust parameter values, initiate model runs, plot data, and perform behavioral
analysis, sensitivity analysis, parameter optimization for curve fitting.
Alternatively one can use JSim's command line interfaces (jsbatch and jsfim).
JSim's capabilities are more advanced than previous NSR software systems SIMCON
[3], for simulation control, and XSIM [4] for X-terminal operation. JSim source
code, binaries (for Windows, Macintosh and Linux) and documentation  are
available free for non-commercial use at <http://physiome.org/>.

MML is a text-based format that is the primary form of model representations in
the JSim platform [@raymond03]. Unlike SBML and CellML which are based on XML,
MML uses its own a C-styled language for model declaration. MML models are often
expressed generally in terms of mathematical equations -- any mixture of
ordinary and partial differential equations, implicit equations, integrations,
discrete events, and even external programming code, such as Java, C, or MATLAB.
One feature that sets MML apart from other model languages is its awareness of
physical units when run through JSim's MML compiler [@chizeck2009].


### JDesigner

One of the first visualization tools, JDesigner [@Sauro:Omics] also implements a
traditional way to depict networks (see Figure \ref{Figure:jdesigner}) using a
pictorial representation to indicate substances and reactions. JDesigner also
employs Bezier curves to represent arcs in an attempt to make the diagrams
similar to the notation found in many molecular biology text books. CellDesigner
and JDesigner connect to the Systems Biology Workbench (SBW) for simulation
support.

![Example of JDesigner's visual
format\label{Figure:jdesigner}](images/JDesigner1.eps)

Finally, there is a proposal from a commercial company called Gene Network
Sciences which has devised a derivative of the Kohn notation called DCL. However
this notation is proprietary and its utility to the general scientific
community is not certain at this time.


### Systems Biology Workbench (SBW)

SBW (Sauro et. al., 2004) is an extensible software framework that is both
platform and language independent. Its primary purpose is to encourage code
reuse among members of the systems biology community.  Developers can run SBW on
Linux, Windows or Mac OS and can develop software in a variety of different
languages including C/C++, Java, Delphi, FORTRAN, MATLAB, Perl, Python and any
.NET language (e.g. Visual Basic or C\#). The SBW was originally developed in
parallel with SBML (Systems Biology Markup Language) as part of the Symbiotic
Systems Project ERATO project at Caltech, Pasadena.

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
Python, Perl, MATLAB, any .NET language.  Data is exchanged between modules via
binary messages which can include any combination of bytes, integers, floating
point, complex numbers, strings, arrays and lists.  Currently the available
modules include, simulators, model editors, SBML manipulation, math library,
frequency analyzer, bifurcation discover and analysis modules, structural
analysis modules and others. Further details to be found at
<http://www.sys-bio.org>.\label{Figure:sbw}](images/sbwFig.eps)

An SBW module (the client) provides one or more interfaces or services.  Each
service provides one or more methods. Modules register the services they provide
with the SBW Broker. The module optionally places each service it provides into
a category. By convention, a category is a group of services from one or more
modules that have a common set of methods.

One of the key advantages of SBW is its language and OS neutrality. At a stroke
this eliminates the irrational language and operating systems wars that often
plague software development. In addition to providing support for multiple
languages there is also the facility to automatically generate web services from
any SBW module.

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

### VCell

The Virtual Cell (VCell; <http://vcell.org/>) 

VCell is particularly suited
to spatial modeling

[@moraru2008virtual]

The Virtual Cell (VCell; <http://vcell.org/>) is a problem solving environment,
built on a central database, for analysis, modelling and simulation of cell
biological processes. VCell integrates a growing range of molecular mechanisms,
including reaction kinetics, diffusion, ow, membrane transport, lateral membrane
diffusion and electrophysiology, and can associate these with geometries derived
from experimental microscope images. It has been developed and deployed as a
web-based, distributed, client server system, with more than a thousand world-
wide users. VCell provides a separation of layers (core technologies and
abstractions) representing biological models, physical mechanisms, geometry,
mathematical models and numerical methods. This separation claries the impact of
modelling decisions, assumptions and approximations. The result is a physically
consistent, mathematically rigorous, spatial modelling and simulation framework.
Users create biological models and VCell will automatically (i) generate the
appropriate mathematical encoding for running a simulation and (ii) generate and
compile the appropriate computer code. Both deterministic and stochastic
algorithms are supported for describing and running non-spatial simulations; a
full partial differential equation solver using the nite volume numerical
algorithm is available for reactiondiffusionadvection simulations in complex
cell geometries including 3D geometries derived from microscope images. Using
the VCell database, models and model components can be reused and updated, as
well as privately shared among collaborating groups, or published. Exchange of
models with other tools is possible via import/export of SBML, CellML and MATLAB
formats. Furthermore, curation of models is facilitated by external database
binding mechanisms for unique identication of components and by standardised
annotations compliant with the MIRIAM standard. VCell is now open source, with
its native model encoding language (VCML) being a public specication, which
stands as the basis for a new generation of more customised, experiment-centric
modelling tools using a new plug-in based platform.

## Simulation Engines

Simulation and modeling is becoming one of the standard approaches to understand
complex biochemical processes. Therefore, there is a growing need for software
tools that allow access to diverse simulation and modeling methods as well as
support for the usage of these methods. These software libraries should be
compatible, e.g. via file standards, platform independent and user friendly to
avoid time-consuming conversions and learning procedures. In addition, the
software should be actively maintained and updated by its authors.

### COPASI

Pedro Mendes wrote one of the earliest PC simulators which he called Gepasi
[@Gepasi:1993]. COPASI [@hoops2006copasi] is essentially a rewrite of
Gepasi, that comes in two versions: a graphical user interface and a command
line version. The command line version is designed for batch jobs where a
graphical user interface is unnecessary and where runs can be carried out
without human supervision. COPASI uses its own file format to store models,
however like all the tools discussed here, it can import and export SBML. One of
its undoubted strengths is optimization and parameter fitting which it inherited
from its predecessor. It has an unique ability to optimize on a great variety of
different criteria including metrics such as eigenvalues, transient times etc.
This makes COPASI extremely flexible for optimization problems. Installation is
very simple and entails using a one-click installer. Although the source code to
COPASI is available and can be freely used for research purposes in academia,
owing to the way in which the development of COPASI was funded there are
restrictions on commercial use.

The graphical user interface is based on a menu/dialog approach, much like its
immediate predecessor, Gepasi. COPASI has capabilities to simulate deterministic
as well as stochastic models and includes a wide range of analyzes. It correctly
takes into account conservation laws and has very good support for metabolic
control analysis amongst other things. COPASI is without doubt one of the better
simulators available. Although the user interface is graphical, it does, due to
its particular design, require some effort to master but with the availability
of the COPASI the source code, there is the opportunity to provide alternative
user interfaces.. Finally there is a version that has an SBW interface (Systems
Biology Workbench) which allows SBW enabled tools access to COPASI's
functionality (currently available at <http://sys-bio.org/>).

#### SimpleCopasi

SimpleCopasi (<http://code.google.com/p/copasi-simple-api/>) is a C interface to
the C++ Copasi library. The core functionality of reading, writing, simulating,
and numerical analysis of SBML models is retained from Copasi. In addition,
Antimony scripts can be used to load models. The structural library
(<http://libstruct.sourceforge.net/>) is also included within this
library for analyzing the stoichiometric networks.

### RoadRunner

RoadRunner is a powerful and portable simulation engine that is used in SBW, a
resource sharing framework that allows applications to share functionality with
each other [@bergmann2006sbw]. Jarnac and Roadrunner are already included with
an SBW installation. COPASI and SBML ODE Solver may also be used as simulation
engines alongside RoadRunner within SBW [@bergmann2008comparing].

Instead of interpreting model equations, roadRunner will  compiles the model
equations dynamically, which results in  much improved performance when compared
with traditional simulators. RoadRunner uses the integrator CVODE and NLEQ for
steady state analysis [@cohen1996cvode]. To further speed up the simulation,
the model is separated into a system of independent and dependent variables.
This separation process is described in detail in
[@vallabhajosyula2006conservation]. Thus, all major operating systems are
supported given that roadRunner only depends on CVODE and NLEQ being available
on the platform.

## MATLAB

MATLAB (<http://www.mathworks.com/products/matlab/>) is one of the most widely
used numerical platforms in science and engineering. MATLAB contains an
excellent numerical and data analysis methods useful for systems biology. Many
add-ons, referred to as "toolboxes" are available commercially or open-source to
extend the functionality of MATLAB.

### SimBiology

MathWorks offers a specialized toolbox called SimBiology
(<http://www.mathworks.com/products/simbiology/>, @simbiology) which offers many
useful capabilities. SimBiology provides graphical and programmatic tools to
model, simulate, and analyze dynamic biological systems. SimBiology also
includes a library of common pharmacokinetic/pharmacodynamic models. Users may
use a graphical block diagram editor for building models, or directly import
existing SBML models. Models within SimBiology can then use MATLAB's powerful
scripting interface and extensive set of built-in ODE and stochastic solvers for
simulation.

### Systems Biology Toolbox (SBToolBox2) and PottersWheel

SBToolBox2 (<http://www.sbtoolbox2.org/main.php>) is a very extensive, open-
source, MATLAB tool box developed by Henning Schmidt [@schmidt2006systems]. The
tool box has a wide range of capabilities. In addition, PottersWheel
[@maiwald2008dynamical], is a very comprehensive parameter fitting tool that
works well with the SBToolBox2 but can also be used alone. In a number of cases
it is better than COPASI's capabilities particularly in the area of generating
nonlinear confidence limits on parameter fits and analyzing the resulting fit.
The experimental data input formats are also very flexible. The tool provides a
number of optimization algorithms including genetic and simulated annealing
approaches.

### SBML to MATLAB Translation

It is also possible to export SBML models into MATLAB scripts without the need
for any additional toolboxes. SBML2MATLAB (<http://stanley-gu.github.com/sbml2matlab/>) is a cross-platform tool for performing such
conversions. The SBML model structures and mathematics are mapped to MATLAB
functions and structures, allowing users to easily manipulate the models through
additional MATLAB scripting. SBML2MATLAB has also been integrated as a
standalone web application (<http://stanley-gu.github.com/node-sbml2matlab/>)
that provides a user friendly interface for using SBML2MATLAB without any need
for installing software.

In addition, an web application for viewing, editing, and simulating SBML models
is also actively being developed (<http://stanley-gu.github.com/snap/>), which
would allow modelers work on any platform that supports a web browser,
circumvent the need to install any software, and not be limited by the local
computer hardware power by performing computationally intensive calculations on
a remote server.

# Applications

In recent years there has been a proliferation of software applications for the
systems biology community (See Figure \ref{figure:apps}).

![The Release of Software Tools for Computational Systems Biology over Time.
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
available it soon became clear that this task would be too great. However,
fortunately the SBML consortium provides a very comprehensive overview of
different software applications and their main features, located here:
<http://sbml.org/SBML_Software_Guide/SBML_Software_Matrix>.

However, several applications will be mentioned here 

There are some applications however that are worth mentioning specifically
because they have some special characteristic. Table 1 lists a number of
applications which are being actively maintained, have a reasonably large user
base and offer facilities that are either unique or well done. I have not
mentioned any stochastic simulators in Table 1 because many of these are still
immature.


* * * *

**Application and Description**

Gepasi: 
:	This is a forms based application which has been maintained for many
	years by a dedicated author, the tool is particularly adapt at carrying out
	optimizations of ODE based models to data  
		- Closed source; Windows [@Gepasi:1993].

Jarnac/JDesigner: 
:	Jarnac is a script based application, JDesigner (See
	Figure 3) is a visual design tool which can use Jarnac via SBW to carry out
	simulations. The simulation capabilities of Jarnac are quite extensive, 
	offering both ODE and stochastic simulation  
		- Open Source; Windows [@sauro:2000; @Sauro:Omics].

Pysces: 
:	This is a very complete ODE based simulation environment built
	around the scripting language Python.  
		- Open Source; Windows, Linux, OS X [@Pysces2004].

WinSCAMP: 
:	A script based GUI application, which like Gepasi has a long
	tradition. Specialized for time course, steady state and metabolic control
	analysis of ODE based models.  
		- Source available upon request; Windows [@SauroF91; @SauroScamp93]

VCell: 
:	A very mature server based application that is specialized to build
	and simulate large scale spatial (PDE) models.  
		- Open Source; Windows, Linux, OS X [@VCELL].

* * * *

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

The table below lists some of the most important techniques that are available for
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
study, Vijay Chickarmane estimated that the time required to fit a
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
this problem, one is to develop extensible frameworks such as SBW, the other is
to develop a suite of open-source libraries which can carry out specific
functionality. An example of this is libSBML being developed by the SBML team.
This library, written in C/C++ for maximum portability, enables other developers
to concentrate on simulation capability rather than waste unnecessary effort
developing their own SBML parser. In terms of other possible libraries, examples
include, open-source Gillespie based stochastic solvers and ODE solvers. In both
cases there is also the need to develop scalable and robust methods for
computing the dependent and independent species. Further more, hybrid methods
combining continuous and stochastic methods is a pressing need at the current
time. Many biological systems interface noisy sensory apparatus (e.g. ligand
binding to the surface of a cell membrane) to internal continuous analog
networks [@SauroReview:2004]. In addition to the core solvers, we also need
scalable analysis tools, particularly bifurcation analysis tools and sensitivity
analysis tools. On the model validation front, much remains to be done,
particularly the relationship between model validation and how this can direct
future experimentation. This leads on to the development of new methods and
algorithms for analyzing the complex networks in particular methods should be
developed to modularize large networks since understanding an entire network is
virtually impossible with out some recourse to a hierarchical modularization.

Finally, the role of high performance computing in systems biology is still very
novel. In fact there appear to be very few applications to date of high
performance computing to systems biology. One of the few useful applications is
model fitting to data. When done correctly, this is an extremely computationally
intensive calculation and is an ideal candidate for large cluster machines. In
fact, one wonders whether this is the application for systems biology which
could benefit from Grid computing.

# Recommended Resources

Three main web sources which are of interest to readers of this chapter include:

<http://www.cellml.org> :
:	This is the main CellML site. It has a very rich set
	of models expressed in CellML including specifications for the standard and
	pointers to software toolkits.

<http://www.sbml.org> :
:	This is the main SBML site. The site as ample
	documentation, examples illustrating how SBML is and should be used. In addition
	is has a rich set of software tools, in particular libSBML, which allows
	developers to easily add SBML support to their tools.

<http://www.sys-bio.org> :
:	This is the main SBW (Systems Biology Workbench)
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
