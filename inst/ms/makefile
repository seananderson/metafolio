all:	ms

ms:
	pandoc abstract.md introduction.md methods.md results.md discussion.md figs.md -o ms.md
	extract_bib ms.md > ms.bib
	extract_bib som.md > som.bib
	cp ~/Dropbox/tex/jshort.bib .
	pandoc -S --bibliography=jshort.bib --bibliography=ms.bib --natbib ms.md --latex-engine=xelatex -o ms.tex
	pandoc -S --bibliography=jshort.bib --bibliography=som.bib --natbib som.md --latex-engine=xelatex -o som.tex
	latexmk salmonfolios

rtf:
	latex2rtf -d 0 -b ms.bbl -E0 -M6 salmonfolios.tex

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

#clear-cache:
	#rm -rf cache/
	#rm -rf figure/
