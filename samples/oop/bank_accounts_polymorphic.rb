# frozen_string_literal: true
# Account hierarchy with a polymorphic interest calculation.
# Inference: a superclass plus subclasses that override #interest; an Array of the
# base type dispatches to each subclass's method — inheritance-based polymorphism.

class Account
  attr_reader :balance
  def initialize(balance) = @balance = balance
  def interest = 0.0
  def after_interest = @balance + interest
  def kind = "account"
end

class Savings < Account
  def interest = @balance * 0.05
  def kind = "savings"
end

class Checking < Account
  def interest = @balance > 1000 ? @balance * 0.01 : 0.0
  def kind = "checking"
end

accounts = [Savings.new(2000), Checking.new(500), Checking.new(5000), Savings.new(100)]

accounts.each { |a| puts "#{a.kind}: #{a.after_interest.round(2)}" }
p accounts.sum(&:interest).round(2)
p accounts.max_by(&:balance).kind
p accounts.select { |a| a.interest > 0 }.length
