%{
int numbers = 0;
int words = 0;
int carecters = 0;
int length = 0;
%}

%%
[0-9]+ {numbers ++; printf("numbers : %d | lexeme : %s\n",yyleng, yytext) ;}
([a-zA-Z])* {words ++;printf("words : %d | lexeme : %s\n",yyleng, yytext) ;}
\n {printf("\n");}

%%

int yywrap(void){} 

void main(int argc, char **argv)
{
yylex();
printf("length of given string is : %d", length); 
} 
