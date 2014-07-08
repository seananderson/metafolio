<!--TODO Change opening of abstract:-->
<!--TODO risk to extinction risk-->
<!--TODO return to conservation return --- also see rate of return-->

<!--The sentence spanning line 28-30 is the key result and then you just added to it. Can I suggest you break into to sentences or think about dropping the second clause. Up to this point there are no system specific details and then you say the word "stream" which suddenly makes me want to know all the natural history. Can you either embrace the natural history and say something specific about the study system and species or step back to the bigger picture and state that the metapopulation growth rate declines as climate change reduces the availability of breeding habitat.-->

<!--TODO embrace natural history in abstract - salmon that spend time in streams, reduced stream flow...-->

<!--If this approach is suitable it may be worth propagating into the introduction.-->

<!--TODO propogate these changes into the introduction-->

<!--You need a key or labeling for the lines in figure 2, 5, 6, just to save the reader from reading. Something is required to aid the reader with fig 3. maybe just a note or label to highlight what each individual line means.- Maybe just state on figure that individual lines represent individual populations.-->

<!--TODO State in Figure 2 and 3 that lines rep. populations-->


<!--\setlength{\parskip}{4pt}-->

<!--Words: 6550-->

<!--# Portfolio conservation of metapopulations under climate change-->

<!--\bigskip-->

<!--Sean C. Anderson^1\*^, Jonathan W. Moore^1,2^, Michelle M. McClure^3^, Nicholas K. Dulvy^1^,-->
<!--Andrew B. Cooper^2^-->

\noindent
^1^Earth to Ocean Research Group, Department of Biological Sciences, Simon Fraser University, Burnaby BC, V5A
1S6, Canada

\noindent
^2^School of Resource and Environmental Management, Simon Fraser University,
Burnaby, BC, V5A 1S6, Canada

\noindent
^3^Fishery Resource Analysis and Monitoring Division, Northwest Fisheries
Science Center, National Marine Fisheries Service, National Oceanic and
Atmospheric Administration, 2725 Montlake Blvd. E., Seattle, WA 98112, USA

\noindent
^\*^Corresponding author:
Sean C. Anderson; Earth to Ocean Research Group, Department of Biological Sciences,
Simon Fraser University, Burnaby BC, V5A 1S6;
Phone: 1-778-782-3989; E-mail:
sean_anderson@sfu.ca

\clearpage
<!--\setlength{\parskip}{18pt}-->

# Abstract

<!--350 words for articles-->
<!--60 pages total-->

<!--Here, we show that the risk of climate variability is halved when the number of population conserved is doubled, by applying ecological portfolio approach to the population diversity of thermal responses.-->
<!--The mechanisms underlying the stability of ecological systems are a key focus of-->
<!--ecology and increasingly important given the rate and magnitude of biodiversity-->
<!--loss and environmental change. The stabilizing role of one such mechanism,-->
<!--diversity of response to the environment, is a widely-held tenet of ecology, but-->
<!--has rarely been quantitatively tested. -->

Climate change will likely lead
to increasing population variability and extinction risk.
Theoretically, greater population diversity should buffer
against rising climate variability,
and this theory is often invoked as a reason for greater conservation.
However, this has rarely been quantified.
Here we show how a portfolio approach to
managing population diversity can inform metapopulation conservation priorities
in a changing world.
We develop a salmon metapopulation
model where productivity is driven by
spatially-distributed thermal tolerance
and patterns of short- and long-term
climate change.
We then implement spatial conservation scenarios that control
population carrying capacities
and evaluate the metapopulation portfolios as
a financial manager might --- along axes of conservation risk and return.
We show that
preserving a diversity of thermal tolerances
minimizes risk given environmental stochasticity
and ensures persistence given long-term environmental change.
When the thermal tolerances of populations are unknown,
doubling the number of populations conserved may nearly halve
metapopulation variability.
However, this reduction in variability
can come at the expense of long-term persistence
if climate change increasingly restricts available habitat ---
forcing ecological managers to balance society's desire
for short-term stability and long-term viability.
Our findings suggest the importance of conserving the processes
that promote thermal-tolerance diversity, such as
genetic diversity, habitat heterogeneity, and natural disturbance regimes,
and demonstrate that diverse natural portfolios may be critical for
metapopulation conservation in the face of increasing climate variability
and change.

<!--, may-->
<!--be critical to conserving metapopulations in the face of climate variability and-->
<!--change.-->

<!--This pathway highlights that-->
<!--diverse natural portfolios may be critical for the conservation of-->
<!--metapopulations in the face of increasing climate variability and change.  -->

<!--*TODO Change last sentence to include something about illustrating a trade-off in conservation? Maybe we should move beyond response diversity as our only conclusion?*-->

\noindent
\textit{Keywords}:
biocomplexity,
ecosystem based management,
Pacific salmon,
portfolio effect,
prioritization,
range contraction,
response diversity,
risk assessment,
stability-diversity,
stochastic simulation

\noindent
\textit{Running head}: Metapopulation portfolio conservation

<!--\clearpage-->

# Introduction

Untangling the mechanisms that underpin the stability of ecological systems is
a critical focus of ecology [e.g. @ives2007; @demazancourt2013]. Decades of
research has focused on the role of species richness and functional diversity in
driving stability; however, recent research has highlighted that the
drivers of ecological stability are more complex and multidimensional than
previously thought [e.g. @balvanera2006; @ives2007; @demazancourt2013]. Two key
drivers of population stability that have been comparatively understudied are response
diversity [@winfree2009; @mori2013] --- different responses to the environment
by functionally similar species or populations [@elmqvist2003] --- and the role
of metapopulations [@schtickzelle2007]. Here, we examine the role of response
diversity conservation in stabilizing metapopulations given projected changes in
climate. With unprecedented loss of biodiversity and levels of anthropogenic
environmental change, it is more critical than ever to consider conservation
approaches that maintain system stability in the face of environmental
uncertainty [@lee2008; @ando2012].

