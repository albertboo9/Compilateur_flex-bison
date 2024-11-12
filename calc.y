%{
#include <stdio.h>
#include <math.h>

#define YYSTYPE double

extern int yyerror(const char *s);

%}

%token NOMBRE
%left '+' '-'
%left '*' '/'

%%

expression:
    expression '+' expression { $$ = $1 + $3; }
    | expression '-' expression { $$ = $1 - $3; }
    | expression '*' expression { $$ = $1 * $3; }
    | expression '/' expression {
        if ($3 == 0) {
            yyerror("Division par zéro");
    ²          $$ = 0; // Ou une autre valeur par défaut
        } else {
            $$ = $1 / $3;
        }
    } 
    | '(' expression ')' { $$ = $2; }
    | NOMBRE { $$ = $1; }
    ;
%%