#include <stdio.h>
#include "calc.tab.h"

int main(int argc, char **argv) {
    if(yyparse()== 0){
        printf("ce mot est réconnue");
    };
    return 0;
}