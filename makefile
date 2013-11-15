all:
	flex trabalho1.l
	gcc lex.yy.c -o trab1 -lfl

clean:
	rm trab1 lex.yy.c