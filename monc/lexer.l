%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h" // Inclure le fichier d'en-tête généré par Bison

// Vous pouvez ajouter ici d'autres inclusions si nécessaire

%}

%%

"demarrer"   { return DEMARRER; }
"entier"     { return ENTIER; }
"afficher"   { return AFFICHER; }
"si"         { return SI; }
"sinon"      { return SINON; }
"pour"       { return POUR; }

\n           { return NEWLINE; }
[ \t]       { /* Ignorer les espaces */ }

[a-zA-Z_][a-zA-Z_0-9]* { yylval.str = strdup(yytext); return ID; } // Notez l'utilisation de yylval.str
[0-9]+              { yylval.num = atoi(yytext); return NOMBRE; } // Notez l'utilisation de yylval.num
[^\n]+              { yylval.str = strdup(yytext); return TEXTE; } // Pour les chaînes de caractères

.           { yyerror("Caractère inconnu"); } // Gérer les erreurs lexicales

%%

int yywrap() {
    return 1; // Indiquer la fin du fichier
}

void yyerror(const char *msg) {
    fprintf(stderr, "Erreur : %s\n", msg);
}

int yylex(){
    return 0;
}