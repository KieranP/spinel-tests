# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#inspect
p(Ver.new(5).inspect.is_a?(String))
a033 = Ver.new(5); v033 = a033.inspect; p(v033.is_a?(String))
