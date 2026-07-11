# frozen_string_literal: true
require 'set'

# Set#each
acc313 = []; Set[1, 2, 3].each { |x| acc313 << x }; p(acc313.sort)
a314 = Set[1, 2, 3]; r314 = (a314.each { |x| x }); p(r314.to_a.sort)

# String elements
acc315 = []; Set["a", "b", "c"].each { |x| acc315 << x }; p(acc315.sort)
b315 = Set["x", "y"]; r315 = (b315.each { |x| x }); p(r315.to_a.sort)

# summing via each
sum316 = 0; Set[1, 2, 3, 4].each { |x| sum316 += x }; p(sum316)

# blockless #each returns an Enumerator
r317 = (Set[1, 2].each.to_a rescue $!.class); p r317
c317 = Set[1, 2]; r318 = (c317.each.next rescue $!.class); p r318

# Float, Struct and nested-Set elements
acc319 = []; Set[1.5, 2.5].each { |x| acc319 << x }; p(acc319.sort)
S319 = Struct.new(:x); acc320 = []; Set[S319.new(1), S319.new(2)].each { |s| acc320 << s.x }; p(acc320.sort)
acc321 = []; Set[Set[1], Set[2]].each { |s| acc321 << s.to_a }; p(acc321.sort)
s040 = Set.new([[1, 2]]); s040.each { |r040, c040| p [r040, c040] }
s041 = Set.new([[1, 2]]); v041 = []; s041.each { |r041, c041| v041 << [r041, c041] }; p v041
