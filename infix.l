%{
#include "y.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t]       ;           // Ignore whitespace
\n          { return '\n'; }

"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MUL; }
"/"         { return DIV; }
"("         { return LPAREN; }
")"         { return RPAREN; }

.           { return yytext[0]; }

%%










execution step
bison -d infix.y
flex infix.l
gcc infix.tab.c lex.yy.c -o infix -lm
./infix
