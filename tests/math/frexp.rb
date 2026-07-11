# frozen_string_literal: true
# Math.frexp

p(Math.frexp(8))
a001 = Math.frexp(8)
p a001

p(Math.frexp(0.75))
a002 = Math.frexp(0.75)
p a002.class
p a002.length
p a002[0]
p a002[1]

p(Math.frexp(0))
p(Math.frexp(1.0))
p(Math.frexp(1024))

b003 = 12.5
p(Math.frexp(b003))
c003 = Math.frexp(b003)
p c003

# special values
p(Math.frexp(Float::INFINITY))
p(Math.frexp(-1.0))
p(Math.frexp(0.0))

# negative and large-but-in-range
p(Math.frexp(-1234.5))
g010 = 1024
p(Math.frexp(g010))

# negative zero
p(Math.frexp(-0.0))

# element types: [fraction (Float), exponent (Integer)]
f020 = Math.frexp(8.0)
p(f020[0].class)
p(f020[1].class)
