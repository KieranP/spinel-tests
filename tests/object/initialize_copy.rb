# frozen_string_literal: true
class Box197
  attr_accessor :items, :tag
  def initialize(t); @tag = t; @items = [1, 2]; end
  def initialize_copy(src); super; @items = src.items.dup; end
end

# Object#initialize_copy
# dup runs it, so the copy gets its own array while the other ivars are carried over
o001 = Box197.new("a"); c001 = o001.dup; c001.items.push(3)
p o001.items
p c001.items
p c001.tag
v001 = Box197.new("b").dup; p v001.tag

# clone runs it too
o002 = Box197.new("c"); c002 = o002.clone; c002.items.push(9)
p o002.items
p c002.items
v002 = Box197.new("d").clone; p v002.items

# a hand-written initialize_copy that does NOT call super still decides the copy
class Cnt197
  attr_reader :n
  def initialize; @n = 0; end
  def initialize_copy(src); @n = src.n + 100; end
end
p(Cnt197.new.dup.n)
v003 = Cnt197.new.dup; p v003.n
p(Cnt197.new.clone.n)
v004 = Cnt197.new.clone; p v004.n

# a class's own initialize_copy is callable directly
o003 = Box197.new("f"); o003.send(:initialize_copy, Box197.new("g")); p o003.items
v005 = Box197.new("h"); v005.send(:initialize_copy, Box197.new("i")); p v005.items
p(Box197.new("e").respond_to?(:initialize_copy, true))

# the DEFAULT Object#initialize_copy, on a class that does not define its own
class Plain197
  attr_accessor :v
  def initialize(v); @v = v; end
end
o004 = Plain197.new(1); o004.send(:initialize_copy, Plain197.new(5)); p o004.v
p(Plain197.new(1).respond_to?(:initialize_copy, true))
v005 = Plain197.private_method_defined?(:initialize_copy); p v005

# CRuby makes a user-defined initialize_copy private automatically
v006 = Box197.private_method_defined?(:initialize_copy); p v006
v007 = Box197.public_method_defined?(:initialize_copy); p v007
