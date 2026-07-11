# frozen_string_literal: true
# Method#dup
def dbl(n) = n * 2

class Calc
  def add(n); n + 1; end
end

# dup returns a Method
p(method(:dbl).dup.class)
m001 = method(:dbl); d001 = m001.dup; v001 = d001.class; p v001

# dup of a bound method on a user object re-invokes correctly
p(Calc.new.method(:add).dup.call(5))
bm002 = Calc.new.method(:add); d002 = bm002.dup; v002 = d002.call(5); p v002

# dup of a top-level method then #call returns garbage (0) instead of the real result
p(method(:dbl).dup.call(5))
m003 = method(:dbl); d003 = m003.dup; v003 = d003.call(5); p v003
