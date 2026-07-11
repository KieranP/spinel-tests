# frozen_string_literal: true
# Method#clone
def dbl(n) = n * 2

class Calc
  def add(n); n + 1; end
end

# clone returns a Method
p(method(:dbl).clone.class)
m001 = method(:dbl); c001 = m001.clone; v001 = c001.class; p v001

# clone of a bound method on a user object re-invokes correctly
p(Calc.new.method(:add).clone.call(5))
bm002 = Calc.new.method(:add); c002 = bm002.clone; v002 = c002.call(5); p v002

# clone of a top-level method then #call returns garbage (0) instead of the real result
p(method(:dbl).clone.call(5))
m003 = method(:dbl); c003 = m003.clone; v003 = c003.call(5); p v003
