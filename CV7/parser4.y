%{
    void yyerror(char *);
    int yylex(void);
    #define YYDEBUG 1
    #include <stdio.h>
    int line = 1;
%}

%token a_TOK b_TOK c_TOK d_TOK e_TOK f_TOK g_TOK h_TOK

%%

start : start S '\n'        { printf("Correct derivation in line %d!\n", line++); }
      | start error '\n'    { printf("Line %d: syntax error\n", line++); yyerrok; }
      |
      ;

S : A B
  ;

A : a_TOK h_TOK
  | a_TOK b_TOK A c_TOK
  | a_TOK B c_TOK
  ;

B : C D E
  ;

C : d_TOK
  | e_TOK
  ;

D : f_TOK D
  | f_TOK
  ;

E : B
  | g_TOK
  ;

%%

void yyerror(char *s)
{
    /* chyby resime pres token error */
}

int main(void)
{
#if YYDEBUG
    yydebug = 0;
#endif
    yyparse();
    printf("End of input reached.\n");
    return 0;
}