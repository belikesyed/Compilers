#include<iostream>
#include<string>
#include<stdlib>
#include<conio>
#include<ctype>
using namespace std;
typedef struct treenode *tree;
struct treenode
{
    char info;
    tree left;
    tree right;
};

static i = 0;
char nextsym(char input[]),next;
char input[10];

void main()
{
    tree root;
    int len;
    tree proc_e();
    void inorder(tree root);

// clrscr();
    cout<<"enter an expression :";
    cin>>input;
    len = strlen(input);
    next = nextsym(input);
    root = proc_e();
    if (len != i-1)
    {
        cout<<"error";
        getch();
        exit(0);
    }
    else
    {
        cout<<"its a valid expression\n";
        inorder(root);
    }
}

tree treebuild(char x,tree a,tree b)
{
    tree t;
    t = new treenode;
    t->info = x;
    t->left = a;
    t->right = b;

    return(t);
}

tree proc_e()
{
    tree a,b;
    tree proc_t();
    a = proc_t();
    while(next == '+'||next == '-' )
    {
        if(next == '+' )
        {
            next = nextsym(input);
            b = proc_t();
            a = treebuild('+',a,b);
        }
        else
        {
            next = nextsym(input);
            b = proc_t();
            a = treebuild('-',a,b);
        }

    }
    return(a);
}

tree proc_t()
{
    tree a,b;
    tree proc_v();
    a = proc_v();
    while(next == '*' || next == '/')
    {
        if(next == '*')
        {
            next = nextsym(input);
            b = proc_v();
            a = treebuild('*',a,b);
        }
        else
        {
            next = nextsym(input);
            b = proc_v();
            a = treebuild('/',a,b);
        }
    }
    return(a);
}

tree proc_v()
{
    tree a;

    if (isalpha(next))
        a = treebuild(next,NULL,NULL);
    else
    {
        cout<<"error";
        getch();
        exit(0);
    }
    next = nextsym(input);
    return(a);
}

char nextsym(char input[])
{
    i++;
    return input[i-1];
}

void inorder(tree t)
{
    if (t != NULL)
    {
        inorder(t->left);
        cout<<t->info<<"   ";
        inorder(t->right);
    }
}

/*************************************
              OUTPUT
*************************************


enter an expression :a+b*c+d
its a valid expression
a   +   b   *   c   +   d

enter an expression :a+b*+
error

**************************************/
