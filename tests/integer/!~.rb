# frozen_string_literal: true
# Integer#!~ (Kernel#!~, delegates to #=~)

p(5 !~ /x/)
a001 = 5; b001 = /x/; p(a001 !~ b001)
