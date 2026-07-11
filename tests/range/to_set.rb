# frozen_string_literal: true
require "set"
# Range#to_set
p((1..5).to_set)
a001 = (1..5); p(a001.to_set)
a002 = (1..5); c002 = (a002.to_set); p c002
p((1..5).to_set.class)
p((1..3).to_set.include?(2))
