# Hindley-Milner type inference for a small lambda calculus with let-polymorphism.
# Algorithm W: unification with an occurs check, a mutable substitution, and
# generalisation of let-bound types over their free type variables.
#
# Stresses mutually recursive user types (terms and types), polymorphic dispatch
# through `to_s`/`free_vars` on a class hierarchy, hashes keyed by type-variable
# name whose values are the recursive type itself, and a return type that only
# settles once the whole call graph is known.

class TypeError_ < StandardError; end

# --- types --------------------------------------------------------------

class TVar
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    @name
  end

  def free_vars
    [@name]
  end

  def occurs?(name)
    @name == name
  end
end

class TCon
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    @name
  end

  def free_vars
    []
  end

  def occurs?(_name)
    false
  end
end

class TFun
  attr_reader :from, :to

  def initialize(from, to)
    @from = from
    @to = to
  end

  def to_s
    left = @from.is_a?(TFun) ? "(#{@from})" : @from.to_s
    "#{left} -> #{@to}"
  end

  def free_vars
    @from.free_vars + @to.free_vars
  end

  def occurs?(name)
    @from.occurs?(name) || @to.occurs?(name)
  end
end

class TList
  attr_reader :elem

  def initialize(elem)
    @elem = elem
  end

  def to_s
    "[#{@elem}]"
  end

  def free_vars
    @elem.free_vars
  end

  def occurs?(name)
    @elem.occurs?(name)
  end
end

INT = TCon.new('Int')
BOOL = TCon.new('Bool')

# A type scheme: a type plus the variables quantified over it.
class Scheme
  attr_reader :vars, :type

  def initialize(vars, type)
    @vars = vars
    @type = type
  end

  def to_s
    @vars.empty? ? @type.to_s : "forall #{@vars.join(' ')}. #{@type}"
  end
end

# --- terms --------------------------------------------------------------

class Var
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    @name
  end
end

class Lit
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_s
    @value.inspect
  end
end

class Lam
  attr_reader :param, :body

  def initialize(param, body)
    @param = param
    @body = body
  end

  def to_s
    "\\#{@param}. #{@body}"
  end
end

class App
  attr_reader :fn, :arg

  def initialize(fn, arg)
    @fn = fn
    @arg = arg
  end

  def to_s
    "(#{@fn} #{@arg})"
  end
end

class Let
  attr_reader :name, :value, :body

  def initialize(name, value, body)
    @name = name
    @value = value
    @body = body
  end

  def to_s
    "let #{@name} = #{@value} in #{@body}"
  end
end

class If
  attr_reader :cond, :then_b, :else_b

  def initialize(cond, then_b, else_b)
    @cond = cond
    @then_b = then_b
    @else_b = else_b
  end

  def to_s
    "if #{@cond} then #{@then_b} else #{@else_b}"
  end
end

# --- inference engine ---------------------------------------------------

class Inferencer
  def initialize
    @counter = 0
    @subst = {}
  end

  def fresh
    @counter += 1
    TVar.new("t#{@counter}")
  end

  # Follow the substitution chain to a type with no substituted variables on top.
  def resolve(type)
    if type.is_a?(TVar)
      bound = @subst[type.name]
      return resolve(bound) if bound
      type
    elsif type.is_a?(TFun)
      TFun.new(resolve(type.from), resolve(type.to))
    elsif type.is_a?(TList)
      TList.new(resolve(type.elem))
    else
      type
    end
  end

  def bind(name, type)
    return if type.is_a?(TVar) && type.name == name
    raise TypeError_, "occurs check: #{name} in #{type}" if type.occurs?(name)
    @subst[name] = type
  end

  def unify(a, b)
    a = resolve(a)
    b = resolve(b)
    if a.is_a?(TVar)
      bind(a.name, b)
    elsif b.is_a?(TVar)
      bind(b.name, a)
    elsif a.is_a?(TFun) && b.is_a?(TFun)
      unify(a.from, b.from)
      unify(a.to, b.to)
    elsif a.is_a?(TList) && b.is_a?(TList)
      unify(a.elem, b.elem)
    elsif a.is_a?(TCon) && b.is_a?(TCon) && a.name == b.name
      nil
    else
      raise TypeError_, "cannot unify #{a} with #{b}"
    end
  end

  def instantiate(scheme)
    mapping = {}
    scheme.vars.each { |v| mapping[v] = fresh }
    substitute(scheme.type, mapping)
  end

  def substitute(type, mapping)
    if type.is_a?(TVar)
      mapping[type.name] || type
    elsif type.is_a?(TFun)
      TFun.new(substitute(type.from, mapping), substitute(type.to, mapping))
    elsif type.is_a?(TList)
      TList.new(substitute(type.elem, mapping))
    else
      type
    end
  end

  def generalize(env, type)
    type = resolve(type)
    bound = []
    env.each_value { |scheme| bound.concat(resolve(scheme.type).free_vars) }
    vars = type.free_vars.uniq.reject { |v| bound.include?(v) }
    Scheme.new(vars.sort, type)
  end

  def infer(term, env)
    case term
    when Lit
      term.value == true || term.value == false ? BOOL : INT
    when Var
      scheme = env[term.name]
      raise TypeError_, "unbound variable #{term.name}" if scheme.nil?
      instantiate(scheme)
    when Lam
      tv = fresh
      inner = env.merge(term.param => Scheme.new([], tv))
      TFun.new(tv, infer(term.body, inner))
    when App
      fn_type = infer(term.fn, env)
      arg_type = infer(term.arg, env)
      result = fresh
      unify(fn_type, TFun.new(arg_type, result))
      result
    when Let
      value_type = infer(term.value, env)
      scheme = generalize(env, value_type)
      infer(term.body, env.merge(term.name => scheme))
    when If
      unify(infer(term.cond, env), BOOL)
      then_type = infer(term.then_b, env)
      unify(then_type, infer(term.else_b, env))
      then_type
    else
      raise TypeError_, "unknown term #{term.class}"
    end
  end

  # Rename the remaining free variables to a, b, c... for a stable printout.
  def canonical(type)
    type = resolve(type)
    mapping = {}
    letters = ('a'..'z').to_a
    type.free_vars.each do |v|
      mapping[v] = TVar.new(letters[mapping.size]) unless mapping.key?(v)
    end
    substitute(type, mapping)
  end

  def run(term, env)
    canonical(infer(term, env)).to_s
  end
