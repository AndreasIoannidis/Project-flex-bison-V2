%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern FILE* yyin;
void yyerror(const char *s);
%}

%token PUBLIC CLASS VOID PRINTLN IDENTIFIER LBRACE RBRACE LPAREN RPAREN SEMICOLON STRING_LITERAL INT CHAR ASSIGNMENT DOUBLE BOOLEAN STRING PRIVATE NEW PLUS DIV MINUS MULT NUMBER 
%token DO WHILE AND OR GREATER LESS EQUAL NOTEQUAL GTEQ LTEQ FOR NOT IF ELSE ELSEIF SWITCH CASE DEFAULT COLON COMMA PRINT RETURN BREAK COMMENTS


%%

program : class_declaration | variable_declaration | object_creation | member_access | method_declaration | statement | assignment | do_while_loop | condition | for_loop | if_statement | switch_statement
        ;
//PART 2
variable_declaration : modifier data_type variable_list SEMICOLON
                     ;

variable_list : variable_initializer
              | variable_list COMMA variable_initializer
              ;

variable_initializer : IDENTIFIER ASSIGNMENT expression
                     | IDENTIFIER
                     ;

class_declaration : PUBLIC CLASS IDENTIFIER LBRACE method_declaration RBRACE
                   ;

method_declaration : PUBLIC VOID IDENTIFIER LPAREN RPAREN LBRACE statement RBRACE 
            | PRIVATE VOID IDENTIFIER LPAREN RPAREN LBRACE statement RBRACE 
            | PUBLIC VOID IDENTIFIER LPAREN RPAREN LBRACE statement RBRACE SEMICOLON 
            | PRIVATE VOID IDENTIFIER LPAREN RPAREN LBRACE statement RBRACE  SEMICOLON
            |
            ;

statement : IDENTIFIER '.' IDENTIFIER LPAREN STRING_LITERAL RPAREN SEMICOLON
          | PRINTLN LPAREN STRING_LITERAL RPAREN SEMICOLON 
          | IDENTIFIER 
          | PRINT LPAREN STRING_LITERAL RPAREN SEMICOLON
          | PRINT LPAREN STRING_LITERAL COMMA IDENTIFIER RPAREN SEMICOLON
          | if_statement
          | do_while_loop
          |  for_loop
          | switch_statement
          | object_creation
          | method_declaration
          | variable_declaration
          | RETURN expression SEMICOLON
          | BREAK SEMICOLON
          | COMMENTS
          |
          ;

assignment : IDENTIFIER ASSIGNMENT expression SEMICOLON 
           ;

expression : IDENTIFIER
           | NUMBER
           | expression PLUS expression
           | expression MINUS expression
           | expression MULT expression
           | expression DIV expression
           | LPAREN expression RPAREN
           | STRING_LITERAL
           ;

data_type : INT
          | CHAR
          | DOUBLE
          | STRING
          | BOOLEAN
          | modifier data_type
          ;

modifier : PUBLIC
         | PRIVATE
         | /* Κανένας modifier */
         ;

object_creation : IDENTIFIER IDENTIFIER ASSIGNMENT NEW IDENTIFIER LPAREN RPAREN SEMICOLON
                ;

member_access : IDENTIFIER '.' IDENTIFIER LPAREN RPAREN SEMICOLON
          | IDENTIFIER '.' IDENTIFIER SEMICOLON 
          ;
//DO WHILE
do_while_loop : DO LBRACE program RBRACE WHILE LPAREN condition RPAREN SEMICOLON 
              ;

condition : expression
          | expression comp_operator expression
          | LPAREN condition RPAREN
          | condition logical_operator condition
          ;

logical_operator : AND 
                 | OR 
                 |
                 ;
                
comp_operator : GREATER 
              | LESS
              | EQUAL 
              | NOTEQUAL 
              | GTEQ 
              | LTEQ 
              |
              ;

//FOR
for_loop : FOR LPAREN assignment_statement SEMICOLON condition SEMICOLON assignment_statement RPAREN LBRACE statement RBRACE
         ;

assignment_statement : IDENTIFIER ASSIGNMENT expression
                      ;

//IF
if_statement : IF LPAREN condition RPAREN LBRACE program RBRACE
             | IF LPAREN condition RPAREN LBRACE program RBRACE ELSE LBRACE program RBRACE
             | IF LPAREN condition RPAREN LBRACE program RBRACE ELSEIF LPAREN condition RPAREN LBRACE program RBRACE
             | if_statement ELSEIF LPAREN condition RPAREN LBRACE program RBRACE
             | if_statement ELSE LBRACE program RBRACE
             ;


//SWITCH
switch_statement :  SWITCH LPAREN condition RPAREN LBRACE switch_case default_case RBRACE
                 ;


switch_case : CASE condition COLON statement
            | switch_case CASE condition COLON statement
            ;

default_case : DEFAULT COLON statement
             ;

%%


void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE* input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening input file");
        return 1;
    }

    yyin = input_file;

    yyparse();

    fclose(input_file);
    return 0;
}