#include <stdio.h>
#include <stdlib.h>
#include<string.h>

struct node
{
    int index;
    char id[30];
} sym[50];

void check(char typ[],char id[]);
int Exists(char arr[],int);
void getNextToken(char temp[]);

int x=1;
int main()
{
    FILE *fp;
    char ch,temp[300];
    int i=0;
    fp=fopen("read.txt","r");
    if(fp==NULL)
    {
        perror("Error while opening the file!!\n");
        exit(EXIT_FAILURE);
    }
    else
    {
        while((ch=fgetc(fp))!=EOF)
        {
            temp[i]=ch;
            i++;

        }
        temp[i]='\0';
        fclose(fp);
        getNextToken(temp);
        printf("\n");

        return 0;
    }
}


void getNextToken(char temp[])
{
    char id[30],num[30];
    int state=0,idCount,numCount;
    int j=0;
    while(temp[j]!='\0')
    {
        switch(state)
        {
        case 0:



            if(temp[j]==' ' || temp[j]=='\n')
            {
                printf("space!!\n\n");
                j++;
            }
            else if (isalpha(temp[j]))
            {
                idCount=0;
                // printf("passing to case 1:\n");
                state=1;
                break;


            }
            else if (isdigit(temp[j]))
            {
                numCount=0;
                // printf("passing to case 2:\n");
                state=2;
                break;

            }
            else if(temp[j]=='+' || temp[j]=='*' || temp[j]=='=' || temp[j]=='-' || temp[j]=='\\' || temp[j]==';')
            {
                printf("<%c>\n\n",temp[j++]);
                state = 0;
                break;
            }
            break;

        case 1:
            while(isalnum(temp[j]) || temp[j]=='_')
            {
                id[idCount++]=temp[j++];
                //printf("%c",id[idCount-1]);

            }
            id[idCount]='\0';
            check("id",id);
            state=0;
            break;
        case 2:
            while(isdigit(temp[j]))
            {
                num[numCount++]=temp[j++];
                //printf("%c",num[numCount-1]);
            }
            num[numCount]='\0';
            check("num",num);
            state=0;
            break;
        }

    }

}

void check(char typ[], char id[])
{
    int pos = Exists(id,x);
    if(pos==0)
    {
        sym[x-1].index = x;
        strcpy(sym[x-1].id,id);
        printf("<%s,%s,%d>\n\n",typ,sym[x-1].id,sym[x-1].index);
        x++;
    }
    else
    {
        printf("Already Exist!!\n<%s,%s,%d>\n\n",typ,id,pos);
    }
}

int Exists(char arr[],int cnt)
{
    int j=0;
    int pos = -1;
    for(j=0; j<cnt; j++)
    {
        if(strcmp(arr,sym[j].id)==0)
        {
            pos = j;
        }
    }
    return pos+1;
}

