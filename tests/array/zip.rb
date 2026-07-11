# frozen_string_literal: true
# Array#zip

p([1, 2, 3].zip([4, 5, 6]))

a001 = [1, 2, 3]
p a001.class
p a001.zip([4, 5, 6])

a002 = [1, 2, 3]
b002 = [4, 5, 6]
p b002.class
p a002.zip(b002)

a003 = [1, 2, 3]
b003 = [4, 5, 6]
c003 = a003.zip(b003)
p c003.class
p c003

p([1.1, 2.2, 3.3].zip([4.4, 5.5, 6.6]))

a004 = [1.1, 2.2, 3.3]
p a004.class
p a004.zip([4.4, 5.5, 6.6])

a005 = [1.1, 2.2, 3.3]
b005 = [4.4, 5.5, 6.6]
p b005.class
p a005.zip(b005)

a006 = [1.1, 2.2, 3.3]
b006 = [4.4, 5.5, 6.6]
c006 = a006.zip(b006)
p c006.class
p c006

p(["a", "b", "c"].zip(["d", "e", "f"]))

a007 = ["a", "b", "c"]
p a007.class
p a007.zip(["d", "e", "f"])

a008 = ["a", "b", "c"]
b008 = ["d", "e", "f"]
p b008.class
p a008.zip(b008)

a009 = ["a", "b", "c"]
b009 = ["d", "e", "f"]
c009 = a009.zip(b009)
p c009.class
p c009

r092 = []; [1, 2, 3].zip([4, 5, 6]) { |t| r092 << t }; p r092
z092 = [1, 2, 3].zip([4, 5, 6]) { |t| t }; p z092

p(([1, 2].zip([3, 4]).sum { |x257, y257| x257 * y257 } / 2.0).round(2))

# argument shorter than receiver -> nil padding
p([1, 2, 3].zip([4, 5]))
a020 = [1, 2, 3]
c020 = a020.zip([4, 5])
p c020

# argument longer than receiver -> truncated to receiver length
p([1, 2].zip([4, 5, 6, 7]))
a021 = [1, 2]
c021 = a021.zip([4, 5, 6, 7])
p c021

# multiple arguments
p([1, 2].zip([3, 4], [5, 6]))
a022 = [1, 2]
c022 = a022.zip([3, 4], [5, 6])
p c022

# empty receiver
p([].zip([1, 2]))
a023 = []
c023 = a023.zip([1, 2])
p c023
# A String or Float argument to the same [] literal receiver segfaults, so these stay commented:
p([].zip(["a"]))
v023 = [].zip(["a"]); p v023
p([].zip([1.5]))

# uneven lengths, several arrays, and the block form
p([1, 2, 3].zip([4, 5, 6]))
v981 = [1, 2, 3].zip([4, 5, 6]); p v981
p([1, 2, 3].zip([4, 5]))
v982 = [1, 2, 3].zip([4, 5]); p v982
p([1, 2].zip([3, 4, 5]))
v983 = [1, 2].zip([3, 4, 5]); p v983
p([1, 2].zip([3, 4], [5, 6]))
v984 = [1, 2].zip([3, 4], [5, 6]); p v984
p([].zip([1, 2]))
p([1, 2].zip([]))
p(%w[a b].zip([1, 2]))
v985 = %w[a b].zip([1, 2]); p v985
p([1, 2].zip([3, 4]) { |c986| c986 })
p([1, 2].zip)
v987 = [1, 2].zip; p v987

# splatting a local into #zip
o624 = []
p([1, 2].zip(*o624))
w624 = [1, 2].zip(*o624); p w624
o625 = [[4, 5]]
p([1, 2].zip(*o625))
# control: splatting the literal
p([1, 2].zip(*[]))
p([1, 2].zip(*[[4, 5]]))
