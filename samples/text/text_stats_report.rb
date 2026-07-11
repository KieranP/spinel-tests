# frozen_string_literal: true
# A text-statistics report: word frequencies, sentence lengths, formatting.
text = <<~TXT
  The quick brown fox. The lazy dog sleeps.
  A fox and a dog. The end.
TXT

words = text.downcase.scan(/[a-z]+/)
freq = Hash.new(0)
words.each { |w| freq[w] += 1 }

top = freq.sort_by { |w, c| [-c, w] }.first(3)
top.each do |word, count|
  bar = "#" * count
  puts "#{word.ljust(8)}| #{bar} (#{count})"
end

sentences = text.split(/[.]\s*/).reject(&:empty?)
lengths = sentences.map { |s| s.scan(/[a-z]+/i).length }
puts "sentences: #{sentences.length}"
puts "avg words: #{(lengths.sum.to_f / lengths.length).round(2)}"
puts "longest: #{lengths.max}, shortest: #{lengths.min}"
puts "median: #{lengths.sort[lengths.length / 2]}"
