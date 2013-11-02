## R package to simulate metapopulations for portfolio optimization

Reusable functions are part of the package in the `R` folder. Current work in development, figures, and writing are in the `inst` folder. 

See `inst/examples/README.R` for the analysis from the paper.

See `inst/ms/ms.md` for the paper itself.

See the vignette in `inst/doc/metafolio.pdf` or by installing the package and running the code as outlined below.

This is ongoing work for a PhD thesis chapter (by Sean Anderson). Until this work is published, please contact Sean (sean "at" seananderson.ca) before using the code in any of your own work that will be published.

The package can be installed and loaded in R by running:

```S
# install.packages("devtools") # if not already installed
library(devtools)
install_github("metafolio", "seananderson", auth_user = "YOUR-USER-NAME", 
  password = "YOUR-PASSWORD", dependencies = TRUE)
library(metafolio)
```

For help see:

```S
help(package = "metafolio")
vignette("metafolio")
```
