# flex & jflex Scanners Generators Examples

Flex &amp; jFlex scanner generators for custom language

Compiler Project
Language: HAMADA Tany Khales

<b>LEXICAL CONVENTIONS</b>

1. Keywords If else int return void (reserved / lower case)
2. Identifiers  
ID = (Letter|#)(Letter)+  
Letter=[a-z][A-Z]
3. Numbers  
Num=digit+  
Digit=[0-9]
4. Strings ‘.*’
5. White space (blanks, newlines, and tabs)  
7.	Block Comments start and end with '''
8.	Line comment %


<b>Symbols:</b>  
\+ PLUS  
{ LCURLY  
= ASSIGN  
\- MINUS  
} RCURLY  
== EQ  
\* TIMES  
< LT  
; SEMI  
/ OVER  
<= LE  
( LPAREN  
** Power  
\> GT  
) RPAREN  
, COMMA  
\>= GE  
[ LBRACKET   
@ at  
<> NE  
]	RBRACKET  
