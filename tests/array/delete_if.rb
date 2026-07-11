# frozen_string_literal: true
# Array#delete_if
p([1, 2, 3, 4].delete_if(&:even?))

a001 = [1, 2, 3, 4]
p a001.class
a001.delete_if(&:even?)
p a001

a002 = [1, 2, 3, 4]
c002 = a002.delete_if(&:even?)
p c002.class
p c002

p([1.1, 2.2, 3.3, 4.4].delete_if { |x| x > 2.5 })

a003 = [1.1, 2.2, 3.3, 4.4]
p a003.class
a003.delete_if { |x| x > 2.5 }
p a003

a004 = [1.1, 2.2, 3.3, 4.4]
c004 = a004.delete_if { |x| x > 2.5 }
p c004.class
p c004

p(["a", "b", "c", "d"].delete_if { |s| s == "b" })

a005 = ["a", "b", "c", "d"]
p a005.class
a005.delete_if { |s| s == "b" }
p a005

a006 = ["a", "b", "c", "d"]
c006 = a006.delete_if { |s| s == "b" }
p c006.class
p c006
