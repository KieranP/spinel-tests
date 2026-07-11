# frozen_string_literal: true
# A parallel inverted-index build: worker threads pull document chunks off a Queue,
# tokenise them independently, and merge their partial indexes under one Mutex. The
# run then checks the parallel answer against a serial fold of the same corpus, and
# every print happens after the joins so the output is byte-identical each run.
# Inference: Hash{String=>Hash{Integer=>Integer}} partials built per thread and merged
# with a nested block, a Queue carrying [Integer, String] pairs, and a shared counter
# whose type must survive crossing the thread boundary.

CORPUS = [
  "the quick brown fox jumps over the lazy dog",
  "the dog barks and the fox runs away",
  "a quick brown dog outpaces a quick fox",
  "lazy afternoons suit the lazy dog best",
  "foxes and dogs and the quick brown hare",
  "the hare outran the fox but not the dog",
  "quick quick slow slow the dance of the fox",
  "every dog has its day and every fox its night"
].freeze

WORKERS = 4

def tokenise(text) = text.downcase.scan(/[a-z]+/)

def serial_index(corpus)
  index = Hash.new { |h, k| h[k] = Hash.new(0) }
  corpus.each_with_index do |doc, doc_id|
    tokenise(doc).each { |word| index[word][doc_id] += 1 }
  end
  index
end

def parallel_index(corpus, workers)
  jobs = Queue.new
  corpus.each_with_index { |doc, doc_id| jobs << [doc_id, doc] }
  workers.times { jobs << nil }

  merged = Hash.new { |h, k| h[k] = Hash.new(0) }
  lock = Mutex.new
  processed = 0

  threads = workers.times.map do |worker_id|
    Thread.new(worker_id) do |wid|
      local = Hash.new { |h, k| h[k] = Hash.new(0) }
      handled = 0
      loop do
        job = jobs.pop
        break if job.nil?

        doc_id, text = job
        tokenise(text).each { |word| local[word][doc_id] += 1 }
        handled += 1
      end

      lock.lock
      begin
        local.each do |word, postings|
          postings.each { |doc_id, count| merged[word][doc_id] += count }
        end
        processed += handled
      ensure
        lock.unlock
      end

      [wid, handled]
    end
  end

  shares = threads.map(&:value)
  [merged, processed, shares]
end

serial = serial_index(CORPUS)
parallel, processed, shares = parallel_index(CORPUS, WORKERS)

puts "== corpus =="
puts "documents: #{CORPUS.size}, total tokens: #{CORPUS.sum { |d| tokenise(d).size }}"
puts "distinct terms: #{serial.size}"

puts
puts "== parallel build agrees with the serial fold =="
puts "documents processed: #{processed} (expected #{CORPUS.size})"
puts "every worker returned a share: #{shares.size == WORKERS}"
puts "shares sum to the corpus: #{shares.sum { |_wid, n| n } == CORPUS.size}"
puts "term sets identical: #{parallel.keys.sort == serial.keys.sort}"

mismatches = serial.keys.sort.reject { |word| parallel[word] == serial[word] }
puts "posting lists identical: #{mismatches.empty?} (#{mismatches.size} mismatched)"

puts
puts "== top terms by total frequency =="
totals = serial.transform_values { |postings| postings.values.sum }
totals.sort_by { |word, n| [-n, word] }.first(8).each do |word, n|
  docs = serial[word].keys.sort
  puts format("  %-9s %2d occurrences in docs %s", word, n, docs.inspect)
end

puts
puts "== terms unique to one document =="
singles = serial.select { |_w, postings| postings.size == 1 }.keys.sort
puts "count: #{singles.size}"
puts singles.each_slice(8).map { |slice| "  #{slice.join(" ")}" }

puts
puts "== a phrase query, intersecting posting lists =="
["quick brown", "lazy dog", "fox hare", "dog cat"].each do |phrase|
  words = tokenise(phrase)
  lists = words.map { |w| serial.key?(w) ? serial[w].keys.to_a : [] }
  hits = lists.reduce { |acc, l| acc & l }
  hits = [] if hits.nil?
  puts format("  %-12s -> docs %s", phrase, hits.sort.inspect)
end

puts
puts "== a bounded pipeline with SizedQueue =="
stage_in = SizedQueue.new(2)
stage_out = Queue.new
consumer = Thread.new do
  results = []
  loop do
    item = stage_in.pop
    break if item.nil?

    results << item.upcase
  end
  results.each { |r| stage_out << r }
  stage_out << nil
  results.size
end

%w[alpha beta gamma delta].each { |w| stage_in << w }
stage_in << nil
count = consumer.value

drained = []
loop do
  item = stage_out.pop
  break if item.nil?

  drained << item
end
puts "queue max: #{stage_in.max}, consumed: #{count}"
puts "drained in order: #{drained.inspect}"
puts "queue empty at the end: #{stage_out.empty? && stage_in.empty?}"

puts
puts "== a counter guarded by a mutex =="
counter = 0
guard = Mutex.new
bumpers = 8.times.map do
  Thread.new do
    250.times do
      guard.lock
      counter += 1
      guard.unlock
    end
  end
end
bumpers.each(&:join)
puts "expected 2000, got #{counter}"
puts "no lost updates: #{counter == 2000}"
puts "mutex released: #{!guard.locked?}"
