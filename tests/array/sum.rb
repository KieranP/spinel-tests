# frozen_string_literal: true
# Array#sum

p([1, 2, 3].sum(10))

a001 = [1, 2, 3]
p a001.class
p a001.sum(10)

a002 = [1, 2, 3]
b002 = 10
p b002.class
p a002.sum(b002)

a003 = [1, 2, 3]
b003 = 10
c003 = a003.sum(b003)
p c003.class
p c003

p([1.1, 2.2, 3.3].sum(0.0))

a004 = [1.1, 2.2, 3.3]
p a004.class
p a004.sum(0.0)

a005 = [1.1, 2.2, 3.3]
b005 = 0.0
p b005.class
p a005.sum(b005)

a006 = [1.1, 2.2, 3.3]
b006 = 0.0
c006 = a006.sum(b006)
p c006.class
p c006

p(["a", "b", "c"].sum("x") { |s| s })

a007 = ["a", "b", "c"]
p a007.class
p a007.sum("x") { |s| s }

a008 = ["a", "b", "c"]
b008 = "x"
p b008.class
p a008.sum(b008) { |s| s }

a009 = ["a", "b", "c"]
b009 = "x"
c009 = a009.sum(b009) { |s| s }
p c009.class
p c009

# no-arg (default init 0)
p([1, 2, 3].sum)
a010 = [1, 2, 3]
c010 = a010.sum
p c010.class
p c010

# empty -> 0
p([].sum)
a011 = []
c011 = a011.sum
p c011

# float sum, no arg
p([1.1, 2.2, 3.3].sum)
a012 = [1.1, 2.2, 3.3]
c012 = a012.sum
p c012

# empty with integer init
p([].sum(100))
a013 = []
c013 = a013.sum(100)
p c013

# empty with float init
p([].sum(0.0))
a014 = []
c014 = a014.sum(0.0)
p c014

Item171 = Struct.new(:cat, :qty) { def value = qty }
g171 = [Item171.new(:a, 1), Item171.new(:b, 2), Item171.new(:a, 3)].group_by(&:cat)
v171 = (g171.map { |_c, grp| grp.sum(&:value) } rescue $!.class); p v171

def k778; [5, [[1, 2, 3], [4, 5, 6]]]; end
total778, chosen778 = k778
p chosen778.sum { |_u778, _v778, w778| w778 }

mat615 = [[Rational(1, 2), Rational(1, 3)]]; p mat615[0].sum
s615 = mat615[0].sum; p s615

a182 = [[1, 2, 3], [4, 5, 6]]; b182 = [[7, 8], [9, 10], [11, 12]]
res182 = Array.new(a182.size) { Array.new(b182.first.size, 0) }
a182.each_with_index { |row, i| b182.transpose.each_with_index { |col, j| res182[i][j] = row.zip(col).sum { |x, y| x * y } } }
p res182
p res182[0][0]

scr = [[Rational(1, 2), Rational(1, 3)]][0]; smr = (scr.sum(Rational(0)) rescue $!.class); p smr

# block, init+block and Array-init forms
g961 = [1, 2, 3]
p g961.sum { |x961| x961 * 2 }
v961 = g961.sum { |x962| x962 * 2 }; p v961
p g961.sum(10) { |x963| x963 * 2 }
v963 = g961.sum(10) { |x964| x964 * 2 }; p v963
p g961.sum(0.0)
v965 = g961.sum(0.0); p v965
g966 = [[1], [2]]
p g966.sum([])
v966 = g966.sum([]); p v966
g967 = ["a", "b"]
p g967.sum("")
v967 = g967.sum(""); p v967
g968 = ([1, 2].sum("x") rescue $!.class); p g968

# a block answering a value that cannot be coerced into Integer
g969 = ([1, 2].sum { |x969| true } rescue $!.class); p g969
g970 = ([1, 2].sum { |x970| "x" } rescue $!.class); p g970
g971b = (["a", "b"].sum { |s971| s971 } rescue $!.class); p g971b
# control: a nil block value
g972 = ([1, 2].sum { |x972| nil } rescue $!.class); p g972
