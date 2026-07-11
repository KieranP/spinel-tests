# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#instance_of?
p(Ver.new(5).instance_of?(Ver))
p(Ver.new(5).instance_of?(String))
a018 = Ver.new(5); p(a018.instance_of?(Ver))
a019 = Ver.new(5); v019 = a019.instance_of?(String); p v019
