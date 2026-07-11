# frozen_string_literal: true
# Line diff between two texts: LCS table, edit script, and unified-diff output
# with hunk headers and context, plus a similarity score.

def lcs_table(a, b)
  rows = a.length + 1
  cols = b.length + 1
  table = Array.new(rows) { Array.new(cols, 0) }
  (1...rows).each do |i|
    (1...cols).each do |j|
      table[i][j] = if a[i - 1] == b[j - 1]
                      table[i - 1][j - 1] + 1
                    else
                      left = table[i][j - 1]
                      up = table[i - 1][j]
                      left > up ? left : up
                    end
    end
  end
  table
end

# Walk the table backwards into a list of [op, line] with op in :keep/:del/:add
def edit_script(a, b)
  table = lcs_table(a, b)
  i = a.length
  j = b.length
  ops = []
  while i.positive? || j.positive?
    if i.positive? && j.positive? && a[i - 1] == b[j - 1]
      ops << [:keep, a[i - 1]]
      i -= 1
      j -= 1
    elsif j.positive? && (i.zero? || table[i][j - 1] >= table[i - 1][j])
      ops << [:add, b[j - 1]]
      j -= 1
    else
      ops << [:del, a[i - 1]]
      i -= 1
    end
  end
  ops.reverse
end

def lcs_length(a, b)
  lcs_table(a, b)[a.length][b.length]
end

def similarity(a, b)
  total = a.length + b.length
  return 1.0 if total.zero?
  (2.0 * lcs_length(a, b)) / total
end

MARKER = { keep: " ", del: "-", add: "+" }.freeze

def unified_diff(a, b, context)
  ops = edit_script(a, b)

  # Index each op with its line numbers in a and b.
  numbered = []
  ai = 0
  bi = 0
  ops.each do |op, line|
    case op
    when :keep
      ai += 1
      bi += 1
      numbered << [op, line, ai, bi]
    when :del
      ai += 1
      numbered << [op, line, ai, 0]
    when :add
      bi += 1
      numbered << [op, line, 0, bi]
    end
  end

  changed = numbered.each_index.select { |k| numbered[k][0] != :keep }
  return [] if changed.empty?

  # Group changed indices into hunks, merging those within 2*context.
  groups = []
  current = [changed.first]
  changed.drop(1).each do |k|
    if k - current.last <= (2 * context) + 1
      current << k
    else
      groups << current
      current = [k]
    end
  end
  groups << current

  out = []
  groups.each do |group|
    lo = group.first - context
    lo = 0 if lo.negative?
    hi = group.last + context
    hi = numbered.length - 1 if hi > numbered.length - 1
    slice = numbered[lo..hi]

    a_lines = slice.select { |o| o[0] != :add }
    b_lines = slice.select { |o| o[0] != :del }
    a_start = a_lines.empty? ? 0 : a_lines.first[2]
    b_start = b_lines.empty? ? 0 : b_lines.first[3]

    out << format("@@ -%d,%d +%d,%d @@", a_start, a_lines.length, b_start, b_lines.length)
    slice.each { |op, line, _, _| out << "#{MARKER[op]}#{line}" }
  end
  out
end

OLD = <<~'TEXT'.lines.map(&:chomp)
  require "json"

  class Report
    def initialize(rows)
      @rows = rows
    end

    def total
      @rows.sum
    end

    def to_s
      "Report(#{total})"
    end
  end
TEXT

NEW = <<~'TEXT'.lines.map(&:chomp)
  require "json"
  require "set"

  class Report
    def initialize(rows, label)
      @rows = rows
      @label = label
    end

    def total
      @rows.sum
    end

    def mean
      total / @rows.length.to_f
    end

    def to_s
      "Report(#{@label}: #{total})"
    end
  end
TEXT

puts "old: #{OLD.length} lines   new: #{NEW.length} lines"
puts "LCS length #{lcs_length(OLD, NEW)}"
puts format("similarity %.4f", similarity(OLD, NEW))
puts

ops = edit_script(OLD, NEW)
counts = { keep: 0, del: 0, add: 0 }
ops.each { |op, _| counts[op] += 1 }
puts "edit script: #{counts[:keep]} kept, #{counts[:del]} deleted, #{counts[:add]} added"
puts "reconstructs new? #{ops.reject { |op, _| op == :del }.map { |_, l| l } == NEW}"
puts "reconstructs old? #{ops.reject { |op, _| op == :add }.map { |_, l| l } == OLD}"
puts

puts "=== unified diff, 2 lines of context ==="
unified_diff(OLD, NEW, 2).each { |l| puts l }
puts

puts "=== unified diff, 0 lines of context ==="
unified_diff(OLD, NEW, 0).each { |l| puts l }
puts

puts "=== degenerate cases ==="
cases = {
  "identical" => [%w[a b c], %w[a b c]],
  "all added" => [[], %w[x y]],
  "all deleted" => [%w[x y], []],
  "both empty" => [[], []],
  "no overlap" => [%w[a b], %w[c d]],
  "reordered" => [%w[a b c], %w[c b a]]
}
cases.each do |label, (l, r)|
  hunks = unified_diff(l, r, 1)
  puts format("  %-12s lcs=%-2d sim=%.3f hunks=%-2d ops=%d",
              label, lcs_length(l, r), similarity(l, r), hunks.count { |h| h.start_with?("@@") },
              edit_script(l, r).length)
end
puts

puts "=== per-line change map ==="
edit_script(OLD, NEW).each_with_index do |(op, line), idx|
  next if op == :keep
  puts format("  %3d %s %s", idx + 1, MARKER[op], line)
end
