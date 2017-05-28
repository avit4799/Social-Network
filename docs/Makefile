LC = pdflatex
MAIN = main

docs: *.tex
	$(LC) $(MAIN)
	$(LC) $(MAIN)

.PHONY:clean

clean:
	rm -f $(MAIN).aux $(MAIN).aux $(MAIN).log $(MAIN).out $(MAIN).toc missfont.log
