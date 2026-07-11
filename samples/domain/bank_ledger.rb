# frozen_string_literal: true
# Bank account with a transaction ledger.
# Inference: an Account holds an Integer balance and an Array of [Symbol,
# Integer] entries; methods mutate state and return typed summaries.

class Account
  attr_reader :balance

  def initialize(owner)
    @owner = owner
    @balance = 0
    @ledger = []
  end

  def deposit(amount)
    @balance += amount
    @ledger << [:deposit, amount]
    self
  end

  def withdraw(amount)
    if amount > @balance
      @ledger << [:rejected, amount]
    else
      @balance -= amount
      @ledger << [:withdraw, amount]
    end
    self
  end

  def statement
    @ledger.map { |kind, amt| "#{kind}: #{amt}" }
  end

  def total_deposited
    @ledger.select { |kind, _| kind == :deposit }.sum { |_, amt| amt }
  end
end

acct = Account.new("Ada")
acct.deposit(100).withdraw(30).deposit(50).withdraw(1000)

puts acct.statement
p acct.balance
p acct.total_deposited
