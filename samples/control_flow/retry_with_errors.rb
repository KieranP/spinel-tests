# frozen_string_literal: true
# Custom exception hierarchy, retry logic, error accumulation.
class AppError < StandardError; end
class Transient < AppError; end
class Fatal < AppError; end

def flaky(n)
  raise Transient, "temporary #{n}" if n < 3
  raise Fatal, "boom" if n == 5
  "ok #{n}"
end

results = []
[1, 3, 5, 4].each do |n|
  attempts = 0
  begin
    attempts += 1
    results << flaky(n + attempts - 1)
  rescue Transient => e
    retry if attempts < 3
    results << "gave up: #{e.message}"
  rescue Fatal => e
    results << "fatal: #{e.message} (#{e.class})"
  end
end

puts results
puts "AppError descendants caught: #{results.count { |r| r.include?("fatal") || r.include?("gave up") }}"
puts "Transient < AppError? #{Transient < AppError}"
puts "Fatal ancestors include StandardError? #{Fatal.ancestors.include?(StandardError)}"
