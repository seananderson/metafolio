*Other title ideas:*

-   Portfolio optimization reveals...

-   Portfolio theory reveals conservation strategies that...

-   Intelligent tinkering with ecological portfolios: patterns of
    environmental response diversity drive salmon conservation
    priorities

-   Keeping every cog and wheel...

<!--see Table A1 in "Viable Salmonid Populations and the Recovery of 
  Evolutionarily Significant Units":-->
<!--straying rates from the literature for Pacific salmon. range from 0 to 
  90... usually fularound 4 or 5-->

Long and rambling abstract that's a bit old now
===============================================

1.  Managing risk is fundamental to the conservation of an endangered
    species. When an endangered species exists as a metapopulation, we
    can manage risk at two levels: at the population level or at the
    metapopulation level. Whereas risk is typically managed at the
    population level, a portfolio approach to managing risk might
    consider how conservation affects the "weight" of each population in
    a metapopulation "portfolio".

2.  Here, we ask how a portfolio approach to managing risk can inform
    the spatial conservation of metapopulations in a changing world. To
    answer this, we develop a salmon metapopulation simulation in which
    population-specific productivity is driven by spatially-distributed
    environmental tolerance and patterns of short- and long-term
    environmental change. We then implement different spatial
    conservation "rules of thumb" that control the population-specific
    carrying capacities and evaluate the salmon portfolios along risk
    and return axes, similarly to how financial portfolios are assessed.

3.  Our results show, first, that maintaining populations with a variety
    of environmental tolerances gives the best chance at an efficient
    ecological portfolio --- minimizing metapopulation variance while
    maximizing metapopulation growth rate. This finding emphasizes the
    risk of allowing large spatial blocks of habitat destruction, say
    through the development of dams. Second, we show that focusing on
    well-performing stocks now at the detriment of others is at best
    equivalent to a risky but efficient portfolio and is more likely a
    risky and inefficient portfolio --- it neither minimizes
    metapopulation variance nor maximizes growth rate compared to other
    strategies. Third, we show that maintaining more populations reduces
    metapopulation risk for the same spatial conservation strategy.
    Given a lack of knowledge of how populations respond to the
    environment, the most risk-averse approach is to conserve as many
    populations as possible.

4.  Our findings highlight three key points: (1) the conservation
    priority of maintaining biocomplexity and therefore environmental
    response diversity, (2) the research priority of identifying
    differences in environmental tolerance given predicted environmental
    changes, and (3) the utility of considering risk for groups of fish
    stocks --- especially given environmental, biological, and
    implementation uncertainty --- through the lens of portfolio theory.

Introduction
============

<!--Managing risk is fundamental to the conservation of an endangered species. -->


<!--When an endangered species exists as a metapopulation, we can manage risk at two levels: at the population level or at the metapopulation level. Typically we treat sources of risk at the metapopulation level as external and uncontrollable and so we manage risk by altering fishing or hunting on a population level as well as improving the connectivity of populations.-->

<!--The management of financial portfolios provides another way of considering risk for metapopulations. -->
<!--Economists consider the risk and performance of a financial portfolio as a function of the weighting of individual assets that make up the portfolio. Modern Portfolio Theory (MPT) proposes that there is a set of portfolios that maximizes expected return for a level of expected risk or minimizes expected risk for a level of expected return [@markowitz1952; @markowitz1959]. This optimal set contains portfolios that range along a continuum of risk-tolerance; economists refer to this set as the efficient frontier.-->

<!--Portfolios provide another way of managing risk - explain mean-variance optimization and how this translates to ecology-->
<!--[@figge2004]-->
<!--[@hoekstra2012] -->
<!--[@ando2011,@ando2012] -->
<!--[@markowitz1952,@markowitz1959]-->

<!--We use salmon as an example, describe the components of the example, provide references on metapopulation existence-->
<!--[@schindler2010]-->

-   Managing risk is fundamental to the conservation of an endangered
    species.
    -   risk is usually assessed on a population by population basis
    -   for metapopulations, we can consider risk for components or risk
        for the whole

-   The management of financial portfolios provides another way of
    considering risk for metapopulations.
    -   performance of weighted assets
    -   efficient frontier concept
    -   the parallels with ecological metapopulations

