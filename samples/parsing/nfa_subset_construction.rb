# frozen_string_literal: true
# Convert an NFA with epsilon transitions into an equivalent DFA by subset
# construction, then run the DFA over sample inputs.
#
# The NFA recognises (a|b)*abb — the classic dragon-book example.

require "set"

EPSILON = nil

class NFA
  attr_reader :start, :accepting

  def initialize(start, accepting)
    @start = start
    @accepting = accepting
    @edges = {}
  end

  def add(from, symbol, to)
    @edges[from] ||= []
    @edges[from] << [symbol, to]
    self
  end

  def moves(state, symbol)
    (@edges[state] || []).select { |sym, _| sym == symbol }.map { |_, to| to }
  end

  def symbols
    out = Set.new
    @edges.each_value do |list|
      list.each { |sym, _| out << sym unless sym == EPSILON }
    end
    out.to_a.sort
  end

  # All states reachable from `states` using only epsilon edges.
  def epsilon_closure(states)
    stack = states.to_a
    seen = Set.new(stack)
    until stack.empty?
      s = stack.pop
      moves(s, EPSILON).each do |t|
        next if seen.include?(t)
        seen << t
        stack.push(t)
      end
    end
    seen
  end

  def move_set(states, symbol)
    out = Set.new
    states.each { |s| moves(s, symbol).each { |t| out << t } }
    out
  end
end

class DFA
  def initialize
    @transitions = {}
    @accepting = Set.new
    @start = 0
  end

  attr_accessor :start
  attr_reader :transitions, :accepting

  def add(from, symbol, to)
    @transitions[[from, symbol]] = to
  end

  def mark_accepting(state)
    @accepting << state
  end

  def state_count
    ids = Set.new([@start])
    @transitions.each_key { |(from, _)| ids << from }
    @transitions.each_value { |to| ids << to }
    ids.size
  end

  def run(input)
    cur = @start
    input.each_char do |ch|
      cur = @transitions[[cur, ch]]
      return nil if cur.nil?
    end
    cur
  end

  def accepts?(input)
    st = run(input)
    !st.nil? && @accepting.include?(st)
  end
end

def subset_construction(nfa)
  alphabet = nfa.symbols
  dfa = DFA.new

  start_set = nfa.epsilon_closure(Set.new([nfa.start]))
  ids = { start_set => 0 }
  order = [start_set]
  queue = [start_set]

  until queue.empty?
    current = queue.shift
    from_id = ids[current]
    dfa.mark_accepting(from_id) if current.include?(nfa.accepting)

    alphabet.each do |sym|
      target = nfa.epsilon_closure(nfa.move_set(current, sym))
      next if target.empty?
      unless ids.key?(target)
        ids[target] = ids.size
        order << target
        queue << target
      end
      dfa.add(from_id, sym, ids[target])
    end
  end

  [dfa, order, alphabet]
end

# (a|b)*abb, states 0..10
nfa = NFA.new(0, 10)
nfa.add(0, EPSILON, 1).add(0, EPSILON, 7)
nfa.add(1, EPSILON, 2).add(1, EPSILON, 4)
nfa.add(2, "a", 3)
nfa.add(3, EPSILON, 6)
nfa.add(4, "b", 5)
nfa.add(5, EPSILON, 6)
nfa.add(6, EPSILON, 1).add(6, EPSILON, 7)
nfa.add(7, "a", 8)
nfa.add(8, "b", 9)
nfa.add(9, "b", 10)

puts "NFA alphabet: #{nfa.symbols.inspect}"
puts "epsilon-closure of {0}: #{nfa.epsilon_closure(Set.new([0])).to_a.sort.inspect}"
puts

dfa, order, alphabet = subset_construction(nfa)

puts "subset construction produced #{order.size} DFA states"
puts
puts "state  set                        #{alphabet.map { |s| s.ljust(5) }.join}accept"
order.each_with_index do |set, id|
  cells = alphabet.map do |sym|
    to = dfa.transitions[[id, sym]]
    (to.nil? ? "-" : to.to_s).ljust(5)
  end
  mark = dfa.accepting.include?(id) ? "yes" : ""
  puts format("%-6d %-26s %s%s", id, set.to_a.sort.inspect, cells.join, mark)
end
puts

puts "recognition of (a|b)*abb:"
["abb", "aabb", "babb", "abab", "ab", "", "abbb", "bbabb", "aab"].each do |input|
  got = dfa.accepts?(input)
  expected = !(input =~ /\A[ab]*abb\z/).nil?
  flag = got == expected ? "  " : "!!"
  puts format("  %-6s dfa=%-5s regexp=%-5s %s", input.inspect, got, expected, flag)
end
puts

puts "total transitions: #{dfa.transitions.size}"
puts "distinct states:   #{dfa.state_count}"
puts "accepting states:  #{dfa.accepting.to_a.sort.inspect}"
