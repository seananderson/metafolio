all:	pdf

pdf:
	./knit
	./extract_bib.rb salmonport.md > salmonport.bib
	cp ~/Dropbox/tex/jshort.bib .
	pandoc -s -S --bibliography=jshort.bib --bibliography=salmonport.bib --natbib salmonport.md --template=pandoc.latex --latex-engine=xelatex -o salmonport.tex
	latexmk salmonport.tex
	
ms:
	./extract_bib.rb salmportms.md > salmportms.bib
	cp ~/Dropbox/tex/jshort.bib .
	pandoc -S --bibliography=jshort.bib --bibliography=salmportms.bib --natbib salmportms.md --latex-engine=xelatex -o salmportms.tex

bib:
	bibtool -s --preserve.key.case=on -x salmonport.aux -o salmonport-with-abbrevs.bib

clean:
	rm -rf *.log *.bbl *.blg *.out *.toc *.aux *.fdb_latexmk *.fls

clear-cache:
	rm -rf cache/
	rm -rf figure/
