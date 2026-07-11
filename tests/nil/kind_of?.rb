# frozen_string_literal: true
# NilClass#kind_of?
p(nil.kind_of?(NilClass))
p(nil.kind_of?(Object))
p(nil.kind_of?(String))
a016 = nil; p(a016.kind_of?(NilClass))
a017 = nil; v017 = a017.kind_of?(String); p v017
