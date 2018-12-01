package com.jregistr.graphqllang.psi

import com.intellij.extapi.psi.ASTWrapperPsiElement
import com.intellij.lang.{ASTNode, Language}
import com.jregistr.graphqllang.langdef.GraphQlLang

class GraphQlPsiElement(astNode: ASTNode) extends ASTWrapperPsiElement(astNode) {

  override def getLanguage: Language = GraphQlLang
}
