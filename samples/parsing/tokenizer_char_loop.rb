# frozen_string_literal: true
# A small arithmetic tokenizer + evaluator with StringScanner-like manual scan.
def tokenize(src)
  tokens = []
  i = 0
  while i < src.length
    c = src[i]
    if c =~ /\s/
      i += 1
    elsif c =~ /\d/
      num = +""
      while i < src.length && src[i] =~ /\d/
        num << src[i]
        i += 1
      end
      tokens << [:num, num.to_i]
    elsif "+-*/()".include?(c)
      tokens << [:op, c]
      i += 1
    else
      raise "bad char: #{c}"
    end
  end
  tokens
end

toks = tokenize("12 + 3 * (4 - 1)")
toks.each { |type, val| puts "#{type}: #{val}" }

nums = toks.select { |t, _| t == :num }.map { |_, v| v }
puts "numbers: #{nums.inspect}"
puts "sum: #{nums.sum}"
ops = toks.count { |t, _| t == :op }
puts "operators: #{ops}"
