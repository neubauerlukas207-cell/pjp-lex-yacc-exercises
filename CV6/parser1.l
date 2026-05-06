%{
#define a_TOK 1
#define b_TOK 2
#define c_TOK 3
#define d_TOK 4
#define f_TOK 5
#define NOT_CORRECT_TERMINAL -1
%}
%%
[ \t\n] ;
a       return(a_TOK);
b       return(b_TOK);
c       return(c_TOK);
d       return(d_TOK);
f       return(f_TOK);
.       return(NOT_CORRECT_TERMINAL);
%%
int symbol;

int S(void);
int A(void);
int Ap(void);
int B(void);
int Bp(void);

int main()
{
    int err = -1;
    symbol = yylex();
    err = S();
    if (err == 0 && symbol == 0)
        puts("Correct recursive descent derivation");
    else
        puts("Incorrect recursive descent derivation");
    return err;
}

int S(void)
{
    int err = -1;
    puts("S -> AB");
    err = A();
    if (err == 0)
        err = B();
    return err;
}

int A(void)
{
    int err = -1;
    if (symbol == a_TOK)
    {
        puts("A -> aA'");
        symbol = yylex();
        err = Ap();
    }
    return err;
}

int Ap(void)
{
    int err = -1;
    switch(symbol)
    {
    case d_TOK:
        puts("A' -> d");
        symbol = yylex();
        err = 0;
        break;

    case b_TOK:
        puts("A' -> bAc");
        symbol = yylex();
        err = A();
        if (err == 0)
        {
            if (symbol == c_TOK)
            {
                symbol = yylex();
                err = 0;
            }
            else
                err = -1;
        }
        break;

    case f_TOK:
        puts("A' -> Bc");
        err = B();
        if (err == 0)
        {
            if (symbol == c_TOK)
            {
                symbol = yylex();
                err = 0;
            }
            else
                err = -1;
        }
        break;

    default:
        err = -1;
        break;
    }
    return err;
}

int B(void)
{
    int err = -1;
    if (symbol == f_TOK)
    {
        puts("B -> fB'");
        symbol = yylex();
        err = Bp();
    }
    return err;
}

int Bp(void)
{
    int err = -1;
    if (symbol == a_TOK)
    {
        puts("B' -> A");
        err = A();
    }
    else
    {
        puts("B' -> epsilon");
        err = 0;
    }
    return err;
}