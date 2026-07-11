# frozen_string_literal: true
# Symbol#eql?
p(:abc.eql?(:abc))
a029 = :abc; b029 = :abc; p(a029.eql?(b029))
a030 = :abc; v030 = a030.eql?(a030); p v030
