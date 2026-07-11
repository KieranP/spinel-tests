# frozen_string_literal: true
# Inverted index: map each word to the sorted list of doc ids containing it.
docs = {
  1 => "the quick brown fox",
  2 => "the lazy dog",
  3 => "quick dog runs fast",
}

index = Hash.new { |h, k| h[k] = [] }
docs.each do |id, text|
  text.split.each do |word|
    index[word] << id unless index[word].include?(id)
  end
end

index.keys.sort.each do |word|
  puts "#{word}: #{index[word].sort.join(',')}"
end

# words appearing in more than one doc
multi = index.select { |_w, ids| ids.size > 1 }
p multi.keys.sort

# tally of document frequencies
freq = index.transform_values(&:size)
p freq.sort_by { |w, _| w }
