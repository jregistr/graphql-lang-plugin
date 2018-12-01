package com.jregistr.graphqllang.langdef;

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

IDENTIFIER=[_A-Za-z][_0-9A-Za-z]*
SINGLE_LINE_COMMENT=#.*

%%
<YYINITIAL> {
  {WHITE_SPACE}                      { return WHITE_SPACE; }

  "THIS_IS_NOT_YET_IMPLEMENTED"      { return NOT_YET_IMPL; }
  "type"                             { return TYPE; }
  "enum"                             { return ENUM; }
  "("                                { return LEFT_PAREN; }
  ")"                                { return RIGHT_PAREN; }
  "{"                                { return LEFT_CURLY; }
  "}"                                { return RIGHT_CURLY; }
  "["                                { return LEFT_BRACKET; }
  "]"                                { return RIGHT_BRACKET; }
  ":"                                { return COLON; }
  ","                                { return COMMA; }
  "!"                                { return NON_NULLABLE; }

  {IDENTIFIER}                       { return IDENTIFIER; }
  {SINGLE_LINE_COMMENT}              { return SINGLE_LINE_COMMENT; }

}

[^] { return BAD_CHARACTER; }
