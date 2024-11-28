#include <stdio.h>
#include "calculatrice.tab.h"

extern int yyparse();

int main() {
    printf("Bienvenue dans votre compilateur en français.\n");
    printf("Saisissez votre programme :\n");
    yyparse();
    return 0;
}
