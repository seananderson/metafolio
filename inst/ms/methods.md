# Methods

## Overview ##

We developed a salmon metapopulation simulation model that includes a 
stock-recruit relationship, demographic stochasticity, straying between 
populations, varying responses to the environment, escapement target setting, 
and implementation uncertainty. Under two kinds of environmental regimes we 
tested different conservation rules of thumb and evaluated these plans in 
risk-return space similar to how financial managers evaluate financial 
portfolios. See Figure \ref{f:sim-flow} for an illustration of the overall 
simulation structure.

## Defining the ecological portfolio ##

In our ecological portfolio, we defined assets as stream-level populations and 
the portfolio as a salmon metapopulation (Table \ref{t:port}). The portfolio 
investors were the stakeholders in the fishery and metapopulation performance. 
For example, we could consider fisheries managers, conservation agencies, or 
first Nations groups as investors. We defined asset value as abundance 
(returns) of stream populations and value of the portfolio as the overall 
metapopulation abundance. In this scenario, the equivalent to financial rate of 
return is the generation-to-generation rate of change of metapopulation 
abundance. We defined the financial asset investment weights as the carrying 
capacity of the stream populations, specifically the unfinished equilibrium 
stock size.

## Salmon metapopulation dynamics ##

The salmon metapopulation dynamics in our simulation were governed by a
spawner-return relationship with stochastic noise and straying between 
populations.

<!---	environmental-tolerance curves that control productivity-->

### Spawner-return relationship ###

We defined the spawner-return relationship with a Ricker model [@Ricker1954],

\begin{equation}
R_{ti} = S_{ti}e^{a_{ti}(1-S_{ti}/b_i) + w_{ti}},
\end{equation}

\noindent where $t$ represents a generation time, $i$ represents a population,
$R$ is the number of returns, $S$ is the number of spawners, $a$ is the
productivity parameter (which can vary with the environment), and $b$
is the density-dependent term (which is used as the asset weights in the
portfolios). The term $w_{ti}$ represents first-order autocorrelated error. 
Formally, $w_{ti} = w_{ti-1} \rho_w + v_{ti}$, where $v_{ti}$ represents
independent and normally distributed error with mean 0 and standard deviation
of $\sigma_v$. The parameter $\rho_w$ represents the correlation between
residuals from subsequent generations.

### Straying ###

We implemented straying as in @Cooper1999. We set up the metapopulation in a 
simple scenario: the populations were arranged in a line and those that were 
nearer to each other were more likely to stray between each other. Two 
parameters controlled the straying: the fraction of fish $f_{\mathrm{stray}}$ 
that stray from their natal stream in any generation and the rate $m$ at which 
this straying between streams decays with distance. We calculated the number of 
salmon straying from stream $j$ to stream $i$ as,

\begin{equation}
  \mathrm{strays}_{tij} = f_{\mathrm{stray}} R_{tj}
    \frac{e^{-m \lvert i-j \rvert }}
      {\displaystyle\sum\limits_{\substack{k = 1 \\
    k \neq j}}^{n} e^{-m \lvert k-j \rvert }},
  \label{eq:stray}
\end{equation}

\noindent
where $R_{tj}$ is the number of returning salmon at generation $t$ whose natal 
stream was stream $j$. The subscript $k$ represents a stream ID and $n$ the 
number of populations. The denominator is a normalizing constant to ensure the 
desired fraction of fish stray. See Figure \ref{f:stray} for an example 
straying matrix. 


## Fishing ##

Our simulation used a simple set of rules to establish escapement targets and 
implement harvesting. Every 5(TODO CAN VARY) years our simulation fitted a 
spawner-return function and target harvest rate $H_{\mathrm{tar}}$ was set 
based on @Hilborn1992 as

\begin{equation}
  H_{\mathrm{tar}} = \frac{A}{b (0.5 - 0.07a)}
  \label{eq:esc}
\end{equation}

\noindent
where $A$ represents the return abundance and $a$ and $b$ represent the Ricker 
model parameters. We included implementation uncertainty in the actual harvest 
rate $H_{\mathrm{act}}$ as
 
\begin{equation}
  H_{\mathrm{act}} = \mathrm{beta}(\alpha_h, \beta_h)
\end{equation}

\noindent
where $\alpha_h$ and $\beta_h$ are the location and shape parameters in a beta 
distribution. They can be calculated from the desired mean $\mu_h$ and standard 
deviation $\sigma_h$ as:
TODO ADD REFERENCES

\begin{align}
  \alpha_h &= \frac{\mu_h^2(1 - \mu_h)}{\sigma_h - 1/\mu_h}\\
   \beta_h &= \frac{\alpha}{\mu_h - 1}.
\end{align}

\noindent
Further, to establish a range of spawner-return values and to mimic the start 
of an open-access fishery, for the first 20 (TODO variable) years we drew the 
fraction of fish harvested randomly from a uniform distribution between 0.1 and 
0.9. TODO CONSIDER BETTER RANGE HERE

## Environmental dynamics ##

We can generally break environmental dynamics down into short-term and 
long-term changes. We evaluated the contribution of the environment to 
metapopulation performance under these two components separately. 

short-term forcing: stationary AR1; long-term forcing: linear increase

## Conservation rules of thumb ##

We evaluated two sets of conservation rules of thumb: (1) spatial response
diversity rules of thumb in an idealistic situation where you can detect
response diversity, and (2) a more realistic scenario where we know little
about response diversity and we're left with a choice of how many populations
to conserve. We then considered how optimal these strategies are across all 
possible conservation-prioritization strategies.

### Spatial conservation strategies ##
We evaluated four spatial conservation rules of thumb (Figure \ref{f:curves}). 
In all scenarios, four populations are conserved and the unfished equilibrium 
biomass of the remaining populations is reduced to near elimination (five 
salmon). These reduced populations can therefore still receive straying salmon 
but are unlikely to re-build on their own to any substantial volume of salmon. 

The four scenarios are:

1. Conserve an even sampling of response diversity. In other words, conserve 
   alternating subpopulations.

2. Conserve the most stable populations only.

3. Conserve one half of the metapopulation.

4. Conserve the other half of the metapopulation.

### How many populations to conserve? ###

In reality we rarely know precise levels of response diversity. We therefore 
additionally considered a case where the conservation is randomly assigned with 
respect to response diversity but where different numbers of streams can be 
conserved. We considered conserving from two to 16 streams. Similarly to the 
spatial strategies, we reduced the carrying capacity of the remaining streams 
to the nominal level of five salmon.

### How optimal are the conservation strategies? ###

To test how optimal the strategies are, we generated metapopulation portfolios 
in which the investment weights (Ricker $b$ parameters) were randomly assigned. 
This Monte-Carlo strategy illustrates a large sample of possible portfolios in 
risk-return space. We then placed the conservation strategies listed above into 
this space to determine how close to the efficient frontier they lie.

<!--## Extinction risk-->
<!--How we measured quasi-extinction risk-->
<!--Where we measured it-->
