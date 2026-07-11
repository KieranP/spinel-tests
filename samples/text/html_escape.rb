# frozen_string_literal: true
# Minimal HTML escaping/unescaping via gsub with a lookup hash.
# Inference: String#gsub with a Hash replacement and a Regexp, character-class
# alternation, and round-trip through an inverse map.

ESCAPES = { "&" => "&amp;", "<" => "&lt;", ">" => "&gt;", '"' => "&quot;", "'" => "&#39;" }.freeze
UNESCAPES = ESCAPES.invert.freeze

def escape(str)
  str.gsub(/[&<>"']/, ESCAPES)
end

def unescape(str)
  str.gsub(/&(?:amp|lt|gt|quot|#39);/, UNESCAPES)
end

samples = [
  "a < b && c > d",
  '<a href="x">link</a>',
  "it's a test",
  "no special chars",
]

samples.each do |s|
  esc = escape(s)
  puts "#{s} -> #{esc}"
end

puts "roundtrip: #{samples.all? { |s| unescape(escape(s)) == s }}"
puts "escape count in first: #{escape(samples[0]).scan(/&\w+;|&#\d+;/).length}"

# count of each escaped entity across all samples
entities = samples.flat_map { |s| escape(s).scan(/&\w+;|&#\d+;/) }.tally
puts "entities: #{entities.sort.inspect}"
p escape("<>&")
p unescape("&lt;tag&gt;")
