# frozen_string_literal: true
# Render month calendars the way cal(1) does, and answer a few date questions,
# using Time arithmetic only (no Date library).

DAY_NAMES = %w[Su Mo Tu We Th Fr Sa].freeze
MONTH_NAMES = %w[January February March April May June July
                 August September October November December].freeze

def leap?(year)
  return false unless (year % 4).zero?
  return true unless (year % 100).zero?
  (year % 400).zero?
end

def days_in_month(year, month)
  case month
  when 1, 3, 5, 7, 8, 10, 12 then 31
  when 4, 6, 9, 11 then 30
  when 2 then leap?(year) ? 29 : 28
  else 0
  end
end

# 0 = Sunday
def weekday_of(year, month, day)
  Time.utc(year, month, day).wday
end

def render_month(year, month)
  first = weekday_of(year, month, 1)
  count = days_in_month(year, month)

  title = "#{MONTH_NAMES[month - 1]} #{year}"
  pad = (20 - title.length) / 2
  lines = []
  lines << (" " * pad) + title
  lines << DAY_NAMES.join(" ")

  cells = ([nil] * first) + (1..count).to_a
  cells.each_slice(7) do |week|
    row = week.map { |d| d.nil? ? "  " : d.to_s.rjust(2) }
    lines << row.join(" ").rstrip
  end
  lines
end

def print_month(year, month)
  render_month(year, month).each { |l| puts l }
end

puts "=== single month ==="
print_month(2026, 7)
puts

puts "=== a leap February vs a common one ==="
print_month(2024, 2)
puts
print_month(2025, 2)
puts

puts "=== quarter, three across ==="
blocks = [1, 2, 3].map { |m| render_month(2026, m) }
height = blocks.map(&:size).max
blocks.each { |b| b << "" while b.size < height }
height.times do |row|
  puts blocks.map { |b| b[row].ljust(20) }.join("  ").rstrip
end
puts

puts "=== leap years 1896..2024 (every 8th shown) ==="
leaps = (1896..2024).select { |y| leap?(y) }
puts "count #{leaps.size}"
puts leaps.each_slice(8).map(&:first).join(" ")
puts "1900 leap? #{leap?(1900)}   2000 leap? #{leap?(2000)}"
puts

puts "=== days per month, 2026 ==="
(1..12).each do |m|
  bar = "#" * days_in_month(2026, m)
  puts format("%-10s %2d %s", MONTH_NAMES[m - 1], days_in_month(2026, m), bar)
end
puts

puts "=== which weekday does each 1st fall on, 2026 ==="
(1..12).each do |m|
  w = weekday_of(2026, m, 1)
  puts format("  %-10s %s", MONTH_NAMES[m - 1], DAY_NAMES[w])
end
puts

puts "=== Friday the 13ths in 2026 ==="
unlucky = (1..12).select { |m| weekday_of(2026, m, 13) == 5 }
puts unlucky.map { |m| MONTH_NAMES[m - 1] }.join(", ")
puts

puts "=== day-of-year and week-of-year ==="
[[2026, 1, 1], [2026, 7, 25], [2026, 12, 31], [2024, 2, 29]].each do |(y, m, d)|
  doy = (1...m).reduce(0) { |sum, mm| sum + days_in_month(y, mm) } + d
  jan1 = weekday_of(y, 1, 1)
  week = ((doy + jan1 - 1) / 7) + 1
  puts format("  %04d-%02d-%02d  doy=%3d  week=%2d  %s", y, m, d, doy, week, DAY_NAMES[weekday_of(y, m, d)])
end
puts

puts "=== span between two dates ==="
a = Time.utc(2026, 1, 1)
b = Time.utc(2026, 7, 25)
secs = b.to_i - a.to_i
puts "seconds #{secs}"
puts "days    #{secs / 86_400}"
puts "weeks   #{secs / (86_400 * 7)}"
puts "hours   #{secs / 3600}"
