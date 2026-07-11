# frozen_string_literal: true
# TrueClass#<=>
p(true <=> true)
a001 = true; p(a001 <=> true)
a002 = true; b002 = true; v002 = (a002 <=> b002); p v002
p(true <=> false)
a003 = true; v003 = (true <=> false); p v003
p(true <=> nil)

# FalseClass#<=>
p(false <=> false)
a004 = false; p(a004 <=> false)
a005 = false; b005 = false; v005 = (a005 <=> b005); p v005
p(false <=> true)
p(false <=> nil)
