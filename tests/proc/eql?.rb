# frozen_string_literal: true
# Proc#eql?
p(->(a) { a }.eql?(->(a) { a }))
a029 = ->(a) { a }; b029 = ->(a) { a }; p(a029.eql?(b029))
a030 = ->(a) { a }; v030 = a030.eql?(a030); p v030
