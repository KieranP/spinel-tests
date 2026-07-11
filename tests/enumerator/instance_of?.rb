# frozen_string_literal: true
# Enumerator#instance_of?
p([1, 2, 3].each.instance_of?(Enumerator))
p([1, 2, 3].each.instance_of?(String))
a018 = [1, 2, 3].each; p(a018.instance_of?(Enumerator))
a019 = [1, 2, 3].each; v019 = a019.instance_of?(String); p v019
