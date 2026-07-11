# frozen_string_literal: true
# Range#max_by
p((1..5).max_by { |n| -n })
a030 = (1..5); p(a030.max_by { |n| -n })
a031 = (1..5); c031 = (a031.max_by { |n| -n }); p c031

p((1..5).max_by { |n| n % 3 })
p(("a".."e").max_by { |s032| -s032.ord })
p((1..5).max_by(2) { |x033| -x033 })
a034 = (1..5); v034 = (a034.max_by(2) { |x034| -x034 }); p v034
