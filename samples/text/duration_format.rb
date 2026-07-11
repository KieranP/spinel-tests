# frozen_string_literal: true
# Human-readable duration formatting from a second count (no Time).
# Inference: repeated Integer divmod to split into d/h/m/s, reject of zero units,
# and String join / parse round-trip.

UNITS = [["d", 86_400], ["h", 3_600], ["m", 60], ["s", 1]].freeze

def format_duration(seconds)
  return "0s" if seconds.zero?
  remaining = seconds
  parts = []
  UNITS.each do |label, size|
    count, remaining = remaining.divmod(size)
    parts << "#{count}#{label}" if count > 0
  end
  parts.join(" ")
end

def parse_duration(str)
  str.split.sum do |token|
    num = token[0...-1].to_i
    label = token[-1]
    size = UNITS.find { |l, _| l == label }[1]
    num * size
  end
end

samples = [0, 59, 60, 3661, 90061, 86_400, 100]
samples.each { |s| puts "#{s}s -> #{format_duration(s)}" }

puts "roundtrip: #{samples.all? { |s| parse_duration(format_duration(s)) == s || s == 0 }}"
puts "parse '1h 30m': #{parse_duration('1h 30m')}"
puts "parse '2d': #{parse_duration('2d')}"

total = samples.sum
puts "sum formatted: #{format_duration(total)}"
p format_duration(3600)
p parse_duration("1d 1h 1m 1s")
