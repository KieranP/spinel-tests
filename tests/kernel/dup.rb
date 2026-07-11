# frozen_string_literal: true
# Kernel#dup
p(Object.new.dup.class)
a037 = Object.new; b037 = a037.dup; p(b037.class)
a038 = Object.new; v038 = a038.dup; p(v038 == a038)
p(1.dup)
p(:s.dup)
p(nil.dup)
p("ab".dup.frozen?)
p([1, 2].dup)
p({ a: 1 }.dup)
p([1, 2].freeze.dup.frozen?)
v039 = "ab".dup; p v039
class Dup040; attr_accessor :x; def initialize; @x = [1]; end; end
a040 = Dup040.new; b040 = a040.dup; b040.x << 2
p a040.x
p b040.x
