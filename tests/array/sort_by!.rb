# frozen_string_literal: true
# Array#sort_by!
p([3, 1, 2].sort_by! { |n| -n })

a001 = [3, 1, 2]
p a001.class
p a001.sort_by! { |n| -n }

a002 = [3, 1, 2]
c002 = a002.sort_by! { |n| -n }
p c002.class
p c002

p([3.3, 1.1, 2.2].sort_by! { |n| -n })

a003 = [3.3, 1.1, 2.2]
p a003.class
p a003.sort_by! { |n| -n }

a004 = [3.3, 1.1, 2.2]
c004 = a004.sort_by! { |n| -n }
p c004.class
p c004

p(["ccc", "a", "bb"].sort_by! { |s| s.length })

a005 = ["ccc", "a", "bb"]
p a005.class
p a005.sort_by! { |s| s.length }

a006 = ["ccc", "a", "bb"]
c006 = a006.sort_by! { |s| s.length }
p c006.class
p c006
