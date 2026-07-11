# frozen_string_literal: true
# Money class using Comparable and integer cents
class Money
  include Comparable
  attr_reader :cents
  def initialize(cents)
    @cents = cents
  end
  def <=>(other)
    cents <=> other.cents
  end
  def +(other) = Money.new(cents + other.cents)
  def -(other) = Money.new(cents - other.cents)
  def to_s
    sign = cents < 0 ? "-" : ""
    d, c = cents.abs.divmod(100)
    format("%s$%d.%02d", sign, d, c)
  end
end

prices = [Money.new(1599), Money.new(999), Money.new(2500), Money.new(1250)]

puts "sorted: #{prices.sort.map(&:to_s).join(', ')}"
puts "max: #{prices.max}"
puts "min: #{prices.min}"

total = prices.inject(Money.new(0)) { |acc, m| acc + m }
puts "total: #{total}"

budget = Money.new(1500)
affordable = prices.select { |m| m <= budget }
puts "affordable: #{affordable.map(&:to_s).join(', ')}"

p prices.min.clamp(Money.new(1000), Money.new(2000)).to_s
p (Money.new(1599) > Money.new(999))
p Money.new(500).between?(Money.new(100), Money.new(1000))
p prices.sort.map(&:cents)
