# frozen_string_literal: true
# Regexp#itself
a008 = /ab/; p(a008.itself.equal?(a008))
a009 = /ab/; v009 = a009.itself; p(v009.equal?(a009))
