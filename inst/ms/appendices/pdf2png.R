files <- list.files(path = ".", pattern = "Fig[A-Z0-9\\-]*\\.pdf")
files_png <- sub("\\.pdf", ".png", files)

for(i in 1:length(files)) {
  message(files_png[i])
  system(paste("convert -density 120 -quality 100 -trim",
      files[i], files_png[i]))
}
