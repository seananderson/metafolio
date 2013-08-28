Overall thoughts and notes:

- The introduction may be a bit literature heavy. (We also need to cut 11
  references to get to 50.)

- The main message may be a bit repetitive throughout.

- I wish I didn't have so many paragraphs with numbered lists, but am
  struggling to work around that.

- I think there is room for expansion of the discussion (we still have ~500
  words to play with). The discussion could benefit from bringing in more
  concrete examples of how this ties in with PNW salmon and I welcome your
  ideas here. If we have space we could also discuss our results in the
  context of response diversity literature.

- The supplementary figures and captions aren't finished but should be quick
  to generate.

- I will write a short vignette describing how to use the R package like I did
  for the Methods in Ecology and Evolution paper.

- I will submit the `.pdf` version; the `.docx` version is for you to edit
  with Track Changes, if you'd like. Only the `.pdf` version contains the
  figures and if you can't see the equations in the `.docx` version (Andy?)
  then see the `.pdf` version.

- We still need to discuss authorship and order of authorship.

- Notes from Nick: (1) add something about how many of these concepts are key
  assumptions of conservation ecology, but they haven't been tested
  quantitatively before, (2) consider flipping the discussion around so the
  broad elements come first and the salmon applications come near the end, (3)
  consider sticking with "one half/other half", or "lower half/upper half". If
  lower/upper, need to explain reasoning.

\newpage

# Portfolio conservation of metapopulations under climate change

\bigskip

Sean C. Anderson^1*^,  Jonathan W. Moore^1^, Nicholas K. Dulvy^1^, Andrew B.
Cooper^2^ (Michelle M. McClure?, Trevor A. Branch?, Authors and order to be
discussed)

^1^Department of Biological Sciences, Simon Fraser University, Burnaby BC, V5A
1S6, Canada

^2^School of Resource and Environmental Management, Simon Fraser University,
Burnaby, BC, V5A 1S6, Canada

*Statement of authorship*: SCA, JWM, NKD, and ABC designed the analyses. SCA
wrote the simulation code, analyzed the results, and wrote the first draft of
the manuscript. All authors contributed substantially to revisions.

*Running title*: Portfolio conservation of metapopulations (maximum 45
characters)

*Keywords*: biocomplexity, Modern Portfolio Theory, portfolio effect,
prioritization, resource management, range contraction, response diversity,
risk assessment, salmon, stochastic simulation (maximum 10)

*Type of article*: Letters

*Words in abstract and main text*: 153, 4100 (maximum 150, 5000)

*Number of references*: 61 (maximum 50)

*Number of tables and figures*: 5 (maximum 6)

^*^Corresponding author: Sean C. Anderson; Department of Biological Sciences,
Simon Fraser University, Burnaby BC, V5A 1S6; Phone: 1-778-782-3989; E-mail:
sean_anderson@sfu.ca

# Abstract

Managing risk is fundamental to conserving endangered species. When an
endangered species exists as a metapopulation, we typically manage risk at the
subpopulation level. However, a portfolio approach might consider how
conservation affects the "weight" of each population in a metapopulation
"portfolio". Here we ask how a portfolio approach can inform conservation
priorities for metapopulations in a changing world. We develop a salmon
metapopulation simulation where population-specific productivity is driven by
spatially-distributed thermal tolerance and patterns of short- and long-term
environmental change. We then implement spatial conservation strategies that
control subpopulation carrying capacities and evaluate the salmon portfolios
along risk-return axes. We show that conserving response diversity minimizes
risk given environmental stochasticity and ensures persistence given long-term
environmental change. Further, conserving more subpopulations minimizes risk
regardless of response diversity distribution. These findings have important
implications for how we prioritize metapopulation conservation and emphasize
the importance of conserving the processes that promote response diversity.

# Introduction

Managing risk is fundamental to the conservation of an endangered species
[@burgman2005; @iucn2009]. When an endangered species exists as a
metapopulation, we can manage risk at two levels: at the population level or
at the metapopulation level. Typically we treat sources of risk at the
metapopulation level as exogenous and manage risk at the population level by
manipulating hunting or fishing levels, implementing reserves, or improving
connectivity [e.g. @akcakaya2007].

