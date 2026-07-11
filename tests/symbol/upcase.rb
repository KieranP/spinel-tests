# frozen_string_literal: true
# Symbol#upcase
p(:hello.upcase)
a029 = :hello; p(a029.upcase)
a030 = :hello; c030 = (a030.upcase); p c030
# non-ASCII case folding is correct; the diff is Symbol#inspect over-quoting the result
p(:café.upcase)
c031 = (:café.upcase); p c031
