%{
#include <stdio.h>
%}

%token NOMBRE
%%
expression:
    expression '+' expression
    | expression '-' expression
    | expression '*' expression
    | expression '/' expression
    | '(' expression ')'
    | NOMBRE
    ;
%%

int yyerror(void)
{ fprintf(stderr, "erreur de syntaxe\n"); return 1;}