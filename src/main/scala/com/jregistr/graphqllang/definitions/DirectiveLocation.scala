package com.jregistr.graphqllang.definitions

sealed trait DirectiveLocation {
  val schemaValue: String
  require(schemaValue.toUpperCase == schemaValue)
}

sealed trait TypeSystemDirectiveLocation extends DirectiveLocation

case object Schema extends TypeSystemDirectiveLocation {
  override val schemaValue: String = "SCHEMA"
}

case object Scalar extends TypeSystemDirectiveLocation {
  override val schemaValue: String = "SCALAR"
}

case object Object extends TypeSystemDirectiveLocation {
  override val schemaValue: String = "OBJECT"
}

case object FieldDefinition extends TypeSystemDirectiveLocation {
  override val schemaValue: String = "FIELD_DEFINITION"
}

case object ArgumentDefinition extends TypeSystemDirectiveLocation {
  override val schemaValue: String = "ARGUMENT_DEFINITION"
}

case object Interface extends TypeSystemDirectiveLocation {
  override val schemaValue: String = "INTERFACE"
}

case object Union extends TypeSystemDirectiveLocation {
  override val schemaValue: String = "UNION"
}

case object Enum extends TypeSystemDirectiveLocation {
  override val schemaValue: String = "ENUM"
}

case object EnumValue extends TypeSystemDirectiveLocation {
  override val schemaValue: String = "ENUM_VALUE"
}

case object InputObject extends TypeSystemDirectiveLocation {
  override val schemaValue: String = "INPUT_OBJECT"
}

case object InputFieldDefinition extends TypeSystemDirectiveLocation {
  override val schemaValue: String = "INPUT_FIELD_DEFINITION"
}

/*Executable directive locations*/
sealed trait ExecutableDirectiveLocation extends DirectiveLocation

case object Query extends ExecutableDirectiveLocation {
  override val schemaValue: String = "QUERY"
}

case object Mutation extends ExecutableDirectiveLocation {
  override val schemaValue: String = "MUTATION"
}

case object Subscription extends ExecutableDirectiveLocation {
  override val schemaValue: String = "SUBSCRIPTION"
}

case object Field extends ExecutableDirectiveLocation {
  override val schemaValue: String = "FIELD"
}

case object FragmentDefinition extends ExecutableDirectiveLocation {
  override val schemaValue: String = "FRAGMENT_DEFINITION"
}

case object FragmentSpread extends ExecutableDirectiveLocation {
  override val schemaValue: String = "FRAGMENT_SPREAD"
}

case object InlineFragment extends ExecutableDirectiveLocation {
  override val schemaValue: String = "INLINE_FRAGMENT"
}

case object VariableDefinition extends ExecutableDirectiveLocation {
  override val schemaValue: String = "VARIABLE_DEFINITION"
}