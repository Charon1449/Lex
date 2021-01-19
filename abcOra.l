%{
int matched = 0;
%}

%%
(ab)*c|a { matched = 1; printf("Expression matched | lexeme : %s\n",yytext) ;}
\n {printf("\n");}
. { matched = 0; printf("Not matched \n") ; }
%%

int yywrap(void){} 

void main(int argc, char **argv)
{
yylex();
} 
