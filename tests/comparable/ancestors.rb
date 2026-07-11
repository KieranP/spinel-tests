# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable.ancestors
p(Comparable.ancestors)
v044 = Comparable.ancestors; p v044
