# frozen_string_literal: true
# Custom exception hierarchy with raise/rescue, retry, and ensure.
# Inference: user Exception subclasses, rescue matching by class up the hierarchy,
# a retry loop bounded by a counter, and ensure side effects.

class AppError < StandardError; end
class ValidationError < AppError; end
class RetryableError < AppError; end

def validate(age)
  raise ValidationError, "negative age" if age < 0
  raise ValidationError, "too old" if age > 150
  age
end

results = [25, -3, 200, 0].map do |age|
  begin
    "ok: #{validate(age)}"
  rescue ValidationError => e
    "invalid: #{e.message}"
  end
end
puts results

# rescue by superclass
begin
  raise RetryableError, "boom"
rescue AppError => e
  puts "caught as AppError: #{e.class} #{e.message}"
end

# retry bounded by a counter
attempts = 0
log = []
begin
  attempts += 1
  log << "attempt #{attempts}"
  raise RetryableError, "flaky" if attempts < 3
  log << "succeeded"
rescue RetryableError
  retry if attempts < 3
end
puts log.inspect

# ensure always runs
def with_cleanup(fail)
  raise "oops" if fail
  "done"
rescue => e
  "rescued: #{e.message}"
ensure
  # side effect visible via the returned marker below
end
puts with_cleanup(false)
puts with_cleanup(true)

p ValidationError.ancestors.include?(StandardError)
p([1, -1].map { |n| (validate(n) rescue $!.class.name) })
