# frozen_string_literal: true
# include Math

# Including the Math module lets its functions be called receiverless and exposes
# its constants; a user module includes fine, and the explicit-receiver forms work.
p(Math.sqrt(16))
p(Math::PI)

include Math
p(sqrt(16))
p(cos(0))
p(PI)
