# frozen_string_literal: true
# A tiny query planner driven entirely by pattern matching: expression nodes expose
# `deconstruct` and `deconstruct_keys`, so the optimiser rewrites trees with array
# patterns, hash patterns, find patterns, guards and alternatives. Each rewrite is
# checked by evaluating the tree before and after, so a mis-matched pattern shows up
# as a changed result, not just changed structure.
# Inference: recursive user nodes matched by several pattern kinds in one `case`, a
# rewriter whose return type is the node union, and deconstruct methods whose Array /
# Hash shapes must agree with every pattern arm that reads them.

class Node
  def deconstruct_keys(keys) = to_h
  def deconstruct = to_h.values
end

class Lit < Node
  attr_reader :value

  def initialize(value) = @value = value
  def to_h = { kind: :lit, value: @value }
  def to_s = @value.inspect
end

class Col < Node
  attr_reader :name

  def initialize(name) = @name = name
  def to_h = { kind: :col, name: @name }
  def to_s = @name.to_s
end

class BinOp < Node
  attr_reader :op, :left, :right

  def initialize(op, left, right)
    @op = op
    @left = left
    @right = right
  end

  def to_h = { kind: :binop, op: @op, left: @left, right: @right }
  def to_s = "(#{@left} #{@op} #{@right})"
end

class Not < Node
  attr_reader :operand

  def initialize(operand) = @operand = operand
  def to_h = { kind: :not, operand: @operand }
  def to_s = "!#{@operand}"
end

ROWS = [
  { id: 1, dept: "eng",   salary: 120, active: true },
  { id: 2, dept: "eng",   salary: 90,  active: false },
  { id: 3, dept: "sales", salary: 70,  active: true },
  { id: 4, dept: "sales", salary: 130, active: true },
  { id: 5, dept: "ops",   salary: 60,  active: false }
].freeze

def evaluate(node, row)
  case node
  in { kind: :lit, value: }        then value
  in { kind: :col, name: }         then row.fetch(name)
  in { kind: :not, operand: }      then !truthy(evaluate(operand, row))
  in { kind: :binop, op:, left:, right: }
    l = evaluate(left, row)
    r = evaluate(right, row)
    case op
    when :and then truthy(l) && truthy(r)
    when :or  then truthy(l) || truthy(r)
    when :eq  then l == r
    when :gt  then l > r
    when :lt  then l < r
    when :add then l + r
    else raise ArgumentError, "bad op #{op}"
    end
  else raise ArgumentError, "bad node #{node.class}"
  end
end

def truthy(v) = !(v.nil? || v == false)

# Rewrites, each expressed as one pattern arm.
def simplify(node)
  case node
  # constant folding on two literals
  in { kind: :binop, op:, left: Lit(value: l), right: Lit(value: r) } if %i[add gt lt eq].include?(op)
    Lit.new(evaluate(BinOp.new(op, Lit.new(l), Lit.new(r)), {}))
  # x AND true  /  true AND x
  in { kind: :binop, op: :and, left: Lit(value: true), right: }
    simplify(right)
  in { kind: :binop, op: :and, left:, right: Lit(value: true) }
    simplify(left)
  # x AND false -> false (either side)
  in { kind: :binop, op: :and, left: Lit(value: false) } |
     { kind: :binop, op: :and, right: Lit(value: false) }
    Lit.new(false)
  # x OR false -> x
  in { kind: :binop, op: :or, left:, right: Lit(value: false) }
    simplify(left)
  # double negation
  in { kind: :not, operand: Not(operand: inner) }
    simplify(inner)
  # recurse
  in { kind: :binop, op:, left:, right: }
    BinOp.new(op, simplify(left), simplify(right))
  in { kind: :not, operand: }
    Not.new(simplify(operand))
  else node
  end
end

def col(name) = Col.new(name)
def lit(value) = Lit.new(value)
def op(o, l, r) = BinOp.new(o, l, r)

QUERIES = {
  "active engineers" =>
    op(:and, op(:eq, col(:dept), lit("eng")), op(:eq, col(:active), lit(true))),
  "well paid, redundant AND true" =>
    op(:and, op(:gt, col(:salary), lit(100)), lit(true)),
  "impossible" =>
    op(:and, op(:eq, col(:dept), lit("ops")), lit(false)),
  "double negated" =>
    Not.new(Not.new(op(:eq, col(:dept), lit("sales")))),
  "folded arithmetic" =>
    op(:gt, col(:salary), op(:add, lit(50), lit(25))),
  "or with dead branch" =>
    op(:or, op(:lt, col(:salary), lit(65)), lit(false))
}.freeze

puts "== each query, before and after simplification =="
QUERIES.each do |label, tree|
  simplified = simplify(tree)
  before = ROWS.select { |r| truthy(evaluate(tree, r)) }.map { |r| r[:id] }
  after  = ROWS.select { |r| truthy(evaluate(simplified, r)) }.map { |r| r[:id] }
  puts format("  %-28s %-46s -> %s", label, tree.to_s, simplified.to_s)
  puts format("  %-28s rows %-14s %s", "", before.inspect,
              before == after ? "(unchanged)" : "MISMATCH #{after.inspect}")
end

puts
puts "== array patterns via deconstruct =="
ROWS.first(3).each do |row|
  node = op(:eq, col(row[:dept].to_sym), lit(row[:salary]))
  case node
  in [:binop, o, l, r]
    puts "  #{node} destructured as op=#{o} left=#{l} right=#{r}"
  end
end

puts
puts "== find pattern over a row set =="
case ROWS
in [*, { dept: "sales", salary: 100.. => big, id: }, *]
  puts "  found a high-paid sales row: id=#{id} salary=#{big}"
end

case ROWS
in [*, { dept: "hr" }, *] then puts "  found an hr row"
else puts "  no hr row present"
end

puts
puts "== guards, alternatives and pin operator =="
target = "eng"
ROWS.each do |row|
  label =
    case row
    in { dept: ^target, active: true } then "active #{target}"
    in { dept: ^target } then "inactive #{target}"
    in { salary: 100.. } then "high earner"
    in { dept: "sales" | "ops" => d } then "other dept #{d}"
    else "unclassified"
    end
  puts format("  id %d %-8s %s", row[:id], row[:dept], label)
end

puts
puts "== deconstruct_keys receives the requested keys =="
class Probe < Node
  attr_reader :seen

  def initialize = @seen = []

  def deconstruct_keys(keys)
    @seen << (keys.nil? ? :all : keys.sort)
    { a: 1, b: 2, c: 3 }
  end
end

probe = Probe.new
case probe
in { a: } then puts "  matched a=#{a}"
end
case probe
in { a:, c: } then puts "  matched a=#{a} c=#{c}"
end
case probe
in { **rest } then puts "  matched rest=#{rest.inspect}"
end
puts "  keys requested per match: #{probe.seen.inspect}"

puts
puts "== => binds the whole match, in matches without a case =="
node = op(:add, lit(1), lit(2))
node => { kind:, op: operator, left: Lit(value: lv) }
puts "  rightward assignment: kind=#{kind} op=#{operator} left value=#{lv}"
puts "  boolean in: #{node in { kind: :binop }}"
puts "  boolean in (no match): #{node in { kind: :lit }}"

puts
puts "== NoMatchingPatternError when nothing fits =="
result = begin
  case lit(5)
  in { kind: :binop } then :binop
  end
rescue NoMatchingPatternError, NoMatchingPatternKeyError => e
  e.class
end
puts "  #{result}"
