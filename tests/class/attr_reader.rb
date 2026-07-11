# frozen_string_literal: true
class C001
  attr_reader :y
  def initialize; @y = 3; end
end

# Class#attr_reader (declarative, in class body)
o001 = C001.new
p(o001.y)
v001 = o001.y; p v001

# a reader is inherited, and readable from another instance method of the class
class Base001
  attr_reader :n
  def initialize(n); @n = n; end
  def doubled; n * 2; end
end
class Sub001 < Base001; def tripled; n * 3; end; end
p(Base001.new(4).n)
v002 = Base001.new(4).doubled; p v002
p(Sub001.new(5).n)
p(Sub001.new(5).tripled)
v003 = Sub001.new(5).tripled; p v003

# a reader read with an explicit receiver from inside a Proc built in a method
class SelfQual001
  attr_reader :factor
  def initialize(f); @factor = f; end
  def make; ->(v) { v * self.factor }; end
end
p(SelfQual001.new(3).make.call(2))
v004 = SelfQual001.new(4).make; p v004.call(2)

# the same read WITHOUT a receiver
class Implicit001
  attr_reader :factor
  def initialize(f); @factor = f; end
  def make; ->(v) { v * factor }; end
end
p(Implicit001.new(3).make.call(2))
