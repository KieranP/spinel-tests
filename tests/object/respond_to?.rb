# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
  private def sec195; 1; end
end

# Object#respond_to?
p("x".respond_to?(:upcase))
v051 = "x".respond_to?(:upcase); p v051
p(5.respond_to?(:upcase))
v052 = 5.respond_to?(:upcase); p v052
o122 = Obj195.new; p o122.respond_to?(:display)
v122 = Obj195.new.respond_to?(:yield_self); p v122
p(Obj195.new.respond_to?(:sec195))
p(Obj195.new.respond_to?(:sec195, true))
v053 = Obj195.new.respond_to?(:nope); p v053
p("x".respond_to?(:upcase, false))

module Greets195
  def hello; "hi"; end
end
class Parent195
  def pm; 1; end
end
class Child195 < Parent195
  include Greets195
  def cm; 2; end
  private def pvt; 3; end
end
c195 = Child195.new
p c195.respond_to?(:cm)
w195 = c195.respond_to?(:cm); p w195
p c195.respond_to?(:pm)
w196 = c195.respond_to?(:pm); p w196
p c195.respond_to?(:hello)
w197 = c195.respond_to?(:hello); p w197
p c195.respond_to?(:nope195)
w198 = c195.respond_to?(:nope195); p w198
p c195.respond_to?(:pvt)
p c195.respond_to?(:pvt, true)
w199 = c195.respond_to?(:pvt, true); p w199

# a class that overrides an included module's method and reaches it with super
module Inc196; def tag; "inc"; end; end
class Sub196
  include Inc196
  def tag; "sub(" + super + ")"; end
end
p Sub196.new.tag
p Sub196.new.respond_to?(:tag)
p Sub196.new.respond_to?(:__inc_0_tag)
w200 = Sub196.new.respond_to?(:__inc_0_tag); p w200
