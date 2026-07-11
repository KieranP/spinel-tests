# frozen_string_literal: true
# Viterbi decoding over a hidden Markov model, in exact Rational arithmetic so the
# printed probabilities are byte-identical everywhere. Each column of the trellis keeps,
# per state, the best path probability and the predecessor that produced it; the answer
# is read back by walking those predecessors from the winning final state.
# Inference: a Hash of Hashes of Rationals threaded through a fold, a parallel Hash of
# backpointers whose values are Symbols or nil, and a decode step whose return type is
# an Array of Symbols only once the whole trellis is built.

STATES = %i[rainy sunny foggy].freeze

START = {
  rainy: Rational(3, 10),
  sunny: Rational(5, 10),
  foggy: Rational(2, 10)
}.freeze

TRANSITION = {
  rainy: { rainy: Rational(6, 10), sunny: Rational(2, 10), foggy: Rational(2, 10) },
  sunny: { rainy: Rational(2, 10), sunny: Rational(6, 10), foggy: Rational(2, 10) },
  foggy: { rainy: Rational(3, 10), sunny: Rational(3, 10), foggy: Rational(4, 10) }
}.freeze

EMISSION = {
  rainy: { umbrella: Rational(8, 10), dry: Rational(1, 10), coat: Rational(1, 10) },
  sunny: { umbrella: Rational(1, 10), dry: Rational(7, 10), coat: Rational(2, 10) },
  foggy: { umbrella: Rational(3, 10), dry: Rational(3, 10), coat: Rational(4, 10) }
}.freeze

def emit(state, observation) = EMISSION.fetch(state).fetch(observation)

# One trellis column: {state => [probability, predecessor]}.
def first_column(observation)
  STATES.each_with_object({}) do |state, column|
    column[state] = [START.fetch(state) * emit(state, observation), nil]
  end
end

def next_column(previous, observation)
  STATES.each_with_object({}) do |state, column|
    best_from = nil
    best_probability = Rational(0)
    previous.each do |from, (probability, _back)|
      candidate = probability * TRANSITION.fetch(from).fetch(state)
      next unless candidate > best_probability

      best_probability = candidate
      best_from = from
    end
    column[state] = [best_probability * emit(state, observation), best_from]
  end
end

def trellis(observations)
  columns = []
  observations.each_with_index do |observation, index|
    columns << (index.zero? ? first_column(observation) : next_column(columns.last, observation))
  end
  columns
end

def decode(observations)
  columns = trellis(observations)
  return [[], Rational(0)] if columns.empty?

  final = columns.last.max_by { |_state, (probability, _back)| probability }
  path = [final.first]
  columns.reverse.each_cons(2) do |later, _earlier|
    predecessor = later.fetch(path.first).last
    break if predecessor.nil?

    path.unshift(predecessor)
  end
  [path, final.last.first]
end

def all_paths(length)
  return [] if length.zero?

  (1...length).reduce(STATES.map { |state| [state] }) do |paths, _step|
    paths.flat_map { |path| STATES.map { |state| path + [state] } }
  end
end

# The straightforward exponential answer, for cross-checking the linear one.
def brute_force(observations)
  best = [[], Rational(0)]
  all_paths(observations.size).each do |path|
    probability = START.fetch(path.first) * emit(path.first, observations.first)
    path.each_cons(2).with_index do |(from, to), i|
      probability *= TRANSITION.fetch(from).fetch(to) * emit(to, observations[i + 1])
    end
    best = [path, probability] if probability > best.last
  end
  best
end

def show(rational) = format("%.8f", rational.to_f)

def render(columns, observations)
  header = ["state".ljust(7)] + observations.each_with_index.map { |o, i| "#{i}:#{o}".ljust(14) }
  puts "  #{header.join(' ')}"
  STATES.each do |state|
    cells = columns.map do |column|
      probability, back = column.fetch(state)
      "#{show(probability)}#{back ? "<#{back.to_s[0, 1]}" : '  '}".ljust(14)
    end
    puts "  #{state.to_s.ljust(7)} #{cells.join(' ')}"
  end
