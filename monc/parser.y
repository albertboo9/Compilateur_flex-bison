%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern void yyerror(const char *msg);
extern int yylineno;

%}

%union {
    char* str;
    int num;
}

%token DEMARRER ENTIER AFFICHER SI SINON POUR NEWLINE 
%token <str> ID
%token <num> NOMBRE
%token <str> TEXTE


%left '+' '-'
%left '*' '/'

%%

programme:
    DEMARRER '(' ')' '{' instruction '}' { printf("Fin du programme\n"); }
;

instruction:
    ENTIER ID ';' { /* Ajouter la variable à la table des symboles */ }
    | ID '=' expression ';' { /* Vérifier les types et affecter la valeur */ }
    | AFFICHER '(' TEXTE ')' ';' { printf("%s\n", $3); }
    | SI '(' condition ')' '{' instruction '}' SINON '{' instruction '}'
    | POUR '(' ENTIER ID '=' NOMBRE ';' condition ';' ID '+' '+' ')' '{' instruction '}'
    | /* vide */
;

condition:
    expression '<' expression
    | expression '>' expression
    
;

expression:
    NOMBRE
    | ID
    | expression '+' expression
    | expression '-' expression
    | expression '*' expression
    | expression '/' expression
    | '(' expression ')'
;

%%

int yyerror(const char *msg) {
    fprintf(stderr, "Erreur à la ligne %d: %s\n", yylineno, msg);
    return 0;
}