# frozen_string_literal: true
# Symbol#downcase
p(:HELLO.downcase)
a010 = :HELLO; p(a010.downcase)
a011 = :HELLO; c011 = (a011.downcase); p c011
# non-ASCII case folding is correct; the diff is Symbol#inspect over-quoting the result
p(:HÉLLO.downcase)
c012 = (:HÉLLO.downcase); p c012
