# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#each
Coll141 = Struct.new(:x, :y)
Coll141.new(1, 2).each { |v| print v }; puts
v016 = Coll141.new(1, 2).each { |v| print v }; p(v016)
