# frozen_string_literal: true
# Integer <-> Roman-numeral conversion driven by lookup tables.
# Inference: a table of [Integer, String] pairs iterated to build a String, and
# a Hash{String=>Integer} folded to parse one back.

TABLE = [
  [1000, "M"], [900, "CM"], [500, "D"], [400, "CD"],
  [100, "C"], [90, "XC"], [50, "L"], [40, "XL"],
  [10, "X"], [9, "IX"], [5, "V"], [4, "IV"], [1, "I"],
]

def to_roman(n)
  out = ""
  TABLE.each do |value, sym|
    while n >= value
      out += sym
      n -= value
    end
  end
  out
end

VALUES = { "I" => 1, "V" => 5, "X" => 10, "L" => 50,
           "C" => 100, "D" => 500, "M" => 1000 }

def from_roman(str)
  total = 0
  prev = 0
  str.reverse.each_char do |ch|
    cur = VALUES[ch]
    total += cur < prev ? -cur : cur
    prev = cur
  end
  total
end

[4, 9, 14, 40, 90, 444, 1994, 2026].each do |n|
  r = to_roman(n)
  puts "#{n} => #{r} => #{from_roman(r)}"
end
