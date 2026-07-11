# frozen_string_literal: true
# Enumerator#eql?
p([1, 2, 3].each.eql?([1, 2, 3].each))
a029 = [1, 2, 3].each; b029 = [1, 2, 3].each; p(a029.eql?(b029))
a030 = [1, 2, 3].each; v030 = a030.eql?(a030); p v030
