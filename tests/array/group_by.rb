# frozen_string_literal: true
# Array#group_by
p([1, 2, 3, 4].group_by(&:even?))

a001 = [1, 2, 3, 4]
p a001.class
p a001.group_by(&:even?)

a002 = [1, 2, 3, 4]
c002 = a002.group_by(&:even?)
p c002.class
p c002

p([1.1, 2.2, 3.3, 4.4].group_by { |f| f > 2.5 })

a003 = [1.1, 2.2, 3.3, 4.4]
p a003.class
p a003.group_by { |f| f > 2.5 }

a004 = [1.1, 2.2, 3.3, 4.4]
c004 = a004.group_by { |f| f > 2.5 }
p c004.class
p c004

p(["a", "bb", "cc", "ddd"].group_by(&:length))

a005 = ["a", "bb", "cc", "ddd"]
p a005.class
p a005.group_by(&:length)

a006 = ["a", "bb", "cc", "ddd"]
c006 = a006.group_by(&:length)
p c006.class
p c006

# strings differing only after an embedded NUL are distinct keys
p(["a\0b", "a\0c"].group_by { |x007gb| x007gb }.size)
a007gb = ["a\0b", "a\0c"]; v007gb = a007gb.group_by { |y007gb| y007gb }.size; p v007gb

# grouping Arrays and Hashes held in a local
h441 = [1, 2, 3, 4, 5]
p h441.group_by { |x442| x442 % 3 }
w441 = h441.group_by { |x443| x443.odd? }; p w441
h444 = [[1, 2], [3], [4, 5]]
p h444.group_by { |r444| r444.size }
w444 = h444.group_by { |r445| r445.size }; p w444
h446 = [{ n: 1 }, { n: 2 }, { n: 3 }]
p h446.group_by { |r446| r446[:n].odd? }
w446 = h446.group_by { |r447| r447[:n].odd? }; p w446
p([].group_by { |x448| x448 })
p(%w[apple avocado fig].group_by { |s449| s449[0] })
