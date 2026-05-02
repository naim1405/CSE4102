%{
#include<stdio.h>
void yyerror(char *s);
int yylex();

%}

%token ADD SUB MUL DIV NUM
%start calc

// grammar
%%
calc : calc exp
	 | 
	 ;
	 
exp : exp ADD NUM
	| exp SUB NUM
	| exp MUL NUM
	| exp DIV NUM
	| NUM
	;



%%

int main(){
	yyparse();
	printf("Parsing Successfull\n");

}

void yyerror(char *s){
	printf("err %s\n", s);
}
