# frozen_string_literal: true
class Animal001; end
class Dog001 < Animal001; end
class Cat001 < Animal001; end

# Class#<=>
p(Dog001 <=> Animal001)
v001 = (Dog001 <=> Animal001); p v001
p(Animal001 <=> Dog001)
v002 = (Animal001 <=> Dog001); p v002
p(Dog001 <=> Dog001)
v003 = (Dog001 <=> Dog001); p v003
p(Dog001 <=> Cat001)
v004 = (Dog001 <=> Cat001); p v004
