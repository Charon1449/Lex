%{ 
#include<stdio.h> 
#include<string.h>

char replace_with [] = "1CS"; 
char replace_SIQ [] ="2CSSIQ"; 
char replace_SIL [] ="2CSSIL";
%} 
  
%% 
[a-zA-Z0-9]+  ((strcmp(yytext, replace_SIQ)==0) | (strcmp(yytext, replace_SIL)==0)) ? fprintf(yyout, "%s", replace_with) : fprintf(yyout, "%s", yytext); 
.             fprintf(yyout, "%s", yytext); 
%% 
  
int yywrap() 
{ 
    return 1; 
} 
  
int main() 
{ 
    extern FILE *yyin, *yyout; 
    yyin=fopen("input.txt", "r"); 
    yyout=fopen("output.txt", "w"); 
    yylex(); 
} 


