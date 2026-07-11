# frozen_string_literal: true
# Array#min
p([3, 1, 2].min(2))

a001 = [3, 1, 2]
p a001.class
p a001.min(2)

a002 = [3, 1, 2]
b002 = 2
p b002.class
p a002.min(b002)

a003 = [3, 1, 2]
b003 = 2
c003 = a003.min(b003)
p c003.class
p c003

p([3.3, 1.1, 2.2].min(2))

a004 = [3.3, 1.1, 2.2]
p a004.class
p a004.min(2)

a005 = [3.3, 1.1, 2.2]
b005 = 2
p b005.class
p a005.min(b005)

a006 = [3.3, 1.1, 2.2]
b006 = 2
c006 = a006.min(b006)
p c006.class
p c006

p(["c", "a", "b"].min(2))

a007 = ["c", "a", "b"]
p a007.class
p a007.min(2)

a008 = ["c", "a", "b"]
b008 = 2
p b008.class
p a008.min(b008)

a009 = ["c", "a", "b"]
b009 = 2
c009 = a009.min(b009)
p c009.class
p c009

p([1, 2, 3, 4].min(2) { |x, y| x <=> y })

a010 = [1, 2, 3, 4]
c010 = a010.min(2) { |x, y| x <=> y }
p c010.class
p c010

# no-arg form returns a single element (not an array)
p([3, 1, 2].min)
a011 = [3, 1, 2]
c011 = a011.min
p c011.class
p c011

p([3.3, 1.1, 2.2].min)
a012 = [3.3, 1.1, 2.2]
c012 = a012.min
p c012

p(["c", "a", "b"].min)
a013 = ["c", "a", "b"]
c013 = a013.min
p c013

# block comparator with no count arg -> single element
p([1, 2, 3].min { |a, b| b <=> a })
a014 = [1, 2, 3]
c014 = a014.min { |x, y| y <=> x }
p c014

# empty array: no-arg -> nil, with count -> []
p([].min)
a015 = []
c015 = a015.min
p c015

p([].min(2))
a016 = []
c016 = a016.min(2)
p c016

# min(0) -> []
p([3, 1, 2].min(0))
a017 = [3, 1, 2]
c017 = a017.min(0)
p c017

class Ver154; include Comparable; attr_reader :parts; def initialize(s); @parts = s.split(".").map(&:to_i); end; def <=>(o); parts <=> o.parts; end; def to_s; parts.join("."); end; end
vers154 = ["1.2.0", "1.10.1"].map { |s| Ver154.new(s) }
puts vers154.min
puts "#{vers154.min}"

# Array#min over Time elements: comparison of Time read from a container yields nil -> ArgumentError
a122 = [Time.new(2026, 1, 2), Time.new(2026, 1, 1)]
r122 = (a122.min.day rescue $!.class); p r122

# Array#min on an Array read out of a container returns nil.
zm01 = [["a", "b", "c"]]
p zm01[0].min
zn01 = zm01[0].min; p zn01
zo01 = { "row" => ["x", "y", "z"] }
p zo01["row"].min
# an Integer inner array is correct
zp01 = [[3, 1, 2]]; p zp01[0].min

# the counted form, a comparison block, and empty receivers
h111 = [3, 1, 4, 1, 5, 9, 2, 6]
p h111.min(3)
w111 = h111.min(3); p w111
p h111.min(0)
p h111.min(100)
p h111.min { |x112, y112| y112 <=> x112 }
w112 = h111.min(2) { |x113, y113| y113 <=> x113 }; p w112
n114 = 3
p h111.min(n114)
p([].min)
p([].min(2))
p([7].min(1))
p(%w[pear fig apple].min)
w115 = %w[pear fig apple].min(2); p w115

# empty receiver: a literal with the result assigned, and a drained Float array
f270 = [].min; p f270
f271 = [1.5]; f271.pop; p f271.min

def min601(items) = items.min { |a, b| a <=> b }
p min601([3, 1, 2])
w602 = min601(%w[pear fig apple]); p w602
