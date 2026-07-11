# frozen_string_literal: true
# Build a canonical 44-byte RIFF/WAVE header from a description of the audio
# stream, then parse the bytes back and report the decoded fields — a round-trip
# through Array#pack / String#unpack with the derived fields recomputed.

FMT_PCM = 1

class WaveHeader
  attr_reader :channels, :sample_rate, :bits, :frames

  def initialize(channels:, sample_rate:, bits:, frames:)
    @channels = channels
    @sample_rate = sample_rate
    @bits = bits
    @frames = frames
  end

  def block_align = @channels * (@bits / 8)
  def byte_rate = @sample_rate * block_align
  def data_size = @frames * block_align
  def duration_ms = (@frames * 1000) / @sample_rate

  def to_bytes
    [
      "RIFF", 36 + data_size, "WAVE",
      "fmt ", 16, FMT_PCM, @channels, @sample_rate, byte_rate, block_align, @bits,
      "data", data_size
    ].pack("a4Va4a4VvvVVvva4V")
  end

  def self.parse(bytes)
    riff, riff_size, wave,
      fmt_id, fmt_size, audio_fmt, channels, rate, byte_rate, align, bits,
      data_id, data_size = bytes.unpack("a4Va4a4VvvVVvva4V")

    raise ArgumentError, "not a RIFF container" unless riff == "RIFF"
    raise ArgumentError, "not WAVE data" unless wave == "WAVE"
    raise ArgumentError, "unexpected chunk #{fmt_id.inspect}" unless fmt_id == "fmt "
    raise ArgumentError, "unexpected chunk #{data_id.inspect}" unless data_id == "data"

    {
      riff_size: riff_size, fmt_size: fmt_size, audio_fmt: audio_fmt,
      channels: channels, sample_rate: rate, byte_rate: byte_rate,
      block_align: align, bits: bits, data_size: data_size
    }
  end
end

streams = [
  WaveHeader.new(channels: 1, sample_rate: 8_000, bits: 8, frames: 8_000),
  WaveHeader.new(channels: 2, sample_rate: 44_100, bits: 16, frames: 44_100),
  WaveHeader.new(channels: 2, sample_rate: 48_000, bits: 24, frames: 24_000)
]

puts "encoded headers"
streams.each do |s|
  bytes = s.to_bytes
  puts format("  %dch %6dHz %2dbit  %d bytes  %s",
              s.channels, s.sample_rate, s.bits, bytes.bytesize,
              bytes.byteslice(0, 4))
end
puts

puts "decoded fields"
streams.each do |s|
  f = WaveHeader.parse(s.to_bytes)
  puts format("  rate=%-6d ch=%d bits=%2d align=%-2d byte_rate=%-7d data=%-8d riff=%d",
              f[:sample_rate], f[:channels], f[:bits], f[:block_align],
              f[:byte_rate], f[:data_size], f[:riff_size])
end
puts

puts "round-trip agreement"
streams.each do |s|
  f = WaveHeader.parse(s.to_bytes)
  ok = f[:channels] == s.channels && f[:sample_rate] == s.sample_rate &&
       f[:bits] == s.bits && f[:data_size] == s.data_size &&
       f[:byte_rate] == s.byte_rate && f[:audio_fmt] == FMT_PCM
  puts format("  %2dch/%2dbit  %s  %d ms", s.channels, s.bits, ok ? "ok" : "MISMATCH", s.duration_ms)
end
puts

# the first sixteen header bytes, as hex and as printable ASCII
head = streams[1].to_bytes.byteslice(0, 16)
puts "first 16 bytes of the 44100Hz stereo header"
puts "  hex   #{head.bytes.map { |b| format('%02x', b) }.join(' ')}"
puts "  ascii #{head.bytes.map { |b| b.between?(32, 126) ? b.chr : '.' }.join}"
puts

puts "rejections"
[
  ["MP3 " + streams[0].to_bytes.byteslice(4..-1), "bad magic"],
  [streams[0].to_bytes.byteslice(0, 8) + "WAVX" + streams[0].to_bytes.byteslice(12..-1), "bad form"]
].each do |bad, label|
  begin
    WaveHeader.parse(bad)
    puts "  #{label}: accepted (unexpected)"
  rescue ArgumentError => e
    puts "  #{label}: #{e.message}"
  end
end
