# frozen_string_literal: true
# Queue.new
p(Queue.new.empty?)
p(Queue.new.size)
p(Queue.new.closed?)
q001 = Queue.new
p q001.empty?
p q001.size
p q001.closed?
q002 = Queue.new
q002.push(1)
p q002.empty?
p q002.size
p Queue.new.class
p Queue.new.nil?

# The Queue class constant itself, used as a value.
zq10 = (Queue rescue $!.class); p zq10
zq11 = (Queue.name rescue $!.class); p zq11
# an instance reports its class correctly
p Queue.new.class
