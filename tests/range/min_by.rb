# frozen_string_literal: true
# Range#min_by
p((1..5).min_by { |n| -n })
a034 = (1..5); p(a034.min_by { |n| -n })
a035 = (1..5); c035 = (a035.min_by { |n| -n }); p c035

p((1..5).min_by { |n| n % 3 })
p(("a".."e").min_by { |s036| -s036.ord })
p((1..5).min_by(2) { |x037| -x037 })
a038 = (1..5); v038 = (a038.min_by(2) { |x038| -x038 }); p v038
