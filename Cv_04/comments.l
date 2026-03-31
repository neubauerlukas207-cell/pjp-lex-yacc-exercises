%x COMMENT
%x LINECOMMENT
%%
"/*"                    { BEGIN COMMENT; }
<COMMENT>"/*"           { yyterminate(); }
<COMMENT>"*/"           { BEGIN INITIAL; }
<COMMENT>.              { }
<COMMENT>\n             { }
"//"                    { BEGIN LINECOMMENT; }
<LINECOMMENT>\n         { BEGIN INITIAL; }
<LINECOMMENT>.          { }
"*/"                    { yyterminate(); }
.                       { ECHO; }
\n                      { ECHO; }
%%
int main()
{
        yylex();
        return 0;
}
