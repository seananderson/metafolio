% Portfolio prioritization of salmon conservation
% 
%

*Other title ideas:*

- Portfolio optimization reveals... 


- something more general with animals instead of just salmon? 

- Portfolio theory reveals conservation strategies that...

- Intelligent tinkering with ecological portfolios: patterns of environmental 
  response diversity drive salmon conservation priorities

- Keeping every cog and wheel...

  <!--see Table A1 in "Viable Salmonid Populations and the Recovery of 
  Evolutionarily Significant Units":-->
  <!--straying rates from the literature for Pacific salmon. range from 0 to 
  90... usually fularound 4 or 5-->


# Abstract #
1. Managing risk is fundamental to the conservation of an endangered species. 
   When an endangered species exists as a metapopulation, we can manage risk at 
   two levels: at the population level or at the metapopulation level. Whereas 
   risk is typically managed at the population level, a portfolio approach to 
   managing risk might consider how conservation affects the "weight" of each 
   population in a metapopulation "portfolio".

2. Here, we ask how a portfolio approach to managing risk can inform the 
   spatial conservation of metapopulations in a changing world. To answer this, 
   we develop a salmon metapopulation simulation in which population-specific 
   productivity is driven by spatially-distributed environmental tolerance and 
   patterns of short- and long-term environmental change. We then implement 
   different spatial conservation "rules of thumb" that control the 
   population-specific carrying capacities and evaluate the salmon portfolios 
   along risk and return axes, similarly to how financial portfolios are 
   assessed.

3. Our results show, first, that maintaining populations with a variety of 
   environmental tolerances gives the best chance at an efficient ecological 
   portfolio --- minimizing metapopulation variance while maximizing 
   metapopulation growth rate. This finding emphasizes the risk of allowing 
   large spatial blocks of habitat destruction, say through the development of 
   dams. Second, we show that focusing on well-performing stocks now at the 
   detriment of others is at best equivalent to a risky but efficient portfolio 
   and is more likely a risky and inefficient portfolio --- it neither 
   minimizes metapopulation variance nor maximizes growth rate compared to 
   other strategies. Third, we show that maintaining more populations reduces 
   metapopulation risk for the same spatial conservation strategy. Given a lack 
   of knowledge of how populations respond to the environment, the most 
   risk-averse approach is to conserve as many populations as possible. 

4. Our findings highlight three key points: (1) the conservation priority of 
   maintaining biocomplexity and therefore environmental response diversity, 
   (2) the research priority of identifying differences in environmental 
   tolerance given predicted environmental changes, and (3) the utility of 
   considering risk for groups of fish stocks --- especially given 
   environmental, biological, and implementation uncertainty --- through the 
   lens of portfolio theory.


# Introduction #

Managing risk fundamental to conservation of metapopulations

Portfolios provide another way of managing risk - explain mean-variance 
optimization and how this translates to ecology
[@Figge2004]
[@Hoekstra2012] 
[@Ando2011,@Ando2012] 
[@Markowitz1952,@Markowitz1959]



We use salmon as an example, describe the components of the example, provide 
references on metapopulation existence
[@Schindler2010]


Research questions, and briefly our approach - Monte Carlo simulation 
modelling, as simple a model as possible while retaining important realistic 
aspects of salmon metapopulations



# Methods #

## Simulation model components

general overview

See Figure \ref{f:sim-flow} for an illustration of the simulation structure.

## Salmon metapopulation dynamics ##

We are using a Ricker curve,

\begin{equation}
R_{ti} = S_{ti}e^{a_{ti}(1-S_{ti}/b_i) + w_{ti}},
\end{equation}

\noindent
where $t$ represents a generation time, $i$ represents a population, $R$ is the 
number of returns, $S$ is the number of spawners, $a$ is the productivity 
parameter (which can vary with the environmental signal), and $b$ is the 
density-dependent term (which is used as the asset weights in the portfolios). 
The term $w_{ti}$ represents first-order autocorrelated error (AR1). Formally, 
$w_{ti} = w_{ti-1} \rho_w + v_{ti}$, where $v_{ti}$ represents independent and 
normally distributed error with mean 0 and standard deviation of $\sigma_v$. 
The parameter $\rho_w$ represents the correlation between residuals from 
subsequent generations.

We implemented straying as in @Cooper1999. We generate a matrix that represents 
the fraction of straying between any two populations. We set up the 
metapopulation (thus far) in a simple scenario: the populations are arranged in 
a line and those that are nearer to each other are more likely to stray between 
each other [insert caveats]. Two parameters control the straying: the fraction 
of fish $f_{stray}$ that stray from their natal stream in any generation and 
the rate at which this straying between streams decays with distance $m$. We 
calculated the number of salmon straying from stream $j$ to stream $i$ as,

\begin{equation}
  \mathrm{strays}_{tij} = f_{stray} R_{tj}
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

## Environmental dynamics ##

## Environmental response diversity ##
Scenarios? More variable are also more productive?... 

## Portfolio optimization ##

## Conservation rules of thumb ##

# Results #

Fig. \ref{f:eg-n-linear}

Fig. \ref{f:eg-n-arma}

Fig. \ref{f:eg-sp-arma}

Fig. \ref{f:eg-sp-linear}

## Base case ##

## Effect of X on ... ##

## Effect of Y on ... ##

