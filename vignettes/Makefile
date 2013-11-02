all: vignette
vignette:
	./knit
	xelatex metafolio.tex
	xelatex metafolio.tex
	rm metafolio.tex
	cp metafolio.pdf ../inst/doc/metafolio.pdf
