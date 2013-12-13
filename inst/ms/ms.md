\setlength{\parskip}{4pt}

# Portfolio conservation of metapopulations under climate change

\bigskip

Sean C. Anderson^1\*^, Jonathan W. Moore^1,2^, Michelle M. McClure^3^, Nicholas K. Dulvy^1^,
Andrew B. Cooper^2^

^1^Department of Biological Sciences, Simon Fraser University, Burnaby BC, V5A 1S6, Canada

^2^School of Resource and Environmental Management, Simon Fraser University, Burnaby, BC, V5A 1S6, Canada

^3^Northwest Fisheries Science Center,
National Marine Fisheries Service,
Seattle, WA 98110, USA

*Statement of authorship*:
SCA, JWM, MMM, NKD, and ABC designed the analyses.
SCA wrote the simulation code, analyzed the results, and wrote the first draft of the manuscript.
All authors contributed substantially to revisions.

*Running title*:
Portfolio conservation of metapopulations (41/45 characters)

*Keywords*:
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

*Type of article*: Letters

*Words in abstract and main text*: 150, 4690

*Number of references*: 50

*Number of figures*: 5

^\*^Corresponding author:
Sean C. Anderson; Department of Biological Sciences,
Simon Fraser University, Burnaby BC, V5A 1S6;
Phone: 1-778-782-3989; E-mail:
sean@seananderson.ca

\clearpage
\setlength{\parskip}{18pt}

# Abstract

The mechanisms underlying the stability of ecological systems are a key focus of ecology and increasingly important given the rate and magnitude of biodiversity loss and environmental change. Here we ask how a portfolio approach can inform conservation priorities for metapopulations in a changing world. We develop a salmon metapopulation simulation where productivity is driven by thermal tolerance and patterns of short- and long-term environmental change. We implement spatial conservation scenarios and evaluate the salmon portfolios as a financial manager might --- along risk-return axes. We show that conserving response diversity minimizes risk given environmental stochasticity and ensures persistence given long-term environmental change. Even with unknown response diversity, doubling the populations conserved may halve metapopulation variability. These findings show how preserving the processes that promote response diversity, such as habitat heterogeneity and natural disturbance regimes, may be critical to conserving metapopulations in the face of climate variability and change.

\clearpage

# Introduction

Untangling the mechanisms that underpin the stability of ecological systems is a critical focus of ecology [e.g. @ives2007; @demazancourt2013]. Decades of research has focused on the role of species richness and functional diversity in driving community stability; however, recent research has highlighted that the drivers of ecological stability are more complex and multidimensional than previously thought [e.g. @balvanera2006; @ives2007; @demazancourt2013]. Two key drivers of stability that have been comparatively understudied are response diversity [@mori2013] --- different responses to the environment by functionally similar species or populations [@elmqvist2003] --- and the role of metapopulations [@schtickzelle2007]. Here, we examine the role of response diversity conservation in stabilizing metapopulations given projected changes in climate. With unprecedented loss of biodiversity and levels of anthropogenic environmental change, it is more critical than ever to consider conservation approaches that maintain system stability in the face of environmental uncertainty [@ando2012].

Typically, conservation actions to maintain system stability and thereby reduce risk are driven by an *ad hoc* combination of scientific information, political influences, and feasibility [@margules2000]; the management of financial portfolios provides another way of considering risk [e.g. @figge2004; @koellner2006; @ando2012; @haak2012]. Economists work to minimize risk and maximize returns by building a portfolio of individual investments (called assets) with different attributes. For example, different financial sectors can be expected to perform uniquely in some economic conditions; when one rises in value another may fall. Modern Portfolio Theory proposes that out of all possible portfolios, there is a small subset of portfolios that maximizes expected return for a level of risk or minimizes risk for a level of return (called the efficient frontier), and that only by considering risk and return in tandem can an investor achieve maximum benefit from a portfolio [@markowitz1952].

Similarly, expected growth rate and variance of a metapopulation is a function of the variance, covariance, and size of the individual populations [@moore2010; @carlson2011; @anderson2013]. An ecological portfolio approach to managing risk for a metapopulation might therefore consider how conservation actions affect the weight of each population in a metapopulation portfolio. This investment weight could represent the conservation budget or the habitat conserved for each population. The population growth rate is then analogous to the rate of return and the variability of that growth rate a metric of risk. Environmental conditions could represent the financial market conditions. Given this interpretation, ecological managers could consider how various conservation strategies affect the expected risk and return of their ecological portfolio.

