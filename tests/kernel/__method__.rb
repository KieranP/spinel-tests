# frozen_string_literal: true
# Kernel#__method__
def m341; __method__; end
p(m341)
v341 = m341; p v341
p(__method__)

# __method__ answers the DEFINITION's name, through an alias too
class Meth342
  def m; __method__; end
  alias n m
  alias_method :o, :m
end
p(Meth342.new.m)
p(Meth342.new.n)
p(Meth342.new.o)
v342 = Meth342.new.n; p v342