Typically, conservation actions to maintain system stability and thereby reduce
risk are driven by an *ad hoc* combination of scientific information, political
influences, and feasibility [@margules2000]; the management of financial
portfolios provides another way of considering risk [e.g. @figge2004;
@koellner2006; @ando2012; @haak2012]. Economists work to minimize risk and
maximize returns by building a portfolio of individual investments (called
assets) with different attributes. For example, different financial sectors can
be expected to perform uniquely in some economic conditions; when one rises in
value another may fall. Modern Portfolio Theory proposes that out of all
possible portfolios, there is a small subset of portfolios that maximizes
expected return for a level of risk or minimizes risk for a level of return
(called the efficient frontier), and that only by considering risk and return in
tandem can an investor achieve maximum benefit from a portfolio
[@markowitz1952].

Similarly, expected growth rate and variance of a metapopulation is a function
of the variance, covariance, and size of the individual populations [@moore2010;
@carlson2011; @anderson2013].
An ecological portfolio approach to managing risk
for a metapopulation might therefore consider how conservation actions affect
the weight of each population in a metapopulation portfolio.
This investment
weight could represent the conservation budget or the habitat conserved for
each population.
The population growth rate is then analogous to the financial rate of
return and the variability of that growth rate a metric of risk.
Environmental
conditions could represent the financial market conditions.
Given this
interpretation, ecological managers could consider how various conservation
strategies affect the expected risk and return of their ecological portfolio.
These risk and return elements are central
to ecological management and conservation ---
management aims to ensure stability
over environmental variability (risk),
and increase population abundance (return).
Different scenarios may suggest different desired tradeoffs between the two.
For example, a manager with a healthy population
might prioritize short-term stability,
while a manager with an endangered population might try to balance the two,
or prioritize population growth initially.

Managing Pacific salmon under the uncertainty of climate change is an ideal
scenario to consider through the lens of portfolio theory for four reasons. (1)
The migration of Pacific salmon biomass profoundly influences aquatic and
terrestrial coastal ecosystems throughout the North Pacific ocean from Korea to
California [@quinn2005]. (2) Pacific salmon form metapopulations [e.g.
@policansky1998; @cooper1999; @schtickzelle2007] and we can consider, for
example, the metapopulation in a river-catchment as a portfolio and the stream
populations as assets [@schindler2010; @moore2010; @carlson2011; @anderson2013;
@yeakel2014]. Fisheries often integrate across multiple populations, acting as
investors in the salmon portfolio [@hilborn2003]. Fisheries managers and
conservation agencies can act as portfolio managers by choosing which salmon
habitat to prioritize for protection or restoration. (3) Many Pacific salmon
metapopulations are highly threatened [e.g. @gustafson2007] and will likely
become more at risk as threats such as overfishing, damming, logging, and
particularly changing climate, intensify [e.g. @lackey2003]. Indeed, recovery
goals for Pacific salmon are often set at the metapopulation level
[@mcelhany2000], and knowing what minimizes risk to the metapopulation can
help choose efficient conservation actions [@policansky1998; @mcelhany2000]. (4)
Given the scale and variety of the threats facing salmon, some prioritization
will be required to recover these highly-valued, even iconic species
[@allendorf1997; @ruckelshaus2002].

Two key mechanisms can generate the asynchrony in metapopulation dynamics that
is critical to a diversified portfolio. First, localized habitat features can
filter larger-scale environments, generating unique conditions for populations
[@schindler2008] (*sensu* the Moran effect). Second, salmon populations may
respond differently to environmental variability (i.e. response diversity
[@elmqvist2003] and biocomplexity [@hilborn2003]) arising from unique local
adaptations and traits [@fraser2011; @eliason2011; @thorson2014]. In reality,
these mechanisms can interact. For example, salmon response diversity in the
marine environment can be driven by adaptation to localized freshwater
environments [@johnson2013a].

In addition to posing perhaps the greatest threat to global biodiversity in
general [@thomas2004], climate warming poses a particular threat to riverine
species whose ranges are largely confined to existing habitat [@thomas2010].
Among these species, salmon are strongly affected by climate warming [e.g.
@patterson2007].
<!--, but within a range, show a remarkable diversity of tolerance to-->
<!--temperature [e.g. @crozier2008; @eliason2011]. -->
Warmer water can lead to massive
mortality of salmon populations [e.g. @patterson2007] and indirectly impact
salmon productivity through alterations to snow-melt timing and extreme
hydrological events [@crozier2008]. Due to these effects, adverse stream
temperatures are already impeding recovery of some Pacific salmon populations
[@mccullough1999] and are expected to make recovery targets more difficult to
achieve [@battin2007]. However, despite the evidence that warming impacts
salmon, salmon also show evidence of response diversity and local adaptation to
temperature. For example, thermal tolerance of sockeye salmon in the Fraser
River, British Columbia, Canada, varies within streams according to historical
environmental conditions [@eliason2011].

