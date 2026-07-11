# frozen_string_literal: true
# Range#dup
p((1..3).dup.class)
a037 = (1..3); b037 = a037.dup; p(b037.class)
a038 = (1..3); v038 = a038.dup; p(v038 == a038)
