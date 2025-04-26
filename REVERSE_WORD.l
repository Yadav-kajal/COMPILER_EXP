%{
#include <stdio.h>
#include <string.h>

char str[1000];  // Buffer to hold the input string
%}

%%
[a-zA-Z0-9]+ {
    strcpy(str, yytext);
    int len = strlen(str);
    printf("Original: %s\n", str);
    printf("Reversed: ");
    for (int i = len - 1; i >= 0; i--) {
        putchar(str[i]);
    }
    printf("\n");
}
.|\n   ; // Ignore other characters
%%

int main() {
    yylex();
    return 0;
}
