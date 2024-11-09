%{
#include "calc.tab.h"
%}

%%
[0-9]+(\.[0-9]+)?  { yylval = atof(yytext); return NOMBRE; }
"+"     { return '+'; }
"-"     { return '-'; }
"*"     { return '*'; }
"/"     { return '/'; }
"("     { return '('; }
")"     { return ')'; }
[ \t\n];
.       { yyerror("Caractère inconnu"); }
%%