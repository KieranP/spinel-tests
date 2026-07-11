# frozen_string_literal: true
# Range#sort_by
p((1..5).sort_by { |n| -n })
a046 = (1..5); p(a046.sort_by { |n| -n })
a047 = (1..5); c047 = (a047.sort_by { |n| -n }); p c047
p((1...5).sort_by { |n| -n })
p((5..1).sort_by { |n| n })
p(("a".."e").sort_by { |s| s })
a048 = ("a".."e"); c048 = (a048.sort_by { |s| s }); p c048
