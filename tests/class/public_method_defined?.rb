# frozen_string_literal: true
class C001
  def a; end
  private def b; end
end

# Class#public_method_defined?
p(C001.public_method_defined?(:a))
v001 = C001.public_method_defined?(:a); p v001
p(C001.public_method_defined?(:b))
v002 = C001.public_method_defined?(:b); p v002
p(C001.public_method_defined?(:nope))
v003 = C001.public_method_defined?(:nope); p v003
# public methods inherited from Object/Kernel are missed (return false; CRuby: true)
p(C001.public_method_defined?(:object_id))
v004 = C001.public_method_defined?(:to_s); p v004
