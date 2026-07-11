# frozen_string_literal: true
# Hash#default=
p(({}.default = 9))
a323 = {}; a323.default = 9; p(a323[:missing])
a324 = {}; a324.default = 9; c324 = (a324.default); p c324
a325 = {}; a325.default = 9; p(a325.default)
# a present key is unaffected by the default
a326e = { a: 1 }; a326e.default = 99; p(a326e[:a])
# a missing key returns the default
a327e = { a: 1 }; a327e.default = 99; p(a327e[:z])
a328e = { a: 1 }; a328e.default = 99; c328e = (a328e[:z]); p c328e
# resetting the default value
a329e = {}; a329e.default = 1; a329e.default = 2; p(a329e[:missing])
# String default value
a330e = {}; a330e.default = "none"; p(a330e[:x])
a331e = {}; a331e.default = "none"; c331e = (a331e[:x]); p c331e
# default= returns the assigned value
b332e = ({}.default = 42); p b332e
# on a non-empty hash, missing key still returns default
a333e = { a: 1, b: 2 }; a333e.default = 0; p(a333e[:c])

# overwrite the default twice, read after each
za920 = {}; za920.default = 1; p(za920[:m]); za920.default = 2; p(za920[:m])
# default explicitly set to nil
za921 = { a: 1 }; za921.default = nil; zc921 = (za921[:z]); p zc921
# the default= expression itself evaluates to the assigned value
p(({}.default = 7))
za922 = {}; zc922 = (za922.default = 7); p zc922
