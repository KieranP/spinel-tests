# frozen_string_literal: true
# Mutex#eql?

p(Mutex.new.eql?(Mutex.new))
a001 = Mutex.new
p a001.eql?(a001)
a002 = Mutex.new
b002 = Mutex.new
p a002.eql?(b002)
a003 = Mutex.new
c003 = a003.eql?(a003)
p c003.class
p c003

# == on the same receiver is supported
a004 = Mutex.new
p a004 == a004
p a004 == Mutex.new
p a004.class
