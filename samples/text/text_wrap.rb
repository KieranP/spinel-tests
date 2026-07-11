# frozen_string_literal: true
# Greedy word-wrap of text to a maximum line width.
# Inference: String#split into words, each_with_object accumulating lines with a
# running length, and String#length / join across the fold.

def wrap(text, width)
  lines = []
  current = []
  length = 0
  text.split.each do |word|
    added = current.empty? ? word.length : length + 1 + word.length
    if added > width && !current.empty?
      lines << current.join(" ")
      current = [word]
      length = word.length
    else
      current << word
      length = added
    end
  end
  lines << current.join(" ") unless current.empty?
  lines
end

text = "the quick brown fox jumps over the lazy dog again and again"
[10, 20, 40].each do |w|
  puts "=== width #{w} ==="
  lines = wrap(text, w)
  lines.each { |l| puts "#{l} (#{l.length})" }
  puts "over width: #{lines.count { |l| l.length > w }}"
end

wrapped = wrap(text, 15)
puts "line count at 15: #{wrapped.length}"
puts "longest line: #{wrapped.max_by(&:length).length}"
puts "reconstruct ok: #{wrapped.join(' ') == text}"
p wrap("a bb ccc", 3)
p wrap("single", 100)
