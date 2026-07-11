# frozen_string_literal: true
# SizedQueue#equal?

p(SizedQueue.new(1).equal?(SizedQueue.new(1)))
a001 = SizedQueue.new(1)
p a001.equal?(a001)
a002 = SizedQueue.new(1)
b002 = SizedQueue.new(1)
p a002.equal?(b002)
a003 = SizedQueue.new(1)
c003 = a003.equal?(a003)
p c003.class
p c003

# the neighbouring identity operations on the same receiver are supported
a004 = SizedQueue.new(2)
p a004 == a004
b004 = SizedQueue.new(2)
p a004 == b004
p a004.object_id.class
p a004.frozen?
p a004.nil?
p a004.max
