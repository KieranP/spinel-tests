# frozen_string_literal: true
# Enumerator#dup
p([1, 2, 3].each.dup.class)
a037 = [1, 2, 3].each; b037 = a037.dup; p(b037.class)
a038 = [1, 2, 3].each; v038 = a038.dup; p(v038 == a038)
