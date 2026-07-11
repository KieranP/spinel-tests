# frozen_string_literal: true
# Retry-with-attempt-count using retry/rescue/ensure
class TransientError < StandardError; end

def flaky_call(fail_times)
  @calls ||= 0
  @calls += 1
  raise TransientError, "attempt #{@calls} failed" if @calls <= fail_times
  "success on attempt #{@calls}"
end

def with_retries(max, fail_times)
  attempts = 0
  begin
    flaky_call(fail_times)
  rescue TransientError => e
    attempts += 1
    puts "retry: #{e.message}"
    retry if attempts < max
    "gave up after #{attempts} retries"
  ensure
    puts "cleanup after attempt block"
  end
end

@calls = 0
puts with_retries(5, 2)
@calls = 0
puts with_retries(2, 5)
