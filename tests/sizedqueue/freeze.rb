# frozen_string_literal: true
# SizedQueue#freeze

# A SizedQueue cannot be frozen in Ruby: #freeze raises TypeError.
r001 = (SizedQueue.new(1).freeze.class rescue $!.class)
p r001
a002 = SizedQueue.new(2)
r002 = (a002.freeze.class rescue $!.class)
p r002
p a002.frozen?
a003 = SizedQueue.new(2)
a003.push 1
r003 = (a003.freeze.class rescue $!.class)
p r003
p a003.pop
