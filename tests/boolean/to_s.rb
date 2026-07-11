# frozen_string_literal: true
# TrueClass#to_s

p(true.to_s)

t001 = true
p t001.class
p t001.to_s

t002 = true
r002 = t002.to_s
p r002.class
p r002

# FalseClass#to_s

p(false.to_s)

f001 = false
p f001.class
p f001.to_s

f002 = false
r003 = f002.to_s
p r003.class
p r003

# More forms
p(true.to_s * 2)
p("%s" % true)
p(format("<%s>", false))

# WONTFIX: See docs/limitations.md - "By design — Frozen literals"
# p(true.to_s.frozen?)     # Ruby true; Spinel false
# WONTFIX: See docs/limitations.md - "Fundamental limits — Mixed / non-UTF-8 encodings"
# p(true.to_s.encoding)    # Ruby #<Encoding:US-ASCII>; Spinel #<Encoding:UTF-8>
