# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable.superclass (a Module has no #superclass -> NoMethodError)
r045 = (begin; Enumerable.superclass; rescue NoMethodError; "nomethod"; end); p r045
