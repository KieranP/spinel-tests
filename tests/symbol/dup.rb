# frozen_string_literal: true
# Symbol#dup
p(:abc.dup.class)
a037 = :abc; b037 = a037.dup; p(b037.class)
a038 = :abc; v038 = a038.dup; p(v038 == a038)
