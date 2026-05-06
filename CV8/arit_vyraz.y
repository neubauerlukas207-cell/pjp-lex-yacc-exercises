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

statement : expression
          ;

expression : expression '+' expression  { }
           | expression '-' expression  { }
           | expression '*' expression  { }
           | expression '/' expression  { }
           | '-' expression %prec UMINUS { }
           | '+' expression %prec UPLUS  { }
           | '(' expression ')'          { }
           | NUMBER                      { }
           ;

%%

void yyerror(char *s)
{
    printf("Syntaktická chyba\n");
}

int main()
{
    if(!yyparse())
        printf("OK\n");
}