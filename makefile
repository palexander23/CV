IMG = $(wildcard img/**/*.*)
DOC = $(wildcard doc/**/*.*)

main.pdf: main.tex $(CONTENT) $(APPENDIX) $(IMG) $(DOC) 
	@echo "" | lualatex main
	
clean:
	-rm -r *.aux *.bcf *.log *.out *.toc *.xml *.bbl *.blg
	-rm -r ./*/*.aux
	-rm main.pdf

wordCount:
	@echo "Word Count: \c"
	@texcount -inc -1 -sum main.tex