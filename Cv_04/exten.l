%{
#include <stdio.h>
%}
%%
[./_][^ \t\n]*\.(jpg|tiff|png|fig)    { printf("%s: is a picture file\n", yytext); }
[./_][^ \t\n]*\.(rar|gz|tar|tgz)      { printf("%s: is an archive\n", yytext); }
[./_][^ \t\n]*\.(txt|html)            { printf("%s: is a text file\n", yytext); }
[^ \t\n]+\.(jpg|tiff|png|fig)         { printf("%s: is a picture file\n", yytext); }
[^ \t\n]+\.(rar|gz|tar|tgz)           { printf("%s: is an archive\n", yytext); }
[^ \t\n]+\.(txt|html)                 { printf("%s: is a text file\n", yytext); }
[^ \t\n]+\.[^ \t\n]+                  { printf("%s: don't recognize this file type\n", yytext); }
[^ \t\n]+                             { printf("%s: isn't a file with ending\n", yytext); }
\n                                    { }
%%
