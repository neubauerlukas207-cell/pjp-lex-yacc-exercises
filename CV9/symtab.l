%{
#include "symtab.tab.h"
#include "symtab.h"
#include <math.h>
%}
%option nounput
%option noinput
%%
print   return PRINT;
"++"    return INCREMENT;
"--"    return DECREMENT;
[0-9]*"."[0-9]+([eE][+-]?[0-9]+)?  { yylval.dval = atof(yytext); return NUMBER; }
[0-9]+([eE][+-]?[0-9]+)?           { yylval.dval = atof(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]*  { yylval.symp = symlook(yytext); return NAME; }
[ \t]   ;
"$"     return 0;
"\n"    { yylineno++; return yytext[0]; }
.       return yytext[0];
%%