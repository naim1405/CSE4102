%{
#include<stdio.h>
int yylex();
void yyerror(char *s);
int yylval;

%}

%token VOID_TYPE NUM POINTER 
%token OP CP OB CB  SEMI ARROW COLON
%token ASSIGN
%token CLASS PUBLIC VIRTUAL STRING NEW
%token ID


%start stmnts

%%
stmnts : stmnts stmnt
	   | stmnt
	   ;

stmnt : class_dec 
	  | obj_create
	  | prot COLON prot data_type  ID OP CP ASSIGN NUM SEMI
	  | ID ARROW ID OP CP SEMI
	  | ID OP STRING CP SEMI
	  | prot COLON prot ID OP CP ASSIGN NUM SEMI
	  | prot COLON data_type ID OP CP OB stmnts CB
	  ;


class_dec : CLASS ID OB stmnts CB SEMI
		  | CLASS ID COLON prot ID OB stmnts CB SEMI

obj_create: ID POINTER ID ASSIGN NEW ID OP CP SEMI;

data_type: VOID_TYPE;
prot: PUBLIC | VIRTUAL;



%%


int main(){
	yyparse();
	printf("Parsing Successfull\n");
}


void yyerror(char *s){
	printf("ERR: %s\n", s);
	printf("%d\n", yylval);

}
