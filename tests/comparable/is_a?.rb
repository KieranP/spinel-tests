# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#is_a?
p(Ver.new(5).is_a?(Comparable))
p(Ver.new(5).is_a?(Object))
p(Ver.new(5).is_a?(String))
a014 = Ver.new(5); p(a014.is_a?(Comparable))
a015 = Ver.new(5); v015 = a015.is_a?(String); p v015
