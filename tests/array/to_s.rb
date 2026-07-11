# frozen_string_literal: true
# Array#to_s

p([1, 2, 3].to_s)

a001 = [1, 2, 3]
p a001.class
p a001.to_s

a002 = [1, 2, 3]
b002 = a002.to_s
p b002.class
p b002

p([1.1, 2.2, 3.3].to_s)

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.to_s

a004 = [1.1, 2.2, 3.3]
b004 = a004.to_s
p b004.class
p b004

p(["a", "b", "c"].to_s)

a005 = ["a", "b", "c"]
p a005.class
p a005.to_s

a006 = ["a", "b", "c"]
b006 = a006.to_s
p b006.class
p b006

p([1, "two", :three].to_s)

a007 = [1, "two", :three]
p a007.class
p a007.to_s

a008 = [1, "two", :three]
b008 = a008.to_s
p b008.class
p b008
