package com.jregistr.graphqllang.lexer;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;

import static com.intellij.psi.TokenType.BAD_CHARACTER;
import static com.intellij.psi.TokenType.WHITE_SPACE;
import static com.jregistr.graphqllang.psi.GraphQlTypes.*;

%%

%{
  public _GraphQlLexer() {
    this((java.io.Reader)null);
  }
%}

%public
%class _GraphQlLexer
%implements FlexLexer
%function advance
%type IElementType
%unicode

EOL=\R
WHITE_SPACE=\s+

DIRECTIVE_IDENTIFIER=@([_A-Za-z][_0-9A-Za-z]*)?
IDENTIFIER=[_A-Za-z][_0-9A-Za-z]*
NUMBER_LITERAL=-?[0-9]+(\.[0-9+])*
STRING_LITERAL=\".*\"
BOOLEAN_LITERAL=(true|false)
WHITE_SPACE=[ \t\n\x0B\f\r]+
SINGLE_LINE_COMMENT=#.*

%%
<YYINITIAL> {
  {WHITE_SPACE}               { return WHITE_SPACE; }

  "NOT_YET_IMPLEMENTED"       { return NOT_YET_IMPL; }
  "type"                      { return TYPE; }
  "input"                     { return INPUT; }
  "enum"                      { return ENUM; }
  "scalar"                    { return SCALAR; }
  "schema"                    { return SCHEMA; }
  "union"                     { return UNION; }
  "interface"                 { return INTERFACE; }
  "implements"                { return IMPLEMENTS; }
  "query"                     { return QUERY; }
  "fragment"                  { return FRAGMENT; }
  "("                         { return LEFT_PAREN; }
  ")"                         { return RIGHT_PAREN; }
  "{"                         { return LEFT_CURLY; }
  "}"                         { return RIGHT_CURLY; }
  "["                         { return LEFT_BRACKET; }
  "]"                         { return RIGHT_BRACKET; }
  ":"                         { return COLON; }
  ","                         { return COMMA; }
  "="                         { return EQUALS; }
  "|"                         { return PIPE; }
  "!"                         { return REQUIRED; }

  {DIRECTIVE_IDENTIFIER}      { return DIRECTIVE_IDENTIFIER; }
  {IDENTIFIER}                { return IDENTIFIER; }
  {NUMBER_LITERAL}            { return NUMBER_LITERAL; }
  {STRING_LITERAL}            { return STRING_LITERAL; }
  {BOOLEAN_LITERAL}           { return BOOLEAN_LITERAL; }
  {WHITE_SPACE}               { return WHITE_SPACE; }
  {SINGLE_LINE_COMMENT}       { return SINGLE_LINE_COMMENT; }

}

[^] { return BAD_CHARACTER; }
