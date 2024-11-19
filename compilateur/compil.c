#include <stdio.h>
#include "compil.tab.h"
extern FILE* yyin;
extern int yyparse();

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage : %s code.txt\n", argv[0]);
        return 1;
    }

    FILE *fp = fopen(argv[1], "r");
    if (!fp) {
        perror("fopen");
        return 1;
    }

    yyin = fp;
    
    yyparse();

    fclose(fp);
    return 0;
}