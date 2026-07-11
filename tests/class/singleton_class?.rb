# frozen_string_literal: true
class C001; end

# Class#singleton_class?
p(C001.singleton_class?)
v001 = C001.singleton_class?; p v001
p(Integer.singleton_class?)
