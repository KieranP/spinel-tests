# frozen_string_literal: true
# Arithmetic expression tokenizer using StringScanner-free scan
def tokenize(expr)
  tokens = []
  expr.scan(/\s*(\d+\.\d+|\d+|[+\-*\/()]|[a-z]+)/) do |m|
    tokens << m[0]
  end
  tokens
end

exprs = [
  "3 + 4 * 2",
  "(x + 12) / y",
  "3.14 * radius * radius",
  "1+2+3+4",
]

exprs.each do |e|
  toks = tokenize(e)
  kinds = toks.map do |t|
    if t =~ /\A\d/
      "NUM"
    elsif t =~ /\A[a-z]/
      "ID"
    else
      "OP"
    end
  end
  puts "#{e}"
  puts "  tokens: #{toks.inspect}"
  puts "  kinds:  #{kinds.join(",")}"
end
