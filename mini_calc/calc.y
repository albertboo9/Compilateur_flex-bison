%{
#include <stdio.h>
%}

%token NOMBRE
%%

expression: 
    expression '+' expression {$$ = $1 + $3;}
    | expression '-' expression {$$ = $1 - $3;}
    | expression '*' expression {$$ = $1 * $3;}
    | expression '/' expression {$$ = $1 / $3;}
    | '(' expression ')' {$1;}
    | NOMBRE {$1;}
    ;
calcul: expression {printf("%d \n", $1 );}
%%

int yyerror(void)
{ fprintf(stderr, "erreur de syntaxe\n"); return 1;}