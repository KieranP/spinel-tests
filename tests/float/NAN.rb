# frozen_string_literal: true
# Float::NAN
p(Float::NAN.class)
p(Float::NAN.nan?)
p(Float::NAN == Float::NAN)
v001 = Float::NAN; p v001.nan?
p(Float::NAN.to_s)
