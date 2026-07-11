# frozen_string_literal: true
# Mutex#lock
m001 = Mutex.new
m001.lock
p(m001.locked?)
m001.unlock
# lock returns the mutex itself (verify via the returned receiver)
m002 = Mutex.new; v002 = m002.lock; p v002.locked?; m002.unlock
m004 = Mutex.new
p(m004.lock && m004.locked?)
m004.unlock
m005 = Mutex.new
v005 = (m005.lock && :held)
p v005
m005.unlock
# multi-thread mutual exclusion: 8 threads * 1000 increments == 8000
m003 = Mutex.new
c003 = 0
t003 = 8.times.map do
  Thread.new do
    1000.times do
      m003.lock
      begin
        c003 += 1
      ensure
        m003.unlock
      end
    end
  end
end
t003.each(&:join)
p c003
