# frozen_string_literal: true
# Transducers: each stage is a lambda that takes a reducing lambda and returns another
# reducing lambda, so `map`, `select`, `take` and friends compose once and then run over
# an Array, a Hash or a String without building an intermediate collection per stage.
# Inference: lambdas whose parameter and return type are themselves lambdas, a stack of
# them folded into one function, and a reduction whose accumulator type is decided by
# the caller (Integer, Array, Hash, String) rather than by the stage.

REDUCED = :__reduced__

def reduced(value) = [REDUCED, value]
def reduced?(value) = value.is_a?(Array) && value.size == 2 && value.first == REDUCED
def unreduce(value) = reduced?(value) ? value.last : value

def mapping(&fn)
  ->(step) { ->(acc, input) { step.call(acc, fn.call(input)) } }
end

def filtering(&pred)
  ->(step) { ->(acc, input) { pred.call(input) ? step.call(acc, input) : acc } }
end

def taking(count)
  lambda do |step|
    seen = 0
    lambda do |acc, input|
      seen += 1
      return reduced(acc) if seen > count

      result = step.call(acc, input)
      seen == count ? reduced(unreduce(result)) : result
    end
  end
end

def dropping(count)
  lambda do |step|
    seen = 0
    lambda do |acc, input|
      seen += 1
      seen <= count ? acc : step.call(acc, input)
    end
  end
end

def flat_mapping(&fn)
  ->(step) { ->(acc, input) { fn.call(input).reduce(acc) { |a, i| step.call(a, i) } } }
end

def deduping
  lambda do |step|
    seen = {}
    lambda do |acc, input|
      next acc if seen.key?(input)

      seen[input] = true
      step.call(acc, input)
    end
  end
end

def interposing(separator)
  lambda do |step|
    first = true
    lambda do |acc, input|
      if first
        first = false
        step.call(acc, input)
      else
        step.call(step.call(acc, separator), input)
      end
    end
  end
end

# Stages apply right-to-left on the step function, which makes them read left-to-right
# on the data.
def compose(*stages)
  ->(step) { stages.reverse.reduce(step) { |inner, stage| stage.call(inner) } }
end

# BUG 20260904193718753 - the first argument to `step` arrives as nil inside the stage lambdas
def transduce(transducer, step, seed, collection)
  reducer = transducer.call(step)
  result = collection.reduce(seed) do |acc, input|
    next_acc = reducer.call(acc, input)
    break next_acc if reduced?(next_acc)

    next_acc
  end
  unreduce(result)
end

CONJ = ->(acc, x) { acc + [x] }
ADD = ->(acc, x) { acc + x }
CONCAT = ->(acc, x) { acc + x.to_s }
COUNT = ->(acc, _x) { acc + 1 }

NUMBERS = (1..20).to_a

puts "== one stage at a time =="
puts "map(*3):        #{transduce(mapping { |n| n * 3 }, CONJ, [], (1..5).to_a).inspect}"
puts "select(even):   #{transduce(filtering(&:even?), CONJ, [], NUMBERS).inspect}"
puts "take(4):        #{transduce(taking(4), CONJ, [], NUMBERS).inspect}"
puts "drop(16):       #{transduce(dropping(16), CONJ, [], NUMBERS).inspect}"
puts "flat_map:       #{transduce(flat_mapping { |n| [n, -n] }, CONJ, [], (1..4).to_a).inspect}"
puts "dedupe:         #{transduce(deduping, CONJ, [], [1, 1, 2, 3, 2, 1, 4]).inspect}"

puts
puts "== composed pipelines =="
pipeline = compose(
  filtering(&:odd?),
  mapping { |n| n * n },
  filtering { |n| n > 10 },
  taking(4)
)
puts "odd -> square -> >10 -> take 4"
puts "  as an Array:  #{transduce(pipeline, CONJ, [], NUMBERS).inspect}"
puts "  as a sum:     #{transduce(pipeline, ADD, 0, NUMBERS)}"
puts "  as a count:   #{transduce(pipeline, COUNT, 0, NUMBERS)}"
puts "  as a String:  #{transduce(pipeline, CONCAT, '', NUMBERS).inspect}"

