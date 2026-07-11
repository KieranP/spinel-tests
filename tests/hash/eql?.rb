# frozen_string_literal: true
# Hash#eql?
p({ a: 1 }.eql?({ a: 1 }))
a029 = { a: 1 }; b029 = { a: 1 }; p(a029.eql?(b029))
a030 = { a: 1 }; v030 = a030.eql?(a030); p v030