The management of financial portfolios provides another way of considering
risk [@figge2004; @koellner2006; @ando2012]. Economists consider the risk and
performance of a financial portfolio based on the weighting of individual
investments (called assets) that make up the portfolio. Modern Portfolio
Theory proposes that a set of portfolios maximizes expected return for a level
of risk or minimizes risk for a level of return [@markowitz1952;
@markowitz1959]. Similarly, expected growth rate and variance of a
metapopulation is a function of the variance, covariance, and size of the
individual populations [@moore2010]. A portfolio approach to managing risk for
a metapopulation might therefore consider how conservation actions affect the
weight of each population in a metapopulation portfolio.

Managing Pacific salmon under the uncertainty of climate change is an ideal
scenario to consider through the lens of portfolio theory for three reasons.
(1) Pacific salmon form metapopulations [@rieman2000; @schtickzelle2007] and
we can consider, for example, the metapopulation in a river-catchment as a
portfolio and the stream populations as assets [@schindler2010; @moore2010].
Continuing the analogy, predators and fisheries often integrate across
multiple populations [@hilborn2003; @schindler2008], acting as investors in
the salmon portfolio. Fisheries managers and conservation agencies then act as
portfolio managers by choosing which salmon habitat to prioritize for
protection or restoration. (2) Many Pacific salmon metapopulations are highly
threatened [@mcclure2003; @gustafson2007; @peterman2012] and will likely
become more at risk as threats such as overfishing, dams, roads, logging, and
particularly climate change intensify [e.g. @lackey2003]. (3) Salmon are
highly valued by society, fishers, conservation groups, and indigenous people
[@nrc1996]. Although civil society allocates extensive resources to conserving
salmonids, the scale of the problem demands a prioritization of conservation
efforts [@allendorf1997].

A diversified financial portfolio reduces risk by exploiting the covariance
between assets --- ideally one stocks rises while another one falls --- and
two key mechanisms can generate such asynchrony in metapopulation dynamics.
First, localized habitat features can filter the environment generating unique
conditions for subpopulations [@schindler2008; @rogers2008] (*senu* the Moran
effect). However, since many salmon species spend considerable time in a
shared ocean environment [@quinn2005], a second mechanism is also important
--- diversity of response to the environment [i.e. response diversity,
@elmqvist2003; and biocomplexity @colwell1998; @hilborn2003]. This mechanism
can result from unique phenotypic or genetic traits [@crozier2008;
@kovach2012] and be derived from rapid contemporary adaption [@stockwell2003;
@fraser2011] or long-term evolution to historical conditions [@eliason2011].
In this paper we focus on this latter, response-diversity mechanism, and
evaluate it in the context of thermal response diversity. 

Salmon are strongly affected by climate warming and yet show a remarkable
diversity of tolerance to temperature [@beacham1989; @crozier2006;
@crozier2008]. In addition to climate warming posing perhaps the greatest
threat to global biodiversity [@thomas2004], warming poses a particular threat
to riverine species whose ranges are largely confined to existing habitat
[@thomas2010] and where shallower water, compared to larger water basins, can
be affected more rapidly by thermal changes [@isaak2010] and by snow-melt
timing and extreme hydrological events [@crozier2008]. These consequences, and
in particular warmer water itself, can combine to limit salmon productivity
through, for example, oxygen limitation [@portner2007] leading to decreased
cardiac performance [@eliason2011] and having profound implications for
behaviour [@goniea2006], disease resistance [@crozier2008], energetic costs in
general [@rand1998], and ultimately survival [@peterman1998; @eliason2011].
With 29% of Pacific Northwest salmon populations having gone extinct since
Euro-American contact [@gustafson2007], these populations are at risk from any
further decline in fitness [@mcclure2003]. Yet, adverse stream temperatures
are already impeding recovery of some PNW salmon populations [@mccullough1999]
and are expected to make recovery targets more difficult to achieve
[@battin2007].

