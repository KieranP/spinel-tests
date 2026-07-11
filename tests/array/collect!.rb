# frozen_string_literal: true
# Array#collect!
p([1, 2, 3].collect! { |n| n * 2 })

a001 = [1, 2, 3]
p a001.class
a001.collect! { |n| n * 2 }
p a001

a002 = [1, 2, 3]
c002 = a002.collect! { |n| n * 2 }
p c002.class
p c002

p([1.1, 2.2, 3.3].collect! { |n| n * 2 })

a003 = [1.1, 2.2, 3.3]
p a003.class
a003.collect! { |n| n * 2 }
p a003

a004 = [1.1, 2.2, 3.3]
c004 = a004.collect! { |n| n * 2 }
p c004.class
p c004

p(["a", "b", "c"].collect! { |s| s.upcase })

a005 = ["a", "b", "c"]
p a005.class
a005.collect! { |s| s.upcase }
p a005

a006 = ["a", "b", "c"]
c006 = a006.collect! { |s| s.upcase }
p c006.class
p c006
