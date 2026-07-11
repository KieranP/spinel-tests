# frozen_string_literal: true
# Symbol#swapcase
p(:hELLo.swapcase)
a024 = :hELLo; p(a024.swapcase)
a025 = :hELLo; c025 = (a025.swapcase); p c025
# non-ASCII case folding is correct; the diff is Symbol#inspect over-quoting the result
p(:cafÉ.swapcase)
c026 = (:cafÉ.swapcase); p c026
