/* 
Crie um Analisador Léxico utilizando Flex que consiga gerar os tokens
do arquivo de entrada "exercicio01.in" que consiste em um código na
linguagem C. O analisador deverá identificar todos os tokens referentes a:

1. Identificadores ok
2. Números Inteiros ok
3. Números de Ponto Flutuante ok
4. Palavras reservadas ok
5. Operadores Matemáticos e Relacionais
6. Chaves, Colchetes e Chaves
utilize os exemplos no diretório "flex" como ponto de partida
- Para gerar o fonte digite
$ lex exercicios01.l
- Para compilar o fonte me C gerado digite
$ gcc exercicios01.yy.c
- Para executar
$ ./a.out


#include <"stdio.h">

int main() {
  int x = 9;
  unsigned int = 10;

  if (x > 10) {
    print("X é maior que dez!")
  }
}
------------------------------------------------------------
 [{[]}] 		{printf("<Colchetes e chaves, %s>"); contador++;}

*/   

/*Seção de definições*/
%{
	int contador=0;

%}

/*Definicões de Nomes */
INDENTIFICADOR		[_a-zA-Z][_a-zA-Z0-9]*
OPERADOR_MATEMATICO	[+|-|/|*|^|%]

/* FIM DA SEÇÃO DE DEFINIÇÕES */
%%
	/*seção de regras
	  Uma entrada por linha no formato: 
	  Padrão ação	
	*/

[0-9]+		{printf("<numero inteiro, %s>", yytext);}
[0-9]*"."[0-9]*		{printf("<numero ponto flutuante, %s>", yytext);}
int|float|unsigned|if|print|include {printf("<Palavra Reservada, %s>", yytext); contador++;}
{INDENTIFICADOR}	{printf ("<Indentificador, %s>", yytext); contador ++; }
>|<|>=|<=|==|!=		{printf ("Operador Relacional %s>", yytext);}
{OPERADOR_MATEMATICO}	{printf ("Operador Matematico %s>", yytext);}
[{|}]			{printf("<Chaves, %s>",yytext); contador++;}
[[][]]*			{printf ("Colchetes, %s>", yytext);}
<<EOF>>			return 0;

%%

int yywrap(){}
int main(){
	printf("Iniciando Análise Léxica...\n---\n");
    	yylex();
    	printf("Foram encontradas %d ocorrências de identificadores.\n", contador);
    	printf("---\nÁnalise Finalizada!\n");
    
    return 0;
}

