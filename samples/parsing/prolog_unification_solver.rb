# frozen_string_literal: true
# A miniature Prolog: first-order terms, Robinson unification with occurs check,
# and depth-first resolution with variable renaming, answering queries over an
# append/member/ancestor knowledge base.
# Inference: Term is a recursive user type (a Struct whose args hold more Terms or
# Vars), substitutions are Hash{String=>Term} threaded through recursion, and the
# solver yields each solution through a block that outlives its frame.

Var = Struct.new(:name) do
  def to_s = name
  def var? = true
end

Term = Struct.new(:functor, :args) do
  def to_s
    return functor.to_s if args.empty?

    "#{functor}(#{args.map(&:to_s).join(", ")})"
  end

  def var? = false
end

def atom(name) = Term.new(name, [])
def cons(head, tail) = Term.new("cons", [head, tail])
NIL_LIST = atom("nil")

def list(*items) = items.reverse.reduce(NIL_LIST) { |tail, item| cons(item, tail) }

def walk(term, subst)
  return term unless term.var?

  bound = subst[term.name]
  bound.nil? ? term : walk(bound, subst)
end

def occurs?(name, term, subst)
  term = walk(term, subst)
  return true if term.var? && term.name == name
  return false if term.var?

  term.args.any? { |arg| occurs?(name, arg, subst) }
end

def unify(a, b, subst)
  return nil if subst.nil?

  a = walk(a, subst)
  b = walk(b, subst)
  return subst if a.var? && b.var? && a.name == b.name

  if a.var?
    return nil if occurs?(a.name, b, subst)

    return subst.merge(a.name => b)
  end
  return unify(b, a, subst) if b.var?
  return nil unless a.functor == b.functor && a.args.size == b.args.size

  a.args.zip(b.args).reduce(subst) { |acc, (x, y)| unify(x, y, acc) }
end

def resolve(term, subst)
  return term unless term.var? || !term.args.empty?

  walked = walk(term, subst)
  return walked if walked.var?

  Term.new(walked.functor, walked.args.map { |arg| resolve(arg, subst) })
end

def rename(term, depth)
  if term.var?
    Var.new("#{term.name}_#{depth}")
  else
    Term.new(term.functor, term.args.map { |arg| rename(arg, depth) })
  end
end

class Program
  Rule = Struct.new(:head, :body)

  def initialize
    @rules = []
    @depth = 0
  end

  def rule(head, *body)
    @rules << Rule.new(head, body)
    self
  end

  def solve(goals, subst = {}, depth = 0, &block)
    if goals.empty?
      block.call(subst)
      return
    end

    goal, *rest = goals
    @rules.each_with_index do |r, idx|
      stamp = depth * 100 + idx
      head = rename(r.head, stamp)
      unified = unify(goal, head, subst)
      next if unified.nil?

      body = r.body.map { |b| rename(b, stamp) }
      solve(body + rest, unified, depth + 1, &block)
    end
  end

  def query(goals, limit: 8)
    found = []
    solve(goals) do |subst|
      next if found.size >= limit

      vars = goals.flat_map { |g| collect_vars(g) }.uniq
      found << vars.map { |v| "#{v}=#{resolve(Var.new(v), subst)}" }.join(" ")
    end
    found.uniq
  end

  private

  def collect_vars(term)
    return [term.name] if term.var?

    term.args.flat_map { |arg| collect_vars(arg) }
  end
end

X = Var.new("X")
Y = Var.new("Y")
Z = Var.new("Z")
H = Var.new("H")
T = Var.new("T")
R = Var.new("R")

prog = Program.new

# append(nil, L, L).
prog.rule(Term.new("append", [NIL_LIST, X, X]))
# append(cons(H,T), L, cons(H,R)) :- append(T, L, R).
prog.rule(Term.new("append", [cons(H, T), Y, cons(H, R)]),
          Term.new("append", [T, Y, R]))
# member(X, cons(X, _)).
prog.rule(Term.new("member", [X, cons(X, Y)]))
prog.rule(Term.new("member", [X, cons(Y, T)]), Term.new("member", [X, T]))

puts "== unification =="
u1 = unify(Term.new("f", [X, atom("b")]), Term.new("f", [atom("a"), Y]), {})
puts "f(X,b) = f(a,Y) -> #{u1.sort.map { |k, v| "#{k}=#{v}" }.join(" ")}"

u2 = unify(Term.new("f", [X, X]), Term.new("f", [atom("a"), atom("b")]), {})
puts "f(X,X) = f(a,b) -> #{u2.inspect}"

u3 = unify(X, Term.new("f", [X]), {})
puts "X = f(X) (occurs check) -> #{u3.inspect}"

u4 = unify(Term.new("g", [X, Y]), Term.new("g", [Y, atom("c")]), {})
puts "g(X,Y) = g(Y,c) -> #{resolve(Term.new("g", [X, Y]), u4)}"

puts
puts "== append/3 =="
abc = list(atom("a"), atom("b"), atom("c"))
puts "list: #{abc}"

concat = prog.query([Term.new("append", [list(atom("a"), atom("b")), list(atom("c")), Z])])
puts "append([a,b],[c],Z):"
concat.each { |s| puts "  #{s}" }

splits = prog.query([Term.new("append", [X, Y, abc])])
puts "all splits of [a,b,c]:"
splits.each { |s| puts "  #{s}" }

puts
puts "== member/2 =="
members = prog.query([Term.new("member", [X, abc])])
members.each { |s| puts "  #{s}" }

puts
puts "== ancestry with rules =="
fam = Program.new
%w[abe homer].each_cons(2) { |a, b| fam.rule(Term.new("parent", [atom(a), atom(b)])) }
fam.rule(Term.new("parent", [atom("homer"), atom("bart")]))
fam.rule(Term.new("parent", [atom("homer"), atom("lisa")]))
fam.rule(Term.new("parent", [atom("marge"), atom("bart")]))
fam.rule(Term.new("ancestor", [X, Y]), Term.new("parent", [X, Y]))
fam.rule(Term.new("ancestor", [X, Z]),
         Term.new("parent", [X, Y]), Term.new("ancestor", [Y, Z]))

fam.query([Term.new("ancestor", [atom("abe"), Z])]).each { |s| puts "  abe -> #{s}" }
fam.query([Term.new("ancestor", [X, atom("bart")])]).each { |s| puts "  #{s} -> bart" }

both = fam.query([Term.new("parent", [X, atom("bart")]), Term.new("parent", [X, atom("lisa")])])
puts "parents of both bart and lisa: #{both.inspect}"
