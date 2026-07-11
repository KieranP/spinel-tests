# frozen_string_literal: true
# Symbol#=~
p(:hello =~ /llo/)
v004 = (:hello =~ /llo/); p v004
p(:hello =~ /z/)
v005 = (:hello =~ /z/); p v005
a001 = :hello; p(a001 =~ /llo/)
a002 = :hello; b002 = /llo/; c002 = (a002 =~ b002); p c002
