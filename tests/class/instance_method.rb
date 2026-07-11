# frozen_string_literal: true
class Animal001; def breathe; "air"; end; end

# Class#instance_method
m001 = Animal001.instance_method(:breathe); p m001.name
p(Animal001.instance_method(:breathe).name)
# instance_method returns a bound Method, not an UnboundMethod: wrong .class, and callable directly.
m002 = Animal001.instance_method(:breathe); p m002.class
r002 = (Animal001.instance_method(:breathe).call rescue $!.class); p r002