end

# --- a small standard library of type schemes ---------------------------

def base_env
  a = TVar.new('a')
  b = TVar.new('b')
  {
    'inc'    => Scheme.new([], TFun.new(INT, INT)),
    'zero?'  => Scheme.new([], TFun.new(INT, BOOL)),
    'plus'   => Scheme.new([], TFun.new(INT, TFun.new(INT, INT))),
    'id'     => Scheme.new(['a'], TFun.new(a, a)),
    'nil'    => Scheme.new(['a'], TList.new(a)),
    'cons'   => Scheme.new(['a'], TFun.new(a, TFun.new(TList.new(a), TList.new(a)))),
    'head'   => Scheme.new(['a'], TFun.new(TList.new(a), a)),
    'map'    => Scheme.new(%w[a b], TFun.new(TFun.new(a, b), TFun.new(TList.new(a), TList.new(b)))),
    'pair'   => Scheme.new(%w[a b], TFun.new(a, TFun.new(b, TList.new(a)))),
    'fix'    => Scheme.new(['a'], TFun.new(TFun.new(a, a), a))
  }
end

CASES = [
  ['literal',            Lit.new(42)],
  ['bool literal',       Lit.new(true)],
  ['identity',           Lam.new('x', Var.new('x'))],
  ['const',              Lam.new('x', Lam.new('y', Var.new('x')))],
  ['flip apply',         Lam.new('f', Lam.new('x', App.new(Var.new('f'), Var.new('x'))))],
  ['inc applied',        App.new(Var.new('inc'), Lit.new(1))],
  ['plus partial',       App.new(Var.new('plus'), Lit.new(1))],
  ['compose',            Lam.new('f', Lam.new('g', Lam.new('x',
                            App.new(Var.new('f'), App.new(Var.new('g'), Var.new('x'))))))],
  ['if branches',        If.new(App.new(Var.new('zero?'), Lit.new(0)), Lit.new(1), Lit.new(2))],
  ['let polymorphic',    Let.new('f', Lam.new('x', Var.new('x')),
                            App.new(Var.new('f'), App.new(Var.new('f'), Lit.new(3))))],
  ['let used at 2 types', Let.new('f', Lam.new('x', Var.new('x')),
                            App.new(App.new(Var.new('pair'),
                              App.new(Var.new('f'), Lit.new(1))),
                              App.new(Var.new('f'), Lit.new(true))))],
  ['map over list',      App.new(Var.new('map'), Var.new('inc'))],
  ['map inc nil',        App.new(App.new(Var.new('map'), Var.new('inc')), Var.new('nil'))],
  ['cons chain',         App.new(App.new(Var.new('cons'), Lit.new(1)),
                            App.new(App.new(Var.new('cons'), Lit.new(2)), Var.new('nil')))],
  ['head of cons',       App.new(Var.new('head'),
                            App.new(App.new(Var.new('cons'), Lit.new(7)), Var.new('nil')))],
  ['nested lambda list', Lam.new('xs', App.new(Var.new('head'), Var.new('xs')))],
  ['fix point',          App.new(Var.new('fix'), Lam.new('f', Var.new('f')))],
  ['self application',   Lam.new('x', App.new(Var.new('x'), Var.new('x')))],
  ['bad if',             If.new(Lit.new(1), Lit.new(1), Lit.new(2))],
  ['branch mismatch',    If.new(Lit.new(true), Lit.new(1), Lit.new(false))],
  ['int as function',    App.new(Lit.new(1), Lit.new(2))],
  ['unbound',            Var.new('nope')],
  ['list vs int',        App.new(Var.new('head'), Lit.new(3))]
]

puts "== inference =="
CASES.each do |label, term|
  engine = Inferencer.new
  result = begin
    engine.run(term, base_env)
  rescue TypeError_ => e
    "TYPE ERROR: #{e.message}"
  end
  puts format("%-20s %-34s :: %s", label, term.to_s, result)
end

puts
puts "== generalisation detail =="
engine = Inferencer.new
env = base_env
value_type = engine.infer(Lam.new('x', Var.new('x')), env)
scheme = engine.generalize(env, value_type)
puts "raw type    : #{engine.resolve(value_type)}"
puts "scheme      : #{scheme}"
puts "instance 1  : #{engine.instantiate(scheme)}"
puts "instance 2  : #{engine.instantiate(scheme)}"
puts "distinct    : #{engine.instantiate(scheme).to_s != engine.instantiate(scheme).to_s}"

puts
puts "== unification trace =="
engine2 = Inferencer.new
x = engine2.fresh
y = engine2.fresh
engine2.unify(x, TFun.new(y, INT))
engine2.unify(y, BOOL)
puts "x = #{engine2.resolve(x)}"
puts "y = #{engine2.resolve(y)}"
z = engine2.fresh
begin
  engine2.unify(z, TFun.new(z, INT))
rescue TypeError_ => e
  puts "occurs check fired: #{e.message}"
end
puts "free vars of ((a -> b) -> [b]) = #{TFun.new(TFun.new(TVar.new('a'), TVar.new('b')), TList.new(TVar.new('b'))).free_vars.inspect}"
