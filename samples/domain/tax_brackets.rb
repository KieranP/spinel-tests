# frozen_string_literal: true
# Progressive income tax calculator. Bands are held as Rationals so the marginal
# arithmetic is exact, and the payable amount is rounded to whole cents only at
# the end. Also produces an effective-rate table and a marginal-relief check.

BANDS = [
  # [upper bound (nil = unbounded), rate]
  [12_570, Rational(0, 100)],
  [50_270, Rational(20, 100)],
  [125_140, Rational(40, 100)],
  [nil, Rational(45, 100)]
].freeze

PERSONAL_ALLOWANCE_TAPER_FROM = 100_000
TAPER_RATE = Rational(1, 2)

def allowance_for(income)
  base = BANDS.first.first
  return base if income <= PERSONAL_ALLOWANCE_TAPER_FROM

  reduction = ((income - PERSONAL_ALLOWANCE_TAPER_FROM) * TAPER_RATE).floor
  [base - reduction, 0].max
end

def bands_for(income)
  allowance = allowance_for(income)
  shift = BANDS.first.first - allowance
  BANDS.map.with_index do |(upper, rate), i|
    adjusted = if i.zero?
                 allowance
               elsif upper.nil?
                 nil
               else
                 upper - shift
               end
    [adjusted, rate]
  end
end

def tax_slices(income)
  lower = 0
  bands_for(income).filter_map do |upper, rate|
    top = upper.nil? ? income : [upper, income].min
    width = top - lower
    lower = top
    next nil if width <= 0

    { from: top - width, to: top, width: width, rate: rate, tax: width * rate }
  end
end

def tax_due(income) = tax_slices(income).sum { |s| s[:tax] }

def money(rational)
  cents = (rational * 100).round
  format("%d.%02d", cents / 100, cents % 100)
end

def pct(rational) = format("%.2f%%", (rational * 100).to_f)

INCOMES = [10_000, 12_570, 30_000, 50_270, 60_000, 100_000, 110_000, 125_140, 180_000].freeze

puts "bands"
lower = 0
BANDS.each do |upper, rate|
  label = upper.nil? ? "#{lower}+" : "#{lower}-#{upper}"
  puts format("  %-16s %s", label, pct(rate))
  lower = upper unless upper.nil?
end
puts format("  allowance tapers above %d at %s per pound", PERSONAL_ALLOWANCE_TAPER_FROM, TAPER_RATE)
puts

puts "liability"
puts format("  %-9s %-9s %-11s %-9s %s", "income", "allowance", "tax", "effective", "marginal")
INCOMES.each do |income|
  due = tax_due(income)
  effective = income.zero? ? Rational(0) : due / income
  marginal = tax_slices(income).last&.fetch(:rate) || Rational(0)
  puts format("  %-9d %-9d %-11s %-9s %s",
              income, allowance_for(income), money(due), pct(effective), pct(marginal))
end
puts

puts "slice breakdown at 110000"
tax_slices(110_000).each do |s|
  puts format("  %7d-%-7d %8d @ %-7s = %s",
              s[:from], s[:to], s[:width], pct(s[:rate]), money(s[:tax]))
end
puts format("  %-26s %8s", "total", money(tax_due(110_000)))
puts

puts "marginal relief around the taper"
[99_000, 100_000, 101_000, 110_000, 125_000, 125_140].each_cons(2) do |a, b|
  extra_income = b - a
  extra_tax = tax_due(b) - tax_due(a)
  rate = Rational(extra_tax, extra_income)
  flag = rate > Rational(45, 100) ? "  <- above top rate" : ""
  puts format("  %6d -> %-6d  +%-6d income, +%-9s tax, %s%s",
              a, b, extra_income, money(extra_tax), pct(rate), flag)
end
puts

puts "take-home comparison"
[30_000, 60_000, 110_000].each do |income|
  due = tax_due(income)
  net = income - due
  bar_len = (net * 40 / 110_000).to_i
  puts format("  %-7d net %-10s %s", income, money(net), "#" * bar_len)
end
puts

puts "exactness"
sample = 110_000
slices = tax_slices(sample)
recomposed = slices.sum { |s| s[:width] }
puts "  slices cover the whole income: #{recomposed == sample}"
puts "  sum of slice taxes is exact:   #{slices.sum { |s| s[:tax] } == tax_due(sample)}"
puts "  tax as a Rational:             #{tax_due(sample)}"
puts "  same value as a Float:         #{tax_due(sample).to_f}"
