# frozen_string_literal: true
# Array#grep_v
p([1, "a", 2, "b", 3].grep_v(Integer))

a001 = [1, "a", 2, "b", 3]
p a001.class
p a001.grep_v(Integer)

a002 = [1, "a", 2, "b", 3]
c002 = a002.grep_v(Integer)
p c002.class
p c002

# pattern in a variable
a003 = [1, "a", 2, "b", 3]
b003 = String
p a003.grep_v(b003)

a004 = [1, "a", 2, "b", 3]
b004 = String
c004 = a004.grep_v(b004)
p c004.class
p c004

# Range pattern (uses ===)
p([1, 2, 3, 4, 5].grep_v(2..4))

a005 = [1, 2, 3, 4, 5]
c005 = a005.grep_v(2..4)
p c005

# Regexp pattern on strings
p(["apple", "banana", "cherry"].grep_v(/an/))

a006 = ["apple", "banana", "cherry"]
c006 = a006.grep_v(/an/)
p c006

# block form: transform non-matches
p([1, "a", 2, "b"].grep_v(Integer) { |x| x + "!" })

a007 = [1, "a", 2, "b"]
c007 = a007.grep_v(Integer) { |x| x + "!" }
p c007

# everything matches -> []
p([1, 2, 3].grep_v(Integer))
a008 = [1, 2, 3]
c008 = a008.grep_v(Integer)
p c008

# empty receiver
p([].grep_v(Integer))
c009 = [].grep_v(Integer)
p c009
