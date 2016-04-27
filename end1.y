%{
#include <stdio.h>
#include <math.h>
#include <string.h>

int regs[26];
int base;
char temp='@';
char code[10][4]={{' ',' ',' ',' '},
                   {' ',' ',' ',' '},
                   {' ',' ',' ',' '},
                   {' ',' ',' ',' '},
                   {' ',' ',' ',' '},
                   {' ',' ',' ',' '},
                   {' ',' ',' ',' '},
                   {' ',' ',' ',' '},
                   {' ',' ',' ',' '},
                   {' ',' ',' ',' '}};
//0th index=A,B...(e.g A = id1 op id2), 1st index=id1, 2nd index=op, 3rd index=right

int insert(char id1, char op, char id2)
{
int i=0;
temp++;
 while(code[i][0]!=' ')
{
  if(code[i][1]==id1 && code[i][2]==op && code[i][3]==id2)
	{
	 return temp;
	}
i++;
}

code[i][0]=temp;
code[i][1]=id1;
code[i][2]=op;
code[i][3]=id2;
return temp;

}

void display()
{
int i=0;
printf("Note: RR:Resultant Register\nR1:Register for First_Id\nOP:Operator\nR2:Register for Second_Id\n\n\n");
printf("RR\tR1\tOP\tR2\n");
 while(code[i][0]!=' ')
	{
	printf("%c\t%c\t%c\t%c\n",code[i][0],code[i][1],code[i][2],code[i][3]); i++;
	}
}


%}

%start list
%token id

%left '+'
%left '*'


%%   /* beginning of rules section */

list:                       /*empty */
         |
        list S '\n'
         |
        list error '\n'
         {
           yyerrok;
         }
         ;

S	:id '=' E
	{
	  insert($1,'=',$3);
          display();
	int i;
	temp='@';
	for(i=0;i<10;i++)
	{
	code[i][0]=code[i][1]=code[i][2]=code[i][3]=' ';
	}
	};

E	:/*id '[' E ']'
	{
	
	}*/|E '+' E
	{
	printf("E+E");
	  $$=insert($1,'+',$3);
	}
	|E '*' E
	{
	printf("E*E");
	$$=insert($1,'*',$3);
	}| 
	id;
%%
main()
{
 return(yyparse());
}

yyerror(s)
char *s;
{
  fprintf(stderr, "error:%s\n",s);
}

yywrap()
{
  return(1);
}


