# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def x; @x; end
end

# Object#instance_variable_set
a110 = Obj195.new; a110.instance_variable_set(:@x, 99); p a110.x
a111 = Obj195.new; v110 = a111.instance_variable_set(:@x, 42); p v110
a112 = Obj195.new; a112.instance_variable_set(:@x, 5); p a112.instance_variable_get(:@x)
# instance_variable_set returns the assigned value
a113 = Obj195.new; v111 = a113.instance_variable_set(:@x, 7); p v111
# string literal name form
a114 = Obj195.new; a114.instance_variable_set('@x', 3); p a114.x
# creating a brand-new ivar (never declared elsewhere) via a literal name
a115 = Obj195.new; a115.instance_variable_set(:@y, 11); p a115.instance_variable_get(:@y)
# setting then getting through the same object round-trips
a116 = Obj195.new; a116.instance_variable_set(:@x, 21); v112 = a116.instance_variable_get(:@x); p v112
# a frozen receiver must refuse the write
a117 = Obj195.new.freeze
r113 = (a117.instance_variable_set(:@x, 33) rescue $!.class); p r113
p a117.x