Managing Pacific salmon under the uncertainty of climate change is an ideal scenario to consider through the lens of portfolio theory for four reasons. (1) The migration of Pacific salmon biomass profoundly influences aquatic and terrestrial coastal ecosystems throughout the North Pacific ocean from Korea to California [@quinn2005]. (2) Pacific salmon form metapopulations [e.g. @cooper1999; @schtickzelle2007] and we can consider, for example, the metapopulation in a river-catchment as a portfolio and the stream populations as assets [@schindler2010; @moore2010; @carlson2011; @anderson2013; @yeakel2013]. Fisheries often integrate across multiple populations, acting as investors in the salmon portfolio [@hilborn2003]. Fisheries managers and conservation agencies can act as portfolio managers by choosing which salmon habitat to prioritize for protection or restoration. (3) Many Pacific salmon metapopulations are highly threatened [e.g. @gustafson2007] and will likely become more at risk as threats such as overfishing, damming, logging, and particularly changing climate, intensify [e.g. @lackey2003]. Indeed, recovery goals for Pacific salmon are often set at the metapopulation level, and knowing what minimizes risk to the metapopulation can help choose efficient conservation actions [@mcelhany2000]. (4) Given the scale and variety of the threats facing salmon, some prioritization will be required to recover these highly-valued, even iconic species [@allendorf1997; @ruckelshaus2002].

Two key mechanisms can generate the asynchrony in metapopulation dynamics that is critical to a diversified portfolio. First, localized habitat features can filter larger-scale environments, generating unique conditions for populations [@schindler2008] (*sensu* the Moran effect). Second, salmon populations may respond differently to environmental variability [i.e. response diversity, @elmqvist2003; and biocomplexity, @hilborn2003] arising from unique local adaptations and traits [@crozier2008; @fraser2011; @eliason2011]. In reality, these mechanisms can interact. For example, salmon response diversity in the marine environment can be driven by adaptation to localized freshwater environments [@johnson2013a].

In addition to posing perhaps the greatest threat to global biodiversity in general [@thomas2004], climate warming poses a particular threat to riverine species whose ranges are largely confined to existing habitat [@thomas2010]. Among these species, salmon are strongly affected by climate warming [e.g. @patterson2007], but within a range, show a remarkable diversity of tolerance to temperature [e.g. @crozier2008; @eliason2011]. Warmer water can lead to massive mortality of salmon populations [e.g. @patterson2007] and indirectly impact salmon productivity through alterations to snow-melt timing and extreme hydrological events [@crozier2008]. Due to these effects, adverse stream temperatures are already impeding recovery of some Pacific salmon populations [@mccullough1999] and are expected to make recovery targets more difficult to achieve [@battin2007]. However, despite the evidence that warming impacts salmon, salmon also show evidence of response diversity and local adaptation to temperature. For example, thermal tolerance of sockeye salmon in the Fraser River, British Columbia, varies within streams according to historical environmental conditions [@eliason2011].

Here we ask how portfolio theory can inform spatial approaches to prioritizing metapopulation conservation in a changing world. To answer this, we develop a salmon metapopulation simulation in which spatially-distributed thermal tolerance and patterns of short- and long-term climatic change drive population-specific productivity. We then implement scenarios that prioritize alternative sets of populations and evaluate the salmon portfolios along risk-return axes, as a financial portfolio manager might. We show that conserving response diversity buffers metapopulation risk given short-term climate forcing and ensures metapopulation persistence given long-term climate warming. We then show that conserving more populations buffers risk regardless of response diversity or climate trend, and conclude that considering metapopulations through portfolio theory provides a useful additional dimension through which we can evaluate conservation strategies.

# Methods

We developed a 100-year salmon metapopulation simulation model that includes both population dynamics and harvesting along with process, observation, and implementation uncertainty (Fig. 1). We tested different conservation scenarios under two kinds of environmental regimes. We provide a package `metafolio` for the statistical software `R` [@r2013] as an appendix, to carry out the simulations and analyses described in this paper (Supporting Information).

## Defining the ecological portfolio

