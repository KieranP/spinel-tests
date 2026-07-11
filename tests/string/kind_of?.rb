# frozen_string_literal: true
# String#kind_of?
p("abc".kind_of?(String))
p("abc".kind_of?(Object))
p("abc".kind_of?(Array))
a016 = "abc"; p(a016.kind_of?(String))
a017 = "abc"; v017 = a017.kind_of?(Array); p v017
