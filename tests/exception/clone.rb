# frozen_string_literal: true
# Exception#clone
# clone preserves the class and message
p(RuntimeError.new("m").clone.class)
d001 = RuntimeError.new("m").clone; p d001.message
a002 = ArgumentError.new("bad"); b002 = a002.clone; p [b002.class, b002.message]

class EClone003 < StandardError
  attr_accessor :x
end
a003 = EClone003.new("m"); a003.x = 1
b003 = a003.clone; b003.x = 2
p [a003.x, b003.x]
e004 = RuntimeError.new("m"); p e004.equal?(e004.clone)
