# frozen_string_literal: true
# Method#owner
def double(n) = n * 2

class Calc
  def add(n); n + 1; end
end

# bound method on a user object: owner is the defining class
calc001 = Calc.new; p calc001.method(:add).owner
calc002 = Calc.new; bm002 = calc002.method(:add); v002 = bm002.owner; p v002

# top-level method: owner is Object
p(method(:double).owner)
m003 = method(:double); v003 = m003.owner; p v003

# owner of a method inherited from a superclass
class Base010
  def foo(n); n; end
end
class Sub010 < Base010
  def bar(n); n; end
end
p(Sub010.new.method(:foo).owner)
v010 = Sub010.new.method(:foo).owner; p v010
p(Sub010.new.method(:bar).owner)
v011 = Sub010.new.method(:bar).owner; p v011

# owner of a method a module supplies names the including class, not the module
module Greet012
  def hi(n); "hi #{n}"; end
end
class Person012
  include Greet012
end
p(Person012.new.method(:hi).owner)
m012 = Person012.new.method(:hi); v012 = m012.owner; p v012
