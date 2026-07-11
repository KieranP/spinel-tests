# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#tap
a010 = Ver.new(5); p(a010.tap { |o| o }.equal?(a010))
a011 = Ver.new(5); v011 = a011.tap { |o| o }; p(v011.equal?(a011))
