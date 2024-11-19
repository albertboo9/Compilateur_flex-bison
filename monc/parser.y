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

%token DEMARRER ENTIER AFFICHER SI SINON POUR TEXTE NEWLINE ID NOMBRE

%token <str> ID
%token <num> NOMBRE

%type <str> nom_variable
%type <str> valeur
%type <str> initialisation
%type <str> incrementation


%%

programme:
    DEMARRER '(' ')' '{' instruction '}' { printf("Fin du programme\n"); }
;

instruction:
    declaration ';' instruction
    | affectation ';' instruction
    | affichage ';' instruction
    | condition instruction
    | boucle instruction
    | /* vide */
;

declaration:
    ENTIER nom_variable ';'
;

affectation:
    nom_variable '=' valeur ';'
;

affichage:
    AFFICHER '(' TEXTE ')' ';'
;

condition:
    SI '(' condition ')' '{' instruction '}' SINON '{' instruction '}'
;

boucle:
    POUR '(' initialisation ';' condition ';' incrementation ')' '{' instruction '}'
;

nom_variable:
    ID { printf("Nom de variable : %s\n", $1); }
;

valeur:
    NOMBRE { printf("Valeur : %d\n", $1); }
    | ID { printf("Valeur : %s\n", $1); }
;

initialisation:
    ENTIER ID '=' NOMBRE { printf("Initialisation : %s = %d\n", $2, $4); }
;

incrementation:
    ID '+' '+' { printf("Incrementation : %s++\n", $1); }
    | ID '-' '-' { printf("Incrementation : %s--\n", $1); }
;



%%