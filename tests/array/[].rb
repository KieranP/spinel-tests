# frozen_string_literal: true
# Array#[]

p([10, 20, 30, 40][2])

a001 = [10, 20, 30, 40]
p a001.class
p(a001[2])

a002 = [10, 20, 30, 40]
b002 = 2
p b002.class
p(a002[b002])

a003 = [10, 20, 30, 40]
b003 = 2
c003 = a003[b003]
p c003.class
p c003

p([1.1, 2.2, 3.3, 4.4][2])

a004 = [1.1, 2.2, 3.3, 4.4]
p a004.class
p(a004[2])

a005 = [1.1, 2.2, 3.3, 4.4]
b005 = 2
p b005.class
p(a005[b005])

a006 = [1.1, 2.2, 3.3, 4.4]
b006 = 2
c006 = a006[b006]
p c006.class
p c006

p(["a", "b", "c", "d"][2])

a007 = ["a", "b", "c", "d"]
p a007.class
p(a007[2])

a008 = ["a", "b", "c", "d"]
b008 = 2
p b008.class
p(a008[b008])

a009 = ["a", "b", "c", "d"]
b009 = 2
c009 = a009[b009]
p c009.class
p c009

p([1, 2, 3, 4, 5][10, 2])
v097 = [1, 2, 3, 4, 5][10, 2]; p v097

# negative index
p([10, 20, 30][-1])
a010 = [10, 20, 30]; p(a010[-1])
b010 = [10, 20, 30][-1]; p b010

# out-of-range -> nil
p([1, 2, 3][10])
c010 = [1, 2, 3][10]; p c010

# negative out-of-range -> nil
p([1, 2, 3][-10])
d010 = [1, 2, 3][-10]; p d010

# [start, length]
p([1, 2, 3, 4, 5][1, 2])
e010 = [1, 2, 3, 4, 5][1, 2]; p e010

# length 0
p([1, 2, 3][1, 0])
f010 = [1, 2, 3][1, 0]; p f010

# length beyond end
p([1, 2, 3][1, 10])
g010 = [1, 2, 3][1, 10]; p g010

# start == size -> []
p([1, 2, 3][3, 2])
h010 = [1, 2, 3][3, 2]; p h010

# start > size -> nil
p([1, 2, 3][4, 2])
i010 = [1, 2, 3][4, 2]; p i010

# Range args
p([1, 2, 3, 4, 5][1..3])
j010 = [1, 2, 3, 4, 5][1..3]; p j010
p([1, 2, 3, 4, 5][1...3])
k010 = [1, 2, 3, 4, 5][1...3]; p k010
p([1, 2, 3, 4, 5][1..])
l010 = [1, 2, 3, 4, 5][1..]; p l010
p([1, 2, 3, 4, 5][..2])
m010 = [1, 2, 3, 4, 5][..2]; p m010
p([1, 2, 3, 4, 5][-2..])
n010 = [1, 2, 3, 4, 5][-2..]; p n010
p([1, 2, 3, 4, 5][1..-1])
o010 = [1, 2, 3, 4, 5][1..-1]; p o010

# nil read from an out-of-range index of an Integer Array: arithmetic raises, as in CRuby.
oa01 = [1, 2]; or01 = (oa01[9] + 1 rescue $!.class); p or01
oa02 = [1, 2]; or02 = (oa02[9] - 1 rescue $!.class); p or02

# Array#compact on an Array held as an element of another Array raises NoMethodError.
ea01 = [[1, nil, 2]]; er01 = (ea01[0].compact rescue $!.class); p er01

# An Array read out of a container: a Range slice degrades to element 0.
za01 = [["a", "b", "c"]]; zb01 = za01[0]
p zb01[0..1]
p zb01[1..2]
p zb01[0..-1]
p zb01[0...2]
p zb01[1..]
zc01 = zb01[0..1]; p zc01
# the (start, length) form on the same receiver is correct
p zb01[0, 2]
zd01 = zb01[0, 2]; p zd01
# Float, Symbol and Array element types behave the same way
zf01 = [[1.5, 2.5]]; p zf01[0][0..1]
zg01 = [[:a, :b]]; p zg01[0][0..1]
zh01 = [[["a"], ["b"]]]; p zh01[0][0..1]
# an Integer inner array read through a local is correct
zi01 = [[1, 2, 3]]; p zi01[0][0..1]
# an all-literal chain degrades even for an Integer inner array
p [[1, 2, 3]][0][0..1]

# Array.[]
p Array[1, 2, 3]
r801 = Array[1, 2, 3]
p r801
p Array[]
r802 = (Array[] rescue $!.class)
p r802
p Array["a", "b"]
r803 = Array["a", "b"]
p r803
r804 = begin
#   Array[]
rescue
#   0
end
p r804
# the sibling constructors on the same build
p Array.new(3, 0)
p Hash[:a, 1]

# A two-element splat keeps only the first argument: Ruby [1, 2], Spinel 1.
k896 = [0, 2]
p([1, 2, 3][*k896])
v896 = [1, 2, 3][*k896]; p v896
# control: the same arguments spread positionally
p([1, 2, 3][0, 2])

# An Array value read out of a {}-created Hash into a local, indexed every way.
hx377 = {}
hx377["a"] = [7, 8, 9]
rx377 = hx377["a"]
p rx377[0]
vx377 = rx377[-1]; p vx377
ix377 = 1
p rx377[ix377]
# control: the (start, length) and Range forms, the in-place read, and a Hash.new
# receiver are all correct
p rx377[0, 2]
p rx377[1..]
p hx377["a"][0]
gx377 = Hash.new; gx377["a"] = [7, 8, 9]; ry377 = gx377["a"]; p ry377[0]

# a String index aborts the C build
r420 = ([1, 2]["x"] rescue $!.class); p r420
