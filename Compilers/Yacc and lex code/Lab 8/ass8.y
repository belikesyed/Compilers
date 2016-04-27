%{
#include <stdio.h>
#include <math.h>
#include <string.h>

int regs[26];
int base;
int n1,n2;

struct node{
struct node *left;
struct node *right;
char val[30];
}*root=NULL;

struct node *getNode()
{
 struct node *newNode;
 newNode= (struct node *)(malloc(sizeof(struct node)));
 return newNode;
}


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


void tree(int lnod,  int rnod)
{

char str1[20],str2[20];
	sprintf(str1, "%d", lnod);
	sprintf(str2, "%d", rnod);
struct node *temp1=getNode();
struct node *temp3=getNode();
strcpy(temp1->val,"+");
strcpy(temp3->val,str2);
temp1->right=temp3;
temp3->left=temp3->right=NULL;

if(root==NULL)
{
struct node *temp2=getNode();
strcpy(temp2->val,str1);
temp2->left=temp2->right=NULL;
temp1->left=temp2;
root=temp1;
}

else
{
temp1->left=root;
root=temp1;
}

}

void inorder(struct node *head)
{

if(head!=NULL)
{
inorder(head->left);
printf("%s",head->val);
inorder(head->right);
}
}

void preorder(struct node *head)
{

if(head!=NULL)
{
printf("%s",head->val);
preorder(head->left);
preorder(head->right);
}
}

void postorder(struct node *head)
{

if(head!=NULL)
{

postorder(head->right);
postorder(head->left);
printf("%s",head->val);
}
}
%}

%start list

%token B


%left '+'
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
	printf("\nInorder:");
	inorder(root);
	printf("\nPreorder:");
	preorder(root);
	printf("\nPostorder:");
	postorder(root);
	root=NULL;
	printf("\n");
         };

R	:N
	{
	printf("Reached N,R:N=%d\n",$1);
	  $$=$1;
	}|
	R '+' N
	{
	printf("Reached R+N,N=%d\n",$3);
	n1=(toDecimal($1));
	n2=(toDecimal($3));
	  $$=n1 + n2;
	tree(n1,n2);
	
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


