# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#equal?
a026 = Ver.new(5); p(a026.equal?(a026))
a027 = Ver.new(5); b027 = Ver.new(5); p(a027.equal?(b027))
a028 = Ver.new(5); v028 = a028.equal?(a028); p v028
