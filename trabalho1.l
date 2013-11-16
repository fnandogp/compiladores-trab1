%{

/*
identificador			[a-z][a-zA-Z0-9]+

inteiro_decimal         ("+"|"-")?[0-9]+
inteiro_hexadecimal		0(x|X)[0-9a-fA-f]+
inteiro_octal			0(c|C)[0-7]+
inteiro_binario			0(b|B)[0-1]+
ponto_flutuante 		(+|-)?[0-9]"."[0-9]+
logico					(verdadeiro|falso)
operador_aritmetico 	("+"|-|"/"|*|%|++­­)
operador_relacional 	(">"|">="|"<"|"<="|"="|"<>")
operador_logico 		(&&|"||"|!|ou|e)
atribuicao 				=*/
#include <stdio.h>
int num_linhas = 0, num_caracteres = 0;

%}



%%

algoritmo |
variáveis |
fim-variáveis |
início |
fim |
inteiro |
caractere |
real |
literal |
lógico |
matriz |
se |
então |
senão |
fim-se |
para |
de |
até |
faça |
fim-para
imprima |
leia |
função |
retorne 						{printf("%s -> PALAVRA RESERVADA\n",yytext);} 

[a-z][a-zA-Z0-9]+				{printf("%s -> IDENTIFICADOR\n",yytext);} 

("+"|"-")?[0-9]+ |
0(x|X)[0-9a-fA-f]+ |
0(c|C)[0-7]+ |
0(b|B)[0-1]+					{printf("%s -> INTEIRO\n", yytext);}

("+"|-)?[0-9]"."[0-9]+			{printf("%s -> REAL\n", yytext);}

"'"[a-zA-Z0-9]"'"      			{printf("%s -> CARACTERE\n", yytext);}

["verdadeiro"|"falso"]			{printf("%s -> LOGICO\n", yytext);}

("+"|"-"|"/"|"*"|"%"|"++"­­)		{printf("%s -> OPERADOR ARITMETICO\n", yytext);}

(">"|">="|"<"|"<="|"="|"<>")	{printf("%s -> OPERADOR RELACIONAL\n", yytext);}

("&&"|"||"|"!"|"ou"|"e")		{printf("%s -> OPERADOR LOGICO\n", yytext);}



\n                  	num_linhas++;
.                   	num_caracteres++;

%%

int main() {
  yylex();
  printf("# de linhas = %d\n# de caracteres = %d\n\n", num_linhas, num_caracteres);
}

int yywrap(){
	return(1);
}
