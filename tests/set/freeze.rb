# frozen_string_literal: true
require 'set'

# Set#freeze
a039 = Set[1, 2, 3]; a039.freeze; p(a039.frozen?)
a040 = Set[1, 2, 3]; v040 = a040.freeze; p(v040.frozen?)

# a frozen Set rejects every mutation
a041 = Set[1, 2].freeze
p((a041.add(3) rescue $!.class))
p((a041 << 4 rescue $!.class))
p((a041.delete(1) rescue $!.class))
p((a041.merge([9]) rescue $!.class))
p((a041.subtract([2]) rescue $!.class))
p((a041.replace([7]) rescue $!.class))
v041 = a041.to_a.sort; p v041
