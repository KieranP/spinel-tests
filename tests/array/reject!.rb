# frozen_string_literal: true
# Array#reject!

p([1, 2, 3, 4].reject!(&:even?))

a001 = [1, 2, 3, 4]
p a001.class
a001.reject!(&:even?)
p a001

a002 = [1, 2, 3, 4]
c002 = a002.reject!(&:even?)
p c002.class
p c002

p([1.1, 2.2, 3.3, 4.4].reject! { |n| n > 2.5 })

a003 = [1.1, 2.2, 3.3, 4.4]
p a003.class
a003.reject! { |n| n > 2.5 }
p a003

a004 = [1.1, 2.2, 3.3, 4.4]
c004 = a004.reject! { |n| n > 2.5 }
p c004.class
p c004

p(["a", "bb", "ccc"].reject! { |s| s.length > 1 })

a005 = ["a", "bb", "ccc"]
p a005.class
a005.reject! { |s| s.length > 1 }
p a005

a006 = ["a", "bb", "ccc"]
c006 = a006.reject! { |s| s.length > 1 }
p c006.class
p c006

# no-change (nothing removed) returns nil
p([2, 4, 6].reject! { |x| x > 100 })
a007 = [2, 4, 6]; c007 = a007.reject! { |x| x > 100 }; p c007
