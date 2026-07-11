# frozen_string_literal: true
# INI-style config parser
config = <<~INI
  [server]
  host = localhost
  port = 8080

  [database]
  name = mydb
  user = admin
  ; this is a comment
  timeout = 30
INI

result = {}
section = nil

config.each_line do |line|
  line = line.strip
  next if line.empty? || line.start_with?(";", "#")
  if line.start_with?("[") && line.end_with?("]")
    section = line[1..-2]
    result[section] = {}
  elsif line.include?("=")
    key, val = line.split("=", 2).map(&:strip)
    result[section][key] = val
  end
end

result.each do |sec, pairs|
  puts "[#{sec}]"
  pairs.sort.each { |k, v| puts "  #{k} -> #{v}" }
end
