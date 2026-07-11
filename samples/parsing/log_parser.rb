# frozen_string_literal: true
# Parse log lines with regex + MatchData named captures, aggregate by level.
LINE = /\A(?<time>\d{2}:\d{2}) \[(?<level>[A-Z]+)\] (?<msg>.*)\z/

logs = [
  "08:01 [INFO] server started",
  "08:02 [WARN] high memory",
  "08:03 [ERROR] disk full",
  "08:04 [INFO] request handled",
  "garbage line",
  "08:05 [ERROR] timeout",
]

by_level = Hash.new { |h, k| h[k] = [] }
logs.each do |line|
  m = LINE.match(line)
  next unless m
  by_level[m[:level]] << m[:msg]
end

by_level.sort.each do |level, msgs|
  puts "#{level}: #{msgs.length}"
  msgs.each { |msg| puts "  - #{msg}" }
end

errors = by_level["ERROR"]
puts "first error: #{errors.first}"
puts "total matched: #{by_level.values.sum(&:length)}"

if (m = LINE.match(logs[0]))
  puts "named captures: #{m.named_captures.inspect}"
  puts "pre: #{m.pre_match.inspect} post: #{m.post_match.inspect}"
end
