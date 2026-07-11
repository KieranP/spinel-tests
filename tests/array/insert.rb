# frozen_string_literal: true
# Array#insert
p([1, 2, 3].insert(1, 9))

a010 = [1, 2, 3]
p a010.class
p a010.insert(1, 9)

a011 = [1, 2, 3]
b011 = 9
p b011.class
p a011.insert(1, b011)

a012 = [1, 2, 3]
b012 = 9
c012 = a012.insert(1, b012)
p c012.class
p c012

p(["a", "b", "c"].insert(1, "z"))

a016 = ["a", "b", "c"]
p a016.class
p a016.insert(1, "z")

a017 = ["a", "b", "c"]
b017 = "z"
p b017.class
p a017.insert(1, b017)

a018 = ["a", "b", "c"]
b018 = "z"
c018 = a018.insert(1, b018)
p c018.class
p c018

p([1, 2, 3].insert(5, 8))
a091 = [1, 2, 3]; a091.insert(5, 8); p a091

# a splatted argument list
k096 = [1, :x]
a096 = [1, 2]; a096.insert(*k096); p a096
# Capturing the result of an insert that widens the element type gives the
# capture the pre-widening type. Kept commented: only a compile *warning*, but
# the local then prints raw memory.
a097 = [1, 2]; c097 = a097.insert(*k096); p c097
a098 = [1, 2]; c098 = a098.insert(1, :x); p c098

# negative, out-of-range and multi-value insertion points
h011 = [1, 2, 3]
p h011.dup.insert(1, 9)
p h011.dup.insert(-1, 9)
p h011.dup.insert(-2, 9)
p h011.dup.insert(1, 8, 9)
p h011.dup.insert(5, 9)
p h011.dup.insert(0, 0)
w011 = [1, 2, 3].insert(-2, 7); p w011
w012 = [1, 2, 3].insert(5, 7); p w012
h013 = %w[a b]; h013.insert(1, "x"); p h013
w013 = %w[a b].insert(-1, "z"); p w013
h014 = []; h014.insert(0, 1); p h014
p h011.dup.insert(1)
w015 = [1, 2, 3].insert(1); p w015

# a String index aborts the C build
a413 = [1, 2]; r426 = (a413.insert("x", 9) rescue $!.class); p r426
