# frozen_string_literal: true
# NilClass#<=>
p(nil <=> nil)
p(nil <=> 1)
n001 = nil; p(n001 <=> nil)
n002 = nil; n003 = nil; p(n002 <=> n003)
n004 = nil; v001 = (n004 <=> n004); p v001
