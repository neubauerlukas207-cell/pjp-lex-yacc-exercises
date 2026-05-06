%{
#include "arit_vyraz.tab.h"
%}
%option nounput
%option noinput
%%
[0-9]+ { return NUMBER; }
[ \t]   ;
\n      return 0;
.       return yytext[0];
%%