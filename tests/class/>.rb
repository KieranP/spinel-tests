# frozen_string_literal: true
module Walks001; end
class Animal001; end
class Dog001 < Animal001; include Walks001; end
class Cat001 < Animal001; end

# Class#>
p(Animal001 > Dog001)
v001 = (Animal001 > Dog001); p v001
p(Dog001 > Animal001)
v002 = (Dog001 > Animal001); p v002
p(Dog001 > Dog001)
v003 = (Dog001 > Dog001); p v003
p(Walks001 > Dog001)
v004 = (Walks001 > Dog001); p v004
c001 = Animal001; b001 = Dog001
p(c001 > b001)
v005 = (c001 > b001); p v005
p(Dog001 > Cat001)
v006 = (Dog001 > Cat001); p v006
