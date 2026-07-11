# frozen_string_literal: true
# Float#nil?
p(1.5.nil?)
a006 = 1.5; p(a006.nil?)
a007 = 1.5; v007 = a007.nil?; p v007

# always false, even for special values
p(0.0.nil?)
p(Float::INFINITY.nil?)
p(Float::NAN.nil?)
a008 = Float::NAN; v008 = a008.nil?; p v008
