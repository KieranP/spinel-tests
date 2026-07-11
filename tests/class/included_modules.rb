# frozen_string_literal: true
module Walks001; end
class Dog001; include Walks001; end

# Class#included_modules
p(Dog001.included_modules.include?(Walks001))
v001 = Dog001.included_modules; p v001.include?(Walks001)
p(Dog001.included_modules.include?(Kernel))