Here, we ask how a portfolio approach to management can inform the
conservation of metapopulations in a changing world. We ask: (1) Given a
plausible distribution of response diversity, how does portfolio theory inform
spatial approaches to prioritizing metapopulation conservation? (2) If we
don't know how response-diversity is distributed, what does portfolio theory
tell us about the number of populations to conserve? To answer these
questions, we develop a salmon metapopulation simulation in which
spatially-distributed thermal tolerance and patterns of short- and long-term
climatic change drive population-specific productivity. We then implement
conservation rules of thumb that control the population-level carrying
capacities and evaluate the salmon portfolios along risk and return axes, as a
financial portfolio manager might. We show that conserving response diversity
buffers metapopulation risk given short-term climate forcing and ensures
metapopulation persistence given long-term climate warming. We then show that
conserving more subpopulations buffers risk regardless of response diversity
or climate trend, and conclude that considering metapopulations through
portfolio theory provides a useful additional dimension through which we can
consider conservation strategies. 

# Methods

We developed a 100-year salmon metapopulation simulation model that includes a
spawner-return relationship, demographic stochasticity, straying between
populations, varying responses to the environment, escapement target setting,
and implementation uncertainty. Under two kinds of environmental regimes we
tested different conservation rules of thumb and evaluated these plans in
risk-return space similar to how financial managers evaluate financial
portfolios. We illustrate the overall simulation structure in Fig. 1. We
provide a package `metafolio` for the statistical software `R` [@r2013] as an
appendix, to carry out the simulations and analyses described in this paper.

## Defining the ecological portfolio

In our ecological portfolios, we defined assets as stream-level populations
and portfolios as salmon metapopulations. We use the terms *stream* and
*populations* interchangeably to represent the portfolio assets. We defined
the portfolio investors as the stakeholders in the fishery and metapopulation
performance. For example, the investors could be conservation agencies, First
Nations groups, or civil society as a whole. The fisheries management agency
then becomes the portfolio manager. We defined the asset value as the
abundance of returning salmon in each stream and the value of the portfolio as
the overall metapopulation abundance. In this scenario, the equivalent to
financial rate of return is the generation-to-generation metapopulation growth
rate. We defined the financial asset investment weights as the capacity of the
stream populations --- specifically the unfinished equilibrium stock size ---
since maintaining or restoring habitat requires money, time, and resources.
Investment in a population therefore represents investing in salmon habitat
conservation or restoration.

## Salmon metapopulation dynamics

The salmon metapopulation dynamics in our simulation were governed by a
spawner-return relationship with demographic stochasticity and by straying
between populations.

We defined the spawner-return relationship with a Ricker model [@ricker1954],

$$R_{i(t)} = S_{i(t)}e^{a_{i(t)}(1-S_{i(t)}/b_i) + w_{i(t)}}$$

where $i$ represents a population, $t$ a generation time, $R$ the number of
returns, $S$ the number of spawners, $a$ the productivity parameter (which can
vary with the environment), and $b$ the density-dependent term (which is used
as the asset weights in the portfolios). The term $w_{i(t)}$ represents
first-order autocorrelated error. Formally, $w_{i(t)} = w_{ti-1} \rho_w +
r_{i(t)}$, where $r_{i(t)}$ represents independent and normally distributed
error with mean 0 and standard deviation of $\sigma_r$ (0.3; we include the
base values in parentheses after relevant parameters). The parameter $\rho_w$
(0.4) represents the correlation between residuals from subsequent
generations.

We manipulated the capacity and productivity parameters $b_i$ and $a_{i(t)}$
as part of the portfolio simulation. The capacity parameters $b_i$ were
controlled by the investment weights in the populations. For example, a large
investment in a stream was represented by a larger unfished equilibrium stock
size $b$ for stream $i$. The productivity parameters $a_{i(t)}$ were
controlled by the interaction between a temperature time series and the
subpopulation thermal-tolerance curves.

We generated the thermal-tolerance performance curves according to

