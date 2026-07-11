# frozen_string_literal: true
# Kernel#send (and #__send__)
p("hello".send(:upcase))
v321 = "hello".send(:upcase); p v321
p(5.send(:+, 3))
a322 = :length; b322 = "abcd"; p(b322.send(a322))
a323 = :length; b323 = "abcd"; v323 = b323.send(a323); p v323
p([1, 2, 3].send(:map) { |x| x * 2 })
p("hi".__send__(:reverse))
v324 = "hi".__send__(:reverse); p v324
class Priv325; private def sekret325; 7; end; end
p(Priv325.new.send(:sekret325))
a325 = Priv325.new; v325 = a325.send(:sekret325); p v325
# WONTFIX: See docs/limitations.md - non-literal `send` is supported for an explicit
# receiver only (static dispatch keyed on the receiver type); an implicit-self send
# with a variable name is a clean front-end reject ("AOT needs a compile-time-known name").
# def greet326(name) = "hi #{name}"
# a326 = :greet326; puts send(a326, "world")

# send reaches private and protected methods; a literal name with arguments and a block
class Vis330
  def pub330; :pub; end
  private def priv330; :priv; end
  protected def prot330; :prot; end
end
a330 = Vis330.new
p(a330.send(:pub330))
p(a330.send(:priv330))
p(a330.__send__(:prot330))
v330 = a330.send(:priv330); p v330
p([1, 2, 3].send(:reduce, 0) { |acc, x| acc + x })
v331 = [1, 2, 3].send(:reduce, 0) { |acc, x| acc + x }; p v331
p("abc".send(:sub, "a", "z"))
p(5.send(:between?, 1, 10))
v332 = "hi".send(:*, 2); p v332
