/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    PUBLIC = 258,                  /* PUBLIC  */
    CLASS = 259,                   /* CLASS  */
    VOID = 260,                    /* VOID  */
    PRINTLN = 261,                 /* PRINTLN  */
    IDENTIFIER = 262,              /* IDENTIFIER  */
    LBRACE = 263,                  /* LBRACE  */
    RBRACE = 264,                  /* RBRACE  */
    LPAREN = 265,                  /* LPAREN  */
    RPAREN = 266,                  /* RPAREN  */
    SEMICOLON = 267,               /* SEMICOLON  */
    STRING_LITERAL = 268,          /* STRING_LITERAL  */
    INT = 269,                     /* INT  */
    CHAR = 270,                    /* CHAR  */
    ASSIGNMENT = 271,              /* ASSIGNMENT  */
    DOUBLE = 272,                  /* DOUBLE  */
    BOOLEAN = 273,                 /* BOOLEAN  */
    STRING = 274,                  /* STRING  */
    PRIVATE = 275,                 /* PRIVATE  */
    NEW = 276,                     /* NEW  */
    PLUS = 277,                    /* PLUS  */
    DIV = 278,                     /* DIV  */
    MINUS = 279,                   /* MINUS  */
    MULT = 280,                    /* MULT  */
    NUMBER = 281,                  /* NUMBER  */
    DO = 282,                      /* DO  */
    WHILE = 283,                   /* WHILE  */
    AND = 284,                     /* AND  */
    OR = 285,                      /* OR  */
    GREATER = 286,                 /* GREATER  */
    LESS = 287,                    /* LESS  */
    EQUAL = 288,                   /* EQUAL  */
    NOTEQUAL = 289,                /* NOTEQUAL  */
    GTEQ = 290,                    /* GTEQ  */
    LTEQ = 291,                    /* LTEQ  */
    FOR = 292,                     /* FOR  */
    NOT = 293,                     /* NOT  */
    IF = 294,                      /* IF  */
    ELSE = 295,                    /* ELSE  */
    ELSEIF = 296,                  /* ELSEIF  */
    SWITCH = 297,                  /* SWITCH  */
    CASE = 298,                    /* CASE  */
    DEFAULT = 299,                 /* DEFAULT  */
    COLON = 300,                   /* COLON  */
    COMMA = 301,                   /* COMMA  */
    PRINT = 302,                   /* PRINT  */
    RETURN = 303,                  /* RETURN  */
    BREAK = 304,                   /* BREAK  */
    COMMENTS = 305                 /* COMMENTS  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
