# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#instance_variable_defined?
a070 = Obj195.new; p a070.instance_variable_defined?('@x')
a071 = Obj195.new; p a071.instance_variable_defined?('@y')
a072 = Obj195.new; v037 = a072.instance_variable_defined?('@x'); p v037
