# frozen_string_literal: true
# TrueClass#itself
a008 = true; p(a008.itself.equal?(a008))
a009 = true; v009 = a009.itself; p(v009.equal?(a009))

# FalseClass#itself
a053 = false; p(a053.itself.equal?(a053))
a054 = false; v054 = a054.itself; p(v054.equal?(a054))
