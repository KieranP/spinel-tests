# frozen_string_literal: true
# Enumerator#==
p([1, 2, 3].each == [1, 2, 3].each)
a031 = [1, 2, 3].each; b031 = [1, 2, 3].each; p(a031 == b031)
a032 = [1, 2, 3].each; v032 = (a032 == a032); p v032
