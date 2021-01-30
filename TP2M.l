%{
	#include<stdio.h>
	char *file1;
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
  	FILE *newfile_pointer;
  	char *file2="input1.txt";
  	newfile_pointer = fopen("input1.txt","r");
  	if(strcmp(file1,file2)!=0)
  	{
  		file1=file2;  
  		yyin = newfile_pointer;
    		return 0;
  	}
  	else
  		return 1;
}

int main()
{
	file1="input.txt";
  	yyin = fopen("input.txt","r");
  	yylex();
  	return 1;
}
