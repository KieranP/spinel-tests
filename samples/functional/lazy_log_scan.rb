# frozen_string_literal: true
# Scan a synthetic access log through lazy pipelines: only as many lines as each
# query needs are ever parsed. A parse counter proves the laziness.

$parsed = 0

LOG = <<~'TEXT'
  10.0.0.1 - GET /index.html 200 1043 12
  10.0.0.2 - GET /style.css 200 512 3
  10.0.0.1 - POST /api/login 401 88 45
  10.0.0.3 - GET /index.html 200 1043 9
  10.0.0.2 - GET /missing 404 120 2
  10.0.0.4 - POST /api/login 200 256 133
  10.0.0.1 - GET /api/items 200 8192 87
  10.0.0.5 - GET /admin 403 64 4
  10.0.0.3 - GET /api/items 500 0 1204
  10.0.0.2 - POST /api/order 201 320 210
  10.0.0.6 - GET /index.html 200 1043 11
  10.0.0.4 - GET /api/items 200 8192 92
  10.0.0.5 - POST /api/login 401 88 38
  10.0.0.1 - GET /favicon.ico 404 0 1
  10.0.0.7 - GET /api/items 500 0 998
TEXT

Entry = Struct.new(:ip, :verb, :path, :status, :bytes, :ms) do
  def error?
    status >= 400
  end

  def slow?
    ms > 100
  end

  def to_s
    format("%-9s %-4s %-14s %3d %5db %5dms", ip, verb, path, status, bytes, ms)
  end
end

def parse(line)
  $parsed += 1
  ip, _dash, verb, path, status, bytes, ms = line.split(" ")
  Entry.new(ip, verb, path, status.to_i, bytes.to_i, ms.to_i)
end

def entries
  LOG.lines.lazy.map { |l| parse(l.chomp) }
end

def reset!
  $parsed = 0
end

puts "log has #{LOG.lines.length} lines"
puts

reset!
first_error = entries.select(&:error?).first
puts "=== first error (lazy) ==="
puts "  #{first_error}"
puts "  lines parsed: #{$parsed} of #{LOG.lines.length}"
puts

reset!
first_three_slow = entries.select(&:slow?).first(3)
puts "=== first 3 slow requests (lazy) ==="
first_three_slow.each { |e| puts "  #{e}" }
puts "  lines parsed: #{$parsed}"
puts

reset!
first_500 = entries.select { |e| e.status == 500 }.map(&:path).first
puts "=== first 500's path (lazy) ==="
puts "  #{first_500}"
puts "  lines parsed: #{$parsed}"
puts

reset!
all = entries.to_a
puts "=== full scan ==="
puts "  lines parsed: #{$parsed}"
puts "  entries: #{all.length}"
puts

puts "=== status distribution ==="
by_status = {}
all.each { |e| by_status[e.status] = (by_status[e.status] || 0) + 1 }
by_status.keys.sort.each do |s|
  puts format("  %3d %-2d %s", s, by_status[s], "#" * by_status[s])
end
puts

puts "=== bytes by path ==="
by_path = {}
all.each { |e| by_path[e.path] = (by_path[e.path] || 0) + e.bytes }
by_path.keys.sort_by { |p| [-by_path[p], p] }.each do |p|
  puts format("  %-14s %6d", p, by_path[p])
end
puts

puts "=== lazy chains that never run to completion ==="
reset!
taken = entries.map { |e| e.ms }.take_while { |ms| ms < 100 }.to_a
puts "  take_while(ms < 100) -> #{taken.inspect}"
puts "  lines parsed: #{$parsed}"

reset!
rejected = entries.reject(&:error?).map(&:path).first(4)
puts "  reject(error).first(4) -> #{rejected.inspect}"
puts "  lines parsed: #{$parsed}"

reset!
mapped = entries.filter_map { |e| e.path if e.status == 200 }.first(3)
puts "  filter_map 200 .first(3) -> #{mapped.inspect}"
puts "  lines parsed: #{$parsed}"
puts

puts "=== lazy over an infinite source ==="
squares = (1..Float::INFINITY).lazy.map { |n| n * n }
puts "  first 8 squares      #{squares.first(8).inspect}"
puts "  first 4 square > 50  #{squares.select { |n| n > 50 }.first(4).inspect}"
triangular = (1..Float::INFINITY).lazy.map { |n| (n * (n + 1)) / 2 }
puts "  first 8 triangular   #{triangular.first(8).inspect}"
both = (1..Float::INFINITY).lazy.select { |n| (n % 3).zero? }.select { |n| (n % 5).zero? }
puts "  first 5 mult of 15   #{both.first(5).inspect}"
puts

puts "=== slowest and largest ==="
puts "  slowest  #{all.max_by(&:ms)}"
puts "  largest  #{all.max_by(&:bytes)}"
puts "  quietest #{all.min_by(&:ms)}"
puts

puts "=== per-IP summary ==="
ips = {}
all.each do |e|
  ips[e.ip] ||= [0, 0, 0]
  row = ips[e.ip]
  ips[e.ip] = [row[0] + 1, row[1] + e.bytes, row[2] + (e.error? ? 1 : 0)]
end
ips.keys.sort.each do |ip|
  n, bytes, errs = ips[ip]
  puts format("  %-9s %2d req %6db %d err", ip, n, bytes, errs)
end
puts

total_ms = all.reduce(0) { |s, e| s + e.ms }
puts format("total %d requests, %d bytes, %d ms, %.1f ms mean",
            all.length, all.reduce(0) { |s, e| s + e.bytes }, total_ms,
            total_ms.to_f / all.length)
puts "error rate #{format('%.1f%%', (all.count(&:error?) * 100.0) / all.length)}"
