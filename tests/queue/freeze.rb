# frozen_string_literal: true
# Queue#freeze

# A Queue cannot be frozen in Ruby: #freeze raises TypeError.
r001 = (Queue.new.freeze.class rescue $!.class)
p r001
a002 = Queue.new
r002 = (a002.freeze.class rescue $!.class)
p r002
p a002.frozen?
a003 = Queue.new
a003.push 1
r003 = (a003.freeze.class rescue $!.class)
p r003
p a003.pop
