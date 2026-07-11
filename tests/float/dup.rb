# frozen_string_literal: true
# Float#dup
p(1.5.dup.class)
a037 = 1.5; b037 = a037.dup; p(b037.class)
a038 = 1.5; v038 = a038.dup; p(v038 == a038)
