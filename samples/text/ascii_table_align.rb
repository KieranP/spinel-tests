# frozen_string_literal: true
# ASCII table formatting with column alignment
rows = [
  ["Name", "Age", "City"],
  ["Alice", "30", "New York"],
  ["Bob", "5", "LA"],
  ["Charlie", "127", "San Francisco"],
]

widths = Array.new(rows[0].length, 0)
rows.each do |row|
  row.each_with_index do |cell, i|
    widths[i] = cell.length if cell.length > widths[i]
  end
end

sep = "+" + widths.map { |w| "-" * (w + 2) }.join("+") + "+"

puts sep
rows.each_with_index do |row, ri|
  line = "|" + row.each_with_index.map { |cell, i|
    " " + cell.ljust(widths[i]) + " "
  }.join("|") + "|"
  puts line
  puts sep if ri == 0
end
puts sep