Here we ask how portfolio theory can inform spatial approaches to prioritizing
metapopulation conservation in a changing world. To answer this, we develop
a salmon metapopulation simulation in which spatially-distributed thermal
tolerance and patterns of short- and long-term climatic change drive
population-specific productivity. We then implement scenarios that prioritize
alternative sets of populations and evaluate the salmon portfolios along
risk-return axes, as a financial portfolio manager might. We show that
conserving a diversity of thermal tolerances buffers metapopulation risk given short-term
climate forcing and ensures metapopulation persistence given long-term climate
warming.
We then show that dividing conservation
among more populations buffers risk
regardless of thermal-tolerance diversity or climate trend,
but possibly at the expense of
long-term growth rate and persistence when available habitat declines over time.
We conclude that considering metapopulations through portfolio theory provides
a useful additional dimension through which we can evaluate conservation
strategies.

# Methods

We developed a 100-year salmon metapopulation simulation model that includes
both population dynamics and harvesting along with process, observation, and
implementation uncertainty (Fig. \ref{f:flowchart}). We tested different
conservation scenarios under two kinds of environmental regimes
(short-term climate variability and long-term climate change) and
in cases where habitat capacity remained constant or declined over time.
We provide a package `metafolio` for the statistical software
\textsf{R} [@r2013] as an appendix, to carry out the simulations and analyses
described in this paper (\somR).

## Defining the ecological portfolio

In our ecological portfolios, we defined assets as stream-level populations and
portfolios as salmon metapopulations.
The specific configuration of our model refers to salmon
that spend extended time rearing in freshwaters
(e.g. steelhead [*Oncorhynchus mykiss*],
sockeye salmon [*O. nerka*],
coho salmon [*O. kisutch*],
and stream-type Chinook salmon [*O. tshawytscha*]),
which will likely be more impacted
by changes to stream temperature and flow [@mantua2010].
We use the terms *stream* and
*populations* interchangeably to represent the portfolio assets.
We defined the
portfolio investors as the stakeholders in the fishery and metapopulation
performance. For example, the investors could be conservation agencies, First
Nations groups, or civil society as a whole. The fisheries management agency
then becomes the portfolio manager. We defined the asset value as the abundance
of returning salmon in each stream and the value of the portfolio as the overall
metapopulation abundance.

In this scenario, the equivalent to financial rate of
return is the generation-to-generation metapopulation growth rate, calculated as
the first difference of the log salmon returns. We defined the financial asset
investment weights as the capacity of the stream populations --- specifically
the unfished equilibrium stock size --- since maintaining or restoring habitat
requires money, time, and resources and habitat size itself is a strong predictor of the occupancy of salmon [@isaak2007].
Investment in a population therefore
represents investing in salmon habitat conservation or restoration and the risk
and return from investment strategies become emergent properties of our
metapopulation model.
<!--Whereas investment could represent management actions that control productivity, -->
<!--such an arrangement is unlikely if -->

## Salmon metapopulation dynamics

The salmon metapopulation dynamics in our simulation were governed by
a spawner-return relationship with demographic stochasticity and straying
between populations. We defined the spawner-return relationship with a Ricker
model,

$$R_{i(t+1)} = S_{i(t)}e^{a_{i(t)}(1-S_{i(t)}/b_i) + w_{i(t)}}$$

\noindent
where $i$ represents a population, $t$ a generation time, $R$ the number of
returns, $S$ the number of spawners, $a$ the productivity parameter (which can
vary with the environment), and $b$ the density-dependent term (which is used
as the asset weights in the portfolios). The term $w_{i(t)}$ represents
first-order autocorrelated error. Formally,
$w_{i(t)} = w_{i(t-1)} \rho_w + r_{i(t)}$,
where $r_{i(t)}$ represents independent and normally-distributed
error with standard deviation of $\sigma_r$, mean of
$-\sigma_r^2 / 2$ (bias corrected so the expected value after exponentiation is 1),
and correlation between subsequent generation values of $\rho_w$.
We set $\sigma_r = 0.7$ and $\rho_w = 0.4$ to match
the mean values for salmonids in @thorson2014a.

We manipulated the capacity and productivity parameters $b_i$ and $a_{i(t)}$ as
part of the portfolio simulation. The capacity parameters $b_i$ were controlled
by the investment weights in the populations. For example, a large investment in
a stream was represented by a larger unfished equilibrium stock size $b$ for
stream $i$. The productivity parameters $a_{i(t)}$ were controlled by the
interaction between a temperature time series and the population
thermal-tolerance performance curves.
In a different context,
investment could represent improving the productivity ($a_i$) parameters,
say through culling, to offset mortality increases due to changing temperatures.
However, such a scenario is unlikely
in the case of an endangered species where population levels
are often well below levels where culling would increase productivity.

We generated the thermal-tolerance curves according to

$$a_{i(t)} = \begin{cases} a_i^{\mathrm{max}} -
W_i (e_t - e_i^{\mathrm{opt}})^2,
& \text{if } a_{i(t)} > 0\\ 0, & \text{if } a_{i(t)} \leq
0 \end{cases}$$

\noindent
where $W_i$ controls the width of the curve for population $i$, $e_t$ represents
the environmental value at generation $t$, $e_i^{\mathrm{opt}}$ represents the
optimal temperature for population $i$, and $a_i^{\mathrm{max}}$ represents the
maximum possible $a$ value for population $i$. We set the $W_i$ parameters
(evenly spaced values increasing and decreasing between 0.08 and 0.04)
to generate widths approximately as shown in @eliason2011.
We set the area under each curve to 30 units to create
$a_i^{\mathrm{max}}$ values ranging roughly
between 2.2 and 2.9 as in @dorner2008.
These parameter values created some warm-tolerant populations,
some cold-tolerant populations, and some populations with a wider range of
thermal-tolerance but a lower maximum productivity (Fig. \ref{f:curves}a).
Although we refer to a thermal-tolerance curve because temperature is a dominant
driver of salmon productivity [e.g. @mccullough1999; @patterson2007; @eliason2011],
our model could apply to any environmental tolerance (e.g. tolerance to stream flow
volume or changes in snow melt timing; \citeauthor{crozier2008} \citeyear{crozier2008}).

