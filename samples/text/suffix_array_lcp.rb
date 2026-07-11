# frozen_string_literal: true
# Build a suffix array and its LCP array for a string, then use them to find
# the longest repeated substring and count distinct substrings.

def suffix_array(text)
  (0...text.length).sort_by { |i| text[i..] }
end

# Kasai's algorithm: LCP between consecutive suffixes in the suffix array.
def lcp_array(text, sa)
  n = text.length
  rank = Array.new(n, 0)
  sa.each_with_index { |pos, i| rank[pos] = i }

  lcp = Array.new(n, 0)
  h = 0
  (0...n).each do |i|
    r = rank[i]
    if r == n - 1
      h = 0
      next
    end
    j = sa[r + 1]
    while i + h < n && j + h < n && text[i + h] == text[j + h]
      h += 1
    end
    lcp[r] = h
    h -= 1 if h > 0
  end
  lcp
end

def longest_repeated(text, sa, lcp)
  best = 0
  at = 0
  lcp.each_with_index do |len, i|
    if len > best
      best = len
      at = sa[i]
    end
  end
  best.zero? ? "" : text[at, best]
end

def distinct_substrings(text, lcp)
  n = text.length
  total = (n * (n + 1)) / 2
  total - lcp.reduce(0) { |s, v| s + v }
end

def naive_distinct(text)
  seen = {}
  (0...text.length).each do |i|
    (i...text.length).each do |j|
      seen[text[i..j]] = true
    end
  end
  seen.size
end

def show(text)
  sa = suffix_array(text)
  lcp = lcp_array(text, sa)

  puts "text #{text.inspect}  (length #{text.length})"
  puts
  puts "  i  sa  lcp  suffix"
  sa.each_with_index do |pos, i|
    puts format("  %2d  %2d  %3d  %s", i, pos, lcp[i], text[pos..])
  end
  puts

  rep = longest_repeated(text, sa, lcp)
  puts "  longest repeated substring: #{rep.inspect} (length #{rep.length})"
  occurrences = (0...text.length).count { |i| !rep.empty? && text[i, rep.length] == rep }
  puts "  occurrences of it:          #{occurrences}"

  d = distinct_substrings(text, lcp)
  puts "  distinct substrings:        #{d}"
  puts "  cross-check (naive):        #{naive_distinct(text)}  match=#{d == naive_distinct(text)}"
  puts
end

show("banana")
show("abracadabra")
show("aaaa")
show("mississippi")

puts "=== sorted suffix listing is a lexicographic order check ==="
["banana", "abracadabra", "mississippi"].each do |t|
  sa = suffix_array(t)
  suffixes = sa.map { |i| t[i..] }
  puts format("  %-14s sorted? %s", t, suffixes == suffixes.sort)
end
puts

puts "=== longest common prefix of two strings via the arrays ==="
[["flower", "flow"], ["interspecies", "interstellar"], ["dog", "cat"]].each do |a, b|
  joined = "#{a}#{b}"
  n = 0
  n += 1 while n < a.length && n < b.length && a[n] == b[n]
  puts format("  %-14s %-14s lcp=%-3d %s", a, b, n, a[0, n].inspect)
end
puts

puts "=== repeated-substring summary across inputs ==="
["banana", "abracadabra", "aaaa", "mississippi", "abcdefg"].each do |t|
  sa = suffix_array(t)
  lcp = lcp_array(t, sa)
  rep = longest_repeated(t, sa, lcp)
  puts format("  %-14s longest repeat %-8s distinct %3d", t, rep.inspect, distinct_substrings(t, lcp))
end
