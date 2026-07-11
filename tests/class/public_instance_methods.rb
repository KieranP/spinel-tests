# frozen_string_literal: true
class C001
  def a; end
  private def b; end
end

# Class#public_instance_methods
p(C001.public_instance_methods(false))
v001 = C001.public_instance_methods(false); p v001

# a class that supers into an included module
module Inc001; def tag; "inc"; end; end
class Sub001
  include Inc001
  def tag; "sub(" + super + ")"; end
end
p(Sub001.public_instance_methods(false))
v002 = Sub001.public_instance_methods(false); p v002
