# Methods #

We developed a salmon metapopulation simulation model that includes a stock-recruit relationship, demographic stochasticity, straying between populations, varying responses to the environment, escapement target setting, and implementation uncertainty. Under two kinds of environmental regimes we tested different conservation rules of thumb and evaluated these plans in risk-return space similar to how financial managers evaluate financial portfolios. See Figure \ref{f:sim-flow} for an illustration of the overall simulation structure. We provide a package \texttt{metafolio} for the statistical software \texttt{R} [@r2013] as an appendix, which can be used to carry out the simulations and analyses we describe in this paper.

## Defining the ecological portfolio ##

In our ecological portfolios, we defined assets as stream-level populations and the portfolios as salmon metapopulations (Table \ref{t:port}). We use the terms \textit{stream} and \textit{populations} interchangeably to represent the portfolio assets. The portfolio investors were the stakeholders in the fishery and metapopulation performance. For example, we could consider fisheries managers, conservation agencies, or First Nations groups as investors. We defined asset value as the abundance of returning salmon in each stream and value of the portfolio as the overall metapopulation abundance. In this scenario, the equivalent to financial rate of return is the generation-to-generation rate of change of metapopulation abundance. We defined the financial asset investment weights as the carrying capacity of the stream populations --- specifically the unfinished equilibrium stock size --- since maintaining or restoring habitat requires money, time, and resources.

## Salmon metapopulation dynamics ##

The salmon metapopulation dynamics in our simulation were governed by a spawner-return relationship with stochastic noise and by straying between populations.

### Spawner-return relationship ###

We defined the spawner-return relationship with a Ricker model [@ricker1954],

\begin{equation}
R_{ti} = S_{ti}e^{a_{ti}(1-S_{ti}/b_i) + w_{ti}}
\end{equation}

\noindent where $t$ represents a generation time, $i$ represents a population, $R$ is the number of returns, $S$ is the number of spawners, $a$ is the productivity parameter (which can vary with the environment), and $b$ is the density-dependent term (which is used as the asset weights in the portfolios). The term $w_{ti}$ represents first-order autocorrelated error. Formally, $w_{ti} = w_{ti-1} \rho_w + v_{ti}$, where $v_{ti}$ represents independent and normally distributed error with mean 0 and standard deviation of $\sigma_v$. The parameter $\rho_w$ represents the correlation between residuals from subsequent generations.

We manipulated the capacity and productivity parameters $b$ and $a$ as part of the portfolio simulation. The capacity parameters $b_i$ were controlled by the investment weights in the populations. For example, a large investment in a stream was represented by a larger unfished equilibrium stock size $b$ for stream $i$. The productivity parameters $a_{ti}$ were controlled by the interaction between an environmental signal and the stream-level population environmental tolerance curves. The environmental tolerance curves were generated as parabolas according to

\begin{equation}
  a_{ti} =
  \begin{cases}
    W_i (e_t - e_i^{\mathrm{opt}})^2 + a_i^{\mathrm{max}},
      & \text{if } a_{ti} > 0\\
      0, & \text{if } a_{ti} \leq 0
  \end{cases}
\end{equation}

\noindent where $W_i$ controls the width of the curve for population $i$, $e_t$ represents the environmental value at generation $t$, $e_i^{\mathrm{opt}}$ represents the optimal environmental value for population $i$, and $a_i^{\mathrm{max}}$ represents the maximum possible $a$ value for population $i$. See Figure \ref{f:all-curves} for example environmental tolerance curves.

### Straying ###

We implemented straying as in @cooper1999. We set up the metapopulation in a simple scenario: we arranged the populations in a line and those that were nearer to each other were more likely to stray between each other. Two parameters controlled the straying: the fraction of fish $f_{\mathrm{stray}}$ that stray from their natal stream in any generation and the rate $m$ at which this straying between streams decays with distance. We calculated the number of salmon straying from stream $j$ to stream $i$ as

\begin{equation}
  \mathrm{strays}_{tij} = f_{\mathrm{stray}} R_{tj}
    \frac{e^{-m \lvert i-j \rvert }}
      {\displaystyle\sum\limits_{\substack{k = 1 \\
    k \neq j}}^{n} e^{-m \lvert k-j \rvert }}
  \label{eq:stray}
\end{equation}

\noindent where $R_{tj}$ is the number of returning salmon at generation $t$ whose natal stream was stream $j$. The subscript $k$ represents a stream ID and $n$ the number of populations. The denominator is a normalizing constant to ensure the desired fraction of fish stray. See Figure \ref{f:stray} for an example straying matrix. 


