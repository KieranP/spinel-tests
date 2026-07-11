# frozen_string_literal: true
# Mutex#equal?

p(Mutex.new.equal?(Mutex.new))
a001 = Mutex.new
p a001.equal?(a001)
a002 = Mutex.new
b002 = Mutex.new
p a002.equal?(b002)
a003 = Mutex.new
c003 = a003.equal?(a003)
p c003.class
p c003

# the neighbouring identity operations on the same receiver are supported
a004 = Mutex.new
p a004 == a004
b004 = Mutex.new
p a004 == b004
p a004.object_id.class
p a004.itself.class
p a004.frozen?
p a004.nil?
