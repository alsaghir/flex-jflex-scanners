%{
#include <string>
%}

%option noyywrap
reserved  if|else|int|return|void
letter    [A-Za-z]
id        ({letter}|#){letter}+
digit     [0-9]
number    {digit}+
ws        \n|\r|[ ]|\t
block     (''')(.*|{ws})*(''')
string    '.*'
line      (%.*\n)|(%.*\r\n)

%{
std::string x = "";
std::size_t f = 0;
%}

%%

{block}       {printf("<%s, %s>\n", "block_comment", yytext);}
{reserved}    {printf("<%s, %s>\n", "reserved", yytext);}
{id}          {printf("<%s, %s>\n", "identifier", yytext);}
{number}      {printf("<%s, %s>\n", "number", yytext);}
{ws}          {
                x = yytext;
                f = x.find("\n");if (f != std::string::npos) x.replace(f, std::string("\n").length(), "\\n");
                f = x.find("\t");if (f != std::string::npos) x.replace(f, std::string("\t").length(), "\\t");
                f = x.find("\r");if (f != std::string::npos) x.replace(f, std::string("\r").length(), "\\r");
                f = x.find(" ");if (f != std::string::npos) x.replace(f, std::string(" ").length(), "\\s");
                printf("<%s, %s>\n", "WS", x.c_str());
              }
{string}      {printf("<%s, %s>\n", "string", yytext);}
{line}        {printf("<%s, %s>\n", "line_comment", yytext);}

"("           {printf("<%s, %s>\n", "LPAREN", yytext);}
")"           {printf("<%s, %s>\n", "RPAREN", yytext);}
"{"           {printf("<%s, %s>\n", "LCYRLY", yytext);}
"}"           {printf("<%s, %s>\n", "RCURLY", yytext);}
"["           {printf("<%s, %s>\n", "LBRACKET", yytext);}
"]"           {printf("<%s, %s>\n", "RBRACKET", yytext);}
";"           {printf("<%s, %s>\n", "SEMI", yytext);}
","           {printf("<%s, %s>\n", "COMMA", yytext);}
"\+"           {printf("<%s, %s>\n", "PLUS", yytext);}
"-"           {printf("<%s, %s>\n", "MINUS", yytext);}
"\*\*"          {printf("<%s, %s>\n", "Power", yytext);}
"\*"           {printf("<%s, %s>\n", "TIEMS", yytext);}
"\/"           {printf("<%s, %s>\n", "OVER", yytext);}
"=="          {printf("<%s, %s>\n", "EQ", yytext);}
"="           {printf("<%s, %s>\n", "ASSIGN", yytext);}
"\<"           {printf("<%s, %s>\n", "LT", yytext);}
"\>"           {printf("<%s, %s>\n", "GT", yytext);}
"\<\>"          {printf("<%s, %s>\n", "NE", yytext);}
"\<="          {printf("<%s, %s>\n", "LE", yytext);}
"\>="          {printf("<%s, %s>\n", "GE", yytext);}
"@"           {printf("<%s, %s>\n", "at", yytext);}
"."           {printf("<%s, %s>\n", "ERROR", yytext);}

%%
int main(int argc, char *argv[]){
printf("Enter your Code :\n");
yylex();
printf("BYE");
return 0;
}
