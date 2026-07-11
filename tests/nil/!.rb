# frozen_string_literal: true
# NilClass#!
p(!nil)
v001 = (!nil); p v001
n001 = nil; p(!n001)
v002 = (!n001); p v002
# double negation
p(!!nil)
n003 = nil; v003 = (!!n003); p v003
# ! result drives a condition
n004 = nil
p(if !n004 then "not-nil-is-true" else "no" end)
# nil.! is the same as the ! operator
p(nil.!)
n005 = nil; v005 = n005.!; p v005
