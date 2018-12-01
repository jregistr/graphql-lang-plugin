package com.jregistr.graphqllang.psi

import com.intellij.extapi.psi.PsiFileBase
import com.intellij.openapi.fileTypes.FileType
import com.intellij.psi.FileViewProvider
import com.jregistr.graphqllang.langdef.{GraphQlLang, GraphQlLangFileType}

class GraphQlFile(viewProvider: FileViewProvider) extends PsiFileBase(viewProvider, GraphQlLang) {

  override def getFileType: FileType = GraphQlLangFileType

  override def toString: String = "GraphQL File"

}
