# frozen_string_literal: true
# Layered configuration: deep-merge defaults, a site file and command-line
# overrides into one effective config, then resolve dotted paths against it and
# validate the result against a small schema.

DEFAULTS = {
  server: { host: "0.0.0.0", port: 8080, workers: 4, tls: { enabled: false, cert: nil } },
  logging: { level: "info", targets: ["stdout"] },
  limits: { max_body: 1_048_576, timeout: 30 }
}.freeze

SITE = {
  server: { port: 9090, tls: { enabled: true, cert: "/etc/ssl/site.pem" } },
  logging: { level: "debug", targets: ["stdout", "file"] }
}.freeze

CLI = {
  server: { workers: 8 },
  limits: { timeout: 5 }
}.freeze

def deep_merge(base, other)
  base.merge(other) do |_key, old, new|
    if old.is_a?(Hash) && new.is_a?(Hash)
      deep_merge(old, new)
    else
      new
    end
  end
end

def flatten_config(node, prefix = [], acc = {})
  node.each do |key, value|
    path = prefix + [key.to_s]
    if value.is_a?(Hash)
      flatten_config(value, path, acc)
    else
      acc[path.join(".")] = value
    end
  end
  acc
end

def lookup(config, dotted)
  keys = dotted.split(".").map(&:to_sym)
  config.dig(*keys)
end

SCHEMA = {
  "server.host" => ->(v) { v.is_a?(String) && !v.empty? },
  "server.port" => ->(v) { v.is_a?(Integer) && v.between?(1, 65_535) },
  "server.workers" => ->(v) { v.is_a?(Integer) && v.positive? },
  "logging.level" => ->(v) { %w[debug info warn error].include?(v) },
  "limits.timeout" => ->(v) { v.is_a?(Integer) && v.between?(1, 600) }
}.freeze

effective = [DEFAULTS, SITE, CLI].reduce { |acc, layer| deep_merge(acc, layer) }

puts "effective configuration"
flat = flatten_config(effective)
flat.keys.sort.each do |key|
  puts format("  %-20s %s", key, flat[key].inspect)
end
puts

puts "provenance"
layers = { "defaults" => DEFAULTS, "site" => SITE, "cli" => CLI }
flat.keys.sort.each do |key|
  winner = layers.keys.reverse.find { |name| flatten_config(layers[name]).key?(key) }
  overridden = layers.keys.count { |name| flatten_config(layers[name]).key?(key) } - 1
  note = overridden.positive? ? " (overrides #{overridden})" : ""
  puts format("  %-20s <- %s%s", key, winner, note)
end
puts

puts "dotted lookups"
["server.tls.cert", "logging.targets", "limits.max_body", "server.missing"].each do |path|
  puts format("  %-18s %s", path, lookup(effective, path).inspect)
end
puts

puts "validation"
failures = SCHEMA.reject { |path, check| check.call(lookup(effective, path)) }
SCHEMA.each_key do |path|
  status = failures.key?(path) ? "FAIL" : "ok"
  puts format("  %-18s %-4s %s", path, status, lookup(effective, path).inspect)
end
puts "  #{failures.empty? ? 'all checks passed' : "#{failures.size} check(s) failed"}"
puts

puts "a bad override is caught"
broken = deep_merge(effective, { server: { port: 70_000 }, logging: { level: "trace" } })
SCHEMA.each do |path, check|
  value = lookup(broken, path)
  puts format("  %-18s %s", path, check.call(value) ? "ok" : "rejected #{value.inspect}")
end