## Fishing ##

Our simulation used a simple set of rules to establish escapement targets and harvest the fish. Every $f_\mathrm{assess}$ years (base case of five years) our simulation fitted a spawner-return function and target harvest rate $H_{\mathrm{tar}}$ was set based on @hilborn1992 as

\begin{equation}
  H_{\mathrm{tar}} = \frac{A}{b (0.5 - 0.07a)}
  \label{eq:esc}
\end{equation}

\noindent where $A$ represents the return abundance and $a$ and $b$ represent the Ricker model parameters. We included implementation uncertainty in the actual harvest rate $H_{\mathrm{act}}$ as
 
\begin{equation}
  H_{\mathrm{act}} = \mathrm{beta}(\alpha_h, \beta_h)
\end{equation}

\noindent where $\alpha_h$ and $\beta_h$ are the location and shape parameters in a beta distribution. They can be calculated from the desired mean $\mu_h$ and standard deviation $\sigma_h$ as [@morgan1990, p. 97]

\begin{align}
  \alpha_h &= \mu_h^2
                \left(
                \frac{1 - \mu_h}{\sigma_h^2} - \frac{1}{\mu_h}
                \right)\\
   \beta_h &= \alpha \left({\frac{1}{\mu_h} - 1}\right).
\end{align}

\noindent Further, to establish a range of spawner-return values and to mimic the start of an open-access fishery, for the first 20 (TODO variable) years we drew the fraction of fish harvested randomly from a uniform distribution between 0.1 and 0.9. TODO CONSIDER BETTER RANGE HERE

## Environmental dynamics ##

We evaluated portfolio performance under short- and long-term environmental dynamics. We represented short-term dynamics as a stationary first-order autoregressive process, AR(1), with correlation $\rho_e$

\begin{equation}
  e_t = e_{t-1} \rho_e + d_t, d_t \sim \mathrm{N}(0, \sigma_d)
\end{equation}

\noindent where $e_t$ represents the environmental value in generation $t$ and $d$ represents normally distributed deviations of mean 0 and standard deviation $\sigma_d$. We represented long-term environmental dynamics as a linear shift in the environmental value through time

\begin{equation}
  e_t = \alpha_e + \beta_e t
\end{equation}

\noindent where $\alpha_e$ represents the intercept and $\beta_e$ the slope. To maintain a balanced response, we centered the trend so that midway through the simulation (after any burn-in period) the environmental value was at the mean environmental tolerance.

## Conservation rules of thumb ##

We evaluated two sets of conservation rules of thumb: (1) spatial response diversity rules of thumb in an idealistic scenario where you can detect response diversity, and (2) a more realistic scenario where we know little about response diversity and we're left with a choice of how many populations to conserve. We then considered how optimal these strategies were across all possible conservation-prioritization strategies.

### Spatial conservation strategies ###

We evaluated four spatial conservation rules of thumb (Figure \ref{f:curves}). In all spatial scenarios, we conserved four populations and set the unfished equilibrium biomass of the remaining populations to near elimination (five salmon). These reduced populations could therefore still receive straying salmon but were unlikely to re-build on their own to a substantial abundance. The four scenarios were:

1. Conserve an even sampling of response diversity. In other words, conserve alternating subpopulations.
2. Conserve the most stable populations only.
3. Conserve one half of the metapopulation.
4. Conserve the other half of the metapopulation.

### How many populations to conserve? ###

In reality we rarely know precise levels of response diversity. We therefore additionally considered a case where the conservation was randomly assigned with respect to response diversity but where different numbers of streams can be conserved. We considered conserving from two to 16 streams. Similarly to the spatial strategies, we reduced the carrying capacity of the remaining streams to the nominal level of five salmon.

### How optimal are the conservation strategies? ###

To test how optimal the strategies were, we generated metapopulation portfolios in which the investment weights (Ricker $b$ parameters) were randomly assigned such that the total available "investment" remained constant. This Monte-Carlo strategy illustrates a large sample of possible portfolios in risk-return space. We then placed the conservation strategies listed above into this space to determine how close to the efficient frontier they lie. [Figure not shown yet]

<!--## Sensitivity anlyses ##-->

<!--We considered the sensitivity of our results to a variety of parameter values. In Table \ref{t:pars} we describe the base-case values used in the main paper and the alternative values for results shown in the Supporting Material.-->

<!--## Extinction risk-->
<!--How we measured quasi-extinction risk-->
<!--Where we measured it-->
