# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#class
p(Ver.new(5).class)
a001 = Ver.new(5); p(a001.class)
a002 = Ver.new(5); v002 = a002.class; p v002

# Comparable.class
p(Comparable.class)
v003 = Comparable.class; p v003
