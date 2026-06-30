%option noyywrap

%{
#include "test.tab.h"
%}

digit [0-9]
digits {digit}+

delim [ \t\n]
ws {delim}+

letter [a-zA-z]

%%

"void" {return VOID_TYPE;}
"class" {return CLASS;}
"public" {return PUBLIC;}
"virtual" {return VIRTUAL;}
"new" {return NEW;}
\"({letter})*\" {return STRING;}

{digits} {return NUM;}
\* {return POINTER;}

\n { yylval+=1;}
{ws} {}
"=" {return ASSIGN;}
"("  {return OP;}
")"  {return CP;}
"{"  {return OB;}
"}"  {return CB;}
";" {return SEMI;}
":" {return COLON;}
"->" {return ARROW;}

{letter}({letter}|{digit}|_)* {return ID;}
. { }

%%


// int main(int argc, char** argv){
// 	int tok;
// 	while(tok = yylex()){
// 		printf("%d", tok);
// 		printf("\n");
// 	}
// }
//
