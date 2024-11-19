%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern int yylex();
extern void yyerror(const char *msg);
extern int yylineno;
%}

%token NOMBRE
%left '+' '-'
%left '*' '/';
%%

expression: 
    expression '+' expression {$$ = $1 + $3;}
    | expression '-' expression {$$ = $1 - $3;}
    | expression '*' expression {$$ = $1 * $3;}
    | expression '/' expression {$$ = $1 / $3;}
    | '(' expression ')' {$1;}
    | NOMBRE {$1;}
    ;
%%

int yyerror(void)
{ fprintf(stderr, "erreur de syntaxe\n"); return 1;}