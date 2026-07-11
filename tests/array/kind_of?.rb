# frozen_string_literal: true
# Array#kind_of?
p([1, 2, 3].kind_of?(Array))
p([1, 2, 3].kind_of?(Object))
p([1, 2, 3].kind_of?(String))
a016 = [1, 2, 3]; p(a016.kind_of?(Array))
a017 = [1, 2, 3]; v017 = a017.kind_of?(String); p v017
