# frozen_string_literal: true
# Weekly timesheet: clock-in/clock-out pairs are turned into durations, rolled up
# per person and per project, checked against an overtime threshold, and printed
# as a report. All times are fixed epoch offsets so the output is stable.

WEEK_START = Time.at(1_767_225_600).utc # Wed 2026-01-01 00:00:00 UTC

ENTRIES = [
  # [person, project, start offset (minutes from WEEK_START), duration minutes]
  ["ada",    "compiler",  9 * 60,          225],
  ["ada",    "compiler",  13 * 60,         180],
  ["ada",    "docs",      16 * 60 + 15,    105],
  ["ada",    "compiler",  24 * 60 + 9 * 60, 240],
  ["ada",    "review",    24 * 60 + 14 * 60, 90],
  ["grace",  "runtime",   8 * 60 + 30,     270],
  ["grace",  "runtime",   13 * 60 + 30,    240],
  ["grace",  "docs",      24 * 60 + 10 * 60, 150],
  ["grace",  "runtime",   24 * 60 + 13 * 60, 300],
  ["grace",  "review",    48 * 60 + 9 * 60,  60],
  ["linus",  "runtime",   9 * 60 + 45,     195],
  ["linus",  "compiler",  24 * 60 + 8 * 60, 480],
  ["linus",  "compiler",  48 * 60 + 8 * 60, 510]
].freeze

OVERTIME_MINUTES = 8 * 60

Shift = Struct.new(:person, :project, :starts_at, :ends_at) do
  def minutes = ((ends_at - starts_at) / 60).to_i
  def day = ((starts_at - WEEK_START) / 86_400).to_i
  def overlaps?(other) = starts_at < other.ends_at && other.starts_at < ends_at
end

shifts = ENTRIES.map do |person, project, offset, length|
  start = WEEK_START + (offset * 60)
  Shift.new(person, project, start, start + (length * 60))
end

def hhmm(minutes)
  format("%d:%02d", minutes / 60, minutes % 60)
end

def clock(time)
  format("%02d:%02d", time.hour, time.min)
end

DAY_NAMES = %w[Thu Fri Sat Sun Mon Tue Wed].freeze

puts "week beginning #{WEEK_START.strftime('%Y-%m-%d')} (#{shifts.size} shifts)"
puts

puts "shift log"
shifts.sort_by { |s| [s.starts_at, s.person] }.each do |s|
  puts format("  %-3s day%d  %s-%s  %-6s %-9s %5s",
              DAY_NAMES[s.day], s.day, clock(s.starts_at), clock(s.ends_at),
              s.person, s.project, hhmm(s.minutes))
end
puts

puts "per person"
by_person = shifts.group_by(&:person)
by_person.keys.sort.each do |person|
  rows = by_person[person]
  total = rows.sum(&:minutes)
  days = rows.map(&:day).uniq.sort
  longest = rows.max_by(&:minutes)
  puts format("  %-6s %6s over %d day(s)  longest %s on %s (%s)",
              person, hhmm(total), days.size, hhmm(longest.minutes),
              DAY_NAMES[longest.day], longest.project)
end
puts

puts "per project"
by_project = shifts.group_by(&:project)
grand = shifts.sum(&:minutes)
by_project.sort_by { |proj, rows| [-rows.sum(&:minutes), proj] }.each do |proj, rows|
  total = rows.sum(&:minutes)
  share = (total * 1000) / grand
  bar = "#" * (share / 25)
  puts format("  %-9s %6s  %4.1f%%  %-4s %s",
              proj, hhmm(total), share / 10.0, bar,
              rows.map(&:person).uniq.sort.join(","))
end
puts format("  %-9s %6s", "TOTAL", hhmm(grand))
puts

puts "daily totals per person"
header = "  person " + (0..2).map { |d| DAY_NAMES[d].rjust(7) }.join + "    week"
puts header
by_person.keys.sort.each do |person|
  per_day = (0..2).map do |d|
    mins = by_person[person].select { |s| s.day == d }.sum(&:minutes)
    mins.zero? ? "-".rjust(7) : hhmm(mins).rjust(7)
  end
  week = by_person[person].sum(&:minutes)
  puts format("  %-7s%s%8s", person, per_day.join, hhmm(week))
end
puts

puts "overtime (> #{hhmm(OVERTIME_MINUTES)} in a day)"
flagged = by_person.keys.sort.flat_map do |person|
  (0..2).filter_map do |d|
    mins = by_person[person].select { |s| s.day == d }.sum(&:minutes)
    [person, d, mins] if mins > OVERTIME_MINUTES
  end
end
if flagged.empty?
  puts "  none"
else
  flagged.each do |person, d, mins|
    puts format("  %-6s %s  %s (+%s)", person, DAY_NAMES[d], hhmm(mins), hhmm(mins - OVERTIME_MINUTES))
  end
end
puts

puts "overlapping shifts for the same person"
clashes = by_person.flat_map do |person, rows|
  rows.combination(2).select { |a, b| a.overlaps?(b) }.map { |a, b| [person, a, b] }
end
if clashes.empty?
  puts "  none"
else
  clashes.each do |person, a, b|
    puts format("  %-6s %s-%s vs %s-%s", person,
                clock(a.starts_at), clock(a.ends_at), clock(b.starts_at), clock(b.ends_at))
  end
end
