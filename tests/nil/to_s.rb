# frozen_string_literal: true
# NilClass#to_s

p(nil.to_s)

a001 = nil
p a001.class
p a001.to_s

a003 = nil
c003 = a003.to_s
p c003.class
p c003

# nil.to_s is a frozen empty string in CRuby; Spinel does not implicitly freeze strings.
# WONTFIX: See docs/limitations.md - "By design — Frozen literals"
# p(nil.to_s.frozen?)
