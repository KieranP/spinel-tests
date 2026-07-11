# frozen_string_literal: true
# Proc#==
p(->(a) { a } == ->(a) { a })
a031 = ->(a) { a }; b031 = ->(a) { a }; p(a031 == b031)
a032 = ->(a) { a }; v032 = (a032 == a032); p v032
