# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#then
a012 = Ver.new(5); p(a012.then { |o| o.equal?(a012) })
a013 = Ver.new(5); v013 = a013.then { |o| o.equal?(a013) }; p v013
