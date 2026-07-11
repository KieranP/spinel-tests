# frozen_string_literal: true
# TrueClass#clone

p(true.clone.class)

a001 = true
b001 = a001.clone
p(b001.class)

a002 = true
v002 = a002.clone
p(v002.equal?(a002))

# FalseClass#clone

p(false.clone.class)

a003 = false
b003 = a003.clone
p(b003.class)

a004 = false
v004 = a004.clone
p(v004.equal?(a004))

# clone(freeze: true) is a no-op on an immediate — returns the (already-frozen) receiver.
p(true.clone(freeze: true).equal?(true))
a005 = true; v005 = a005.clone(freeze: true); p(v005.equal?(a005))
p(false.clone(freeze: true).equal?(false))

# clone(freeze: false) should raise ArgumentError (an immediate can't be unfrozen); Spinel
# instead returns the receiver with no error (Integer/Symbol correctly raise).
r006 = (true.clone(freeze: false) rescue $!.class); p r006
r007 = (false.clone(freeze: false) rescue $!.class); p r007
