# frozen_string_literal: true
# Array#find_all
p([1, 2, 3, 4].find_all { |xa| xa.even? })

a001 = [1, 2, 3, 4]
p a001.class
p a001.find_all { |xa| xa.even? }

a002 = [1, 2, 3, 4]
c002 = a002.find_all { |xa| xa.even? }
p c002.class
p c002

p([1.1, 2.2, 3.3, 4.4].find_all { |xb| xb > 2.0 })

a003 = [1.1, 2.2, 3.3, 4.4]
p a003.class
p a003.find_all { |xb| xb > 2.0 }

a004 = [1.1, 2.2, 3.3, 4.4]
c004 = a004.find_all { |xb| xb > 2.0 }
p c004.class
p c004

p(["a", "bb", "ccc", "dddd"].find_all { |xc| xc.length > 2 })

a005 = ["a", "bb", "ccc", "dddd"]
p a005.class
p a005.find_all { |xc| xc.length > 2 }

a006 = ["a", "bb", "ccc", "dddd"]
c006 = a006.find_all { |xc| xc.length > 2 }
p c006.class
p c006

# no-block -> Enumerator; materialize deterministically via with_index
p([1, 2, 3].find_all.with_index { |xd, i| i.even? })

a007 = [1, 2, 3]
c007 = a007.find_all.with_index { |xd, i| i.even? }
p c007.class
p c007

# block selects none -> []
p([1, 2, 3].find_all { |xe| xe > 9 })

a008 = [1, 2, 3]
c008 = a008.find_all { |xe| xe > 9 }
p c008

# block selects all
p([1, 2, 3].find_all { |xf| xf > 0 })

a009 = [1, 2, 3]
c009 = a009.find_all { |xf| xf > 0 }
p c009

# empty receiver -> []
p([].find_all { |xg| xg > 0 })

c010 = [].find_all { |xg| xg > 0 }
p c010
