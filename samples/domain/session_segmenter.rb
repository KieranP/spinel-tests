# frozen_string_literal: true
# Segment a stream of page-view events into user sessions: consecutive events by
# the same visitor separated by less than the idle timeout belong to one session.
# Reports session lengths, entry/exit pages, bounce rate and funnel progress.

IDLE_TIMEOUT = 1_800 # seconds

RAW = <<~LOG
  1000 alice /home
  1042 alice /pricing
  1090 alice /signup
  4200 alice /home
  4260 alice /docs
  1010 bob   /home
  8000 bob   /home
  8100 bob   /pricing
  8150 bob   /pricing
  8300 bob   /checkout
  8400 bob   /done
  1500 carol /docs
  1560 carol /docs
  1600 carol /docs
  9000 dave  /home
LOG

Event = Struct.new(:at, :visitor, :path)

events = RAW.lines.map do |line|
  at, visitor, path = line.split
  Event.new(at.to_i, visitor, path)
end

FUNNEL = ["/home", "/pricing", "/checkout", "/done"].freeze

def sessionise(events, timeout)
  events.group_by(&:visitor).flat_map do |visitor, own|
    ordered = own.sort_by(&:at)
    ordered.slice_when { |a, b| b.at - a.at > timeout }
           .map { |group| { visitor: visitor, events: group } }
  end.sort_by { |s| [s[:events].first.at, s[:visitor]] }
end

sessions = sessionise(events, IDLE_TIMEOUT)

def duration(session) = session[:events].last.at - session[:events].first.at
def bounce?(session) = session[:events].map(&:path).uniq.size == 1

puts "#{events.size} events from #{events.map(&:visitor).uniq.size} visitors"
puts "idle timeout #{IDLE_TIMEOUT}s -> #{sessions.size} sessions"
puts

puts "sessions"
sessions.each_with_index do |s, i|
  paths = s[:events].map(&:path)
  puts format("  %2d  %-6s %4ds  %d view(s)  %-8s -> %-9s %s",
              i + 1, s[:visitor], duration(s), paths.size,
              paths.first, paths.last, bounce?(s) ? "(bounce)" : "")
end
puts

puts "per visitor"
sessions.group_by { |s| s[:visitor] }.sort.each do |visitor, own|
  total = own.sum { |s| duration(s) }
  views = own.sum { |s| s[:events].size }
  puts format("  %-6s %d session(s)  %d view(s)  %4ds total  %4ds mean",
              visitor, own.size, views, total, total / own.size)
end
puts

puts "page popularity"
tally = events.map(&:path).tally
tally.sort_by { |path, n| [-n, path] }.each do |path, n|
  puts format("  %-10s %2d  %s", path, n, "*" * n)
end
puts

puts "repeat views within a session (consecutive duplicates collapsed)"
sessions.each_with_index do |s, i|
  collapsed = s[:events].map(&:path).chunk_while { |a, b| a == b }.map do |run|
    run.size > 1 ? "#{run.first} x#{run.size}" : run.first
  end
  puts format("  %2d  %s", i + 1, collapsed.join(" > "))
end
puts

puts "funnel"
reached = FUNNEL.map do |step|
  count = sessions.count { |s| s[:events].any? { |e| e.path == step } }
  [step, count]
end
first_count = reached.first.last
reached.each_cons(2) do |(step_a, n_a), (step_b, n_b)|
  drop = n_a.zero? ? 0 : ((n_a - n_b) * 100) / n_a
  puts format("  %-9s %2d -> %-9s %2d   %d%% drop-off", step_a, n_a, step_b, n_b, drop)
end
puts format("  overall conversion %d/%d", reached.last.last, first_count)
puts

puts "gaps between a visitor's sessions"
sessions.group_by { |s| s[:visitor] }.sort.each do |visitor, own|
  next if own.size < 2

  gaps = own.each_cons(2).map { |a, b| b[:events].first.at - a[:events].last.at }
  puts format("  %-6s %s", visitor, gaps.map { |g| "#{g}s" }.join(", "))
end
puts

bounces = sessions.count { |s| bounce?(s) }
puts format("bounce rate %d/%d (%d%%)", bounces, sessions.size, (bounces * 100) / sessions.size)
puts format("longest session %ds", sessions.map { |s| duration(s) }.max)
puts format("busiest visitor %s", sessions.group_by { |s| s[:visitor] }.max_by { |_v, o| o.sum { |s| s[:events].size } }.first)