$$a_{i(t)} = \begin{cases} W_i (e_t - e_i^{\mathrm{opt}})^2 +
a_i^{\mathrm{max}}, & \text{if } a_{i(t)} > 0\\ 0, & \text{if } a_{i(t)} \leq
0 \end{cases}$$

where $W_i$ controls the width of the curve for population $i$, $e_t$
represents the environmental value at generation $t$, $e_i^{\mathrm{opt}}$
represents the optimal temperature for population $i$, and
$a_i^{\mathrm{max}}$ represents the maximum possible $a$ value for population
$i$. We set the $W_i$ parameters (evenly spaced values increasing and
decreasing between 0.05 and 0.02) and calculated the $a_i^{\mathrm{max}}$
parameters so that the area under each curve was equal (30 units). We chose
parameter values such that some populations were warm-tolerant, some were
cold-tolerant, and some had a wider range of thermal-tolerance, but a lower
maximum productivity (see Fig. 2a). Although we refer to a thermal-tolerance
curve because temperature is a dominant driver of salmonid performance
[@mccullough1999], our model applies to any environmental tolerance (e.g.
tolerance to stream flow volume or changes in snow melt timing
[@crozier2008]).

We implemented straying as in @cooper1999. We arranged the subpopulations in a
line and salmon were more likely to stray to streams near their natal stream.
Two parameters controlled the straying: the fraction of fish
$f_{\mathrm{stray}}$ (0.02) that stray from their natal stream in any
generation and the rate $m$ (0.3) at which this straying between streams
decays with distance. We calculated the number of salmon straying from stream
$j$ to stream $i$ as

$$\mathrm{strays}_{ij(t)} = f_{\mathrm{stray}} R_{j(t)} \frac{e^{-m \lvert i-j
\rvert }} {\displaystyle\sum\limits_{ \substack{k = 1 \\ k \neq j}}^{n} e^{-m
\lvert k-j \rvert }}$$

where $R_{j(t)}$ is the number of returning salmon at generation $t$ whose
natal stream was stream $j$. The subscript $k$ represents a stream ID and $n$
the number of populations. The denominator is a normalizing constant to ensure
the desired fraction of fish stray. See Figure \ref{f:stray} for an example
straying matrix.

Our simulation did not account for the homogenization of diversity due to
straying. For example, all salmon in one population maintained the same
thermal-tolerance curve regardless of how many salmon it received from another
stream. However, the low straying rates in our simulation rate should render
this effect minimal except for populations at low abundance. In our model, the
main implication is that, in reality, populations that reach a low abundance
may reach demographic extinction, potentially suffer consequences such as
inbreeding depression [@wang2002] and subsequently contribute little to
response diversity.

## Fishing

Our simulation used a simple set of rules to establish escapement targets and
harvest the fish. Every five years our simulation fitted a spawner-return
function and the target harvest rate $H_{\mathrm{tar}}$ was set based on
@hilborn1992 as

$$H_{\mathrm{tar}} = \frac{A}{b (0.5 - 0.07a)} \label{eq:esc}$$

where $A$ represents the return abundance and $a$ and $b$ represent the Ricker
model parameters. We included implementation uncertainty in the actual harvest
rate $H_{\mathrm{act}}$ as

$$H_{\mathrm{act}} = \mathrm{beta}(\alpha_h, \beta_h)$$

where $\alpha_h$ and $\beta_h$ are the location and shape parameters in a beta
distribution. They can be calculated from the desired mean $H_{\mathrm{tar}}$
and standard deviation $\sigma_h$ (0.05) as [@morgan1990, p. 97]

$$\begin{aligned} \alpha_h &= H_{\mathrm{tar}}^2 \left( \frac{1 -
H_{\mathrm{tar}}}{\sigma_h^2} - \frac{1}{H_{\mathrm{tar}}} \right)\\ \beta_h
&= \alpha \left({\frac{1}{H_{\mathrm{tar}}} - 1}\right).\end{aligned}$$

