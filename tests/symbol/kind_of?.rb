# frozen_string_literal: true
# Symbol#kind_of?
p(:abc.kind_of?(Symbol))
p(:abc.kind_of?(Object))
p(:abc.kind_of?(String))
a016 = :abc; p(a016.kind_of?(Symbol))
a017 = :abc; v017 = a017.kind_of?(String); p v017
