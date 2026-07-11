# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#eql?
p(5.eql?(5))
v017 = 5.eql?(5); p v017
p(5.eql?(5.0))
v018 = 5.eql?(5.0); p v018
p("x".eql?("x"))
v019 = "x".eql?("x"); p v019
p(1.0.eql?(1.0))
v020 = 1.0.eql?(1.0); p v020
p(:a.eql?(:a))
p([1, 2].eql?([1, 2]))
v021 = [1, 2].eql?([1, 2]); p v021

# a user class defining == still gets identity eql? by default
class Coin195
  attr_reader :v
  def initialize(v); @v = v; end
  def ==(other); other.is_a?(Coin195) && v == other.v; end
end
a022 = Coin195.new(1); b022 = Coin195.new(1)
p(a022 == b022)
p a022.eql?(b022)
v022 = a022.eql?(b022); p v022
p a022.eql?(a022)
v023 = a022.eql?(a022); p v023

# a user class that aliases eql? to a value-based == also gets value uniq/include?
class Money196
  attr_reader :c
  def initialize(c); @c = c; end
  def ==(o); o.is_a?(Money196) && c == o.c; end
  alias eql? ==
  def hash; c.hash; end
  def inspect; "M#{c}"; end
end
a030 = Money196.new(5); b030 = Money196.new(5)
p(a030.eql?(b030))
v030 = a030.eql?(b030); p v030
p(a030.eql?(Money196.new(6)))
p([a030, b030].uniq)
v031 = [a030, b030].uniq; p v031.size
p([a030].include?(b030))
v032 = [a030].include?(b030); p v032
p([a030, b030].index(b030))