We implemented straying as in @cooper1999. We arranged the populations in a line
and salmon were more likely to stray to streams near their natal stream
(\somstray). Two parameters controlled the straying: the fraction of fish
$f_{\mathrm{stray}}$ (0.02) that stray from their natal stream in any generation
and the rate $m$ (0.1) at which this straying between streams decays with
distance

$$\mathrm{strays}_{ij(t)} = f_{\mathrm{stray}} R_{j(t)} \frac{e^{-m \lvert i-j
\rvert }} {\displaystyle\sum\limits_{ \substack{k = 1 \\ k \neq j}}^{n} e^{-m
\lvert k-j \rvert }}$$

\noindent
where $R_{j(t)}$ is the number of returning salmon at generation $t$ whose natal
stream was stream $j$. The subscript $k$ represents a stream ID and $n$ the
number of populations. The denominator is a normalizing constant to ensure the
desired fraction of fish stray. Our simulation did not account for the
homogenization of diversity due to straying. For example, all salmon in one
population maintained the same thermal-tolerance curve regardless of how many
salmon it received from another stream.

## Fishing

Our simulation used a simple set of rules to establish the exploitation rate of
fisheries and the remainder left to spawn (escapement target). First, to
establish a range of spawner-return values and to mimic the start of an
open-access fishery, for the first 30 years we drew the fraction of fish
harvested randomly from a uniform distribution between 0.1 and 0.9. We discarded
these initial 30 years as a burn-in period. Then, every five years for the
remaining 100 years of our simulation, we fitted a spawner-return function to
the cumulative data for individual populations. The target escapement
rate $E_{\mathrm{tar}}$ (a proportion per year) was set based on @hilborn1992
as

$$E_{\mathrm{tar}} = \frac{R}{b (0.5 - 0.07a)} \label{eq:esc}$$

\noindent
where $R$ represents the return abundance and $a$ and $b$ represent the Ricker
model parameters.
The target harvest rate is then a function of
returns and the escapement target
($H_{\mathrm{tar}} = R - E_{\mathrm{tar}}$).
We included implementation uncertainty in the actual harvest
rate $H_{\mathrm{act}}$ as
a function of the target harvest rate and a beta distribution with location
parameter $\alpha_h$, shape parameter $\beta_h$, and standard deviation of
$\sigma_h$ (set to 0.1 as observed for similar data in @pestes2008).

$$\begin{aligned}
\alpha_h &= H_{\mathrm{tar}}^2 \left( \frac{1 -
H_{\mathrm{tar}}}{\sigma_h^2} - \frac{1}{H_{\mathrm{tar}}} \right)\\ \beta_h
&= \alpha_h \left({\frac{1}{H_{\mathrm{tar}}} - 1}\right)\\
H_{\mathrm{act}} &= \mathrm{beta}(\alpha_h, \beta_h).
\end{aligned}$$

## Environmental dynamics

Environmental dynamics typically have both short- and long-term fluctuations,
such as annual variability and directional climatic warming.
We evaluated portfolio performance under these two components separately
in our initial scenarios
and combined in our final scenario.
We did not explicitly model a cyclical climate trend,
such as the Pacific Decadal Oscillation,
but the effect of such a trend would largely be a product of the
short-term variability and long-term trend. We represented short-term dynamics
$e_{\mathrm{short}(t)}$ as a stationary first-order autoregressive process,
AR(1), with correlation $\rho_e$ (0.1)

$$e_{\mathrm{short}(t)} = e_{t-1} \rho_e + d_t, d_t \sim \mathrm{N}(\mu_d, \sigma_d^2)$$

\noindent
where $d_t$ represents normally distributed deviations of
some mean $\mu_d$ and standard deviation $\sigma_d$.
We set $\mu_d$ to $16\,^{\circ}\mathrm{C}$ and $\sigma_d$ to $2\,^{\circ}\mathrm{C}$,
to approximately match the stream temperature variation in @eliason2011.
We represented long-term environmental dynamics $e_{\mathrm{long}(t)}$
as a linear shift in the temperature through time

$$e_{\mathrm{long}(t)} = e_0 + \beta_e t$$

\noindent
where $e_0$ represents the starting temperature up until the burn-in period ends
and $\beta_e$ represents the annual increase in temperature.
We set $e_0 = 15\,^{\circ}\mathrm{C}$
and $\beta_e = 0.04\,^{\circ}\mathrm{C} / \mathrm{generation}$
to obtain an increase in stream temperature
of $4\,^{\circ}\mathrm{C}$ over the next century
(assuming one generation equals one year)
ending at or above the optimum thermal optimum
of all populations.
This increase approximately matches predicted increases in stream temperature --- relative to the 1980s, stream temperatures in the Pacific Northwest have already increased by approximately $0.2\,^{\circ}\mathrm{C}$/decade [@isaak2012], and are predicted to increase $2$ to $5\,^{\circ}\mathrm{C}$ by 2080 [@mantua2010].

<!--TODO one generation = one year?-->

