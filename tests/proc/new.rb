# frozen_string_literal: true
# Proc.new
p(Proc.new { |x| x * 2 }.call(5))
a001 = Proc.new { |x| x * 2 }; p(a001.call(5))
b001 = Proc.new { |x| x * 2 }; v001 = b001.call(5); p(v001)
p(Proc.new { |x| x * 2 }.lambda?)
c001 = Proc.new { |x| x * 2 }; p(c001.lambda?)
