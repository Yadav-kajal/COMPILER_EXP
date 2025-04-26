%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER
%token PLUS MINUS MUL DIV
%token LPAREN RPAREN

%left PLUS MINUS
%left MUL DIV

%%

input:
      expr '\n'   { printf("Postfix: %s\n", $1); free($1); }
    ;

expr:
      expr PLUS expr   { $$ = concat($1, $3, "+"); }
    | expr MINUS expr  { $$ = concat($1, $3, "-"); }
    | expr MUL expr    { $$ = concat($1, $3, "*"); }
    | expr DIV expr    { $$ = concat($1, $3, "/"); }
    | LPAREN expr RPAREN { $$ = $2; }
    | NUMBER           { 
                          char *buf = malloc(20); 
                          sprintf(buf, "%d", $1); 
                          $$ = buf; 
                        }
    ;

%%

char* concat(char *a, char *b, const char *op) {
    char *res = malloc(strlen(a) + strlen(b) + strlen(op) + 3);
    sprintf(res, "%s %s %s", a, b, op);
    free(a); free(b);
    return res;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
