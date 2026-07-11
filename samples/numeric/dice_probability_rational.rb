# frozen_string_literal: true
# Exact dice probabilities with Rational arithmetic: convolves per-die
# distributions, then reports sums, tail probabilities, expectation and variance
# with no floating-point drift, plus a "keep highest" variant.
# Inference: Hash{Integer=>Rational} distributions flow through reduce/merge and
# into Rational arithmetic mixed with Integer literals.

def die(sides)
  dist = {}
  (1..sides).each { |face| dist[face] = Rational(1, sides) }
  dist
end

def convolve(a, b)
  out = {}
  a.each do |va, pa|
    b.each do |vb, pb|
      out[va + vb] = (out[va + vb] || Rational(0)) + (pa * pb)
    end
  end
  out
end

def pool(sides, count)
  (1...count).reduce(die(sides)) { |acc, _| convolve(acc, die(sides)) }
end

def expectation(dist)
  dist.reduce(Rational(0)) { |acc, (v, p)| acc + (v * p) }
end

def variance(dist)
  mu = expectation(dist)
  dist.reduce(Rational(0)) { |acc, (v, p)| acc + (p * (v - mu) * (v - mu)) }
end

def at_least(dist, threshold)
  dist.select { |v, _| v >= threshold }.values.reduce(Rational(0)) { |a, b| a + b }
end

two_d6 = pool(6, 2)
p two_d6.keys.sort
p two_d6[7]
p two_d6[2]
p two_d6.values.reduce(Rational(0)) { |a, b| a + b }

two_d6.keys.sort.each do |sum|
  prob = two_d6[sum]
  bar = "#" * (prob * 36).to_i
  puts format("%2d  %-6s %s", sum, prob.to_s, bar)
end

p expectation(two_d6)
p variance(two_d6)
p at_least(two_d6, 10)
p at_least(two_d6, 2)

three_d4 = pool(4, 3)
p three_d4.keys.minmax
p three_d4[6]
p expectation(three_d4)
p at_least(three_d4, 9)

# Keep-highest-2-of-3d6, enumerated exhaustively for an exact distribution.
def keep_highest(sides, count, keep)
  faces = (1..sides).to_a
  tally = {}
  total = 0
  rolls = faces.repeated_permutation(count)
  rolls.each do |roll|
    value = roll.sort.reverse.first(keep).sum
    tally[value] = (tally[value] || 0) + 1
    total += 1
  end
  dist = {}
  tally.each { |v, n| dist[v] = Rational(n, total) }
  dist
end

kh = keep_highest(6, 3, 2)
p kh.keys.sort
p kh.values.reduce(Rational(0)) { |a, b| a + b }
p kh[12]
p expectation(kh)
p expectation(kh) > expectation(two_d6)
p at_least(kh, 10)

# Comparing the two pools face by face.
(2..12).each do |sum|
  plain = two_d6[sum] || Rational(0)
  best = kh[sum] || Rational(0)
  puts format("%2d  plain=%-7s keep2=%-8s delta=%s", sum, plain, best, (best - plain).to_s)
end

p (expectation(kh) - expectation(two_d6)).class
p (expectation(kh) - expectation(two_d6))
p expectation(two_d6).to_f
p variance(two_d6).round(4)
