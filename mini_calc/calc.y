%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NOMBRE
%left '-''+'
%left '/' '*'


%start calcul

%%

expression:
    expression '+' expression { $$ = $1 + $3; }
    | expression '-' expression { $$ = $1 - $3; }
    | expression '*' expression { $$ = $1 * $3; }
    | expression '/' expression {
        if ($3 == 0) {
            fprintf(stderr, "Erreur : division par zéro\n");
            exit(EXIT_FAILURE);
        }
        $$ = $1 / $3;
    }
    | '(' expression ')' { $$ = $2; }
    | NOMBRE { $$ = $1; }
    ;

calcul:
    expression { printf("Résultat : %d\n", $1); }
    ;

%%

int yyerror(const char *s)
{
    fprintf(stderr, "Erreur de syntaxe : %s\n", s);
    return 1;
}
