%%
main                { printf("MAIN"); }
printf              { printf("PRINTF"); }
\"[^\"]*\"          { printf("STRING"); }
[ \t]               { }
.                   { printf("%s", yytext); }
%%
