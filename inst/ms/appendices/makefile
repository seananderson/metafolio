all: copyfigs pdf2eps pdf

copyfigs:
	cp ../../examples/stray-matrix.pdf Fig-A1.pdf
	cp ../../examples/plot-various-options-ts-3pops.pdf Fig-C1.pdf
	cp ../../examples/spatial-arma-sim-full-colour.pdf Fig-D1.pdf
	cp ../../examples/spatial-arma-sim-onehalf.pdf Fig-D2.pdf
	cp ../../examples/spatial-linear-sim-full.pdf Fig-D3.pdf
	cp ../../examples/spatial-linear-sim-onehalf.pdf Fig-D4.pdf
	cp ../../examples/n-arma-sim-2.pdf Fig-D5.pdf
	cp ../../examples/n-arma-sim-16.pdf Fig-D6.pdf
	cp ../../examples/n-linear-sim-2.pdf Fig-D7.pdf
	cp ../../examples/n-linear-sim-16.pdf Fig-D8.pdf
	cp ../../examples/n-linear-arma-sim-2-squeeze.pdf Fig-D9.pdf
	cp ../../examples/n-linear-arma-sim-16-squeeze.pdf Fig-D10.pdf
	cp ../../examples/example-return-correlations.pdf Fig-E1.pdf
 
pdf2png:
	Rscript -e "source('pdf2png.R')"
	perl -p -i -e "s/\.pdf/.png/g" risksupp.tex
	rm Fig-*\.pdf

pdf2eps:
	Rscript -e "source('pdf2eps.R')"
	rm Fig-*\.pdf

pdf:
	latex Appendix-A
	latex Appendix-B
	latex Appendix-B
	latex Appendix-B
	latex Appendix-B
	latex Appendix-C
	latex Appendix-D
	latex Appendix-E
	# dvi to pdf:
	dvipdfm Appendix-A
	dvipdfm Appendix-B
	dvipdfm Appendix-B
	dvipdfm Appendix-C
	dvipdfm Appendix-D
	dvipdfm Appendix-E
	rm *\.aux
	rm *\.dvi
	rm *\.log