Further, to establish a range of spawner-return values and to mimic the start
of an open-access fishery, for the first 30 years we drew the fraction of fish
harvested randomly from a uniform distribution between 0.1 and 0.9. We
discarded these initial 30 years as a burn-in period.

## Environmental dynamics

Environmental dynamics typically have both short- and long-term fluctuations.
We evaluated portfolio performance under these two components separately. We
represented short-term dynamics as a stationary first-order autoregressive
process, AR(1), with correlation $\rho_e$ (0.1)

$$e_t = e_{t-1} \rho_e + d_t, d_t \sim \mathrm{N}(0, \sigma_d)$$

where $e_t$ represents the environmental value in generation $t$ and $d$
represents normally distributed deviations of mean 0 and standard deviation
$\sigma_d$ (2). We represented long-term environmental dynamics as a linear
shift in the environmental value through time

$$e_t = \beta_e t - \overline{\beta_e t}$$

where $\beta_e$ (0.114) represents the slope. To maintain a balanced response,
we centered the trend by subtracting the mean $\overline{\beta_e t}$ so that
midway through the simulation (after any burn-in period) the environmental
value was at the mean environmental tolerance.

Combining salmon population dynamics, fishing, and environmental dynamics, we
illustrate the components of an example simulation in Fig. 3.

## Conservation rules of thumb

We evaluated two sets of conservation rules of thumb: (1) strategies to
conserve spatial response diversity, and (2) a scenario where we know little
about response diversity and we're left with a choice of how many populations
to conserve.

We evaluated four spatial conservation rules of thumb (Fig. 2b--e). In all
spatial scenarios, we conserved four populations and set the unfished
equilibrium biomass of the remaining populations to near elimination (five
salmon). These reduced populations could still receive straying salmon but
were unlikely to rebuild on their own to a substantial abundance. The four
scenarios we considered were:

1. Conserve an even sampling of response diversity. 

2. Conserve the middle section of the metapopulation (conserve stable
   populations). 

3. Conserve the lower half of the metapopulation (conserve cool-tolerant
   populations). 

4. Conserve the upper half of the metapopulation (conserve warm-tolerant
   populations).

In reality we rarely know precise levels of response diversity. We therefore
considered a case where the conservation was randomly assigned with respect to
response diversity but where different numbers of streams could be conserved.
We considered conserving from two to 16 streams. Similarly to the spatial
strategies, we reduced the capacity of the remaining streams to the nominal
level of five salmon.

# Results

## Which populations to conserve?

*Given short-term environmental fluctuations*, conserving response diversity
buffers the risk properties of an ecological portfolio (Fig. 4a). In our
model, the median variance of metapopulation growth rate was X times lower
given balanced response diversity (full range of responses or most stable only
vs. conserving one half or the other). This increase in stability occurred
despite the portfolio being comprised of warm and cool-thriving populations
that were more variable on their own than populations with wide
thermal-tolerance curves. We can see the mechanism behind these portfolio
properties by inspecting example population time series (Fig. 4c, d). If only
the upper or lower half of response diversity is conserved, the portfolio
tends to alternate between performing well and poorly depending on the
environmental conditions resulting in a risker portfolio (Fig. 4e). This risk
is buffered with balanced response diversity (Fig. 4c).

*Given long-term environmental change*, the choice of which populations to
conserve affects the "return" (metapopulation growth rate) properties of an
ecological portfolio (Fig. 4b). By conserving balanced response diversity, an
ecological manager is hedging his or her bets on the environmental trend and
how the populations will respond. The typical metapopulation growth rate for a
balanced response diversity strategy was zero --- the metapopulation neither
increased or decreased in abundance in the long run. The example
metapopulation abundance time series (Fig. 4d, f) illustrate the mechanism. By
conserving response diversity, when one population is doing poorly, another is
doing well and the metapopulation abundance remains stationary through time.
If a manager had invested in the populations that were doing well at the
beginning they would have had the lowest rate-of-return portfolio in the end
(purple portfolios in Fig. 4f).

## How many populations to conserve?

