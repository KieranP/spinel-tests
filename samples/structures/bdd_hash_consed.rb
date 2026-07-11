# frozen_string_literal: true
# Reduced Ordered Binary Decision Diagrams with hash-consing: every distinct node
# is created once, so structural equality becomes identity and apply/1,2 memoise
# on node ids. Builds BDDs for parity, majority and a small adder, then counts
# satisfying assignments without enumerating them.
# Inference: a node table Hash{[Integer,Integer,Integer]=>Node} keyed by an Array
# of ids, memo tables keyed the same way, and recursion whose return type is the
# user Node type unified with the two terminal singletons.

class Node
  attr_reader :id, :var, :low, :high

  def initialize(id, var, low, high)
    @id = id
    @var = var
    @low = low
    @high = high
  end

  def terminal? = @var == Float::INFINITY

  def to_s
    return @id.zero? ? "F" : "T" if terminal?

    "n#{@id}(x#{@var} ? n#{@high.id} : n#{@low.id})"
  end
end

class Bdd
  attr_reader :zero, :one, :order

  def initialize(order)
    @order = order
    @rank = {}
    order.each_with_index { |v, i| @rank[v] = i }
    @zero = Node.new(0, Float::INFINITY, nil, nil)
    @one = Node.new(1, Float::INFINITY, nil, nil)
    @table = {}
    @nodes = [@zero, @one]
    @apply_memo = {}
    @count_memo = {}
  end

  def node_count = @nodes.size

  def mk(var, low, high)
    return low if low.equal?(high)

    key = [var, low.id, high.id]
    found = @table[key]
    return found unless found.nil?

    fresh = Node.new(@nodes.size, var, low, high)
    @nodes << fresh
    @table[key] = fresh
    fresh
  end

  def var(name)
    mk(@rank.fetch(name), @zero, @one)
  end

  def negate(node) = apply(node, @one, :xor)

  def apply(a, b, op)
    key = [a.id, b.id, op]
    cached = @apply_memo[key]
    return cached unless cached.nil?

    result =
      if a.terminal? && b.terminal?
        combine(a.id, b.id, op) == 1 ? @one : @zero
      else
        top = [a.terminal? ? Float::INFINITY : a.var,
               b.terminal? ? Float::INFINITY : b.var].min
        lo = apply(branch(a, top, false), branch(b, top, false), op)
        hi = apply(branch(a, top, true), branch(b, top, true), op)
        mk(top, lo, hi)
      end
    @apply_memo[key] = result
    result
  end

  def sat_count(node, depth = 0)
    return node.id == 1 ? 2**(@order.size - depth) : 0 if node.terminal?

    key = [node.id, depth]
    cached = @count_memo[key]
    return cached unless cached.nil?

    skipped = node.var - depth
    total = (sat_count(node.low, node.var + 1) + sat_count(node.high, node.var + 1)) * (2**skipped)
    @count_memo[key] = total
    total
  end

  def evaluate(node, assignment)
    cur = node
    until cur.terminal?
      cur = assignment.fetch(@order[cur.var]) ? cur.high : cur.low
    end
    cur.id == 1
  end

  def any_sat(node)
    path = {}
    cur = node
    while !cur.terminal?
      if sat_count_below(cur.high).positive?
        path[@order[cur.var]] = true
        cur = cur.high
      else
        path[@order[cur.var]] = false
        cur = cur.low
      end
    end
    cur.id == 1 ? path : nil
  end

  private

  def sat_count_below(node) = node.terminal? ? node.id : 1

  def branch(node, top, high)
    return node if node.terminal? || node.var != top

    high ? node.high : node.low
  end

  def combine(a, b, op)
    case op
    when :and then a & b
    when :or  then a | b
    when :xor then a ^ b
    else raise ArgumentError, "unknown op #{op}"
    end
  end
end

ORDER = %i[a b c d].freeze
bdd = Bdd.new(ORDER)
va = bdd.var(:a)
vb = bdd.var(:b)
vc = bdd.var(:c)
vd = bdd.var(:d)

puts "== hash-consing =="
puts "var(:a) built twice is the same node: #{bdd.var(:a).equal?(va)}"
puts "node table size after 4 vars: #{bdd.node_count}"

parity = bdd.apply(bdd.apply(va, vb, :xor), bdd.apply(vc, vd, :xor), :xor)
puts
puts "== parity(a,b,c,d) =="
puts "root: #{parity}"
puts "sat count: #{bdd.sat_count(parity)} of #{2**ORDER.size}"

assignments = [false, true].product([false, true], [false, true], [false, true])
truth = assignments.map do |bits|
  env = ORDER.zip(bits).to_h
  [bits.map { |b| b ? 1 : 0 }.join, bdd.evaluate(parity, env)]
end
truth.each_slice(4) { |slice| puts slice.map { |bits, v| "#{bits}:#{v ? 1 : 0}" }.join("  ") }
puts "ruby-side parity agrees: #{truth.all? { |bits, v| bits.count("1").odd? == v }}"

puts
puts "== majority(a,b,c) =="
maj = bdd.apply(bdd.apply(bdd.apply(va, vb, :and), bdd.apply(va, vc, :and), :or),
                bdd.apply(vb, vc, :and), :or)
puts "root: #{maj}"
puts "sat count: #{bdd.sat_count(maj)} of 16"
maj_true = assignments.select { |bits| bdd.evaluate(maj, ORDER.zip(bits).to_h) }
puts "witness assignments: #{maj_true.size}"
puts "first witness: #{ORDER.zip(maj_true.first).to_h.inspect}"

puts
puts "== structural sharing =="
same = bdd.apply(va, vb, :and)
again = bdd.apply(va, vb, :and)
puts "a AND b is memoised: #{same.equal?(again)}"
commuted = bdd.apply(vb, va, :and)
puts "b AND a reduces to the same node: #{commuted.equal?(same)}"

tautology = bdd.apply(va, bdd.negate(va), :or)
contradiction = bdd.apply(va, bdd.negate(va), :and)
puts "a OR !a is the T terminal: #{tautology.equal?(bdd.one)}"
puts "a AND !a is the F terminal: #{contradiction.equal?(bdd.zero)}"
puts "total nodes allocated: #{bdd.node_count}"

puts
puts "== a satisfying path =="
p bdd.any_sat(maj)
p bdd.any_sat(contradiction)
