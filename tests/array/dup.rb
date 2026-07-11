# frozen_string_literal: true
# Array#dup

p([1, 2, 3].dup)

a001 = [1, 2, 3]
p a001.class
p a001.dup

a002 = [1, 2, 3]
c002 = a002.dup
p c002.class
p c002

a003 = [1, 2, 3]
b003 = a003.dup
b003 << 4
p a003

p([1.1, 2.2, 3.3].dup)

a004 = [1.1, 2.2, 3.3]
p a004.class
p a004.dup

a005 = [1.1, 2.2, 3.3]
c005 = a005.dup
p c005.class
p c005

p(["a", "b", "c"].dup)

a006 = ["a", "b", "c"]
p a006.class
p a006.dup

a007 = ["a", "b", "c"]
c007 = a007.dup
p c007.class
p c007

board077 = [["a", "b"], ["c", "d"]]
copy077 = board077[0].dup
copy077[1] = "X"
p board077[0]

# an empty literal's dup is not frozen in CRuby
g851 = [].dup
p g851.frozen?
v851 = g851.frozen?; p v851
g852 = [].dup; g852 << 1; p g852
g853 = [].dup; p g853.push(1)
g854 = [].dup; p g854.shift(2)
g855 = [].clone; p g855.shift(2)

# a non-empty literal, and an empty literal bound to a local first, are fine
p([].dup.frozen?)
p([1].dup.frozen?)
g856 = []; g857 = g856.dup; p g857.frozen?
g858 = [1].dup; g858 << 2; p g858
g859 = [1, 2].dup; g859[0] = 9; p g859
g860 = [[1], [2]].dup; p g860
v860 = [[1], [2]].dup; p v860
def dup_rec120(node120, n120)
  copy120 = node120.dup
  copy120[0] = n120.zero? ? 7 : dup_rec120(node120[0], n120 - 1)
  copy120
end
p dup_rec120([], 0)
v121 = dup_rec120([], 0); p v121
