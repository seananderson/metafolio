# All steps to re-create the figures

# Set your R working directory to this folder (the examples folder)

# install and load the package or run:
# devtools::load_all("../../")

col_pal <- rev(gg_color_hue(10))

# Figure show different number rules of thumb:
source("cons_plans_n_random_resp_div.R")

# Figure show different spatial rules of thumb:
source("cons_plans2.R")

# Figure showing thermal curves for spatial scenarios
source("plot_thermal_curves_scenarios.R")

# Supp Figures:
source("plot_straying_matrix.R")
source("plot_thermal_curves.R")
source("example_returns_3.R")
