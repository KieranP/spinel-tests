# frozen_string_literal: true
# Array#collect
p([1, 2, 3].collect { |n| n * 2 })

a001 = [1, 2, 3]
p a001.class
p a001.collect { |n| n * 2 }

a002 = [1, 2, 3]
c002 = a002.collect { |n| n * 2 }
p c002.class
p c002

p([1.1, 2.2, 3.3].collect { |n| n * 2 })

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.collect { |n| n * 2 }

a004 = [1.1, 2.2, 3.3]
c004 = a004.collect { |n| n * 2 }
p c004.class
p c004

p(["a", "b", "c"].collect { |s| s.upcase })

a005 = ["a", "b", "c"]
p a005.class
p a005.collect { |s| s.upcase }

a006 = ["a", "b", "c"]
c006 = a006.collect { |s| s.upcase }
p c006.class
p c006

# empty receiver
p([].collect { |x| x * 2 })

a007 = []
c007 = a007.collect { |x| x * 2 }
p c007

# collect to a different type
p([1, 2, 3].collect { |x| x.to_s })

a008 = [1, 2, 3]
c008 = a008.collect { |x| x.to_s }
p c008

p([1, 2, 3].collect { |x| x.even? })

a009 = [1, 2, 3]
c009 = a009.collect { |x| x.even? }
p c009
