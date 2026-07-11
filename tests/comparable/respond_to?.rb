# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#respond_to?
p(Ver.new(5).respond_to?(:<))
p(Ver.new(5).respond_to?(:definitely_not_a_method_xyz))
a020 = Ver.new(5); p(a020.respond_to?(:<))
a021 = Ver.new(5); v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
