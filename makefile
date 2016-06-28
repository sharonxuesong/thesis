FILE = thesis
REF = references
TEX = latex
BIBTEX = bibtex
DVIPDF = dvipdf

.PHONY: all clean public pdf ps

all: $(FILE).dvi 

$(FILE).dvi : $(FILE).tex makefile $(REF).bib psuthesis.cls *.tex
	$(TEX) $(FILE)
	$(BIBTEX) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)

pdf: $(FILE).pdf
$(FILE).pdf: $(FILE).dvi
	$(DVIPDF) $(FILE).dvi
	open $(FILE).pdf &

ps: $(FILE).ps
$(FILE).ps: $(FILE).dvi
	dvips $(FILE).dvi
	gv $(FILE).ps &

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
	\rm $(FILE).ps
#	\rm *.out

public:
	\cp $(FILE).pdf ~/Dropbox/Public/$(FILE).pdf
