.PHONY:clean

main.pdf: main.tex
	xelatex main.tex
	bibtex main.aux
	xelatex main.tex
	xelatex main.tex
	ls | grep main | grep -v main.tex | grep -v main.pdf | xargs rm
	rm missfont.log main.tex.bak
	rm ./chapter/*.aux
