# frozen_string_literal: true
# Array#reject

p([1, 2, 3, 4].reject(&:even?))

a001 = [1, 2, 3, 4]
p a001.class
p a001.reject(&:even?)

a002 = [1, 2, 3, 4]
c002 = a002.reject(&:even?)
p c002.class
p c002

p([1.1, 2.2, 3.3, 4.4].reject { |n| n > 2.5 })

a003 = [1.1, 2.2, 3.3, 4.4]
p a003.class
p a003.reject { |n| n > 2.5 }

a004 = [1.1, 2.2, 3.3, 4.4]
c004 = a004.reject { |n| n > 2.5 }
p c004.class
p c004

p(["a", "bb", "ccc"].reject { |s| s.length > 1 })

a005 = ["a", "bb", "ccc"]
p a005.class
p a005.reject { |s| s.length > 1 }

a006 = ["a", "bb", "ccc"]
c006 = a006.reject { |s| s.length > 1 }
p c006.class
p c006

# no-block -> Enumerator; materialize deterministically via with_index
p([1, 2, 3].reject.with_index { |x, i| i.even? })

a007 = [1, 2, 3]
c007 = a007.reject.with_index { |x, i| i.even? }
p c007.class
p c007

# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p([1, 2, 3].reject.class)

# symbol-to-proc negative predicate
p([1, 2, 3, 4].reject(&:odd?))

a008 = [1, 2, 3, 4]
c008 = a008.reject(&:odd?)
p c008

# rejects none -> unchanged
p([1, 2, 3].reject { |n| n > 9 })

a009 = [1, 2, 3]
c009 = a009.reject { |n| n > 9 }
p c009

# rejects all -> []
p([1, 2, 3].reject { |n| n > 0 })

a010 = [1, 2, 3]
c010 = a010.reject { |n| n > 0 }
p c010

# empty receiver -> []
p([].reject { |n| n > 0 })

c011 = [].reject { |n| n > 0 }
p c011

r550c = ([[1, 2, 0], [3, 0, 4]].map { |row550c| row550c.reject(&:zero?) } rescue $!.class); p r550c
