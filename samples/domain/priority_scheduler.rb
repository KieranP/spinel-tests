# frozen_string_literal: true
# Priority scheduler: Comparable task objects sorted, partitioned, minmax_by.
# Inference: user Comparable type through sort/min/max/partition/minmax_by and a
# reduce that accumulates into an Integer from object fields.

class Task
  include Comparable
  attr_reader :name, :priority, :cost
  def initialize(name, priority, cost)
    @name = name
    @priority = priority
    @cost = cost
  end
  def <=>(other) = priority <=> other.priority
  def to_s = "#{name}(#{priority})"
end

tasks = [
  Task.new("build", 3, 40),
  Task.new("test", 5, 25),
  Task.new("deploy", 1, 10),
  Task.new("lint", 5, 5),
  Task.new("docs", 2, 15),
]

puts tasks.sort.map(&:to_s).join(", ")
puts tasks.max.to_s
puts tasks.min.to_s

urgent, rest = tasks.partition { |t| t.priority >= 3 }
puts "urgent: #{urgent.map(&:name).sort.join(",")}"
puts "rest: #{rest.map(&:name).sort.join(",")}"

lo, hi = tasks.minmax_by(&:cost)
puts "cheapest=#{lo.name} dearest=#{hi.name}"

total = tasks.reduce(0) { |acc, t| acc + t.cost }
puts "total_cost=#{total}"

by_pri = tasks.group_by(&:priority).transform_values { |ts| ts.map(&:name).sort }
by_pri.keys.sort.each { |k| puts "p#{k}: #{by_pri[k].join(",")}" }

p tasks.sort.map(&:priority)
clamped = tasks.first.clamp(Task.new("lo", 2, 0), Task.new("hi", 4, 0))
p clamped.priority