In our ecological portfolios, we defined assets as stream-level populations and portfolios as salmon metapopulations. We use the terms *stream* and *populations* interchangeably to represent the portfolio assets. We defined the portfolio investors as the stakeholders in the fishery and metapopulation performance. For example, the investors could be conservation agencies, First Nations groups, or civil society as a whole. The fisheries management agency then becomes the portfolio manager. We defined the asset value as the abundance of returning salmon in each stream and the value of the portfolio as the overall metapopulation abundance. In this scenario, the equivalent to financial rate of return is the generation-to-generation metapopulation growth rate. We defined the financial asset investment weights as the capacity of the stream populations --- specifically the unfished equilibrium stock size --- since maintaining or restoring habitat requires money, time, and resources. Investment in a population therefore represents investing in salmon habitat conservation or restoration and the risk and return from investment strategies becomes an emergent property of our metapopulation model.

## Salmon metapopulation dynamics

The salmon metapopulation dynamics in our simulation were governed by a spawner-return relationship with demographic stochasticity and straying between populations. We defined the spawner-return relationship with a Ricker model,

$$R_{i(t+1)} = S_{i(t)}e^{a_{i(t)}(1-S_{i(t)}/b_i) + w_{i(t)}}$$

where $i$ represents a population, $t$ a generation time, $R$ the number of returns, $S$ the number of spawners, $a$ the productivity parameter (which can vary with the environment), and $b$ the density-dependent term (which is used as the asset weights in the portfolios). The term $w_{i(t)}$ represents first-order autocorrelated error. Formally, $w_{i(t)} = w_{i(t-1)} \rho_w + r_{i(t)}$, where $r_{i(t)}$ represents independent and normally-distributed error with standard deviation of $\sigma_r$ (0.3; we include the base values in parentheses after relevant parameters) and mean of $-\sigma_r^2 / 2$ (bias corrected so the expected value after exponentiation is 1). The parameter $\rho_w$ (0.4) represents the correlation between residuals from subsequent generations.

We manipulated the capacity and productivity parameters $b_i$ and $a_{i(t)}$ as part of the portfolio simulation. The capacity parameters $b_i$ were controlled by the investment weights in the populations. For example, a large investment in a stream was represented by a larger unfished equilibrium stock size $b$ for stream $i$. The productivity parameters $a_{i(t)}$ were controlled by the interaction between a temperature time series and the population thermal-tolerance performance curves.

We generated the thermal-tolerance curves according to

$$a_{i(t)} = \begin{cases} a_i^{\mathrm{max}} -
W_i (e_t - e_i^{\mathrm{opt}})^2,
& \text{if } a_{i(t)} > 0\\ 0, & \text{if } a_{i(t)} \leq
0 \end{cases}$$

where $W_i$ controls the width of the curve for population $i$, $e_t$ represents the environmental value at generation $t$, $e_i^{\mathrm{opt}}$ represents the optimal temperature for population $i$, and $a_i^{\mathrm{max}}$ represents the maximum possible $a$ value for population $i$. We set the $W_i$ parameters (evenly spaced values increasing and decreasing between 0.05 and 0.02) and calculated the $a_i^{\mathrm{max}}$ parameters so that the area under each curve was equal (30 units). We chose parameter values such that some populations were warm-tolerant, some were cold-tolerant, and some had a wider range of thermal-tolerance, but a lower maximum productivity (Fig. 2a). Although we refer to a thermal-tolerance curve because temperature is a dominant driver of salmon performance [@mccullough1999; @patterson2007; @eliason2011], our model applies to any environmental tolerance [e.g. tolerance to stream flow volume or changes in snow melt timing; @crozier2008].

We implemented straying as in @cooper1999. We arranged the populations in a line and salmon were more likely to stray to streams near their natal stream (Fig. \ref{f:stray}). Two parameters controlled the straying: the fraction of fish $f_{\mathrm{stray}}$ (0.02) that stray from their natal stream in any generation and the rate $m$ (0.3) at which this straying between streams decays with distance

$$\mathrm{strays}_{ij(t)} = f_{\mathrm{stray}} R_{j(t)} \frac{e^{-m \lvert i-j
\rvert }} {\displaystyle\sum\limits_{ \substack{k = 1 \\ k \neq j}}^{n} e^{-m
\lvert k-j \rvert }}$$

where $R_{j(t)}$ is the number of returning salmon at generation $t$ whose natal stream was stream $j$. The subscript $k$ represents a stream ID and $n$ the number of populations. The denominator is a normalizing constant to ensure the desired fraction of fish stray. Our simulation did not account for the homogenization of diversity due to straying. For example, all salmon in one population maintained the same thermal-tolerance curve regardless of how many salmon it received from another stream.

