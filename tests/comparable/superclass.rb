# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable.superclass (a Module has no #superclass -> NoMethodError)
r045 = (begin; Comparable.superclass; rescue NoMethodError; "nomethod"; end); p r045
