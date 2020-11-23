FILES=results_summary new_results technique_de_marin
OUTDIR=pdf/
SRCDIR=src/
TARGETS=$(addprefix $(OUTDIR),$(addsuffix .pdf,$(FILES)))

all : $(TARGETS)

$(OUTDIR)%.pdf : $(SRCDIR)%.tex
	latexmk $(FLAGS) -cd -outdir=../$(OUTDIR) -pdf $<
	latexmk $(FLAGS) -c -outdir=$(OUTDIR) $<

.PHONY: archive clean
archive :
	tar czf $(NAME).tar.gz pdf/*

clean :
	@rm -f pdf/* $(NAME).tar.gz || true
