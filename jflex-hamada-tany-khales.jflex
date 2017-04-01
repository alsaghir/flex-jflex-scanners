%%
%class hamadaLex
%standalone

reserved = if|else|int|return|void
letter   = [A-Za-z]
id       = ({letter}|#){letter}+
digit    = [0-9]
number   = {digit}+
ws       = \n|\r|\t|\s
block    = (''')(.*|{ws})*(''')
string   = '.*'
line     = (%.*\n)|(%.*\r\n)

%{
String x = "";
%}

%%
{block}       {System.out.printf("<%s, %s>\n", "block_comment", yytext());}
{reserved}    {System.out.printf("<%s, %s>\n", "reserved", yytext());}
{id}          {System.out.printf("<%s, %s>\n", "identifier", yytext());}
{number}      {System.out.printf("<%s, %s>\n", "number", yytext());}
{ws}          {x = yytext();x=x.replace("\n","\\n");x=x.replace("\t","\\t");x=x.replace("\r","\\r");System.out.printf("<%s, %s>\n", "ws", x);}
{string}      {System.out.printf("<%s, %s>\n", "string", yytext());}
{line}        {x = yytext();x=x.replace("\n","\\n");x=x.replace("\r","\\r");System.out.printf("<%s, %s>\n", "line_comment", x);}

/* separators */
\(           {System.out.printf("<%s, %s>\n", "LPAREN", yytext());}
\)           {System.out.printf("<%s, %s>\n", "RPAREN", yytext());}
\{           {System.out.printf("<%s, %s>\n", "LCYRLY", yytext());}
\}           {System.out.printf("<%s, %s>\n", "RCURLY", yytext());}
\[           {System.out.printf("<%s, %s>\n", "LBRACKET", yytext());}
\]           {System.out.printf("<%s, %s>\n", "RBRACKET", yytext());}
;           {System.out.printf("<%s, %s>\n", "SEMI", yytext());}
,           {System.out.printf("<%s, %s>\n", "COMMA", yytext());}
\+           {System.out.printf("<%s, %s>\n", "PLUS", yytext());}
-           {System.out.printf("<%s, %s>\n", "MINUS", yytext());}
\*\*          {System.out.printf("<%s, %s>\n", "Power", yytext());}
\*           {System.out.printf("<%s, %s>\n", "TIEMS", yytext());}
\/           {System.out.printf("<%s, %s>\n", "OVER", yytext());}
==          {System.out.printf("<%s, %s>\n", "EQ", yytext());}
=           {System.out.printf("<%s, %s>\n", "ASSIGN", yytext());}
\<           {System.out.printf("<%s, %s>\n", "LT", yytext());}
\>           {System.out.printf("<%s, %s>\n", "GT", yytext());}
\<\>          {System.out.printf("<%s, %s>\n", "NE", yytext());}
\<=          {System.out.printf("<%s, %s>\n", "LE", yytext());}
\>=          {System.out.printf("<%s, %s>\n", "GE", yytext());}
@           {System.out.printf("<%s, %s>\n", "at", yytext());}
.           {System.out.printf("<%s, %s>\n", "ERROR", yytext());}
