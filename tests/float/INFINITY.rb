# frozen_string_literal: true
# Float::INFINITY
p(Float::INFINITY)
p(Float::INFINITY.class)
v001 = Float::INFINITY; p v001
p(Float::INFINITY.infinite?)
p((-Float::INFINITY).infinite?)
p(Float::INFINITY > Float::MAX)
p(Float::INFINITY.to_s)