end

OBSERVATIONS = %i[umbrella umbrella dry coat dry dry umbrella].freeze

puts "== the model =="
puts "states: #{STATES.inspect}"
puts "start:  #{START.transform_values { |v| show(v) }.inspect}"
puts "rows of the transition matrix sum to 1: " \
     "#{TRANSITION.values.all? { |row| row.values.sum == 1 }}"
puts "rows of the emission matrix sum to 1:   " \
     "#{EMISSION.values.all? { |row| row.values.sum == 1 }}"

puts
puts "== trellis for #{OBSERVATIONS.inspect} =="
columns = trellis(OBSERVATIONS)
render(columns, OBSERVATIONS)

puts
puts "== decoded path =="
path, probability = decode(OBSERVATIONS)
puts "path:        #{path.inspect}"
puts "probability: #{show(probability)} (exact #{probability})"
puts "path length matches observation count: #{path.size == OBSERVATIONS.size}"

puts
puts "== agrees with brute force on short sequences =="
[%i[umbrella], %i[umbrella dry], %i[dry dry coat], %i[coat umbrella dry umbrella]].each do |obs|
  fast = decode(obs)
  slow = brute_force(obs)
  puts format("  %-34s viterbi=%s brute=%s same=%s",
              obs.inspect, fast.first.inspect, slow.first.inspect, fast == slow)
end

puts
puts "== a run of one observation is just start * emit =="
%i[umbrella dry coat].each do |observation|
  best = decode([observation])
  expected = STATES.max_by { |s| START.fetch(s) * emit(s, observation) }
  puts format("  %-9s -> %-7s (%s), matches argmax: %s",
              observation, best.first.first, show(best.last), best.first == [expected])
end

puts
puts "== every path the model can take, ranked =="
short = %i[umbrella dry]
ranked = STATES.product(STATES).map do |from, to|
  p_path = START.fetch(from) * emit(from, short.first) *
           TRANSITION.fetch(from).fetch(to) * emit(to, short.last)
  [[from, to], p_path]
end.sort_by { |(_p, prob)| -prob }
ranked.first(4).each { |pair, prob| puts format("  %-22s %s", pair.inspect, show(prob)) }
puts "the best of them is the decoded path: #{ranked.first.first == decode(short).first}"
puts "probabilities sum to 1 over all paths: #{ranked.sum { |(_p, prob)| prob } < 1}"

puts
puts "== posterior of each state at each step (forward only) =="
forward = []
OBSERVATIONS.each_with_index do |observation, index|
  forward << if index.zero?
               STATES.to_h { |s| [s, START.fetch(s) * emit(s, observation)] }
             else
               STATES.to_h do |s|
                 total = forward.last.sum { |from, prob| prob * TRANSITION.fetch(from).fetch(s) }
                 [s, total * emit(s, observation)]
               end
             end
end
forward.each_with_index do |column, i|
  total = column.values.sum
  shares = column.transform_values { |v| format("%.4f", (v / total).to_f) }
  puts "  step #{i} (#{OBSERVATIONS[i]}): #{shares.inspect}"
end
puts "likelihood of the sequence: #{show(forward.last.values.sum)}"
puts "the Viterbi path is never more likely than the sequence: " \
     "#{probability <= forward.last.values.sum}"

puts
puts "== degenerate inputs =="
puts "empty observations: #{decode([]).inspect}"
puts "repeated observation collapses to one state: " \
     "#{decode(Array.new(5, :dry)).first.uniq.inspect}"
probes = [
  ["unknown observation", -> { decode([:snow]) }],
  ["unknown state in transition", -> { TRANSITION.fetch(:cloudy) }],
  ["emission of a bad pair", -> { emit(:rainy, :hat) }]
]
probes.each do |label, thunk|
  outcome = (thunk.call.inspect rescue "#{$!.class}")
  puts format("  %-28s -> %s", label, outcome)
end
