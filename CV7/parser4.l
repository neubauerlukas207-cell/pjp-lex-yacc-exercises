%{
#include "parser4.tab.h"
void yyerror(char *);
%}

%%
"a"     return a_TOK;
"b"     return b_TOK;
"c"     return c_TOK;
"d"     return d_TOK;
"e"     return e_TOK;
"f"     return f_TOK;
"g"     return g_TOK;
"h"     return h_TOK;
\n      return '\n';
.       return yytext[0];
%%

int yywrap(void) { return 1; }