-   Pacific salmon are an ideal model to consider under the framework of
    portfolio prioritization because of their metapopulation structure,
    their societal importance and threatened status, and the need to
    prioritize conservation efforts.
    -   portfolio-like structure
        -   documented metapopulation structure
        -   predators and fisheries often integrate across stocks

    -   Highly threatened; highly valued; face many threats
        -   damns
        -   roads
        -   other habitat degradation
        -   logging
        -   fishing
        -   changing climate

    -   There's a need for prioritization
        -   because of the highly threatened nature
        -   conflicting goals for resource use
        -   limited resources
        -   Existing prioritization schemes

-   Portfolio stabilization through systematic asynchrony in salmon
    population dynamics can be driven by stocks responding uniquely to
    the same environment ('response diversity') or by physical features
    of the environment causing stocks to experience different
    environmental forces ('environmental filter').
    -   different responses to the environment: response diversity /
        biocomplexity
        -   genetic variation by stock
        -   can be driven through historical conditions
        -   we focus on this here

    -   experiencing different environment: environmental filter concept
        (Moran like)
        -   spatially spread out, geographical and hydrological features
            filter the environment to create a variety of forces
        -   Typically a combination of both

    -   Conversely, forces acting against asynchrony
        -   inverse: loss of population diversity
        -   inverse: moran
        -   but also: dispersal
        -   and: trophic interactions with synchronized species

Here, we ask how a portfolio approach to management can inform the
conservation of metapopulations in a changing world. We ask two primary
questions: (1) What does portfolio optimization tell us about different
spatial approaches to prioritizing metapopulation conservation assuming
that response diversity is spatially distributed? (2) In a scenario
where we don't know the population-level response diversity, what does
portfolio optimization tell us about the number of populations
conserved? To answer these questions, we develop a salmon metapopulation
simulation in which population-specific productivity is driven by
spatially-distributed environmental tolerance and patterns of short- and
long-term climatic change. We then implement different conservation
"rules of thumb" that control the population-level carrying capacities.
We evaluate the salmon portfolios along risk and return axes, similarly
to how financial portfolios are assessed. Our findings illustrate that:
(1) conserving response diversity buffers metapopulation risk given
short-term climate forcing and rate of return given long-term climate
forcing, (2) conserving more subpopulations buffers risk regardless of
the climate trend, and (3) considering metapopulations through the lens
of portfolio theory provides a useful additional dimension through which
we can evaluate conservation strategies.

<!--(3) the research priority of identifying differences in environmental tolerance, and (3) the utility of considering risk for metapopulations --- especially given environmental, biological, and implementation uncertainty --- through the lens of portfolio theory.-->


Methods
=======

We developed a salmon metapopulation simulation model that includes a
stock-recruit relationship, demographic stochasticity, straying between
populations, varying responses to the environment, escapement target
setting, and implementation uncertainty. Under two kinds of
environmental regimes we tested different conservation rules of thumb
and evaluated these plans in risk-return space similar to how financial
managers evaluate financial portfolios. See Figure \ref{f:sim-flow} for
an illustration of the overall simulation structure. See Table
\ref{t:pars} for a list of the input parameters to our simulation and
their default values. We provide a package \texttt{metafolio} for the
statistical software \texttt{R} [@r2013] as an appendix, to carry out
the simulations and analyses we describe in this paper.

Defining the ecological portfolio
---------------------------------

In our ecological portfolios, we defined assets as stream-level
populations and the portfolios as salmon metapopulations (Table
\ref{t:port}). We use the terms \textit{stream} and \textit{populations}
interchangeably to represent the portfolio assets. We defined the
portfolio investors as the stakeholders in the fishery and
metapopulation performance. For example, we could consider fisheries
managers, conservation agencies, or First Nations groups as investors.
We defined asset value as the abundance of returning salmon in each
stream and value of the portfolio as the overall metapopulation
abundance. In this scenario, the equivalent to financial rate of return
is the generation-to-generation rate of change of metapopulation
abundance. We defined the financial asset investment weights as the
capacity of the stream populations --- specifically the unfinished
equilibrium stock size --- since maintaining or restoring habitat
requires money, time, and resources.

Salmon metapopulation dynamics
------------------------------

The salmon metapopulation dynamics in our simulation were governed by a
spawner-return relationship with stochastic demographic noise and by
straying between populations.

### Spawner-return relationship

