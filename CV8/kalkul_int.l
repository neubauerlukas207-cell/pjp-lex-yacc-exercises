%{
#include "kalkul_int.tab.h"
%}
%option nounput
%option noinput
%%
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
[ \t]   ;
\n      return 0;
.       return yytext[0];
%%