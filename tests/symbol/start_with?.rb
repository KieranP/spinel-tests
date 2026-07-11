# frozen_string_literal: true
# Symbol#start_with?
p(:hello.start_with?("he"))
a020 = :hello; p(a020.start_with?("he"))
a021 = :hello; b021 = "he"; c021 = (a021.start_with?(b021)); p c021
p(:hello.start_with?(/he/))
v013 = (:hello.start_with?(/he/)); p v013
# multiple prefixes (any match) and a no-match
p(:hello.start_with?("x", "he"))
v014 = (:hello.start_with?("x", "he")); p v014
p(:hello.start_with?("no"))
v015 = (:hello.start_with?("no")); p v015
