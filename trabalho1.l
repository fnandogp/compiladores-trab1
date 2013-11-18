%{
#include <stdio.h>
%}

%%

\/\*[^(\*\/)]*\*\/	;
\/\/[^\n]*\n 		;

algoritmo |
variáveis |
fim-variáveis |
início |
fim |
inteiro |
inteiros |
caractere |
caracteres |
real |
reais |
literal |
lógico |
lógicos |
matriz |
se |
então |
senão |
fim-se |
para |
de |
até |
faça |
fim-para |
passo |
enquanto |
fim-enquanto |
imprima |
leia |
função |
retorne 					{printf("%s -> PALAVRA RESERVADA\n",yytext);} 

("+"|"-")?[0-9]+ |
0(x|X)[0-9a-fA-f]+ |
0(c|C)[0-7]+ |
0(b|B)[0-1]+ 				{printf("%s -> INTEIRO\n", yytext);}

("+"|-)?[0-9]"."[0-9]+ 		{printf("%s -> REAL\n", yytext);}

\'([^\\]|\\.)?\'			{printf("%s -> CARACTERE\n", yytext);}

\"([^\"\\\n\r]|\\.)*\"		{printf("%s -> LEXICO\n", yytext);}

verdadeiro |
falso	 					{printf("%s -> LOGICO\n", yytext);}

(\+|\-|\/|\*|\%|\+\+­­)		{printf("%s -> OPERADOR ARITMETICO\n", yytext);}

(\>|\>\=|\<|\<\=|\=|\<\>)	{printf("%s -> OPERADOR RELACIONAL\n", yytext);}

&&|"||"|!|ou|e				{printf("%s -> OPERADOR LOGICO\n", yytext);}

(\"|\(|\)|\.|\,|\;|\:|\{|\}|\#|\'|\\)	{printf("%s -> SIMBOLO ESPECIAL\n", yytext);}

[a-zA-Z_][a-zA-Z0-9_]*		{printf("%s -> IDENTIFICADOR\n",yytext);} 

=							{printf("%s -> ATRIBUICAO\n",yytext);} 

[ \t\n] ;

.							{printf("%s -> DESCONHECIDO\n", yytext);}

%%

int main() {
  yylex();
}

int yywrap(){
	return(1);
}
