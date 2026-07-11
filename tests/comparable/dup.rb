# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#dup
p(Ver.new(5).dup.class)
a037 = Ver.new(5); b037 = a037.dup; p(b037.class)
a038 = Ver.new(5); v038 = a038.dup; p(v038 == a038)
