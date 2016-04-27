%{
 
#include <stdio.h>
#include "y.tab.h"
int c;
extern int yylval;
%}

%%

" "	{}

[a-z]     {
            c = yytext[0];
            yylval = c;
            return(id);
          }

[^0-1\b]    {
                 c = yytext[0];
                 return(c);
               }
%%
