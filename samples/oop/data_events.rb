# frozen_string_literal: true
# Calendar events as immutable Data objects, sorted and grouped.
# Inference: Data.define instances flow through sort_by / group_by / min_by and
# back out; Data value objects in containers are a known weak surface.

Event = Data.define(:name, :day, :hour) do
  def slot = "#{day} #{hour}:00"
end

events = [
  Event.new("standup", "Mon", 9),
  Event.new("review", "Wed", 14),
  Event.new("standup", "Tue", 9),
  Event.new("lunch", "Mon", 12),
  Event.new("review", "Fri", 16),
]

sorted = events.sort_by { |e| [e.day, e.hour] }
sorted.each { |e| puts "#{e.name}: #{e.slot}" }

by_name = events.group_by(&:name)
by_name.keys.sort.each { |name| puts "#{name}: #{by_name[name].length}" }

p events.min_by(&:hour).name
p events.max_by(&:hour).name
p events.count { |e| e.hour < 12 }
