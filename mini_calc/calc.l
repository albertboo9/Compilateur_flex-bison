%{
#include <stdio.h>
#include "calc.tab.h"
%}

%%
[0-9]+  { yylval = atoi(yytext); return NOMBRE; }
"+"     { return '+'; }
"-"     { return '-'; }
"*"     { return '*'; }
"/"     { return '/'; }
"("     { return '('; }
")"     { return ')'; }
[ \t\n];
.       { yyerror("caractère inconnu"); }
%%