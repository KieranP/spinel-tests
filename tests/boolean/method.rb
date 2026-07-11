# frozen_string_literal: true
# TrueClass#method
p(true.method(:to_s).call)
p(true.method(:to_s).name)
m001 = true.method(:to_s); p(m001.call)
a002 = true; v002 = a002.method(:to_s).call; p v002

# Logical-operator method names raise NameError for a DEFINED method (should return a Method):
r003 = (true.method(:&).call(false) rescue $!.class); p r003
r004 = (true.method(:|).call(nil)   rescue $!.class); p r004
r005 = (true.method(:^).call(true)  rescue $!.class); p r005

# An undefined method name correctly raises NameError:
r006 = (true.method(:nope) rescue $!.class); p r006

# FalseClass#method
p(false.method(:to_s).call)
p(false.method(:class).call)
m007 = false.method(:to_s); p(m007.name)
b008 = false; v008 = b008.method(:to_s).call; p v008

r009 = (false.method(:&).call(true) rescue $!.class); p r009
r010 = (false.method(:|).call(true) rescue $!.class); p r010
r011 = (false.method(:nope) rescue $!.class); p r011
