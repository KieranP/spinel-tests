# frozen_string_literal: true
# String#itself
a008 = "abc"; p(a008.itself.equal?(a008))
a009 = "abc"; v009 = a009.itself; p(v009.equal?(a009))
