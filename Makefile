MAIN = main.tex
LATEXMK = latexmk
XELATEX = xelatex
XELATEX_FLAGS = -interaction=nonstopmode -file-line-error
BIB_FILES := $(wildcard bibliography/*.bib)

.PHONY: all pdf bib-sources clean

all: pdf

pdf: config/bibliography-sources.tex
	$(XELATEX) $(XELATEX_FLAGS) $(MAIN)
	@if [ -f "$(basename $(MAIN)).bcf" ]; then biber "$(basename $(MAIN))"; fi
	$(XELATEX) $(XELATEX_FLAGS) $(MAIN)
	$(XELATEX) $(XELATEX_FLAGS) $(MAIN)

bib-sources: config/bibliography-sources.tex

config/bibliography-sources.tex: $(BIB_FILES)
	@mkdir -p config
	@printf "%% Auto-generated from bibliography/*.bib.\n" > config/bibliography-sources.tex
	@count=0; \
	for bib in bibliography/*.bib; do \
	  if [ -f "$$bib" ]; then \
	    printf '%s\n' "\\addbibresource{$$bib}" >> config/bibliography-sources.tex; \
	    count=$$((count + 1)); \
	  fi; \
	done; \
	if [ $$count -eq 0 ]; then \
	  printf "%% No .bib files found in bibliography/.\n" >> config/bibliography-sources.tex; \
	fi

clean:
	$(LATEXMK) -C $(MAIN)
	@rm -f main.bbl-SAVE-ERROR
