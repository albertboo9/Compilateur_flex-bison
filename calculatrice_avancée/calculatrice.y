%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_VARIABLES 100

typedef struct {
    char name[32];
    int value;
} Variable;

Variable variables[MAX_VARIABLES];
int var_count = 0;

int find_variable(const char *name) {
    for (int i = 0; i < var_count; i++) {
        if (strcmp(variables[i].name, name) == 0) {
            return i;
        }
    }
    return -1;
}

void set_variable(const char *name, int value) {
    int index = find_variable(name);
    if (index != -1) {
        variables[index].value = value; // Mise à jour
    } else {
        if (var_count < MAX_VARIABLES) {
            strcpy(variables[var_count].name, name);
            variables[var_count].value = value;
            var_count++;
        } else {
            fprintf(stderr, "Erreur : Nombre maximal de variables atteint (%d)\n", MAX_VARIABLES);
            exit(EXIT_FAILURE);
        }
    }
}

int get_variable(const char *name) {
    int index = find_variable(name);
    if (index != -1) {
        return variables[index].value;
    } else {
        fprintf(stderr, "Erreur : Variable '%s' non déclarée\n", name);
        exit(EXIT_FAILURE);
    }
}


%}

%token NOMBRE IDENTIFIANT
%token SI SINON TANTQUE AFFICHER LIRE

%left '+' '-'
%left '*' '/'

%start programme

%%

programme:
    programme instruction
    | /* vide */
    ;

instruction:
    expression ';' { printf("Résultat : %d\n", $1); }
    | IDENTIFIANT '=' expression ';' { set_variable($1, $3); }
    | AFFICHER '(' expression ')' ';' { printf("%d\n", $3); }
    | LIRE '(' IDENTIFIANT ')' ';' {
        int input_val;
        printf("Entrez une valeur pour %s : ", $3);
        scanf("%d", &input_val);
        set_variable($3, input_val);
    }
    |    SI '(' condition ')' '{' programme '}' SINON '{' programme '}' {
        if ($3) {
            $$ = $6; // Exécute le bloc "si"
        } else {
            $$ = $10; // Exécute le bloc "sinon"
        }
    }
    | TANTQUE '(' condition ')' '{' programme '}' { while($3) {
        $$ = $6;
    } }
    ;

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
    | IDENTIFIANT { $$ = get_variable($1); }
    | NOMBRE { $$ = $1; }
    ;

condition:
    expression '>' expression { $$ = $1 > $3; }
    | expression '<' expression { $$ = $1 < $3; }
    | expression "==" expression { $$ = $1 == $3; }
    ;

%%

int yyerror(const char *s)
{
    fprintf(stderr, "Erreur de syntaxe : %s\n", s);
    return 1;
}