We defined the spawner-return relationship with a Ricker model
[@ricker1954],

\begin{equation}
R_{ti} = S_{ti}e^{a_{ti}(1-S_{ti}/b_i) + w_{ti}}
\end{equation}
\noindent where $t$ represents a generation time, $i$ represents a
population, $R$ is the number of returns, $S$ is the number of spawners,
$a$ is the productivity parameter (which can vary with the environment),
and $b$ is the density-dependent term (which is used as the asset
weights in the portfolios). The term $w_{ti}$ represents first-order
autocorrelated error. Formally, $w_{ti} = w_{ti-1} \rho_w + v_{ti}$,
where $v_{ti}$ represents independent and normally distributed error
with mean 0 and standard deviation of $\sigma_v$. The parameter $\rho_w$
represents the correlation between residuals from subsequent
generations.

We manipulated the capacity and productivity parameters $b$ and $a$ as
part of the portfolio simulation. The capacity parameters $b_i$ were
controlled by the investment weights in the populations. For example, a
large investment in a stream was represented by a larger unfished
equilibrium stock size $b$ for stream $i$. The productivity parameters
$a_{ti}$ were controlled by the interaction between an environmental
signal and the stream-level population environmental-tolerance curves.

We generated the environmental-tolerance parabolas according to

\begin{equation}
  a_{ti} =
  \begin{cases}
    W_i (e_t - e_i^{\mathrm{opt}})^2 + a_i^{\mathrm{max}},
      & \text{if } a_{ti} > 0\\
      0, & \text{if } a_{ti} \leq 0
  \end{cases}
\end{equation}
\noindent where $W_i$ controls the width of the curve for population
$i$, $e_t$ represents the environmental value at generation $t$,
$e_i^{\mathrm{opt}}$ represents the optimal environmental value for
population $i$, and $a_i^{\mathrm{max}}$ represents the maximum possible
$a$ value for population $i$. We set the $W_i$ parameters (Table
\ref{t:pars}) and calculated the $a_i^{\mathrm{max}}$ parameters so that
the area under each curve $A_i$ was equal. See Figure \ref{f:curves}a
for example environmental-tolerance curves.

### Straying

We implemented straying as in @cooper1999. We set up the metapopulation
in a simple scenario: we arranged the populations in a line and those
that were nearer to each other were more likely to stray between each
other. Two parameters controlled the straying: the fraction of fish
$f_{\mathrm{stray}}$ that stray from their natal stream in any
generation and the rate $m$ at which this straying between streams
decays with distance. We calculated the number of salmon straying from
stream $j$ to stream $i$ as

\begin{equation}
  \mathrm{strays}_{tij} = f_{\mathrm{stray}} R_{tj}
    \frac{e^{-m \lvert i-j \rvert }}
      {\displaystyle\sum\limits_{\substack{k = 1 \\
    k \neq j}}^{n} e^{-m \lvert k-j \rvert }}
  \label{eq:stray}
\end{equation}
\noindent where $R_{tj}$ is the number of returning salmon at generation
$t$ whose natal stream was stream $j$. The subscript $k$ represents a
stream ID and $n$ the number of populations. The denominator is a
normalizing constant to ensure the desired fraction of fish stray. See
Figure \ref{f:stray} for an example straying matrix.

Fishing
-------

Our simulation used a simple set of rules to establish escapement
targets and harvest the fish. Every $f_\mathrm{assess}$ years (default
of five years) our simulation fitted a spawner-return function and
target harvest rate $H_{\mathrm{tar}}$ was set based on @hilborn1992 as

\begin{equation}
  H_{\mathrm{tar}} = \frac{A}{b (0.5 - 0.07a)}
  \label{eq:esc}
\end{equation}
\noindent where $A$ represents the return abundance and $a$ and $b$
represent the Ricker model parameters. We included implementation
uncertainty in the actual harvest rate $H_{\mathrm{act}}$ as

\begin{equation}
  H_{\mathrm{act}} = \mathrm{beta}(\alpha_h, \beta_h)
\end{equation}
\noindent where $\alpha_h$ and $\beta_h$ are the location and shape
parameters in a beta distribution. They can be calculated from the
desired mean $\mu_h$ and standard deviation $\sigma_h$ as [@morgan1990,
p. 97]

