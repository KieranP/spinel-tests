# frozen_string_literal: true
# Money value object used in arithmetic and containers.
# Inference: a user value type flowing through reduce, include?, max_by — the
# in-container value equality (#==) is a known weak surface.

class Money
  attr_reader :cents
  def initialize(cents) = @cents = cents
  def +(other) = Money.new(@cents + other.cents)
  def *(n) = Money.new(@cents * n)
  def ==(other) = other.is_a?(Money) && @cents == other.cents
  def <=>(other) = @cents <=> other.cents
  def to_s = format("$%.2f", @cents / 100.0)
end

prices = [Money.new(150), Money.new(299), Money.new(150), Money.new(1000)]

total = prices.reduce(Money.new(0)) { |acc, m| acc + m }
puts total.to_s
puts (Money.new(150) * 3).to_s
p prices.include?(Money.new(299))
p prices.include?(Money.new(555))
puts prices.max.to_s
puts prices.min.to_s
p prices.count { |m| m.cents >= 200 }
