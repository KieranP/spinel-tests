# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#freeze
a039 = Ver.new(5); a039.freeze; p(a039.frozen?)
a040 = Ver.new(5); v040 = a040.freeze; p(v040.frozen?)
