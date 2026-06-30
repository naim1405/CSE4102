%{
#include<stdio.h>
int yylex();
void yyerror(char *s);

%}

%token INT_TYPE FLOAT_TYPE NUM
%token OP CP OB CB  SEMI
%token ASSIGN EQ NEQ GT LT GTE LTE 
%token ID
%token IF ELSE WHILE FOR
%token ADD SUB DIV MUL MODULO 

%start stmnts

%%
stmnts : stmnts stmnt
	   | stmnt
	   ;

stmnt : INT_TYPE ID OP CP OB stmnts CB
	 | IF OP comparison CP OB stmnts CB
	 | ELSE IF OP comparison CP OB stmnts CB
	 | ELSE OB stmnts CB
	 | FOR OP for_block CP OB stmnts CB
	 | declarations SEMI

declarations: INT_TYPE ID ASSIGN expr
			| FLOAT_TYPE ID ASSIGN expr
			| ID ASSIGN expr

expr : expr ADD element 
	 | expr SUB element 
	 | expr MUL element 
	 | expr DIV element 
	 | expr MODULO element 
	 | element
	 ;

comparison : comparison GT element
		   | comparison GTE element
		   | comparison LT element
		   | comparison LTE element
		   | comparison EQ element
		   | element
		   ;


for_block: init_expr SEMI comparison SEMI expr SEMI

init_expr: expr | declarations 

element : ID | NUM;

%%


int main(){
	yyparse();
	printf("Parsing Successfull\n");
}


void yyerror(char *s){
	printf("ERR: %s\n", s);

}
