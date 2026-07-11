# frozen_string_literal: true
# Proc#kind_of?
p(->(a) { a }.kind_of?(Proc))
p(->(a) { a }.kind_of?(Object))
p(->(a) { a }.kind_of?(String))
a016 = ->(a) { a }; p(a016.kind_of?(Proc))
a017 = ->(a) { a }; v017 = a017.kind_of?(String); p v017
