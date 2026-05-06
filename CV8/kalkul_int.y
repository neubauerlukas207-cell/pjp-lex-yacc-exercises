%{
#include <stdio.h>
void yyerror(char *);
int yylex(void);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'
%right UMINUS UPLUS

%%

statement : expression          { printf("Value: %d\n", $1); }
          ;

expression : expression '+' expression  { $$ = $1 + $3; }
           | expression '-' expression  { $$ = $1 - $3; }
           | expression '*' expression  { $$ = $1 * $3; }
           | expression '/' expression  { $$ = $1 / $3; }
           | '-' expression %prec UMINUS { $$ = -$2; }
           | '+' expression %prec UPLUS  { $$ = $2; }
           | '(' expression ')'          { $$ = $2; }
           | NUMBER                      { $$ = $1; }
           ;

%%

void yyerror(char *s)
{
    fprintf(stderr, "Syntaktická chyba.\n");
}

int main(void)
{
    if(!yyparse())
        printf("OK\n");
    return 0;
}