# Discussion #

# Acknowledgements #

# References #

\bibliographystyle{apalike}
\bibliography{jshort,ms}

\clearpage

# Tables #

\begin{table}[h!]
\centering
\small
\caption{Components of salmon metapopulation portfolios}
\begin{tabular}{p{3.6cm}p{7.5cm}}
\toprule
Component          & Definition for the salmon portfolio\\
\midrule
Assets             & Stream-level salmon populations; possibly a Viable Salmonid Population\\
Portfolio          & The salmon metapopulation; possibly an Evolutionarily Significant Unit\\
Portfolio managers & Salmon managers\\
Investors          & Salmon managers, conservation agency, or salmon fishers\\
Asset weights      & Carrying capacity (specifically the $b$ parameter in a Ricker model)\\
Asset returns      & Rate of change of generation-to-generation salmon metapopulation abundance\\
Asset risk         & Variance of generation-to-generation salmon metapopulation abundance\\
\bottomrule
\end{tabular}
\label{tab:port-components}
\end{table}

\clearpage

\begin{table}[h!]
\centering
\small
\caption{Salmon metapopulation parameters with base case and alternate values.}
\begin{tabular}{p{7.0cm}p{1.6cm}p{3.2cm}}
\toprule
Description                                                      & Parameter       & Base [lower, upper] \\
\midrule
Stock-recruit residual standard deviation (on log scale)         & $\sigma_v$      & 0.30 [0.05, 0.50] \\
First order (AR1) serial correlation of stock-recruit residuals  & $\rho_w$        & 0.40 [0, 0.80] \\
Fraction of fish that stray from natal streams                   & $f_{stray}$     & 0.02 [0, 0.10] \\
Exponential rate of decay of straying with distance              & $m$             & 0.3 [0.05, 0.5] \\
Standard deviation of beta distribution for implementation error & $\sigma_{impl}$ & 0.05 [0, 0.20] \\
Frequency of assessment (years)                                  & $f_{assess}$    & 20 [5, 50] \\
\bottomrule
\end{tabular}
\label{tab:salm-pars}
\end{table}
\clearpage

# Figures #

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

\begin{figure}[htbp]
\centering
\includegraphics[height=5.5in]{../examples/simulation-diagram2.pdf}
\caption{Flow chart of the salmon-metapopulation simulation. There are $n$ 
salmon populations and $t$ generations. Blue text indicates values that are 
generated before the simulation progresses through time. Red text indicates 
steps in which calculations are performed. Black text indicates values that are 
calculated. Grey text indicates parameters that can be set. Green text 
indicates the looping structure of the simulation.}
\label{f:sim-flow}
\end{figure}
`
\begin{figure}[htbp]
\centering
\includegraphics[width=4.0in]{../examples/spatial-arma-sim.pdf}
\caption{The components of an example metapopulation simulation.  We show, from 
top to bottom, the environmental signal, the resulting productivity parameter 
(Ricker $a$), the salmon returns, fisheries catch, salmon escapement, salmon 
straying from their natal streams, salmon joining from other streams, 
stock-recruit residuals on a log scale, and the estimated $a$ and $b$ 
parameters in the fitted Ricker curve. The colored lines indicate populations 
that thrive at low (cool colours) to high (warm colours) environmental values.}
\label{f:sp-eg}
\end{figure}

\begin{figure}[htbp]
\centering
\includegraphics[width=3.0in]{../examples/thermal-curve-scenarios.pdf}
\caption{Different ways of prioritizing response-diversity conservation. The 
coloured lines represent environmental-tolerance curves for conserved 
populations. The colours identify populations that thrive at low (cool colours) 
to high (warm colours).}
\label{f:curves}
\end{figure}

\begin{figure}[htbp]
\centering
\includegraphics[width=5.0in]{../examples/spatial-mv.pdf}
\caption{The importance of preserving environmental response diversity through 
spatial conservation strategies. The conservation strategies correspond to 
Fig.~\ref{f:curves} and represent conserving a range of responses (green), the 
most stable populations only (orange), or one type of environmental response 
(purple and pink).  In risk-return space we show environmental scenarios that 
are comprised primarily of (a) short-term and (b) long-term environmental 
fluctuations (see Fig.~X). The dots show simulated metapopulations and the 
contours show 25\% and 75\% quantiles across 500 simulations per strategy. We 
also show example metapopulation abundance time series for the (c, e) 
short-term and (d, f) long-term  environmental-fluctuation scenarios.}
\label{f:sp-mv}
\end{figure}

\begin{figure}[htbp]
\centering
\includegraphics[width=5.0in]{../examples/cons-plans-n.pdf}
\caption{The importance of preserving as many salmon populations as possible 
when we don't know how response diversity is distributed. In risk-return space 
we show environmental scenarios that are comprised primarily of (a) short-term 
and (b) long-term environmental fluctuations (see Fig.~X). We show 
metapopulations in which 2 (red), 4 (orange), 8 (yellow), or 16 (green) 
populations of random response diversity are conserved. The dots show simulated 
metapopulations and the contours show 25\% and 75\% quantiles across 500 
simulations per strategy. We also show example metapopulation (c) 
rate-of-change and (d) abundance time series for the short-term 
environmental-fluctuation scenario.}
\label{f:n-mv}
\end{figure}

