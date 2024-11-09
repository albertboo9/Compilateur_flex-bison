#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s) {
    fprintf(stderr, "Erreur de syntaxe: %s\n", s);
    exit(1);
}
int main() {
    yyparse();
}