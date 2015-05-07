TARGETS := rapport.idx rapport.ind rapport.bbl rapport.pdf

# executables
PDFLATEX := pdflatex -halt-on-error
MAKEINDEX := makeindex
BIBTEX := bibtex
UNAME := $(shell uname -s)

ifeq ($(UNAME),Darwin)
	OPEN := open
else
	OPEN := xdg-open
endif

# List all targets that are not actual files
.PHONY: data-all all default benchmarks full sign open check

default: open

all: all-plots $(TARGETS)

all-plots:
	$(MAKE) -C plots all

open: all
	$(OPEN) rapport.pdf

# first parse
%.aux %.idx %.log %.out %.toc: %.tex
	$(PDFLATEX) $<

# index
%.ilg %.ind: %.idx
	@# $(MAKEINDEX) ${<:.idx=}
	@# Not needed with imakeidx package in TeX Live

# bibliography
%.bbl %.blg: %.aux
	$(BIBTEX) ${<:.aux=}

words:
	wc -w tekst.tex

# two passes to resolve links
%.pdf: %.tex %.ind %.bbl
	$(PDFLATEX) $< -o $@
	$(PDFLATEX) $< -o $@

mininet-vm-x86_64.vmdk.asc:
	@echo "# Creating signature for VM image."
	@echo "# This signature can be embedded in the thesis appendix,"
	@echo "# to prove that it hasn't changed after submission date."
	@echo "# (This may take a while -- around 40-50 secs)"
	time gpg -a --output=$@ --detach-sign $(VMFILE)

sign: mininet-vm-x86_64.vmdk.asc

check: check-u8 \
			 check-dash \
			 check-label \
			 check-footnote \
			 check-em \
			 check-todo

check-u8:
	@echo '## Looking for \u8 / ALT-SHIFT-SPACE (OS X) (replace with space)'
	@grep -RI '\\xa0' *.tex || exit 0 # ignore grep's exit status
	@echo ""

check-dash:
	@echo "## Looking for double-dash hyphens (replace with single dash)"
	@egrep -RI '[^- ]--[a-zA-Z]' *.tex || exit 0
	@echo ""

check-footnote:
	@echo "## Footnotes should preferably be after punctuation"
	@grep -RI '[a-zA-Z]\\\\footnote' *.tex || exit 0
	@echo ""

check-em:
	@echo '## Should use \textit instead of \em'
	@grep -RI '\\em' *.tex || exit 0
	@echo ""

check-todo:
	@echo "## To do ..."
	@grep -RI -i todo *.tex || exit 0
	@echo ""

check-label:
	@echo "## Checking for incorrect order of caption/label"
	@./grep_incorrect_labels.py `find . -name '*.tex'`
	@echo ""

clean:
	$(MAKE) -C plots clean
	rm -f $(TARGETS) *.log *.toc *.aux *.bbl *.blg *.out *.ind *.ilg *.idx *.tdo *.lof *.lot *.loa *.lol
