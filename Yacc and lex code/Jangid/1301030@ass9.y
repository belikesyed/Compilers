%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
struct DAG{
	char operator;
	int left,right;
}DAg[50];
 int top = -1 ;
int check(char, int, int);
int check_num(int);
int fill_DAG(char, int , int );
void display();

%}

%start list

%token DIGIT
%left '+'
%left '*'

%%                  

list:                       
         |
        list stat '\n'
         |
        list error '\n'
         {
           yyerrok;
         }
         ;

stat:    expr
         {
           display();
					 top = -1;
         }
         ;

expr:    expr '+' expr
         {
						$$ = fill_DAG('+',$1,$3);
         }
				 |
					expr '*' expr
				{
						$$ = fill_DAG('*',$1,$3);				
				}
				|
	 			num
				 {
						if(check_num($1)== -1)	   			
							$$ = fill_DAG('n',$1,-1);
						else
							$$ = check_num($1);
	 			 }
         ;

num:	num binary
	{
	  $$ = ($1*10) + $2;
	}
	|
	binary
	{
	  $$ = $1;
	}
	;

binary:  DIGIT
         {
           $$ = $1;
	 }
         ;

%%

void display()
{
	int j;
	printf("The DAG is :\nIndex\tOperator\tLeft\tRight\n");
	for(j=0;j<=top;j++)
	{
		if(DAg[j].operator != 'n')
		printf("%d\t%c\t\t%d\t%d\n",j,DAg[j].operator,DAg[j].left,DAg[j].right);	
		else
		printf("%d\tnum\t\t%d\n",j,DAg[j].left);		
	}
}

int fill_DAG(char op, int l, int r)
{
//printf("---->fill_DAG called with :%c		%d		%d\n",op,l,r);
int test = check(op,l,r) ;
if(test == -1)
{
	top++;
	DAg[top].operator = op;
	DAg[top].left = l;
	DAg[top].right = r; 
	return top;
}

return test;

}

int check(char op, int l, int r)
{
//printf("----> check called with : %c		%d		%d\n",op,l,r);
int j=0;
	for(j=0;j <= top; j++)
	{
		if((DAg[j].operator == op ) && (DAg[j].left == l) && (DAg[j].right == r))
		return j;
	}
return -1;
}

int check_num(int l)
{
//printf("to check : %d\n",l);
int j=0;
	for(j=0;j <= top; j++)
	{//	printf("%d	%d",j,DAg[j].left);
		if((DAg[j].operator == 'n' ) && (DAg[j].left == l))
		{//printf("\treturning : %d\n",j);
				return j;
		}
	}
//printf("\treturning -1\n");
return -1;

}
main()
{
	
	 
	return(yyparse());
}

yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}

yywrap()
{
  return(1);
}


