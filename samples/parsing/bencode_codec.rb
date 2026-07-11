# frozen_string_literal: true
# Bencode encoder/decoder (the BitTorrent metainfo format).
#
# Grammar:
#   i<int>e            integer
#   <len>:<bytes>      byte string
#   l<items>e          list
#   d<key><val>...e    dictionary, keys are strings in sorted order
#
# Round-trips a torrent-like structure and reports where re-encoding is stable.

def bencode(obj)
  case obj
  when Integer
    "i#{obj}e"
  when String
    "#{obj.bytesize}:#{obj}"
  when Array
    parts = obj.map { |el| bencode(el) }
    "l#{parts.join}e"
  when Hash
    pairs = obj.keys.sort.map { |k| bencode(k) + bencode(obj[k]) }
    "d#{pairs.join}e"
  else
    raise ArgumentError, "cannot bencode #{obj.class}"
  end
end

class Bdecoder
  def initialize(src)
    @src = src
    @pos = 0
  end

  def decode
    v = parse_value
    raise ArgumentError, "trailing data at #{@pos}" if @pos != @src.length
    v
  end

  private

  def peek
    raise ArgumentError, "unexpected end of input" if @pos >= @src.length
    @src[@pos]
  end

  def parse_value
    c = peek
    case c
    when "i" then parse_integer
    when "l" then parse_list
    when "d" then parse_dict
    else
      if c >= "0" && c <= "9"
        parse_string
      else
        raise ArgumentError, "unexpected #{c.inspect} at #{@pos}"
      end
    end
  end

  def parse_integer
    @pos += 1
    stop = @src.index("e", @pos)
    raise ArgumentError, "unterminated integer" if stop.nil?
    digits = @src[@pos...stop]
    raise ArgumentError, "bad integer #{digits.inspect}" unless digits =~ /\A-?\d+\z/
    @pos = stop + 1
    digits.to_i
  end

  def parse_string
    colon = @src.index(":", @pos)
    raise ArgumentError, "unterminated string length" if colon.nil?
    len = @src[@pos...colon].to_i
    start = colon + 1
    raise ArgumentError, "string runs past end" if start + len > @src.length
    @pos = start + len
    @src[start, len]
  end

  def parse_list
    @pos += 1
    out = []
    until peek == "e"
      out << parse_value
    end
    @pos += 1
    out
  end

  def parse_dict
    @pos += 1
    out = {}
    until peek == "e"
      key = parse_string
      out[key] = parse_value
    end
    @pos += 1
    out
  end
end

def bdecode(str)
  Bdecoder.new(str).decode
end

torrent = {
  "announce" => "udp://tracker.example.org:6969",
  "comment" => "sample metainfo",
  "creation date" => 1_600_000_000,
  "info" => {
    "length" => 1_048_576,
    "name" => "release.iso",
    "piece length" => 262_144,
    "pieces" => "abcdefghij",
    "files" => [
      { "length" => 512, "path" => ["docs", "README"] },
      { "length" => 2048, "path" => ["docs", "CHANGELOG"] }
    ]
  }
}

encoded = bencode(torrent)
puts "encoded #{encoded.bytesize} bytes"
puts encoded[0, 72]
puts

decoded = bdecode(encoded)
puts "announce      #{decoded["announce"]}"
puts "creation date #{decoded["creation date"]}"
info = decoded["info"]
puts "name          #{info["name"]}"
puts "length        #{info["length"]}"
puts "piece length  #{info["piece length"]}"
puts "pieces        #{info["pieces"].inspect}"
puts

puts "files:"
info["files"].each do |entry|
  puts format("  %-22s %6d bytes", entry["path"].join("/"), entry["length"])
end
puts

total = info["files"].reduce(0) { |sum, e| sum + e["length"] }
puts "file bytes    #{total}"
puts "piece count   #{(info["length"] + info["piece length"] - 1) / info["piece length"]}"
puts

reencoded = bencode(decoded)
puts "re-encode stable? #{reencoded == encoded}"
puts "byte sizes equal? #{reencoded.bytesize == encoded.bytesize}"
puts

puts "scalar round-trips:"
[0, 42, -17, 1_000_000].each do |n|
  wire = bencode(n)
  puts format("  %-12s -> %-12s -> %d", n, wire, bdecode(wire))
end
["", "a", "hello world"].each do |s|
  wire = bencode(s)
  puts format("  %-12s -> %-14s -> %s", s.inspect, wire, bdecode(wire).inspect)
end
puts

nested = ["a", ["b", ["c", []]], 3]
nested_wire = bencode(nested)
puts "nested  #{nested_wire}"
puts "back    #{bdecode(nested_wire).inspect}"
puts

puts "malformed input:"
["i12", "3:ab", "x", "i1ex", "d1:ae"].each do |bad|
  begin
    bdecode(bad)
    puts format("  %-8s accepted", bad.inspect)
  rescue ArgumentError => e
    puts format("  %-8s %s", bad.inspect, e.message)
  end
end
