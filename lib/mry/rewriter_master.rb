module Mry
  class Rewriter_Master < YAMLRewriter::Rewriter
    define_rule ['Style/AccessorMethodName' => 'Naming/AccessorMethodName']
    define_rule ['Style/AsciiIdentifiers' => 'Naming/AsciiIdentifiers']
    define_rule ['Style/BinaryOperatorParameterName' => 'Naming/BinaryOperatorParameterName']
    define_rule ['Style/ClassAndModuleCamelCase' => 'Naming/ClassAndModuleCamelCase']
    define_rule ['Style/ConstantName' => 'Naming/ConstantName']
    define_rule ['Style/FileName' => 'Naming/FileName']
    define_rule ['Style/HeredocDelimiterCase' => 'Naming/HeredocDelimiterCase']
    define_rule ['Style/HeredocDelimiterNaming' => 'Naming/HeredocDelimiterNaming']
    define_rule ['Style/MethodName' => 'Naming/MethodName']
    define_rule ['Style/PredicateName' => 'Naming/PredicateName']
    define_rule ['Style/VariableName' => 'Naming/VariableName']
    define_rule ['Style/VariableNumber' => 'Naming/VariableNumber']
  end
end
