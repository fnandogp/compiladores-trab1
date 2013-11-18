all:
	flex trabalho1.l
	gcc lex.yy.c -o trab1 -lfl
	pdflatex trabalho1.tex

clean:
	rm trab1 *lex.yy.c *.pdf *.log *.aux

