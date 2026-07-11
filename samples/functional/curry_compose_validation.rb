# frozen_string_literal: true
# A validation library built entirely from function composition: rules are curried
# lambdas, combinators (`>>`, `<<`, all_of, any_of) build bigger rules out of smaller
# ones, and a record is validated by threading it through the composed pipeline.
# Inference: Proc values stored in Hashes and Arrays, partially applied so their arity
# changes between construction and call, and a composed Proc whose return type is a
# user Result type built from the two halves of the composition.

Result = Struct.new(:value, :errors) do
  def ok? = errors.empty?
  def to_s = ok? ? "ok(#{value.inspect})" : "err(#{errors.join("; ")})"
end

def ok(value) = Result.new(value, [])
def err(value, *messages) = Result.new(value, messages)

# Curried rule factories: each returns a lambda awaiting the value.
LONGER_THAN = ->(n, field, value) { value.length > n ? nil : "#{field} must exceed #{n} chars" }
MATCHES     = ->(re, field, value) { value.match?(re) ? nil : "#{field} has a bad format" }
IN_RANGE    = ->(range, field, value) { range.cover?(value) ? nil : "#{field} must be in #{range}" }
NOT_BLANK   = ->(field, value) { value.to_s.strip.empty? ? "#{field} must not be blank" : nil }

def all_of(*rules)
  ->(value) { rules.filter_map { |rule| rule.call(value) } }
end

def any_of(*rules)
  lambda do |value|
    failures = rules.map { |rule| rule.call(value) }
    failures.any?(&:nil?) ? [] : ["none of #{failures.size} alternatives held"]
  end
end

def negate(rule, message)
  ->(value) { rule.call(value).nil? ? message : nil }
end

RULES = {
  "username" => all_of(
    NOT_BLANK.curry["username"],
    LONGER_THAN.curry[3]["username"],
    MATCHES.curry[/\A[a-z][a-z0-9_]*\z/]["username"]
  ),
  "email" => all_of(
    NOT_BLANK.curry["email"],
    MATCHES.curry[/\A[^@\s]+@[^@\s]+\.[a-z]+\z/]["email"]
  ),
  "age" => all_of(IN_RANGE.curry[(18..120)]["age"]),
  "nickname" => any_of(
    NOT_BLANK.curry["nickname"],
    LONGER_THAN.curry[0]["nickname"]
  )
}.freeze

def validate(record)
  errors = RULES.sort.flat_map do |field, rule|
    value = record[field]
    value.nil? ? ["#{field} is missing"] : rule.call(value)
  end
  errors.empty? ? ok(record) : err(record, *errors)
end

RECORDS = [
  { "username" => "ada", "email" => "ada@example.com", "age" => 36, "nickname" => "countess" },
  { "username" => "grace_h", "email" => "grace@navy.mil", "age" => 45, "nickname" => "amazing" },
  { "username" => "Bob!", "email" => "bob-at-example", "age" => 12, "nickname" => "  " },
  { "username" => "", "email" => "", "age" => 200, "nickname" => "x" },
  { "username" => "linus", "age" => 30, "nickname" => "penguin" }
].freeze

puts "== validating records =="
results = RECORDS.map { |r| validate(r) }
results.each_with_index do |result, i|
  puts format("%d %-5s %s", i, result.ok? ? "PASS" : "FAIL",
              result.ok? ? result.value["username"] : result.errors.join(" | "))
end
puts "passed: #{results.count(&:ok?)} of #{results.size}"

puts
puts "== currying step by step =="
step0 = LONGER_THAN.curry
step1 = step0[3]
step2 = step1["username"]
puts "arity at each step: #{[LONGER_THAN.arity, step1.arity, step2.arity].inspect}"
puts "lambda? #{[LONGER_THAN.lambda?, step2.lambda?].inspect}"
puts "step2 on 'ab': #{step2.call("ab").inspect}"
puts "step2 on 'abcd': #{step2.call("abcd").inspect}"
puts "fully applied in one go: #{LONGER_THAN.curry[3]["x"]["abcd"].inspect}"

puts
puts "== composition with >> and << =="
strip = ->(s) { s.strip }
downcase = ->(s) { s.downcase }
underscore = ->(s) { s.tr(" ", "_") }

forward = strip >> downcase >> underscore
backward = underscore << downcase << strip
sample = "  Ada Lovelace  "
puts "forward:  #{forward.call(sample).inspect}"
puts "backward: #{backward.call(sample).inspect}"
puts "same result: #{forward.call(sample) == backward.call(sample)}"

length_then_parity = strip >> ->(s) { s.length } >> ->(n) { n.even? ? :even : :odd }
puts "chained arity: #{(strip >> downcase).arity}"
puts "length parity of #{sample.inspect}: #{length_then_parity.call(sample).inspect}"

puts
puts "== a pipeline held in an Array =="
pipeline = [strip, downcase, underscore, ->(s) { s[0, 8] }]
composed = pipeline.reduce { |acc, f| acc >> f }
puts "composed:   #{composed.call("  Grace Brewster Hopper ").inspect}"
puts "step by step: #{pipeline.reduce("  Grace Brewster Hopper ") { |v, f| f.call(v) }.inspect}"

puts
puts "== a rule negated and re-composed =="
blank_rule = NOT_BLANK.curry["nickname"]
must_be_blank = negate(blank_rule, "nickname must be blank")
puts "blank value:     #{[blank_rule.call("  "), must_be_blank.call("  ")].inspect}"
puts "non-blank value: #{[blank_rule.call("x"), must_be_blank.call("x")].inspect}"

puts
puts "== Method objects behave like the lambdas =="
def shout(text) = "#{text.upcase}!"
m = method(:shout)
puts "method arity: #{m.arity}, name: #{m.name}"
puts "as a proc in a map: #{%w[a b].map(&m).inspect}"
puts "composed with a lambda: #{(m >> ->(s) { s * 2 }).call("hi").inspect}"
puts "unbound then rebound: #{m.to_proc.call("ok").inspect}"

puts
puts "== rules are values: swap one at runtime =="
strict = RULES["age"]
lenient = all_of(IN_RANGE.curry[(0..120)]["age"])
[12, 30, 200].each do |age|
  puts format("  age %3d strict=%-32s lenient=%s", age,
              strict.call(age).inspect, lenient.call(age).inspect)
end
