# frozen_string_literal: true
# Array#bsearch_index

p([1, 4, 4, 5, 7, 10].bsearch_index { |xi| xi >= 4 })

a001 = [1, 4, 4, 5, 7, 10]
p a001.class
p a001.bsearch_index { |xi| xi >= 4 }

a002 = [1, 4, 4, 5, 7, 10]
c002 = a002.bsearch_index { |xi| xi >= 4 }
p c002.class
p c002

p([1.1, 4.4, 4.4, 5.5, 7.7].bsearch_index { |xf| xf >= 4.0 })

a003 = [1.1, 4.4, 4.4, 5.5, 7.7]
p a003.class
p a003.bsearch_index { |xf| xf >= 4.0 }

a004 = [1.1, 4.4, 4.4, 5.5, 7.7]
c004 = a004.bsearch_index { |xf| xf >= 4.0 }
p c004.class
p c004

p(["a", "b", "c", "d"].bsearch_index { |xs| xs >= "c" })

a005 = ["a", "b", "c", "d"]
p a005.class
p a005.bsearch_index { |xs| xs >= "c" }

a006 = ["a", "b", "c", "d"]
c006 = a006.bsearch_index { |xs| xs >= "c" }
p c006.class
p c006

def ins621(arr621, v621) = arr621.insert(0, v621)
s621 = []; ins621(s621, 5); p(s621.bsearch_index { |x621| x621 >= 4 })

# find-minimum mode (boolean block) and find-any mode (numeric block)
h201 = [0, 4, 7, 10, 12]
p h201.bsearch_index { |x201| x201 >= 4 }
w201 = h201.bsearch_index { |x202| x202 >= 4 }; p w201
p h201.bsearch_index { |x203| x203 >= 6 }
p h201.bsearch_index { |x204| x204 >= 100 }
p h201.bsearch_index { |x205| 4 <=> x205 }
w205 = h201.bsearch_index { |x206| 12 <=> x206 }; p w205
p h201.bsearch_index { |x207| 5 <=> x207 }
p([].bsearch_index { |x208| x208 >= 1 })
p([7].bsearch_index { |x209| x209 >= 7 })
