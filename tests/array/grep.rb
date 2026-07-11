# frozen_string_literal: true
# Array#grep
p([1, "a", 2, "b", 3].grep(Integer))

a001 = [1, "a", 2, "b", 3]
p a001.class
p a001.grep(Integer)

a002 = [1, "a", 2, "b", 3]
c002 = a002.grep(Integer)
p c002.class
p c002

# pattern in a variable
a003 = [1, "a", 2, "b", 3]
b003 = String
p a003.grep(b003)

a004 = [1, "a", 2, "b", 3]
b004 = String
c004 = a004.grep(b004)
p c004.class
p c004

# Range pattern (uses ===)
p([1, 2, 3, 4, 5].grep(2..4))

a005 = [1, 2, 3, 4, 5]
c005 = a005.grep(2..4)
p c005

# Regexp pattern on strings
p(["apple", "banana", "cherry"].grep(/an/))

a006 = ["apple", "banana", "cherry"]
c006 = a006.grep(/an/)
p c006

# block form: transform matches
p([1, "a", 2, "b"].grep(Integer) { |x| x * 10 })

a007 = [1, "a", 2, "b"]
c007 = a007.grep(Integer) { |x| x * 10 }
p c007

# no matches -> []
p([1, 2, 3].grep(String))
a008 = [1, 2, 3]
c008 = a008.grep(String)
p c008

# empty receiver
p([].grep(Integer))
c009 = [].grep(Integer)
p c009

# Float pattern
p([1, 1.5, 2, 2.5].grep(Float))
a010 = [1, 1.5, 2, 2.5]
c010 = a010.grep(Float)
p c010

# reference-type / module pattern (Array, Hash, Object, Enumerable, ...) -> compile abort
p([[1, 2], [3, 4]].grep(Array))
a011 = [[1, 2], [3, 4]]; c011 = a011.grep(Array); p c011
b012 = Array; p([[1, 2], [3, 4]].grep(b012))

# Class, Range and Regexp patterns, plus the block form
h381 = [1, "a", 2, "b"]
p h381.grep(Integer)
w381 = h381.grep(Integer); p w381
p h381.grep(String)
p([1, 2, 3, 4].grep(2..3))
w382 = [1, 2, 3, 4].grep(2..3); p w382
p([1, 2, 3].grep(Integer) { |x383| x383 * 10 })
w383 = [1, 2, 3].grep(Integer) { |x384| x384 * 10 }; p w383
p(%w[apple banana kiwi].grep(/an/))
w384 = %w[apple banana kiwi].grep(/an/); p w384
p([].grep(Integer))
