# frozen_string_literal: true
class Animal001; end
class Dog001 < Animal001; end

# Class#name
p(Dog001.name)
v001 = Dog001.name; p v001
p(Animal001.name)
v002 = Animal001.name; p v002
p(Integer.name)
v003 = Integer.name; p v003
c001 = Dog001
p(c001.name)
v004 = c001.name; p v004
