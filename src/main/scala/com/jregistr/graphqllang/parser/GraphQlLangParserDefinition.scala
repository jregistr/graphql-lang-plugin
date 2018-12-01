package com.jregistr.graphqllang.parser

import com.intellij.lang.{ASTNode, ParserDefinition, PsiParser}
import com.intellij.lexer.Lexer
import com.intellij.openapi.project.Project
import com.intellij.psi.{FileViewProvider, PsiElement, PsiFile, TokenType}
import com.intellij.psi.tree.{IFileElementType, TokenSet}
import com.jregistr.graphqllang.langdef.{GraphQlLang, GraphQlLangLexerAdapter}
import com.jregistr.graphqllang.psi.{GraphQlFile, GraphQlTypes}

class GraphQlLangParserDefinition extends ParserDefinition {

  val CommentsTokenSet: TokenSet = TokenSet.create(GraphQlTypes.SINGLE_LINE_COMMENT)
  val StringTokensSet: TokenSet = TokenSet.create(GraphQlTypes.STRING_LITERAL)
  val WhitespaceTokenSet: TokenSet = TokenSet.create(TokenType.WHITE_SPACE)

  val File = new IFileElementType(GraphQlLang)

  override def getWhitespaceTokens: TokenSet = WhitespaceTokenSet

  override def createLexer(project: Project): Lexer = new GraphQlLangLexerAdapter

  override def createParser(project: Project): PsiParser = new GraphQlParser

  override def getFileNodeType: IFileElementType = File

  override def getCommentTokens: TokenSet = CommentsTokenSet

  override def getStringLiteralElements: TokenSet = StringTokensSet

  override def createElement(node: ASTNode): PsiElement = GraphQlTypes.Factory.createElement(node)

  override def createFile(viewProvider: FileViewProvider): PsiFile = new GraphQlFile(viewProvider)
}
