%{
/* need this for the call to atof() below */
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

struct node *getnode();
int i;
struct node
{
   int index;
   char id[100];
struct node *next; 
}*start;
 
void addName();
void displaylist();
%}

%x C_COMMENT


RELOP	 <|>|<=|>=|=|<>

%%

"if"|"then"|"else"|"printf"    		{printf( "A keyword: %s\n", yytext );}
[a-zA-Z]([a-zA-Z]|[0-9]|_)*        	{printf( "An identifier: %s\n", yytext ); printf("check\n");addName();}
[0-9][0-9]*(.[0-9]*)?(E[+-]?[0-9]*)?    {printf("A number: %s\n",yytext);}
{RELOP}   				{printf( "A relation operator: %s\n", yytext );}
[ \t\n]+         			 /* eat up whitespace */
"//".*         				 /* eat  */
"/*"            			 { BEGIN(C_COMMENT); }
<C_COMMENT>"*/"				 { BEGIN(INITIAL); }
<C_COMMENT>.   				 { }
[;]					/*eat*/
[.]					/*eat*/



%%

void addName()
{
start=NULL;
//struct node *head = NULL;
printf("addname %s", yytext);

struct node *temp = getnode();
strcpy(temp->id,yytext);

if(start==NULL)
{
	
	/*strcpy(start->id,temp->id);
	start->index=1;
	start->next=NULL;*/
	printf("inside start");
}
/*else
{
	struct node *temp1=start;
	while(temp1->next!=NULL)
	{
       		if(temp1->id==yytext)
		{
		   break;
		}
		else
		{
			temp1=temp1->next;
		}
		
	}
	if(temp1->next==NULL)
	{
		temp1->next=temp;
		temp->next=NULL;
		(temp->index)++;
	}
}*/
}

struct node *getnode()
{
    struct node *newnode;
    newnode=(struct node *)malloc(sizeof(struct node));
    return newnode;
};
void displaylist()
{
    struct node *temp=start;
    while(temp!=NULL)
    {
        printf("Id:%s  Index:%d",temp->id,temp->index);
        temp=temp->next;
    }

}

main( argc, argv )
    {
            yyin = fopen( "Input1.txt", "r" );
    yylex();
displaylist();
    }
