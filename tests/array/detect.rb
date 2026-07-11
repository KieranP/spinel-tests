# frozen_string_literal: true
# Array#detect

p([1, 2, 3, 4].detect { |x| x.even? })

a001 = [1, 2, 3, 4]
p a001.class
p(a001.detect { |x| x.even? })

a002 = [1, 2, 3, 4]
c002 = (a002.detect { |x| x.even? })
p c002.class
p c002

p([1.1, 2.2, 3.3, 4.4].detect { |x| x > 2.0 })

a003 = [1.1, 2.2, 3.3, 4.4]
p a003.class
p(a003.detect { |x| x > 2.0 })

a004 = [1.1, 2.2, 3.3, 4.4]
c004 = (a004.detect { |x| x > 2.0 })
p c004.class
p c004

p(["a", "bb", "ccc"].detect { |x| x.size > 1 })

a005 = ["a", "bb", "ccc"]
p a005.class
p(a005.detect { |x| x.size > 1 })

a006 = ["a", "bb", "ccc"]
c006 = (a006.detect { |x| x.size > 1 })
p c006.class
p c006

# not-found -> nil
p([1, 2, 3].detect { |x| x > 9 })

a007 = [1, 2, 3]
c007 = a007.detect { |x| x > 9 }
p c007.class
p c007

# ifnone proc supplies the not-found value
p([1, 2].detect(-> { -1 }) { |x| x > 9 })

a008 = [1, 2]
c008 = a008.detect(-> { -1 }) { |x| x > 9 }
p c008.class
p c008

# empty receiver -> nil
p([].detect { |x| x > 9 })

c009 = [].detect { |x| x > 9 }
p c009

# symbol-to-proc block
p([1, 2, 3].detect(&:even?))

a010 = [1, 2, 3]
c010 = a010.detect(&:even?)
p c010

# a next carrying a value inside the predicate block
p([1, 2].detect { |i636| next true if i636 == 1; false })
w636 = [1, 2].detect { |i637| next true if i637 == 1; false }; p w636
