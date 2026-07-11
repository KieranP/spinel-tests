# frozen_string_literal: true
# SizedQueue#class
p(SizedQueue.new(2).class)

a001 = SizedQueue.new(2)
p a001.class

b002 = 3
a002 = SizedQueue.new(b002)
p a002.class

a003 = SizedQueue.new(2)
c003 = a003.class
p c003.class
p c003
p c003.name

# the class constant itself, as a value
r004 = (SizedQueue rescue $!.class)
p r004
r005 = (SizedQueue.new(1).is_a?(SizedQueue) rescue $!.class)
p r005
