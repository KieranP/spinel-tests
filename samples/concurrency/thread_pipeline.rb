# frozen_string_literal: true
# A three-stage worker pipeline over Queues: generate -> transform -> reduce.
# Several workers run per stage, so completion order is nondeterministic; every
# reported figure is therefore order-independent (sorted or summed).

require "set"

def stage(in_q, out_q, workers, label)
  threads = workers.times.map do |wid|
    Thread.new do
      count = 0
      loop do
        item = in_q.pop
        break if item.nil?
        out_q << yield(item, wid)
        count += 1
      end
      count
    end
  end
  [threads, label]
end

INPUT = (1..40).to_a

# Stage 1: classify each number.
raw_q = Queue.new
class_q = Queue.new
INPUT.each { |n| raw_q << n }

classifier_threads, = stage(raw_q, class_q, 4, "classify") do |n, _wid|
  divisors = (1..n).select { |d| (n % d).zero? }
  { "n" => n, "divisors" => divisors.length, "sum" => divisors.reduce(0) { |s, d| s + d } }
end
4.times { raw_q << nil }
classifier_counts = classifier_threads.map(&:value)

records = []
records << class_q.pop until class_q.empty?

puts "stage 1: classified #{records.length} numbers with 4 workers"
puts "  per-worker item counts sum to #{classifier_counts.reduce(0) { |s, c| s + c }}"
puts "  (individual counts vary run to run, so only the total is shown)"
puts

# Stage 2: tag perfect / abundant / deficient, guarded by a Mutex.
tally = { "perfect" => 0, "abundant" => 0, "deficient" => 0 }
lock = Mutex.new
work_q = Queue.new
records.each { |r| work_q << r }

tag_threads = 3.times.map do
  Thread.new do
    loop do
      r = work_q.pop
      break if r.nil?
      aliquot = r["sum"] - r["n"]
      kind = if aliquot == r["n"]
               "perfect"
             elsif aliquot > r["n"]
               "abundant"
             else
               "deficient"
             end
      lock.synchronize { tally[kind] += 1 }
    end
  end
end
3.times { work_q << nil }
tag_threads.each(&:join)

puts "stage 2: classification tally (3 workers, mutex-guarded)"
tally.keys.sort.each { |k| puts format("  %-10s %2d", k, tally[k]) }
puts "  total #{tally.values.reduce(0) { |s, v| s + v }}"
puts

# Stage 3: parallel sum of divisor counts, one partition per thread.
partitions = records.sort_by { |r| r["n"] }.each_slice(10).to_a
sum_threads = partitions.map do |part|
  Thread.new { part.reduce(0) { |s, r| s + r["divisors"] } }
end
partial = sum_threads.map(&:value)

puts "stage 3: #{partitions.length} partitions summed in parallel"
puts "  partial sums (in partition order) #{partial.inspect}"
puts "  total divisor count #{partial.reduce(0) { |s, v| s + v }}"
serial = records.reduce(0) { |s, r| s + r["divisors"] }
puts "  serial check        #{serial}  match=#{partial.reduce(0) { |s, v| s + v } == serial}"
puts

# A SizedQueue bounds the producer so it cannot outrun the consumer.
bounded = SizedQueue.new(4)
produced = []
consumed = []
producer = Thread.new do
  (1..12).each do |i|
    bounded << i * i
    produced << i * i
  end
  bounded << nil
end
consumer = Thread.new do
  loop do
    v = bounded.pop
    break if v.nil?
    consumed << v
  end
end
producer.join
consumer.join

puts "SizedQueue(4) producer/consumer"
puts "  produced #{produced.length} items, consumed #{consumed.length}"
puts "  consumed in order? #{consumed == consumed.sort}"
puts "  sum #{consumed.reduce(0) { |s, v| s + v }}"
puts

# ConditionVariable: a gate that releases all waiters at once.
gate = Mutex.new
cv = ConditionVariable.new
opened = false
arrived = []
waiters = 5.times.map do |i|
  Thread.new do
    gate.synchronize do
      cv.wait(gate) until opened
      arrived << i
    end
  end
end
gate.synchronize do
  opened = true
  cv.broadcast
end
waiters.each(&:join)

puts "ConditionVariable gate"
puts "  #{arrived.length} threads passed the gate"
puts "  ids (sorted) #{arrived.sort.inspect}"
puts "  all distinct? #{arrived.uniq.length == arrived.length}"
puts

perfects = records.select { |r| (r["sum"] - r["n"]) == r["n"] }.map { |r| r["n"] }.sort
puts "perfect numbers found in 1..40: #{perfects.inspect}"
top = records.max_by(3) { |r| r["divisors"] }.map { |r| r["n"] }.sort
puts "most-divisor numbers (sorted):  #{top.inspect}"
puts "sum of all n:                   #{records.reduce(0) { |s, r| s + r["n"] }}"
