%{
 
#include <stdio.h>
#include "y.tab.h"
int c;
extern int yylval;
%}
%%

"vincent"|"mia"|"marsellus"|"jules"    {
           				 return(PN);
          				}
"a"|"the"|"her"|"his"   		{
            				return(Det);
          				}
"gun"|"robber"|"man"|"woman"		{
                 			return(N);
               				}
"who"|"that"				{
                 			return(Wh);
               				}
"to"					{
                 			return(P);
               				}
"died"|"fell"				{
                 			return(IV);
               				}
"shot"|"knew"|"loved"			{
                 			return(TV);
               				}
"handed"|"knew"				{
                 			return(DV);
               				}
"knew"|"belived"			{
                 			return(SV);
               				}

%%