\begin{align}
  \alpha_h &= \mu_h^2
                \left(
                \frac{1 - \mu_h}{\sigma_h^2} - \frac{1}{\mu_h}
                \right)\\
   \beta_h &= \alpha \left({\frac{1}{\mu_h} - 1}\right).
\end{align}
\noindent Further, to establish a range of spawner-return values and to
mimic the start of an open-access fishery, for the first 30 years we
drew the fraction of fish harvested randomly from a uniform distribution
between 0.1 and 0.9. We discarded these initial 30 years as a burn-in
period throughout our analyses. <!--TODO is this reasonable?-->

Environmental dynamics
----------------------

We evaluated portfolio performance under short- and long-term
environmental dynamics. We represented short-term dynamics as a
stationary first-order autoregressive process, AR(1), with correlation
$\rho_e$

\begin{equation}
  e_t = e_{t-1} \rho_e + d_t, d_t \sim \mathrm{N}(0, \sigma_d)
\end{equation}
\noindent where $e_t$ represents the environmental value in generation
$t$ and $d$ represents normally distributed deviations of mean 0 and
standard deviation $\sigma_d$. We represented long-term environmental
dynamics as a linear shift in the environmental value through time

\begin{equation}
  e_t = \alpha_e + \beta_e t
\end{equation}
\noindent where $\alpha_e$ represents the intercept and $\beta_e$ the
slope. To maintain a balanced response, we centered the trend so that
midway through the simulation (after any burn-in period) the
environmental value was at the mean environmental tolerance.

Conservation rules of thumb
---------------------------

We evaluated two sets of conservation rules of thumb: (1) spatial
response diversity conservation strategies in an idealistic scenario
where you can detect response diversity, and (2) a more realistic
scenario where we know little about response diversity and we're left
with a choice of how many populations to conserve.
<!--We then considered how optimal these rules of thumb were across all possible conservation-prioritization strategies.-->

### Spatial conservation strategies

We evaluated four spatial conservation rules of thumb (Figure
\ref{f:curves}b--e). In all spatial scenarios, we conserved four
populations and set the unfished equilibrium biomass of the remaining
populations to near elimination (five salmon). These reduced populations
could still receive straying salmon but were unlikely to rebuild on
their own to a substantial abundance. The four scenarios were:

1.  Conserve an even sampling of response diversity.
2.  Conserve the most stable populations only.
3.  Conserve one half of the metapopulation.
4.  Conserve the other half of the metapopulation.

### How many populations to conserve?

In reality we rarely know precise levels of response diversity. We
therefore additionally considered a case where the conservation was
randomly assigned with respect to response diversity but where different
numbers of streams could be conserved. We considered conserving from two
to 16 streams. Similarly to the spatial strategies, we reduced the
capacity of the remaining streams to the nominal level of five salmon.

<!--### How optimal are the conservation strategies? ###-->

<!--To test how optimal the strategies were, we generated metapopulation portfolios in which the investment weights (Ricker $b$ parameters) were randomly assigned such that the total available "investment" remained constant. This Monte-Carlo strategy illustrates a large sample of possible portfolios in risk-return space. We then placed the conservation strategies listed above into this space to determine how close to the efficient frontier they lie. [Figure not shown yet]-->

<!--## Sensitivity anlyses ##-->

<!--We considered the sensitivity of our results to a variety of parameter values. In Table \ref{t:pars} we describe the base-case values used in the main paper and the alternative values for results shown in the Supporting Material.-->

<!--## Extinction risk-->
<!--How we measured quasi-extinction risk-->
<!--Where we measured it-->

Results
=======

-   Spatial conservation
    -   Short-term environment
        -   Response diversity conservation affects risk properties of
            portfolio
        -   Nearly the same portfolio whether you invest in the most
            stable or the full range of responses
        -   Local demographic extinction may be different
        -   You can see this for an example metapopulation time series:
            c, e: generation-to-generation fluctuations dampened by
            response diversity - a ying for every yang

    -   Long-term environment
        -   Response diversity conservation affects return properties of
            portfolio
        -   Depends whether you "get it right" in choosing the right
            populations to conserve
        -   Notably, those that are most productive at first are no
            longer so later
        -   You can see what's happening in the example time series: d,
            f: You get it right or wrong in the long run. Response
            diversity means that when one does poorly another is doing
            well, longterm rate of return is stable

