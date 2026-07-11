# frozen_string_literal: true
# Kernel#<=>
a001 = Object.new
b001 = Object.new
p(a001 <=> a001)
c001 = (a001 <=> a001); p c001
p(a001 <=> b001)
c002 = (a001 <=> b001); p c002
p(1 <=> 1)
p("x" <=> "x")
c003 = (5 <=> 3); p c003
