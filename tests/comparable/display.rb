# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#display
Ver.new(5).class.display
puts
a041 = Ver.new(5); v041 = a041.class.display; puts; p v041
