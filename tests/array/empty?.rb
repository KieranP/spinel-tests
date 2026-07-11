# frozen_string_literal: true
# Array#empty?

p([].empty?)

a001 = []
p a001.class
p a001.empty?

a002 = []
c002 = a002.empty?
p c002.class
p c002

p([1, 2, 3].empty?)

a003 = [1, 2, 3]
p a003.class
p a003.empty?

a004 = [1, 2, 3]
c004 = a004.empty?
p c004.class
p c004

p(["a", "b", "c"].empty?)

a005 = ["a", "b", "c"]
p a005.class
p a005.empty?

a006 = ["a", "b", "c"]
c006 = a006.empty?
p c006.class
p c006

p([1.1, 2.2].empty?)

a007 = [1.1, 2.2]
p a007.class
p a007.empty?

a008 = [1.1, 2.2]
c008 = a008.empty?
p c008.class
p c008

# nested arrays
p([[1], [2]].empty?)
a100 = [[1], [2]]
p a100.empty?
a101 = [[1], [2]]
c101 = a101.empty?
p c101

p([[]].empty?)
a102 = [[]]
p a102.empty?
a103 = [[]]
c103 = a103.empty?
p c103

# nil-containing
p([nil].empty?)
a104 = [nil]
p a104.empty?
a105 = [nil]
c105 = a105.empty?
p c105

p([nil, nil].empty?)
a106 = [nil, nil]
p a106.empty?
a107 = [nil, nil]
c107 = a107.empty?
p c107
