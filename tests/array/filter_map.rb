# frozen_string_literal: true
# Array#filter_map

p([1, 2, 3, 4].filter_map { |n| n * 10 if n.even? })

a001 = [1, 2, 3, 4]
p a001.class
p a001.filter_map { |n| n * 10 if n.even? }

a002 = [1, 2, 3, 4]
c002 = a002.filter_map { |n| n * 10 if n.even? }
p c002.class
p c002

p(["a", "bb", "ccc"].filter_map { |s| s.upcase if s.size > 1 })

a003 = ["a", "bb", "ccc"]
p a003.class
p a003.filter_map { |s| s.upcase if s.size > 1 }

a004 = ["a", "bb", "ccc"]
c004 = a004.filter_map { |s| s.upcase if s.size > 1 }
p c004.class
p c004

p([1.1, 2.2, 3.3].filter_map { |n| n * 2 if n > 2 })

a005 = [1.1, 2.2, 3.3]
p a005.class
p a005.filter_map { |n| n * 2 if n > 2 }

a006 = [1.1, 2.2, 3.3]
c006 = a006.filter_map { |n| n * 2 if n > 2 }
p c006.class
p c006

# block always returns nil -> all dropped -> []
p([1, 2, 3].filter_map { |n| nil })

a007 = [1, 2, 3]
c007 = a007.filter_map { |n| nil }
p c007

# block always returns false -> []
p([1, 2, 3].filter_map { |n| false })

a008 = [1, 2, 3]
c008 = a008.filter_map { |n| false }
p c008

# block always truthy -> acts like map
p([1, 2, 3].filter_map { |n| n * 10 })

a009 = [1, 2, 3]
c009 = a009.filter_map { |n| n * 10 }
p c009

# 0 is truthy in Ruby -> kept
p([1, 2, 3].filter_map { |n| 0 })

a010 = [1, 2, 3]
c010 = a010.filter_map { |n| 0 }
p c010

# mixed truthy/falsy via trailing conditional
p([-2, -1, 0, 1, 2].filter_map { |n| n if n >= 0 })

a011 = [-2, -1, 0, 1, 2]
c011 = a011.filter_map { |n| n if n >= 0 }
p c011

# empty receiver -> []
p([].filter_map { |n| n })

c012 = [].filter_map { |n| n }
p c012

# falsey block values are dropped
h401 = [1, 2, 3, 4]
p h401.filter_map { |x402| x402 * 2 if x402.odd? }
w401 = h401.filter_map { |x403| x403 * 2 if x403.odd? }; p w401
p h401.filter_map { |x404| x404 }
p h401.filter_map { |x405| nil }
p([].filter_map { |x406| x406 })
p(%w[a bb ccc].filter_map { |s407| s407.upcase if s407.length > 1 })
w407 = %w[a bb ccc].filter_map { |s408| s408.length if s408.length > 1 }; p w407
h409 = [[1, 2], [3]]
p h409.filter_map { |r409| r409.sum if r409.size > 1 }
