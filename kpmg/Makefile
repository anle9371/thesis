# LaTeX -*-Makefile-*-
#
# $Id: Makefile,v 1.1 2009/09/08 18:41:42 ksiek Exp $
#

PAPER		= 

BIB		= 

BBL		= 

PRINTER		= 

DVIPS		= dvips

PDFLATEX	= pdflatex
LATEX		= latex
BIBTEX		= bibtex
FIG2DEV		= fig2dev

default: le_ms_presentation.pdf

#
# This first section contains macros whose values that you need to
# fill in.
#

# MAIN_TEX: In order to build your file, fill in the MAIN_TEX macro
# with the name of your main .tex file -- the one that you invoke
# LaTeX on.
MAIN_TEX	= le_ms_presentation.tex


# OTHER_TEX_FILES: Put in the names of all the other files that your
# thesis depends on (e.g., other .tex files, .bib files, figures,
# etc.) in the OTHER_TEX_FILES macro.  This is ensure that whenever
# one of the "other" files changes, "make" will rebuild your paper.
# You should *not* list the file in MAIN_TEX, above.

OTHER_TEX_FILES	= 

FIG_FILES	= 


#########################################################################
#
# You should not need to edit below this line
#
#########################################################################

.SUFFIXES: .tex .dvi .ps .pdf .fig .eps

CHAP_CITE	= $(CHAP_CITE_TEX:.tex=)
MAIN_DVI	= $(MAIN_TEX:.tex=.dvi)
MAIN_PS		= $(MAIN_TEX:.tex=.ps)
MAIN_PDF	= $(MAIN_TEX:.tex=.pdf)

EPS_FIGS	= $(FIG_FILES:.fig=.eps)
PDF_FIGS	= $(FIG_FILES:.fig=.pdf)

#
# Some common target names
# Note that the default target is "ps"
#

#pdf: $(MAIN_PDF) description.pdf summary.pdf refs.pdf supplementary.pdf
pdf: $(MAIN_PDF)
ps: $(MAIN_PS)
all: pdf

$(MAIN_PDF): $(OTHER_TEX_FILES) $(PDF_FIGS)
$(MAIN_PS): $(MAIN_DVI)
$(MAIN_DVI): $(OTHER_TEX_FILES) $(EPS_FIGS)

#
# Make the dependencies so that things build when they need to
#
description.pdf: description.tex $(OTHER_TEX_FILES) 
summary.pdf: summary.tex summary-body.tex 
lums-bio.pdf: lums-bio.tex
jsquyres-bio.pdf: jsquyres-bio.tex
facilities.pdf: facilities.tex 


#
# General rules
#
.fig.eps:
	$(FIG2DEV) -L eps $< $@

.fig.pdf:
	$(FIG2DEV) -L pdf $< $@

.fig.png:
	$(FIG2DEV) -L png $< $@

.tex.pdf:
	@$(PDFLATEX) $*
	@if ( grep 'Warning: Label(s) may' $*.log > /dev/null ); \
	then $(PDFLATEX) $* ; else :; fi
	@ if ( grep 'Writing index file' $*.log > /dev/null ); \
	then makeindex $* ; $(PDFLATEX) $* ; fi
	@-if ( grep 'Warning: Citation' $*.log > /dev/null ); then \
	  bibtex $* ; \
	  $(PDFLATEX) $* ; \
	fi
	@if ( grep 'Warning: Label(s) may' $*.log > /dev/null || \
	      grep 'Warning: Citation' $*.log > /dev/null); \
	then $(PDFLATEX) $* ; else :; fi
	@if ( grep 'Warning: Label(s) may' $*.log > /dev/null || \
	      grep 'Warning: Citation' $*.log > /dev/null); \
	then $(PDFLATEX) $* ; else :; fi
	@if ( grep 'Warning: Label(s) may' $*.log > /dev/null || \
	      grep 'Warning: Citation' $*.log > /dev/null); \
	then $(PDFLATEX) $* ; else :; fi

.tex.dvi:
	(unset TEXINPUTS; $(LATEX) $*)
	@if ( grep 'Warning: Label(s) may' $*.log > /dev/null ); \
	then (unset TEXINPUTS; $(LATEX) $*) ; else :; fi
	@ if ( grep 'Writing index file' $*.log > /dev/null ); \
	then $(MAKEINDEX) $* ; (unset TEXINPUTS; $(LATEX) $*) ; fi
	@-if ( grep 'Warning: Citation' $*.log > /dev/null ); then \
	  if test "$(CHAP_CITE)" ; then \
	    for file in bogus $(CHAP_CITE) ; do \
	      if test "$$file" != "bogus"; then \
		$(BIBTEX) $$file ; \
	      fi ; \
	    done ; \
	  else \
	    $(BIBTEX) $* ; \
	  fi ; \
	  (unset TEXINPUTS; $(LATEX) $*) ; \
	fi
	@if ( grep 'Warning: Label(s) may' $*.log > /dev/null || \
	      grep 'Warning: Citation' $*.log > /dev/null || \
	      grep 'No file' $*.log > /dev/null); \
	then (unset TEXINPUTS; $(LATEX) $*) ; else :; fi
	@if ( grep 'Warning: Label(s) may' $*.log > /dev/null || \
	      grep 'Warning: Citation' $*.log > /dev/null); \
	then (unset TEXINPUTS; $(LATEX) $*) ; else :; fi
	@if ( grep 'Warning: Label(s) may' $*.log > /dev/null || \
	      grep 'Warning: Citation' $*.log > /dev/null); \
	then (unset TEXINPUTS; $(LATEX) $*) ; else :; fi

.dvi.ps:
	$(DVIPS) -o $*.ps $*

#
# Standard targets
#

clean:
	rm -f *~ *.bak *.pdf *% *.bbl *.aux *.out *.log

squeaky:
	rm -f *.log *.aux *.dvi *.blg *.toc *.bbl *.lof *.lot \
		$(MAIN_PS) $(MAIN_DVI) $(MAIN_PDF) $(PDF_FIGS) $(EPS_FIGS)

