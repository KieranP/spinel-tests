# frozen_string_literal: true
# TrueClass#public_method
p(true.public_method(:to_s).call)
p(true.public_method(:to_s).name)
m001 = true.public_method(:to_s); p(m001.call)
a002 = true; v002 = a002.public_method(:to_s).call; p v002

# Logical-operator method names raise NameError for a DEFINED method (should return a Method):
r003 = (true.public_method(:&).call(false) rescue $!.class); p r003
r004 = (true.public_method(:|).call(nil)   rescue $!.class); p r004
r005 = (true.public_method(:^).call(true)  rescue $!.class); p r005

# An undefined method name correctly raises NameError:
r006 = (true.public_method(:nope) rescue $!.class); p r006

# FalseClass#public_method
p(false.public_method(:to_s).call)
p(false.public_method(:class).call)
m007 = false.public_method(:to_s); p(m007.name)

r008 = (false.public_method(:&).call(true) rescue $!.class); p r008
r009 = (false.public_method(:|).call(true) rescue $!.class); p r009
r010 = (false.public_method(:nope) rescue $!.class); p r010
