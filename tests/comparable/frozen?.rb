# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#frozen?
p(Ver.new(5).frozen?)
a004 = Ver.new(5); p(a004.frozen?)
a005 = Ver.new(5); v005 = a005.frozen?; p v005
