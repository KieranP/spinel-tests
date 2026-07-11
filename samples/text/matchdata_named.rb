# frozen_string_literal: true
# Parsing with named regex captures and MatchData access.
# Inference: MatchData from #match, named_captures returning a Hash, and $~-style
# named group access must keep String field types across the parse.

LINE = /(?<level>\w+):(?<code>\d+):(?<msg>.+)/

logs = [
  "ERROR:500:internal failure",
  "WARN:301:redirected",
  "INFO:200:ok",
]

logs.each do |line|
  m = line.match(LINE)
  puts "#{m[:level]} (#{m[:code]}) -> #{m[:msg]}"
end

first = logs.first.match(LINE)
p first.named_captures
p first[:level]
p first["code"]

codes = logs.map { |l| l.match(LINE)[:code].to_i }
p codes
p codes.sum
p logs.map { |l| l.match(LINE)[:level] }.tally
