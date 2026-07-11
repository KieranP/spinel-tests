# frozen_string_literal: true
# ConditionVariable.new
p(ConditionVariable.new.class)

a001 = ConditionVariable.new
p a001.class

a002 = ConditionVariable.new
p a002.class.name

a003 = ConditionVariable.new
c003 = a003
p c003.class

# two condition variables are distinct objects
a004 = ConditionVariable.new
b004 = ConditionVariable.new
p a004 == b004
p a004 == a004
p a004.equal?(a004)

# signalling a condition nobody waits on is a no-op that returns the cv
a005 = ConditionVariable.new
p a005.signal.class
p a005.broadcast.class

# a fresh cv can gate a handoff immediately
m006 = Mutex.new
a006 = ConditionVariable.new
ready006 = false
t006 = Thread.new do
  m006.synchronize do
    a006.wait(m006) until ready006
    "woke"
  end
end
m006.synchronize do
  ready006 = true
  a006.signal
end
p t006.value
