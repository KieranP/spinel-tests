# frozen_string_literal: true
# Method#arity
def double(n) = n * 2
def add(a, b) = a + b
def greet(name) = "hi #{name}"

class Calc
  def initialize(base); @base = base; end
  def add(n); @base + n; end
end

p(method(:double).arity)
m001 = method(:double); v001 = m001.arity; p v001

p(method(:add).arity)
m002 = method(:add); v002 = m002.arity; p v002

p(method(:greet).arity)
m003 = method(:greet); v003 = m003.arity; p v003

# bound method arity
calc004 = Calc.new(1); p calc004.method(:add).arity
calc005 = Calc.new(1); bm005 = calc005.method(:add); v005 = bm005.arity; p v005

# arity across every parameter shape
class Shapes
  def none; 0; end
  def opt(a, b = 1); a; end
  def rest(*a); a.size; end
  def req_rest(a, *b); a; end
  def kw(a, k: 1); a; end
  def kwreq(a, k:); a; end
  def kwrest(**kw); kw.size; end
  def blk(&b); 0; end
end
s010 = Shapes.new
p(s010.method(:none).arity)
v010 = s010.method(:none).arity; p v010
p(s010.method(:opt).arity)
v011 = s010.method(:opt).arity; p v011
p(s010.method(:rest).arity)
v012 = s010.method(:rest).arity; p v012
p(s010.method(:req_rest).arity)
v013 = s010.method(:req_rest).arity; p v013
p(s010.method(:kw).arity)
v014 = s010.method(:kw).arity; p v014
p(s010.method(:kwreq).arity)
v015 = s010.method(:kwreq).arity; p v015
p(s010.method(:kwrest).arity)
v016 = s010.method(:kwrest).arity; p v016
p(s010.method(:blk).arity)
v017 = s010.method(:blk).arity; p v017
