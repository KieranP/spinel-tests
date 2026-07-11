# frozen_string_literal: true
# SizedQueue#pop
p(SizedQueue.new(2).push(7).pop)

a001 = SizedQueue.new(2)
a001.push(7)
p a001.pop
p a001.empty?

b002 = "task"
a002 = SizedQueue.new(2)
a002.push(b002)
p a002.pop

a003 = SizedQueue.new(2)
a003.push(7)
c003 = a003.pop
p c003.class
p c003

# FIFO order
a004 = SizedQueue.new(3)
a004.push("a")
a004.push("b")
a004.push("c")
p a004.pop
p a004.pop
p a004.pop
p a004.size

# pop on a closed, drained queue returns nil
a005 = SizedQueue.new(2)
a005.push(1)
a005.close
p a005.pop
p a005.pop
c005 = a005.pop
p c005

# pop blocks until a producer thread supplies a value
a006 = SizedQueue.new(1)
t006 = Thread.new { a006.push("late") }
p a006.pop
t006.join

# a consumer thread drains everything the producer closes behind
a007 = SizedQueue.new(2)
d007 = []
t007 = Thread.new do
  while (v = a007.pop)
    d007 << v
  end
end
4.times { |i| a007.push(i + 1) }
a007.close
t007.join
p d007
p a007.empty?
