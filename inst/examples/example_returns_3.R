#' 

col_pal <- rev(gg_color_hue(3))
n_pop_temp <- 3
set.seed(2)
eg1 <- meta_sim(sigma_v = 0.1, n_pop = n_pop_temp)
set.seed(2)
eg2 <- meta_sim(env_params = list(amplitude = .000000001, ang_frequency = 0.2, 
phase = 0, mean_value = 16), sigma_v = 0.1, n_pop = n_pop_temp)
set.seed(2)
eg3 <- meta_sim(stray_fraction = 0.00001, sigma_v = 0.1, n_pop = n_pop_temp)
set.seed(2)
eg10 <- meta_sim(env_params = list(amplitude = 5.0001, ang_frequency = 0.2, 
phase = 0, mean_value = 16), sigma_v = 0.1, n_pop = n_pop_temp)
set.seed(2)
eg4 <- meta_sim(sigma_v = 0.000001, n_pop = n_pop_temp)
set.seed(2)
eg5 <- meta_sim(sigma_v = 0.15, n_pop = n_pop_temp)
set.seed(2)
eg7 <- meta_sim(max_a = rep(0.9, 10), sigma_v = 0.1, n_pop = n_pop_temp)
set.seed(2)
eg8 <- meta_sim(max_a = rep(1.8, 10), sigma_v = 0.1, n_pop = n_pop_temp)
set.seed(2)
eg9 <- meta_sim(stray_fraction = 0.1, sigma_v = 0.1, n_pop = n_pop_temp)

source("plot_sim_ts_simple.R")
par(mfrow = c(9, 1), mar = c(0,0,0,0), oma = c(4, 4, 1, 1), cex = 0.7, las = 1, xpd = FALSE)
plot_sim_ts_simple(eg1, pal = col_pal, text = "Base case")
plot_sim_ts_simple(eg2, pal = col_pal, text =  "No temperature fluctuations")
plot_sim_ts_simple(eg10, pal = col_pal, text =  "Larger temperature fluctuations")
plot_sim_ts_simple(eg3, pal = col_pal, text = "No straying")
plot_sim_ts_simple(eg9, pal = col_pal, text = "More straying")
plot_sim_ts_simple(eg4, pal = col_pal, text = "No spawner-return variance")
plot_sim_ts_simple(eg5, pal = col_pal, text = "Larger spawner-return variance")
plot_sim_ts_simple(eg7, pal = col_pal, text = "Lower productivity")
plot_sim_ts_simple(eg8, pal = col_pal, text = "Higher productivity")
axis(1, col = "grey50") 
mtext("Generation", side = 1, outer = TRUE, line = 2.0, cex = 0.8)
mtext("Returns", side = 2, outer = TRUE, line = 3.0, cex = 0.8, las = 0)
col_pal <- rev(gg_color_hue(10))



