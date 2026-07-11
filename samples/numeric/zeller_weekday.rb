# frozen_string_literal: true
# Day-of-week via Zeller's congruence (pure integer arithmetic, no Time).
# Inference: integer modulo chains, an Array(String) index lookup, and mapping a
# list of date triples through the computation.

DAYS = %w[Saturday Sunday Monday Tuesday Wednesday Thursday Friday].freeze

def weekday(year, month, day)
  if month < 3
    month += 12
    year -= 1
  end
  k = year % 100
  j = year / 100
  h = (day + (13 * (month + 1)) / 5 + k + k / 4 + j / 4 + 5 * j) % 7
  DAYS[h]
end

dates = [
  [2000, 1, 1],
  [2026, 7, 18],
  [1970, 1, 1],
  [2024, 2, 29],
  [1900, 1, 1],
]

dates.each do |y, m, d|
  puts "%04d-%02d-%02d: %s" % [y, m, d, weekday(y, m, d)]
end

# how many Fridays the 13th in 2026
friday13 = (1..12).count { |m| weekday(2026, m, 13) == "Friday" }
puts "Friday the 13th in 2026: #{friday13}"

# weekday distribution of the firsts of each month in 2026
dist = (1..12).map { |m| weekday(2026, m, 1) }.tally
puts "firsts by weekday: #{dist.sort.inspect}"
p weekday(2026, 12, 25)
p DAYS.length
