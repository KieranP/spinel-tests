# frozen_string_literal: true
# ConditionVariable#wait

# waiting outside a held mutex is a ThreadError
m001 = Mutex.new
a001 = ConditionVariable.new
r001 = (a001.wait(m001) rescue $!.class)
p r001

m002 = Mutex.new
a002 = ConditionVariable.new
c002 = (a002.wait(m002) rescue $!.class)
p c002.class
p c002

# wait releases the mutex, so the signaller can take it
m003 = Mutex.new
a003 = ConditionVariable.new
ready003 = false
seen003 = []
t003 = Thread.new do
  m003.synchronize do
    a003.wait(m003) until ready003
    seen003 << "consumer"
  end
end
m003.synchronize do
  seen003 << "producer"
  ready003 = true
  a003.signal
end
t003.join
p seen003
p ready003

# the waiter holds the mutex again once it returns from wait
m004 = Mutex.new
a004 = ConditionVariable.new
flag004 = false
held004 = nil
t004 = Thread.new do
  m004.synchronize do
    a004.wait(m004) until flag004
    held004 = m004.owned?
  end
end
m004.synchronize do
  flag004 = true
  a004.signal
end
t004.join
p held004

# a queue of values handed over one signal at a time
m005 = Mutex.new
a005 = ConditionVariable.new
buffer005 = []
taken005 = []
t005 = Thread.new do
  3.times do
    m005.synchronize do
      a005.wait(m005) while buffer005.empty?
      taken005 << buffer005.shift
    end
  end
end
3.times do |i|
  m005.synchronize do
    buffer005 << (i + 1) * 10
    a005.signal
  end
  Thread.pass
end
t005.join
p taken005
p buffer005
