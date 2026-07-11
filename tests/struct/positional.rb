# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct — keyword_init-style positional
Pair = Struct.new(:first, :second)
pr1 = Pair.new("a", "b")
p([pr1.first, pr1.second])
v012 = [pr1.first, pr1.second]; p(v012)
