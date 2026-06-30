%option noyywrap

%{
#include "calc.tab.h"

%}

digit [0-9]
digits {digit}+

%%

"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
{digits} {return NUM;}


%%