-   Number
    -   Short-term environment
        -   More is usually better for risk (give ratios)
        -   The unknown response diversity causes a risk spread
        -   Example time series: Fig 4c: Can see the stabilizing effect
            of number on the rate of change
        -   Example time series Fig 4d: The way we've set it up, this
            also affects the absolute abundance - a double whammy

    -   Long-term environment
        -   The unknown response diversity causes a spread in rate of
            return - some cases do well, some do poorly depending on the
            selection of traits
        -   More is also usually better in terms of risk
        -   More dampens demographic stochasticity
        -   More likely to end up with response diversity?

<!--We show the components of an example simulation in Figure \ref{f:sp-eg}.-->

<!--## The importance of conserving response diversity ##-->

Figure \ref{f:sp-mv}

<!--## The importance of conserving many populations ##-->

Figure \ref{f:n-mv}

Figure \ref{f:eg-n-linear} Figure \ref{f:eg-n-arma} Figure
\ref{f:eg-sp-arma} Figure \ref{f:eg-sp-linear}

<!--## Base case ##-->

<!--## Effect of X on ... ##-->

<!--## Effect of Y on ... ##-->

Discussion
==========

Acknowledgements
================

\bibliographystyle{apalike}
\bibliography{jshort,ms}
\clearpage

Tables
======

\begin{table}[h!]
\centering
\small
\caption{Components of salmon metapopulation portfolios KEEP THIS?}
\begin{tabular}{p{3.6cm}p{7.5cm}}
\toprule
Component          & Definition for the salmon portfolio\\
\midrule
Assets             & Stream-level salmon populations; possibly a Viable Salmonid Population\\
Portfolio          & The salmon metapopulation; possibly an Evolutionarily Significant Unit\\
Portfolio managers & Salmon managers\\
Investors          & Salmon managers, conservation agency, or salmon fishers\\
Asset weights      & Carrying capacity (specifically the $b$ parameters in a Ricker model)\\
Asset returns      & Rate of change of generation-to-generation salmon metapopulation abundance\\
Asset risk         & Variance of generation-to-generation salmon metapopulation abundance\\
\bottomrule
\end{tabular}
\label{t:port}
\end{table}
\clearpage

\begin{table}[h!]
\centering
\footnotesize
\caption{Input parameters to the salmon metapopulation simulation with default values.}
\begin{tabular}{p{7.7cm}p{1.4cm}p{3.6cm}}
\toprule
Description                                                                                & Symbol                & Value \\
\midrule

\textit{Population dynamics parameters}                                                             &                       & \\
Stock-recruit residual standard deviation (on log scale)                                   & $\sigma_v$            & 0.30  \\
AR(1) serial correlation of stock-recruit residuals                                        & $\rho_w$              & 0.40  \\
Fraction of fish that stray from natal streams                                             & $f_{\mathrm{stray}}$  & 0.02  \\
Exponential rate of decay of straying with distance                                        & $m$                   & 0.3  \\

\noalign{\vskip 3mm} 
\textit{Environmental parameters}                                                                   &                       & \\
Width of environmental-tolerance curves for populations $i$ 1 to $n$                       & $W_i$                 & seq(0.05, 0.02, 0.02 0.05, length = n pop)\\
Optimum environmental value for populations $i$ 1 to $n$                                   & $e_i^{\mathrm{opt}}$  & seq(13, 19, length = n pop)\\
Area under each environmental-tolerance curve in environmental units                       & $A$                   & 30\\
AR(1) autocorrelation of the environmental signal for the short-term fluctuation scenarios & $\rho_e$              & 0.1 \\
Standard deviation of environmental noise for the short-term fluctuation scenarios         & $\sigma_d$            & 2 \\

\noalign{\vskip 3mm} 
\textit{Fishery parameters}                                                                         &                       & \\
Standard deviation of beta distribution for implementation error                           & $\sigma_{h}$          & 0.05  \\
Frequency of assessment (years)                                                            & $f_{\mathrm{assess}}$ & 5  \\
\bottomrule
\end{tabular}
\label{t:pars}
\end{table}
\clearpage

Figures
=======

