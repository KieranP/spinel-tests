# frozen_string_literal: true
# A Roman numeral value class implementing Comparable.
class Roman
  include Comparable
  VALUES = { "I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100 }

  attr_reader :value
  def initialize(str)
    @str = str
    @value = parse(str)
  end

  def parse(s)
    total = 0
    prev = 0
    s.reverse.each_char do |ch|
      v = VALUES[ch]
      total += (v < prev ? -v : v)
      prev = v
    end
    total
  end

  def <=>(other)
    value <=> other.value
  end

  def to_s
    "#{@str}(#{value})"
  end
end

list = %w[XIV IX XL III].map { |s| Roman.new(s) }
sorted = list.sort
puts "sorted: #{sorted.map(&:to_s).join(", ")}"
puts "max: #{list.max}"
puts "min: #{list.min}"
puts "XIV > IX? #{Roman.new("XIV") > Roman.new("IX")}"
puts "clamp XL into III..IX: #{Roman.new("XL").clamp(Roman.new("III"), Roman.new("IX"))}"
puts "between: #{list.select { |r| r.between?(Roman.new("V"), Roman.new("XX")) }.map(&:to_s).inspect}"
