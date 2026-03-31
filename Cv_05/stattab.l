%{
#define STR_LENGTH 200
#define STR_AMOUNT 50
#include <string.h>
#include <stdlib.h>
char strings[STR_AMOUNT][STR_LENGTH];
int first_free = 0;
%}
%%
\"[^\"]*\"      {
                    if (first_free < STR_AMOUNT) {
                        strncpy(strings[first_free], yytext, STR_LENGTH);
                        first_free++;
                    }
                }
.|\n            { }
%%
int main()
{
        int i;
        printf(" ** Zahlave **\n");
        yylex();
        for(i=0; i<first_free; i++)
                printf("%s\n", strings[i]);
        return 0;
}
int yywrap(void)
{
        return 1;
}