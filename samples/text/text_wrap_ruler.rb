# frozen_string_literal: true
# Greedy word-wrap to a fixed width
def wrap(text, width)
  words = text.split(/\s+/)
  lines = []
  current = ""
  words.each do |word|
    if current.empty?
      current = word
    elsif current.length + 1 + word.length <= width
      current += " " + word
    else
      lines << current
      current = word
    end
  end
  lines << current unless current.empty?
  lines
end

para = "The quick brown fox jumps over the lazy dog while the sun sets slowly"

[10, 20, 40].each do |w|
  puts "--- width #{w} ---"
  lines = wrap(para, w)
  lines.each { |l| puts l + "|" + " " * (w - l.length) + "<" }
end

p wrap(para, 15)
