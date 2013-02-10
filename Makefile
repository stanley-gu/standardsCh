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
	-cd chapter; latex chapter

bibtex: tex
	-cd chapter; bibtex chapter; latex chapter

pdf: bibtex
	-cd chapter; pdflatex -shell-escape chapter

clean:
	rm -r chapter
