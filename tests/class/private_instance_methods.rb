# frozen_string_literal: true
class C001
  def a; end
  private def b; end
end

# Class#private_instance_methods
p(C001.private_instance_methods(false))
v001 = C001.private_instance_methods(false); p v001
