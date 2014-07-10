files <- list.files(path = ".", pattern = "Fig[A-Z0-9\\-]*\\.pdf")

for(i in 1:length(files)) {
  message(files[i])
  system(paste("pdftops -eps", files[i]))
}
