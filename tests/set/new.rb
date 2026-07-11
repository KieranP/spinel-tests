# frozen_string_literal: true
require 'set'

# Set.new
p(Set.new([1, 2, 3]) { |x| x * 10 }.to_a.sort)
a224 = Set.new([1, 2, 3]) { |x| x * 10 }; p(a224.to_a.sort)
p(Set.new([1, 2, 3]).to_a.sort)
b224 = Set.new([1, 2, 3]); p(b224.to_a.sort)

# empty Set.new
p(Set.new.to_a)
c224 = Set.new; p(c224.empty?)

# String elements with dedup
p(Set.new(["a", "b", "b"]).to_a.sort)
d224 = Set.new(["x", "y"]) { |s| s.upcase }; p(d224.to_a.sort)

# Symbol elements
e224 = Set.new([:a, :b, :a]); p(e224.to_a.sort)

# non-enumerable argument raises ArgumentError
r224 = (Set.new(5) rescue $!.class); p r224

# Range argument
r225 = (Set.new(1..3).to_a.sort rescue $!.class); p r225
p(Set.new(1..3) { |x| x * 2 }.to_a.sort)

# Enumerator argument
r226 = (Set.new([1, 2].each).to_a.sort rescue $!.class); p r226

# Set argument, Hash argument
p(Set.new(Set[1, 2]).to_a.sort)
f224 = Set.new({ a: 1 }); p(f224.to_a)

# Float and nil elements
g224 = Set.new([1.5, 1.5, nil]); p(g224.size)
# undeclared locals inside the bundled set.rb, so the file cannot be compiled
s044 = Set.new([1, 2]); p(Set.new(s044.map { |x044| x044 + 1 }).to_a)
s045 = Set.new([1, 2]); v045 = Set.new(s045.map { |x045| x045 + 1 }); p v045.to_a
