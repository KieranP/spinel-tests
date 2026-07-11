# frozen_string_literal: true
class Box001; X001 = 1; end

# Class#const_defined?
p(Box001.const_defined?(:X001))
v001 = Box001.const_defined?(:X001); p v001
p(Box001.const_defined?(:Nope001))
v002 = Box001.const_defined?(:Nope001); p v002
c001 = Box001
p(c001.const_defined?(:X001))
v003 = c001.const_defined?(:X001); p v003

# a constant reached through the ancestry: from a superclass and from a module
module Cfg002; MAX002 = 10; end
class Up002; TAG002 = "up"; end
class Down002 < Up002; include Cfg002; OWN002 = 1; end
p(Down002.const_defined?(:OWN002))
p(Down002.const_defined?(:TAG002))
v004 = Down002.const_defined?(:TAG002); p v004
p(Down002.const_defined?(:MAX002))
v005 = Down002.const_defined?(:MAX002); p v005
# the second argument turns the ancestry search off
p(Down002.const_defined?(:OWN002, false))
p(Down002.const_defined?(:TAG002, false))
v006 = Down002.const_defined?(:TAG002, false); p v006
p(Down002.const_defined?(:MAX002, false))
# a method body resolves the inherited constants by bare name
class Down003 < Up002
  include Cfg002
  def tag; TAG002; end
  def max; MAX002; end
end
p(Down003.new.tag)
p(Down003.new.max)
v007 = Down003.new.max; p v007