In a scenario where we don't know the distribution of population-level
response diversity, portfolio optimization informs us that investing in more
populations buffers portfolio risk regardless of environmental trend (Fig. 5). 

*Given short-term environmental fluctuations*, conserving more populations
buffers portfolio risk (Fig. 5a), and at the same time, the random
conservation of response diversity creates a spread of metapopulation risk for
the same number of populations conserved. For example, a metapopulation with
eight conserved populations is X times less risky than a metapopulation with
only four. We can see this risk-buffering effect through example
metapopulations in Fig. 5c and 5d. We note that the risk-return axes of
portfolio optimization ignore the absolute-abundance dimension (Fig. 5d) ---
as one would expect, conserving fewer populations also results in
lower-abundance metapopulations.

*Given long-term environmental change*, conserving more populations also
buffers portfolio risk. However, in contrast to the short-term environmental
noise scenario, the unknown response diversity creates a spread of possible
metapopulation return for the same number of conserved populations (Fig. 5b).
Here, the number of populations conserved buffers non-systematic (primarily
demographic) stochasticity.

# Discussion

Our model demonstrates how population diversity can stabilize realistic
metapopulations under climate change. We show how maintaining populations with
a variety of thermal-tolerances reduces risk caused by short-term
environmental stochasticity and optimizes chances for long-term persistence
given climate change. Further, without knowing how response diversity is
distributed, conserving more subpopulations reduces metapopulation risk
regardless of environmental trend and response-diversity distribution.
Combined, these two findings illustrate that focusing on well-performing
stocks now at the detriment of others is at best equivalent to a risky but
efficient portfolio, and at worst a poorly-performing risky portfolio. In this
discussion, we begin by linking our model with real-world conservation issues
for Pacific Northwest salmon and considering the implications of our results
for salmon conservation and management. We then consider broader research
priorities and extensions that our results suggest for metapopulation
conservation.

## Implications for salmon conservation

The primary finding from our simulation model is the importance of response
diversity in buffering risk and ensuring long-term persistence in the face of
environmental uncertainty. Thus, our results emphasize the need to make the
maintenance of response diversity, and the processes that promote response
diversity, a primary goal of conservation and recovery efforts [@moore2010].
For example, since habitat heterogeneity can lead to local adaptation
[@taylor1991; @fraser2011], our results emphasize the need to maintain a
diversity of salmon habitat [@rogers2008]. Our results can also inform habitat
prioritization decisions. If conservation actions must be prioritized, then
our model suggests we should focus on populations that aren't spatially
contiguous, as long as sufficient straying is maintained, to maximize
diversity of response to the environment. Finally, our results demonstrate the
advantages of avoiding structures that artificially remove response diversity.
For salmon, dams are a prominent example [@waples2007; @pess2012]. Dams can
have a double impact whereby their introduction selectively eliminates a large
swath of contiguous habitat, perhaps analogous to our upper- or lower-half
scenarios in Fig. 4, and then mitigation approaches such as hatcheries can
further reduce population and response diversity if not carefully managed
[@waples1991a; @mobrand2005].

Existing salmon management structures in the US and Canadian PNW support a
portfolio conservation perspective. In the US, Evolutionarily Significant
Units (ESUs) represent salmon populations that are reproductively isolated
with an evolutionary heritage [@waples1991; @moritz1994] and finer-scale
Viable Salmonid Populations (VSPs) represent groups of fish that spawn in a
given lake or stream in a particular season [@mceacheran2000]. In Canada, the
rough equivalent to the ESU is a Conservation Unit (CU) as defined by the Wild
Salmon Policy [@dfo2005wsp]. A CU consists of a group of salmon that are
reproductively isolated and that if lost would be unlikely to recolonize in a
reasonable time frame [@dfo2005wsp]. Both the US and Canadian guidelines
recognize still-finer-scale population structure. We suggest that a salmon
portfolio in our model could represent an ESU or CU and that the lessons
learned from our models are thus directly applicable to management guidelines
in the PNW.

*To be incorporated?*
Some VSP guidelines [@mceacheran2000] that are line with our findings...

