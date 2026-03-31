%{
#include <stdio.h>
%}
%%
(ab|ba)[c-z0-9]*(ab|ba)    { printf("%s is according the grammar\n", yytext); }
[a-z0-9]+                   { printf("%s is NOT according the grammar\n", yytext); }
[ \t\n]                     { }
%%
