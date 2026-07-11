# frozen_string_literal: true
# TrueClass#inspect

p(true.inspect)

t001 = true
p t001.class
p t001.inspect

t002 = true
r002 = t002.inspect
p r002.class
p r002

# FalseClass#inspect

p(false.inspect)

f001 = false
p f001.class
p f001.inspect

f002 = false
r003 = f002.inspect
p r003.class
p r003

# WONTFIX: See docs/limitations.md - "By design — Frozen literals"
# p(true.inspect.frozen?)    # Ruby true; Spinel false
