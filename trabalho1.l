%{

#include <stdio.h>
int num_linhas = 0, num_caracteres = 0;

%}

letra_minuscula [a-z]
letra           [a-zA-Z]
digito	        [0-9]
digitos	        digito+

inteiro         digitos 
ponto_flutuante (digitos)(\.digitos+)
literal         \".\"
%%

inteiro		        {printf("%s -> INTEIRO\n", yytext);}
ponto_flutuante		{printf("%s -> REAL\n", yytext);}
literal	        	{printf("%s -> LIRETAL\n", yytext);}
\n                  num_linhas++;
.                   num_caracteres++;

%%

int main()
{
  yylex();
  printf("# de linhas = %d\n# de caracteres = %d\n\n", num_linhas, num_caracteres);
}

