#'

#col_pal <- rev(gg_color_hue(3))
#n_pop_temp <- 3
#set.seed(2)
#eg1 <- meta_sim(sigma_v = 0.1, n_pop = n_pop_temp)
#set.seed(2)
#eg2 <- meta_sim(env_params = list(amplitude = .000000001, ang_frequency = 0.2, phase = 0, mean_value = 16, slope = 0, sigma_env = 0), sigma_v = 0.1, n_pop = n_pop_temp)
#set.seed(2)
#eg3 <- meta_sim(stray_fraction = 0.00001, sigma_v = 0.1, n_pop = n_pop_temp)
#set.seed(2)
#eg10 <- meta_sim(env_params = list(amplitude = 5.0001, ang_frequency = 0.2, phase = 0, mean_value = 16, slope = 0, sigma_env = 0), sigma_v = 0.1, n_pop = n_pop_temp)
#set.seed(2)
#eg4 <- meta_sim(sigma_v = 0.000001, n_pop = n_pop_temp)
#set.seed(2)
#eg5 <- meta_sim(sigma_v = 0.15, n_pop = n_pop_temp)
#set.seed(2)
#eg7 <- meta_sim(max_a = rep(0.9, 10), sigma_v = 0.1, n_pop = n_pop_temp)
#set.seed(2)
#eg8 <- meta_sim(max_a = rep(3.0, 10), sigma_v = 0.1, n_pop = n_pop_temp)
#set.seed(2)
#eg9 <- meta_sim(stray_fraction = 0.1, sigma_v = 0.1, n_pop = n_pop_temp)

#source("plot_sim_ts_simple.R")
#par(mfrow = c(9, 1), mar = c(0,0,0,0), oma = c(4, 4, 1, 1), cex = 0.7, las = 1, xpd = FALSE)
#plot_sim_ts_simple(eg1, pal = col_pal, text = "Base case")
#plot_sim_ts_simple(eg2, pal = col_pal, text =  "No temperature fluctuations")
#plot_sim_ts_simple(eg10, pal = col_pal, text =  "Larger temperature fluctuations")
#plot_sim_ts_simple(eg3, pal = col_pal, text = "No straying")
#plot_sim_ts_simple(eg9, pal = col_pal, text = "More straying")
#plot_sim_ts_simple(eg4, pal = col_pal, text = "No spawner-return variance")
#plot_sim_ts_simple(eg5, pal = col_pal, text = "Larger spawner-return variance")
#plot_sim_ts_simple(eg7, pal = col_pal, text = "Lower productivity")
#plot_sim_ts_simple(eg8, pal = col_pal, text = "Higher productivity")
#axis(1, col = "grey50")
#mtext("Generation", side = 1, outer = TRUE, line = 2.0, cex = 0.8)
#mtext("Returns", side = 2, outer = TRUE, line = 3.0, cex = 0.8, las = 0)

#col_pal <- rev(gg_color_hue(10))


pdf_eps("plot-various-options-ts-3pops", width = 4, height = 6.4, type = TYPE)

eg <- list()
ex <- list()

n_pop <- 4
col_pal <- rev(gg_color_hue(n_pop-1))

set.seed(2)
eg[["Base case"]] <- meta_sim(
  n_pop       = n_pop,
  env_params  = arma_env_params,
  env_type    = "arma",
  assess_freq = 5
  )
ex[["base"]] <- expression("Base case, see main text or Table S1 for parameter values")

set.seed(2)
eg[["No temperature fluctuations"]] <- meta_sim(
  n_pop       = n_pop,
  env_params  = list(mean_value = 16, ar = 0.1, sigma_env = 0.000001, ma = 0),
  env_type    = "arma",
  assess_freq = 5
  )
ex[["No temperature fluctuations"]] <- expression(No~temperature~fluctuations~sigma[d]==0)

set.seed(2)
eg[["Larger temperature fluctuations"]] <- meta_sim(
  n_pop       = n_pop,
  env_params  = list(mean_value = 16, ar = 0.1, sigma_env = 4, ma = 0),
  env_type    = "arma",
  assess_freq = 5
  )
ex[["Larger temperature fluctuations"]] <- expression(Larger~temperature~fluctuations~sigma[d]==4)

set.seed(2)
eg[["No straying"]] <- meta_sim(
  n_pop       = n_pop,
  env_params  = arma_env_params,
  env_type    = "arma",
  assess_freq = 5,
  stray_fraction = 0.000001
  )
ex[["No straying"]] <- expression(No~straying~f[stray]==0)

set.seed(2)
eg[["More straying"]] <- meta_sim(
  n_pop       = n_pop,
  env_params  = arma_env_params,
  env_type    = "arma",
  assess_freq = 5,
  stray_fraction = 0.1
  )
ex[["More straying"]] <- expression(More~straying~f[stray]==0.1)

set.seed(2)
eg[["No spawner-return variability"]] <- meta_sim(
  n_pop       = n_pop,
  env_params  = arma_env_params,
  env_type    = "arma",
  assess_freq = 5,
  sigma_v = 0.000000001
  )
ex[["No spawner-return variability"]] <- expression(No~recruitment~variability~sigma[r]==0)

set.seed(2)
eg[["Larger spawner-return variability"]] <- meta_sim(
  n_pop       = n_pop,
  env_params  = arma_env_params,
  env_type    = "arma",
  assess_freq = 5,
  sigma_v = 0.7
  )
ex[["Larger spawner-return variability"]] <- expression(Larger~recruitment~variability~sigma[r]==0.7)

set.seed(2)
eg[["No implementation error"]] <- meta_sim(
  n_pop       = n_pop,
  env_params  = arma_env_params,
  env_type    = "arma",
  assess_freq = 5,
  sigma_impl = 0.0000001
  )
ex[["No implementation error"]] <- expression(No~implementation~error~sigma[h]==0)

set.seed(2)
eg[["Larger implementation error"]] <- meta_sim(
  n_pop       = n_pop,
  env_params  = arma_env_params,
  env_type    = "arma",
  assess_freq = 5,
  sigma_impl = 0.10
  )
ex[["Larger implementation error"]] <- expression(Larger~implementation~error~sigma[h]==0.1)

bg.plot <- function(colour = "#00000019") rect(par("usr")[1],
  par("usr")[3], par("usr")[2], par("usr")[4], col = colour, border =
  FALSE)

source("plot_sim_ts_simple.R")
par(mfrow = c(length(eg), 1), mar = c(0,0,0,0), oma = c(4, 2.5, 1, 1), cex = 0.7, las = 1, xpd = FALSE)
for(i in 1:length(eg)) {
  plot_sim_ts_simple(eg[[i]], text = ex[[i]], pal = col_pal)
  if(i == 1) bg.plot()
}
axis(1, col = "grey50", tck = -0.05, padj = -1)
mtext("Generation", side = 1, outer = TRUE, line = 1.8, cex = 0.75)
mtext("Metapopulation return abundance", side = 2, outer = TRUE, line = 1, cex = 0.75, las = 0)

dev.off()

