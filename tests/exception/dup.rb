# frozen_string_literal: true
# Exception#dup
# dup preserves the class and message
p(RuntimeError.new("m").dup.class)
d001 = RuntimeError.new("m").dup; p d001.message
a002 = ArgumentError.new("bad"); b002 = a002.dup; p [b002.class, b002.message]

class EDup003 < StandardError
  attr_accessor :x
end
a003 = EDup003.new("m"); a003.x = 1
b003 = a003.dup; b003.x = 2
p [a003.x, b003.x]
e004 = RuntimeError.new("m"); p e004.equal?(e004.dup)
