# frozen_string_literal: true
# Range#minmax
p((1..5).minmax)
a036 = (1..5); p(a036.minmax)
a037 = (1..5); c037 = (a037.minmax); p c037
p((1...5).minmax)
p(("a".."e").minmax)
p((5..1).minmax)

p((3..3).minmax)
a038 = (1..10); v038 = (a038.minmax); p v038
r039 = ((1..).minmax rescue $!.class); p r039
r040 = ((1.0...5.0).minmax rescue $!.class); p r040
r041 = ((1.0..5.0).minmax rescue $!.class); p r041
a042 = (1.0..5.0); r042 = (a042.minmax rescue $!.class); p r042
