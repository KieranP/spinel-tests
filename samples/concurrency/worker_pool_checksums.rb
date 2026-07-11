# frozen_string_literal: true
# A fixed-size worker pool that computes a rolling checksum for each of a list of
# payloads. Work is handed out through a Queue, results come back through a second
# Queue, and a Mutex guards a shared tally. Output is sorted so it stays
# deterministic regardless of the order threads finish in.

WORKERS = 4

PAYLOADS = [
  "the quick brown fox",
  "jumps over",
  "the lazy dog",
  "pack my box with five dozen liquor jugs",
  "how vexingly quick daft zebras jump",
  "sphinx of black quartz judge my vow",
  "two driven jocks help fax my big quiz",
  "five boxing wizards jump quickly",
  "jackdaws love my big sphinx of quartz",
  "the five boxing wizards jump"
].freeze

def checksum(text)
  text.each_byte.reduce(7) { |acc, b| ((acc * 31) + b) % 1_000_003 }
end

def entropy_bucket(text)
  distinct = text.delete(" ").chars.uniq.size
  case distinct
  when 0..10 then "low"
  when 11..18 then "mid"
  else "high"
  end
end

jobs = Queue.new
results = Queue.new
PAYLOADS.each_with_index { |text, i| jobs << [i, text] }
WORKERS.times { jobs << nil }

tally = { processed: 0, bytes: 0 }
tally_lock = Mutex.new

threads = WORKERS.times.map do |wid|
  Thread.new do
    handled = 0
    while (job = jobs.pop)
      index, text = job
      results << {
        index: index,
        worker: wid,
        sum: checksum(text),
        words: text.split.size,
        bucket: entropy_bucket(text)
      }
      handled += 1
      tally_lock.synchronize do
        tally[:processed] += 1
        tally[:bytes] += text.bytesize
      end
    end
    handled
  end
end

per_worker = threads.map(&:value)
results.close

collected = []
collected << results.pop until results.empty?
collected.sort_by! { |r| r[:index] }

puts "checksums (#{collected.size} payloads, #{WORKERS} workers)"
collected.each do |r|
  puts format("  %2d  %-40s %7d  %d words  %s",
              r[:index], PAYLOADS[r[:index]], r[:sum], r[:words], r[:bucket])
end
puts

puts "aggregate"
puts "  payloads processed: #{tally[:processed]}"
puts "  bytes processed:    #{tally[:bytes]}"
puts "  work units claimed: #{per_worker.sum} (across #{per_worker.size} workers)"
puts "  every payload seen: #{collected.map { |r| r[:index] }.sort == (0...PAYLOADS.size).to_a}"
puts

puts "by entropy bucket"
collected.group_by { |r| r[:bucket] }.sort_by { |bucket, _| bucket }.each do |bucket, rows|
  puts format("  %-5s %2d payload(s)  checksum range %d..%d",
              bucket, rows.size, rows.map { |r| r[:sum] }.min, rows.map { |r| r[:sum] }.max)
end
puts

# Recomputing single-threaded must agree with the pooled result.
serial = PAYLOADS.map { |t| checksum(t) }
puts "serial recomputation agrees: #{serial == collected.map { |r| r[:sum] }}"

# A SizedQueue throttles a producer that would otherwise run far ahead.
buffer = SizedQueue.new(2)
consumed = []
consumer = Thread.new do
  while (v = buffer.pop)
    consumed << v
  end
end
(1..6).each { |i| buffer << i * i }
buffer << nil
consumer.join
puts "throttled through a SizedQueue(2): #{consumed.inspect}"