## Fishing

Our simulation used a simple set of rules to establish the exploitation rate of fisheries and the remainder left to spawn (escapement target). First, to establish a range of spawner-return values and to mimic the start of an open-access fishery, for the first 30 years we drew the fraction of fish harvested randomly from a uniform distribution between 0.1 and 0.9. We discarded these initial 30 years as a burn-in period. Then, every five years our simulation fitted a spawner-return function and the target harvest rate $H_{\mathrm{tar}}$ (a proportion per year) was set based on @hilborn1992 as

$$H_{\mathrm{tar}} = \frac{A}{b (0.5 - 0.07a)} \label{eq:esc}$$

where $A$ represents the return abundance and $a$ and $b$ represent the Ricker model parameters. We included implementation uncertainty in the actual harvest rate $H_{\mathrm{act}}$ as a function of the target harvest rate and a beta distribution with location parameter $\alpha_h$, shape parameter $\beta_h$, and standard deviation of $\sigma_h$ (0.05)

$$\begin{aligned}
\alpha_h &= H_{\mathrm{tar}}^2 \left( \frac{1 -
H_{\mathrm{tar}}}{\sigma_h^2} - \frac{1}{H_{\mathrm{tar}}} \right)\\ \beta_h
&= \alpha \left({\frac{1}{H_{\mathrm{tar}}} - 1}\right)\\
H_{\mathrm{act}} &= \mathrm{beta}(\alpha_h, \beta_h).
\end{aligned}$$

## Environmental dynamics

Environmental dynamics typically have both short- and long-term fluctuations, such as annual variability and directional climatic warming. We evaluated portfolio performance under these two components separately. We did not explicitly model a cyclical climate trend, such as the Pacific Decadal Oscillation, but the effect of such a trend would largely be a product of the short-term variability and long-term trend. We represented short-term dynamics $e_{\mathrm{short}(t)}$ as a stationary first-order autoregressive process, AR(1), with correlation $\rho_e$ (0.1)

$$e_{\mathrm{short}(t)} = e_{t-1} \rho_e + d_t, d_t \sim \mathrm{N}(0, \sigma_d^2)$$

where $d_t$ represents normally distributed deviations of mean 0 and standard deviation $\sigma_d$ (2). We represented long-term environmental dynamics $e_{\mathrm{long}(t)}$ as a linear shift in the environmental value through time

$$e_{\mathrm{long}(t)} = \beta_e t - \overline{\beta_e t}$$

where $\beta_e$ (0.114) represents the slope. We centered the trend by subtracting the mean $\overline{\beta_e t}$ so that midway through the simulation (after the burn-in period) the environmental value was at the mean environmental tolerance.

Combining salmon population dynamics, fishing, and environmental dynamics, we illustrate the components of an example simulation in Fig. 3 and the effect of varying population, fishing, and environmental parameters from their base values on metapopulation abundance in Fig. \ref{f:eg-sens}.

## Conservation scenarios

We evaluated four spatial conservation scenarios (Fig. 2b--e). In all spatial scenarios, we conserved four populations and set the unfished equilibrium abundance of the six remaining populations to near elimination (five salmon) at the start of the simulation. These reduced populations could still receive straying salmon but were unlikely to rebuild on their own to a substantial abundance. The four scenarios we considered were:

1. Conserve a full range of response diversity (conserve some cool-, some intermediate-, and some warm-tolerant populations; Fig. 2b).

2. Conserve the middle section of the metapopulation (conserve the most thermal-tolerant populations with the widest response curves; Fig. 2c).

3. Conserve the lower half of the metapopulation (conserve cool-tolerant populations; Fig. 2d).

4. Conserve the upper half of the metapopulation (conserve warm-tolerant populations; Fig. 2e).

In reality we rarely know precise levels of response diversity. We therefore also considered a case where the conservation was randomly assigned with respect to response diversity but where different numbers of streams could be conserved. We considered conserving from two to 16 streams with thermal tolerance distributed along the same range as in the spatial scenarios. As in the spatial strategies, we reduced the capacity of the remaining streams to the nominal level of five salmon.

# Results

## Which populations to conserve?

