# frozen_string_literal: true
# Array#minmax_by

p([3, 1, 2].minmax_by { |n| -n })

a001 = [3, 1, 2]
p a001.class
p a001.minmax_by { |n| -n }

a002 = [3, 1, 2]
c002 = a002.minmax_by { |n| -n }
p c002.class
p c002

p([3.5, 1.5, 2.5].minmax_by { |f| -f })

a003 = [3.5, 1.5, 2.5]
p a003.class
p a003.minmax_by { |f| -f }

a004 = [3.5, 1.5, 2.5]
c004 = a004.minmax_by { |f| -f }
p c004.class
p c004

p(["bbb", "a", "cc"].minmax_by { |s| s.length })

a005 = ["bbb", "a", "cc"]
p a005.class
p a005.minmax_by { |s| s.length }

a006 = ["bbb", "a", "cc"]
c006 = a006.minmax_by { |s| s.length }
p c006.class
p c006
