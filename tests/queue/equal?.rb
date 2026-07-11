# frozen_string_literal: true
# Queue#equal?

p(Queue.new.equal?(Queue.new))
a001 = Queue.new
p a001.equal?(a001)
a002 = Queue.new
b002 = Queue.new
p a002.equal?(b002)
a003 = Queue.new
c003 = a003.equal?(a003)
p c003.class
p c003

# the neighbouring identity operations on the same receiver are supported
a004 = Queue.new
p a004 == a004
b004 = Queue.new
p a004 == b004
p a004.object_id.class
p a004.itself.class
p a004.frozen?
p a004.nil?
