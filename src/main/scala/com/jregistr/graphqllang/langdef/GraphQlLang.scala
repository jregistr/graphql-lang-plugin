package com.jregistr.graphqllang.langdef

import com.intellij.lang.Language
import com.intellij.lexer.FlexAdapter
import com.intellij.openapi.fileTypes.{FileTypeConsumer, FileTypeFactory, LanguageFileType}
import com.intellij.psi.tree.IElementType
import com.jregistr.graphqllang.lexer._GraphQlLexer
import com.jregistr.graphqllang.util.GraphQlLangIcons
import javax.swing.Icon

object GraphQlLang extends Language("GraphQL")

object GraphQlLangFileType extends LanguageFileType(GraphQlLang) {

  override val getName: String = "GraphQL File"

  override val getDescription: String = "GraphQL schema definition or query file."

  override val getDefaultExtension: String = "graphql"

  override val getIcon: Icon = GraphQlLangIcons.FileIcon

}

class GraphQlLangFileTypeFactory extends FileTypeFactory {

  override def createFileTypes(consumer: FileTypeConsumer): Unit = consumer.consume(GraphQlLangFileType)
}

class GraphQlLangElementType(debugName: String) extends IElementType(debugName, GraphQlLang)

class GraphQlLangTokenType(debugName: String) extends IElementType(debugName, GraphQlLang) {

  override def toString: String = s"GraphQlTokenType.${super.toString}"

}

class GraphQlLangLexerAdapter extends FlexAdapter(new _GraphQlLexer(null)) {

}