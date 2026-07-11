# frozen_string_literal: true
# Simple parser combinators returning [value, rest] pairs; closures capturing procs.
def lit(ch)
  ->(s) { s.start_with?(ch) ? [ch, s[ch.length..]] : nil }
end

def seq(*parsers)
  ->(s) {
    results = []
    rest = s
    parsers.each do |p|
      out = p.call(rest)
      return nil if out.nil?
      results << out[0]
      rest = out[1]
    end
    [results, rest]
  }
end

def alt(*parsers)
  ->(s) {
    parsers.each do |p|
      out = p.call(s)
      return out if out
    end
    nil
  }
end

def many(parser)
  ->(s) {
    results = []
    rest = s
    loop do
      out = parser.call(rest)
      break if out.nil?
      results << out[0]
      rest = out[1]
    end
    [results, rest]
  }
end

digit = alt(*("0".."9").map { |d| lit(d) })
number = many(digit)
puts "digits: #{number.call("123abc").inspect}"

ab = seq(lit("a"), lit("b"))
puts "seq ab: #{ab.call("abc").inspect}"
puts "seq fail: #{ab.call("axc").inspect}"

greeting = alt(lit("hi"), lit("hello"))
puts "alt: #{greeting.call("hello there").inspect}"
puts "count digits: #{number.call("9876").first.length}"