We summarize the chosen parameter values in \somparam.
Combining salmon population dynamics,
fishing, and environmental dynamics,
we illustrate the components of an example simulation in
Fig. \ref{f:ts} and the effect
of varying population, fishing, and environmental parameters
from their base values on metapopulation abundance in \somsens.

## Conservation scenarios

*Spatial conservation scenarios*: We evaluated four spatial conservation
scenarios (Fig. \ref{f:curves}b--e). We conserved four populations ($b_i = 1000$) and set the unfished equilibrium abundance of the six
remaining populations to near elimination ($b_i = 5$) at
the start of the simulation. These reduced populations could still receive
straying salmon but were unlikely to rebuild on their own to a substantial
abundance. The four spatial scenarios we considered were:

1. Conserve a full range of thermal tolerances (conserve some cool-, some
intermediate-, and some warm-tolerant populations; Fig. \ref{f:curves}b).

2. Conserve the middle section of the metapopulation (conserve the most
thermal-tolerant populations with the widest response curves; Fig.
\ref{f:curves}c).

3. Conserve the lower half of the metapopulation (conserve cool-tolerant
populations; Fig. \ref{f:curves}d).

4. Conserve the upper half of the metapopulation (conserve warm-tolerant
populations; Fig. \ref{f:curves}e).

*Unknown thermal tolerances*: In reality we rarely know precise levels of
thermal response diversity. We therefore also considered cases where conservation was
randomly assigned with respect to thermal tolerance but where conservation
effort ($\sum\limits_{i=1}^n b_i = 2000$) could be
distributed across different numbers of streams. We considered conserving from
two to 16 streams with thermal tolerance distributed along the same range as in
the spatial scenarios. As in the spatial strategies, we reduced the capacity of
the remaining streams to the nominal level of $b_i = 5$.

<!--TODO adjust wording a bit more:-->

*Declining habitat availability*: Habitat capacity in the Pacific Northwest is
likely shrinking over time as salmon populations are squeezed between warming
temperatures reducing habitat from below and declining stream flows reducing
the habitat that remains from above. For example, temperature isotherms are shifting
upstream at 1--25 km/decade in low gradient streams that Chinook use for
spawning [@isaak2013]. At the same time, summer-fall stream flow volumes have
been decreasing 10--30% across the Pacific Northwest over the past 50 years
[@luce2009] and are likely to continue declining [@luce2013]. We therefore
considered a scenario where habitat capacity declined by a constant amount
across all populations. We reduced the $b$ parameters by 0.85 units per
generation so that some of the smaller populations would reach near extinction
by the end of the simulation, as is likely for smaller isolated populations
within this century [e.g. @gustafson2007]. In this scenario, we considered
cases where thermal tolerance was unknown but conservation effort
could be distributed across between 16 and two streams. Climate followed
a combination of the same long-term warming and short-term variability as
before. For many Pacific salmon metapopulations, this scenario represents the most realistic
scenario investigated.

<!--TODO-->
<!--http://www.aslo.net/lo/toc/vol_41/issue_5/1109.pdf-->
<!--max. tolerance for chinook - 24C-->
<!--\citep{eaton1996}-->

# Results

## Spatial conservation scenarios

*Given short-term environmental fluctuations* (strong interannual variation),
conserving a wide range of thermal tolerances is the safest choice because it reduces overall
risk to an ecological portfolio (Fig. \ref{f:sp}a; \somts\ Figs.
\ref{f:eg-sp-arma-full}, \ref{f:eg-sp-arma-half}). The average variance of
metapopulation growth rate was 1.6 times lower given balanced thermal tolerance conservation
(conserving a full range of thermal tolerances or the middle section vs. the
upper or lower half). Thermal tolerance diversity also led to more consistent
stability --- there was less spread in variance across simulated metapopulations
(width of quantiles from left to right in Fig. \ref{f:sp}a). These increases in
stability occurred despite the portfolios being comprised of warm- and
cool-thriving populations that
individually showed greater variation in response to environmental variability
than populations with wide thermal tolerance curves.
We can see the mechanism behind these
portfolio properties by inspecting example population time series (Fig.
\ref{f:sp}c, d). If only the upper or lower half of thermal tolerances is
conserved, the portfolio tends to alternate between performing well and poorly,
depending on the environmental conditions, resulting in a risker portfolio (Fig.
\ref{f:sp}e). This risk is buffered when a diversity of thermal tolerances is conserved (Fig.
\ref{f:sp}c) and the resulting asynchrony in population abundance (\somcor).

*Given long-term environmental change*, such as climate warming, an ecological
manager is hedging his or her bets on the environmental trend and how the
populations will respond by conserving a range of thermal tolerances. The choice
of which populations to conserve affects the "rate of return" (metapopulation
growth rate) properties of an ecological portfolio (Fig. \ref{f:sp}b;
\somts\ Figs. \ref{f:eg-sp-linear-full}, \ref{f:eg-sp-linear-half}). The typical
metapopulation growth rate when thermal tolerances were balanced was near
zero --- the metapopulation neither increased nor decreased in abundance in the
long run. The example metapopulation abundance time series (Fig. \ref{f:sp}d, f)
illustrate the mechanism: by conserving a range of thermal tolerances, when one population
is doing poorly, another is doing well and the metapopulation abundance remains
stationary through time. If a manager had invested only in the populations that
were doing well at the beginning they would have had the lowest metapopulation growth rate
at the end (purple portfolios in Fig. \ref{f:sp}f).

## Unknown thermal tolerances

