# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#object_id
p(Ver.new(5).object_id.is_a?(Integer))
a024 = Ver.new(5); p(a024.object_id == a024.object_id)
a025 = Ver.new(5); v025 = (a025.object_id.is_a?(Integer)); p v025
