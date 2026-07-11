# frozen_string_literal: true
# A billing statement rendered entirely through format/sprintf: every column exercises
# a different conversion and flag combination, and the same values are also formatted
# by argument index and by name so the three routes must agree character for character.
# Inference: one format call site fed Integer, Float, Rational, String and nil in turn,
# a width supplied as a `*` argument, and a Hash driving %<name>s / %{name} references.

LINES = [
  { sku: "AX-1",   desc: "widget",            qty: 3,   unit: 4.5,     tax: 0.2 },
  { sku: "BX-22",  desc: "gadget deluxe",     qty: 12,  unit: 19.995,  tax: 0.05 },
  { sku: "CX-333", desc: "sprocket",          qty: 1,   unit: 1000.0,  tax: 0.0 },
  { sku: "DX-4",   desc: "a very long name",  qty: 250, unit: 0.014,   tax: 0.175 },
  { sku: "EX-5",   desc: "refund",            qty: -2,  unit: 7.25,    tax: 0.2 }
].freeze

puts "== the statement =="
HEADER = format("%-8s %-18s %5s %10s %8s %12s", "SKU", "DESCRIPTION", "QTY", "UNIT", "TAX", "TOTAL")
puts HEADER
puts "-" * HEADER.length
LINES.each do |line|
  net = line[:qty] * line[:unit]
  total = net * (1 + line[:tax])
  puts format("%-8s %-18s %5d %10.3f %7.1f%% %12.2f",
              line[:sku], line[:desc], line[:qty], line[:unit], line[:tax] * 100, total)
end
grand = LINES.sum { |l| l[:qty] * l[:unit] * (1 + l[:tax]) }
puts "-" * HEADER.length
puts format("%-8s %-18s %5s %10s %8s %12.2f", "", "GRAND TOTAL", "", "", "", grand)

puts
puts "== integer conversions =="
[0, 7, 42, 255, 4096, -1, -255].each do |n|
  puts format("  %6d | %+6d | %06d | % d | %#8x | %#8o | %#12b | %8s",
              n, n, n, n, n, n, n, n.to_s)
end

puts
puts "== float conversions =="
[0.0, 1.5, -1.5, 3.14159265, 1234.5678, 0.000123, 1.0e10].each do |f|
  puts format("  %12.4f | %14.4e | %12g | %+.2f | %-12.3f|", f, f, f, f, f)
end

puts
puts "== rounding at the boundary =="
[0.5, 1.5, 2.5, 2.675, -0.5, -1.5].each do |f|
  puts format("  %-6s %%.0f=%s  %%.2f=%s  round=%s", f.to_s, format("%.0f", f), format("%.2f", f), f.round.to_s)
end

puts
puts "== widths and precision on strings =="
%w[a abc abcdefghij].each do |s|
  puts format("  [%s] [%10s] [%-10s] [%.2s] [%10.3s] [%-10.3s]", s, s, s, s, s, s)
end

puts
puts "== a width supplied as an argument =="
[4, 8, 12].each do |w|
  puts format("  width %2d -> [%*d] [%-*s]", w, w, 42, w, "left")
end

puts
puts "== argument index and named references =="
puts format("  %1$s-%2$s-%1$s", "a", "b")
puts format("  %2$05.1f before %1$d", 7, 3.14159)
row = { sku: "AX-1", qty: 3, unit: 4.5 }
puts format("  %<sku>-8s qty=%<qty>03d unit=%<unit>8.2f", row)
puts format("  %{sku} x%{qty} @ %{unit}", row)

puts
puts "== %c, %%, and %s on assorted objects =="
puts format("  char from int: %c  char from str: %c", 65, "Z")
puts format("  literal percent: 100%%")
[nil, true, :sym, [1, 2], { a: 1 }, 3r, 1.5].each do |obj|
  puts format("  %-12s -> %%s=%-12s %%p=%s", obj.class.name, obj.to_s, format("%p", obj))
end

puts
puts "== Rational and Integer division formatted side by side =="
[[22, 7], [1, 3], [-5, 4], [10, 5]].each do |num, den|
  r = Rational(num, den)
  puts format("  %3d/%-3d  rational=%-8s float=%9.6f  intdiv=%3d  mod=%3d",
              num, den, r.to_s, r.to_f, num / den, num % den)
end

puts
puts "== String#% is the same call =="
tmpl = "%-6s|%5d|%8.3f"
args = ["ab", 42, 3.14159]
via_format = format(tmpl, *args)
via_percent = tmpl % args
puts "  format:  #{via_format.inspect}"
puts "  String#%: #{via_percent.inspect}"
puts "  identical: #{via_format == via_percent}"
puts "  single arg without array: #{"%05.2f" % 1.5}"

puts
puts "== error paths =="
[["%d with a String", -> { format("%d", "abc") }],
 ["%d with nil", -> { format("%d", nil) }],
 ["too few arguments", -> { format("%s %s", "only") }],
 ["unknown conversion", -> { format("%q", 1) }],
 ["malformed name", -> { format("%<missing>s", { a: 1 }) }]].each do |label, thunk|
  outcome = (thunk.call.inspect rescue "#{$!.class}")
  puts format("  %-20s -> %s", label, outcome)
end
