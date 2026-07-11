# frozen_string_literal: true
# Slug generation from titles
def slugify(title)
  s = title.downcase
  s = s.gsub(/[^a-z0-9\s-]/, "")
  s = s.strip
  s = s.gsub(/[\s-]+/, "-")
  s
end

titles = [
  "Hello, World!",
  "  Ruby & Spinel: A Compiler Story  ",
  "100% Pure -- Awesome!!!",
  "multiple   spaces\tand\ttabs",
  "Already-a-slug",
]

titles.each do |t|
  puts slugify(t)
end

slugs = titles.map { |t| slugify(t) }
p slugs
p slugs.uniq.sort
