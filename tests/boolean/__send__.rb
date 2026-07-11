# frozen_string_literal: true
# TrueClass#__send__
p(true.__send__(:to_s))
p(true.__send__(:&, false))
p(true.__send__(:|, false))
p(true.__send__(:!))

a001 = true; p(a001.__send__(:class))
a002 = true; b002 = false; r002 = a002.__send__(:^, b002); p r002

# FalseClass#__send__
p(false.__send__(:to_s))
p(false.__send__(:|, true))
p(false.__send__(:!))

a003 = false; r003 = a003.__send__(:&, true); p r003
a004 = false; p(a004.__send__(:class))
