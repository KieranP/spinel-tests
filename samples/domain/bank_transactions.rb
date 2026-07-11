# frozen_string_literal: true
# Bank accounts with Data records, transaction log, balance reconstruction.
Txn = Data.define(:account, :amount, :kind) do
  def signed
    kind == :debit ? -amount : amount
  end
end

txns = [
  Txn.new("checking", 1000, :credit),
  Txn.new("savings", 500, :credit),
  Txn.new("checking", 200, :debit),
  Txn.new("checking", 50, :debit),
  Txn.new("savings", 100, :debit),
]

balances = Hash.new(0)
txns.each { |t| balances[t.account] += t.signed }
balances.sort.each { |acct, bal| puts "#{acct}: #{bal}" }

# group and summarize
by_account = txns.group_by(&:account)
by_account.sort.each do |acct, list|
  credits = list.select { |t| t.kind == :credit }.sum(&:amount)
  debits = list.select { |t| t.kind == :debit }.sum(&:amount)
  puts "#{acct}: +#{credits} -#{debits} (#{list.length} txns)"
end

puts "total volume: #{txns.sum(&:amount)}"
puts "largest txn: #{txns.max_by(&:amount).amount}"

# pattern match on Data
txns.first(2).each do |t|
  case t
  in Txn[account:, amount:, kind: :credit]
    puts "credit to #{account}: #{amount}"
  in Txn[account:, kind: :debit]
    puts "debit from #{account}"
  end
end
