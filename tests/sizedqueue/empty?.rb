# frozen_string_literal: true
# SizedQueue#empty?
p(SizedQueue.new(2).empty?)

a001 = SizedQueue.new(2)
p a001.empty?
a001.push(1)
p a001.empty?

b002 = 3
a002 = SizedQueue.new(b002)
a002.push("x")
p a002.empty?

a003 = SizedQueue.new(2)
c003 = a003.empty?
p c003.class
p c003

# empty? follows the buffer, not the capacity
a004 = SizedQueue.new(2)
p a004.empty?
a004.push(1)
p a004.empty?
a004.pop
p a004.empty?
a004.push(1)
a004.push(2)
a004.clear
p a004.empty?

# closing does not empty the buffer
a005 = SizedQueue.new(2)
a005.push(1)
a005.close
p a005.empty?
a005.pop
p a005.empty?
