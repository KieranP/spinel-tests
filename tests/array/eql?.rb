# frozen_string_literal: true
# Array#eql?
p([1, 2, 3].eql?([1, 2, 3]))
a029 = [1, 2, 3]; b029 = [1, 2, 3]; p(a029.eql?(b029))
a030 = [1, 2, 3]; v030 = a030.eql?(a030); p v030
