# frozen_string_literal: true
# Kernel#instance_variables
class Conf050
  def initialize; @host = "x"; @port = 1; end
end
o050 = Conf050.new
v050 = o050.instance_variables; p v050
p(o050.instance_variables.sort)
p(o050.instance_variables.length)
# The empty case on a plain object with no compile-time ivars is unsupported reflection:
# p(Object.new.instance_variables)   # WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
