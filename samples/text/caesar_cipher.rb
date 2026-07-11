# frozen_string_literal: true
# Caesar-cipher encode/decode using character ordinals.
# Inference: String#each_char, String#ord / Integer#chr arithmetic with wraparound,
# map over characters, and round-trip reconstruction via join.

def shift_char(ch, by)
  if ch >= "a" && ch <= "z"
    base = "a".ord
    (((ch.ord - base + by) % 26) + base).chr
  elsif ch >= "A" && ch <= "Z"
    base = "A".ord
    (((ch.ord - base + by) % 26) + base).chr
  else
    ch
  end
end

def encode(text, key)
  text.each_char.map { |c| shift_char(c, key) }.join
end

def decode(text, key)
  encode(text, 26 - (key % 26))
end

plain = "Hello, World!"
key = 3
cipher = encode(plain, key)
puts "plain:  #{plain}"
puts "cipher: #{cipher}"
puts "back:   #{decode(cipher, key)}"
puts "roundtrip ok: #{decode(cipher, key) == plain}"

puts "ords: #{"abc".bytes.inspect}"
puts "chrs: #{[104, 105].map(&:chr).join}"

freq = cipher.downcase.chars.select { |c| c >= "a" && c <= "z" }.tally
puts "letter count: #{freq.values.sum}"
p encode("xyz", 3)
p "ROT13".chars.map { |c| c.ord }.sum
