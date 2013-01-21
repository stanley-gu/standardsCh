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
Markup Language (MAGE-ML) [@brazma2001minimum], [@spellman2002design]. In many
ways, this precedent has become the prototype for subsequent data annotation
guidelines in systems biology [@quackenbush2006standardizing].

The early success of MIAME and its widespread adoption led to the development of
many domain-specific extensions and variations. MIAME is now accompanied with a
myriad of "minimum information" reporting standards initiatives that cover
practically every major biotechnological field [@naturebiotechnology2006]. The
Minimum Reporting Guidelines for Biological and Biomedical Investigations
(MIBBI) project has arisen as a comprehensive source of these reporting
"checklists" @taylor2008promoting]. MIBBI maintains a web-based and freely
accessible resource for minimum information standards (http://www.mibbi.org/),
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

Most of the encoded models available in scientific publications or on the
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
Minimum Information About a Simulation Experiment (MIASE) describes the minimal
set of information that must be provided to make the description of a simulation
experiment available to others. It includes the list of models to use and their
modifications, all the simulation procedures to apply and in which order, the
processing of the raw numerical results, and the description of the final
output.

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

The value of any kind of data is greatly enhanced when it exists in a form that
allows it to be integrated with other data. One approach to integration is
through the annotation of multiple bodies of data using common controlled
vocabularies or 'ontologies'. Unfortunately, the very success of this approach
has led to a proliferation of ontologies, which itself creates obstacles to
integration. The Open Biomedical Ontologies (OBO) consortium is pursuing a
strategy to overcome this problem. Existing OBO ontologies, including the Gene
Ontology, are undergoing coordinated reform, and new ontologies are being
created on the basis of an evolving set of shared principles governing ontology
development. The result is an expanding family of ontologies designed to be
interoperable and logically well formed and to incorporate accurate
representations of biological reality. We describe this OBO Foundry initiative
and provide guidelines for those who might wish to become involved.

In the search for what is biologically and clinically significant in the swarms
of data being generated by today's high-throughput technologies, a common
strategy involves the creation and analysis of 'annotations' linking primary
data to expressions in controlled, structured vocabularies, thereby making the
data available to search and to algorithmic processing. The most successful such
endeavor, measured both by numbers of users and by reach across species and
granularities, is the Gene Ontology (GO). There exist over 11 million
annotations relating gene products described in the UniProt, Ensembl and other
databases to terms in GO [@smith2005relations].

### Open Biomedical Ontologies (OBO)

In 2001, Ashburner and Lewis initiated a strategy to address this object-level
question by creating OBO, an umbrella body for the developers of life-science
ontologies. OBO applies the key principles underlying the success of the GO,
namely, that ontologies be open, orthogonal, instantiated in a well-specified
syntax and designed to share a common space of identifiers. Ontologies must be
open in the sense that they and the bodies of data described in their terms
should be available for use without any constraint or license and so be
applicable to new purposes without restriction. They are also receptive to
modification as a result of community debate. They must be orthogonal to ensure
additivity of annotations and to bring the benefits of modular development. They
must be syntactically in good order to support algorithmic processing. And they
must employ a common system of identifiers to enable backward compatibility with
legacy annotations as the ontologies evolve.

OBO now comprises over 60 ontologies, and its role as an ontology information
resource is supported by the NIH Roadmap National Center for Biomedical Ontology
(NCBO) through BioPortal (http://bioportal.bioontology.org/)
[@noy2009bioportal]. At the same time, the developers of a subset of OBO
ontologies have initiated the OBO Foundry, a collaborative experiment based on
the voluntary acceptance by its participants of an evolving set of principles
(available at http://obofoundry.org) that extend those of the original OBO by
requiring in addition that ontologies (i) be developed in a collaborative
effort, (ii) use common relations that are unambiguously defined, (iii) provide
procedures for user feedback and for identifying successive versions and (iv)
have a clearly bounded subject-matter (so that an ontology devoted to cell
components, for example, should not include terms like 'database' or 'integer')
[@smith2007obo].

#### Systems Biology Ontology (SBO)

One of the goals of the Systems Biology Ontology (SBO, http://www.ebi.ac.uk/sbo/
webcite) is to facilitate the immediate identification of the relation between a
model component and the model structure. SBO is currently made up of four
different vocabularies. Within a vocabulary, the terms are related by "is a"
inheritances, which represent sub-classing.

1. A classification of rate laws. This CV is a taxonomy of kinetic rate equations. Examples of terms in this CV are "mass action kinetic", "Henri-Michaelis-Menten kinetics", "Hill function" etc. Note that although taking the same mathematical form, the rate-laws "Henri-Michaelis-Menten", "Van Slyke" and "Briggs-Haldane", being based on different assumptions, will be represented by different terms. This will help a user to choose the adequate conversion to elementary steps if needed.

2. A taxonomy of the roles of reaction participants, including the following terms: "catalyst", "substrate", "competitive inhibitor", "non-competitive inhibitor" etc.

3. A CV for parameter roles in quantitative models. This CV includes terms such as "forward unimolecular rate constant", "Hill coefficient", "Michaelis constant" etc.

4. A list of modelling framework, that precises how to interpret a mathematical expression, such as "deterministic", "stochastic", "boolean" etc.

The annotation of model components with SBO terms will be an essential step to
reach MIRIAM-compliance. Not only such an annotation will be important to
understand and to programmatically analyse models, it will also power the search
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

In recent years, particularly since the sequencing of the human genome, there
has been an ever increasing list of wide ranging cellular models published in
the literature. Each author has a particular notation that they use to publish
the model. Some authors will publish the model as a reaction scheme, much like
the notation given in Figure \ref{Figure:sbw}. Others will itemize the actual
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
network models. There are however fundamental differences between the
approaches that CellML and SBML take in the way models are represented.

Both CellML and SBML are based on Extensible Markup Language (XML)
[@bray1997extensible]. XML is a popular choice for model exchange languages
because:

#. XML is easily transmitted through the Internet (much like HTML).
#. There are a large number of software tools and libraries for parsing XML.
#. XML documents are human legible, reasonably clear, and easy to modify.

### Systems Biology Markup Language (SBML)

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
the receptor tyrosine kinase consortium. Much of the SBML support is in stand-
alone applications, however, a number of database vendors have also decided to
provide export of SBML as an option, examples include reactome, stke and
sigpath.

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
resource for the community [@beard2009cellml].

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

A number of software of packages are written to work with NeuroML,  NEURON
[@carnevale2006neuron], GENESIS [@bower1995book], MOOSE [@ray2008pymoose], NEST
[@diesmann2001nest], and PSICS [@cannon2010stochastic]. These different
environments were successfully able to reproduce the same model simulation
(including a reconstruction of the 3D structure of a neural pathway), using
NeuroML as the exchange format [@gleeson2010].

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
Unlike metabolic networks, signaling networks can be extremely complex with
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
Bezier curves to represent arcs in an attempt to make the diagrams similar to
the notation found in many molecular biology text books. CellDesigner and
JDesigner connect to the Systems Biology Workbench (SBW) for simulation support.

![Example of JDesigner's visual
format\label{Figure:jdesigner}](images/JDesigner1.eps)

Finally, there is a proposal from a commercial company called Gene Network
Sciences which has devised a derivative of the Kohn notation called DCL. However
this notation is proprietary and its utility to the general scientific
community is not certain at this time.

#### Systems Biology Graphical Notation (SBGN)

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

The Biological Connection Markup Language (BCML) is a format to describe,
annotate and visualize pathways. BCML is able to store multiple information,
permitting a selective view of the pathway as it exists and/or behave in
specific organisms, tissues and cells. Furthermore, BCML can be automatically
converted into data formats suitable for analysis and into a fully SBGN-
compliant graphical representation, making it an important tool that can be used
by both computational biologists and wet lab scientists.

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
(http://www.python.org) programming language that runs on both Microsoft Windows
(2000/XP) and Linux. It runs as either a single user application on Windows or a
multi-user application under Linux. PySCeS makes use of the Scientific Libraries
for Python (SciPy), a large collection of mathematical algorithms for science
and engineering applications (http://www.scipy.org). Some of the advantages of
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

### High-throughput Data

CellML and SBML are the primary formats used to store interchangeable dynamic
models. Apart from the particular details on the model itself there is also the
need to consider data that is used to build the models. Most models are built by
laboriously searching the literature and carrying out additional experiments as
necessary to fill in gaps in the data. This has proved to be an extremely
effective method to building reliable models [@TysonNatReview2001;
@TysonBioessay2002].  However, Many inexperienced researches in Systems Biology
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

BioModels Database (http://www.ebi.ac.uk/biomodels/), part of the international
initiative BioModels.net, provides access to published, peer-reviewed,
quantitative models of biochemical and cellular systems. Each model is carefully
curated to verify that it corresponds to the reference publication and gives the
proper numerical results. Curators also annotate the components of the models
with terms from controlled vocabularies and links to other relevant data
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
as the CellML repository CellML repository [(5),
http://www.cellml.org/examples/repository/index.html] JWS Online (6) and the
former SBML repository. In addition specialist repositories include SenseLab
ModelDB (7), the Database of Quantitative Cellular Signalling (DOCQS) (8) and
SigPath (9). However no general public resource existed that allowed the user to
browse, search and retrieve annotated models

Here we present BioModels Database, developed as part of the BioModels.net
initiative (http://www.biomodels.net/). BioModels.net is a collaboration between
the SBML Team (USA), the EMBL-EBI (UK), the Systems Biology Group of the Keck
Graduate Institute (USA), the Systems Biology Institute (Japan) and JWS Online
at Stellenbosch University (South Africa). Its aims are as follows: (i) to
define agreed-upon standards for model curation, (ii) to define agreed-upon
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
identifier (http://www.pubmed.gov) or a DOI (http://www.doi.org) or an URL that
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

The CellML Model Repository (http://www.cellml.org/models) is a similar effort,
containing biochemical pathway models that have been described in peer-review
publications, expressed in SBML. Similarly, JWS Online
(Olivier and Snoep, 2004) is a repository of kinetic models describing
biological systems, and ModelDB (Hines et al., 2004) is a database which stores
published models in the field of computational neuroscience.

CellML (Lloyd et al., 2004) and the CellML Model Repository are part of the IUPS
Physiome Project (Hunter and Nielsen, 2005) effort to create a virtual
physiological human. The explicit representation of modularity, together with
the flexible nature of the CellML language which allows the description of a
diverse range of cellular and subcellular systems, are two essential features of
CellML with regards to its role in the Physiome Project.

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
processes, including: signal transduction pathways, metabolic pathways, elec-
trophysiology, immunology, the cell cycle, muscle contraction and mechanical
models and constitutive laws. This wide scope exemplifies CellML's ability to
describe much of the biochemistry, electrophysiology and mechanics of the
intracellular environment. Lumped parameter models dealing with systems
physiology (e.g. blood pressure control, fluid retention, electrolyte balance,
endocrine function, etc.) are also within the scope of CellML.

Currently, of the 330 models in the CellML Model Repository, approximately half
have been curated to some degree. A star system signifies the curation status of
a CellML model. No stars indicate the model has yet to be curated (level 0); one
star denotes the CellML model is consistent with the published paper (level 1);
two stars imply the CellML model has been checked for typographical errors, unit
consistency, completeness (i.e. there are no missing parameters or equations),
overconstraints and finally, and arguably most importantly, the CellML model is
capable of reproducing the published results (level 2). If a CellML model has
three stars it is known to satisfy physical constraints such as conservation of
mass, momentum, charge, etc. At this level the curation is conducted by a domain
expert (level 3).

From experience, we have found that levels 1 and 2 can be mutually exclusive.
Frequently, the errors introduced into the model during the publication process
require us to correct minor typographical errors or unit inconsistencies, and/or
contact the original model author to request missing parameter values or
equations.

The process of model curation involves the following sequence of actions:

The CellML model is loaded into an editing and simulation environment such as
the Physiome CellML Environment (PCEnv) or Cellular Open Resource (COR). Any
obvious typographical errors and unit inconsistencies are corrected, which is
facilitated by a series of error messages and validation prompts generated by
the software, and the rendering of the MathML equations in an easily readable
format.

Assuming the model is able to be run, we then compare the simulation output with
the results in the published paper. This typically involves comparing the
graphical results with the published figures.

If we cannot get the CellML model to run, or the simulation output disagrees
with the published results, we then attempt to contact the original model
author(s) and seek their advice and, where possible, obtain the original model
code, which may be in a wide range of different programming languages.

We aim to complete the curation of all the models in the CellML repository,
ideally to the level that they replicate the results in the published paper
(level 2), however we acknowledge this will not be possible for all models.
According to the dynamic, growing nature of the CellML Model Repository, we have
designed it with the concept of community curation in mind, so that groups of
expert modelers with vested interests in particular models are able to
collaborate on their curation.

[@lloyd2008cellml]

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
(O'Sullivan, 2007). By providing version tracking, this system ensures that
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
released.

The access control and presentational layer of PMR2 is managed by Plone (Aspeli,
2007), a Content Management System. The access control features of Plone allow
authorized users to manage permissions for other users, such as allowing a user
to view a private workspace, push changesets, create exposures and update
workflow states such as expiring exposures.

PMR2 is accessible to the end user over a web interface. Exposure pages in a
PMR2 based repository can be accessed simply by entering the URL of the
repository into a web browser. PMR2 has been used to create the CellML Model
Repository, which currently contains over 500 CellML models and can be viewed at
http://models.cellml.org/. Modelers will need to use a Mercurial client to
create local clones of existing workspaces.

[@yu2011physiome]

### JWS Online

JWS Online aims to provide a service to the Systems Biology community by 1)
giving access to a database of curated models of biological systems, and 2)
allowing the users to run these models in a web browser via an easy to use
interface, and 3) helping in reviewing of manuscripts containing kinetic models.
JWS Online is linked to a number or research initiatives: SysMO-DB, The Virtual
Liver, and UniCellSys, and universities and research institutes: Stellenbosch
University, Vrije Universiteit Amsterdam, Manchester University and the Centre
for Plant Integrative Biology. In addition JWS Online is an important component
of an ambitious research initiative: The Silicon Cell.

JWS Online is a repository of kinetic models, describing biological systems,
which can be interactively run and interrogated over the Internet. It is
implemented using a clientserver strategy where the clients, in the form of web
browser based Java applets, act as a graphical interface to the model servers,
which perform the required numerical computations. Availability: The JWS Online
website is publicly accessible at http://jjj.biochem.sun.ac.za/ with mirrors at
http://www.jjj.bio. vu.nl/ and http://jjj.vbi.vt.edu/ Contact: jls@sun.ac.za
OVERVIEW Kinetic models are powerful tools for describing and understanding the
behaviour of complex cellular systems. Since the 1960s and especially in the
last decade a large number of these models have been constructed and today form
the basis for projects such as the Silicon Cell, SiC!
(http://www.siliconcell.net/). However, key problems are often encountered by
biologists who would like to study these models. For example, no central model
database exists for kinetic models, making it difcult to nd all the relevant
information needed to build and study published models. Even when models are
publicly available they often require a specic software environment to run in.
This environment typically includes software that might be either operating
system dependent, expensive to obtain or difcult to set up and maintain. New
initiatives, such as the one by the System Biology Markup Language (SBML)
working group (http://www.sbml.org/), are beginning to address the problem of
model interchange by creating a standard language for describing biochemical
reaction networks. Using SBML, modellers may easily exchange models between
compatible applications such as Gepasi (Mendes, 1997) or Jarnac (Sauro, 2000).
Currently, only a limited number of models are available in the SBML format. A
need, therefore, exists for both a central repository of kinetic models as well
as a freely accessible, platform-independent and user-friendly modelling
interface that allows these models to be run using the Internet

On visiting the JWS Online sites, which are freely available from a growing
number of international locations, the database page contains all the currently
available online models. These range in type from those built with realistic
parametersso-called silicon cell models typically obtained from literature, e.g.
Helfert et al. (2001)to core models useful for teaching purposes. The database
page also contains links to any relevant bibliographic information and we have
established a collaboration with the SBML working group to make SBML versions of
the models in the database available for download. Once requested from the
database, the model page is displayed, as shown in Figure 1. It consists of two
main sections: the client applet Figure 1a and its metabolic reaction scheme
Figure 1b. The applet acts as a graphical interface to the server and three
types of analyses are available: a time simulation, steady-state analysis and
metabolic-control analysis. The model parameters may easily be changed by
setting their values in an input table situated on the left-hand side of the
applet. The type of analysis to be performed may be selected using the tabbed
panel on the applets right-hand side. Each analysis type has various suboptions
that become available on its selection. The time simulation allows either
selected metabolite concentrations or enzyme rates to be output as required.
Metabolic control analysis (MCA) is used to study the control properties of the
system at steady state (Kacser and Burns, 1973). The steady-state solution of
the system may be calculated as well as various structural properties of the
system (such as the K and L matrices) (Hofmeyr, 2001), elasticities and control
coefcients. If the mouse cursor is moved over an enzyme on the reaction scheme,
the selected steps rate equation is displayed in the lower window (Fig. 1c). All
results are returned to the applet and displayed individually as shown in Figure
1d and e.

[@olivier2004web]

### Payao

Summary: Payao is a community-based, collaborative web service platform for
gene-regulatory and biochemical pathway model curation. The system combines Web
2.0 technologies and online model visualization functions to enable a
collaborative community to annotate and curate biological models. Payao reads
the models in Systems Biology Markup Language format, displays them with
CellDesigner, a process diagram editor, which complies with the Systems Biology
Graphical Notation, and provides an interface for model enrichment (adding tags
and comments to the models) for the access-controlled community members.

Availability and implementation: Freely available for model curation service at http://www.payaologue.org. Web site implemented in Seaser Framework 2.0 with S2Flex2, MySQL 5.0 and Tomcat 5.5, with all major browsers supported.

Creating an extensive model of gene-regulatory and biochemical networks with the latest data is a painstaking task. Curation is essential to creating an accurate model. Yet as science and technology advances rapidly, once curated models soon become out-of-date and need to be revised constantly. Many pathways and networks are now available online via pathway databases, such as Reactome, BioModels.net, Panther Pathways and many pathway editors are available (Bauer-Mehren et al., 2009). What is needed is a framework to facilitate tracking and update mechanism for modelers and researchers in the community to contribute to the collaborative model building and curation process.

WikiPathways (Pico et al., 2008) is an effort for such a collaborative platform in the Wiki style. While the Wiki system has its strength in collaborative editing and version tracking, it does not provide access control or explicit community tagging mechanisms. In a community-driven model enrichment environment, it is effective to differentiate privileges to special interest group (SIG) members for curation activitiescommenting on existing tags, adding tags to models, annotating individual component inside a model and validating the annotations. In view of the complexity of biological pathways and the expertise of biologists in different areas, a community platform for biology requires an exquisite balance of federated resource sharing and quality control of information by a SIG of experts in the particular pathway or process. An access control privilege system allows the community to share and disseminate the knowledge, while enabling a dedicated SIG to maintain high-quality, curated information.

To provide such a curation framework, we have developed a system called Payao. The system is named after a fish aggregating device, an artificial floating raft where fish congregate and popular in Okinawa/Philippine area. Payao aims to become a biological knowledge aggregating system, which enable a community to work on the same models simultaneously, insert tags as pop-up balloon to the parts of the model, exchange comments, record the discussions and eventually update the models accurately and concurrently.

The current workflow for pathway curation has two phases working in a cyclical manner, as shown in Figure 1: pathway editing using biological pathway editors (CellDesigner) and community-driven pathway enrichment and knowledge sharing. Payao serves for enrichment phase of the curation. Payao is a web-based platform, providing an interface for adding tags and comments to the components (such as Species, Reactions and specified area) of the model, as well as community management functionality. The information on the users and tag data is stored in a relational database (RDBMS) on the server. Payao adopts community standards, accepting Systems Biology Markup Language (SBML; Hucka et al., 2003) format models and displays them in Systems Biology Graphical Notation (Le Novere et al., 2009) compliant CellDesigner (Funahashi et al., 2008) graphical notation. Curation data on Payao can be easily reintegrated into the original model via CellDesigner.

2 PLATFORM

Payao consists of the server application, client user interface and database.
The server application has been implemented in Java on Seaser Framework 2.0 with
S2Flex2. Tomcat 5.5 was used as the servlet container to build the web
application. The client user interface has been implemented in ActionScript on
Flex framework 2.0.1, which allows us to build a Rich Internet Application to
visualize SBML models. The server communicates with the client via the Action
Message Format (AMF3) protocol on S2Flex2, which enables us to translate between
Java Objects in Seaser and Action Script Object in Flex. The server can handle
CellDesigner models including SBML models and the visual information using
CellDesigner API ver.4.0. It parses SBML files sent from client to create
CellDesigner models, and provides the information as CellDesigner Plugin
classes. The client application receives the model information and draws the
model. MySQL 5.0 is used to store information on user, model and tags/comments
in the database.

As Payao accepts pathway models stored in SBML format and uses CellDesigner APIs
for visualization, the most suitable SBML editor for Payao is CellDesigner. In
SBML format, models can capture details of biochemical process descriptions, not
only proteinprotein interactions. Adopting SBML format enables the models to be
easily used as the base of computational data analysis or simulation of dynamic
behaviors. The Payao platform enriches the model curation process by providing a
host of features for user management, tagging and model updates [detailed are
available for reference in (Payao User guide, 2009)].

3.1 Community management Forming a community is an important step for curation.
Different expertise groups can contribute variety of information to the model.
As web-based Payao can be accessible from all physical locations, it enables
experts across the world to communicate in a collaborative curation effort.

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

The Virtual Cell (VCell; http://vcell.org/) is a problem solving environment,
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
models with other tools is possible via import/export of SBML, CellML and MatLab
formats. Furthermore, curation of models is facilitated by external database
binding mechanisms for unique identication of components and by standardised
annotations compliant with the MIRIAM standard. VCell is now open source, with
its native model encoding language (VCML) being a public specication, which
stands as the basis for a new generation of more customised, experiment-centric
modelling tools using a new plug-in based platform.

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
available free for non-commercial use at http://physiome.org/.

### Cell Designer

[@funahashi2003celldesigner]

[@funahashi2008celldesigner]

Systems biology is characterized by synergistic integration of theory,
computational modeling, and experiments [1]. Identification of the logic and
dynamics of gene-regulatory and biochemical networks is a major challenge of
systems biology. From the view of computational modeling, a model is used to
understand the dynamics of biological phenomena. The model consists of molecules
and reactions that represents gene regulatory and biochemical network (such as
transcription, translation, proteinprotein interaction, enzymatic reaction,
etc.), and contains a mathematical equation for each reaction. So that the model
contains mathematical equations inside, it would be possible to simulate the
dynamics of the model and compare the simulation results with their experiments;
even more, it would be possible to tune the parameters in the model to fit with
the experimental results. This workflow is important to understand unknown
function or structure of biological phenomena, so development of software
infrastructure to support this workflow is essential for systems biology
research. While the software infrastructure is one of the most crucial
components in systems biology research, there has been almost no common
infrastructure or standard to enable integration of computational resources. For
example, researchers built their model with their specific application or inside
their simulator as a source code so that it was difficult to port their model to
be used on other applications. Since there was no gold-standard software for
systems biology research, at that time, researchers had to use multiple
applications to solve their problem. They had to switch their software to run
simulations, analyze the model, and fit parameters with their experimental
results. To solve this problem, the Systems Biology Markup Language 1 (SBML)
[2], [3] and the Systems Biology Workbench 2 (SBW) have been developed [4]. SBML
is an open, Extensible Markup Language (XML)-based format for representing
biochemical reaction networks, which enables researchers to share their model
between different software applications, while SBW is a modular, broker-based
message-passing framework for simplified intercommunication between
applications. Rapid acceptance of this standard is proved by the fact that more
than 110 simulation and analysis software packages already support SBML or are
in the process of supporting the standard.

We believe that the standardized technologies, such as SBML, SBW, and Systems
Biology Graphical Notation (SBGNa graphical notation for network diagrams of
biological models), play a critical role as the software platform to tackle this
challenge. As an approach, we have developed CellDesigner [5], a process diagram
editor for gene-regulatory and biochemical networks. CellDesigner currently
supports model creation, simulation, and database integrationthose features are
significant for users willing to create their model from scratch.

The current version (3.5.2, as of June 2008) of CellDesigner has the following
features:

representation of biochemical semantics; detailed description of state
transition of proteins; SBML compliant (SBML Level-1 and Level-2 Version-1);
integration with SBW-enabled simulation/analysis modules; integration with
native simulation library (SBML ODE Solver [6]); database connectivity; platform
independent. The aim of developing CellDesigner is to supply a process diagram
editor utilizing standardized technology (SBML and SBGN in this case) for every
computing platform, so that it could confer benefits to as many users as
possible. By using the standardized technology, any model can be easily ported
to other applications, thereby reducing the cost to create a specific model from
scratch. The main standardized features that CellDesigner supports are
summarized as graphical notation, model description, and application integration
environment. The standard for graphical notation plays an important role for
efficient and accurate dissemination of knowledge [7], and these standards for
model description enhance the portability of models among various software tools
and aid human readability. Similarly, the standard for application integration
environment will help software developers to provide the ability for their
applications to communicate with other tools.

A. Symbols/Expressions and SBGN

CellDesigner supports graphical notation and listing of symbols based on a
proposal by our group [7]. While we have proposed our original notation system,
graphical notation has now been developed as an international community based
activities called SBGN.3 So far, several graphical notation systems already have
been proposed [8], [9], [10], [11], [12]. The goal of SBGN is to design a
graphical notation system expressing sufficient information in more visible and
more unambiguous way, as we proposed [7]. We expect that these features will
become part of the standardized technology in systems biology field. The key
components of SBGN are:

to allow representation of diverse biological objects and interactions; to be
semantically and visually unambiguous; to be able to incorporate other
notations; to allow software tools to convert a graphically represented model
into mathematical formulas for analysis and simulation; to have software support
to draw diagrams; to make the notation scheme of SBGN freely available. To
accomplish the above requirements for the notation, we first decided to define a
notation by using a process diagram [7]. The notation graphically represents
state transitions of the molecules involved. In the process diagram
representation, each node represents the state of the molecules and complex, and
each arrow represents state transitions among the states of a molecule. In the
conventional entity-relationship diagrams, an arrow generally represents
activation of the molecule. However, this confuses the semantics of the diagram,
as well as limits possible molecular processes that can be represented [7]. A
process diagram represents a more intuitive way for model definition than
entity-relationship diagrams. One of the reasons is that the process diagram
could be explicitly represented as a temporal sequence of events whereas an
entity-relationship cannot. For example, in a process of mitosis-promoting
factor (MPF) activation in cell cycle, Wee1 phosphorylates residues of Cdc2
(Cell Division Cycle 2), is one of the components of MPF (Fig. 1). However, MPF
is not yet activated by this phosphorylation. If we use an arrow for activation,
we cannot properly represent the case. In the process diagram, on the other
hand, whether a molecule is active or not is represented as a state of the node
instead of an arrow symbol for activation. Promoting and inhibition of catalysis
are represented as a modifier of state transition using a circle-headed line and
a bar-headed line, respectively.

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

 RoadRunner (Bergmann and Sauro, 2006) and SBML ODE Solver (Machn et al., 2006).
This process was largely possible through the use of the Systems Biology
Workbench (SBW) (Bergmann and Sauro, 2006), a resource sharing framework that
allows applications to share functionality with each other. Jarnac and
Roadrunner are already included with an SBW installation. Emery Conrad enabled
Ocill8 for use in the SBW framework. For the comparison we wrapped COPASI and
SBML ODE Solver to be available for use within SBW. [@bergmann2008comparing]


roadRunner: In an effort to create a fully SBML compliant simulator we next
focused on creating roadRunner.  Instead of interpreting model equations,
roadRunner will  compile the model equations dynamically, which results in  much
improved performance  when compared with traditional simulators. RoadRunner uses
the integrator CVODE  and NLEQ (ZIB 2003) for steady state analysis. To further
speed up the simulation, the model is separated into a system of independent and
dependent variables. This separation process is described in detail in
(Vallabhajosyula et al.  2006). Again, roadRunner has been written completely in
C#. Provided that CVODE and NLEQ are available for a  given operating system,
roadRunner will run on that operating system. Thus, all major operating systems
are supported

[@bergmann2006sbw]

### COPASI

Simulation and modeling is becoming one of the standard approaches to understand
complex biochemical processes. Therefore, there is a growing need for software
tools that allow access to diverse simulation and modeling methods as well as
support for the usage of these methods. These software tools should be
compatible, e.g. via file standards, platform independent and user friendly to
avoid time-consuming conversions and learning procedures. In addition, the
software should be actively maintained and updated by its authors.

Standard methodology used in the field comprises, e.g. the deterministic
[integration of ordinary differential equations (ODEs)] and stochastic [e.g.
using Gillespie's algorithm; Gillespie (1976)] simulation of reaction networks,
the computation of steady states and their stability, stoichiometric network
analysis, e.g. computing elementary modes (Schuster et al., 1999), sensitivity
analysis [metabolic control analysis; Fell (1996); Heinrich and Shuster, 1997],
optimization and parameter estimation.

In order to meet this need for software in the field, several tools have been
developed and released recently (see http://www.sbml.org). Most tools offer
specific functionalities, e.g. stochastic simulations of reaction networks (Le
Novre and Shimizu, 2001) and flux analysis (Klamt et al., 2003). However, some
tools contain whole suites of functionalities, e.g. simulation, flux and control
analysis (Tomita et al., 1999; Sauro et al., 2003; Meng et al., 2004).

In order to improve the compatibility of these tools, markup languages such as
SBML (Hucka et al., 2003) and CellML (Lloyd et al., 2004) were created to allow
model exchange. Many tools are now able to read and write models in these file
formats.

Here we present a new programCOPASI (COmplex PAthway SImulator)which combines
all of the above standards and some unique methods for the simulation and
analysis of biochemical reaction networks. COPASI is the successor to Gepasi
(Mendes, 1993, 1997) and is available for all major operating systems (Linux,
Mac OS X, Windows, Solaris). As described below, COPASI supports non-expert
users by, for example, automatically converting reaction equations to the
appropriate mathematical formalism (ODEs or reaction propensities). The general
features of COPASI are described briefly and those that are unique are discussed
in more detail.

COPASI is a stand-alone program that can be used through two different
executable versions: a graphical user interface (CopasiUI) and a command line
version (CopasiSE) that only contains the calculation engine. CopasiSE is
intended for situations in which the user is not expected to interact with the
software. The following use cases are examples of situations in which it would
be used: (i) when third-party programs manipulate COPASI files, call CopasiSE to
produce results, and then inspect and continue generating other COPASI files
depending on results; (ii) to run simulations in the background, which is useful
when the run takes a long time; (iii) as a simulation engine for specialized
front-ends that may be created by others. Essentially, CopasiSE allows much
flexibility of execution and control, with the penalty that this version can
only run numerical procedures, not edit models. CopasiUI, on the other hand, is
the complete version of the program and is the one that we expect users to run
most often. CopasiUI provides a full graphical user interface (GUI), including
functions for creating and editing models and plotting results. In terms of
execution of the numerical procedures (simulation, optimization, etc.) the two
versions are essentially equal, except that CopasiUI may be slightly slower when
producing graphical output. In practice the two executables share the same
source code and are expected to produce exactly the same results.

COPASI's graphical interface is similar to Windows Explorer in operation, where
there is a vertical window on the left with a set of functions organized in a
hierarchical way; on the right there is a larger window that contains all of the
controls to operate the function selected on the left (Fig. 1). The major group
of functions in the program are as follows:

Model, where the model can be edited and viewed according to a biochemical or
mathematical perspective.

Tasks, consisting of the major numerical operations on the model: steady state,
time course, stoichiometry, metabolic control analysis and Lyapunov exponents.
Below each task an entry with results will appear after the task has been run.

Multiple Tasks, which are operations repeating elementary tasks: parameter
scanning, optimization and parameter estimation.

Developing a model usually means combining information, e.g. kinetic data, from
different sources. One possible source of errors in this process is the
conversion of units of concentrations, kinetic parameters, etc. Although COPASI
cannot do automatic conversion of such units, it provides help to the user in
the following way: When a kinetic function is entered (or chosen from the
integrated kinetics library) COPASI determines the units of the kinetic
parameters from an analysis of the rate law, where possible. This allows the
user to easily determine if available kinetic parameters from one source match a
kinetic function from another source. To our knowledge, COPASI is currently the
only software tool that is able to do so.

COPASI's native file format is based on XML and documentation of its schema is
available so that other tools can write (or read) it. COPASI can also read
Gepasi files, providing backwards compatibility with its predecessor. Finally
and as explained below in more detail COPASI is able to import SBML either level
1 or level 2, and thus it can obtain models from many sources, such as other
simulators, model databases, pathway databases and so on (see
http://www.sbml.org). To store the complete model information, including task
settings and output definitions, COPASI uses its own file format. Models can
also be exported in SBML and the program can write the ordinary differential
equations in plain C files (ready to be included in other C/C++ programs) and in
Berkeley Madonna's format (http://www.berkeleymadonna.com), a popular program
for nonlinear dynamics which does not import SBML.

COPASI can also output results of its various functions in two ways: report
files and plots. The user can define report files containing any number of
simulation results, parameters and other model items; this is done through an
interface where all these items are organized in a hierarchy. In addition, the
software has a number of predefined report formats that cover most of the common
use cases. Results of operations are also presented directly in the user
interface, in table format, which can be saved to tab-delimited files easily.
Examples of such tables presented directly are time courses, the Jacobian
matrix, matrices of control coefficients, etc. Tab-delimited files can also be
saved directly from the plot window. Plotting support is built-in and plots,
such as reports, can be defined in very flexible ways. COPASI supports xy line
plots and distribution histograms (a feature not commonly found in simulators,
Fig. 2), scales can be linear or log-transformed, and the plot window allows
zooming and panning.

COPASI calculates time courses using a deterministic or a stochastic framework,
depending on the user preference. For deterministic solutions, the LSODA
integrator is used (Petzold, 1983), whereas for stochastic solutions the
GibsonBruck version (Gibson and Bruck, 2000) of the Gillespie method (Gillespie,
1976) is applied (Fig. 2). In addition, a hybrid method that we developed is
also available and described below. The user can easily switch between these
methods by choosing from a drop-down list. COPASI can automatically convert
chemical kinetic rate laws into their appropriate discrete stochastic
equivalents, although this feature can be disabled when desired. Generally, for
not too small particle numbers, the propensity of a reaction (the differential
probability that a reaction event will happen in the next small time interval)
is proportional to the reaction rate, which is given by the kinetic function of
the reaction. This has been shown for mass action kinetics (Gillespie, 1976) and
is at least approximately true under certain conditions for other kinetic types,
such as MichaelisMenten (see discussion below). For very small particle numbers,
however, this relation does not necessarily hold. Consider, for example, a
second-order mass action reaction (2SP). Its forward reaction rate is
proportional to the square of the number of substrate particles. On the other
hand the probability of a reaction event, calculated from the probability that
two substrate particles meet (Gillespie, 1976), is proportional to , where NS is
the number of particles of the substrate. When presented with a model that was
written for the deterministic simulation paradigm, COPASI can automatically do
the conversion from N2 to N*(N1), thus enabling a transparent switch from
deterministic to stochastic simulation.

Another basic simulation function is the calculation of steady states, which is
carried out by a combination of the damped Newton method and forward or backward
integration (using LSODA). The steady state can also be characterized with
linear stability analysis (Stucki, 1978) and metabolic control analysis (Fell,
1996).

COPASI determines structural (stoichiometric) properties of the biochemical
network. Mass conservation is calculated using the algorithm described by
Vallabhajosyula et al. (2006) that uses Householder reflections.
(Vallabhajosyula et al. mentioned that COPASI used Gauss elimination for this
purpose, which was true at that time; however, since then we have switched to
using this more efficient algorithm.) Elementary flux modes, a unique set of the
smallest possible sub-networks that still allow a steady state (Schuster et al.,
1999) are calculated using our implementation of the METATOOL algorithm
(Pfeiffer et al., 1999).

COPASI is equipped with a number of diverse optimization algorithms that can be
used to minimize or maximize any variable of the model, following the scheme
proposed by Mendes and Kell (1998). Two algorithms are based on estimating
derivatives of the objective function, steepest descent and LevenbergMarquardt
(Levenberg, 1944; Marquardt, 1963; Goldfeld et al., 1966); a direct search
algorithm, which is based on geometric concepts, the HookeJeeves method (Hooke
and Jeeves, 1961); four evolutionary algorithms, evolutionary programming (Fogel
et al., 1992), genetic algorithm [a version with floating point encoding;
Michalewicz (1994)], evolution strategy with stochastic ranking (SRES; Runarsson
and Yao, 2000) and a genetic algorithm with stochastic ranking; finally, there
is also a simple random search algorithm.

The optimization algorithms are also used for estimating parameter values that
best fit a set of data provided by the user. To this end, COPASI reproduces the
functionality of Gepasi (Mendes and Kell, 1998) and exceeds it by allowing
mixtures of time course and steady-state data to be used simultaneously (Gepasi
could only deal with one of these types of data at a time).

The software is available for the following operating systems: Microsoft Windows
(Windows 98 and above), Linux, Mac OS X (PowerPC, runs also on Intel) and Sun
Microsystems Solaris (version 8 and above on SPARC). This cross platform
portability has been achieved by adhering to the ANSI C++ standard and relying
on toolkits and libraries that are available on the major operating systems.

The GUI was constructed based on the QT toolkit (Trolltech, Inc., Oslo), which
is the essential portability layer (i.e. produces different OS versions from the
same source code). This results in a program that has the expected look and feel
of the underlying operating system. Since the users are provided with an
interface following the same style and layout as other applications on their
computer the usability is greatly enhanced. In addition support libraries for QT
are available, which allow us to provide convenient plotting of results (Qwt
project, http://qwt.sf.net) and rendering of mathematical expressions (QT
Solutions, MML Widget).

For reliable and fast computation COPASI uses standard numerical libraries:
LAPACK (Anderson et al., 1999) for linear algebra, BLAS (Lawson et al.,1979) for
matrix and vector operations, and LSODA (Petzold, 1983) from ODEPACK (Hindmarsh,
1983) for integration of ODEs. There are optimized versions of LAPACK and BLAS
for the major hardware and operating system that we have used to build the
binary versions, providing COPASI with a little extra performance. For example,
the Intel BLAS version uses special features of Pentium processors, whereas the
Apple BLAS version uses the AltiVec unit of the PowerPC processors.

[@hoops2006copasi]

## Online Platforms

### JWSOnline

### SBW

### CycSim

Summary: CycSim is a web application dedicated to in silico experiments with
genome-scale metabolic models coupled to the exploration of knowledge from
BioCyc and KEGG. Specifically, CycSim supports the design of knockout
experiments: simulation of growth phenotypes of single or multiple gene
deletions mutants on specified media, comparison of these predictions with
experimental phenotypes and direct visualization of both on metabolic maps. The
web interface is designed for simplicity, putting constraint-based modelling
techniques within easier reach of biologists. CycSim also functions as an online
repository of genome-scale metabolic models.

Availability: http://www.genoscope.cns.fr/cycsim

Constraint-based modelling (Price et al., 2004) is a framework, simple and
abstract enough to allow tractable modelling of metabolism at genome-scale,
providing direct insights into the genotypephenotype relationship. Constraint-
based models (CBM) consist of a stoichiometric representation of the whole-cell
metabolism together with a set of constraints on reaction fluxes. A wide variety
of computational methods have been developed for this framework to characterize
metabolic capabilities, help to discover new reactions, simulate scenarios of
metabolic evolution or design experimental strategies to investigate metabolic
behaviours (Feist and Palsson, 2008).

A few simulation tools (Becker et al., 2007; Beste et al., 2007; Lee et al.,
2003; Sympheny, www.genomatica.com) and model repositories (Le Novre et al.,
2006; BiGG, unpublished data, http://bigg.ucsd.edu) have been proposed to the
growing community of CBM users. These software tools have been limited in their
usefulness to biologists for several reasons. First, most are either commercial,
or add-ons to commercial platforms (e.g. MATLAB, http://www.mathworks.com).
Next, they are typically directed at users with a background in modelling.
Lastly, these tools are not designed to explore the biochemical and genomic
knowledge underlying the metabolic models. Currently, the most convenient tools
to reconstruct metabolic networks from genome annotation are databases of
reference pathways such as BioCyc (Karp et al., 2005) and KEGG (Kanehisa et al.,
2008). These databases provide descriptive and queriable views of the genetic
and biochemical components of metabolism, but do not support modelling,
simulation or prediction.

To address these shortcomings, we introduce CycSim, a web platform which
supports in silico experiments with a variety of metabolic models, puts both the
design and the results of these experiments in the visual context of reference
pathways databases and allows confrontation with experimental data.

Predictions: CycSim supports in silico experiments with metabolic models. Each
experiment consists in selecting a wild-type strain, choosing one or several
genetic perturbations (e.g. knockout), and picking a set of growth media. Growth
phenotype predictions are then generated for all (mutant, medium) pairs. These
predictions can be compared against experimental growth phenotypes when
available (Fig. 1). Two prediction methods are implemented: flux balance
analysis and metabolites producibility check (Feist and Palsson, 2008). For any
given (mutant, medium) pair, CycSim can also compute a flux distribution that is
compatible with the model constraints and the objective function.

[@le2009cycsim]

### Web Applications

#### `snap`

#### SBML to MATLAB Translator

## Commercial

### MATLAB SimBiology

SimBiology provides a graphical environment and programmatic tools to model,
simulate, and analyze dynamic systems, focusing on
pharmacokinetic/pharmacodynamic (PK/PD) and systems biology applications. It
provides a block diagram editor for building models, or you can create models
programmatically using the MATLAB language. SimBiology includes a library of
common PK models, which you can customize and integrate with mechanistic systems
biology models.

A variety of model exploration techniques let you identify optimal dosing
schedules and putative drug targets in cellular pathways. SimBiology uses
ordinary differential equations (ODEs) and stochastic solvers to simulate the
time course profile of drug exposure, drug efficacy, and enzyme and metabolite
levels. You can investigate system dynamics and guide experimentation using
parameter sweeps and sensitivity analysis. You can also use single subject or
population data to estimate model parameters.

Graphical editor for PK/PD and systems biology modeling Ordinary differential
equations (ODEs) and stochastic solvers for pharmacokinetic models. The package
includes parameter estimation techniques for single subject and population data,
including nonlinear mixed-effects models, sensitivity analysis and parameter
sweeps to investigate how parameters affect system dynamics.

SimBiology lets you represent a model of a biological or a pharmacological
mechanism just as you would draw it on a piece of paper. Using a reaction
network modeling approach, SimBiology lets you model drug pharmacokinetics and
pharmacodynamics (PK/PD), biological systems, and chemical reaction kinetics.

SimBiology automatically constructs the ODEs based on the model structure and
the math underlying individual interactions, providing an alternative to an ODE-
based representation of the model.

You can create models using a block diagram editor or programmatically. You can
also import models from a built-in library of PK models or a Systems Biology
Markup Language (SBML) file.

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
