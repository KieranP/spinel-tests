# frozen_string_literal: true
# Bitwise operations: permission flags and bit slicing
READ = 1 << 2
WRITE = 1 << 1
EXEC = 1 << 0

perms = READ | WRITE
puts "perms=#{perms} bin=#{perms.to_s(2).rjust(3, '0')}"
puts "can read? #{(perms & READ) != 0}"
puts "can exec? #{(perms & EXEC) != 0}"

perms |= EXEC
puts "after +exec: #{perms.to_s(2)}"
perms &= ~WRITE
puts "after -write: #{perms.to_s(2)}"
puts "toggle read: #{(perms ^ READ).to_s(2)}"

# bit slicing with []
n = 0b10110101
puts "n=#{n}"
(0..7).each { |i| print n[i] }
puts
puts "bit_length=#{n.bit_length}"

# extract byte ranges via shifts and masks
value = 0xDEADBEEF
bytes = (0..3).map { |i| (value >> (i * 8)) & 0xFF }
p bytes
p bytes.map { |b| b.to_s(16) }

# population count via digits
popcount = value.to_s(2).count("1")
puts "popcount=#{popcount}"
p 255[0]
p 256.bit_length
p (-1) & 0xFF
