# frozen_string_literal: true
# Kernel#public_method
m060 = 1.public_method(:to_s)
p(m060.call)
v060 = 1.public_method(:to_s).call; p v060
p("hello".public_method(:upcase).call)
c060 = "hello".public_method(:length).call; p c060
