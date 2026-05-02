%option noyywrap

%{
#include "cCompiler.tab.h"
%}

digit [0-9]
digits {digit}+

delim [ \t\n]
ws {delim}+

letter [a-zA-z]

%%

"if" {return IF;}
"else" {return ELSE;}
"for" {return FOR;}
"while" {return WHILE;}
"int" {return INT_TYPE;}
"float" {return FLOAT_TYPE;}
{digits} {yylval = 0; return NUM;}
{digits}\.{digits} { yylval = 1; return NUM;}
{ws} { }
"+"  {return ADD;}
"-"  {return SUB;}
"*"  {return MUL;}
"/"  {return DIV;}
"%"  {return MODULO;}
"=" {return ASSIGN;}
">"  {return GT;}
">="  {return GTE;}
"<"  {return LT;}
"<="  {return LTE;}
"=="  {return EQ;}
"!="  {return NEQ;}
"("  {return OP;}
")"  {return CP;}
"{"  {return OB;}
"}"  {return CB;}
";" {return SEMI;}
{letter}({letter}|{digit}|_)* {return ID;}
. { }

%%


