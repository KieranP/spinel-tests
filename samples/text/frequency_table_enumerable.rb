# frozen_string_literal: true
# Frequency table with tally, group_by, partition, chunk_while.
words = %w[apple banana apple cherry banana apple date cherry banana]

# tally
counts = words.tally
p counts.sort_by { |w, c| [-c, w] }

# most common
top = counts.max_by { |_w, c| c }
puts "most common: #{top[0]} (#{top[1]})"

# group by first letter
by_letter = words.uniq.group_by { |w| w[0] }
p by_letter.sort.to_h

# partition into vowels-start vs not
vowel_start, cons_start = words.uniq.partition { |w| "aeiou".include?(w[0]) }
p vowel_start.sort
p cons_start.sort

# running frequency via each_with_object
running = words.each_with_object(Hash.new(0)) { |w, h| h[w] += 1 }
p running.sort.to_h

# chunk consecutive duplicates
nums = [1, 1, 2, 3, 3, 3, 2, 2]
p nums.chunk_while { |a, b| a == b }.to_a
