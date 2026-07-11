# frozen_string_literal: true
# Array#bsearch

p([1, 2, 3, 4, 5].bsearch { |ni| ni >= 3 })

a001 = [1, 2, 3, 4, 5]
p a001.class
p a001.bsearch { |ni| ni >= 3 }

a002 = [1, 2, 3, 4, 5]
c002 = a002.bsearch { |ni| ni >= 3 }
p c002.class
p c002

p([1.1, 2.2, 3.3, 4.4].bsearch { |nf| nf >= 3.0 })

a003 = [1.1, 2.2, 3.3, 4.4]
p a003.class
p a003.bsearch { |nf| nf >= 3.0 }

a004 = [1.1, 2.2, 3.3, 4.4]
c004 = a004.bsearch { |nf| nf >= 3.0 }
p c004.class
p c004

p(["ant", "bee", "cat", "dog"].bsearch { |ns| ns >= "cat" })

a005 = ["ant", "bee", "cat", "dog"]
p a005.class
p a005.bsearch { |ns| ns >= "cat" }

a006 = ["ant", "bee", "cat", "dog"]
c006 = a006.bsearch { |ns| ns >= "cat" }
p c006.class
p c006

def ins872(arr, v) = arr.insert(0, v)
s872 = []
# [5, 2, 8].each { |n872| ins872(s872, n872) }
p s872.bsearch { |x872| x872 >= 4 }

# find-minimum mode (boolean block) and find-any mode (numeric block)
h181 = [0, 4, 7, 10, 12]
p h181.bsearch { |x181| x181 >= 4 }
w181 = h181.bsearch { |x182| x182 >= 4 }; p w181
p h181.bsearch { |x183| x183 >= 6 }
p h181.bsearch { |x184| x184 >= 100 }
p h181.bsearch { |x185| x185 >= 0 }
p h181.bsearch { |x186| 1 - x186 / 4 }
p h181.bsearch { |x187| 4 <=> x187 }
w187 = h181.bsearch { |x188| 12 <=> x188 }; p w187
p h181.bsearch { |x189| 5 <=> x189 }
p([].bsearch { |x190| x190 >= 1 })
p([7].bsearch { |x191| x191 >= 7 })
h192 = %w[a c e]
p h192.bsearch { |s192| s192 >= "c" }
