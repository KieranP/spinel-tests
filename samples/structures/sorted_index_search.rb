# frozen_string_literal: true
# A read-only index over sorted event records: point lookups and range scans are
# served by binary search rather than a linear scan, and the results are checked
# against the equivalent linear queries so any disagreement shows up in the output.

Event = Struct.new(:at, :level, :message) do
  def to_s = format("%5d %-5s %s", at, level, message)
end

RAW = [
  [100, "info",  "boot"],
  [140, "info",  "config loaded"],
  [180, "warn",  "slow disk"],
  [180, "info",  "cache warm"],
  [225, "error", "connection refused"],
  [310, "info",  "retry scheduled"],
  [400, "warn",  "queue depth 90"],
  [455, "error", "connection refused"],
  [455, "info",  "failover"],
  [512, "info",  "healthy"],
  [640, "warn",  "queue depth 120"],
  [700, "info",  "compaction"],
  [880, "error", "disk full"],
  [905, "info",  "operator ack"],
  [960, "info",  "shutdown"]
].freeze

EVENTS = RAW.map { |at, level, message| Event.new(at, level, message) }.freeze
STAMPS = EVENTS.map(&:at).freeze

# index of the first event at or after `t` (STAMPS.size when there is none)
def lower_bound(t) = STAMPS.bsearch_index { |x| x >= t } || STAMPS.size

# index of the first event strictly after `t`
def upper_bound(t) = STAMPS.bsearch_index { |x| x > t } || STAMPS.size

def range_scan(from, to) = EVENTS[lower_bound(from)...upper_bound(to)] || []

def linear_scan(from, to) = EVENTS.select { |e| e.at.between?(from, to) }

puts "#{EVENTS.size} events spanning #{STAMPS.first}..#{STAMPS.last}"
puts "sorted: #{STAMPS.each_cons(2).to_a.all? { |a, b| a <= b }}"
puts

puts "point lookups"
[100, 180, 181, 455, 960, 42, 1000].each do |t|
  i = lower_bound(t)
  hit = i < STAMPS.size && STAMPS[i] == t
  first = hit ? EVENTS[i].to_s.strip : "-"
  count = hit ? upper_bound(t) - i : 0
  puts format("  t=%-5d %-8s idx=%-3d %d match(es)  %s",
              t, hit ? "found" : "absent", i, count, first)
end
puts

puts "range scans"
[[100, 200], [180, 180], [226, 454], [500, 1000], [0, 99]].each do |from, to|
  fast = range_scan(from, to)
  slow = linear_scan(from, to)
  puts format("  %4d..%-4d %2d event(s)  agrees with linear scan: %s",
              from, to, fast.size, fast == slow)
end
puts

puts "events in 400..700"
range_scan(400, 700).each { |e| puts "  #{e}" }
puts

puts "nearest event to a timestamp"
[95, 200, 460, 999].each do |t|
  i = lower_bound(t)
  before = i.positive? ? EVENTS[i - 1] : nil
  after = i < EVENTS.size ? EVENTS[i] : nil
  nearest = [before, after].compact.min_by { |e| (e.at - t).abs }
  gap = (nearest.at - t).abs
  puts format("  t=%-5d nearest %5d (%+d)  %s", t, nearest.at, nearest.at - t, nearest.message)
  puts format("          gap %d, %s", gap, gap.zero? ? "exact hit" : "interpolated")
end
puts

puts "first event at or after each level's first appearance"
%w[info warn error].each do |level|
  first = EVENTS.find { |e| e.level == level }
  last = EVENTS.reverse.find { |e| e.level == level }
  count = EVENTS.count { |e| e.level == level }
  puts format("  %-5s %2d event(s)  first t=%-4d last t=%-4d", level, count, first.at, last.at)
end
puts

puts "bucketed by 200-tick window"
buckets = EVENTS.group_by { |e| (e.at / 200) * 200 }
(0..800).step(200) do |window|
  rows = buckets.fetch(window, [])
  levels = rows.map(&:level).tally.sort.map { |l, n| "#{l}:#{n}" }.join(" ")
  puts format("  %4d-%-4d %2d  %-24s %s", window, window + 199, rows.size, levels, "#" * rows.size)
end
puts

puts "duplicate timestamps"
STAMPS.tally.select { |_t, n| n > 1 }.sort.each do |t, n|
  messages = EVENTS.select { |e| e.at == t }.map(&:message)
  puts format("  t=%-5d %d events: %s", t, n, messages.join(" | "))
end
puts

puts "recurring messages"
EVENTS.group_by(&:message).select { |_m, es| es.size > 1 }.sort.each do |message, es|
  puts format("  %-22s %d times at %s", message, es.size, es.map(&:at).join(", "))
end
puts

puts "consistency"
checks = [
  ["lower_bound is monotonic", (0..1000).step(50).map { |t| lower_bound(t) }.each_cons(2).to_a.all? { |a, b| a <= b }],
  ["lower <= upper for every stamp", STAMPS.uniq.all? { |t| lower_bound(t) <= upper_bound(t) }],
  ["range scans match linear scans", [[0, 1000], [180, 455], [700, 700]].all? { |f, t| range_scan(f, t) == linear_scan(f, t) }],
  ["full scan returns everything", range_scan(0, 1000).size == EVENTS.size]
]
checks.each { |label, ok| puts format("  %-32s %s", label, ok ? "ok" : "FAILED") }