In a scenario where the distribution of population-level thermal tolerances are unknown,
portfolio optimization informs us that investing in more populations
buffers portfolio risk regardless of environmental trend (Fig. \ref{f:n}).
*Given short-term environmental fluctuations*, conserving more populations
buffers portfolio risk (Fig. \ref{f:n}a, c, d; \somts\ Figs.
\ref{f:eg-n-arma-two}, \ref{f:eg-n-arma-sixteen}). For example, a metapopulation
with 16 conserved populations is on average 1.7 times less variable than
a metapopulation with only eight. At the same time, the random conservation of
thermal tolerances creates an increased spread of possible metapopulation risk
given fewer populations conserved
(increasing quantile width from left to right in Fig. \ref{f:n}a).

*Given long-term environmental change*, conserving more populations buffers
portfolio risk (Fig. \ref{f:n}b; \somts\ Figs. \ref{f:eg-n-linear-two},
\ref{f:eg-n-linear-sixteen}). The metapopulation growth rate of the 16
population scenario was on average 1.9 less variable than the eight population
scenario and 6.4 times less variable than the two population scenario. In
contrast to the short-term environmental noise scenario, with long-term
environmental change, the unknown thermal tolerances create a greater spread of
possible metapopulation growth rates. Higher population numbers decreases this
spread. For example, the width of the 75% quantile of the mean metapopulation
growth rate was 1.5 times narrower for the metapopulations with 16 conserved
populations compared to the metapopulations with eight. Here, the number of
conserved populations buffers non-systematic (primarily demographic)
stochasticity as well as averaging across populations with a variety of thermal
tolerances.

## Declining habitat availability

Given a reduction in stream flow over time along with climate change and
climate variability, a manager encounters a risk-return trade-off when deciding
how many populations to distribute conservation efforts across
(Fig. \ref{f:squeeze}; \somts\ Figs. \ref{f:eg-n-squeeze-two}, \ref{f:eg-n-squeeze-twelve}). Conserving more populations buffers portfolio risk, but
at the expense of expected metapopulation growth rate. For example, the mean
metapopulation variance was 2.7 times lower when 12 populations were conserved
instead of four, but the expected metapopulation growth rate was 2.0 times lower
when 16 populations were conserved instead of eight. The conservation scenarios
represent an efficient frontier where a manager must choose whether to hedge his
or her bets on a smaller number of populations and take on greater expected
variability or conserve more populations and accept a lower expected metapopulation
growth rate.

# Discussion

The importance of conserving populations with
a diversity of responses to the environment is a key assumption of
conservation ecology, but has rarely been tested quantitatively [@mori2013]. We
show how maintaining populations with a variety of thermal tolerances reduces
risk caused by short-term environmental stochasticity and optimizes chances for
long-term persistence given climate change.
Further, conserving more populations reduces metapopulation variability
but possibly at the expense of long-term metapopulation growth rate
if available habitat is squeezed by climate change.
In this discussion, we begin by linking
our model with real-world conservation issues for Pacific Northwest salmon. We
then consider broader implications for metapopulation conservation of any
species and ecological stability in general.

## Implications for salmon conservation

Our results emphasize the importance of promoting ecological conditions that promote
diversity of environmental response to the environment
if stability is to be maintained in the face of
environmental uncertainty. This suggests three clear conservation actions.
First, since habitat heterogeneity can lead to local adaptation [e.g.
@fraser2011], our results emphasize the need to maintain a diversity of salmon
habitat [@rogers2008].
Second, if conservation actions must be prioritized, then
our model suggests we should focus on populations that aren't spatially
contiguous to maximize diversity of response to the environment. Third, our
results demonstrate the advantages of avoiding structures that artificially
remove diversity of environmental response. For salmon, dams are a prominent example
[@mcclure2008a]. Dams can have a double impact whereby their introduction
selectively eliminates a large swath of contiguous habitat, perhaps analogous to
our upper- or lower-half scenarios in Fig. \ref{f:sp}, and then mitigation
approaches such as hatcheries can further reduce response
diversity if not carefully managed [@mcclure2008b]. In fact, salmon habitat lost
to dams in the western U.S. has been biased towards warmer, drier, higher
habitats [@mcclure2008a] and our findings suggest the resulting loss of
warm-tolerant species may compound the risk to current metapopulations in the
face of global warming.

The goals of existing salmon management structures in the western US and Canada
support a portfolio conservation perspective. In the US, salmon populations are
divided into Evolutionarily Significant Units (ESUs), groups of populations
that are reproductively isolated and share a common evolutionary heritage,
and finer-scale Viable Salmonid Populations (VSPs), populations that are
demographically independent of other populations over a 100-year time frame
[@mcelhany2000]. In Canada, the rough equivalent to the ESU is a Conservation
Unit (CU), which consists of a group of salmon that are reproductively isolated
and that if lost would be unlikely to recolonize in a reasonable time frame
[@dfo2005wsp]. A salmon portfolio in our model could represent an ESU or CU and
the lessons learned from our models are thus directly applicable to management
guidelines in the Pacific Northwest. In fact, a number of VSP guidelines agree
with our findings. For example, VSP guidelines suggest maintaining diversity in
a variety of forms, focusing conservation efforts not just where salmon are
currently abundant, and maintaining metapopulations with some populations near
each other and others further apart [@mcelhany2000].

