# frozen_string_literal: true
# Kernel#frozen?
p(Object.new.frozen?)
a004 = Object.new; p(a004.frozen?)
a005 = Object.new; v005 = a005.frozen?; p v005
p(1.frozen?)
p(:s.frozen?)
p(nil.frozen?)
p(true.frozen?)
p(1.5.frozen?)
p("lit".frozen?)
p(String.new("x").frozen?)
p((+"x").frozen?)
a006 = [1, 2]; p(a006.frozen?)
a007 = [1, 2].freeze; p(a007.frozen?)
a008 = { a: 1 }.freeze; v008 = a008.frozen?; p v008
