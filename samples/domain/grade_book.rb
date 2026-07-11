# frozen_string_literal: true
# Grade book: filter_map, partition, group_by, minmax_by, sum, sort_by chains
# over Struct records. Inference: Struct field access flowing through Enumerable.

Student = Struct.new(:name, :score) do
  def grade
    case score
    when 90.. then "A"
    when 80...90 then "B"
    when 70...80 then "C"
    else "F"
    end
  end
end

students = [
  Student.new("Ann", 92),
  Student.new("Bob", 78),
  Student.new("Cy", 85),
  Student.new("Dee", 64),
  Student.new("Ed", 88),
  Student.new("Fay", 91),
]

passing = students.filter_map { |s| s.name if s.score >= 70 }
p passing.sort

pass, fail_ = students.partition { |s| s.score >= 70 }
p [pass.length, fail_.length]

by_grade = students.group_by(&:grade).transform_values { |g| g.map(&:name).sort }
by_grade.keys.sort.each { |g| puts "#{g}: #{by_grade[g].join(",")}" }

lo, hi = students.minmax_by(&:score)
puts "lowest=#{lo.name} highest=#{hi.name}"

avg = students.sum(&:score).to_f / students.length
puts format("avg=%.2f", avg)

ranked = students.sort_by { |s| -s.score }.map.with_index(1) { |s, i| "#{i}.#{s.name}" }
p ranked

p students.group_by(&:grade).transform_values(&:size).sort.to_h
p students.max_by(&:score).name
p students.count { |s| s.grade == "A" }
