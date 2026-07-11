# frozen_string_literal: true
# Custom exception hierarchy + raise/rescue/retry/ensure/$!/re-raise/multiple rescue clauses.
# Stresses: user Exception subclasses, message/class capture, retry counter, ensure ordering.

class AppError < StandardError; end
class TransientError < AppError; end
class FatalError < AppError
  def initialize(msg = "fatal boom")
    super
  end
end

attempts001 = 0
result001 =
  begin
    attempts001 += 1
    raise TransientError, "flaky ##{attempts001}" if attempts001 < 3
    "ok after #{attempts001}"
  rescue TransientError => e001
    retry if attempts001 < 3
    "gave up: #{e001.message}"
  ensure
    puts "ensure ran"
  end
puts result001

def classify(x)
  raise FatalError if x.negative?
  raise TransientError, "small" if x < 10
  x
rescue FatalError => e002
  "fatal:#{e002.message}"
rescue AppError => e003
  "app:#{e003.message}:#{e003.class}"
end

puts classify(-1)
puts classify(5)
puts classify(42)

begin
  begin
    raise ArgumentError, "inner"
  rescue => e004
    puts "caught #{e004.class}: #{e004.message}"
    puts "dollarbang #{$!.message}"
    raise
  end
rescue ArgumentError => e005
  puts "reraised #{e005.message}"
end

probe001 = (raise(RuntimeError, "probe") rescue $!.class)
p probe001
probe002 = (Integer("nope") rescue $!.class)
p probe002
