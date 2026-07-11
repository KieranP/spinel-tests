# frozen_string_literal: true
# Encode and decode a simplified IPv4-style header using pack/unpack and bit
# arithmetic, then verify the checksum and dump the wire bytes.

HEADER_FIELDS = [
  "version", "ihl", "dscp", "ecn", "total_length", "identification",
  "flags", "fragment_offset", "ttl", "protocol", "checksum"
].freeze

PROTOCOLS = { 1 => "ICMP", 6 => "TCP", 17 => "UDP" }.freeze

def encode_header(h)
  b0 = ((h["version"] & 0xF) << 4) | (h["ihl"] & 0xF)
  b1 = ((h["dscp"] & 0x3F) << 2) | (h["ecn"] & 0x3)
  frag = ((h["flags"] & 0x7) << 13) | (h["fragment_offset"] & 0x1FFF)
  [b0, b1, h["total_length"], h["identification"], frag,
   h["ttl"], h["protocol"], h["checksum"]].pack("CCnnnCCn")
end

def decode_header(bytes)
  b0, b1, total, ident, frag, ttl, proto, cksum = bytes.unpack("CCnnnCCn")
  {
    "version" => (b0 >> 4) & 0xF,
    "ihl" => b0 & 0xF,
    "dscp" => (b1 >> 2) & 0x3F,
    "ecn" => b1 & 0x3,
    "total_length" => total,
    "identification" => ident,
    "flags" => (frag >> 13) & 0x7,
    "fragment_offset" => frag & 0x1FFF,
    "ttl" => ttl,
    "protocol" => proto,
    "checksum" => cksum
  }
end

# Internet checksum: one's-complement sum of 16-bit words.
def internet_checksum(bytes)
  words = bytes.unpack("n*")
  sum = words.reduce(0) { |acc, w| acc + w }
  sum = (sum & 0xFFFF) + (sum >> 16) while sum > 0xFFFF
  (~sum) & 0xFFFF
end

def hexdump(bytes)
  bytes.bytes.each_slice(8).map { |row| row.map { |b| format("%02x", b) }.join(" ") }
end

def flag_names(flags)
  names = []
  names << "DF" if (flags & 0x2) != 0
  names << "MF" if (flags & 0x1) != 0
  names.empty? ? "-" : names.join("|")
end

header = {
  "version" => 4,
  "ihl" => 5,
  "dscp" => 0,
  "ecn" => 0,
  "total_length" => 1500,
  "identification" => 0xABCD,
  "flags" => 2,
  "fragment_offset" => 0,
  "ttl" => 64,
  "protocol" => 6,
  "checksum" => 0
}

wire = encode_header(header)
puts "encoded #{wire.bytesize} bytes"
hexdump(wire).each { |row| puts "  #{row}" }
puts

cksum = internet_checksum(wire)
puts format("checksum 0x%04x", cksum)
header["checksum"] = cksum
wire = encode_header(header)
puts "with checksum embedded, verify = #{format('0x%04x', internet_checksum(wire))}"
puts "(zero means valid)"
puts

decoded = decode_header(wire)
puts "decoded fields:"
HEADER_FIELDS.each do |f|
  puts format("  %-16s %d", f, decoded[f])
end
puts

puts "interpretation:"
puts "  IP version   #{decoded["version"]}"
puts "  header bytes #{decoded["ihl"] * 4}"
puts "  payload      #{decoded["total_length"] - decoded["ihl"] * 4}"
puts "  protocol     #{PROTOCOLS[decoded["protocol"]] || "unknown"}"
puts "  ttl          #{decoded["ttl"]}"
puts "  flags        #{flag_names(decoded["flags"])}"
puts

puts "round-trip identical? #{decoded.reject { |k, _| false }.all? { |k, v| header[k] == v }}"
puts

puts "flag decoding table:"
(0..3).each do |f|
  puts format("  %d (%03b)  %s", f, f, flag_names(f))
end
puts

puts "fragment offsets pack into 13 bits:"
[0, 1, 185, 8191].each do |off|
  h2 = header.dup
  h2["fragment_offset"] = off
  h2["flags"] = 1
  w2 = encode_header(h2)
  d2 = decode_header(w2)
  ok = d2["fragment_offset"] == off && d2["flags"] == 1
  puts format("  offset %-6d -> %-6d flags=%s %s", off, d2["fragment_offset"], d2["flags"], ok ? "ok" : "MISMATCH")
end
puts

puts "ttl decrement walk:"
ttl = decoded["ttl"]
hops = []
while ttl > 60
  hops << ttl
  ttl -= 1
end
puts "  #{hops.join(" -> ")} -> #{ttl}"
puts

puts "checksum sensitivity (flip one byte):"
mutated = wire.dup
orig = mutated.getbyte(9)
mutated.setbyte(9, (orig ^ 0xFF))
puts format("  original byte 9 = 0x%02x, flipped = 0x%02x", orig, orig ^ 0xFF)
puts format("  checksum now 0x%04x (non-zero = corrupt)", internet_checksum(mutated))