However, salmon populations in the Pacific Northwest are already heavily
impacted [e.g. @gustafson2007] and VSP and CU recovery goals have not yet been
achieved for most populations. Since European-Americans arrived,
29% of 1400 historical salmon populations in the Pacific Northwest and
California have been lost [@gustafson2007]. Furthermore, 44% of salmon habitat
in the western US (in the lower 48 states) has been lost to dams and other
freshwater blockages [@mcclure2008a]. Changes to habitat, combined with
increasing climate variability, has led to disturbance regimes that differ
substantially in the frequency, magnitude, and duration from historical
patterns, and threaten the resilience of salmon populations [@waples2009]. Many
remaining populations rely on hatcheries for long-term population viability ---
creating substantial evolutionary risks such as outbreeding depression, genetic
homogenization, reduced effective population size, and domestication of fish
(adaption to artificial environments and reduced fitness in wild environments)
[@mcclure2008b]. Reduction of long-term reliance on hatcheries, accompanied by
habitat restoration through, for example, restoring connectivity of floodplains
and stream flow regimes, remains a critical component of long-term salmon
sustainability in the Pacific Northwest --- particularly given predicted
patterns of climate change [@beechie2013].

Our model complements other simulation-based salmon-habitat prioritization
models. While these other models tend to focus on detailed assessment of
individual fish stocks, our model is the first to consider the role of response
diversity in buffering risk for metapopulations as a whole. The Shiraz model is
one complementary prioritization scheme [@scheuerell2006]. It focuses on
detailed conditioning of the habitat-population-dynamics relationship at
multiple life-history stages for a single salmon population. Whereas the Shiraz
model can be applied to an entire watershed, it combines the populations
together as a single unit thereby ignoring the role of population-level environmental response diversity.
A second salmon prioritization model proposes combining population viability
measures with an assessment of the genetic consequences of losing particular
populations [@allendorf1997]. This model, however, also focuses on the
assessment of individual stocks without considering their covariance and
therefore the performance of the salmon portfolio as a whole. Our model does not
replace these prioritization schemes. Rather, it proposes an additional focus on
prioritization that optimizes metapopulation growth *and* risk and that considers
diversity of tolerance to environmental conditions.

