IMG = $(wildcard img/**/*.*)
DOC = $(wildcard doc/**/*.*)
CONTENT = $(wildcard content/*.tex)

.PHONY: all
all: cv.pdf cv-long.pdf

cv.pdf: cv.tex $(CONTENT) $(APPENDIX) $(IMG) $(DOC) $(CONTENT) 
	@echo "" | lualatex cv
	
cv-long.pdf: cv-long.tex $(CONTENT) $(APPENDIX) $(IMG) $(DOC) $(CONTENT) 
	@echo "" | lualatex cv-long
	
clean:
	-rm -r *.aux *.bcf *.log *.out *.toc *.xml *.bbl *.blg
	-rm -r ./*/*.aux
	-rm *.pdf

wordCount:
	@echo "Word Count: \c"
	@texcount -inc -1 -sum main.tex