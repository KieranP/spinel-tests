# frozen_string_literal: true
# Parse a Markdown pipe-table into rows, infer each column's type and alignment,
# sort by a chosen column, compute a totals row, and re-render the table with
# columns padded to fit. Heavy on String formatting and Comparable.

SOURCE = <<~MD
  | Region    | Units | Revenue  | Margin | Launched   |
  |:----------|------:|---------:|-------:|:-----------|
  | North     |   120 |  4800.50 |  0.185 | 2024-03-01 |
  | South     |    95 |  3610.00 |  0.220 | 2023-11-15 |
  | East      |   210 |  9450.75 |  0.140 | 2025-01-20 |
  | West      |    64 |  2048.25 |  0.310 | 2022-07-04 |
  | Central   |   157 |  6123.40 |  0.205 | 2024-09-30 |
MD

def split_row(line)
  line.strip.delete_prefix("|").delete_suffix("|").split("|").map(&:strip)
end

def alignment(spec)
  left = spec.start_with?(":")
  right = spec.end_with?(":")
  if left && right then :center
  elsif right then :right
  else :left
  end
end

def detect_type(values)
  return :integer if values.all? { |v| v.match?(/\A-?\d+\z/) }
  return :float if values.all? { |v| v.match?(/\A-?\d+\.\d+\z/) }
  return :date if values.all? { |v| v.match?(/\A\d{4}-\d{2}-\d{2}\z/) }

  :string
end

def coerce(value, type)
  case type
  when :integer then value.to_i
  when :float then value.to_f
  else value
  end
end

def pad(text, width, align)
  case align
  when :right then text.rjust(width)
  when :center then text.center(width)
  else text.ljust(width)
  end
end

lines = SOURCE.lines.map(&:chomp).reject(&:empty?)
headers = split_row(lines[0])
aligns = split_row(lines[1]).map { |spec| alignment(spec) }
raw_rows = lines[2..].map { |l| split_row(l) }

types = headers.each_index.map { |i| detect_type(raw_rows.map { |r| r[i] }) }

puts "columns"
headers.each_with_index do |h, i|
  puts format("  %-10s %-8s %s", h, types[i], aligns[i])
end
puts

rows = raw_rows.map do |r|
  headers.each_with_index.to_h { |h, i| [h, coerce(r[i], types[i])] }
end

puts "parsed #{rows.size} rows"
puts

SORT_KEY = "Revenue"
sorted = rows.sort_by { |r| -r[SORT_KEY] }

def render(headers, aligns, rows, footer = nil)
  cells = rows.map { |r| headers.map { |h| r[h].to_s } }
  all = [headers] + cells + (footer ? [footer] : [])
  widths = headers.each_index.map { |i| all.map { |row| row[i].length }.max }

  out = []
  out << "| " + headers.each_with_index.map { |h, i| pad(h, widths[i], aligns[i]) }.join(" | ") + " |"
  out << "|" + widths.each_with_index.map do |w, i|
    case aligns[i]
    when :right then "-" * (w + 1) + ":"
    when :center then ":" + "-" * w + ":"
    else ":" + "-" * (w + 1)
    end
  end.join("|") + "|"
  cells.each do |row|
    out << "| " + row.each_with_index.map { |c, i| pad(c, widths[i], aligns[i]) }.join(" | ") + " |"
  end
  if footer
    out << "| " + footer.each_with_index.map { |c, i| pad(c, widths[i], aligns[i]) }.join(" | ") + " |"
  end
  out
end

total_units = rows.sum { |r| r["Units"] }
total_revenue = rows.sum { |r| r["Revenue"] }
mean_margin = rows.sum { |r| r["Margin"] } / rows.size
footer = ["TOTAL", total_units.to_s, format("%.2f", total_revenue), format("%.3f", mean_margin), ""]

puts "sorted by #{SORT_KEY} descending, with totals"
render(headers, aligns, sorted, footer).each { |l| puts "  #{l}" }
puts

puts "derived columns"
enriched = sorted.map do |r|
  r.merge(
    "PerUnit" => (r["Revenue"] / r["Units"]).round(2),
    "Share" => ((r["Revenue"] * 100) / total_revenue).round(1)
  )
end
enriched.each do |r|
  bar = "#" * (r["Share"] / 2).to_i
  puts format("  %-8s %8.2f per unit  %5.1f%% %s", r["Region"], r["PerUnit"], r["Share"], bar)
end
puts

puts "column summaries"
headers.each_with_index do |h, i|
  values = rows.map { |r| r[h] }
  case types[i]
  when :integer, :float
    puts format("  %-10s min %-9s max %-9s mean %s",
                h, values.min, values.max,
                types[i] == :integer ? (values.sum / values.size) : format("%.3f", values.sum / values.size))
  else
    puts format("  %-10s %d distinct, first %s, last %s",
                h, values.uniq.size, values.min, values.max)
  end
end
puts

puts "rows launched before 2024"
rows.select { |r| r["Launched"] < "2024-01-01" }
    .sort_by { |r| r["Launched"] }
    .each { |r| puts format("  %-8s %s  %d units", r["Region"], r["Launched"], r["Units"]) }
puts

puts "round trip"
reparsed = render(headers, aligns, rows).drop(2).map { |l| split_row(l) }
puts "  row count preserved:  #{reparsed.size == raw_rows.size}"
puts "  cell count preserved: #{reparsed.flatten.size == raw_rows.flatten.size}"
puts "  region column intact: #{reparsed.map(&:first) == raw_rows.map(&:first)}"
puts "  numbers survive a parse/render round trip: " \
     "#{reparsed.map { |r| r[1].to_i } == raw_rows.map { |r| r[1].to_i }}"
