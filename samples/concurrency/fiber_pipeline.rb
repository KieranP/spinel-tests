# frozen_string_literal: true
# A pull-based processing pipeline built from Fibers: each stage is a coroutine
# that pulls from the stage below it and yields transformed values upward. Used
# here to tokenise, filter and batch a stream of readings without ever
# materialising the whole sequence.

READINGS = [
  "t=12.5", "t=13.0", "bad", "t=11.2", "t=-4.0", "t=19.9", "noise",
  "t=21.4", "t=7.7", "t=30.1", "t=-12.5", "t=25.0", "t=18.6", "junk", "t=9.9"
].freeze

def source(items)
  Fiber.new do
    items.each { |item| Fiber.yield(item) }
    nil
  end
end

def parse(upstream)
  Fiber.new do
    while (raw = upstream.resume)
      next unless raw.start_with?("t=")

      Fiber.yield(raw.delete_prefix("t=").to_f)
    end
    nil
  end
end

def clamp_stage(upstream, low, high)
  Fiber.new do
    while (value = upstream.resume)
      Fiber.yield(value.clamp(low, high))
    end
    nil
  end
end

def batch(upstream, size)
  Fiber.new do
    buffer = []
    while (value = upstream.resume)
      buffer << value
      if buffer.size == size
        Fiber.yield(buffer)
        buffer = []
      end
    end
    Fiber.yield(buffer) unless buffer.empty?
    nil
  end
end

def drain(fiber)
  out = []
  while (value = fiber.resume)
    out << value
  end
  out
end

puts "#{READINGS.size} raw readings, #{READINGS.count { |r| r.start_with?('t=') }} well-formed"
puts

parsed = drain(parse(source(READINGS)))
puts "parsed"
puts "  #{parsed.inspect}"
puts

clamped = drain(clamp_stage(parse(source(READINGS)), -5.0, 25.0))
puts "clamped to -5.0..25.0"
puts "  #{clamped.inspect}"
puts "  #{parsed.zip(clamped).count { |a, b| a != b }} value(s) were clipped"
puts

batches = drain(batch(clamp_stage(parse(source(READINGS)), -5.0, 25.0), 4))
puts "batched by 4"
batches.each_with_index do |group, i|
  mean = group.sum / group.size
  puts format("  batch %d  %-32s mean %6.2f", i + 1, group.inspect, mean)
end
puts

puts "fiber lifecycle"
f = source([1, 2])
puts "  alive before first resume: #{f.alive?}"
puts "  first  resume -> #{f.resume.inspect}"
puts "  second resume -> #{f.resume.inspect}"
puts "  third  resume -> #{f.resume.inspect}"
puts "  alive after exhaustion:    #{f.alive?}"
begin
  f.resume
  puts "  resuming a dead fiber succeeded (unexpected)"
rescue FiberError => e
  puts "  resuming a dead fiber raises #{e.class}"
end
puts

puts "a fiber that takes values back"
adder = Fiber.new do |first|
  total = first
  loop do
    increment = Fiber.yield(total)
    break total if increment.nil?

    total += increment
  end
end
running = [adder.resume(10)]
[5, 7, 3].each { |n| running << adder.resume(n) }
puts "  running totals: #{running.inspect}"
puts

puts "interleaving two independent fibers"
left = source(%w[a b c d])
right = source([1, 2, 3])
woven = []
loop do
  l = left.alive? ? left.resume : nil
  r = right.alive? ? right.resume : nil
  break if l.nil? && r.nil?

  woven << l unless l.nil?
  woven << r unless r.nil?
end
puts "  #{woven.inspect}"
puts

puts "summary"
puts format("  readings kept      %d", parsed.size)
puts format("  min / max parsed   %.1f / %.1f", parsed.min, parsed.max)
puts format("  min / max clamped  %.1f / %.1f", clamped.min, clamped.max)
puts format("  batches produced   %d (last holds %d)", batches.size, batches.last.size)
