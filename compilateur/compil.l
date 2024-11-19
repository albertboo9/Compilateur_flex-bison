%{
#include <stdio.h>
#include "compil.tab.h"
%}

%%
[0-9]+  { yylval = atoi(yytext); return NOMBRE; }
[ \t]   ;
\n      { return 0; }
.       { yyerror("Caractère inconnu"); }
%%