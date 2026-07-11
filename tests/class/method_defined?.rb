# frozen_string_literal: true
class Animal001; def breathe; end; end
class Dog001 < Animal001; def bark; end; end

# Class#method_defined?
p(Dog001.method_defined?(:bark))
v001 = Dog001.method_defined?(:bark); p v001
p(Dog001.method_defined?(:breathe))
v002 = Dog001.method_defined?(:breathe); p v002
p(Dog001.method_defined?(:nope))
v003 = Dog001.method_defined?(:nope); p v003
p(Dog001.method_defined?(:object_id))
v004 = Dog001.method_defined?(:frozen?); p v004
# a variable-held class receiver is rejected before codegen
c001 = Dog001
p(c001.method_defined?(:bark))

# a module's method is defined on the including class, and on a subclass of it
module Inc001; def tag; "inc"; end; end
class Host001; include Inc001; end
class Kid001 < Host001; end
p(Host001.method_defined?(:tag))
p(Kid001.method_defined?(:tag))
v005 = Kid001.method_defined?(:tag); p v005

# a class that supers into an included module
class Sub001
  include Inc001
  def tag; "sub(" + super + ")"; end
end
p(Sub001.new.tag)
p(Sub001.method_defined?(:__inc_0_tag))
v006 = Sub001.method_defined?(:__inc_0_tag); p v006
