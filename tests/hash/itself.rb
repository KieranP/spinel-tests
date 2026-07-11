# frozen_string_literal: true
# Hash#itself
a008 = { a: 1 }; p(a008.itself.equal?(a008))
a009 = { a: 1 }; v009 = a009.itself; p(v009.equal?(a009))
