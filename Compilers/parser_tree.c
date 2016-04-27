#include <string.h>
#include<stdio.h>

struct node
{
   char ls[10];
   char rs[10]; 
}list[10];


int main()
{
    FILE *fp;
    char ch[]="";
    int i=0;
    fp=fopen("production.txt","r");
    if(fp==NULL)
    {
        perror("Error while opening the file!!\n");
        exit(EXIT_FAILURE);
    }
    else
    {
        while((ch=fgets(fp))!=EOF)
        {
          if(ch>=65 && ch<=90 && strlen(ch)==1)
	     {
		list[i].ls=ch;
	     }
	  else if(ch
        }
        

        fclose(fp);
        getNextToken(temp);
        printf("\n");

        return 0;
    }
}

