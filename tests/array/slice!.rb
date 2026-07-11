# frozen_string_literal: true
# Array#slice!
p([1, 2, 3, 4].slice!(1, 2))

a001 = [1, 2, 3, 4]
p a001.class
p a001.slice!(1, 2)

a002 = [1, 2, 3, 4]
b002 = 2
p b002.class
p a002.slice!(1, b002)

a003 = [1, 2, 3, 4]
b003 = 2
c003 = a003.slice!(1, b003)
p c003.class
p c003

p([1.1, 2.2, 3.3, 4.4].slice!(1, 2))

a004 = [1.1, 2.2, 3.3, 4.4]
p a004.class
p a004.slice!(1, 2)

a005 = [1.1, 2.2, 3.3, 4.4]
b005 = 2
p b005.class
p a005.slice!(1, b005)

a006 = [1.1, 2.2, 3.3, 4.4]
b006 = 2
c006 = a006.slice!(1, b006)
p c006.class
p c006

p(["a", "b", "c", "d"].slice!(1, 2))

a007 = ["a", "b", "c", "d"]
p a007.class
p a007.slice!(1, 2)

a008 = ["a", "b", "c", "d"]
b008 = 2
p b008.class
p a008.slice!(1, b008)

a009 = ["a", "b", "c", "d"]
b009 = 2
c009 = a009.slice!(1, b009)
p c009.class
p c009

# out-of-range and negative-length forms answer nil in CRuby
g831 = [1, 2, 3]; p g831.slice!(9, 2)
g832 = [1, 2, 3]; v832 = g832.slice!(4, 2); p v832
g833 = [1, 2, 3]; p g833.slice!(1, -1)
g834 = [1, 2, 3]; v834 = g834.slice!(9..10); p v834
g835 = [1, 2, 3]; p g835.slice!(..1); p g835
g836 = [1, 2, 3]; p g836.slice!(-2..)

# in-range and boundary forms
g837 = [1, 2, 3]; p g837.slice!(3, 2); p g837
g838 = [1, 2, 3]; p g838.slice!(9); p g838
g839 = [1, 2, 3]; p g839.slice!(-9); p g839
g840 = [1, 2, 3, 4, 5]; p g840.slice!(1, 2); p g840
g841 = [1, 2, 3, 4, 5]; v841 = g841.slice!(1..3); p v841; p g841
g842 = [1, 2, 3, 4, 5]; p g842.slice!(-2, 2); p g842
g843 = [1, 2, 3, 4, 5]; p g843.slice!(1...3); p g843
g844 = ["a", "b", "c"]; v844 = g844.slice!(1); p v844; p g844
