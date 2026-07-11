# frozen_string_literal: true
# Word-frequency report: scan a paragraph into words, tally, rank by descending
# count then alphabetically, and render an aligned column report.
# Inference: String -> Array(String) -> Hash{String=>Integer}, then sorted into an
# Array of [String, Integer] pairs. Container element types flow end to end, and
# max_by returns the pair type rather than either component.

text = <<~TEXT
  the quick brown fox
  jumps over the lazy dog
  the dog was not amused
  the fox ran away
  the dog barks and the fox runs the fox is quick
TEXT

words = text.downcase.scan(/[a-z]+/)
counts = Hash.new(0)
words.each { |w| counts[w] += 1 }

puts "total words: #{words.length}"
puts "unique words: #{counts.size}"

ranked = counts.sort_by { |word, n| [-n, word] }
ranked.each { |word, n| puts "#{word.ljust(8)}#{n}" }

top = counts.max_by { |_word, n| n }
puts "most common: #{top[0]} (#{top[1]})"

ranked.first(5).each { |word, n| puts "top5 #{word}: #{n}" }
p counts["the"]
p counts.values.sum
p counts.keys.length
p ranked.take_while { |_w, n| n > 2 }
p counts.select { |_w, n| n == 1 }.keys.sort.first(4)
