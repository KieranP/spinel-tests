# frozen_string_literal: true
# String#instance_of?
p("abc".instance_of?(String))
p("abc".instance_of?(Array))
a018 = "abc"; p(a018.instance_of?(String))
a019 = "abc"; v019 = a019.instance_of?(Array); p v019
