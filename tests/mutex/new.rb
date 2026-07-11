# frozen_string_literal: true
# Mutex.new
p(Mutex.new.locked?)
m001 = Mutex.new; p m001.locked?
m002 = Mutex.new; v002 = m002.is_a?(Mutex); p v002
# two mutexes are independent
m003 = Mutex.new; m004 = Mutex.new
m003.lock
p m003.locked?
p m004.locked?
m003.unlock
p Mutex.new.class
p Mutex.new.frozen?

# The Mutex class constant itself, used as a value.
zm10 = (Mutex rescue $!.class); p zm10
zm11 = (Mutex.name rescue $!.class); p zm11
# an instance reports its class correctly
p Mutex.new.class
