# frozen_string_literal: true
class C001
  @@x001 = 5
  def self.rm001; remove_class_variable(:@@x001); end
end

# Module#remove_class_variable is a documented by-design AOT limitation.
# WONTFIX: See docs/limitations.md - "By design — remove_method / undef_method / remove_class_variable"
# r001 = C001.rm001; p r001
# p(C001.class_variable_defined?(:@@x001))
# v001 = C001.class_variable_defined?(:@@x001); p v001
