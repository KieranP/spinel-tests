# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#nil?
p(Ver.new(5).nil?)
a006 = Ver.new(5); p(a006.nil?)
a007 = Ver.new(5); v007 = a007.nil?; p v007
