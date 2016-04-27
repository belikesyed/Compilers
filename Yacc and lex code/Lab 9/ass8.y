%{
#include <stdio.h>
#include <math.h>
#include <string.h>
void DisplayList();
void ArrayGraph(char *,int,int);
int regs[26];
int base;
int n1,n2;
char DAG[20][3][20];
int j,l;
	for(j=0;j<20;j++)
	for(l=0;l<3;l++)
		strcpy(DAG[j][l],"0");


int pw(int ex)
{
int n=1,j;
 for(j=0;j<ex;j++)
	n*=2;
return n;
}

int toDecimal(int bits)
{
   int decimal=0, i=0, rem;
    while (bits!=0)
    {
        rem = bits%10;
        bits/=10;
        decimal += rem*pw(i);
        ++i;
    }
    return decimal;
}
void DisplayList()
{
	int i=0,j=0;
	for(i=0;i<6;i++)
		for(j=0;j<3;j++)
			printf("%s\t",DAG[i][j]);
		printf("\n");
}
void ArrayGraph(char *op, int num1, int num2)
{
int i=0,j=0;
char *str1, *str2;
sprintf(str1, "%d", num1);
sprintf(str2, "%d", num2);
 while(i<20)
 {
  if(strcmp(str1,DAG[i][1])!=0 && strcmp("num",DAG[i][0])==0)
  i++;
  else if(strcmp("num",DAG[i][0]!=0))
  i++;
  else if(strcmp("0",DAG[i][0])==0)
  {
  strcpy(DAG[i][0],"num");
  strcpy(DAG[i][1],str1);
  break;
  }
}
while(j<20)
{
if(strcmp(str2,DAG[j][1])!=0 && strcmp("num",DAG[j][0])==0)
j++;
else if(strcmp("num",DAG[j][0]!=0))
j++;
else if(strcmp("0",DAG[j][0])==0)
{
strcpy(DAG[j][0],"num");
strcpy(DAG[j][1],str2);
break;
}
}


%}

%start list

%token B


%left '+'
%left '*'
/*supplies precedence for unary minus */

%%   /* beginning of rules section */

list:                       /*empty */
         |
        list stat '\n'
         |
        list error '\n'
         {
           yyerrok;
         }
         ;

stat:    R
         {
           printf("Answer:%d\n",$1);
		DisplayList();
         };

R	:N
	{
	printf("Reached N,R:N=%d\n",$1);
	  $$=$1;
	}|
	R '*' R
	{
	printf("Reached R*N,N=%d\n",$3);
	n1=(toDecimal($1));
	n2=(toDecimal($3));
	  $$=n1 * n2;
	ArrayGraph("*",n1,n2);
	}|
	R '+' R
	{
	printf("Reached R+N,N=%d\n",$3);
	n1=(toDecimal($1));
	n2=(toDecimal($3));
	  $$=n1 + n2;
	ArrayGraph("+",n1,n2);
	};

N	:B{
	$$=$1;
	printf("Reached B,B=%d\n",$1);
	}
	|N B
	{
	$$=$1*10+$2;
	printf("Reached NB,N=%d\n",$$);
	};
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


