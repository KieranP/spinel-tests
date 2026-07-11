# frozen_string_literal: true
# Symbol#capitalize
p(:hELLO.capitalize)
a008 = :hELLO; p(a008.capitalize)
a009 = :hELLO; c009 = (a009.capitalize); p c009
# non-ASCII case folding is correct; the diff is Symbol#inspect over-quoting the result
p(:école.capitalize)
c010 = (:école.capitalize); p c010
