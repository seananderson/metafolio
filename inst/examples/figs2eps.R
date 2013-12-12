f <- list.files(pattern = "*.pdf")
# these have transparency, need to use AI
f <- f[-which(f == "spatial-mv.pdf")]
f <- f[-which(f == "plot-various-options-ts-3pops.pdf")]
f <- f[-which(f == "cons-plans-n.pdf")]
for(i in 1:length(f)) {
  system(paste0("pdftops -eps ", f[i]))
}

