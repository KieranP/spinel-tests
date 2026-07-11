# frozen_string_literal: true
class Obj195
  def initialize; @x = 1; end
  def m2(a, b); a + b; end
end

# Object#method
p("hello".method(:upcase).call)
m110 = "hello".method(:upcase); p m110.call
p(5.method(:+).call(3))
m111 = 5.method(:+); v112 = m111.call(10); p v112
p("hello".method(:upcase).name)
v113 = "hello".method(:upcase).name; p v113
p([1, 2, 3].map(&2.method(:+)))
pr110 = 5.method(:+).to_proc; p pr110.call(4)
p(Obj195.new.method(:m2).arity)

class Ops195
  def add(a, b); a + b; end
  def tag(s); "<#{s}>"; end
  def solo; 7; end
end
# a Method captured from a user object, called with args
p(Ops195.new.method(:add).call(3, 4))
m120 = Ops195.new.method(:add); v120 = m120.call(5, 6); p v120
p(Ops195.new.method(:tag).call("hi"))
o120 = Ops195.new; m121 = o120.method(:tag); p m121.call("yo")
p(Ops195.new.method(:add).arity)
p(Ops195.new.method(:solo).arity)
p(Ops195.new.method(:add).name)
v121 = Ops195.new.method(:add).to_proc.call(8, 9); p v121
# Built-in Method#arity is wrong (counts the receiver, ignores optional/rest params):
p("hi".method(:upcase).arity)
p(5.method(:+).arity)
# Method#owner / #receiver are rejected before codegen:
p(5.method(:+).owner)
p("hi".method(:upcase).receiver)