*Given short-term environmental fluctuations* (strong interannual variation), conserving response diversity is the safest choice because it reduces overall risk to an ecological portfolio (Fig. 4a; Figs. \ref{f:eg-sp-arma-full}, \ref{f:eg-sp-arma-half}). The average variance of metapopulation growth rate was 2.8 times lower given balanced response diversity (conserving a full range of response diversity or the middle section vs. the upper or lower half). Response diversity also led to more consistent stability --- there was less spread in variance across simulated metapopulations (width of quantiles from left to right in Fig. 4a). These increases in stability occurred despite the portfolios being comprised of warm- and cool-thriving populations that were more variable on their own than populations with wide thermal-tolerance curves. We can see the mechanism behind these portfolio properties by inspecting example population time series (Fig. 4c, d). If only the upper or lower half of response diversity is conserved, the portfolio tends to alternate between performing well and poorly, depending on the environmental conditions, resulting in a risker portfolio (Fig. 4e). This risk is buffered with balanced response diversity (Fig. 4c) and the resulting asynchrony in population abundance (Fig. \ref{f:ret-corr}).

*Given long-term environmental change*, such as climate warming, an ecological manager is hedging his or her bets on the environmental trend and how the populations will respond by conserving balanced response diversity. The choice of which populations to conserve affects the "rate of return" (metapopulation growth rate) properties of an ecological portfolio (Fig. 4b; Figs. \ref{f:eg-sp-linear-full}, \ref{f:eg-sp-linear-half}). The typical metapopulation growth rate for a balanced response diversity strategy was zero --- the metapopulation neither increased nor decreased in abundance in the long run. The example metapopulation abundance time series (Fig. 4d, f) illustrate the mechanism: by conserving response diversity, when one population is doing poorly, another is doing well and the metapopulation abundance remains stationary through time. If a manager had invested only in the populations that were doing well at the beginning they would have had the lowest rate-of-return portfolio at the end (purple portfolios in Fig. 4f).

## How many populations to conserve?

In a scenario where we don't know the distribution of population-level response diversity, portfolio optimization informs us that investing in more populations buffers portfolio risk regardless of environmental trend (Fig. 5). *Given short-term environmental fluctuations*, conserving more populations buffers portfolio risk (Fig. 5a, c; Figs. \ref{f:eg-n-arma-two}, \ref{f:eg-n-arma-sixteen}). For example, a metapopulation with 16 conserved populations is on average 1.6 times less variable than a metapopulation with only eight. At the same time, the random conservation of response diversity creates a spread of metapopulation risk for the same number of populations conserved, particularly given fewer populations (Fig. 5a). For example, the width of the 75% quantile of variance in metapopulation growth rate was 1.7 times narrower for the metapopulations with 16 conserved populations compared to the metapopulations with only eight. We note that the risk-return axes of portfolio optimization ignore the absolute-abundance dimension. As one would expect, conserving fewer populations also results in lower-abundance metapopulations (Fig. 5d).

*Given long-term environmental change*, conserving more populations buffers portfolio risk (Fig. 5b; Figs. \ref{f:eg-n-linear-two}, \ref{f:eg-n-linear-sixteen}). The metapopulation growth rate of the 16 population scenario was on average two times less variable than the eight population scenario and 7.1 times less variable than the two population scenario. In contrast to the short-term environmental noise scenario, with long-term environmental change, the unknown response diversity creates a spread of possible metapopulation growth rates. Higher population numbers decreases this spread. For example, the width of the 75% quantile of the mean metapopulation growth rate was 2.0 times narrower for the metapopulations with 16 conserved populations compared to the metapopulations with eight. Here, the number of conserved populations buffers non-systematic (primarily demographic) stochasticity as well as averaging across populations with a variety of thermal tolerances.

# Discussion

The importance of conserving response diversity is a key assumption of conservation ecology, but has rarely been tested quantitatively [@mori2013]. We show how maintaining populations with a variety of thermal-tolerances reduces risk caused by short-term environmental stochasticity and optimizes chances for long-term persistence given climate change. Further, conserving more populations reduces metapopulation risk regardless of environmental trend and knowledge of response-diversity distribution. Combined, these findings illustrate that focusing on well-performing stocks now at the detriment of others is at best equivalent to an efficient but risky portfolio, and at worst a poorly-performing risky portfolio. In this discussion, we begin by linking our model with real-world conservation issues for Pacific Northwest salmon. We then consider broader implications for metapopulation conservation of any species and ecological stability in general.

## Implications for salmon conservation

