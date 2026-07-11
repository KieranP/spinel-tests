# frozen_string_literal: true
# A small tokenizer using String#scan with an alternation regex.
# Inference: scan returning an Array(String), classification via a case/when over
# Regexp matches, and building an Array of [type, value] pairs.

def tokenize(src)
  tokens = []
  src.scan(/\d+\.\d+|\d+|[a-zA-Z_]\w*|[-+*\/()]|\S/) do |tok|
    type =
      case tok
      when /\A\d+\.\d+\z/ then :float
      when /\A\d+\z/ then :int
      when /\A[a-zA-Z_]\w*\z/ then :ident
      when /\A[-+*\/]\z/ then :op
      when "(" then :lparen
      when ")" then :rparen
      else :unknown
      end
    tokens << [type, tok]
  end
  tokens
end

src = "x = 3 + 4.5 * (foo - 2)"
tokens = tokenize(src)
tokens.each { |type, val| puts "#{type}: #{val}" }

puts "token count: #{tokens.length}"
by_type = tokens.group_by(&:first).transform_values(&:length)
puts "by type: #{by_type.sort.inspect}"

idents = tokens.select { |type, _v| type == :ident }.map(&:last)
puts "identifiers: #{idents.inspect}"
p tokenize("12+34").map(&:last)
p "a1 b2 c3".scan(/[a-z]\d/)