<!--Notes from MMM on stream-type ocean-type part:
We need to be careful with this.  Some stream-type ESUs are highly genetically
distinct from others (Interior Columbia and Fraser River Chinook are extremely
separated genetically from all other stocks.  However, many folks have gotten in
the habit of calling populations within primarily coastal ESUs/stocks ocean-type
and stream-type.  In this case, the fish expressing the two life-history types
are very closely related.    In this latter, case, your sentence holds.  In the
former case (i.e. were stream-type Snake River chinook to be replaced by
ocean-type Snake River Chinook, this would effectively be the extinction of an
ESU.    A way to finess this might be to talk about the model incorporating
evolutionary adaptation to change, by having ESUs/metapopulations adopt more
"ocean-type" characteristics. Happy to talk about this issue more or write some
text if you'd like me to.  I am working over the weekend (at a Council meeting),
so no worries about sending me something. -->

While our model captures many relevant aspects
of salmon life history and environmental dynamics,
it ignores others that could be investigated in future analyses
and possibly improve our understanding of salmon portfolio conservation.
First, some salmon populations,
such as ocean-type Chinook,
tend to spawn further downstream than stream-type salmon.
Ocean-type Chinook may therefore be less affected by declining stream flow
and be able to shift upstream to avoid shifting isotherms [@mantua2010].
A model could consider
evolutionary adaptation
by having populations adopt more ocean-type-like characteristics.
Second, our model ignores lost thermal-tolerance diversity from populations
that reach low population sizes
and are reestablished by straying from nearby streams.
An individual-based model might more accurately penalize for this lost diversity
and emphasize the need to define lower limits
on the investment weights in a salmon conservation portfolio.
Third, our model ignores fine-scale within-stream spatial and temporal environmental fluctuations.
Fine-scale extremes in temperature and stream flow
may be particularly important to population dynamics [@mantua2010] and could be incorporated into a future analysis.
Such a model might show an increased benefit of portfolio optimization if the impact of increased magnitude and frequency of local climate extremes is important in addition to the mean trend [@jentsch2007].

## Broad ecological implications and conservation priorities

To promote the stabilizing effect of a diversified ecological portfolio, there
are two key components to identify: (1) the environmental drivers to which
a varied response might occur, and (2) the conservation actions that can
increase or decrease the diversity of response. A third component, identifying
the traits and behaviours that mediate population responses to the environment
may provide further insight into the mechanisms. Environmental drivers of
response can include, for example, changes to temperature, habitat availability,
air quality, water chemistry, or extreme weather [@elmqvist2003]. Identifying
conservation actions that promote environmental response diversity is critical
to developing stable ecological systems [@mori2013]. However, merely measuring
environmental response diversity in real ecological systems is challenging
[albiet possible; @thibaut2012]. Therefore, one realistic solution may be to create
general guidelines from a small number of intensively-monitored systems in which
we can associate changes in synchrony of populations with changes in
conservation regimes [e.g. @moore2010; @carlson2011].
Another solution may be to monitor the diversity
of environmental conditions themselves
(e.g. temperature, stream flow, and gravel size in the case of salmon) since we
know that traits affecting response to environmental conditions are heritable
and are likely to adapt to local conditions [@carlson2011] possibly producing
diversity of response to subsequent disturbances.

<!--*TODO some of this following paragraph now slightly overlaps with the last paragraph in the previous section. OK? Combine them? One is meant to be salmon specific and the other generic.*-->
<!--*MMM: My inclination would be to combine them, and say that they could be expanded to other species as well.  End on a good solid conclusion note.*-->
We suggest a number of specific extensions to our simulation model. First, the
environment-thermal-tolerance mechanism could be expanded --- the distribution
of environmental tolerance across a metapopulation does not necessarily follow
a linear gradient, different forms of environmental tolerance could interact, and
environmental conditions could affect populations through mechanisms other than
productivity. Second, in addition to other taxa, our model could be extended to
ecological communities or meta-communities after accounting for species
interactions. Third, without any modifications, our model could consider the
Moran or environmental-filter concept whereby populations experience
increasingly different environmental forces at further distances
[@schindler2008; @rogers2008]. Fourth, a model could consider the contribution
of contemporary evolution [@stockwell2003]. These rapid adaptations to changes
in the environment could strongly influence portfolio performance and emphasize
the importance of maintaining genetic diversity and a variety of local habitat.
Finally, our model could be conditioned on a system of interest --- say
a particular river basin in our example --- and the metapopulation portfolio
could be optimized across conservation and restoration options as part of
a formal decision analysis.

<!--*TODO I'm wondering about cutting this paragraph... possibly moving a couple of the points and references into other paragraphs. Thoughts?*-->
<!--*MMM: ...I think this paragraph could be cut, and the key points made into topic sentences for other paragraphs.*-->
<!--Our results suggest three broad ecological research priorities. First, it is important to identify the traits that underpin response diversity [e.g. @eliason2011], spatial asynchrony [e.g. @thorson2014; @yeakel2014], and in particular the management schemes that promote these processes [@moore2010; @schindler2010; @carlson2011]. -->
<!--Our work highlights how these processes can-->
<!--contribute to reducing risk and increasing the likelihood of metapopulation-->
<!--persistence given environmental uncertainty. -->
<!--Furthermore, it is likely that-->
<!--these same spatial processes can act within individual populations [@kerr2010].-->
<!--Second, it is important to identify the drivers of productivity across-->
<!--populations and environmental scenarios. For example, what is the relative-->
<!--effect on productivity of population density, population diversity, an-->
<!--environment-recruitment relationship, and environmental regime shifts, and what-->
<!--management approaches are robust to our uncertainty about these contributions-->
<!--[@vert-pre2013]? -->
<!--Third, our work suggests research identify real-life case-->
<!--studies to be used as large-scale tests of our conclusions and to identify how-->
<!--portfolio optimization best integrates with societal goals. -->
<!--For example,-->
<!--portfolio optimization focuses on rate of change, but in ecological systems,-->
<!--society might care more about absolute abundance --- low-growth-high-abundance-->
<!--systems might be preferred to high-growth-low-abundance systems.-->

Management decisions for exploited species often come
with a trade-off between conservation and revenue generation.
Our findings when habitat capacity declined over time illustrate
another kind of trade-off more similar to the trade-off
described by @markowitz1952 in his seminal financial portfolio work.
In this case, managers must navigate a trade-off
between expected risk and return of the metapopulation/portfolio growth rate itself.
No position along this trade-off is inherently better than another
unless considered in the context of societal values.
Does society value short-term stability
or a greater assurance of long-term persistence?
The optimal choice likely lies somewhere in the middle
and parameterizing our model to a specific metapopulation
could illustrate the nature of the trade-off and aid conservation decision making.
However, if environmental tolerance could be targeted for conservation as in Fig. \ref{f:sp},
a manager could likely achieve portfolios
closer to the efficient frontier in Fig. \ref{f:squeeze}.
In other words,
a manager could achieve a lower expected variance for the same expected growth rate
or a higher expected growth rate for the same expected variance ---
a better conservation outcome in either case.

Conservation planning is inherently a spatial activity [@pressey2007] and our
results can inform how we approach spatial conservation planning. First, our
results suggest focusing on conserving the processes and mechanisms underlying
stability, not just biodiversity itself [@pressey2007; @beechie2013]. In
particular, our results suggest that response diversity should be a mainstream
element of conservation, not just species and functional diversity [@mori2013].
Our analysis also illustrates how conserving a portfolio of populations,
ideally selected for a wide range of environmental tolerance,
can help integrate across
environmental uncertainty when spatial planning [@ando2012]. This is
particularly important given the uncertainty surrounding the future ecological
responses to climate change [@walther2002]. Finally, the increasing
rapidness and variability of environmental change necessitates a dynamic
approach in which spatial planning is re-evaluated at regular intervals
[@hannah2002a] --- perhaps testing for changes in population and species
asynchrony in addition to changes in local productivity and variability.
Combined, our results detail a pathway through which population diversity in environmental tolerance
can underpin the stability of ecological systems. This pathway highlights that
diverse natural portfolios may be critical for the conservation of
metapopulations in the face of increasing climate variability and change.

# Acknowledgements

We thank T.A. Branch, J.D. Yeakel, S.M. O'Regan, S.A. Pardo, L.N.K. Davidson,
and C.C. Phillis for helpful discussions and comments on earlier drafts. We
thank D.J. Isaak, an anonymous reviewer, and O.P. Jensen for suggestions that
greatly improved the manuscript. We are particularly grateful to D.J. Isaak for
suggesting and carefully outlining the declining stream flow scenario. Funding
was provided by Simon Fraser University, NSERC (ABC, NKD, SCA), the Canada
Research Chairs Program (NKD), the Liber Ero Chair of Coastal Science and
Management (JWM), Fulbright Canada (SCA), and a Garfield Weston Foundation/B.C.
Packers Ltd. Graduate Fellowship in Marine Sciences (SCA).

