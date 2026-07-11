# frozen_string_literal: true
# Parse a Markdown document's headings into a nested table of contents with
# hierarchical numbering and GitHub-style anchor slugs, validating the heading
# structure as it goes.

class HeadingError < StandardError; end

Heading = Struct.new(:level, :text, :line) do
  def to_s
    "#{"#" * level} #{text}"
  end
end

def parse_heading(line, lineno)
  md = /\A(\#{1,6})\s+(\S.*?)\s*\#*\z/.match(line)
  raise HeadingError, "line #{lineno}: malformed heading #{line.inspect}" if md.nil?
  Heading.new(md[1].length, md[2], lineno)
end

def slugify(text)
  text.downcase.gsub(/[^a-z0-9\s-]/, "").strip.gsub(/\s+/, "-")
end

def headings_of(doc)
  in_fence = false
  out = []
  doc.lines.each_with_index do |raw, idx|
    line = raw.chomp
    if line.start_with?("```")
      in_fence = !in_fence
      next
    end
    next if in_fence
    next unless line.start_with?("#")
    out << parse_heading(line, idx + 1)
  end
  out
end

# Assign 1.2.3-style numbers, and reject a jump of more than one level.
def numbered(headings)
  counters = []
  out = []
  headings.each do |h|
    if counters.empty?
      raise HeadingError, "line #{h.line}: document starts at level #{h.level}" if h.level != 1
    elsif h.level > counters.length + 1
      raise HeadingError, "line #{h.line}: jumped from level #{counters.length} to #{h.level}"
    end
    counters = counters[0, h.level]
    counters << 0 while counters.length < h.level
    counters[h.level - 1] += 1
    out << [counters.join("."), h]
  end
  out
end

def unique_slugs(headings)
  seen = {}
  headings.map do |h|
    base = slugify(h.text)
    if seen.key?(base)
      seen[base] += 1
      "#{base}-#{seen[base]}"
    else
      seen[base] = 0
      base
    end
  end
end

DOC = <<~'MD'
  # Spinel Guide

  Intro prose.

  ## Getting Started

  ### Installing

  Some code:

  ```ruby
  # This is not a heading
  ## Neither is this
  ```

  ### Building

  ## Reference

  ### Types

  #### Integer

  #### String

  ### Methods

  ## Appendix

  ### Glossary

  ## Getting Started
MD

headings = headings_of(DOC)
puts "found #{headings.length} headings (fenced code skipped)"
puts

puts "=== flat listing ==="
headings.each do |h|
  puts format("  line %-3d L%d  %s", h.line, h.level, h.text)
end
puts

puts "=== numbered table of contents ==="
numbered(headings).each do |num, h|
  indent = "  " * (h.level - 1)
  puts format("%-10s %s%s", num, indent, h.text)
end
puts

puts "=== anchor links ==="
slugs = unique_slugs(headings)
headings.each_with_index do |h, i|
  puts format("  [%s](##{slugs[i]})", h.text)
end
puts

puts "duplicate heading text handled? #{slugs.uniq.length == slugs.length}"
puts "slug for the repeat: #{slugs.last}"
puts

puts "=== depth histogram ==="
by_level = {}
headings.each { |h| by_level[h.level] = (by_level[h.level] || 0) + 1 }
by_level.keys.sort.each do |lvl|
  puts format("  L%d %2d %s", lvl, by_level[lvl], "#" * by_level[lvl])
end
puts "max depth #{by_level.keys.max}"
puts

puts "=== section word counts ==="
sections = {}
current = nil
in_fence = false
DOC.lines.each do |raw|
  line = raw.chomp
  if line.start_with?("```")
    in_fence = !in_fence
    next
  end
  if !in_fence && line.start_with?("#")
    current = parse_heading(line, 0).text
    sections[current] = 0
  elsif current && !line.strip.empty?
    sections[current] += line.split(/\s+/).length
  end
end
sections.select { |_, n| n.positive? }.each do |name, n|
  puts format("  %-18s %d words", name, n)
end
puts

puts "=== structural validation ==="
[
  ["## Starts too deep\n", "document must start at level 1"],
  ["# A\n\n### Skipped\n", "level jump"],
  ["#NoSpace\n", "malformed heading"],
  ["# Fine\n\n## Also fine\n", "valid"]
].each do |src, label|
  begin
    numbered(headings_of(src))
    puts format("  %-32s accepted", label)
  rescue HeadingError => e
    puts format("  %-32s %s", label, e.message)
  end
end
