# frozen_string_literal: true
# Parse an INI-style config into a nested Hash of sections.
# Inference: line-oriented String parsing with strip/split, a mutable current-section
# key threaded through each_with_object, and typed value coercion.

CONFIG = <<~INI.freeze
  ; a comment
  [server]
  host = localhost
  port = 8080
  debug = true

  [database]
  name = mydb
  pool = 5
INI

def coerce(value)
  case value
  when "true" then true
  when "false" then false
  when /\A\d+\z/ then value.to_i
  else value
  end
end

def parse(text)
  text.each_line.each_with_object({}) do |raw, config|
    line = raw.strip
    next if line.empty? || line.start_with?(";", "#")
    if line.start_with?("[") && line.end_with?("]")
      section = line[1...-1]
      config[section] = {}
    elsif line.include?("=")
      key, value = line.split("=", 2).map(&:strip)
      config[config.keys.last][key] = coerce(value)
    end
  end
end

config = parse(CONFIG)
puts "sections: #{config.keys.sort.inspect}"
puts "server.host: #{config['server']['host']}"
puts "server.port: #{config['server']['port']} (#{config['server']['port'].class})"
puts "server.debug: #{config['server']['debug']} (#{config['server']['debug'].class})"
puts "database.pool: #{config['database']['pool']}"

total_keys = config.values.sum { |section| section.size }
puts "total keys: #{total_keys}"
puts "coerce samples: #{['true', '42', 'hello'].map { |v| coerce(v) }.inspect}"
p config["database"]["name"]
p config.map { |sec, kv| [sec, kv.size] }.sort
