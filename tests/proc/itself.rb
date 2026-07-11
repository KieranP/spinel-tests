# frozen_string_literal: true
# Proc#itself
a008 = ->(a) { a }; p(a008.itself.equal?(a008))
a009 = ->(a) { a }; v009 = a009.itself; p(v009.equal?(a009))
