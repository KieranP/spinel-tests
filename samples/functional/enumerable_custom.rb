# frozen_string_literal: true
# A user class mixing in Enumerable by defining #each.
# Inference: Enumerable methods (map/select/reduce/min/max/sort/to_a/count/include?/
# first/partition) dispatched through a user-defined #each that yields Integers.

class NumberRange
  include Enumerable

  def initialize(from, to, step = 1)
    @from = from
    @to = to
    @step = step
  end

  def each
    return to_enum(:each) unless block_given?
    n = @from
    while n <= @to
      yield n
      n += @step
    end
  end
end

evens = NumberRange.new(2, 20, 2)
puts "to_a: #{evens.to_a.inspect}"
puts "sum via reduce: #{evens.reduce(0) { |acc, n| acc + n }}"
puts "map: #{evens.map { |n| n * n }.first(3).inspect}"
puts "select: #{evens.select { |n| n > 10 }.inspect}"
puts "min/max: #{evens.min}/#{evens.max}"
puts "count: #{evens.count}"
puts "include? 10: #{evens.include?(10)}"
puts "include? 11: #{evens.include?(11)}"
puts "sorted desc: #{evens.sort { |a, b| b <=> a }.first(3).inspect}"

small, big = NumberRange.new(1, 10).partition { |n| n <= 5 }
puts "partition: #{small.inspect} / #{big.inspect}"
puts "first 3: #{NumberRange.new(1, 100).first(3).inspect}"
p evens.find { |n| n > 15 }
p NumberRange.new(1, 5).inject(:+)
