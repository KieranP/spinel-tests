# frozen_string_literal: true
# Array#filter

p([1, 2, 3, 4].filter { |x| x.even? })

a001 = [1, 2, 3, 4]
p a001.class
p a001.filter { |x| x.even? }

a002 = [1, 2, 3, 4]
c002 = a002.filter { |x| x.even? }
p c002.class
p c002

p(["a", "bb", "ccc"].filter { |s| s.size > 1 })

a003 = ["a", "bb", "ccc"]
p a003.class
p a003.filter { |s| s.size > 1 }

a004 = ["a", "bb", "ccc"]
c004 = a004.filter { |s| s.size > 1 }
p c004.class
p c004

p([1.1, 2.2, 3.3].filter { |x| x > 2 })

a005 = [1.1, 2.2, 3.3]
p a005.class
p a005.filter { |x| x > 2 }

a006 = [1.1, 2.2, 3.3]
c006 = a006.filter { |x| x > 2 }
p c006.class
p c006

# no-block -> Enumerator; materialize deterministically via with_index
p([1, 2, 3].filter.with_index { |x, i| i.even? })

a007 = [1, 2, 3]
c007 = a007.filter.with_index { |x, i| i.even? }
p c007.class
p c007

# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p([1, 2, 3].filter.class)

# block selects none -> []
p([1, 2, 3].filter { |x| x > 9 })

a008 = [1, 2, 3]
c008 = a008.filter { |x| x > 9 }
p c008

# block selects all
p([1, 2, 3].filter { |x| x > 0 })

a009 = [1, 2, 3]
c009 = a009.filter { |x| x > 0 }
p c009

# empty receiver -> []
p([].filter { |x| x > 0 })

c010 = [].filter { |x| x > 0 }
p c010
