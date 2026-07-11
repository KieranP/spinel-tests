# frozen_string_literal: true
# Integer#to_enum
p(5.to_enum(:times).to_a)
a001 = 5; p(a001.to_enum(:times).to_a)
a002 = 5; b002 = a002.to_enum(:times).to_a; p b002
