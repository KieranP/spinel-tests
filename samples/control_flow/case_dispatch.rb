# frozen_string_literal: true
# case/when dispatch across Ranges, Classes, Regexps, and exact values.
# Inference: the === operator behind case/when must dispatch correctly for each
# pattern kind against mixed-type scrutinees.

def grade(score)
  case score
  when 90..100 then "A"
  when 80...90 then "B"
  when 70...80 then "C"
  when 0...70 then "F"
  else "invalid"
  end
end

def type_name(x)
  case x
  when Integer then "integer"
  when Float then "float"
  when String then "string"
  when Array then "array"
  when Symbol then "symbol"
  else "other"
  end
end

def classify_token(s)
  case s
  when /\A-?\d+\z/ then "number"
  when /\A[a-z]+\z/ then "word"
  when /\A\s+\z/ then "space"
  else "mixed"
  end
end

puts [95, 85, 72, 50, 150].map { |s| grade(s) }.inspect
puts [1, 2.5, "hi", [1], :sym, nil].map { |x| type_name(x) }.inspect
puts ["42", "hello", "  ", "a1b"].map { |s| classify_token(s) }.inspect

# case with no scrutinee (plain boolean when)
def sign(n)
  case
  when n > 0 then 1
  when n < 0 then -1
  else 0
  end
end
puts [-5, 0, 7].map { |n| sign(n) }.inspect
p grade(88)
p type_name(3.14)
