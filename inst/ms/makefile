all:	mstex

mstex:
	latexmk anderson-etal-metafolio

ms:
	#extract_bib ms.md > ms.bib
	#extract_bib som.md >> ms.bib
	#cp ~/Dropbox/tex/jshort.bib .
	pandoc -S --no-wrap --bibliography=jshort.bib --bibliography=ms.bib --natbib ms.md -o ms.tex
	pandoc -S som.md --latex-engine=xelatex -o som.tex
	#perl -p -i -e "s/citep/cite/g" ms.tex
	#perl -p -i -e "s/citet/cite/g" ms.tex
	perl -p -i -e "s/Fig. /Fig.~/g" ms.tex
	perl -p -i -e "s/Fig. /Fig.~/g" som.tex
	perl -p -i -e "s/Figs. /Figs.~/g" ms.tex
	perl -p -i -e "s/Figs. /Figs.~/g" som.tex
	pandoc response.md -o response.tex
	#pdflatex anderson-etal-metafolio
	#bibtex anderson-etal-metafolio
	#pdflatex anderson-etal-metafolio
	#pdflatex anderson-etal-metafolio
	latexmk anderson-etal-metafolio
	#rm som.tex
	#cp salmonfolios.pdf ~/Dropbox/Public/
	#./splitpdf.py salmonfolios.pdf 33 # assuming SOM starts at pg 34
	#mv salmonfolios.part1.1_33.pdf anderson-etal-metafolio.pdf
	#mv salmonfolios.part2.34_46.pdf anderson-etal-metafolio-SI.pdf
	#mv salmonfolios.pdf anderson-etal-metafolio.pdf

submit:
	cp ../examples/*.eps .
	extract_bib ms.md > ms.bib
	cp ~/Dropbox/tex/jshort.bib .
	pandoc -S --no-wrap --bibliography=jshort.bib --bibliography=ms.bib --natbib ms.md -o ms.tex
	pandoc -S som.md --latex-engine=xelatex -o som.tex
	perl -p -i -e "s/Fig. /Fig.~/g" ms.tex
	perl -p -i -e "s/Fig. /Fig.~/g" som.tex
	perl -p -i -e "s/Figs. /Figs.~/g" ms.tex
	cp salmonfolios.tex anderson-etal-metafolio.tex
	latex anderson-etal-metafolio
	# first time run all this... then manually fix the refs with numbers and
	# comment out bib line and leave one or two latex lines here
	#bibtex anderson-etal-metafolio
	#latex anderson-etal-metafolio
	#latex anderson-etal-metafolio
	#latex anderson-etal-metafolio
	cp ../doc/metafolio.pdf metafolio-vignette.pdf
	zip to-upload.zip *.eps tables.tex ms.tex som.tex metafolio-vignette.pdf recent-yeakel-etal-inpress.pdf recent-anderson-etal-2013.pdf
	#rm *.eps

bib:
	extract_bib ms.md > ms.bib
	cp ~/Dropbox/tex/jshort.bib .
	pandoc -S --no-wrap --bibliography=jshort.bib --bibliography=ms.bib --natbib ms.md -o ms.tex
	pandoc -S som.md --latex-engine=xelatex -o som.tex
	perl -p -i -e "s/Fig. /Fig.~/g" ms.tex
	perl -p -i -e "s/Fig. /Fig.~/g" som.tex
	perl -p -i -e "s/Figs. /Figs.~/g" ms.tex
	pdflatex salmonfolios
	bibtex salmonfolios
	pdflatex salmonfolios
	pdflatex salmonfolios
	rm som.tex

letter:
	xelatex salmonfolios-letter.tex

rtf:
	latex2rtf -d 0 -b anderson-etal-metafolio.bbl -E0 -M6 anderson-etal-metafolio.tex

docx:
	cp ms.md ms-temp.md
	perl -p -i -e "s/\\\substack{k = 1 \\\\\\\ k \\\neq j}/k = 1, k \\\neq j/g" ms-temp.md
	bibtool jshort.bib ms.bib -- 'expand.macros = ON' > ms2.bib
	pandoc -S --bibliography=ms2.bib --csl=ecology-letters.csl --reference-docx=reference.docx ms-temp.md -o salmonfolios.docx
	rm ms2.bib
	rm ms-temp.md
	#pandoc -S --bibliography=jshort.bib --bibliography=ms.bib --csl=ecology-letters.csl ms-temp.md -o salmonport.docx


#pdf:
	#./knit
	#./extract_bib.rb salmonport.md > salmonport.bib
	#cp ~/Dropbox/tex/jshort.bib .
	#pandoc -s -S --bibliography=jshort.bib --bibliography=salmonport.bib --natbib salmonport.md --template=pandoc.latex --latex-engine=xelatex -o salmonport.tex
	#latexmk salmonport.tex
	

#bib:
	#bibtool -s --preserve.key.case=on -x salmonport.aux -o salmonport-with-abbrevs.bib

clean:
	rm -rf *.log *.bbl *.blg *.out *.toc *.aux *.fdb_latexmk *.fls

notes:
	#extract_bib annotated-bib.md > salm.bib
	#pandoc -S annotated-bib.md --bibliography=/Users/seananderson/Dropbox/tex/jshort.bib --bibliography=/Users/seananderson/Dropbox/tex/ref3.bib --csl=ecology.csl -o annotated-bib.pdf
	pandoc -S annotated-bib.md --bibliography=/Users/seananderson/Dropbox/tex/jshort.bib --bibliography=/Users/seananderson/Dropbox/tex/ref3.bib --natbib -s -o annotated-bib.tex

#clear-cache:
	#rm -rf cache/
	#rm -rf figure/

test:
	pandoc -S --bibliography=refs.bib --csl=ecology-letters.csl test.md test.docx

copyfigs:
	cp ../examples/simulation-diagram3-sansserif-bw.pdf Fig1.pdf
	cp ../examples/thermal-curve-scenarios.pdf Fig2.pdf
	cp ../examples/spatial-arma-sim-full.pdf Fig3.pdf
	cp ../examples/spatial-mv.pdf Fig4.pdf
	cp ../examples/cons-plans-n.pdf Fig5.pdf
	cp ../examples/cons-plans-squeeze.pdf Fig6.pdf

preprint:
	gs \
	-o ~/Dropbox/Public/papers/Anderson_etal_2014_salmon_portfolios.pdf \
  -dDEVICEWIDTHPOINTS=612  \
  -dDEVICEHEIGHTPOINTS=792 \
  -dPDFFitPage \
	-sDEVICE=pdfwrite \
	-dPDFSETTINGS=/prepress \
   anderson-etal-metafolio.pdf \
   appendices/Appendix-A.pdf \
   appendices/Appendix-B.pdf \
   appendices/Appendix-C.pdf \
   appendices/Appendix-D.pdf \
   appendices/Appendix-E.pdf \
   appendices/Appendix-E.tex \
	 ../examples/suppl-1.pdf
	
