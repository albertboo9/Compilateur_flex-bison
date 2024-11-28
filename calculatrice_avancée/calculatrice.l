%{
#include <stdio.h>
#include "calculatrice.tab.h"
%}
%%
"si"                    { return SI; }
"sinon"                 { return SINON; }
"tantque"               { return TANTQUE; }
"afficher"              { return AFFICHER; }
"lire"                  { return LIRE; }
[a-zA-Z_][a-zA-Z0-9_]*  { return IDENTIFIANT; }
[0-9]+                  { yylval = atoi(yytext); return NOMBRE; }
"="                     { return '='; }
[ \t\n]+                ; /* Ignore les espaces et les sauts de ligne */
.                       { return yytext[0]; }
%%
