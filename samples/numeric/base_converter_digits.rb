# frozen_string_literal: true
# Base converter using Integer#to_s and #digits
numbers = [255, 4096, 100, 1_000_000, 42]

numbers.each do |n|
  bin = n.to_s(2)
  oct = n.to_s(8)
  hex = n.to_s(16)
  puts "#{n}: bin=#{bin} oct=#{oct} hex=#{hex}"
  puts "  parse back: #{bin.to_i(2)} #{oct.to_i(8)} #{hex.to_i(16)}"
end

# digits in various bases
p 255.digits
p 255.digits(16)
p 1234.digits(10)
p 4096.digits(2).length

# roundtrip via digits
def from_digits(ds, base)
  ds.each_with_index.inject(0) { |acc, (d, i)| acc + d * base**i }
end

p from_digits(255.digits(16), 16)
p from_digits(1234.digits(7), 7)
puts 0.to_s(2)
puts 0.digits.inspect
