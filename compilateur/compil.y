%{
#include <stdio.h>
%}


%token NOMBRE
%left '+' '-'
%left '*' '/'

%%

calcul: expression '\n' { printf("Résultat : %d\n", $1); }
    ;

expression:
    expression '+' expression { $$ = $1 + $3; }
    | expression '-' expression { $$ = $1 - $3; }
    | expression '*' expression { $$ = $1 * $3; }
    | expression '/' expression {
        if ($3 == 0) {
            yyerror("Division par zéro");
        } else {
            $$ = $1 / $3;
        }
    }
    | '(' expression ')' { $$ = $2; }
    | NOMBRE { $$ = $1; }
    ;
%%

int yyerror(const char *msg) {
    fprintf(stderr, "Erreur : %s\n", msg);
    return 0;
}