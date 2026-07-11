# frozen_string_literal: true
# Parse Roman numerals to Integer and add them, rendering the sum back.
# Inference: a Hash(String=>Integer) lookup table, each_cons over parsed values to
# handle subtractive pairs, and a greedy fold to re-encode.

VALUES = { "I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000 }.freeze
ENCODE = [
  [1000, "M"], [900, "CM"], [500, "D"], [400, "CD"],
  [100, "C"], [90, "XC"], [50, "L"], [40, "XL"],
  [10, "X"], [9, "IX"], [5, "V"], [4, "IV"], [1, "I"],
].freeze

def to_int(roman)
  nums = roman.chars.map { |c| VALUES[c] }
  total = 0
  nums.each_with_index do |v, i|
    if i + 1 < nums.length && nums[i + 1] > v
      total -= v
    else
      total += v
    end
  end
  total
end

def to_roman(n)
  result = +""
  ENCODE.each do |value, sym|
    while n >= value
      result << sym
      n -= value
    end
  end
  result
end

samples = %w[IV IX XLII MCMXCIV III]
samples.each { |r| puts "#{r} = #{to_int(r)}" }

sum = samples.sum { |r| to_int(r) }
puts "sum: #{sum}"
puts "sum as roman: #{to_roman(sum)}"
puts "roundtrip: #{(1..20).all? { |n| to_int(to_roman(n)) == n }}"
p to_roman(2024)
p to_int("MMXXIV")
