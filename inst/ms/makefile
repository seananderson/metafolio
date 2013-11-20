all:	ms

ms:
	extract_bib ms.md > ms.bib
	cp ~/Dropbox/tex/jshort.bib .
	pandoc -S --no-wrap --bibliography=jshort.bib --bibliography=ms.bib --natbib ms.md -o ms.tex
	pandoc -S som.md --latex-engine=xelatex -o som.tex
	perl -p -i -e "s/Fig. /Fig.~/g" ms.tex
	perl -p -i -e "s/Fig. /Fig.~/g" som.tex
	xelatex salmonfolios
	rm som.tex

bib:
	extract_bib ms.md > ms.bib
	cp ~/Dropbox/tex/jshort.bib .
	pandoc -S --no-wrap --bibliography=jshort.bib --bibliography=ms.bib --natbib ms.md -o ms.tex
	pandoc -S som.md --latex-engine=xelatex -o som.tex
	perl -p -i -e "s/Fig. /Fig.~/g" ms.tex
	perl -p -i -e "s/Fig. /Fig.~/g" som.tex
	xelatex salmonfolios
	rm som.tex
	xelatex salmonfolios
	bibtex salmonfolios
	xelatex salmonfolios
	xelatex salmonfolios

rtf:
	latex2rtf -d 0 -b ms.bbl -E0 -M6 salmonfolios.tex

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
