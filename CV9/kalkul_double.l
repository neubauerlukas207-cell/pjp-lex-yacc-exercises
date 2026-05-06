%{
#include "kalkul_double.tab.h"
%}
%option nounput
%option noinput
%%
[ \t]   ;
[0-9]*"."[0-9]+([eE][+-]?[0-9]+)?  { yylval.dval = atof(yytext); return NUMBER; }
[0-9]+([eE][+-]?[0-9]+)?           { yylval.dval = atof(yytext); return NUMBER; }
sqrt    return SQRT;
log     return LOG;
"\n"    { yylineno++; return yytext[0]; }
.       return yytext[0];
%%