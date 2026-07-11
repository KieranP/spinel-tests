# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#to_s
p(Ver.new(5).to_s.is_a?(String))
a035 = Ver.new(5); v035 = a035.to_s; p(v035.is_a?(String))
