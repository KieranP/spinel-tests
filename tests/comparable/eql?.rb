# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#eql?
p(Ver.new(5).eql?(Ver.new(5)))
a029 = Ver.new(5); b029 = Ver.new(5); p(a029.eql?(b029))
a030 = Ver.new(5); v030 = a030.eql?(a030); p v030
