
%token NOMBRE /* liste des terminaux */
%%
expression: 
    expression '+' term
    | expression '-' term
    | term
    ;
term: 
    term '*' factor
    | term '/' factor
    | factor
    ;
factor: 
    '(' expression ')'
    | '-' factor
    | NOMBRE
    ;
%%

#include <stdio.h>
int yyerror(void) {
    fprintf(stderr, "erreur de syntaxe\n"); 
    return 1;
}