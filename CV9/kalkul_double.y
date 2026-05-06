%{
#include <math.h>
#include <stdio.h>
void yyerror(char *);
int yylex(void);
extern int yylineno;
%}

%union { double dval; }
%token <dval> NUMBER
%token SQRT LOG
%type <dval> expression
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%%

statement_list : statement_list statement ';' '\n'  { }
               | statement ';' '\n'                 { }
               | error '\n' { printf("Line %d: syntax error in a statement!\n", yylineno); yyerrok; }
               ;

statement : expression  { printf("Value: %f\n", $1); }
          ;

expression : expression '+' expression  { $$ = $1 + $3; }
           | expression '-' expression  { $$ = $1 - $3; }
           | expression '*' expression  { $$ = $1 * $3; }
           | expression '/' expression
             {
                 if ($3 == 0.0)
                 {
                     yyerror("division by zero");
                     return 1;
                 }
                 else $$ = $1 / $3;
             }
           | '-' expression %prec UMINUS { $$ = -$2; }
           | '+' expression %prec UMINUS { $$ = $2; }
           | '(' expression ')'          { $$ = $2; }
           | SQRT '(' expression ')'     { $$ = sqrt($3); }
           | LOG '(' expression ')'      { $$ = log($3); }
           | NUMBER                      { $$ = $1; }
           ;

%%

void yyerror(char *s)
{
    fprintf(stderr, "%s in line %d\n", s, yylineno);
}

int main(void)
{
    if(!yyparse())
        printf("End of parsing.\n");
    return 0;
}