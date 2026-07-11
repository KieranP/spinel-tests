# frozen_string_literal: true
# An event-sourced account: commands are validated against current state and either
# rejected or appended to an immutable log, state is a left fold of that log, and
# rebuilding from a snapshot plus a tail must equal a full replay from event zero.
# Inference: heterogeneous Data event types in one Array, dispatched by pattern
# match to per-event apply arms that each return a fresh state Struct, so the fold's
# accumulator type has to unify across every arm.

Opened    = Data.define(:owner, :currency)
Deposited = Data.define(:amount, :memo)
Withdrawn = Data.define(:amount, :memo)
Frozen    = Data.define(:reason)
Unfrozen  = Data.define
Closed    = Data.define(:reason)

State = Struct.new(:owner, :currency, :balance, :status, :events_applied, keyword_init: true) do
  def open? = status == :open
  def to_s = "#{owner} #{currency} #{balance} (#{status}, #{events_applied} events)"
end

EMPTY = State.new(owner: nil, currency: nil, balance: 0, status: :none, events_applied: 0).freeze

def apply(state, event)
  applied = state.events_applied + 1
  case event
  in Opened[owner:, currency:]
    State.new(owner: owner, currency: currency, balance: 0, status: :open, events_applied: applied)
  in Deposited[amount:, memo: _]
    state.class.new(**state.to_h.merge(balance: state.balance + amount, events_applied: applied))
  in Withdrawn[amount:, memo: _]
    state.class.new(**state.to_h.merge(balance: state.balance - amount, events_applied: applied))
  in Frozen[reason: _]
    state.class.new(**state.to_h.merge(status: :frozen, events_applied: applied))
  in Unfrozen
    state.class.new(**state.to_h.merge(status: :open, events_applied: applied))
  in Closed[reason: _]
    state.class.new(**state.to_h.merge(status: :closed, events_applied: applied))
  end
end

def replay(events, from = EMPTY) = events.reduce(from) { |state, event| apply(state, event) }

class Account
  attr_reader :log, :rejections

  def initialize
    @log = []
    @rejections = []
  end

  def state = replay(@log)

  def handle(command)
    current = state
    problem = reject_reason(current, command)
    if problem.nil?
      @log << command
      [:accepted, command]
    else
      @rejections << [command, problem]
      [:rejected, problem]
    end
  end

  def snapshot_at(index) = [replay(@log.first(index)), @log.drop(index)]

  private

  def reject_reason(state, command)
    case [state.status, command]
    in [:none, Opened] then nil
    in [:none, _] then "account not opened"
    in [_, Opened] then "already opened"
    in [:closed, _] then "account is closed"
    in [:frozen, Unfrozen] then nil
    in [:frozen, _] then "account is frozen"
    in [:open, Unfrozen] then "account is not frozen"
    in [:open, Withdrawn[amount:, memo: _]] if amount > state.balance
      "insufficient funds: #{amount} > #{state.balance}"
    in [:open, Deposited[amount:, memo: _]] if amount <= 0
      "deposit must be positive"
    else nil
    end
  end
end

account = Account.new

COMMANDS = [
  Deposited.new(amount: 50, memo: "too early"),
  Opened.new(owner: "ada", currency: "GBP"),
  Opened.new(owner: "bob", currency: "USD"),
  Deposited.new(amount: 250, memo: "salary"),
  Deposited.new(amount: 0, memo: "empty"),
  Withdrawn.new(amount: 80, memo: "rent"),
  Withdrawn.new(amount: 500, memo: "car"),
  Frozen.new(reason: "review"),
  Deposited.new(amount: 10, memo: "while frozen"),
  Unfrozen.new,
  Unfrozen.new,
  Deposited.new(amount: 30, memo: "refund"),
  Withdrawn.new(amount: 100, memo: "bills"),
  Closed.new(reason: "moved bank"),
  Deposited.new(amount: 5, memo: "after close")
].freeze

puts "== command handling =="
COMMANDS.each_with_index do |command, i|
  outcome, detail = account.handle(command)
  label = command.class.name
  puts format("%2d %-10s %-9s %s", i, label, outcome,
              outcome == :accepted ? "" : detail)
end

puts
puts "== resulting log =="
account.log.each_with_index { |e, i| puts format("%2d %s", i, e.inspect) }
puts "accepted: #{account.log.size}, rejected: #{account.rejections.size}"

puts
puts "== final state =="
final = account.state
puts final
puts "balance from arithmetic: #{250 - 80 + 30 - 100}"
puts "matches: #{final.balance == 250 - 80 + 30 - 100}"

puts
puts "== rejections by reason =="
account.rejections.group_by { |_c, reason| reason }.sort.each do |reason, entries|
  puts "  #{reason} (#{entries.size})"
end

puts
puts "== snapshot plus tail equals full replay =="
(0..account.log.size).each do |cut|
  snapshot, tail = account.snapshot_at(cut)
  rebuilt = replay(tail, snapshot)
  raise "mismatch at #{cut}" unless rebuilt == final
end
puts "every cut point rebuilds identically: true (#{account.log.size + 1} cut points)"

mid, tail = account.snapshot_at(3)
puts "snapshot after 3 events: #{mid}"
puts "tail length: #{tail.size}, rebuilt: #{replay(tail, mid)}"

puts
puts "== the log is append-only and totals reconcile =="
deposits = account.log.grep(Deposited).sum(&:amount)
withdrawals = account.log.grep(Withdrawn).sum(&:amount)
puts "deposits #{deposits}, withdrawals #{withdrawals}, net #{deposits - withdrawals}"
puts "net equals balance: #{deposits - withdrawals == final.balance}"

kinds = account.log.map { |e| e.class.name }.tally.sort
puts "log composition: #{kinds.inspect}"

memos = account.log.filter_map { |e| e.respond_to?(:memo) ? e.memo : nil }
puts "memos kept: #{memos.inspect}"

puts
puts "== replaying a prefix never sees the future =="
prefixes = (0..account.log.size).map { |n| replay(account.log.first(n)).balance }
puts "balance after each prefix: #{prefixes.inspect}"
puts "monotone event count: #{(0..account.log.size).map { |n| replay(account.log.first(n)).events_applied } == (0..account.log.size).to_a}"
