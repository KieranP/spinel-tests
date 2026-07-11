# frozen_string_literal: true
# TrueClass#dup
p(true.dup.class)
a037 = true; b037 = a037.dup; p(b037.class)
a038 = true; v038 = a038.dup; p(v038 == a038)

# FalseClass#dup
p(false.dup.class)
a082 = false; b082 = a082.dup; p(b082.class)
a083 = false; v083 = a083.dup; p(v083 == a083)
