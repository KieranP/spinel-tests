# frozen_string_literal: true
class C001
  attr_writer :z
  def get; @z; end
end

# Class#attr_writer (declarative, in class body)
o001 = C001.new
o001.z = 8
p(o001.get)
v001 = o001.get; p v001
