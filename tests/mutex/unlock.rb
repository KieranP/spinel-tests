# frozen_string_literal: true
# Mutex#unlock
m001 = Mutex.new
m001.lock
m001.unlock
p(m001.locked?)
# unlock returns the mutex itself (verify via the returned receiver)
m002 = Mutex.new; m002.lock; v002 = m002.unlock; p v002.locked?
# unlocking a mutex that is not locked raises ThreadError
r003 = (Mutex.new.unlock rescue $!.class); p r003
m004 = Mutex.new; r004 = (m004.unlock rescue $!.class); p r004
