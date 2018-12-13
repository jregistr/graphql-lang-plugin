package com.jregistr.graphqllang.lexer;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;

import static com.intellij.psi.TokenType.BAD_CHARACTER;
import static com.intellij.psi.TokenType.WHITE_SPACE;
import static com.jregistr.graphqllang.psi.GraphQlTokenTypes.*;

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

DIRECTIVE_IDENTIFIER=@(_?[A-Za-z][_0-9A-Za-z]*)
VARIABLE_IDENTIFIER=\$([_A-Za-z][_0-9A-Za-z]*)
IDENTIFIER=[_A-Za-z][_0-9A-Za-z]*
STRING_LITERAL=\".*\"
NUMBER_LITERAL=-?[0-9]+(\.[0-9]+)?
WHITE_SPACE=[ \t\n\x0B\f\r]+
SINGLE_LINE_COMMENT=#.*

%%
<YYINITIAL> {
  {WHITE_SPACE}               { return WHITE_SPACE; }

  "NOT_YET_IMPL"              { return NOT_IMPL; }
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
  "directive"                 { return DIRECTIVE; }
  "mutation"                  { return MUTATION; }
  "subscription"              { return SUBSCRIPTION; }
  "extend"                    { return EXTEND; }
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
  "&"                         { return AMPERSAND; }
  "..."                       { return FRAGMENT_DOTS; }
  "on"                        { return ON; }
  "UnionTypeDef"              { return UNIONTYPEDEF; }
  "ScalarTypeDef"             { return SCALARTYPEDEF; }
  "InputObjectTypeDef"        { return INPUTOBJECTTYPEDEF; }
  "ExtendObjectTypeDef"       { return EXTENDOBJECTTYPEDEF; }
  "ExtendScalarDef"           { return EXTENDSCALARDEF; }
  "ExtendInterfaceDef"        { return EXTENDINTERFACEDEF; }
  "ExtendUnionDef"            { return EXTENDUNIONDEF; }
  "ExtendEnumDef"             { return EXTENDENUMDEF; }
  "ExtendInputObjectDef"      { return EXTENDINPUTOBJECTDEF; }
  "OperationDef"              { return OPERATIONDEF; }
  "FragmentDef"               { return FRAGMENTDEF; }

  {DIRECTIVE_IDENTIFIER}      { return DIRECTIVE_IDENTIFIER; }
  {VARIABLE_IDENTIFIER}       { return VARIABLE_IDENTIFIER; }
  {IDENTIFIER}                { return IDENTIFIER; }
  {STRING_LITERAL}            { return STRING_LITERAL; }
  {NUMBER_LITERAL}            { return NUMBER_LITERAL; }
  {WHITE_SPACE}               { return WHITE_SPACE; }
  {SINGLE_LINE_COMMENT}       { return SINGLE_LINE_COMMENT; }

}

[^] { return BAD_CHARACTER; }
