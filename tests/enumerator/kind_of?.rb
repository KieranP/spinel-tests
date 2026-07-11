# frozen_string_literal: true
# Enumerator#kind_of?
p([1, 2, 3].each.kind_of?(Enumerator))
p([1, 2, 3].each.kind_of?(Object))
p([1, 2, 3].each.kind_of?(String))
a016 = [1, 2, 3].each; p(a016.kind_of?(Enumerator))
a017 = [1, 2, 3].each; v017 = a017.kind_of?(String); p v017
