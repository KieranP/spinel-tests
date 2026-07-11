# frozen_string_literal: true
# A tiny spreadsheet: cells hold literals or formulas referencing other cells.
# Formulas are resolved in dependency order, with cycle detection, then the
# grid is printed with column totals.
#
# Supported formula syntax: =A1+B2, =SUM(A1:A4), =AVG(A1:A4), numbers, * / - +

class Sheet
  CELL_RE = /\A([A-Z])(\d+)\z/
  RANGE_RE = /\A([A-Z])(\d+):([A-Z])(\d+)\z/

  def initialize
    @raw = {}
    @value = {}
  end

  def []=(ref, src)
    @raw[ref] = src.to_s
  end

  def [](ref)
    @value[ref]
  end

  def refs
    @raw.keys
  end

  def formula?(ref)
    @raw[ref].start_with?("=")
  end

  # Which cells does `ref` directly depend on?
  def deps(ref)
    src = @raw[ref]
    return [] unless src.start_with?("=")
    out = []
    tokens(src[1..]).each do |tok|
      if tok =~ RANGE_RE
        out.concat(expand_range(tok))
      elsif tok =~ CELL_RE
        out << tok
      end
    end
    out.uniq
  end

  def expand_range(tok)
    md = RANGE_RE.match(tok)
    c1 = md[1]
    r1 = md[2].to_i
    c2 = md[3]
    r2 = md[4].to_i
    cols = (c1..c2).to_a
    rows = (r1..r2).to_a
    out = []
    cols.each { |c| rows.each { |r| out << "#{c}#{r}" } }
    out
  end

  def tokens(expr)
    expr.scan(/[A-Z]+\d+:[A-Z]+\d+|[A-Z]+\d+|\d+\.?\d*|[-+*\/()]|SUM|AVG/)
  end

  def evaluate
    order = topo_order
    order.each { |ref| @value[ref] = compute(ref) }
    order
  end

  def topo_order
    state = {}
    order = []
    refs.each { |r| visit(r, state, order) }
    order
  end

  def visit(ref, state, order)
    st = state[ref]
    return if st == :done
    raise "cycle through #{ref}" if st == :active
    state[ref] = :active
    deps(ref).each { |d| visit(d, state, order) if @raw.key?(d) }
    state[ref] = :done
    order << ref
  end

  def compute(ref)
    src = @raw[ref]
    return src.to_f unless src.start_with?("=")
    eval_expr(tokens(src[1..]))
  end

  # Shunting-yard into RPN, then evaluate. Handles SUM/AVG over a range.
  def eval_expr(toks)
    out = []
    ops = []
    prec = { "+" => 1, "-" => 1, "*" => 2, "/" => 2 }

    i = 0
    while i < toks.length
      tok = toks[i]
      if tok == "SUM" || tok == "AVG"
        rng = toks[i + 2]
        vals = expand_range(rng).map { |c| @value[c] || 0.0 }
        total = vals.reduce(0.0) { |s, v| s + v }
        out << (tok == "SUM" ? total : total / vals.length)
        i += 4
        next
      elsif tok =~ RANGE_RE
        out << 0.0
      elsif tok =~ CELL_RE
        out << (@value[tok] || 0.0)
      elsif tok =~ /\A\d/
        out << tok.to_f
      elsif tok == "("
        ops << tok
      elsif tok == ")"
        out << ops.pop while ops.last && ops.last != "("
        ops.pop
      else
        while ops.last && ops.last != "(" && prec[ops.last] >= prec[tok]
          out << ops.pop
        end
        ops << tok
      end
      i += 1
    end
    out << ops.pop while ops.last

    stack = []
    out.each do |t|
      if t.is_a?(Float)
        stack << t
      else
        b = stack.pop
        a = stack.pop
        stack << case t
                 when "+" then a + b
                 when "-" then a - b
                 when "*" then a * b
                 when "/" then b.zero? ? 0.0 : a / b
                 else 0.0
                 end
      end
    end
    stack.last || 0.0
  end
end

sheet = Sheet.new
# Quarterly units sold
sheet["A1"] = "120"
sheet["A2"] = "135"
sheet["A3"] = "98"
sheet["A4"] = "142"
# Unit price
sheet["B1"] = "9.5"
sheet["B2"] = "9.5"
sheet["B3"] = "10.25"
sheet["B4"] = "10.25"
# Revenue per quarter
sheet["C1"] = "=A1*B1"
sheet["C2"] = "=A2*B2"
sheet["C3"] = "=A3*B3"
sheet["C4"] = "=A4*B4"
# Aggregates
sheet["D1"] = "=SUM(C1:C4)"
sheet["D2"] = "=AVG(C1:C4)"
sheet["D3"] = "=D1/4"
sheet["D4"] = "=(A1+A2+A3+A4)*2"

order = sheet.evaluate

puts "evaluation order:"
puts "  " + order.join(" ")
puts

puts "grid:"
puts "     " + %w[A B C D].map { |c| c.rjust(10) }.join
(1..4).each do |row|
  cells = %w[A B C D].map do |col|
    v = sheet["#{col}#{row}"]
    v.nil? ? "".rjust(10) : format("%10.2f", v)
  end
  puts format("%-4d %s", row, cells.join)
end
puts

puts "formulas:"
sheet.refs.select { |r| sheet.formula?(r) }.sort.each do |r|
  puts format("  %-4s %-16s deps=%s", r, sheet.instance_variable_get(:@raw)[r], sheet.deps(r).inspect)
end
puts

puts "column sums:"
%w[A B C].each do |col|
  vals = (1..4).map { |r| sheet["#{col}#{r}"] }
  total = vals.reduce(0.0) { |s, v| s + v }
  puts format("  %s  %10.2f   mean %8.3f", col, total, total / vals.length)
end
puts

puts "revenue share by quarter:"
grand = sheet["D1"]
(1..4).each do |r|
  v = sheet["C#{r}"]
  pct = (v / grand) * 100.0
  bar = "#" * (pct / 2).round
  puts format("  Q%d %8.2f %5.1f%% %s", r, v, pct, bar)
end
puts

puts "cycle detection:"
bad = Sheet.new
bad["A1"] = "=B1+1"
bad["B1"] = "=A1+1"
begin
  bad.evaluate
  puts "  no cycle reported"
rescue RuntimeError => e
  puts "  #{e.message}"
end
