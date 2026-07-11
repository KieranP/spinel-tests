# frozen_string_literal: true
# Parsing log lines with named captures and MatchData
pattern = /(?<level>[A-Z]+)\s+\[(?<code>\d+)\]\s+(?<msg>.+)/

logs = [
  "ERROR [500] internal server error",
  "WARN [301] moved permanently",
  "INFO [200] request ok",
]

logs.each do |line|
  m = line.match(pattern)
  next unless m
  puts "level=#{m[:level]} code=#{m[:code]}"
  puts "  msg=#{m[:msg]}"
  puts "  pre=#{m.pre_match.inspect} post=#{m.post_match.inspect}"
  puts "  captures=#{m.captures.inspect}"
  puts "  names=#{m.names.inspect}"
  puts "  begin(1)=#{m.begin(1)} end(1)=#{m.end(1)}"
end

m2 = "WARN [301] moved permanently".match(pattern)
p m2.named_captures
