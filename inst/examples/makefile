all:	pdf

pdf:
	./knit
	./extract_bib.rb salmonport.md > salmonport.bib
	cp ~/Dropbox/tex/jshort.bib .
	pandoc -s -S --bibliography=jshort.bib --bibliography=salmonport.bib --natbib salmonport.md --template=pandoc.latex --latex-engine=xelatex -o salmonport.tex
	latexmk salmonport.tex

bib:
	bibtool -s --preserve.key.case=on -x salmonport.aux -o salmonport-with-abbrevs.bib

clean:
	rm -rf *.log *.bbl *.blg *.out *.toc *.aux *.fdb_latexmk *.fls

clear-cache:
	rm -rf cache/
	rm -rf figure/
