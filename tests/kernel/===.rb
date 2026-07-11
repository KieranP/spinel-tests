# frozen_string_literal: true
# Kernel#===
a010 = Object.new
p(a010 === a010)
c010 = (a010 === a010); p c010
p(a010 === Object.new)
p(Integer === 5)
p((1..10) === 5)
p(/a/ === "cat")
c011 = (String === "x"); p c011
class Widget010
  def initialize(n); @n = n; end
end
p(Widget010.new(1) === Widget010.new(1))
w010 = (Widget010.new(1) === 5); p w010