Our results emphasize the importance of promoting ecological conditions that increase response diversity if stability is to be maintained in the face of environmental uncertainty. This suggests three clear conservation actions. First, since habitat heterogeneity can lead to local adaptation [e.g. @fraser2011], our results emphasize the need to maintain a diversity of salmon habitat [@rogers2008]. Second, if conservation actions must be prioritized, then our model suggests we should focus on populations that aren't spatially contiguous to maximize diversity of response to the environment. Third, our results demonstrate the advantages of avoiding structures that artificially remove response diversity. For salmon, dams are a prominent example [e.g. @mcclure2008a]. Dams can have a double impact whereby their introduction selectively eliminates a large swath of contiguous habitat, perhaps analogous to our upper- or lower-half scenarios in Fig. 4, and then mitigation approaches such as hatcheries can further reduce population and response diversity if not carefully managed [@mcclure2008b]. In fact, salmon habitat lost to dams in the western U.S. has been biased towards warmer, drier, higher habitats [@mcclure2008a] and our findings suggest the resulting loss of warm-tolerant species may compound the risk to current metapopulations in the face of global warming.

The goals of existing salmon management structures in the western US and Canada support a portfolio conservation perspective. In the US, salmon populations are divided into Evolutionarily Significant Units (ESUs) --- groups of populations that are reproductively isolated and share a common evolutionary heritage --- and finer-scale Viable Salmonid Populations (VSPs) --- populations that are demographically independent of other populations over a 100-year time frame [@mcelhany2000]. In Canada, the rough equivalent to the ESU is a Conservation Unit (CU), which consists of a group of salmon that are reproductively isolated and that if lost would be unlikely to recolonize in a reasonable time frame [@dfo2005wsp]. A salmon portfolio in our model could represent an ESU or CU and the lessons learned from our models are thus directly applicable to management guidelines in the Pacific Northwest. In fact, a number of VSP guidelines agree with our findings. For example, VSP guidelines suggest maintaining diversity in a variety of forms, focusing conservation efforts not just where salmon are currently abundant, and maintaining metapopulations with some populations near each other and others further apart [@mcelhany2000].

However, salmon populations in the Pacific Northwest are already heavily impacted [e.g. @gustafson2007] and VSP and CU guidelines have not yet been effectively implemented for most populations. Since European-Americans arrived, 29% of 1400 historical salmon populations in the Pacific Northwest and California have been lost [@gustafson2007]. Furthermore, 44% of salmon habitat in the western US (in the lower 48 states) has been lost to dams and other freshwater blockages [@mcclure2008a]. Changes to habitat, combined with increasing climate variability, has led to disturbance regimes that differ substantially in the frequency, magnitude, and duration from historical patterns, and threaten the resilience of salmon populations [@waples2009]. Many remaining populations rely on hatcheries for long-term population viability --- creating substantial evolutionary risks such as outbreeding depression, genetic homogenization, reduced effective population size, and domestication of fish (adaption to artificial environments and reduced fitness in wild environments) [@mcclure2008b]. Reduction of long-term reliance on hatcheries, accompanied by habitat restoration through, for example, restoring connectivity of floodplains and stream flow regimes, remains a critical component of long-term salmon sustainability in the Pacific Northwest --- particularly given predicted patterns of climate change [@beechie2013].

Our model complements other simulation-based salmon-habitat prioritization models. While these other models tend to focus on detailed assessment of individual fish stocks, our model is the first to consider the role of response diversity in buffering risk for metapopulations as a whole. The Shiraz model is one complementary prioritization scheme [@scheuerell2006]. It focuses on detailed conditioning of the habitat-population-dynamics relationship at multiple life-history stages for a single salmon population. Whereas the Shiraz model can be applied to an entire watershed, it combines the populations together as a single unit thereby ignoring the role of response diversity. A second salmon prioritization model proposes combining population viability measures with an assessment of the genetic consequences of losing particular populations [@allendorf1997]. This model, however, also focuses on the assessment of individual stocks without considering their covariance and therefore the performance of the salmon portfolio as a whole. Our model does not replace these prioritization schemes. Rather, it proposes an additional focus on prioritization that optimizes metapopulation risk and growth and that considers environmental response diversity.

## Broad ecological implications, research extensions, and conservation priorities

