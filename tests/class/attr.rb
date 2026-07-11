# frozen_string_literal: true
class C001
  attr :x
  def initialize; @x = 5; end
end
class C002
  attr :a, :b
  def initialize; @a = 1; @b = 2; end
end

# Module#attr (declarative, in class body; alias of attr_reader)
o001 = C001.new
o002 = C002.new
# `attr` is a no-op in Spinel: the reader is never defined, so calling it is a
# compile-time NoMethodError that aborts the whole file (attr_reader works).
p(o001.x)
v001 = o001.x; p v001
p(o002.a)
p(o002.b)
v002 = o002.b; p v002
