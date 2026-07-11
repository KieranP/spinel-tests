# frozen_string_literal: true
# Float#nan?
p((0.0 / 0).nan?)
a021 = (0.0 / 0); p(a021.nan?)
a022 = (0.0 / 0); c022 = (a022.nan?); p c022

# false for finite values and infinities
p(1.5.nan?)
p(0.0.nan?)
p(Float::INFINITY.nan?)
p(Float::NAN.nan?)
a023 = 1.5; c023 = a023.nan?; p c023

# every non-finite predicate over the three specials
p([Float::NAN, Float::INFINITY, -Float::INFINITY, -0.0].map { |f880| f880.nan? })
v881 = [Float::NAN, 1.0].map { |f881| f881.nan? }; p v881
