#include <stdio.h>
#include "calc.tab.h"

extern int yyparse();

int main() {
    printf("Saisissez une expression arithmétique :\n");
    yyparse();
    return 0;
}