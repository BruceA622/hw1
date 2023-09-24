%{
int time[4][2] = {0};
int column = 0;
%}

%%

\[[0-9]\]  { printf("new line\n"); }
[0-9]+     { if(time[column-1][0] == 0) time[column-1][0] = atoi(yytext); else time[column-1][1] = atoi(yytext);} 
\n         { printf("previous column cnt %d\n", column); column = 0; }
[ ]+       { column += 1; }

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[])
{
    yylex();
    for(int i =0;i<4;i++)
        printf("time %d, %d\n", time[i][0], time[i][1]);
}