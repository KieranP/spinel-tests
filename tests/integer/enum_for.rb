# frozen_string_literal: true
# Integer#enum_for
p(3.enum_for(:times).to_a)
a001 = 3; p(a001.enum_for(:times).to_a)
a002 = 3; b002 = a002.enum_for(:times).to_a; p b002
