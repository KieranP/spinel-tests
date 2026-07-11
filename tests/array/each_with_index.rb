# frozen_string_literal: true
# Array#each_with_index

p([10, 20, 30].each_with_index.to_a)

a001 = [10, 20, 30]
p a001.class
p a001.each_with_index.to_a

a002 = [10, 20, 30]
c002 = a002.each_with_index.to_a
p c002.class
p c002

p([1.1, 2.2, 3.3].each_with_index.to_a)

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.each_with_index.to_a

a004 = [1.1, 2.2, 3.3]
c004 = a004.each_with_index.to_a
p c004.class
p c004

p(["a", "b", "c"].each_with_index.to_a)

a005 = ["a", "b", "c"]
p a005.class
p a005.each_with_index.to_a

a006 = ["a", "b", "c"]
c006 = a006.each_with_index.to_a
p c006.class
p c006

a841 = [1.0, 2.0, 3.0]
v841 = (a841.each_with_index.drop(1).map { |c841, i841| c841 * i841 } rescue $!.class); p v841
p([3, 1, 2].each_with_index.max_by { |v841b, _i841b| v841b })
w841 = [3, 1, 2].each_with_index.min_by { |v841c, _i841c| v841c }; p w841

p([[10, 20, 30]].map { |row616e| row616e.each_with_index.sum { |v616e, i616e| v616e * i616e } })
v616e = [[10, 20, 30]].map { |r616e| r616e.each_with_index.sum { |vv616, ii616| vv616 * ii616 } }; p v616e

# As a method's implicit return value this yields a zero value of the receiver's
# type instead of the receiver itself.
def ir806(x806); x806.each_with_index { |e806, i806| nil }; end
p ir806([1, 2])
v806 = ir806([1, 2]); p v806
# control: the same call with the result consumed explicitly
def ic806(y806); return y806.each_with_index { |e806, i806| nil }; end
p ic806([1, 2])

# blockless -> Enumerator, and chained map/select over the pairs
h541 = [10, 20, 30]
p h541.each_with_index.to_a
w541 = h541.each_with_index.to_a; p w541
p h541.each_with_index.class
p h541.each_with_index.map { |x542, i542| x542 + i542 }
w542 = h541.each_with_index.map { |x543, i543| x543 + i543 }; p w542
p h541.each_with_index.select { |x544, i544| i544.odd? }
p([].each_with_index.to_a)
p([].each_with_index.class)
a547 = []
p a547.each_with_index.to_a
p a547.each_with_index.class
p(%w[a b].each_with_index.to_a)
w545 = %w[a b].each_with_index.to_a; p w545
h546 = [[1], [2]]
p h546.each_with_index.map { |r546, i546| r546.first + i546 }

# from a multi-value return assigns the Enumerator to a pointer to the element struct. Kept
# commented: the C build aborts and takes the whole file down.
EwiLine950 = Struct.new(:number)
def ewi_first950(lines)
  layout = []
  lines.each { |line| layout << [0, line] }
  [{}, layout, 0]
end
def ewi_enc950(line) = line.number
symbols950, layout950, size950 = ewi_first950([EwiLine950.new(1)])
image950 = layout950.map { |_addr, line| ewi_enc950(line) }
p layout950.each_with_index.map { |(_a, line), i| ewi_enc950(line) == image950[i] }
v951 = layout950.each_with_index.map { |(_a, line), i| ewi_enc950(line) == image950[i] }; p v951
