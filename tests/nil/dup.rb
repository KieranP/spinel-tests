# frozen_string_literal: true
# NilClass#dup
p(nil.dup.class)
a037 = nil; b037 = a037.dup; p(b037.class)
a038 = nil; v038 = a038.dup; p(v038 == a038)
