LATEX = pdflatex -output-format=dvi '\newif\ifmagazine\magazinefalse\input'
#PDFLATEX = pdflatex 
#'\usepackage{comment}\includecomment{myspecial}'

PDFLATEX = pdflatex '\newif\ifdraft\drafttrue\input'
PDFLATEXFINAL = pdflatex '\newif\ifdraft\draftfalse\input'
PDFVIEW = evince
BIBTEX = bibtex
L2H = latex2html
DVIPS = dvips
LATEX2RTF = latex2rtf
LANG = en
SPELLCHECKER = aspell
RERUN = "(There were undefined references|Rerun to get (cross-references|the bars) right)"
RERUNBIB = "No file.*\.bbl|Citation.*undefined"

GOAL = main
MAIN = $(GOAL).tex

GOALS = $(GOAL).ps $(GOAL).pdf $(GOAL).dvi $(GOAL).rtf
DVIFILES = $(GOAL).dvi

#IMAGES = `ls images/*ps images/*pdf `

RM = /bin/rm -f

draft:  *.tex
				$(PDFLATEX)  $(MAIN)

main:   %.pdf
				
final:  PDFLATEX = $(PDFLATEXFINAL)
final:  %.pdf

#magazine:		*.tex
#				$(PDFLATEXMAGAZINE)  $(MAIN)
#				$(BIBTEX) $(GOAL)
#				egrep -c $(RERUNBIB) $*.log && ($(BIBTEX) $*;$(PDFLATEXMAGAZINE) $(MAIN)) ; true
#				egrep $(RERUN) $*.log && ($(PDFLATEXMAGAZINE) $(MAIN)) ; true
#				egrep $(RERUN) $*.log && ($(PDFLATEXMAGAZINE) $(MAIN)) ; true
#				if cmp -s $*.toc $*.toc.bak; then echo ;else $(PDFLATEXMAGAZINE) $(MAIN) ; fi
#				$(RM) $*.toc.bak
## Display relevant warnings
#				egrep -i "(Reference|Citation).*undefined" $*.log ; true

%.pdf:			*.tex
				$(PDFLATEX) $(MAIN)
				$(BIBTEX) $(GOAL)
				egrep -c $(RERUNBIB) $*.log && ($(BIBTEX) $*;$(PDFLATEX) $(MAIN)) ; true
				egrep $(RERUN) $*.log && ($(PDFLATEX) $(MAIN)) ; true
				egrep $(RERUN) $*.log && ($(PDFLATEX) $(MAIN)) ; true
				if cmp -s $*.toc $*.toc.bak; then echo ;else $(PDFLATEX) $(MAIN) ; fi
				$(RM) $*.toc.bak
# Display relevant warnings
				egrep -i "(Reference|Citation).*undefined" $*.log ; true

%.rtf:			*.tex
				$(LATEX) $(MAIN) 
				$(LATEX2RTF) $(MAIN)
				$(BIBTEX) $(GOAL)
				egrep -c $(RERUNBIB) $*.log && ($(BIBTEX) $*;$(LATEX2RTF) $(MAIN)) ; true
				egrep $(RERUN) $*.log && ($(LATEX2RTF) $(MAIN)) ; true
				egrep $(RERUN) $*.log && ($(LATEX2RTF) $(MAIN)) ; true
				if cmp -s $*.toc $*.toc.bak; then echo ;else $(LATEX2RTF) $(MAIN) ; fi
				$(RM) $*.toc.bak
# Display relevant warnings
				egrep -i "(Reference|Citation).*undefined" $*.log ; true




%.dvi:          *.tex
				$(LATEX) $(MAIN)
				$(BIBTEX) $(GOAL)
				egrep -c $(RERUNBIB) $*.log && ($(BIBTEX) $*;$(LATEX) $(MAIN)) ; true
				egrep $(RERUN) $*.log && ($(LATEX) $(MAIN)) ; true
				egrep $(RERUN) $*.log && ($(LATEX) $(MAIN)) ; true
				if cmp -s $*.toc $*.toc.bak; then echo ;else $(LATEX) $(MAIN) ; fi
				$(RM) $*.toc.bak
# Display relevant warnings
				egrep -i "(Reference|Citation).*undefined" $*.log ; true

%.ps:           %.dvi
				dvips $(GOAL).dvi -o $(GOAL).ps

pdf:			%.pdf

ps:				%.ps

rtf:			%.rtf

view:			%.pdf
				$(PDFVIEW) $(GOAL).pdf &

fast:			*.tex
				$(LATEX) $(MAIN)
				dvips $(GOAL).dvi -o $(GOAL).ps

all:            $(GOALS)
b5: 		%.dvi 
				dvips -O2.2cm,2.85cm -Ppdf -updftex.map $(GOAL).dvi -o $(GOAL).ps
				ps2pdf13 -r1800 -dPDFSETTINGS=/printer $(GOAL).ps

spellchapter%:	chapter*.tex
				$(SPELLCHECKER)	-c -l $(LANG) `echo $@ |  sed -e 's/spell//'`.tex

help:
			@echo Makefile for article compilation, usage:
			@echo " make pdf: produce pdf output"
			@echo " make ps: produce dvi and ps output"
			@echo " make rtf: produce rtf with latex2rtf"
			@echo " make fast: produce ps wihtout bibtex and error check"
			@echo " make view: produce pdf and run viewer \(fast mode\)"
			@echo " make spellchapterX: run aspell on chapterX.tex"
			@echo " make clean: remove everything but sources files"
			@echo " make help: this help."
			@echo "\n by Leonardo Maccari, 2008"

clean:

				rm -f *.aux *.log *.blg *.brf *.cb *.ind *.idx *.ilg  \
				*.inx *.toc *.out *.bbl *.lof *.lot *.cb2 *.thm\
				*.toc.bak *.lox $(GOALS)

