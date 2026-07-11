# frozen_string_literal: true
# Object#!=
p(5 != 6)
v140 = (5 != 6); p v140
p(5 != 5)
v141 = (5 != 5); p v141
p("a" != "b")
v142 = ("a" != "b"); p v142
a140 = 5; b140 = 6; p(a140 != b140)
p(nil != nil)
p(nil != 5)
p([1, 2] != [1, 3])
p(:a != :b)

# a user-defined #!= should be dispatched by the != operator
class Ne195
  def initialize(v); @v = v; end
  def v; @v; end
  def ==(o); v == o.v; end
  def !=(o); "custom-ne"; end
end
p(Ne195.new(1) != Ne195.new(1))
v143 = (Ne195.new(1) != Ne195.new(2)); p v143
# == itself is dispatched
p(Ne195.new(1) == Ne195.new(1))
v144 = (Ne195.new(1) == Ne195.new(2)); p v144

# without a custom #!=, != is the negation of the user's ==
class Plain195
  def initialize(v); @v = v; end
  def v; @v; end
  def ==(o); v == o.v; end
end
p(Plain195.new(1) != Plain195.new(1))
v145 = (Plain195.new(1) != Plain195.new(2)); p v145
