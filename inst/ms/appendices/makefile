all: copyfigs pdf2eps pdf

copyfigs:
	cp ../../examples/spatial-arma-sim-full-colour.pdf Fig-F1.pdf
	cp ../../examples/spatial-arma-sim-onehalf.pdf Fig-F2.pdf
	cp ../../examples/spatial-linear-sim-full.pdf Fig-F3.pdf
	cp ../../examples/spatial-linear-sim-onehalf.pdf Fig-F4.pdf
	cp ../../examples/n-arma-sim-2.pdf Fig-F5.pdf
	cp ../../examples/n-arma-sim-16.pdf Fig-F6.pdf
	cp ../../examples/n-linear-sim-2.pdf Fig-F7.pdf
	cp ../../examples/n-linear-sim-16.pdf Fig-F8.pdf
	cp ../../examples/n-linear-arma-sim-2-squeeze.pdf Fig-F9.pdf
	cp ../../examples/n-linear-arma-sim-16-squeeze.pdf Fig-F10.pdf
	cp ../../examples/example-return-correlations.pdf Fig-E1.pdf
	cp ../../examples/plot-various-options-ts-3pops.pdf Fig-D1.pdf
	cp ../../examples/stray-matrix.pdf Fig-C1.pdf
 
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
	#bibtex Appendix-B
	latex Appendix-B
	latex Appendix-C
	latex Appendix-D
	latex Appendix-E
	latex Appendix-F
	# dvi to pdf:
	dvipdfm Appendix-A
	dvipdfm Appendix-B
	dvipdfm Appendix-B
	dvipdfm Appendix-C
	dvipdfm Appendix-D
	dvipdfm Appendix-E
	dvipdfm Appendix-F
	rm *\.aux
	rm *\.dvi
	rm *\.log
