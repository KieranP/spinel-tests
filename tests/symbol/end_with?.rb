# frozen_string_literal: true
# Symbol#end_with?
p(:hello.end_with?("lo"))
a013 = :hello; p(a013.end_with?("lo"))
a014 = :hello; b014 = "lo"; c014 = (a014.end_with?(b014)); p c014
# multiple suffixes (any match) and a no-match
p(:hello.end_with?("x", "lo"))
v001 = (:hello.end_with?("x", "lo")); p v001
p(:hello.end_with?("no"))
v002 = (:hello.end_with?("no")); p v002
