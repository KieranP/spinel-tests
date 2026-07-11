# frozen_string_literal: true
# Array#map!
p([1, 2, 3].map! { |n| n * 2 })

a001 = [1, 2, 3]
p a001.class
p a001.map! { |n| n * 2 }

a002 = [1, 2, 3]
c002 = a002.map! { |n| n * 2 }
p c002.class
p c002

p([1.1, 2.2, 3.3].map! { |n| n * 2 })

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.map! { |n| n * 2 }

a004 = [1.1, 2.2, 3.3]
c004 = a004.map! { |n| n * 2 }
p c004.class
p c004

p(["a", "b", "c"].map! { |n| n * 2 })

a005 = ["a", "b", "c"]
p a005.class
p a005.map! { |n| n * 2 }

a006 = ["a", "b", "c"]
c006 = a006.map! { |n| n * 2 }
p c006.class
p c006

m094 = [1, 2, 3]
m094.map!.with_index { |x, i| x + i }
p m094

mcr = [[1, 2], [3, 4]]; mcr[1].map! { |x| x * 10 }; p mcr
