% Portfolio management of salmon metapopulations
% Sean Anderson

# Elements to the simulation
## Population dynamics
* Estimate spawner-recruit relationship based on data 
  * Could chose a model that allows for depensation, or not.
  * Could be estimated independently or via multilevel modelling to partially pool inference from across populations.
  * Multilevel modelling may work well given that we will have many populations, but large uncertainty for any one population.
  * Initial carrying capacity comes from model estimate

* Smolt-to-adult survival relationship (estimated from data)
  * Pestes et al. estimated this as $R_t = cO_t^b \exp(g_t), g_t \sim N(0, \sigma^2_g)$, where R_t is abundance of adult recruits at time $t$; $c$ and $b$ are parameters.

* Pre-spawner mortality?

* How limited are salmon by some ESU-level carrying capacity, which I presume would encompass shared resources such as the ocean, drainage basins, and main stem rivers? Can we get away with only population-level carrying capacities?

## Straying
* Fraction of spawners that stray from natal streams (ballpark beta distribution from literature)
* Rate that straying increases with distance (ballpark beta distribution from literature)

## Fishing dynamics
* Harvesting
  1. Basic harvest rules only (as in Pestes et al. 2008)
  2. Basic harvest rules plus portfolio optimization
* Implementation error (deviation between target harvesting and outcome; ballpark beta distribution based on Pestes et al. 2008). Could be ignored for simplicity.

## Environmental stochasticity
* Magnitude and serial correlation of environmental noise
* Asynchrony of response to environmental noise. 

*At what level will environmental conditions influence population dynamics? Probably simplest to pick one level. Perhaps smolt-to-adult survival relationship?*

*Stability-diversity models typically deal with communities of species and include an interspecific competition coefficient. Given that salmon populations compete with each other far less than species sharing a common niche, can we safely assume this is relatively low for salmon and ignore it for simplicity?*

# Defining the portfolio metaphor
## The investors
* The salmon managers

## The assets
* "Distinct" salmon populations

## Asset value
* Population growth rate measured as first difference of returns. (I believe this would be simplest.)
* Could be productivity measured as residuals from the spawner-recruit relationship. I'm unsure how this would play out since I imagine we'd be assuming the spawner-recruit relationship itself remains fixed.

## Portfolio optimization goal 
* Maximize "returns" for a given level of acceptable "risk". I.e. move towards a point on the efficient frontier based on risk tolerance
* Perhaps split into low-, medium-, and high-risk tolerance or base the level of risk tolerance on a specified mandate

## How we would re-allocate asset investment
* Increase investment (increase K~i~) by decreasing harvesting or habitat restoration?
* If we allow decreased investment (ramping up catch) then constraints are likely necessary to avoid population extirpation 

*Depending on density, strength of density dependence, and how "value" is measured these could increase or decrease "value".*

# Questions to examine
1. Do 
