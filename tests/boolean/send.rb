# frozen_string_literal: true
# TrueClass#send / TrueClass#__send__

p(true.send(:to_s))
p(true.send(:&, false))
p(true.__send__(:|, false))

a001 = true
p(a001.send(:class))

a002 = true
b002 = false
r002 = a002.send(:^, b002)
p r002

p(true.__send__(:!))

# FalseClass#send / FalseClass#__send__

p(false.send(:to_s))
p(false.send(:|, true))

a003 = false
r003 = a003.__send__(:&, true)
p r003

a004 = false
p(a004.send(:class))
