all:
	echo Making book chapter 
	mkdir -p chapter
	pandoc chapter.md --biblio bib/refs.bib --csl csl/chicago-author-date.csl --toc -N --mathjax -s -o ./chapter/chapter.html
	pandoc chapter.md --biblio bib/refs.bib --csl csl/chicago-author-date.csl --biblatex -N -s -S -H chapterHeader.tex -o ./chapter/chapter.tex 
	pandoc chapter.md --biblio bib/refs.bib --csl csl/chicago-author-date.csl -N -H chapterHeader.tex -o ./chapter/chapter.pdf
	
	: <<'END'
	# Make pdf with latex
	cp -r images chapter
	cd chapter
	latex chapter.tex
	pdflatex chapter
	cd ..
	
	
	pandoc test.txt --biblatex --biblio test.bib --csl chicago-author-date.csl -o ./test/test.pdf
	pandoc --biblatex -s -S test.txt  --bibliography=test.bib --csl chicago-author-date.csl -o ./test/test.tex
	cp test.bib test/test.bib
	cd test
	latex test.tex
	bibtex test
	latex test.tex
	pdflatex test
	cd ..
	END

tex:
	mkdir -p chapter
	pandoc chapter.md --biblio bib/refs.bib --csl csl/chicago-author-date.csl --biblatex -N -s -S -H chapterHeader.tex -o ./chapter/chapter.tex 

pdf:
	echo Copying over bib files and images
	cp -r images ./chapter/
	cp -r bib ./chapter/
	cd chapter
	latex chapter
	bibtex chapter
	latex chapter
	pdflatex chapter
