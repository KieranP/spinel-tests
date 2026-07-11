# frozen_string_literal: true
# Range#to_s
p((1..3).to_s)
a035 = (1..3); p(a035.to_s)
a036 = (1..3); v036 = a036.to_s; p v036
p((1...3).to_s)
a037 = (1...3); v037 = a037.to_s; p v037
p((5..1).to_s)
p((3..3).to_s)
p((-3..-1).to_s)
p((1..).to_s)
v038 = (1..).to_s; p v038
p((..5).to_s)
v039 = (..5).to_s; p v039
p((1.0..2.0).to_s)
p((1.0...2.0).to_s)
p(("a".."e").to_s)
a040 = ("a".."e"); v040 = a040.to_s; p v040

p((0..0).to_s)
p(("a"..."e").to_s)
a041 = (nil..nil); v041 = a041.to_s; p v041
p((nil..nil).to_s)
p((1..Float::INFINITY).to_s)

# a -Float::INFINITY beginning coerces the Integer end
p((-Float::INFINITY..5).to_s)
v101 = ((-Float::INFINITY..5).to_s); p v101
# a mixed finite Float / Integer pair truncates the Float endpoint
p((1.5..5).to_s)
v102 = ((1..5.5).to_s); p v102
