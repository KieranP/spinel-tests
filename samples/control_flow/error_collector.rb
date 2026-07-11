# frozen_string_literal: true
# Run a batch of operations, collecting raised exceptions as values.
# Inference: a rescued exception bound to a variable, its #message and #class read
# and stored in Arrays — an exception-as-value, a known weak surface.

def parse_ratio(text)
  a, b = text.split("/").map(&:to_i)
  raise ArgumentError, "zero denominator" if b == 0
  a / b
end

results = []
errors = []

["10/2", "5/0", "9/3", "8/0", "20/4"].each do |spec|
  begin
    results << parse_ratio(spec)
  rescue ArgumentError => e
    errors << e.message
  end
end

p results
p errors
p errors.length
p errors.first
p errors.map(&:length)
