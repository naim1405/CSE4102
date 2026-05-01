%{

enum yytokentype {
	IF = 260,
	ELSE = 261,
	WHILE = 262,
	FOR = 263,
	UNKNOWN = 264,
	INT_TYPE = 265,
	FLOAT_TYPE = 266,
	INT_NUM = 267,
	FLOAT_NUM = 268,
	ADD = 269,
	SUB = 270,
	MUL = 271,
	DIV = 272,
	GT = 273,
	LT = 274,
	LTE = 275,
	GTE = 276,
	EQ = 277,
	NEQ = 279,
	MODULO = 280,
	OP = 281,
	CP = 282,
	OB = 283,
	CB = 284,
	ID = 285,
	ASSIGN = 286

};

int yylval;

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
{digits} {yylval = atoi(yytext); return INT_NUM;}
{digits}\.{digits} {return FLOAT_NUM;}
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
{letter}({letter}|{digit}|_)* {return ID;}
. { }



%%

int main(){

	int token;

	while(token = yylex()){
		printf("token: %d \n", token);
		if(token == INT_NUM){
		printf("int num: %d\n", yylval);
		}

		else if(token == FLOAT_NUM){
		float num = atof(yytext);
		printf("int num: %f\n", num);
		}

	}

}

