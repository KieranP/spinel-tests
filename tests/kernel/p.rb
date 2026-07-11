# frozen_string_literal: true
# Kernel#p with a custom #inspect
class Point127; def inspect = "#<Point>"; end
p Point127.new
c032 = Point127.new; p c032
p [Point127.new]
c033 = [Point127.new]; p c033

# Kernel#p as an expression
x129 = p(1, 2); p x129
p()
x130 = p(); p x130

# p's return value: nil for 0 args, the argument for 1, an Array for many
v131 = p(1); p v131
v132 = p(1, 2); p v132
v133 = p([1, 2]); p v133
v134 = p(nil); p v134
p("a", :b, 1.5, [1], { a: 1 })
