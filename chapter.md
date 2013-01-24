% Standards, Platforms, and Applications
% Stanley Gu [^stanleyInfo]
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
d{\bA}{\mbox{\boldmath $A$}}
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
\newcommand{\bdSd}{\mbox{\boldmath $dS_d$}}orthoorthogonal and complementary types of diagrams that can be
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
\newcommand{\bE}{\mbox{\boldmath $E$}}
\newcommanorthogonality of the languages makes their overlap very limited, mostly to
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

BioModels Database (<http://www.ebi.ac.uk/biomodels/>), part of the international
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
identifier (<http://www.pubmed.gov>) or a DOI (http://www.doi.org) or an URL that
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
BIOSSIM. As a result, the provision of software does not appear to ad