# frozen_string_literal: true
class Animal001; end
class Dog001 < Animal001; end

# Class#==
p(Dog001 == Dog001)
v001 = (Dog001 == Dog001); p v001
p(Dog001 == Animal001)
v002 = (Dog001 == Animal001); p v002
p(Integer == Integer)
v003 = (Integer == Integer); p v003
p(Dog001 == Object)
v004 = (Dog001 == Object); p v004
c001 = Dog001
p(c001 == Dog001)
v005 = (c001 == Dog001); p v005
