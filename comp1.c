#include <stdio.h>
#include <stdlib.h>
#include<string.h>
//void getNextToken();

int main()
{
    FILE *fp;
    char ch,temp[300];
    int cCount=0,i=0;
    fp=fopen("read.txt","r");
    if(fp==NULL)
    {
        perror("Error while opening the file.\n");
        exit(EXIT_FAILURE);
    }
    else
    {
        while((ch=fgetc(fp))!=EOF)
        {
            temp[i]=ch;
            //printf("%c-%d ",temp[i],i);
            i++;

        }
        temp[i]='\0';
        fclose(fp);

        printf("\n");
        char id[30],num[30];
        int state=0,idCount=0,numCount=0;
        int j=0,k=0,l=0;
        while(temp[j]!='\0')
        {
            switch(state)
            {
            case 0:

                if(temp[j]==' ' || temp[j]=='\n')
                {
                    printf("space!!\n");
                    j++;
                }
                else if (isalpha(temp[j]))
                {
                    printf("passing to case 1:\n");
                    state=1;
                    break;


                }
                else if (isdigit(temp[j]))
                {
                    printf("passing to case 2:\n");
                    state=2;
                    break;

                }
                else if(temp[j]=='+' || temp[j]=='*' || temp[j]=='=' || temp[j]=='-' || temp[j]=='\\' || temp[j]==';')
                {
                    printf("<%c>\n",temp[j++]);
                    state = 0;
                    break;
                }
                break;

            case 1:
                while(isalnum(temp[j]) || temp[j]=='_')
                {
                    id[idCount++]=temp[j++];
                    printf("%c",id[idCount-1]);

                }
                id[idCount]='\0';
printf("\n");
                state=0;
                break;
            case 2:
                while(isdigit(temp[j]))
                {
                    num[numCount++]=temp[j++];
                    printf("%c",num[numCount-1]);
                }
                num[numCount]='\0';
                printf("\n");
                state=0;
                break;
            }

        }
        return 0;
    }
}


/*void getNextToken()
{
    printf("check");
    int state=0,i=0,j=0,k=0;
    int idCount=1;
    char str1[10];
    while(1)
    {
        switch(state)
        {
        case 0:
            if(context[i]=" " || "\n")
            {
                i++;
            }
            else if(isalpha(context[i]))
            {
                state=1;
                printf("check");
            }
            else if(isdigit(context[i]))
            {
                state=3;
            }
            else
                break;
        case 1:
            while(isalnum_l(context[i]))
            {
                str1[j++]=context[i++];
            }
            for(k=0; k<j; k++)
            {
                printf("id=%c is %d ",str1[k],idCount++);
            }
            state=0;
            case 2: // It is a final state. Here you know that you have just scaned an indentifier.
                     lexem=string from lexem_begin_index to current possition-1.
                     check symbol table for the current lexem.
                     Return <id, syb_table_loc>.
             case 3: ........
        }
    }
}*/
