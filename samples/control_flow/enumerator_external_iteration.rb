# frozen_string_literal: true
# A merge-of-sorted-streams driven by *external* iteration: each stream is an
# Enumerator advanced by hand with `next`/`peek`, StopIteration retires a stream, and
# `rewind` replays one from the start. The merged output is checked against a plain
# sort of the same data, so a mis-stepped iterator shows up as wrong content.
# Inference: Enumerator objects held in an Array and advanced individually, a rescue
# that turns StopIteration into a sentinel, and a generator block whose yielded type
# must be inferred without any eager collection ever existing.

def counter(start, step, limit)
  Enumerator.new do |y|
    value = start
    while value <= limit
      y << value
      value += step
    end
  end
end

def letters(from, to)
  Enumerator.new do |y|
    (from..to).each { |c| y.yield c }
  end
end

puts "== stepping one enumerator by hand =="
e = counter(1, 3, 13)
puts "first three: #{[e.next, e.next, e.next].inspect}"
puts "peek does not advance: #{e.peek} then #{e.next}"
puts "remaining: #{[e.next].inspect}"
retired = (e.next rescue $!.class)
puts "past the end: #{retired}"
e.rewind
puts "after rewind: #{e.next}"

puts
puts "== merging three sorted streams by hand =="
STREAMS = [
  [1, 4, 9, 16, 25],
  [2, 3, 5, 7, 11, 13],
  [10, 20, 30]
].freeze

def merge_external(arrays)
  iters = arrays.map(&:each)
  heads = iters.map { |it| (it.next rescue nil) }
  out = []
  loop do
    live = heads.each_index.reject { |i| heads[i].nil? }
    break if live.empty?

    pick = live.min_by { |i| heads[i] }
    out << heads[pick]
    heads[pick] = (iters[pick].next rescue nil)
  end
  out
end

merged = merge_external(STREAMS)
puts "merged: #{merged.inspect}"
puts "matches a plain sort: #{merged == STREAMS.flatten.sort}"
puts "length: #{merged.size} == #{STREAMS.sum(&:size)}"

puts
puts "== an infinite generator, taken lazily =="
naturals = Enumerator.new do |y|
  n = 1
  loop do
    y << n
    n += 1
  end
end
puts "first 8: #{naturals.take(8).inspect}"
puts "first 5 squares: #{naturals.lazy.map { |n| n * n }.first(5).inspect}"
puts "first 4 multiples of 7: #{naturals.lazy.select { |n| (n % 7).zero? }.first(4).inspect}"
puts "stepping the same enumerator by hand: #{[naturals.next, naturals.next, naturals.next].inspect}"

puts
puts "== with_index and with_object on an external enumerator =="
alpha = letters("a", "e")
puts "letters: #{alpha.to_a.inspect}"
puts "with_index: #{letters("a", "e").each_with_index.map { |c, i| "#{i}#{c}" }.inspect}"
puts "with_object: #{letters("a", "c").each_with_object([]) { |c, acc| acc << c.upcase }.inspect}"

puts
puts "== StopIteration inside Kernel#loop is swallowed =="
seq = [10, 20, 30].each
collected = []
loop do
  collected << seq.next
end
puts "loop collected: #{collected.inspect} (no exception escaped)"

nested = [1, 2].each
outer = []
loop do
  a = nested.next
  inner = %w[x y].each
  loop do
    outer << "#{a}#{inner.next}"
  end
end
puts "nested loops: #{outer.inspect}"

puts
puts "== catch/throw unwinds several frames at once =="
def find_pair(grid, target)
  catch(:found) do
    grid.each_with_index do |row, r|
      row.each_with_index do |value, c|
        throw :found, [r, c] if value == target
      end
    end
    nil
  end
end

GRID = [[3, 1, 4], [1, 5, 9], [2, 6, 5]].freeze
puts "find 9: #{find_pair(GRID, 9).inspect}"
puts "find 5: #{find_pair(GRID, 5).inspect}"
puts "find 7: #{find_pair(GRID, 7).inspect}"

puts
puts "== ensure runs on every exit path =="
def traced(mode, log)
  log << "enter:#{mode}"
  return "returned" if mode == :return
  raise ArgumentError, "boom" if mode == :raise

  throw :escape, "thrown" if mode == :throw

  "fell through"
ensure
  log << "ensure:#{mode}"
end

log = []
puts "normal: #{traced(:normal, log).inspect}"
puts "return: #{traced(:return, log).inspect}"
puts "raise:  #{(traced(:raise, log) rescue $!.class)}"
puts "throw:  #{catch(:escape) { traced(:throw, log) }.inspect}"
puts "log: #{log.inspect}"
puts "one ensure per call: #{log.count { |l| l.start_with?("ensure") } == 4}"

puts
puts "== retry with a bounded attempt count =="
def flaky(fail_times, log)
  attempts = 0
  begin
    attempts += 1
    log << "attempt #{attempts}"
    raise IOError, "transient" if attempts <= fail_times

    "ok after #{attempts}"
  rescue IOError
    retry if attempts < 4

    "gave up after #{attempts}"
  end
end

[0, 2, 9].each do |fails|
  trace = []
  result = flaky(fails, trace)
  puts format("  fail %d times -> %-20s %s", fails, result, trace.inspect)
end