- maintaining diversity of a variety of forms to buffer against short-term
  environmental changes and adaptation to long-term environmental changes

- conservation efforts should not focus exclusively where there is currently
  an abundance of salmon

- metapopulation (multiple populations with some exchange) are important to
  maintain

- some should be close for straying, but some should be far apart to reduce
  risk from sudden environmental change

- important to incorporate uncertainty of ESU-level processes into assessments

- CU guidelines [@dfo2005wsp] suggest...

Our model complements other simulation-based salmon-habitat prioritization
models. While these other models tend to focus on detailed assessment of
individual fish stocks, our model is unique as the first to consider the role
of response diversity in buffering risk for metapopulations as a whole. The
Shiraz model [@scheuerell2006] is one complementary prioritization scheme. It
focuses on detailed conditioning of the habitat-population-dynamics
relationship at multiple life-history stages for a single salmon population.
Whereas the Shiraz model can be applied to an entire watershed, it combines the
populations together as a single unit. A second salmon prioritization model
proposes combining population viability measures with an assessment of the
genetic consequences of losing particular populations [@allendorf1997]. This
model, however, also focuses on the assessment of individual stocks without
considering their covariance and therefore the performance of the salmon
portfolio as a whole. Our model does not replace these prioritization schemes.
Rather, it proposes an additional focus on prioritization that optimizes
metapopulation risk and growth across plausible environmental scenarios while
being robust to numerous sources of uncertainty.

## Broad implications, research extensions, and priorities

Our results emphasize the importance of thinking at the portfolio level when
making conservation decisions --- considering aggregate risk and performance for
ecological portfolios. Although our results may appear intuitive, we often
don't often consider aggregate risk and only by simultaneously considering
aggregate risk and return can we optimally diversify ecological systems
[@ando2012]. Thus we can think of portfolio risk-return performance as another
dimension of conservation. This dimension emphasizes the value of a broader
scale of management and focussing not just on currently productive populations
but also on less productive populations to reduce long-term aggregate risk
[e.g. @hilborn2003; @price2008]. This perspective does not negate an
understanding at a finer scale, say of individual fish stocks. Rather, as in
finance, it requires both an understanding of stock performance and an
assessment of their covariance to predict properties of the portfolio as a
whole.

We suggest a number of specific extensions to our simulation model. First our
model could be extended beyond thermal response diversity. For salmon this
might include response diversity to interdecadal climate signals such as the
Pacific Decadal Oscillation [@mantua2002], or to stream flow and dissolved
oxygen [@priede1988]. Second, our model could be extended to metapopulations
of other taxa, to ecological communities (after accounting for species
interactions), or to meta-communities. Third, an extension of our model would
consider the Moran or environmental-filter concept [@schindler2008;
@rogers2008] where populations experience increasingly different environmental
forces at further distances. Fourth, a model could consider the contribution
of contemporary evolution [@stockwell2003]. This rapid adaptation to changes
in the environment could strongly affect portfolio performance and emphasizes
the importance of maintaining genetic diversity. Finally, our model could be
conditioned on a system of interest --- a particular river basin for example
--- and the metapopulation portfolio could be optimized across conservation
and restoration options as part of a formal decision analysis.

Our results suggest three broad research priorities. First, our work
highlights the importance of research that identifies response diversity
[e.g. @eliason2011], spatial asynchrony [e.g. @thorson2013], and in particular
the management schemes that promote these processes [@moore2010]. Our work
highlights how these processes can contribute to reducing risk and increasing
the likelihood of metapopulation persistence given environmental uncertainty.
Second, our work suggests the importance of identifying the drivers of
productivity across populations and environmental scenarios. For example, what
is the relative effect on productivity of population density, an
environment-recruitment relationship, and environmental regime shifts, and
what management approaches are robust to our uncertainty about these
contributions [@vert-pre2013]? Third, our work suggests research that
identifies real-life case studies as in situ experiments testing our
conclusions. The question remains, does managing metapopulation portfolios
using Modern Portfolio Theory result in better outcomes that are in line with
the societal goals?

