# frozen_string_literal: true
# Object#public_method
p("hello".public_method(:upcase).call)
m001 = "hello".public_method(:upcase); p m001.call
r001 = ("hello".public_method(:upcase).call rescue $!.class); p r001
