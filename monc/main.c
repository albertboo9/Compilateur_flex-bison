#include <stdio.h>

extern FILE* yyin;
extern int yyparse();

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Erreur : fichier source manquant\n");
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Erreur : impossible d'ouvrir le fichier %s\n", argv[1]);
        return 1;
    }

    yyparse();
    fclose(yyin);
    return 0;
}
