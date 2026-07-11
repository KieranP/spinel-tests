# frozen_string_literal: true
module Walks001; end
class Animal001; end
class Dog001 < Animal001; include Walks001; end

# Class#include?
p(Dog001.include?(Walks001))
v001 = Dog001.include?(Walks001); p v001
p(Animal001.include?(Walks001))
p(Dog001.include?(Comparable))
