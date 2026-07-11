# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#itself
a008 = Ver.new(5); p(a008.itself.equal?(a008))
a009 = Ver.new(5); v009 = a009.itself; p(v009.equal?(a009))
