/*fichier calc.c */
#include <stdio.h>
#include "calc.tab.h" // 

int main(void)
{
    yyparse();
    return 0;
}