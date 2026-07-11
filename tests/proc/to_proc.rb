# frozen_string_literal: true
# Method#to_proc
m229 = 5.method(:+); pr229 = m229.to_proc; p(pr229.call(3))
a229 = 5.method(:+).to_proc.call(3); p(a229)
p([1, 2, 3].map(&:to_s))
# Method#to_proc — lambda-ness and arity
p(5.method(:+).to_proc.lambda?)
mp230 = 5.method(:+).to_proc; p(mp230.lambda?)
# Symbol#to_proc — direct call, then via a variable
up231 = :upcase.to_proc; p(up231.call("hi"))
v231 = :upcase.to_proc.call("hi"); p(v231)
p(:upcase.to_proc.lambda?)
# Symbol#to_proc arity is -2 in Ruby
p(:upcase.to_proc.arity)
v232 = :upcase.to_proc.arity; p(v232)
p(:+.to_proc.arity)

# Proc#to_proc — returns self
p(->(x) { x }.to_proc.call(3))
l240 = ->(x) { x }; p(l240.to_proc.call(3))
pr241 = proc { |x| x * 2 }; p(pr241.to_proc.call(3))
l242 = ->(x) { x }; v242 = l242.to_proc.arity; p(v242)
l243 = ->(x) { x * 2 }; p([1, 2].map(&l243.to_proc))
l244 = ->(x) { x }; p(l244.itself.call(3))
v244 = l244.itself.call(3); p(v244)

# Symbol#to_proc through map / inject / each_with_object
p(%w[a b].map(&:upcase))
v245 = %w[a b].map(&:upcase); p(v245)
p([[1, 2], [3]].map(&:size))
v246 = [[1, 2], [3]].map(&:size); p(v246)
p([1, 2, 3].inject(&:+))
v247 = [1, 2, 3].inject(&:+); p(v247)
p([1, 2, 3].map(&:to_s).inject(:+))
v248 = [1, 2, 3].map(&:to_s).inject(:+); p(v248)
p(%w[a b].each_with_object([]) { |s249, m249| m249 << s249.upcase })
# Method#to_proc used as a block and curried
def add250(a, b) = a + b
p([1, 2, 3].map(&5.method(:+)))
v250 = [1, 2, 3].map(&5.method(:+)); p(v250)
p(method(:add250).to_proc.curry[1][2])
v251 = method(:add250).to_proc.curry[1][2]; p(v251)
p(method(:add250).to_proc.arity)
