# frozen_string_literal: true
# Integer#kind_of?
p(5.kind_of?(Integer))
p(5.kind_of?(Object))
p(5.kind_of?(String))
a016 = 5; p(a016.kind_of?(Integer))
a017 = 5; v017 = a017.kind_of?(String); p v017
