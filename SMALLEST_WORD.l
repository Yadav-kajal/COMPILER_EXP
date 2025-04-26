%{
#include <stdio.h>
#include <string.h>

char smallest[1000];  // To store the smallest word
int first = 1;         // Flag to track first word
%}

%%
[a-zA-Z]+ {
    if (first) {
        strcpy(smallest, yytext);
        first = 0;
    } else {
        if (strlen(yytext) < strlen(smallest)) {
            strcpy(smallest, yytext);
        }
    }
}
.|\n   ; // Ignore other characters
%%

int main() {
    yylex();
    if (!first) {
        printf("Smallest word: %s\n", smallest);
    } else {
        printf("No words found.\n");
    }
    return 0;
}
