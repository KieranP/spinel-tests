# frozen_string_literal: true
# Degree planner: given a course catalogue with prerequisite sets, work out which
# courses a student can take now, schedule the rest into semesters, and check a
# proposed plan for violations. Set algebra throughout.

require "set"

CATALOGUE = {
  "CS101" => Set.new,
  "CS102" => Set["CS101"],
  "MATH1" => Set.new,
  "MATH2" => Set["MATH1"],
  "CS201" => Set["CS102", "MATH1"],
  "CS210" => Set["CS102"],
  "CS301" => Set["CS201", "MATH2"],
  "CS310" => Set["CS210", "CS201"],
  "CS400" => Set["CS301", "CS310"]
}.freeze

COMPLETED = Set["CS101", "MATH1", "CS102"]

def eligible(catalogue, completed)
  catalogue.each_key.reject { |c| completed.include?(c) }
           .select { |c| catalogue[c].subset?(completed) }
           .sort
end

def semester_plan(catalogue, completed, per_term)
  done = completed.dup
  terms = []
  remaining = Set.new(catalogue.each_key.reject { |c| done.include?(c) })

  until remaining.empty?
    ready = remaining.select { |c| catalogue[c].subset?(done) }.sort
    break if ready.empty?

    taking = ready.take(per_term)
    terms << taking
    taking.each do |c|
      done << c
      remaining.delete(c)
    end
  end

  [terms, remaining]
end

def transitive_prereqs(catalogue, course, seen = Set.new)
  catalogue.fetch(course).each do |direct|
    next if seen.include?(direct)

    seen << direct
    transitive_prereqs(catalogue, direct, seen)
  end
  seen
end

puts "catalogue (#{CATALOGUE.size} courses)"
CATALOGUE.keys.sort.each do |course|
  reqs = CATALOGUE[course].to_a.sort
  puts format("  %-6s <- %s", course, reqs.empty? ? "(none)" : reqs.join(", "))
end
puts

puts "completed: #{COMPLETED.to_a.sort.join(', ')}"
puts "eligible now: #{eligible(CATALOGUE, COMPLETED).join(', ')}"
puts

puts "full prerequisite closure"
CATALOGUE.keys.sort.each do |course|
  closure = transitive_prereqs(CATALOGUE, course).to_a.sort
  puts format("  %-6s depth %d  %s", course, closure.size, closure.empty? ? "-" : closure.join(", "))
end
puts

terms, stuck = semester_plan(CATALOGUE, COMPLETED, 2)
puts "two-courses-per-term plan"
terms.each_with_index do |courses, i|
  puts format("  term %d  %s", i + 1, courses.join(", "))
end
puts "  unreachable: #{stuck.empty? ? 'none' : stuck.to_a.sort.join(', ')}"
puts "  terms to graduate: #{terms.size}"
puts

puts "set relationships"
cs_track = Set["CS101", "CS102", "CS201", "CS301", "CS400"]
math_track = Set["MATH1", "MATH2", "CS201"]
puts "  cs & math   #{(cs_track & math_track).to_a.sort.inspect}"
puts "  cs | math   #{(cs_track | math_track).to_a.sort.size} courses"
puts "  cs - done   #{(cs_track - COMPLETED).to_a.sort.inspect}"
puts "  math ^ cs   #{(math_track ^ cs_track).to_a.sort.inspect}"
puts "  disjoint?   #{cs_track.disjoint?(math_track)}"
puts "  done <= cs  #{COMPLETED.subset?(cs_track)}"
puts

puts "checking a proposed plan"
proposal = [%w[CS201 MATH2], %w[CS301 CS210], %w[CS310 CS400]]
taken = COMPLETED.dup
proposal.each_with_index do |term, i|
  term.sort.each do |course|
    missing = CATALOGUE.fetch(course) - taken
    status = missing.empty? ? "ok" : "MISSING #{missing.to_a.sort.join(', ')}"
    puts format("  term %d  %-6s %s", i + 1, course, status)
  end
  term.each { |c| taken << c }
end
