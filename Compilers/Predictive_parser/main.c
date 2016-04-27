#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct tree
{
char prod[30];
}ptree[7][6];

char p_rule[][]={"S->aAB","S->bAB","A->XY","A->ZB","B->b","B->e","X->a","X->e","Y->c","Y->e","Z->d"};

char FIRST_S[]= {'a','b'};
char FIRST_A[]= {'a','c','d','e'};
char FIRST_B[]= {'b','e'};
char FIRST_X[]= {'a','e'};
char FIRST_Y[]= {'c','e'};
//char FIRST_Z[]= FOLLOW_Z[]= {'d'};
char FOLLOW_S[]= {'$'};
char FOLLOW_A[]= {'b','$'};
char FOLLOW_B[]= {'$'};
char FOLLOW_X[]= {'c','b','$'};
char FOLLOW_Y[]= {'b','$'};

int first(char nt)
{
int i;
    for(i=0;i<11;i++)
    {
        if(p_rule[i][0]=='S')
        {
            if(p_rule[i][3]=='a')
            {
                 strcpy(ptree[1][1].prod,p_rule[i]);
            }
        }
    }
}
int main()
{
int i,j;
    for(i=0; i<7; i++)
    {
        for(j=0;j<6;j++)
        {
            strcpy(ptree[i][j].prod,"0");
        }
    }



strcpy(ptree[0][1].prod,"a");
strcpy(ptree[0][2].prod,"b");
strcpy(ptree[0][3].prod,"c");
strcpy(ptree[0][4].prod,"d");
strcpy(ptree[0][5].prod,"$");
strcpy(ptree[1][0].prod,"A");
strcpy(ptree[2][0].prod,"B");
strcpy(ptree[3][0].prod,"C");
strcpy(ptree[4][0].prod,"X");
strcpy(ptree[5][0].prod,"Y");
strcpy(ptree[6][0].prod,"Z");

for(i=0; i<7; i++)
    {
        for(j=0;j<6;j++)
        {
            printf(" %s ",ptree[i][j].prod);
        }
        printf("\n");
    }


for(i=0;i<6;i++)
{
    first(p_rule[0][i]);
}
    return 0;
}