<!--1. Flow chart of Monte Carlo procedure-->
<!--2. Climate scenarios-->
<!--3. Climate-productivity curves (response-diversity scenarios)-->
<!--4. Time series components of an example simulation-->
<!--5. Effect on returns of ramping up or down each main parameter-->
<!--6. Efficient frontier given various climate scenarios-->
<!--7. Rules of thumb (in the spirit of VSP guidelines) in risk-reward space-->
<!--8. Potentially a plot that shows how some summary metric of the efficient 
       frontier or rules of thumb for high and low scenarios of important 
       simulation parameters-->

\clearpage
\begin{figure}[htbp]
\centering
\includegraphics[height=5.5in]{../examples/simulation-diagram2.pdf}
\caption{Flow chart of the salmon-metapopulation simulation. There are $n$ salmon populations and $t$ generations. Blue text indicates values that are generated before the simulation progresses through time. Red text indicates steps in which calculations are performed through time. Black text indicates values that are calculated. Grey text indicates parameters that can be set. Green text indicates the looping structure of the simulation.}
\label{f:sim-flow}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=3.0in]{../examples/thermal-curve-scenarios.pdf}
\caption{Different ways of prioritizing response-diversity conservation. Panel a shows the thermal tolerance cures for ten possible populations and panels b--e show different ways of prioritizing four of those populations. The curves describe how productivity varies with the environment for a given population. Some populations thrive at low environmental values (cool colours) and some at high (warm colours) values. Some are tolerant to a wider range of environmental conditions (yellow-to-green colours) but with a lower maximum productivity. The total possible productivity (the area under the curves) is the same for each population.}
\label{f:curves}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=4.0in]{../examples/spatial-arma-sim.pdf}
\caption{The components of an example metapopulation simulation.  We show, from top to bottom, the environmental signal, the resulting productivity parameter (Ricker $a$), the salmon returns, fisheries catch, salmon escapement, salmon straying from their natal streams, salmon joining from other streams, stock-recruit residuals on a log scale, and the estimated $a$ and $b$ parameters in the fitted Ricker curve. The colored lines indicate populations that thrive at low (cool colours) to high (warm colours) environmental values.}
\label{f:sp-eg}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=5.0in]{../examples/spatial-mv.pdf}
\caption{The importance of preserving environmental response diversity through spatial conservation strategies. The conservation strategies correspond to Fig.~\ref{f:curves} and represent conserving a range of responses (green), the most stable populations only (orange), or one type of environmental response (purple and pink).  In risk-return space we show environmental scenarios that are comprised primarily of (a) short-term and (b) long-term environmental fluctuations (see Fig.~X). The dots show simulated metapopulations and the contours show 25\% and 75\% quantiles across 500 simulations per strategy. We also show example metapopulation abundance time series for the (c, e) short-term and (d, f) long-term  environmental-fluctuation scenarios.}
\label{f:sp-mv}
\end{figure}
\clearpage

\begin{figure}[htbp]
\centering
\includegraphics[width=5.0in]{../examples/cons-plans-n.pdf}
\caption{The importance of preserving as many subpopulations as possible when we don't know how response diversity is distributed. In risk-return space we show environmental scenarios that are comprised primarily of (a) short-term and (b) long-term environmental fluctuations (see Fig.~X). We show metapopulations in which 2 (red), 4 (orange), 8 (yellow), or 16 (green) populations of random response diversity are conserved. The dots show simulated metapopulations and the contours show 25\% and 75\% quantiles across 500 simulations per strategy. We also show example metapopulation (c) rate-of-change and (d) abundance time series for the short-term environmental-fluctuation scenario.}
\label{f:n-mv}
\end{figure}
\clearpage

<!--\begin{figure}[htbp]-->
<!--\centering-->
<!--\includegraphics[width=5.0in]{../examples/quasi-extinct.pdf}-->
<!--\caption{First draft of a quasi-extinction figure I THINK THIS WILL BE -->
<!--SCRAPPED OR CHANGED. The y-axis shows the cumulative proportion of -->
<!--subpopulations that have had abundance dip below a threshold of 20\% -->
<!--of unfished equilibrium abundance. We could show a (binomial) -->
<!--measure of uncertainty around these if we want to. Some interesting points: the -->
<!--cumulative proportion of ``quasi-extinction'' is higher for both ``one half'' -->
<!--scenarios. If it's set up correctly, then this means that there's a benefit to -->
<!--the subpopulations to investing in a more ``optimal'' portfolio. The }-->
<!--\label{f:ext}-->
<!--\end{figure}-->




