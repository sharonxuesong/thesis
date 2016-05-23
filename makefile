FILE = thesis
REF = references
TEX = latex
BIBTEX = bibtex
DVIPDF = dvipdf

.PHONY: all clean public

all: $(FILE).dvi $(FILE).pdf

$(FILE).dvi : $(FILE).tex makefile $(REF).bib psuthesis.cls *.tex
	$(TEX) $(FILE)
	$(BIBTEX) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)

$(FILE).pdf : $(FILE).dvi
	$(DVIPDF) $(FILE).dvi
	open $(FILE).pdf &

clean :
#	\rm *Notes.bib
	\rm *.aux
	\rm *.log
	\rm *.dvi
	\rm *.lof
	\rm *.lot
	\rm *.toc
	\rm *.bbl
	\rm *.blg
#	\rm *.out

public:
	\cp $(FILE).pdf ~/Dropbox/Public/$(FILE).pdf
