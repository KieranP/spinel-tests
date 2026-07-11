# frozen_string_literal: true
# Range#minmax_by
p((1..5).minmax_by { |x001| -x001 })
a002 = (1..5); v002 = (a002.minmax_by { |x002| -x002 }); p v002
p((1..5).to_a.minmax_by { |x003| -x003 })
v004 = ((1..5).to_a.minmax_by { |x004| -x004 }); p v004
