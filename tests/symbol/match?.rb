# frozen_string_literal: true
# Symbol#match?
p(:hello.match?(/l+/))
v001 = (:hello.match?(/l+/)); p v001
p(:hello.match?(/z/))
v002 = (:hello.match?(/z/)); p v002
p(:hello.match?(/L+/i))
v003 = (:hello.match?(/L+/i)); p v003
p(:hello.match?("ell"))
v004 = (:hello.match?("ell")); p v004
a001 = :hello; p(a001.match?(/l+/))
a002 = :hello; b002 = /l+/; c002 = (a002.match?(b002)); p c002
