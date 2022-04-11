## R package to simulate metapopulations for portfolio optimization

<!-- badges: start -->
[![R-CMD-check](https://github.com/seananderson/metafolio/workflows/R-CMD-check/badge.svg)](https://github.com/seananderson/metafolio/actions)
<!-- badges: end -->

The metafolio R package accompanies the paper: 

Anderson, S.C., J.W. Moore, M.M. McClure, N.K. Dulvy, A.B. Cooper. 2015. Portfolio conservation of metapopulations under climate change. Ecological Applications. 25(2): 559–572. <doi:10.1890/14-0266.1>.

See `inst/examples/README.R` for the analysis from the paper.

See `inst/ms/ms.md` for the paper itself.

The package can be installed from CRAN with:

```
install.packages("metafolio")
```

If you have the [necessary package development prerequisites](https://support.rstudio.com/hc/en-us/articles/200486498) installed, you can install the development version from GitHub with:

```r
# install.packages("remotes")
remotes::install_github("seananderson/metafolio")
```

For help see:

```r
library(metafolio)
?metafolio
vignette("metafolio")
help(package = "metafolio")
```
