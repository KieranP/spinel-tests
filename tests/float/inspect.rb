# frozen_string_literal: true
# Float#inspect
p(1.5.inspect)
a033 = 1.5; p(a033.inspect)
a034 = 1.5; v034 = a034.inspect; p v034

# matches #to_s for special and edge values
p(2.0.inspect)
p((-0.0).inspect)
p(1.0e20.inspect)
p(Float::INFINITY.inspect)
p((-Float::INFINITY).inspect)
p(Float::NAN.inspect)