To promote the stabilizing effect of a diversified ecological portfolio, there are two key components to identify: (1) the environmental drivers to which a varied response might occur, and (2) the conservation actions that can increase or decrease the diversity of response. A third component, identifying the traits and behaviours that mediate population responses to the environment may provide further insight into the mechanisms. Environmental drivers of response can include, for example, changes to temperature, habitat availability, air quality, water chemistry, or extreme weather [@elmqvist2003]. Identifying conservation actions that promote environmental response diversity is critical to developing stable ecological systems [@mori2013]. However, merely measuring environmental response diversity in real ecological systems is challenging, albeit possible [e.g. @thibaut2012]. Therefore, a realistic solution may be to create general guidelines from a small number of intensively-monitored systems in which we can associate changes in synchrony of populations with changes in conservation regimes [e.g. @moore2010; @carlson2011].

We suggest a number of specific extensions to our simulation model. First, the environment-response-diversity mechanism could be expanded --- the distribution of response diversity across a metapopulation does not necessarily follow a linear gradient, different forms of response diversity could interact, and environmental conditions could affect populations through mechanisms other than productivity. Second, in addition to other taxa, our model could be extended to ecological communities or meta-communities after accounting for species interactions. Third, without any modifications, our model could consider the Moran or environmental-filter concept whereby populations experience increasingly different environmental forces at further distances [@schindler2008; @rogers2008]. Fourth, a model could consider the contribution of contemporary evolution [@stockwell2003]. These rapid adaptations to changes in the environment could strongly influence portfolio performance and emphasize the importance of maintaining genetic diversity and a variety of local habitat. Finally, our model could be conditioned on a system of interest --- say a particular river basin in our example --- and the metapopulation portfolio could be optimized across conservation and restoration options as part of a formal decision analysis.

Our results suggest three broad ecological research priorities. First, it is important to identify the traits that underpin response diversity [e.g. @eliason2011], spatial asynchrony [e.g. @thorson2013; @yeakel2013], and in particular the management schemes that promote these processes [@moore2010; @schindler2010; @carlson2011]. Our work highlights how these processes can contribute to reducing risk and increasing the likelihood of metapopulation persistence given environmental uncertainty. Second, it is important to identify the drivers of productivity across populations and environmental scenarios. For example, what is the relative effect on productivity of population density, population diversity, an environment-recruitment relationship, and environmental regime shifts, and what management approaches are robust to our uncertainty about these contributions? Third, our work suggests research identify real-life case studies to be used as large-scale tests of our conclusions and to identify how portfolio optimization best integrates with societal goals. For example, portfolio optimization focuses on rate of change, but in ecological systems, society might care more about absolute abundance --- low-growth-high-abundance systems might be preferred to high-growth-low-abundance systems.

Conservation planning is inherently a spatial activity [@pressey2007] and our results can inform how we approach spatial conservation planning. First, our results suggest focusing on conserving the processes and mechanisms underlying stability, not just biodiversity itself [@pressey2007; @beechie2013]. In particular, our results suggest that response diversity should be a mainstream element of conservation, not just species and functional diversity [@mori2013]. Our analysis also illustrates how conserving a portfolio of populations --- ideally selected for response diversity, but failing that, conserving as many populations as possible --- can help integrate across environmental uncertainty when spatial planning [@ando2012]. This is particularly important given the uncertainty surrounding the future effects of climate change on ecological systems [@walther2002]. Finally, the increasing rapidness and variability of environmental change necessitates a dynamic approach in which spatial planning is re-evaluated at regular intervals [@hannah2002a] --- perhaps testing for changes in population and species asynchrony in addition to changes in local productivity and variability. Combined, our results detail a pathway by which environmental response diversity can underpin the stability of ecological systems. This pathway highlights that diverse natural portfolios may be critical for the conservation of metapopulations in the face of increasing climate variability and change.

# Acknowledgements

We thank T.A. Branch, J.D. Yeakel, S.M. O'Regan, S.A. Pardo, L.N.K. Davidson, and C.C. Phillis for helpful discussions and comments on earlier drafts. Discussions with T.A. Branch, in particular, were helpful in the early stages of this work. Funding was provided by Simon Fraser University, NSERC (ABC, NKD, SCA), the Canada Research Chairs Program (NKD), the Liber Ero Chair of Coastal Science and Management (JWM), Fulbright Canada (SCA), and a Garfield Weston Foundation/B.C. Packers Ltd. Graduate Fellowship in Marine Sciences (SCA).