puts
puts "== the same stages, different order =="
a = compose(taking(3), mapping { |n| n * 10 })
b = compose(mapping { |n| n * 10 }, taking(3))
puts "take(3) then map: #{transduce(a, CONJ, [], NUMBERS).inspect}"
puts "map then take(3): #{transduce(b, CONJ, [], NUMBERS).inspect}"
c = compose(filtering(&:even?), dropping(2))
d = compose(dropping(2), filtering(&:even?))
puts "even then drop(2): #{transduce(c, CONJ, [], NUMBERS).inspect}"
puts "drop(2) then even: #{transduce(d, CONJ, [], NUMBERS).inspect}"

puts
puts "== stages are reusable and stateless between runs =="
limited = compose(mapping { |n| n + 1 }, taking(3))
3.times { |i| puts "  run #{i}: #{transduce(limited, CONJ, [], NUMBERS).inspect}" }
puts "state is per-transduce, not per-stage: " \
     "#{Array.new(3) { transduce(limited, CONJ, [], NUMBERS) }.uniq.size == 1}"

puts
puts "== over a String =="
letters = "the quick brown fox jumps over the lazy dog"
words = compose(
  mapping(&:capitalize),
  filtering { |w| w.length > 3 },
  interposing("-")
)
puts "words: #{transduce(words, CONCAT, '', letters.split).inspect}"
chars = compose(filtering { |ch| ch.match?(/[aeiou]/) }, deduping)
puts "distinct vowels: #{transduce(chars, CONJ, [], letters.chars).inspect}"
puts "vowel count: #{transduce(filtering { |ch| 'aeiou'.include?(ch) }, COUNT, 0, letters.chars)}"

puts
puts "== over a Hash, into a Hash =="
stock = { apple: 12, banana: 0, cherry: 7, date: 0, elderberry: 33 }
into_hash = ->(acc, pair) { acc.merge(pair.first => pair.last) }
in_stock = compose(
  filtering { |(_name, count)| count.positive? },
  mapping { |(name, count)| [name, count * 2] }
)
puts "doubled, zero-stock dropped: #{transduce(in_stock, into_hash, {}, stock).inspect}"
names = compose(mapping { |(name, _count)| name.to_s }, filtering { |n| n.start_with?('a', 'c') })
puts "names starting a/c: #{transduce(names, CONJ, [], stock).inspect}"

puts
puts "== early termination really stops =="
visited = []
counted = compose(mapping { |n| visited << n; n }, taking(3))
result = transduce(counted, CONJ, [], NUMBERS)
puts "result: #{result.inspect}"
puts "inputs actually seen: #{visited.inspect}"
puts "stopped after 3 of #{NUMBERS.size}: #{visited.size == 3}"

puts
puts "== a transducer built at runtime from a spec =="
SPEC = [
  [:select, ->(n) { (n % 3).zero? }],
  [:map, ->(n) { n * n }],
  [:reject, ->(n) { n > 200 }],
  [:take, 3]
].freeze

built = compose(*SPEC.map do |kind, arg|
  case kind
  when :select then filtering { |n| arg.call(n) }
  when :reject then filtering { |n| !arg.call(n) }
  when :map then mapping { |n| arg.call(n) }
  when :take then taking(arg)
  else raise ArgumentError, "unknown stage #{kind}"
  end
end)
puts "spec pipeline: #{transduce(built, CONJ, [], (1..40).to_a).inspect}"
puts "spec sum:      #{transduce(built, ADD, 0, (1..40).to_a)}"

puts
puts "== equivalence with plain Enumerable =="
plain = NUMBERS.select(&:odd?).map { |n| n * n }.select { |n| n > 10 }.first(4)
puts "transducer == chained Enumerable: #{transduce(pipeline, CONJ, [], NUMBERS) == plain}"
plain_sum = NUMBERS.select(&:odd?).map { |n| n * n }.select { |n| n > 10 }.first(4).sum
puts "sums agree too: #{transduce(pipeline, ADD, 0, NUMBERS) == plain_sum}"

puts
puts "== error paths =="
probes = [
  ["unknown stage", -> { compose(*[[:nope, 1]].map { |k, _a| raise ArgumentError, "unknown stage #{k}" }) }],
  ["take(0)", -> { transduce(taking(0), CONJ, [], NUMBERS) }],
  ["empty input", -> { transduce(pipeline, CONJ, [], []) }],
  ["seed type mismatch", -> { transduce(mapping { |n| n }, ADD, [], NUMBERS) }]
]
probes.each do |label, thunk|
  outcome = (thunk.call.inspect rescue "#{$!.class}: #{$!.message}")
  puts format("  %-20s -> %s", label, outcome)
end
