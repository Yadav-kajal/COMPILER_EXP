lower [a-z]
upper [ A-Z]
%%

{lower} { printf(" % c",yytext[0]-32);
{upper} {printf("%c",yytext[0]+32);
[\t\n]+  echo;
. echo;

%%
main( )
{
yylex();
}
