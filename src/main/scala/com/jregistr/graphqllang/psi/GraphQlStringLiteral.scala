package com.jregistr.graphqllang.psi

import com.intellij.lang.ASTNode
import com.intellij.psi.PsiLiteral

class GraphQlStringLiteral(astNode: ASTNode) extends GraphQlPsiElement(astNode) with PsiLiteral {
  override def getValue: AnyRef = getText
}
