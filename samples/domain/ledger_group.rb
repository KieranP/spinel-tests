# frozen_string_literal: true
# Group ledger entries by category, compute running balances, using Struct.
Entry = Struct.new(:date, :category, :amount) do
  def credit?
    amount >= 0
  end
end

entries = [
  Entry.new("01-01", "food", -25),
  Entry.new("01-02", "pay", 1000),
  Entry.new("01-03", "food", -15),
  Entry.new("01-04", "rent", -500),
  Entry.new("01-05", "pay", 200),
]

by_cat = entries.group_by(&:category)
by_cat.each do |cat, list|
  total = list.sum(&:amount)
  puts "#{cat.ljust(6)}: #{total} (#{list.length} entries)"
end

balance = 0
entries.each do |e|
  balance += e.amount
end
puts "final balance: #{balance}"

credits = entries.select(&:credit?)
puts "credits: #{credits.map(&:amount).inspect}"
puts "biggest expense: #{entries.min_by(&:amount).category}"
