# frozen_string_literal: true
# Enumerable (custom #each ending in bare yield)
class Nums
  include Enumerable
  def each
    yield 3
  end
end

p Nums.new.to_a
