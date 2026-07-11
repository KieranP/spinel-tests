# frozen_string_literal: true
# Symbol#slice
p(:hello.slice(1))
v001 = (:hello.slice(1)); p v001
p(:hello.slice(-1))
v002 = (:hello.slice(-1)); p v002
p(:hello.slice(1, 3))
v003 = (:hello.slice(1, 3)); p v003
p(:hello.slice(2..4))
v004 = (:hello.slice(2..4)); p v004
p(:hello.slice(/l+/))
v005 = (:hello.slice(/l+/)); p v005
a001 = :hello; p(a001.slice(1, 3))
a002 = :hello; b002 = 1; c002 = (a002.slice(b002, 3)); p c002
# regexp with a numeric capture-group index
p(:hello.slice(/(l+)(o)/, 2))
v006 = (:hello.slice(/(l+)(o)/, 2)); p v006
# zero-length and out-of-range slices
p(:hello.slice(1, 0))
v007 = (:hello.slice(1, 0)); p v007
p(:hello.slice(10))
v008 = (:hello.slice(10)); p v008
# string-argument slice
p(:hello.slice("ell"))
v009 = (:hello.slice("ell")); p v009
p(:hello.slice(/(?<y>l+)/, :y))
v010 = (:hello.slice(/(?<y>l+)/, :y)); p v010
