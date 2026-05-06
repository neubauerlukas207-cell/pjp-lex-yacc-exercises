%{
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include "symtab.h"
struct symtab syms[MAXSYMS];
void yyerror(char *);
int yylex(void);
extern int yylineno;
%}

%union { double dval; struct symtab *symp; }
%token PRINT INCREMENT DECREMENT
%token <symp> NAME
%token <dval> NUMBER
%type <dval> expression
%left '-' '+'
%left '*' '/'
%nonassoc UNARY

%%

statement_list : statement ';' '\n'
               | statement_list statement ';' '\n'
               | error '\n' { printf("Error in a statement, line %d!\n", yylineno); yyerrok; }
               ;

statement : NAME '=' expression         { $1->value = $3; }
          | PRINT expression            { printf("%f\n", $2); }
          | NAME INCREMENT              { ($1->value)++; }
          | NAME DECREMENT              { ($1->value)--; }
          ;

expression : expression '+' expression  { $$ = $1 + $3; }
           | expression '-' expression  { $$ = $1 - $3; }
           | expression '*' expression  { $$ = $1 * $3; }
           | expression '/' expression
             {
                 if ($3 == 0.0)
                 {
                     yyerror("division by zero");
                     return 0;
                 }
                 else $$ = $1 / $3;
             }
           | '-' expression %prec UNARY { $$ = -$2; }
           | '+' expression %prec UNARY { $$ = $2; }
           | '(' expression ')'         { $$ = $2; }
           | NAME '(' expression ')'
             {
                 if ($1->funcptr)
                     $$ = ($1->funcptr)($3);
                 else {
                     printf("%s: not a function\n", $1->name);
                     $$ = 0.0;
                 }
             }
           | NUMBER                     { $$ = $1; }
           | NAME                       { $$ = $1->value; }
           ;

%%

struct symtab *symlook(char *s)
{
    struct symtab *sp;
    for (sp = syms; sp < &syms[MAXSYMS]; sp++)
    {
        if (sp->name && !strcmp(sp->name, s))
            return sp;
        if (!sp->name)
        {
            sp->name = (char *)strdup(s);
            return sp;
        }
    }
    yyerror("Too many symbols");
    exit(1);
}

void addfunc(char *name, double (*func)())
{
    struct symtab *sp = symlook(name);
    sp->funcptr = func;
}

int main(void)
{
    addfunc("exp", exp);
    addfunc("sqrt", sqrt);
    addfunc("cbrt", cbrt);
    addfunc("log", log);
    yyparse();
    return 0;
}

void yyerror(char *s)
{
    fprintf(stderr, "%s in line %d\n", s, yylineno);
}