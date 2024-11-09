/* fichier calc.l */
%{
/* fichier dans lequel est defini la macro constante NOMBRE */
#include "calc.tab.h"
%}
%%
[0-9]+ {
    yylval=atoi(yytext);
    return NOMBRE;
    }
[ \t] ; /* ignore les blancs et tabulations */
\n return 0;
. return yytext[0];
%%