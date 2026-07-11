# frozen_string_literal: true
class C001
  def a; end
  protected def b; end
end

# Class#protected_method_defined?
p(C001.protected_method_defined?(:b))
v001 = C001.protected_method_defined?(:b); p v001
p(C001.protected_method_defined?(:a))
v002 = C001.protected_method_defined?(:a); p v002
p(C001.protected_method_defined?(:nope))
v003 = C001.protected_method_defined?(:nope); p v003
