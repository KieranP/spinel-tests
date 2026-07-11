# frozen_string_literal: true
class C001
  def a; end
  protected def b; end
end

# Class#protected_instance_methods
p(C001.protected_instance_methods(false))
v001 = C001.protected_instance_methods(false); p v001
