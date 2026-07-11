# frozen_string_literal: true
# Group words into anagram classes keyed by their sorted-letter signature.
# Inference: String#chars.sort.join producing a String key, group_by over the
# signature, and sorting the resulting groups for stable output.

WORDS = %w[eat tea tan ate nat bat listen silent enlist cat act].freeze

def signature(word)
  word.chars.sort.join
end

groups = WORDS.group_by { |w| signature(w) }
sorted = groups.values.map(&:sort).sort_by(&:first)

puts "group count: #{sorted.length}"
sorted.each { |g| puts g.inspect }

puts "largest group size: #{sorted.map(&:length).max}"
puts "singletons: #{sorted.count { |g| g.length == 1 }}"

# signature distribution
sig_sizes = groups.transform_values(&:length)
puts "sizes by signature: #{sig_sizes.sort.inspect}"

# are 'listen' and 'silent' anagrams?
puts "listen~silent: #{signature('listen') == signature('silent')}"
puts "eat~bat: #{signature('eat') == signature('bat')}"
p signature("cinema")
p WORDS.group_by(&:length).transform_values(&:length).sort
