# frozen_string_literal: true
# A bounded producer/consumer pipeline: one producer feeds line-chunks into a
# SizedQueue, N workers tally word lengths, and a ConditionVariable gates the
# final merge until every worker has reported.
# Inference: a SizedQueue carries Array(String) payloads while a Mutex-guarded
# Hash{Integer=>Integer} accumulator is merged from several threads.

CHUNKS = [
  ["the quick brown fox", "jumps over"],
  ["the lazy dog", "while nine plovers"],
  ["watch from a fence", "and say nothing at all"],
  ["end of transmission"]
]

WORKERS = 3

queue = SizedQueue.new(2)
totals = {}
totals_lock = Mutex.new

done_lock = Mutex.new
done_cv = ConditionVariable.new
finished = 0

def tally_chunk(lines)
  counts = {}
  lines.each do |line|
    line.split(" ").each do |word|
      n = word.length
      counts[n] = (counts[n] || 0) + 1
    end
  end
  counts
end

workers = WORKERS.times.map do
  Thread.new do
    local = {}
    while (lines = queue.pop)
      tally_chunk(lines).each { |len, count| local[len] = (local[len] || 0) + count }
    end
    totals_lock.synchronize do
      local.each { |len, count| totals[len] = (totals[len] || 0) + count }
    end
    done_lock.synchronize do
      finished += 1
      done_cv.broadcast
    end
  end
end

CHUNKS.each { |chunk| queue.push(chunk) }
queue.close

done_lock.synchronize do
  done_cv.wait(done_lock) while finished < WORKERS
end
workers.each(&:join)

p queue.max
p queue.closed?
p queue.empty?
p finished

lengths = totals.keys.sort
lengths.each { |len| puts format("%2d chars: %s", len, "*" * totals[len]) }

p totals.values.sum
p lengths.first
p lengths.last
p totals[3]

# The same tally computed serially must agree with the threaded merge.
serial = {}
CHUNKS.each do |chunk|
  tally_chunk(chunk).each { |len, count| serial[len] = (serial[len] || 0) + count }
end
p serial == totals
