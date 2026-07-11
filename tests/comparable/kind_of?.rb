# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#kind_of?
p(Ver.new(5).kind_of?(Comparable))
p(Ver.new(5).kind_of?(Object))
p(Ver.new(5).kind_of?(String))
a016 = Ver.new(5); p(a016.kind_of?(Comparable))
a017 = Ver.new(5); v017 = a017.kind_of?(String); p v017
