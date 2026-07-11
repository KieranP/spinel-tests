# frozen_string_literal: true
# Array#each_with_object

p([1, 2, 3].each_with_object([]) { |n, acc| acc << n * 2 })

a001 = [1, 2, 3]
p a001.class
p a001.each_with_object([]) { |n, acc| acc << n * 2 }

a002 = [1, 2, 3]
b002 = []
p b002.class
p a002.each_with_object(b002) { |n, acc| acc << n * 2 }

a003 = [1, 2, 3]
b003 = []
c003 = a003.each_with_object(b003) { |n, acc| acc << n * 2 }
p c003.class
p c003

p([1.1, 2.2, 3.3].each_with_object([]) { |n, acc| acc << n * 2 })

a004 = [1.1, 2.2, 3.3]
p a004.class
p a004.each_with_object([]) { |n, acc| acc << n * 2 }

a005 = [1.1, 2.2, 3.3]
b005 = []
p b005.class
p a005.each_with_object(b005) { |n, acc| acc << n * 2 }

a006 = [1.1, 2.2, 3.3]
b006 = []
c006 = a006.each_with_object(b006) { |n, acc| acc << n * 2 }
p c006.class
p c006

p(["a", "b", "c"].each_with_object([]) { |n, acc| acc << n * 2 })

a007 = ["a", "b", "c"]
p a007.class
p a007.each_with_object([]) { |n, acc| acc << n * 2 }

a008 = ["a", "b", "c"]
b008 = []
p b008.class
p a008.each_with_object(b008) { |n, acc| acc << n * 2 }

a009 = ["a", "b", "c"]
b009 = []
c009 = a009.each_with_object(b009) { |n, acc| acc << n * 2 }
p c009.class
p c009

# inline empty-Hash memo with Integer keys (works)
p([1, 2, 3].each_with_object({}) { |x, acc| acc[x] = x * x })
c010 = [1, 2, 3].each_with_object({}) { |x, acc| acc[x] = x * x }
p c010

# empty-Hash memo with String keys (works: matches default string-keyed storage)
a011 = ["a", "bb", "ccc"]
h011 = {}
a011.each_with_object(h011) { |s, acc| acc[s] = s.length }
p h011
c011 = a011.each_with_object({}) { |s, acc| acc[s] = s.length }
p c011

# Integer-seeded Hash memo with Integer keys (works)
a012 = [1, 2, 3]
h012 = { 0 => 0 }
a012.each_with_object(h012) { |x, acc| acc[x] = x * x }
p h012

a013 = [1, 2, 3]
h013 = {}
a013.each_with_object(h013) { |x, acc| acc[x] = x * x }
p h013

# empty-Hash memo whose block never references the memo param -> C compile abort
p([1, 2].each_with_object({}) { |x, acc| p x })
c014 = [1, 2].each_with_object({}) { |x, acc| p x }; p c014

# Array, Hash and String memos
g921 = [1, 2, 3]
p g921.each_with_object([]) { |x921, a921| a921 << x921 * 2 }
v921 = g921.each_with_object([]) { |x922, a922| a922 << x922 * 2 }; p v921
p g921.each_with_object({}) { |x923, h923| h923[x923] = x923 * x923 }
v923 = g921.each_with_object({}) { |x924, h924| h924[x924] = x924 * x924 }; p v923
p g921.each_with_object(+"") { |x925, s925| s925 << x925.to_s }
g926 = [[1, 2], [3, 4]]
p g926.each_with_object([]) { |r926, a926| a926 << r926.size }
v926 = g926.each_with_object([]) { |r927, a927| a927 << r927.sum }; p v926
p([].each_with_object([]) { |x928, a928| a928 << x928 })
g929 = [[1, 2], [3, 4]]; p g929.each_with_object([]) { |r929, a929| a929.concat(r929) }
# an empty Array literal receiver
p([].each_with_object([]) { |x930, a930| a930 })
v933 = [].each_with_object([]) { |_x933, a933| a933 }; p v933
a931 = []
p a931.each_with_object([]) { |x932, a932| a932 }
