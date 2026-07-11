# frozen_string_literal: true
# Range#inspect
p((1..3).inspect)
a033 = (1..3); p(a033.inspect)
a034 = (1..3); v034 = a034.inspect; p v034
p((1...3).inspect)
a035 = (1...3); v035 = a035.inspect; p v035
p((5..1).inspect)
p((3..3).inspect)
p((-3..-1).inspect)
p((1..).inspect)
v036 = (1..).inspect; p v036
p((..5).inspect)
v037 = (..5).inspect; p v037
p((1.0..2.0).inspect)
p(("a".."e").inspect)
a038 = ("a".."e"); v038 = a038.inspect; p v038
p(("a"..."e").inspect)

p((1.0...2.0).inspect)
p((0..0).inspect)
a039 = (nil..nil); v039 = a039.inspect; p v039
p((nil..nil).inspect)
p((nil...nil).inspect)
p(Range.new(nil, nil).inspect)

# a mixed finite Float / Integer pair truncates the Float endpoint
p((1.5..5).inspect)
v916 = ((1..5.5).inspect); p v916
p((1.5..5.5).inspect)