In conclusion, our results demonstrate the utility of considering
metapopulations in a portfolio context and the power of portfolio simulation
to consider management strategies that minimize metapopulation risk and
maximize growth under uncertain environmental conditions. Our findings show
that response diversity buffers metapopulation risk given short-term
environmental stochasticity and ensures persistence given longterm regime
changes. Further, our findings show that, independent of response-diversity,
conserving more populations buffers metapopulation risk. These results point
to the critical importance of choosing management, conservation, and
restoration actions that preserve and promote response diversity and are
robust to our uncertainty about the distribution of response diversity
and future climatic conditions.

# Acknowledgements

Funding was provided by NSERC (ABC, NKD, SCA), the Canada Research Chairs
Program (NKD), Simon Fraser University, the Liber Ero Chair of Coastal Science
and Management (JWM), Fulbright Canada (SCA), and a Garfield Weston
Foundation/B.C. Packers Ltd. Graduate Fellowship in Marine Sciences (SCA).

\bibliographystyle{ecologyletters2}

\bibliography{jshort,ms}

\clearpage

# Figures

\includegraphics[height=5.5in]{../examples/simulation-diagram3.pdf}

Fig. 1: Flow chart of the salmon-metapopulation simulation. There are $n$
salmon populations and $t$ generations. Blue text indicates values that are
generated before the simulation progresses through time. Red text indicates
steps in which calculations are performed through time. Black text indicates
values that are calculated. Grey text indicates parameters that can be set.
Green text indicates the looping structure of the simulation.

\clearpage

\includegraphics[width=2.9in]{../examples/thermal-curve-scenarios.pdf}

Fig. 2: Different ways of prioritizing response-diversity conservation. Panel
a shows thermal tolerance cures for ten possible populations and panels b--e
show different ways of prioritizing four of those populations. The curves
describe how productivity varies with temperature for a given population. Some
populations thrive at low temperatures (cool colours) and some at warm
temperatures (warm colours). Some are tolerant to a wider range of
environmental conditions (yellow-to-green colours) but with a lower maximum
productivity. The total possible productivity (the area under the curves) is
the same for each population.

\clearpage

\includegraphics[width=4.0in]{../examples/spatial-arma-sim.pdf}

Fig. 3: The components of an example metapopulation simulation.  We show, from
top to bottom, the environmental signal, the resulting productivity parameter
(Ricker $a$), the salmon returns, fisheries catch, salmon escapement, salmon
straying from their natal streams, salmon joining from other streams,
spawner-return residuals on a log scale, and the estimated $a$ and $b$
parameters in the fitted Ricker curve. The colored lines indicate populations
that thrive at low (cool colours) to high (warm colours) temperatures.

\clearpage

\includegraphics[width=4.7in]{../examples/spatial-mv.pdf}

Fig. 4: The importance of preserving environmental response diversity through
spatial conservation strategies. The conservation strategies correspond to
Fig. 2 and represent conserving a range of responses (green), the most stable
populations only (orange), or one type of environmental response (purple and
pink).  In risk-return space we show environmental scenarios that are
comprised primarily of (a) short-term and (b) long-term environmental
fluctuations. The dots show simulated metapopulations and the contours show
25% and 75% quantiles across 500 simulations per strategy. We also show
example metapopulation abundance time series for the (c, e) short-term and (d,
f) long-term  environmental-fluctuation scenarios.

\clearpage

\includegraphics[width=5.0in]{../examples/cons-plans-n.pdf}

Fig. 5: The importance of preserving as many subpopulations as possible when
we don't know how response diversity is distributed. In risk-return space we
show environmental scenarios that are comprised primarily of (a) short-term
and (b) long-term environmental fluctuations. We show metapopulations in which
2 (red), 4 (orange), 8 (yellow), or 16 (green) populations of random response
diversity are conserved. The dots show simulated metapopulations and the
contours show 25% and 75% quantiles across 500 simulations per strategy. We
also show example metapopulation (c) rate-of-change and (d) abundance time
series for the short-term environmental-fluctuation scenario.
