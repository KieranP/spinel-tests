# frozen_string_literal: true
class Animal001; end
class Dog001 < Animal001; end

# Class#superclass
p(String.superclass)
v001 = String.superclass; p v001
p(Integer.superclass)
v002 = Integer.superclass; p v002
p(Object.superclass)
v003 = Object.superclass; p v003
p(Dog001.superclass)
v004 = Dog001.superclass; p v004
p(Animal001.superclass)
v005 = Animal001.superclass; p v005
c001 = Dog001
p(c001.superclass)
v006 = c001.superclass; p v006
p(BasicObject.superclass)
v007 = BasicObject.superclass; p v007
