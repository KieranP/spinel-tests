# frozen_string_literal: true
# Range.new

r001 = (Range.new(1, 3).to_a rescue $!.class)
p r001
a002 = 1
b002 = 3
r002 = (Range.new(a002, b002).sum rescue $!.class)
p r002
r003 = (Range.new(1, 3, true).to_a rescue $!.class)
p r003
r004 = (Range.new(1.0, 3.0).include?(2.0) rescue $!.class)
p r004
r005 = (Range.new("a", "c").to_a rescue $!.class)
p r005

# the equivalent literals work
p((1..3).to_a)
p((1...3).to_a)
p((1.0..3.0).include?(2.0))
p(("a".."c").to_a)
c006 = (1..3)
p c006.to_a

p(Range.new(1, 5).to_a)
p(Range.new(1, 5, true).to_a)
v006 = (Range.new(1, 5, true)); p v006
p(Range.new(nil, 5).last)
p(Range.new(1, nil).first(3))
p(Range.new("a", "e").to_a)
r007 = (Range.new(5, 1).to_a rescue $!.class); p r007
