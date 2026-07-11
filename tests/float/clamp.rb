# frozen_string_literal: true
# Float#clamp
p(10.0.clamp(1.0, 5.0))
a008 = 10.0; p(a008.clamp(1.0, 5.0))
a009 = 10.0; b009 = 5.0; p(a009.clamp(1.0, b009))
a010 = 10.0; b010 = 5.0; c010 = (a010.clamp(1.0, b010)); p c010

# Float#clamp with a Range argument or non-Float bounds
p(5.5.clamp(1.0..3.0))
p(2.5.clamp(1..))
p(0.5.clamp(1, 3))

# Float#clamp with a nil bound (Ruby 2.7+: nil = open bound) fails to compile for
# EITHER a nil lower or a nil upper bound.
p(12.0.clamp(nil, 9.0))
p(5.0.clamp(1.0, nil))

# one-sided (beginless / endless) Range arguments
p((-3.0).clamp(..9.0))
a020 = -3.0; v020 = a020.clamp(..9.0); p v020
p(15.0.clamp(..9.0))
p(5.0.clamp(1.0..))
a021 = 5.0; v021 = a021.clamp(1.0..); p v021
