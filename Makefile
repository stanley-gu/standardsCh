all:
	echo Making book chapter 
	mkdir -p chapter
	pandoc chapter.md --biblio bib/refs.bib --csl csl/chicago-author-date.csl --toc -N --mathjax -s -o ./chapter/chapter.html
	pandoc chapter.md --biblio bib/refs.bib --csl csl/chicago-author-date.csl --biblatex -N -s -S -H chapterHeader.tex -o ./chapter/chapter.tex 
	pandoc chapter.md --biblio bib/refs.bib --csl csl/chicago-author-date.csl -N -H chapterHeader.tex -o ./chapter/chapter.pdf

pandoctex:
	mkdir -p chapter
	pandoc chapter.md --biblio bib/refs.bib --csl csl/chicago-author-date.csl --biblatex -N -s -S -H chapterHeader.tex -o ./chapter/chapter.tex 

tex: pandoctex
	cp -r images ./chapter/
	cp -r bib ./chapter/
	-latex --output-directory=chapter chapter/chapter.tex

bibtex: tex
	-bibtex chapter/chapter

pdf: bibtex
	-latex --output-directory=chapter chapter/chapter
	-pdflatex --output-directory=chapter chapter/chapter

clean:
	rm -r chapter
