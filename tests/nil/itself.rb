# frozen_string_literal: true
# NilClass#itself
a008 = nil; p(a008.itself.equal?(a008))
a009 = nil; v009 = a009.itself; p(v009.equal?(a009))
