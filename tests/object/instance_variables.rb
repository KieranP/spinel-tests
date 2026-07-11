# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; @y = 8; end
end

# Object#instance_variables
p(Obj195.new.instance_variables)
a113 = Obj195.new; v111 = a113.instance_variables; p v111
