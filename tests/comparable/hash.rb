# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#hash
p(Ver.new(5).hash.is_a?(Integer))
a022 = Ver.new(5); p(a022.hash == a022.hash)
a023 = Ver.new(5); v023 = (a023.hash.is_a?(Integer)); p v023
