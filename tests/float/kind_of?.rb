# frozen_string_literal: true
# Float#kind_of?
p(1.5.kind_of?(Float))
p(1.5.kind_of?(Object))
p(1.5.kind_of?(String))
a016 = 1.5; p(a016.kind_of?(Float))
a017 = 1.5; v017 = a017.kind_of?(String); p v017
