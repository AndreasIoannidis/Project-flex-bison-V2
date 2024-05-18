%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern FILE* yyin;
void yyerror(const char *s);
%}

%union {
    char *string;
    int number;
}

%token PUBLIC CLASS VOID PRINTLN IDENTIFIER LBRACE RBRACE LPAREN RPAREN SEMICOLON STRING_LITERAL INT CHAR ASSIGNMENT DOUBLE BOOLEAN STRING PRIVATE NEW PLUS DIV MINUS MULT NUMBER 
%token DO WHILE AND OR GREATER LESS EQUAL NOTEQUAL GTEQ LTEQ FOR NOT IF ELSE ELSEIF SWITCH CASE DEFAULT COLON COMMA PRINT RETURN BREAK COMMENTS DOT

%%

program:
    class_declaration_list 
    ;

class_declaration_list:
    class_declaration
    | class_declaration_list class_declaration
    ;

class_declaration:
    access_specifier CLASS IDENTIFIER LBRACE class_body RBRACE
    ;

class_body:
    | class_member_list
    ;

class_member_list:
    class_member
    | class_member_list class_member
    | method_definition
    ;

class_member:
    variable_declaration_list
    | object_creation
    | member_access
    | assignment_statement
    | do_while_loop
    | for_loop
    | if_statement
    | switch_statement
    | print_statement
    ;

do_while_loop:
    DO LBRACE statement_list RBRACE WHILE LPAREN expression RPAREN SEMICOLON
    ;

for_loop:
    FOR LPAREN assignment_statement SEMICOLON expression SEMICOLON assignment_statement RPAREN LBRACE statement_list RBRACE
    ;

if_statement:
    IF LPAREN expression RPAREN LBRACE statement_list RBRACE else_if_blocks else_block
    ;

else_if_blocks:
    /* empty */
    | else_if_blocks ELSEIF LPAREN expression RPAREN LBRACE statement_list RBRACE
    ;

else_block:
    /* empty */
    | ELSE LBRACE statement_list RBRACE
    ;

switch_statement:
    SWITCH LPAREN expression RPAREN LBRACE case_blocks default_block RBRACE
    ;

case_blocks:
    /* empty */
    | case_blocks CASE expression COLON  statement_list 
    ;

default_block:
    /* empty */
    | DEFAULT COLON  statement_list 
    ;

print_statement:
    PRINTLN LPAREN STRING_LITERAL RPAREN SEMICOLON
    | PRINTLN LPAREN STRING_LITERAL COMMA expression RPAREN SEMICOLON
    ;

method_definition:
    access_specifier type_specifier IDENTIFIER LPAREN parameter_list RPAREN LBRACE method_body RBRACE
    | access_specifier VOID IDENTIFIER LPAREN parameter_list RPAREN LBRACE method_body RBRACE
    ;

method_body:
   |  statement_list
    ;
statement: 
    | RETURN expression SEMICOLON
    | variable_declaration_list
    | object_creation
    | member_access
    | assignment_statement
    | do_while_loop
    | for_loop
    | if_statement
    | method_definition
    | method_call
    | switch_statement
    | BREAK SEMICOLON
    | print_statement
    | COMMENTS
    ;

statement_list:
    /* empty */
    | statement_list statement
    ;

assignment_statement:
    IDENTIFIER ASSIGNMENT expression SEMICOLON
    | IDENTIFIER ASSIGNMENT expression
    | type_specifier IDENTIFIER ASSIGNMENT expression
    ;

parameter_list:
    /* empty */
    | parameter_declaration
    | parameter_list COMMA parameter_declaration
    ;

parameter_declaration:
    type_specifier IDENTIFIER
    ;

member_access:
    IDENTIFIER DOT IDENTIFIER SEMICOLON
    ;

object_creation:
    IDENTIFIER IDENTIFIER ASSIGNMENT NEW IDENTIFIER LPAREN RPAREN SEMICOLON
    ;

access_specifier:
    PUBLIC
    | PRIVATE
    | VOID
    ;

variable_declaration_list:
    variable_declaration
    | variable_declaration_list variable_declaration
    ;

variable_declaration:
    type_specifier IDENTIFIER SEMICOLON 
    | access_specifier type_specifier IDENTIFIER SEMICOLON
    |  type_specifier IDENTIFIER ASSIGNMENT expression SEMICOLON 
    |  access_specifier type_specifier IDENTIFIER ASSIGNMENT expression SEMICOLON
    |  type_specifier IDENTIFIER ASSIGNMENT expression
    | type_specifier IDENTIFIER ASSIGNMENT expression COMMA IDENTIFIER ASSIGNMENT expression COMMA IDENTIFIER ASSIGNMENT expression SEMICOLON
    | type_specifier IDENTIFIER ASSIGNMENT expression COMMA IDENTIFIER ASSIGNMENT expression SEMICOLON
    | type_specifier IDENTIFIER ASSIGNMENT expression COMMA IDENTIFIER ASSIGNMENT expression COMMA IDENTIFIER ASSIGNMENT expression COMMA IDENTIFIER ASSIGNMENT expression SEMICOLON
    | type_specifier IDENTIFIER COMMA IDENTIFIER COMMA IDENTIFIER SEMICOLON
    | type_specifier IDENTIFIER COMMA IDENTIFIER COMMA IDENTIFIER COMMA IDENTIFIER SEMICOLON
    | type_specifier IDENTIFIER COMMA IDENTIFIER SEMICOLON

    ;

type_specifier:
    INT
    | CHAR
    | STRING
    | DOUBLE
    | BOOLEAN
    | VOID
    ;

number:
    NUMBER
    ;
expression:
    IDENTIFIER
    | NUMBER
    | expression PLUS expression
    | expression MINUS expression
    | expression MULT expression
    | expression DIV expression
    | LPAREN expression RPAREN
    | method_call
    | object_creation
    | logical_expression
    | STRING_LITERAL
    | assignment_statement
    ;

    logical_expression:
    expression GREATER expression
    | expression LESS expression
    | expression EQUAL expression
    | expression NOTEQUAL expression
    | expression GTEQ expression
    | expression LTEQ expression
    | logical_expression AND logical_expression
    | logical_expression OR logical_expression
    | NOT logical_expression
    ;

    method_call:
    IDENTIFIER LPAREN RPAREN
    | IDENTIFIER LPAREN expression RPAREN
    | IDENTIFIER LPAREN RPAREN SEMICOLON
    | IDENTIFIER LPAREN expression RPAREN SEMICOLON
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

 // Συνεχίζει την ανάλυση του κώδικα ακόμα και αν βρει καποιο λάθος
    


    fclose(input_file);
    return 0;
}
