# frozen_string_literal: true
class Animal001; def breathe; end; end
class Dog001 < Animal001; def bark; end; end

# Class#instance_methods
p(Dog001.instance_methods(false))
v001 = Dog001.instance_methods(false); p v001
p(Animal001.instance_methods(false))
v002 = Animal001.instance_methods(false); p v002
k003 = Dog001; p(k003.instance_methods(false))
k004 = Dog001; v004 = k004.instance_methods(false); p v004

# a class that overrides an included module's method and reaches it with super
module Inc001; def tag; "inc"; end; end
class Sub001
  include Inc001
  def tag; "sub(" + super + ")"; end
end
p(Sub001.new.tag)
p(Sub001.instance_methods(false))
v005 = Sub001.instance_methods(false); p v005
# The no-argument form enumerates inherited method names too; Spinel's DCE strips
# method names, so the full-ancestry method list is unavailable.
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(Dog001.instance_methods.include?(:bark))
